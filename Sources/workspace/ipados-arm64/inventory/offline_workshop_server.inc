// The 2015 map's cfg sets team restrictions and bot_knives_only. The 2019
// bspconvar whitelist omits these commands, while its round-start entity I/O
// runs after players/bots have already joined. Apply the shipped cfg at the
// original ServerActivate hook, before TheBots->ServerActivate (gameinterface.cpp).
#include "igamesystem.h"

class ICSMAimBotz2015Setup : public CAutoGameSystem
{
public:
    ICSMAimBotz2015Setup() : CAutoGameSystem("ICSMAimBotz2015Setup") {}
    void LevelInitPostEntity() OVERRIDE
    {
        if (!gpGlobals || !CSGameRules() || !CSGameRules()->IsPlayingCustomGametype() ||
            Q_stricmp(STRING(gpGlobals->mapname), "workshop/243702660/aim_botz") ||
            !filesystem->FileExists("cfg/icsm_aim_botz_2015.cfg", "GAME")) return;
        engine->ServerCommand("exec icsm_aim_botz_2015.cfg\n");
        engine->ServerExecute();
        Msg("ICSM_WORKSHOP_2015 applied original training cfg before bot activation\n");
    }
};
static ICSMAimBotz2015Setup s_icsmAimBotz2015Setup;
