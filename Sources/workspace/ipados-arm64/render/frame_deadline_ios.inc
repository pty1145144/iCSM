#include "frame_deadline_ios.h"
static ConVar icsm_frame_deadline("icsm_frame_deadline","1",FCVAR_RELEASE,
    "iOS absolute frame deadlines; 0 selects the original limiter for diagnostics");
namespace ICSMFrameDeadline {
static Schedule schedule;
static bool usedThisFilter=false;
static void beginFilter() { usedThisFilter=false; }
static bool shouldWait(double now,double elapsed,double period) {
    usedThisFilter=true;
    return schedule.shouldWait(now,elapsed,period);
}
static double remaining(double now,double originalRemaining) {
    return usedThisFilter ? schedule.remaining(now):originalRemaining;
}
static void accepted(double now) {
    if(usedThisFilter)schedule.accepted(now);
    else schedule.reset();
}
}
CON_COMMAND_F(icsm_frame_deadline_stats,"Print current native iOS frame limiter mode and sleep setting",FCVAR_RELEASE) {
    Msg("ICSM_FRAME_DEADLINE enabled=%d sleep=%d fps_max=%g fps_max_menu=%g\n",
        icsm_frame_deadline.GetInt(),sleep_when_meeting_framerate.GetInt(),
        fps_max.GetFloat(),fps_max_menu.GetFloat());
}
