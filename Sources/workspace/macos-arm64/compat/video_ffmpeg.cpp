// Native implementation of common/video/ivideoplayer.h for offline Panorama.
// Decode/resampling follows FFmpeg's demux_decode.c and libswresample API.
// The original video dependency has no implementation in the supplied source.
#include "tier0/platform.h"
#define LIBVIDEO_DLL_EXPORT
#include "video/ivideoplayer.h"
extern "C" {
#include <libavformat/avformat.h>
#include <libavcodec/avcodec.h>
#include <libavutil/imgutils.h>
#include <libswscale/swscale.h>
#include <libswresample/swresample.h>
}
#include <atomic>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <chrono>
#include <vector>
#include <string>
#include <algorithm>
#include <cstring>
#include <cerrno>
#include <climits>

namespace {
using Clock = std::chrono::steady_clock;
class Player final : public IVideoPlayer {
    IVideoPlayerEventCallback *event;
    IVideoPlayerVideoCallback *video;
    IVideoPlayerAudioCallback *audio;
    std::mutex mutex;
    std::condition_variable wake;
    std::thread worker;
    std::atomic<bool> quit{false}, repeat{false}, buffering{false}, hasAudio{false};
    std::atomic<int> width{0}, height{0}, maxHeight{0};
    std::atomic<uint32> duration{0}, current{0};
    std::atomic<float> speed{1};
    std::atomic<EVideoPlayerPlaybackState> state{k_EVideoPlayerPlaybackStateStop};
    std::atomic<EVideoPlayerPlaybackError> error{k_EVideoPlayerPlaybackErrorNone};
    std::string loadPath;
    std::vector<byte> loadBytes;
    uint64_t generation = 0, handledGeneration = 0;
    int64_t seekMS = -1;
    std::vector<EVideoPlayerEvent> pendingEvents;
    AVFormatContext *format = nullptr;
    AVCodecContext *vcodec = nullptr, *acodec = nullptr;
    AVIOContext *io = nullptr;
    SwsContext *scale = nullptr;
    SwrContext *resample = nullptr;
    AVFrame *frame = nullptr, *yuv = nullptr;
    AVPacket *packet = nullptr;
    std::vector<byte> input, pcm;
    int64_t inputPosition = 0;
    int vindex = -1, aindex = -1;
    int audioRate = 0, audioChannels = 0;
    bool audioOpened = false, eof = false;
    Clock::time_point wallStart;
    int64_t mediaStart = 0, discardBefore = 0;
    void Event(EVideoPlayerEvent value) {
        std::lock_guard<std::mutex> lock(mutex); pendingEvents.push_back(value);
    }
    bool Cancelled(uint64_t active) {
        std::lock_guard<std::mutex> lock(mutex);
        return quit || active != generation || seekMS >= 0;
    }
    static int Interrupt(void *opaque) { return static_cast<Player*>(opaque)->quit ? 1 : 0; }
    static int Read(void *opaque, uint8_t *dest, int size) {
        auto p = static_cast<Player*>(opaque);
        int n = static_cast<int>(std::min<int64_t>(size,p->input.size()-p->inputPosition));
        if (n<=0) return AVERROR_EOF;
        std::memcpy(dest,p->input.data()+p->inputPosition,n); p->inputPosition+=n; return n;
    }
    static int64_t SeekInput(void *opaque, int64_t offset, int mode) {
        auto p = static_cast<Player*>(opaque);
        if (mode == AVSEEK_SIZE) return p->input.size();
        mode &= ~AVSEEK_FORCE;
        int64_t target = offset;
        if (mode == SEEK_CUR) target += p->inputPosition;
        else if (mode == SEEK_END) target += p->input.size();
        else if (mode != SEEK_SET) return AVERROR(EINVAL);
        if (target<0 || target>static_cast<int64_t>(p->input.size())) return AVERROR(EINVAL);
        return p->inputPosition = target;
    }
    void Close() {
        if (audioOpened) { audio->FreeAudioOutput(); audioOpened=false; }
        swr_free(&resample); sws_freeContext(scale); scale=nullptr;
        avcodec_free_context(&vcodec); avcodec_free_context(&acodec);
        avformat_close_input(&format);
        if (io) { av_freep(&io->buffer); avio_context_free(&io); }
        input.clear(); width=height=0; duration=current=0; hasAudio=false;
        vindex=aindex=-1; eof=false;
    }
    bool OpenCodec(AVMediaType type, int &index, AVCodecContext *&codec) {
        const AVCodec *decoder=nullptr;
        index=av_find_best_stream(format,type,-1,-1,&decoder,0);
        if (index<0) return false;
        codec=avcodec_alloc_context3(decoder);
        if (!codec || avcodec_parameters_to_context(codec,format->streams[index]->codecpar)<0) return false;
        codec->thread_count=2;
        return avcodec_open2(codec,decoder,nullptr)>=0;
    }
    bool Open(const std::string &path, std::vector<byte> bytes) {
        Close(); buffering=true; error=k_EVideoPlayerPlaybackErrorNone;
        format=avformat_alloc_context(); if (!format) return false;
        format->interrupt_callback={Interrupt,this};
        AVDictionary *options=nullptr;
        av_dict_set(&options,"protocol_whitelist","file,pipe",0);
        if (!bytes.empty()) {
            input=std::move(bytes); inputPosition=0;
            auto buffer=static_cast<uint8_t*>(av_malloc(32768));
            if (!buffer) { av_dict_free(&options); return false; }
            io=avio_alloc_context(buffer,32768,0,this,Read,nullptr,SeekInput);
            if (!io) { av_free(buffer); av_dict_free(&options); return false; }
            format->pb=io; format->flags|=AVFMT_FLAG_CUSTOM_IO;
        }
        int result=avformat_open_input(&format,path.empty()?nullptr:path.c_str(),nullptr,&options);
        av_dict_free(&options);
        if (result<0 || avformat_find_stream_info(format,nullptr)<0 || !OpenCodec(AVMEDIA_TYPE_VIDEO,vindex,vcodec)) return false;
        width=vcodec->width; height=vcodec->height;
        if (format->duration!=AV_NOPTS_VALUE) duration=std::max<int64_t>(0,format->duration/1000);
        hasAudio=OpenCodec(AVMEDIA_TYPE_AUDIO,aindex,acodec);
        mediaStart=current=discardBefore=0; wallStart=Clock::now(); buffering=false;
        Event(k_EVideoPlayerEventInit); return true;
    }
    bool EnsureAudio() {
        if (!hasAudio || !audio || audioOpened) return true;
        audioRate=acodec->sample_rate; audioChannels=std::min(2,acodec->ch_layout.nb_channels);
        if (audioRate<=0 || audioChannels<=0) return false;
        AVChannelLayout layout; av_channel_layout_default(&layout,audioChannels);
        int result=swr_alloc_set_opts2(&resample,&layout,AV_SAMPLE_FMT_S16,audioRate,
            &acodec->ch_layout,acodec->sample_fmt,acodec->sample_rate,0,nullptr);
        av_channel_layout_uninit(&layout);
        if (result<0 || swr_init(resample)<0) return false;
        // Panorama's callback dispatches an event to the main thread and waits.
        audioOpened=audio->InitAudioOutput(audioRate,audioChannels);
        return audioOpened;
    }
    bool WaitFor(int64_t pts, uint64_t active) {
        while (!Cancelled(active)) {
            if (state != k_EVideoPlayerPlaybackStatePlay) {
                if (audioOpened) audio->Pause();
                auto pauseStart=Clock::now();
                std::unique_lock<std::mutex> lock(mutex);
                wake.wait_for(lock,std::chrono::milliseconds(10),[&]{return quit || generation!=active || seekMS>=0 || state==k_EVideoPlayerPlaybackStatePlay;});
                wallStart+=Clock::now()-pauseStart;
                if (audioOpened && state==k_EVideoPlayerPlaybackStatePlay) audio->Resume();
                continue;
            }
            double elapsed=std::chrono::duration<double,std::milli>(Clock::now()-wallStart).count()*speed.load();
            if (pts<=mediaStart+elapsed) return true;
            std::unique_lock<std::mutex> lock(mutex); wake.wait_for(lock,std::chrono::milliseconds(2));
        }
        return false;
    }
    bool PresentVideo(uint64_t active) {
        auto stream=format->streams[vindex];
        int64_t pts=frame->best_effort_timestamp==AV_NOPTS_VALUE ? current.load() : av_rescale_q(frame->best_effort_timestamp,stream->time_base,{1,1000});
        if (pts<discardBefore) return true;
        if (!WaitFor(pts,active)) return false;
        int h=frame->height, w=frame->width, limit=maxHeight;
        if (limit>0 && h>limit) { h=std::max(2,limit&~1); w=std::max(2,(frame->width*h/frame->height)&~1); }
        if (!yuv || yuv->width!=w || yuv->height!=h) {
            av_frame_free(&yuv); yuv=av_frame_alloc(); if (!yuv) return false;
            yuv->format=AV_PIX_FMT_YUV420P; yuv->width=w; yuv->height=h;
            if (av_frame_get_buffer(yuv,32)<0) return false;
        }
        if (av_frame_make_writable(yuv)<0) return false;
        scale=sws_getCachedContext(scale,frame->width,frame->height,static_cast<AVPixelFormat>(frame->format),w,h,AV_PIX_FMT_YUV420P,SWS_BILINEAR,nullptr,nullptr,nullptr);
        if (!scale || sws_scale(scale,frame->data,frame->linesize,0,frame->height,yuv->data,yuv->linesize)!=h) return false;
        current=std::max<int64_t>(0,pts);
        return !video || video->BPresentYUV420Texture(w,h,yuv->data[0],yuv->data[1],yuv->data[2],yuv->linesize[0],yuv->linesize[1],yuv->linesize[2]);
    }
    bool PresentAudio(uint64_t active) {
        if (!audio || speed!=1.f) return true;
        int64_t pts=frame->best_effort_timestamp==AV_NOPTS_VALUE ? current.load() : av_rescale_q(frame->best_effort_timestamp,format->streams[aindex]->time_base,{1,1000});
        if (pts+frame->nb_samples*1000/audioRate<=discardBefore) return true;
        int samples=swr_get_out_samples(resample,frame->nb_samples);
        if (samples<0) return false;
        pcm.resize(size_t(samples)*audioChannels*2); uint8_t *dest=pcm.data();
        int n=swr_convert(resample,&dest,samples,const_cast<const uint8_t**>(frame->extended_data),frame->nb_samples);
        if (n<0) return false;
        size_t offset=0, size=size_t(n)*audioChannels*2;
        while (offset<size && !Cancelled(active)) {
            if (state!=k_EVideoPlayerPlaybackStatePlay || !audio->IsReadyForAudioData()) {
                std::unique_lock<std::mutex> lock(mutex); wake.wait_for(lock,std::chrono::milliseconds(2)); continue;
            }
            uint32 count=std::min<size_t>(audio->GetAudioBufferSize(),size-offset);
            count-=count%(audioChannels*2); if (!count) continue;
            void *buffer=audio->GetAudioBuffer(); if (!buffer) return false;
            std::memcpy(buffer,pcm.data()+offset,count); audio->CommitAudioBuffer(count); offset+=count;
        }
        return offset==size;
    }
    bool Decode(AVCodecContext *codec, const AVPacket *data, uint64_t active) {
        if (!codec) return true;
        int result=avcodec_send_packet(codec,data); if (result<0 && result!=AVERROR_EOF) return false;
        while ((result=avcodec_receive_frame(codec,frame))>=0) {
            bool ok=codec==vcodec ? PresentVideo(active) : PresentAudio(active);
            av_frame_unref(frame); if (!ok) return false;
        }
        return result==AVERROR(EAGAIN) || result==AVERROR_EOF;
    }
    bool SeekTo(int64_t ms) {
        if (avformat_seek_file(format,-1,INT64_MIN,ms*1000,INT64_MAX,0)<0) return false;
        avcodec_flush_buffers(vcodec); if (acodec) avcodec_flush_buffers(acodec);
        if (audioOpened) { audio->FreeAudioOutput(); audioOpened=false; swr_free(&resample); }
        mediaStart=current=discardBefore=ms; wallStart=Clock::now(); eof=false; return true;
    }
    void Run() {
        frame=av_frame_alloc(); packet=av_packet_alloc();
        while (!quit) {
            std::string path; std::vector<byte> bytes; uint64_t active; bool load=false; int64_t seek=-1;
            {
                std::unique_lock<std::mutex> lock(mutex);
                if (generation==handledGeneration && (!format || state!=k_EVideoPlayerPlaybackStatePlay) && seekMS<0) {
                    wake.wait_for(lock,std::chrono::milliseconds(10)); continue;
                }
                active=generation;
                if (generation!=handledGeneration) { handledGeneration=generation; path=loadPath; bytes=std::move(loadBytes); load=true; }
                seek=seekMS; seekMS=-1;
            }
            if (load && !Open(path,std::move(bytes))) { error=k_EVideoPlayerPlaybackErrorGeneric; buffering=false; state=k_EVideoPlayerPlaybackStateStop; Close(); Event(k_EVideoPlayerEventInit); continue; }
            if (!format) continue;
            if (seek>=0 && !SeekTo(seek)) { error=k_EVideoPlayerPlaybackErrorGeneric; continue; }
            if (state!=k_EVideoPlayerPlaybackStatePlay) continue;
            if (!EnsureAudio()) { error=k_EVideoPlayerPlaybackErrorGeneric; state=k_EVideoPlayerPlaybackStateStop; continue; }
            if (av_read_frame(format,packet)>=0) {
                bool ok=true;
                if (packet->stream_index==vindex) ok=Decode(vcodec,packet,active);
                else if (packet->stream_index==aindex && audioOpened) ok=Decode(acodec,packet,active);
                av_packet_unref(packet);
                if (!ok && !Cancelled(active)) { error=k_EVideoPlayerPlaybackErrorGeneric; state=k_EVideoPlayerPlaybackStateStop; Event(k_EVideoPlayerEventPlaybackStateChange); }
            } else if (!eof) {
                eof=true; Decode(vcodec,nullptr,active); if (audioOpened) Decode(acodec,nullptr,active);
                if (Cancelled(active)) continue;
                if (repeat && SeekTo(0)) { Event(k_EVideoPlayerEventRepeat); }
                else { state=k_EVideoPlayerPlaybackStateStop; Event(k_EVideoPlayerEventEnd); Event(k_EVideoPlayerEventPlaybackStateChange); }
            } else { state=k_EVideoPlayerPlaybackStateStop; }
        }
        Close(); av_frame_free(&frame); av_frame_free(&yuv); av_packet_free(&packet);
    }
    void SetState(EVideoPlayerPlaybackState value) {
        if (state.exchange(value)!=value) Event(k_EVideoPlayerEventPlaybackStateChange);
        wake.notify_all();
    }
public:
    Player(IVideoPlayerEventCallback *e,IVideoPlayerVideoCallback *v,IVideoPlayerAudioCallback *a):event(e),video(v),audio(a) { worker=std::thread(&Player::Run,this); }
    ~Player() override { quit=true; wake.notify_all(); worker.join(); }
    void Pump() { std::vector<EVideoPlayerEvent> events; { std::lock_guard<std::mutex> lock(mutex); events.swap(pendingEvents); } if(event) for(auto e:events) event->VideoPlayerEvent(e); }
    bool BLoad(const char *url) override {
        if (!url || !*url) return false;
        std::string path(url); if(path.compare(0,7,"file://")==0) path.erase(0,7);
        if(path.find("://")!=std::string::npos) { error=k_EVideoPlayerPlaybackErrorFailedDownload; return false; }
        { std::lock_guard<std::mutex> lock(mutex); loadPath=path; loadBytes.clear(); ++generation; seekMS=-1; }
        buffering=true; wake.notify_all(); return true;
    }
    bool BLoad(const byte *data,uint size) override {
        if (!data || !size) return false;
        { std::lock_guard<std::mutex> lock(mutex); loadPath.clear(); loadBytes.assign(data,data+size); ++generation; seekMS=-1; }
        buffering=true; wake.notify_all(); return true;
    }
    void Play() override { SetState(k_EVideoPlayerPlaybackStatePlay); }
    void Stop() override { SetState(k_EVideoPlayerPlaybackStateStop); Seek(0); }
    void Pause() override { SetState(k_EVideoPlayerPlaybackStatePause); }
    void SetPlaybackSpeed(float value) override { if(value>0 && value<=16) speed=value; }
    void Seek(uint ms) override { std::lock_guard<std::mutex> lock(mutex); seekMS=std::min<uint32>(ms,duration); wake.notify_all(); }
    void SetRepeat(bool value) override { repeat=value; }
    void SuggestMaxVeritcalResolution(int value) override { maxHeight=std::max(0,value); }
    EVideoPlayerPlaybackState GetPlaybackState() override { return state; }
    bool IsStoppedForBuffering() override { return buffering; }
    float GetPlaybackSpeed() override { return speed; }
    uint32 GetDuration() override { return duration; }
    uint32 GetCurrentPlaybackTime() override { return current; }
    EVideoPlayerPlaybackError GetPlaybackError() override { return error; }
    void GetVideoResolution(int *w,int *h) override { if(w)*w=width; if(h)*h=height; }
    int GetVideoDownloadRate() override { return 0; } // Local files have no network download.
    int GetVideoRepresentationCount() override { return width>0 ? 1:0; }
    bool BGetVideoRepresentationInfo(int i,int *w,int *h) override { if(i!=0 || width<=0)return false; GetVideoResolution(w,h); return true; }
    void ForceVideoRepresentation(int i) override { if(i!=0) error=k_EVideoPlayerPlaybackErrorGeneric; }
    int GetCurrentVideoRepresentation() override { return width>0 ? 0:-1; }
    void GetVideoSegmentInfo(int *now,int *total) override { if(now)*now=width>0?1:0; if(total)*total=width>0?1:0; }
    bool BHasAudioTrack() override { return hasAudio; }
};
std::mutex playersMutex;
std::vector<Player*> players;
}
void VideoPlaybackInitialize() { av_log_set_level(AV_LOG_ERROR); }
void VideoPlaybackShutdown() { /* Player lifetime belongs to CPanoramaVideoPlayer. */ }
void VideoPlaybackRunFrame() { std::vector<Player*> copy; {std::lock_guard<std::mutex> lock(playersMutex); copy=players;} for(auto player:copy) player->Pump(); }
IVideoPlayer *CreateVideoPlayer(IVideoPlayerEventCallback *e,IVideoPlayerVideoCallback *v,IVideoPlayerAudioCallback *a) {
    auto player=new Player(e,v,a); std::lock_guard<std::mutex> lock(playersMutex); players.push_back(player); return player;
}
void DeleteVideoPlayer(IVideoPlayer *base) {
    auto player=static_cast<Player*>(base); {std::lock_guard<std::mutex> lock(playersMutex); players.erase(std::remove(players.begin(),players.end(),player),players.end());} delete player;
}
