/* I5 native touch bridge, included by the derived in_main.cpp after the
   original IN_* handlers.  Native callbacks enqueue POD events only: the
   original client context applies edges and constructs CUserCmds. */

namespace I5Touch
{
enum EventType { ActionEvent, MoveEvent, LookEvent, CommandEvent, WeaponEvent, ResetEvent };
struct Event
{
    EventType type;
    int code;
    int value;
    float x, y;
    double timestamp;
    unsigned epoch;
};
struct LookSample { float x, y; double timestamp; };
static const unsigned kCapacity = 16384;
static Event s_events[kCapacity];
static unsigned s_read = 0, s_write = 0, s_epoch = 0;
static LookSample s_look[kCapacity];
static unsigned s_lookCount = 0;
static float s_moveX = 0.0f, s_moveY = 0.0f;
static bool s_held[SourceTouchActionCount] = {};
static bool s_touched[SourceTouchActionCount] = {};
static bool s_initialized = false, s_scoreHeld = false, s_pumping = false;
static bool s_gameInput = false;
static bool s_pointerUI = false, s_teamMenu = false, s_endOfMatch = false;
static unsigned s_lookSamples = 0, s_commands = 0, s_resets = 0;
static unsigned s_inspectCommands = 0, s_dropCommands = 0;
static double s_yawTotal = 0.0, s_pitchTotal = 0.0;
static SourceTouchState s_state = {};
static CUserCmd s_lastCommand;
static CUserCmd s_lastExtraCommand;
static unsigned s_realCommands = 0, s_extraCommands = 0, s_actionEdges = 0;

// These are degrees per logical UIKit point.  They intentionally do not use
// mouse sensitivity, m_yaw/m_pitch, FOV scaling, acceleration or frame time.
static ConVar touch_yaw_degrees_per_point( "touch_yaw_degrees_per_point", "0.25",
    FCVAR_ARCHIVE, "Native touch yaw degrees per UIKit point; linear, no acceleration.", true, 0.001f, true, 5.0f );
static ConVar touch_pitch_degrees_per_point( "touch_pitch_degrees_per_point", "0.25",
    FCVAR_ARCHIVE, "Native touch pitch degrees per UIKit point; linear, no acceleration.", true, 0.001f, true, 5.0f );
static ConVar touch_input_debug( "touch_input_debug", "0", 0,
    "Log native touch actions and applied look totals." );

// Original fps_max and fps_max_menu are not archived. Keep the UI choice in
// an archived client ConVar and apply both original engine limiters.
static void ApplyFrameRateLimit( int limit )
{
    ConVarRef game( "fps_max", true ), menu( "fps_max_menu", true );
    if ( !game.IsValid() || !menu.IsValid() ) return;
    game.SetValue( limit );
    menu.SetValue( limit );
    Msg( "ICSM_FPS_LIMIT selected=%d game=%d menu=%d\n", limit, game.GetInt(), menu.GetInt() );
}

static void FrameRateLimitChanged( IConVar *var, const char *, float )
{
    ApplyFrameRateLimit( static_cast<ConVar *>( var )->GetInt() );
}

static ConVar icsm_fps_limit( "icsm_fps_limit", "120", FCVAR_ARCHIVE,
    "Saved frame rate limit for the lobby and gameplay.", true, 60.0f, true, 120.0f, FrameRateLimitChanged );

static void ApplyFrameRateLimitCommand( const CCommand & )
{
    ApplyFrameRateLimit( icsm_fps_limit.GetInt() );
}
static ConCommand icsm_apply_fps_limit( "icsm_apply_fps_limit", ApplyFrameRateLimitCommand,
    "Apply the saved frame rate limit after startup configuration.", FCVAR_CLIENTCMD_CAN_EXECUTE );

static kbutton_t *Button( int action )
{
    switch ( action )
    {
    case SourceTouchAttack: return &in_attack;
    case SourceTouchAttack2: return &in_attack2;
    case SourceTouchDuck: return &in_duck;
    case SourceTouchJump: return &in_jump;
    case SourceTouchReload: return &in_reload;
    case SourceTouchUse: return &in_use;
    case SourceTouchWalk: return &in_speed;
    default: return NULL;
    }
}

static const char *KeyId( int action )
{
    // Distinct from physical Source ButtonCode_t values and the console's -1.
    static const char *ids[SourceTouchActionCount] = {
        "-55001", "-55002", "-55003", "-55004", "-55005", "-55006", "-55007"
    };
    return action >= 0 && action < SourceTouchActionCount ? ids[action] : "-55000";
}

static bool ScoreboardOpen()
{
    CCSGO_Scoreboard *score = CCSGO_Scoreboard::GetInstance();
    return score && score->BIsVisible();
}

static bool EndOfMatchOpen()
{
    CCSGO_EndOfMatch *end = CCSGO_EndOfMatch::GetInstance();
    return end && end->IsOpen();
}

static void ReleaseGameActions()
{
    s_moveX = s_moveY = 0.0f;
    s_lookCount = 0;
    for ( int a = 0; a < SourceTouchActionCount; ++a )
    {
        kbutton_t *button = Button( a );
        if ( s_held[a] ) KeyUp( button, KeyId( a ) );
        s_held[a] = false;
        // Cancelling an unsent quick tap must not leave impulse-down behind.
        // Preserve any physical key which still owns the same original button.
        kbutton_t::Split_t &key = button->GetPerUser();
        if ( s_touched[a] && !key.down[0] && !key.down[1] ) key.state = 4;
        s_touched[a] = false;
    }
    ++s_resets;
}

static void Enqueue( EventType type, int code, int value, float x, float y, double timestamp )
{
    if ( s_write - s_read >= kCapacity )
    {
        // A bounded queue cannot retain stale holds following overflow.
        s_read = s_write;
        ++s_epoch;
        Event reset = { ResetEvent, 0, 0, 0, 0, timestamp, s_epoch };
        s_events[s_write++ % kCapacity] = reset;
        Warning( "I5_TOUCH queue overflow: reset pending input\n" );
    }
    Event event = { type, code, value, x, y, timestamp, s_epoch };
    s_events[s_write++ % kCapacity] = event;
}

static void ActionCallback( void *, SourceTouchAction action, bool pressed, double time )
{ Enqueue( ActionEvent, action, pressed ? 1 : 0, 0, 0, time ); }
static void MoveCallback( void *, float x, float y, double time )
{ Enqueue( MoveEvent, 0, 0, x, y, time ); }
static void LookCallback( void *, float x, float y, double time )
{ Enqueue( LookEvent, 0, 0, x, y, time ); }
static void CommandCallback( void *, SourceTouchCommand command, double time )
{ Enqueue( CommandEvent, command, 0, 0, 0, time ); }
static void WeaponCallback( void *, int entity, int subtype, double time )
{ Enqueue( WeaponEvent, entity, subtype, 0, 0, time ); }
static void ResetCallback( void *, double time )
{
    ++s_epoch;
    Enqueue( ResetEvent, 0, 0, 0, 0, time );
}

static SourceTouchRect PanelRect( panorama::IUIPanel *panel, int renderWidth, int renderHeight )
{
    SourceTouchRect result = {};
    if ( !panel || !panel->BIsVisible() || !panel->GetParentWindow() ) return result;
    const float surfaceW = float( panel->GetParentWindow()->GetSurfaceWidth() );
    const float surfaceH = float( panel->GetParentWindow()->GetSurfaceHeight() );
    if ( surfaceW <= 0 || surfaceH <= 0 ) return result;
    float x = 0, y = 0;
    for ( panorama::IUIPanel *p = panel; p; p = p->GetParent() )
    {
        x += p->GetActualXOffset();
        y += p->GetActualYOffset();
        if ( p->GetParent() )
        {
            x -= p->GetParent()->GetContentsXScrollOffset();
            y -= p->GetParent()->GetContentsYScrollOffset();
        }
    }
    // CUIPanel layout dimensions already include propagated ui-scale.  HUD
    // radar/teamcounter use layout positioning, not a rotated CSS transform.
    result.x = x * renderWidth / surfaceW;
    result.y = y * renderHeight / surfaceH;
    result.width = panel->GetActualLayoutWidth() * renderWidth / surfaceW;
    result.height = panel->GetActualLayoutHeight() * renderHeight / surfaceH;
    return result;
}

static bool PanoramaPointerUI()
{
    // TeamSelect uses k_EGameInputShareMouse: the original engine gives
    // Panorama the pointer even though the engine GameUI is not visible.
    return gameuifuncs && gameuifuncs->PanoramaDeniesInputToGame( panorama::k_EGameInputUIEnableMouseCursor );
}

static bool TeamSelectionOpen()
{
    CCSGO_Hud *hud = engine && engine->IsInGame() ? CCSGO_Hud::GetInstance() : NULL;
    panorama::IUIPanel *team = hud ? hud->UIPanel()->FindChildTraverse( "TeamSelectMenu" ) : NULL;
    return team && team->BIsVisible();
}

static bool GameplayAllowed( C_CSPlayer *player )
{
    if ( SourceTouchIsEditing() || !engine || !engine->IsInGame() || engine->IsPaused() || !player ) return false;
    if ( enginevgui && enginevgui->IsGameUIVisible() ) return false;
    if ( player->IsBuyMenuOpen() || ScoreboardOpen() || EndOfMatchOpen() ) return false;
    if ( PanoramaPointerUI() || TeamSelectionOpen() ) return false;
    if ( !g_pInputStackSystem ) return false;
    const InputContextHandle_t context = engine->GetInputContext( ENGINE_INPUT_CONTEXT_GAME );
    return context != INPUT_CONTEXT_HANDLE_INVALID &&
        g_pInputStackSystem->IsTopmostEnabledContext( context ) &&
        !::input->CAM_InterceptingMouse();
}

static void PublishState()
{
    if ( !s_initialized || !engine ) return;
    SourceTouchState state = {};
    state.struct_size = sizeof( state );
    const bool inGame = engine->IsInGame();
    state.in_game = inGame;
    C_CSPlayer *player = inGame ? C_CSPlayer::GetLocalCSPlayer() : NULL;
    const bool gameUI = enginevgui && enginevgui->IsGameUIVisible();
    const bool buy = player && player->IsBuyMenuOpen();
    const bool score = inGame && ScoreboardOpen();
    s_pointerUI = inGame && PanoramaPointerUI();
    s_teamMenu = inGame && TeamSelectionOpen();
    s_endOfMatch = inGame && EndOfMatchOpen();
    if ( s_scoreHeld && !score )
    {
        KeyUp( &in_score, "-55100" );
        s_scoreHeld = false;
    }
    s_gameInput = GameplayAllowed( player );
    // Preserve the native scoreboard close button, but let the original SDL
    // absolute-pointer path handle team selection and other Panorama menus.
    // EndOfMatch embeds the scoreboard, but its voting buttons need pointer
    // events rather than the native gameplay/scoreboard-close touch route.
    // Read the panel as well as capture flags to cover the Show() frame before
    // the engine recalculates its aggregated Panorama input flags.
    state.mode = inGame && player && !gameUI && !buy && !s_teamMenu && !s_endOfMatch && ( !s_pointerUI || score )
        ? SourceTouchModeGameplay : SourceTouchModeMenu;
    state.active = state.mode == SourceTouchModeGameplay;
    state.game_input = s_gameInput;
    state.scoreboard_open = score;
    int width = 0, height = 0;
    engine->GetScreenSize( width, height );
    state.render_width = float( width );
    state.render_height = float( height );
    // These physical values are the verified target M5 iPad panel.  The native
    // module converts physical layout through current UIKit view dimensions.
    state.native_landscape_width_pixels = 2420.0f;
    state.native_density_ppi = 264.0f;

    CCSGO_Hud *hud = inGame ? CCSGO_Hud::GetInstance() : NULL;
    if ( hud && width > 0 && height > 0 )
    {
        panorama::IUIPanel *radar = hud->UIPanel()->FindChildTraverse( "HudRadar" );
        if ( radar ) radar = radar->FindChildTraverse( "Radar" );
        state.radar = PanelRect( radar, width, height );
        state.radar_valid = state.radar.width > 0 && state.radar.height > 0;
        state.score = PanelRect( hud->UIPanel()->FindChildTraverse( "HudTeamCounter" ), width, height );
        state.score_valid = state.score.width > 0 && state.score.height > 0;
    }

    SourceTouchWeapon weapons[64] = {};
    char names[64][256] = {};
    unsigned count = 0;
    if ( player )
    {
        C_BaseCombatWeapon *active = player->GetActiveWeapon();
        for ( int i = 0; i < player->WeaponCount() && count < 64; ++i )
        {
            C_BaseCombatWeapon *weapon = player->GetWeapon( i );
            if ( !weapon || !weapon->CanBeSelected() ) continue;
            const int slot = int( weapon->GetGearSlot() ) + 1;
            if ( slot < 1 || slot > 5 ) continue;
            SourceTouchWeapon &entry = weapons[count];
            entry.slot = slot;
            entry.entity_index = weapon->entindex();
            entry.subtype = weapon->GetSubType();
            entry.selected = weapon == active;
            const char *name = weapon->GetPrintName();
            const wchar_t *localized = name && g_pVGuiLocalize ? g_pVGuiLocalize->Find( name ) : NULL;
            if ( localized ) Q_UnicodeToUTF8( localized, names[count], sizeof( names[count] ) );
            else V_strncpy( names[count], name ? name : weapon->GetClassname(), sizeof( names[count] ) );
            entry.name_utf8 = names[count];
            ++count;
        }
    }
    state.weapons = weapons;
    state.weapon_count = count;
    const bool becameBlocked = s_state.game_input && !state.game_input;
    const bool leftGame = s_state.mode == SourceTouchModeGameplay && state.mode == SourceTouchModeMenu;
    if ( becameBlocked || leftGame ) ReleaseGameActions();
    s_state = state;
    // SourceTouchUpdateState copies inventory names during this call; its
    // native implementation must never retain the stack arrays above.
    SourceTouchUpdateState( &state );
    s_state.weapons = NULL;
    s_state.weapon_count = 0;
}

static void SetAction( int action, bool pressed )
{
    if ( action < 0 || action >= SourceTouchActionCount || !Button( action ) ) return;
    if ( pressed && !s_gameInput ) return;
    if ( pressed == s_held[action] ) return;
    if ( pressed ) KeyDown( Button( action ), KeyId( action ) );
    else
    {
        KeyUp( Button( action ), KeyId( action ) );
        if ( action == SourceTouchAttack ) in_cancel[GET_ACTIVE_SPLITSCREEN_SLOT()] = 0;
    }
    s_held[action] = pressed;
    s_touched[action] = true;
    ++s_actionEdges;
    if ( touch_input_debug.GetBool() )
        Msg( "I5_TOUCH action=%d pressed=%d\n", action, pressed ? 1 : 0 );
}

static void ToggleScoreboard()
{
    if ( !engine->IsInGame() || !CCSGO_Scoreboard::GetInstance() || !CCSGO_EndOfMatch::GetInstance() ) return;
    CCommand args;
    if ( ScoreboardOpen() )
    {
        args.Tokenize( "-showscores -55100" );
        IN_ScoreUp( args );
        s_scoreHeld = false;
    }
    else
    {
        args.Tokenize( "+showscores -55100" );
        IN_ScoreDown( args );
        s_scoreHeld = ScoreboardOpen();
    }
    PublishState();
}

static void SelectInventory( int entity, int subtype )
{
    if ( !s_gameInput ) return;
    C_CSPlayer *player = C_CSPlayer::GetLocalCSPlayer();
    if ( !player || !player->IsAllowedToSwitchWeapons() ) return;
    C_BaseCombatWeapon *owned = NULL;
    for ( int i = 0; i < player->WeaponCount(); ++i )
    {
        C_BaseCombatWeapon *weapon = player->GetWeapon( i );
        if ( weapon && weapon->entindex() == entity && weapon->GetSubType() == subtype )
        { owned = weapon; break; }
    }
    if ( !owned || !owned->CanBeSelected() ) return;
    // The overlay supplied an actual inventory entity, including whichever
    // grenade its slot cycle selected.  Use Source's public selection latch,
    // rather than inventing an entindex or selecting another slot member.
    ::input->MakeWeaponSelection( owned );
    if ( touch_input_debug.GetBool() )
        Msg( "I5_TOUCH select slot=%d entity=%d subtype=%d\n", int( owned->GetGearSlot() ) + 1, entity, subtype );
}

static void PumpEvents()
{
    if ( !s_initialized || s_pumping ) return;
    s_pumping = true;
    while ( s_read != s_write )
    {
        const Event event = s_events[s_read++ % kCapacity];
        if ( event.type != CommandEvent && event.type != WeaponEvent && event.type != ResetEvent && event.epoch != s_epoch ) continue;
        switch ( event.type )
        {
        case ResetEvent: ReleaseGameActions(); break;
        case ActionEvent: SetAction( event.code, event.value != 0 ); break;
        case MoveEvent:
            if ( s_gameInput )
            {
                s_moveX = clamp( event.x, -1.0f, 1.0f );
                s_moveY = clamp( event.y, -1.0f, 1.0f );
                const float square = s_moveX*s_moveX + s_moveY*s_moveY;
                if ( square > 1.0f ) { const float scale = 1.0f / sqrtf( square ); s_moveX *= scale; s_moveY *= scale; }
            }
            break;
        case LookEvent:
            if ( s_gameInput && s_lookCount < kCapacity )
            { LookSample sample = { event.x, event.y, event.timestamp }; s_look[s_lookCount++] = sample; }
            break;
        case WeaponEvent: SelectInventory( event.code, event.value ); break;
        case CommandEvent:
            ++s_commands;
            if ( event.code == SourceTouchScoreboard ) ToggleScoreboard();
            else if ( event.code == SourceTouchPause && enginevgui && engine->IsInGame() )
            {
                ReleaseGameActions();
                enginevgui->ActivateGameUI();
                PublishState();
            }
            else if ( event.code == SourceTouchBuy && s_gameInput )
            {
                // Dispatch the original registered buymenu command from
                // counterstrikeviewport.cpp.  It retains alive/demo, buy
                // period and buy zone checks; Panorama also calls CanPlayerBuy.
                ConCommand *buy = cvar ? cvar->FindCommand( "buymenu" ) : NULL;
                if ( buy )
                {
                    ReleaseGameActions();
                    CCommand args;
                    args.Tokenize( "buymenu" );
                    buy->Dispatch( args );
                    // The original panel maintains IsBuyMenuOpen.  Once open,
                    // PublishState selects Menu and SDL's original absolute
                    // pointer receives the following touches.
                    PublishState();
                }
                else Warning( "I5_TOUCH original buymenu command unavailable\n" );
            }
            else if ( s_gameInput && event.epoch == s_epoch && event.code == SourceTouchInspect )
            {
                // CCSPlayer::ClientCommand handles both edges. The original
                // FlashlightTurnOn fallback uses this same press/release pair:
                // release clears the hold without cancelling the animation.
                engine->ClientCmd_Unrestricted( "+lookatweapon\n-lookatweapon\n", true );
                ++s_inspectCommands;
            }
            else if ( s_gameInput && event.epoch == s_epoch && event.code == SourceTouchDrop )
            {
                // Keep the original server-side HandleDropWeapon restrictions
                // and deathmatch bonus-weapon behavior.
                engine->ClientCmd_Unrestricted( "drop\n", true );
                ++s_dropCommands;
            }
            if ( touch_input_debug.GetBool() ) Msg( "I5_TOUCH command=%d count=%u\n", event.code, s_commands );
            break;
        }
    }
    s_pumping = false;
}

static void ControllerMove( int slot, CUserCmd *cmd )
{
    if ( !s_initialized || slot != 0 ) return;
    PublishState();
    PumpEvents();
    if ( !s_gameInput ) { s_lookCount = 0; return; }
    cmd->forwardmove += s_moveY * ( s_moveY >= 0 ? cl_forwardspeed.GetFloat() : cl_backspeed.GetFloat() );
    cmd->sidemove += s_moveX * cl_sidespeed.GetFloat();
    if ( s_lookCount == 0 ) return;
    QAngle angles;
    engine->GetViewAngles( angles );
    view->StopPitchDrift();
    const float yawGain = touch_yaw_degrees_per_point.GetFloat();
    const float pitchGain = touch_pitch_degrees_per_point.GetFloat();
    for ( unsigned i = 0; i < s_lookCount; ++i )
    {
        const float yaw = -s_look[i].x * yawGain;
        const float pitch = s_look[i].y * pitchGain;
        angles[YAW] += yaw;
        angles[PITCH] += pitch;
        angles[PITCH] = clamp( angles[PITCH], -cl_pitchup.GetFloat(), cl_pitchdown.GetFloat() );
        s_yawTotal += yaw;
        s_pitchTotal += pitch;
        ++s_lookSamples;
    }
    s_lookCount = 0;
    engine->SetViewAngles( angles );
    if ( touch_input_debug.GetBool() )
        Msg( "I5_TOUCH look samples=%u yaw_delta_total=%.6f pitch_delta_total=%.6f view=%.6f %.6f\n",
            s_lookSamples, s_yawTotal, s_pitchTotal, angles[YAW], angles[PITCH] );
}

static void MergeDirectionBits( CUserCmd *cmd )
{
    if ( !s_gameInput ) return;
    if ( s_moveY > 0 ) cmd->buttons |= IN_FORWARD;
    else if ( s_moveY < 0 ) cmd->buttons |= IN_BACK;
    if ( s_moveX > 0 ) cmd->buttons |= IN_MOVERIGHT;
    else if ( s_moveX < 0 ) cmd->buttons |= IN_MOVELEFT;
}

static void RecordCommand( const CUserCmd *cmd, bool real )
{
    if ( !s_initialized ) return;
    if ( real )
    {
        s_lastCommand = *cmd;
        ++s_realCommands;
        // GetButtonBits(true) has consumed impulse-down for the real usercmd.
        for ( int a = 0; a < SourceTouchActionCount; ++a ) s_touched[a] = false;
    }
    else
    {
        s_lastExtraCommand = *cmd;
        ++s_extraCommands;
    }
}

static void FrameCallback( void * )
{
    if ( !s_initialized || !engine ) return;
    // This callback is registered with the main-thread SDL touch module.  It
    // may run in the menu, where no active CInput movement callback is issued.
    ACTIVE_SPLITSCREEN_PLAYER_GUARD( 0 );
    PublishState();
}

static void DiagnosticCommand( const CCommand & )
{
    if ( s_initialized && engine )
    {
        ACTIVE_SPLITSCREEN_PLAYER_GUARD( 0 );
        PublishState();
    }
    Msg( "I5_TOUCH_STATE ready=%d mode=%d active=%d game_input=%d score_open=%d queue=%u pending_look=%u edges=%u samples=%u resets=%u real_commands=%u extra_samples=%u gain=%.6f %.6f\n",
        s_initialized, int( s_state.mode ), s_state.active, s_gameInput, s_state.scoreboard_open,
        s_write-s_read, s_lookCount, s_actionEdges, s_lookSamples, s_resets,
        s_realCommands, s_extraCommands, touch_yaw_degrees_per_point.GetFloat(), touch_pitch_degrees_per_point.GetFloat() );
    Msg( "I5_TOUCH_USERCMD number=%d buttons=0x%x forward=%.6f side=%.6f up=%.6f view=%.6f %.6f %.6f weaponselect=%d subtype=%d yaw_delta_total=%.6f pitch_delta_total=%.6f\n",
        s_lastCommand.command_number, s_lastCommand.buttons, s_lastCommand.forwardmove,
        s_lastCommand.sidemove, s_lastCommand.upmove, s_lastCommand.viewangles[YAW],
        s_lastCommand.viewangles[PITCH], s_lastCommand.viewangles[ROLL],
        s_lastCommand.weaponselect, s_lastCommand.weaponsubtype, s_yawTotal, s_pitchTotal );
    Msg( "I5_TOUCH_EXTRA buttons=0x%x forward=%.6f side=%.6f view=%.6f %.6f\n",
        s_lastExtraCommand.buttons, s_lastExtraCommand.forwardmove, s_lastExtraCommand.sidemove,
        s_lastExtraCommand.viewangles[YAW], s_lastExtraCommand.viewangles[PITCH] );
    C_CSPlayer *player = engine && engine->IsInGame() ? C_CSPlayer::GetLocalCSPlayer() : NULL;
    C_BaseCombatWeapon *weapon = player ? player->GetActiveWeapon() : NULL;
    Msg( "I5_TOUCH_WEAPON inspect_commands=%u drop_commands=%u inspecting=%d inspect_held=%d active_entity=%d active_class=%s\n",
        s_inspectCommands, s_dropCommands, player && player->IsLookingAtWeapon(), player && player->IsHoldingLookAtWeapon(),
        weapon ? weapon->entindex() : 0, weapon ? weapon->GetClassname() : "none" );
    Msg( "I5_TOUCH_UI panorama_pointer=%d team_select=%d end_of_match=%d team=%d\n",
        s_pointerUI, s_teamMenu, s_endOfMatch, player ? player->GetTeamNumber() : -1 );
    Msg( "I5_TOUCH_HUD render=%.3f %.3f radar_valid=%d radar=%.3f %.3f %.3f %.3f score_valid=%d score=%.3f %.3f %.3f %.3f\n",
        s_state.render_width, s_state.render_height, s_state.radar_valid,
        s_state.radar.x, s_state.radar.y, s_state.radar.width, s_state.radar.height,
        s_state.score_valid, s_state.score.x, s_state.score.y, s_state.score.width, s_state.score.height );
    char native[16384];
    if ( SourceTouchCopyDiagnosticsJSON( native, sizeof( native ) ) )
        Msg( "I5_TOUCH_NATIVE %s\n", native );
}
static ConCommand i5_touch_state( "i5_touch_state", DiagnosticCommand,
    "Report actual native touch input, original CUserCmd and HUD anchors.", FCVAR_CLIENTCMD_CAN_EXECUTE );

static void LayoutEditorCommand( const CCommand & )
{
    ReleaseGameActions();
    SourceTouchOpenLayoutEditor();
}
static ConCommand i5_touch_layout( "i5_touch_layout", LayoutEditorCommand,
    "Open the native touch layout editor.", FCVAR_CLIENTCMD_CAN_EXECUTE );

static void SavePlayerName(const char *value)
{
    ConVarRef name("name");
    if (!name.IsValid()) return;
    name.SetValue(value);
    // Pass the nickname as data to the original USERINFO convar, never as
    // console command text. Its archive is written through the normal engine.
    if (engine) engine->ClientCmd_Unrestricted("host_writeconfig\n");
}
static void PlayerNameCommand(const CCommand &)
{
    ConVarRef name("name");
    ReleaseGameActions();
    SourceTouchEditPlayerName(name.IsValid() ? name.GetString() : "", SavePlayerName);
}
static ConCommand i5_player_name("i5_player_name", PlayerNameCommand,
    "Open the native player name editor.", FCVAR_CLIENTCMD_CAN_EXECUTE);

static void Initialize()
{
    SourceTouchCallbacks callbacks = {};
    callbacks.struct_size = sizeof( callbacks );
    callbacks.action = ActionCallback;
    callbacks.move = MoveCallback;
    callbacks.look = LookCallback;
    callbacks.command = CommandCallback;
    callbacks.weapon_select = WeaponCallback;
    callbacks.reset = ResetCallback;
    callbacks.frame = FrameCallback;
    s_initialized = true;
    SourceTouchSetCallbacks( &callbacks, NULL );
    Msg( "I5_TOUCH client ready: float ordered samples, linear gain, no acceleration\n" );
}

static void Shutdown()
{
    if ( !s_initialized ) return;
    ReleaseGameActions();
    if ( s_scoreHeld )
    {
        KeyUp( &in_score, "-55100" );
        s_scoreHeld = false;
    }
    SourceTouchState state = {};
    state.struct_size = sizeof( state );
    SourceTouchUpdateState( &state );
    SourceTouchSetCallbacks( NULL, NULL );
    s_initialized = false;
    s_read = s_write = s_lookCount = 0;
}
} // namespace I5Touch

