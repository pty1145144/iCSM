// Bounded iOS diagnostic of Source elapsed time and limiter scheduling.
namespace ICSMFramePacing {
struct Row {
    double interval, budget, requested, slept, pump, wakeToFilter, sourceElapsed;
    unsigned sleeps, pumps;
};
static Row rows[600], accumulated{};
static unsigned count=0, limit=0;
static double lastAccepted=0, lastWake=0;
static bool active=false, pendingFinish=false;
static int previousSleep=1;
static char tag[65];
static void finish() {
    active=false; pendingFinish=false;
    sleep_when_meeting_framerate.SetValue(previousSleep);
    char path[128]; Q_snprintf(path,sizeof(path),"i5_frame_pacing_%s.csv",tag);
    FileHandle_t file=g_pFileSystem->Open(path,"wt","GAME");
    if(file!=FILESYSTEM_INVALID_HANDLE) {
        const char *header="frame,interval_ms,budget_ms,sleep_requested_ms,sleep_actual_ms,pump_ms,wake_to_filter_ms,sleeps,pumps,source_elapsed_ms\n";
        g_pFileSystem->Write(header,Q_strlen(header),file);
        for(unsigned i=0;i<count;++i) {
            char line[512]; const Row &r=rows[i];
            Q_snprintf(line,sizeof(line),"%u,%.9f,%.9f,%.9f,%.9f,%.9f,%.9f,%u,%u,%.9f\n",
                i,r.interval,r.budget,r.requested,r.slept,r.pump,r.wakeToFilter,r.sleeps,r.pumps,r.sourceElapsed);
            g_pFileSystem->Write(line,Q_strlen(line),file);
        }
        g_pFileSystem->Close(file);
    }
    Msg("ICSM_FRAME_PACING saved=%d frames=%u path=%s restored_sleep=%d\n",
        file!=FILESYSTEM_INVALID_HANDLE,count,path,previousSleep);
}
static void slept(double start,double end,unsigned ns) {
    if(!active)return;
    accumulated.requested+=ns/1000000.0;
    accumulated.slept+=(end-start)*1000;
    ++accumulated.sleeps; lastWake=end;
}
static void accepted(double clock,double budget,double elapsed) {
    if(!active)return;
    if(lastAccepted) {
        Row r=accumulated;
        r.interval=(clock-lastAccepted)*1000; r.budget=budget*1000;
        r.sourceElapsed=elapsed*1000;
        r.wakeToFilter=lastWake ? (Plat_FloatTime()-lastWake)*1000:0;
        rows[count++]=r;
        pendingFinish=count==limit;
    }
    lastAccepted=clock; lastWake=0; accumulated=Row{};
}
}
// Both hooks are inside engine.framework; timestamps are disabled outside a probe.
bool ICSMFramePacingActive() { return ICSMFramePacing::active; }
void ICSMFramePacingPump(double elapsed) {
    if(!ICSMFramePacing::active)return;
    ICSMFramePacing::accumulated.pump+=elapsed*1000;
    ++ICSMFramePacing::accumulated.pumps;
}
CON_COMMAND_F(icsm_frame_pacing_probe,"Finite limiter probe: [120..600 frames] [sleep 0/1] [safe tag]",FCVAR_RELEASE) {
    using namespace ICSMFramePacing;
    if(active) { Warning("ICSM_FRAME_PACING already active\n");return; }
    if(args.ArgC()!=4) { Warning("ICSM_FRAME_PACING requires frame count, sleep mode, tag\n");return; }
    const char *name=args[3]; const size_t size=Q_strlen(name);
    if(!size || size>64)return;
    for(size_t i=0;i<size;++i)
        if(!((name[i]>='a' && name[i]<='z') || (name[i]>='A' && name[i]<='Z') ||
             (name[i]>='0' && name[i]<='9') || name[i]=='_' || name[i]=='-'))return;
    Q_strncpy(tag,name,sizeof(tag)); limit=clamp(atoi(args[1]),120,600);
    previousSleep=sleep_when_meeting_framerate.GetInt();
    sleep_when_meeting_framerate.SetValue(atoi(args[2]) ? 1:0);
    count=0;lastAccepted=lastWake=0;accumulated=Row{};pendingFinish=false;active=true;
    Msg("ICSM_FRAME_PACING started frames=%u sleep=%d tag=%s\n",limit,sleep_when_meeting_framerate.GetInt(),tag);
}
