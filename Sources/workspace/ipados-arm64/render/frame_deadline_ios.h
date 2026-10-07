#pragma once
// The limiter schedules work; the engine retains its actual elapsed frame time.
namespace ICSMFrameDeadline {
class Schedule {
    double deadline_=0, period_=0, lastCheck_=0;
public:
    void reset() { deadline_=period_=lastCheck_=0; }
    bool shouldWait(double now,double elapsed,double period) {
        // Rebase after a cap change, a clock reset, or a long load/suspension.
        if(period_!=period || now<lastCheck_ || now-lastCheck_>0.25) {
            period_=period;
            deadline_=now+(elapsed<period ? period-elapsed:0);
        }
        lastCheck_=now;
        return now<deadline_;
    }
    double remaining(double now) const { return deadline_>now ? deadline_-now:0; }
    void accepted(double now) {
        // Keep ordinary wake jitter on the timeline. A missed whole period
        // starts a new timeline, so a load/stall cannot cause a catch-up burst.
        deadline_=now-deadline_>=period_ ? now+period_:deadline_+period_;
    }
};
}