// The host invokes this on the main Source thread before each engine frame.
// ControllerMove alone would never clear the overlay following disconnect.
extern "C" SOURCE_TOUCH_API void SourceTouchClientFrame()
{
    I5Touch::FrameCallback( NULL );
}

// Called by the UIKit startup host on the same main thread as Source.
// Read original panel and movie state; a host/engine-ready flag alone becomes
// true before the lobby finishes creating and laying out its Panorama UI.
extern "C" SOURCE_TOUCH_API bool SourceTouchSynchronizeVideoSettings()
{
    // The client's restart/optionsui ConVars are registered after the port's
    // early engine video-config read. Reuse the original reader now that all
    // those ConVars exist, keeping explicit values and deliberate AUTO keys.
    const bool loaded = UpdateVideoConfigConVars();
    if ( loaded ) Msg( "ICSM_VIDEO_SETTINGS_SYNC client restart/optionsui values loaded from saved video config\n" );
    I5Touch::ApplyFrameRateLimit( I5Touch::icsm_fps_limit.GetInt() );
    return loaded;
}

extern "C" SOURCE_TOUCH_API size_t SourceTouchVideoStateJSON(char *buffer,size_t capacity)
{
    const char *names[]={"fps_max","fps_max_menu","mat_powersavingsmode","cpu_level","gpu_level","gpu_mem_level","csm_quality_level","mat_vsync","icsm_scene_render_percent","icsm_fps_limit","icsm_metal_spatial_upscale"};
    float values[ARRAYSIZE(names)]={};
    for(size_t i=0;i<ARRAYSIZE(names);++i) {
        ConVarRef ref(names[i]);if(!ref.IsValid())return 0;values[i]=ref.GetFloat();
    }
    const MaterialSystem_Config_t &config=materials->GetCurrentConfigForVideoCard();
    int length=V_snprintf(buffer,capacity,"{\"fps_max\":%g,\"fps_max_menu\":%g,\"mat_powersavingsmode\":%g,\"cpu_level\":%g,\"gpu_level\":%g,\"gpu_mem_level\":%g,\"csm_quality_level\":%g,\"mat_vsync\":%g,\"scene_render_percent\":%g,\"fps_limit\":%g,\"metal_spatial_upscale\":%g,\"fullscreen\":%s,\"borderless\":%s,\"fullscreen_locked\":true}",
        values[0],values[1],values[2],values[3],values[4],values[5],values[6],values[7],values[8],values[9],values[10],
        config.Windowed()?"false":"true",config.NoWindowBorder()?"true":"false");
    return length>0 && size_t(length)<capacity?size_t(length):0;
}

