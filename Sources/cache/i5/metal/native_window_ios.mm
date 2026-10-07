#include "native_objects.h"
#include "metal_perf_ios.h"
#include "pipeline_warm_ios.h"
#include "touch_ios.h"
#include "metal_window.h"
#include "tier1/convar.h"
#import <UIKit/UIKit.h>
#undef MIN
#undef MAX
extern SourceMetal::Device *g_sourceNativeDevice;
extern "C" void SourceMetalFrameInterpolationDrain();
extern "C" bool SourceMetalFrameInterpolationActive();
extern "C" void SourceMetalFrameInterpolationFrameStart();
@interface ICSMInterpolationDisplayClock:NSObject
- (void)tick:(CADisplayLink*)sender;
@end
@implementation ICSMInterpolationDisplayClock
- (void)tick:(CADisplayLink*)sender {}
@end
static CADisplayLink *interpolationClock=nil;
static ICSMInterpolationDisplayClock *interpolationClockTarget=nil;
static void updateInterpolationDisplayClock() {
    if(!interpolationClock) {
        interpolationClockTarget=[ICSMInterpolationDisplayClock new];
        interpolationClock=[CADisplayLink displayLinkWithTarget:interpolationClockTarget selector:@selector(tick:)];
        interpolationClock.preferredFrameRateRange=CAFrameRateRangeMake(120,120,120);
        [interpolationClock addToRunLoop:NSRunLoop.mainRunLoop forMode:NSRunLoopCommonModes];
    }
    interpolationClock.paused=!SourceMetalFrameInterpolationActive();
}
static id resignObserver=nil;
static id backgroundObserver=nil;
static void observeMetalLifecycle() {
    if(resignObserver)return;
    auto center=NSNotificationCenter.defaultCenter;
    resignObserver=[center addObserverForName:UIApplicationWillResignActiveNotification object:nil queue:nil usingBlock:^(NSNotification*) {
        // Finish the current main-thread encoding before UIKit revokes GPU use.
        if(g_sourceNativeDevice)SourceMetal::commit(*g_sourceNativeDevice,true);
        SourceMetalFrameInterpolationDrain();
        interpolationClock.paused=YES;
        SourceMetalPipelineCheckpoint(true);
        fprintf(stderr,"I4_METAL_LIFECYCLE deactivated; GPU queue drained\n");
    }];
    backgroundObserver=[center addObserverForName:UIApplicationDidEnterBackgroundNotification object:nil queue:nil usingBlock:^(NSNotification*) {
        if(g_sourceNativeDevice && g_sourceNativeDevice->lastSubmitted)
            [g_sourceNativeDevice->lastSubmitted waitUntilScheduled];
    }];
}
namespace SourceMetal {
static CAMetalLayer *metalLayer=nil;
static UIView *metalHost=nil;
static SDL_Window *metalWindow=nullptr;
CAMetalLayer *layer() { return metalLayer; }
}
static void attachView(UIView *view) {
    if(!NSThread.isMainThread || ![view.layer isKindOfClass:CAMetalLayer.class])
        SourceMetal::fatal("UIKit attach",@"Requires a CAMetalLayer view on the main thread");
    SourceMetal::metalHost=view;
    observeMetalLifecycle();
    auto l=SourceMetal::metalLayer=(CAMetalLayer*)view.layer;
    l.device=SourceMetal::device(); l.pixelFormat=MTLPixelFormatBGRA8Unorm;
    l.framebufferOnly=YES; l.maximumDrawableCount=3;
    l.contentsGravity=kCAGravityResizeAspect;
    SourceMetalResizeWindow(0,0);
}
extern "C" __attribute__((visibility("default"))) void SourceMetalAttachUIKitView(void *view) {
    attachView((__bridge UIView*)view);
}
extern "C" __attribute__((visibility("default"))) bool SourceMetalUIKitDisplay(unsigned *w,unsigned *h,unsigned *hz) {
    auto v=SourceMetal::metalHost;
    if(!v.window) {
        for(UIScene *scene in UIApplication.sharedApplication.connectedScenes) {
            if([scene isKindOfClass:UIWindowScene.class]) {
                UIWindowScene *ws=(UIWindowScene*)scene;
                CGSize size=ws.coordinateSpace.bounds.size; CGFloat scale=ws.screen.scale;
                *w=llround(size.width*scale); *h=llround(size.height*scale);
                *hz=ws.screen.maximumFramesPerSecond; return *w && *h;
            }
        }
        return false;
    }
    SourceMetalResizeWindow(0,0);
    *w=SourceMetal::metalLayer.drawableSize.width; *h=SourceMetal::metalLayer.drawableSize.height;
    *hz=v.window.screen.maximumFramesPerSecond;
    return *w && *h;
}
void *SourceMetalAttachWindow(SDL_Window *window) {
    SDL_MetalView view=SDL_Metal_CreateView(window);
    if(!view) Error("SDL Metal view failed: %s\n",SDL_GetError());
    SourceMetal::metalWindow=window;
    attachView((__bridge UIView*)view);
    return view;
}
void SourceMetalDetachWindow(void *view) {
    SourceMetal::metalLayer=nil; SourceMetal::metalHost=nil; SourceMetal::metalWindow=nullptr;
    if(view)SDL_Metal_DestroyView(view);
}
void SourceMetalResizeWindow(unsigned,unsigned) {
    auto view=SourceMetal::metalHost; auto l=SourceMetal::metalLayer;
    if(!view || !l || !view.window)return;
    // UIKit stretches the retained surface during a live window drag. Keep its
    // pixel dimensions and Source targets until effectiveGeometry settles.
    if(view.window.windowScene.effectiveGeometry.isInteractivelyResizing && l.drawableSize.width && l.drawableSize.height)return;
    // UIKit owns the window dimensions. Render targets can differ from the
    // drawable; Source Present performs its existing linear copy.
    CGFloat scale=view.window.screen.scale;
    view.contentScaleFactor=scale; l.contentsScale=scale;
    l.drawableSize=CGSizeMake(llround(view.bounds.size.width*scale),llround(view.bounds.size.height*scale));
}
extern "C" __attribute__((visibility("default"))) bool SourceMetalUIKitFullscreen() {
    auto view=SourceMetal::metalHost;if(!view.window)return false;
    CGRect window=[view.window convertRect:view.window.bounds toCoordinateSpace:view.window.screen.coordinateSpace];
    CGRect screen=view.window.screen.coordinateSpace.bounds;
    return fabs(window.origin.x-screen.origin.x)<1 && fabs(window.origin.y-screen.origin.y)<1 && fabs(window.size.width-screen.size.width)<1 && fabs(window.size.height-screen.size.height)<1;
}
void SourceMetalSizeWindow(SDL_Window *window,unsigned width,unsigned height) {
    if(window && window==SourceMetal::metalWindow && width && height) {
        CGFloat scale=SourceMetal::metalHost.window.screen.scale;
        SDL_SetWindowSize(window,llround(width/scale),llround(height/scale));
    }
    SourceMetalResizeWindow(width,height);
}
void SourceMetalPrintWindowStats() {
    auto v=SourceMetal::metalHost; auto l=SourceMetal::metalLayer;
    if(!v || !l) { Msg("Metal UIKit window unavailable\n");return; }
    Msg("Metal UIKit points=%.0fx%.0f drawable=%.0fx%.0f scale=%.3f safe_area=%.1f/%.1f/%.1f/%.1f\n",
        v.bounds.size.width,v.bounds.size.height,l.drawableSize.width,l.drawableSize.height,l.contentsScale,
        v.safeAreaInsets.top,v.safeAreaInsets.left,v.safeAreaInsets.bottom,v.safeAreaInsets.right);
}
void SourceMetalFillRendererInfo(GLMRendererInfoFields *info) {
    memset(info,0,sizeof(*info)); auto d=SourceMetal::device();
    info->m_fullscreen=info->m_accelerated=info->m_windowed=1;
    NSOperatingSystemVersion os=NSProcessInfo.processInfo.operatingSystemVersion;
    info->m_osComboVersion=(os.majorVersion<<16)|(os.minorVersion<<8)|os.patchVersion;
    info->m_pciVendorID=0x106b;
    V_strncpy(info->m_pciModelString,d.name.UTF8String,sizeof(info->m_pciModelString));
    V_strncpy(info->m_driverInfoString,"Native Metal (iPadOS)",sizeof(info->m_driverInfoString));
    info->m_vidMemory=info->m_texMemory=std::min<uint64_t>(d.recommendedMaxWorkingSetSize,INT_MAX);
    for(unsigned n=1;n<=8;n*=2)if([d supportsTextureSampleCount:n])info->m_maxSamples=n;
    info->m_maxAniso=16;
    info->m_hasGammaWrites=info->m_hasMixedAttachmentSizes=info->m_hasBGRA=true;
    info->m_hasNewFullscreenMode=info->m_hasOcclusionQuery=info->m_hasFramebufferBlit=info->m_hasUniformBuffers=true;
    info->m_nMaxVertexTIU=info->m_nNumVertexSamplers=4;
    info->m_nMaxCombinedTIU=info->m_nTotalSamplerCount=20;info->m_nFirstVertexSampler=16;
}
extern "C" __attribute__((visibility("default"))) void SourceMetalRunFrame(void (*frame)(float),float frameTime) { @autoreleasepool {
    // Keep UIKit responsive while the engine is suspended. SDL also gates its
    // event-pump return, so deactivation within a frame cannot reach rendering.
    bool suspended=false;
    while(UIApplication.sharedApplication.applicationState!=UIApplicationStateActive) {
        suspended=true;
        CFRunLoopRunInMode(kCFRunLoopDefaultMode,0.05,true);
    }
    if(suspended)fprintf(stderr,"I4_METAL_LIFECYCLE reactivated; engine frame resumed\n");
    auto d=g_sourceNativeDevice;
    const bool profiling=d && d->profileRemaining;
    const double start=profiling ? Plat_FloatTime():0;
    if(profiling) {
        d->profileFrame=SourceMetal::FrameTiming{};
        SourceMetal::perfBeginFrame(*d);
        const auto previous=d->lastSceneSubmitted ? d->lastSceneSubmitted:d->lastSubmitted;
        if(previous.status==MTLCommandBufferStatusCompleted)
            d->profileFrame.gpu=(previous.GPUEndTime-previous.GPUStartTime)*1000;
    }
    updateInterpolationDisplayClock();
    SourceMetalFrameInterpolationFrameStart();
    frame(frameTime);
    if(!SourceTouchSessionActive())SourceMetalPipelineCheckpoint(false);
    if(profiling && d==g_sourceNativeDevice && d->profileRemaining) {
        for(auto it=d->profileSceneCommands.begin();it!=d->profileSceneCommands.end();) {
            if((*it).status==MTLCommandBufferStatusCompleted) {
                d->profileSceneGPU.push_back(((*it).GPUEndTime-(*it).GPUStartTime)*1000);
                it=d->profileSceneCommands.erase(it);
            } else ++it;
        }
        d->profileFrame.host=(Plat_FloatTime()-start)*1000;
        SourceMetal::perfEndFrame(*d);
        d->profileSamples.push_back(d->profileFrame);
        if(!--d->profileRemaining) {
            auto values=d->profileSamples;
            std::sort(values.begin(),values.end(),[](const auto &a,const auto &b){return a.host<b.host;});
            const auto n=values.size();
            Msg("M6_PROFILE count=%zu host_p50=%.3f host_p95=%.3f host_p99=%.3f ms\n",n,values[n/2].host,values[(n-1)*95/100].host,values[(n-1)*99/100].host);
            auto gpu=d->profileSceneGPU; std::sort(gpu.begin(),gpu.end());
            if(!gpu.empty()) {const auto n=gpu.size(); Msg("M6_PROFILE_GPU completed_scenes=%zu pending=%zu gpu_p50=%.3f gpu_p95=%.3f gpu_p99=%.3f max=%.3f ms\n",n,d->profileSceneCommands.size(),gpu[n/2],gpu[(n-1)*95/100],gpu[(n-1)*99/100],gpu.back());}
            d->profileSceneCommands.clear();
            for(unsigned i=0;i<10 && i<n;++i) {const auto &s=values[n-1-i]; Msg("M6_PROFILE_TAIL host=%.3f prepare=%.3f present=%.3f acquire=%.3f previous_completed_gpu=%.3f ms (0=unavailable)\n",s.host,s.prepare,s.present,s.acquire,s.gpu);}
        }
    }
} }

CON_COMMAND(m6_window_stats,"Print native Metal window points, backing pixels, drawable and render sizes") { SourceMetalPrintWindowStats(); }
