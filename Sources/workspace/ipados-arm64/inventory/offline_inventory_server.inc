// Read-only verification: silenced guns share entity classes with the default
// gun, so report the actual econ definition rather than only GetClassname().
CON_COMMAND_F(icsm_server_inventory, "Print actual human loadout and held weapon definitions", FCVAR_RELEASE)
{
    if (!gpGlobals || !CSGameRules()) return;
    for (int i = 1; i <= gpGlobals->maxClients; ++i)
    {
        CCSPlayer *player = ToCSPlayer(UTIL_PlayerByIndex(i));
        if (!player || player->IsBot()) continue;
        int team = player->GetTeamNumber();
        Msg("ICSM_SERVER player=%d team=%d alive=%d money=%d buyzone=%d\n",
            player->GetUserID(), team, player->IsAlive(), player->GetAccountBalance(), player->IsInBuyZone());
        if (CSGameRules()->IsPlayingGunGame())
            Msg("ICSM_GUNGAME player=%d index=%d kills=%d round_points=%d\n", player->GetUserID(),
                player->GetPlayerGunGameWeaponIndex(), player->GetNumGunGameKillsWithCurrentWeapon(),
                player->GetNumGunGameTRKillPoints());
        for (int slot = LOADOUT_POSITION_MELEE; slot <= LOADOUT_POSITION_LAST_WHEEL_WEAPON; ++slot)
        {
            if (!ICSMLoadout::IsSelectableSlot(slot)) continue;
            const CEconItemView *item = player->Inventory()->GetItemInLoadout(team, slot);
            if (item && item->IsValid())
                Msg("ICSM_SERVER_LOADOUT team=%d slot=%d definition=%d weapon=%s\n", team, slot,
                    item->GetItemDefinition()->GetDefinitionIndex(), item->GetItemDefinition()->GetDefinitionName());
        }
        for (int slot = 0; slot < player->WeaponCount(); ++slot)
        {
            CWeaponCSBase *weapon = dynamic_cast<CWeaponCSBase *>(player->GetWeapon(slot));
            if (weapon && weapon->GetItemDefinition())
                Msg("ICSM_SERVER_HELD team=%d class=%s definition=%d weapon=%s clip=%d has_silencer=%d detachable=%d silenced=%d switching=%d\n", team,
                    weapon->GetClassname(), weapon->GetItemDefinitionIndex(), weapon->GetDefinitionName(), weapon->Clip1(),
                    weapon->HasSilencer(), weapon->HasDetachableSilencer(), weapon->IsSilenced(), weapon->IsSwitchingSilencer());
            if (weapon && weapon->GetItemDefinition())
                Msg("ICSM_SERVER_HELD_MODEL team=%d definition=%d view=%s world=%s\n", team,
                    weapon->GetItemDefinitionIndex(), weapon->GetViewModel(), weapon->GetWorldModel());
        }
    }
}

// Cheat-gated offline acceptance helper. Use original inventory, spawn and
// switch interfaces; the test harness restores its temporary saved recipes.
CON_COMMAND_F(icsm_skin_trial_spawn, "Offline paint acceptance: <definition> <paint>; requires sv_cheats", FCVAR_RELEASE | FCVAR_CHEAT)
{
    ConVarRef cheats("sv_cheats");
    if (args.ArgC() != 3 || !cheats.IsValid() || !cheats.GetBool() || !CSGameRules()) return;
    int definition = atoi(args[1]), paint = atoi(args[2]);
    if (!ICSMSkin::FindTrial(definition) || (paint && !ICSMSkin::FindCatalog(definition, paint))) return;
    for (int i = 1; i <= gpGlobals->maxClients; ++i)
    {
        CCSPlayer *player = ToCSPlayer(UTIL_PlayerByIndex(i));
        if (!player || player->IsBot()) continue;
        int team = player->GetTeamNumber();
        if (!ICSMSkin::Definition(team, definition))
            team = ICSMSkin::Definition(TEAM_CT, definition) ? TEAM_CT : TEAM_TERRORIST;
        const GameItemDefinition_t *def = ICSMSkin::Definition(team, definition);
        if (!def) return;
        if (player->GetTeamNumber() != team) player->ChangeTeam(team);
        if (!player->IsAlive()) player->RoundRespawn();
        player->RemoveAllItems(false);
        player->Inventory()->SetDefaultEquippedDefinitionItemBySlot(team, def->GetLoadoutSlot(team), definition);
        const CEconItemView *selected = player->Inventory()->GetItemInLoadout(team, def->GetLoadoutSlot(team));
        if (!selected || !selected->IsValid() || !ICSMSkin::Save(team, definition, ICSMSkin::Trial(definition, paint))) return;
        CWeaponCSBase *weapon = dynamic_cast<CWeaponCSBase *>(player->GiveNamedItem(def->GetDefinitionName(), 0, selected));
        bool owned = weapon && weapon->GetOwner() == player;
        bool active = owned && player->Weapon_Switch(weapon);
        Msg("ICSM_SKIN_TRIAL_SPAWN definition=%d paint=%d team=%d owned=%d active=%d\n", definition, paint, team, owned, active);
        return;
    }
}