extern "C" SOURCE_TOUCH_API bool SourceTouchMainMenuReady()
{
    CCSGO_MainMenu *menu = CCSGO_MainMenu::GetInstance();
    panorama::IUIPanel *root = menu ? menu->UIPanel() : NULL;
    panorama::IUIWindow *window = root ? root->GetParentWindow() : NULL;
    panorama::IUIPanel *play = root ? root->FindChildTraverse( "MainMenuNavBarPlay" ) : NULL;
    panorama::IUIPanel *moviePanel = root ? root->FindChildTraverse( "MainMenuMovie" ) : NULL;
    uint32 width = 0, height = 0;
    if ( moviePanel && moviePanel->ClientPtr() )
    {
        panorama::CMoviePlayer *movie = static_cast<panorama::CMoviePlayer *>( moviePanel->ClientPtr() );
        panorama::CVideoPlayerPtr video = movie->GetMovie();
        if ( video.Get() ) video->GetTextureSize( width, height );
    }
    const bool stateReady = engine && !engine->IsInGame() && GameUI().GetGameUIState() == CSGO_GAME_UI_STATE_MAINMENU;
    const bool rootVisible = root && root->BIsVisible();
    const bool rootReady = root && root->BReadyForDisplay();
    const bool updated = root && !root->BHasClass( "InitialDisplay" );
    const bool windowVisible = window && window->BIsVisible();
    const bool playVisible = play && play->BIsVisible();
    const bool playReady = play && play->BReadyForDisplay();
    const bool playLayout = play && play->GetActualLayoutWidth() > 0 && play->GetActualLayoutHeight() > 0;
    const bool movieReady = width > 0 && height > 0;
    const unsigned flags = stateReady | ( rootVisible << 1 ) | ( rootReady << 2 ) | ( updated << 3 ) |
        ( windowVisible << 4 ) | ( playVisible << 5 ) | ( playReady << 6 ) | ( playLayout << 7 ) | ( movieReady << 8 );
    static unsigned lastFlags = ~0u;
    if ( flags != lastFlags )
    {
        lastFlags = flags;
        Msg( "ICSM_LOBBY_STATE state=%d root_visible=%d root_ready=%d updated=%d window_visible=%d play_visible=%d play_ready=%d play_layout=%d movie=%ux%u\n",
            stateReady, rootVisible, rootReady, updated, windowVisible, playVisible, playReady, playLayout, width, height );
    }
    // InitialDisplay is a legacy class cleared only by MainMenu::Update();
    // this source tree has no caller for that method. Actual ready panels,
    // nonzero layout and the uploaded movie texture are the completion gates.
    return stateReady && rootVisible && rootReady && windowVisible &&
        playVisible && playReady && playLayout && movieReady;
}
