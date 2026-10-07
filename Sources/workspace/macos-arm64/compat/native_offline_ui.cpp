// Local Panorama bridge for components absent from the 2019 source release.
// Gameplay and session transitions are performed by the original interfaces.
#include "cbase.h"
#include "uicomponents/uicomponent_common.h"
#include "panorama/csgo_panorama_script_bindings.h"
#include "gametypes/igametypes.h"
#include "matchmaking/imatchframework.h"
#include "filesystem.h"
#include "uicomponents/uicomponent_gamestate.h"
#include "cs_gamerules.h"

DECLARE_PANORAMA_EVENT0( QueueConnectToServer );
DEFINE_PANORAMA_EVENT( QueueConnectToServer );
DECLARE_PANORAMA_EVENT1( PanoramaComponent_Lobby_MatchmakingSessionUpdate, const char * );
DEFINE_PANORAMA_EVENT( PanoramaComponent_Lobby_MatchmakingSessionUpdate );

class CNativeOfflineUI
{
public:
    void JSRegisterFunc();
    bool IsSessionActive() { return g_pMatchFramework && g_pMatchFramework->GetMatchSession(); }
    const char *GetPlayerName() { ConVarRef name( "name" ); return name.IsValid() ? name.GetString() : ""; }
    void CreateSession()
    {
        if ( IsSessionActive() ) return;
        KeyValues::AutoDelete settings( new KeyValues( "settings" ) );
        settings->SetString( "system/network", "offline" );
        settings->SetString( "system/access", "private" );
        settings->SetString( "options/action", "custommatch" );
        settings->SetString( "options/server", "listen" );
        settings->SetString( "game/type", "classic" );
        settings->SetString( "game/mode", "competitive" );
        settings->SetString( "game/mapgroupname", "mg_de_dust2" );
        g_pMatchFramework->CreateSession( settings );
    }
    void GetSessionSettings( const v8::FunctionCallbackInfo<v8::Value>& info )
    {
        CreateSession();
        if ( IMatchSession *session = g_pMatchFramework->GetMatchSession() )
            info.GetReturnValue().Set( JSObjectFromKeyValues( info.GetIsolate(), session->GetSessionSettings() ) );
    }
    void UpdateSessionSettings( JSObjectAsKeyValues settings )
    {
        CreateSession();
        if ( !static_cast<KeyValues *>( settings ) ) return;
        // No public/network transition is supported by this local build.
        if ( KeyValues *update = settings->FindKey( "update" ) )
        {
            update->SetString( "system/network", "offline" );
            update->SetString( "system/access", "private" );
            update->SetString( "options/server", "listen" );
        }
        if ( IMatchSession *session = g_pMatchFramework->GetMatchSession() )
            session->UpdateSessionSettings( settings );
    }
    bool StartLocalMatch()
    {
        CreateSession();
        IMatchSession *session = g_pMatchFramework->GetMatchSession();
        if ( !session ) return false;
        KeyValues *settings = session->GetSessionSettings();
        const char *groups = settings->GetString( "game/mapgroupname" );
        char group[256];
        Q_strncpy( group, groups, sizeof( group ) );
        if ( char *comma = strchr( group, ',' ) ) *comma = 0;
        // Original play-menu JS already chooses a map for random_* groups.
        CUtlString selectedMap;
        if ( !Q_strncmp( group, "random_", 7 ) )
        {
            selectedMap = settings->GetString( "game/map" );
            Q_snprintf( group, sizeof( group ), "mg_%s", selectedMap.String() );
            if ( !g_pGameTypes->IsValidMapInMapGroup( group, selectedMap.String() ) )
                selectedMap = "";
        }
        else
            selectedMap = g_pGameTypes->GetFirstMap( group );
        const char *map = selectedMap.String();
        if ( !map || !*map ) { Warning( "Native offline UI: no map in group '%s'\n", group ); return false; }
        KeyValues::AutoDelete update( new KeyValues( "settings" ) );
        update->SetString( "update/game/map", map );
        update->SetString( "update/game/mapgroupname", group );
        session->UpdateSessionSettings( update );
        Msg( "Native offline UI: starting %s (%s/%s) through CMatchSessionOfflineCustom\n", map,
             settings->GetString( "game/type" ), settings->GetString( "game/mode" ) );
        panorama::DispatchEvent( QueueConnectToServer(), nullptr );
        KeyValues::AutoDelete command( new KeyValues( "StartListenServer" ) );
        command->SetBool( "panorama", true );
        session->Command( command );
        return true;
    }
    void GetConfig( const v8::FunctionCallbackInfo<v8::Value>& info )
    {
        KeyValues::AutoDelete config( new KeyValues( "GameModes.txt" ) );
        if ( !config->LoadFromFile( filesystem, "gamemodes.txt", "GAME" ) )
        {
            info.GetIsolate()->ThrowException( v8::Exception::Error( v8::String::NewFromUtf8Literal( info.GetIsolate(), "Cannot read original gamemodes.txt" ) ) );
            return;
        }
        info.GetReturnValue().Set( JSObjectFromKeyValues( info.GetIsolate(), config ) );
    }
    bool SetCustomBotDifficulty( int difficulty ) { return g_pGameTypes->SetCustomBotDifficulty( difficulty ); }
    int GetCustomBotDifficulty() { return g_pGameTypes->GetCustomBotDifficulty(); }
    const char *GetLocalPlayerId() { return CUiComponent_GameState::GetInstance()->GetLocalPlayerXuid(); }
    bool IsTournamentMatch() { return CSGameRules() && *CSGameRules()->GetTournamentEventName(); }
    int GetPlayerTeamColor( const char *id )
    {
        int index = CUiComponent_GameState::GetInstance()->GetPlayerIndex( id );
        return GetCSResources() && index ? GetCSResources()->GetCompTeammateColor( index ) : -1;
    }
    void GetPlayerStats( const v8::FunctionCallbackInfo<v8::Value>& info )
    {
        if ( !info.Length() || !info[0]->IsString() || !GetCSResources() ) return;
        v8::String::Utf8Value id( info.GetIsolate(), info[0] );
        int index = CUiComponent_GameState::GetInstance()->GetPlayerIndex( *id );
        if ( !index ) return;
        auto *resource = GetCSResources();
        auto object = v8::Object::New( info.GetIsolate() );
        CreateJSOEntry_Number( object, "3k", resource->m_iMatchStats_3k_Total[index] );
        CreateJSOEntry_Number( object, "4k", resource->m_iMatchStats_4k_Total[index] );
        CreateJSOEntry_Number( object, "5k", resource->m_iMatchStats_5k_Total[index] );
        CreateJSOEntry_Number( object, "utilitydamage", resource->m_iMatchStats_UtilityDamage_Total[index] );
        CreateJSOEntry_Number( object, "enemiesflashed", resource->m_iMatchStats_EnemiesFlashed_Total[index] );
        int kills = resource->m_iMatchStats_Kills_Total[index];
        int deaths = resource->m_iMatchStats_Deaths_Total[index];
        int rounds = CSGameRules() ? CSGameRules()->GetTotalRoundsPlayed() : 0;
        // Scoreboard's existing JS expects K/D times 100 and integer percentages.
        CreateJSOEntry_Number( object, "kdr", 100 * kills / Max( deaths, 1 ) );
        CreateJSOEntry_Number( object, "hsp", kills ? 100 * resource->m_iMatchStats_HeadShotKills_Total[index] / kills : 0 );
        CreateJSOEntry_Number( object, "adr", rounds ? resource->m_iMatchStats_Damage_Total[index] / rounds : 0 );
        info.GetReturnValue().Set( object );
    }
};

PANORAMA_COMPONENT_API_DEF_BEGIN( CNativeOfflineUI )
    PANORAMA_COMPONENT_FUNCTION_API_DEF( bool, IsSessionActive, CNativeOfflineUI )
    PANORAMA_COMPONENT_FUNCTION_API_DEF( const char *, GetPlayerName, CNativeOfflineUI )
    PANORAMA_COMPONENT_FUNCTION_API_DEF( void, CreateSession, CNativeOfflineUI )
    PANORAMA_COMPONENT_FUNCTION_RAW_API_DEF( void, GetSessionSettings, CNativeOfflineUI )
    PANORAMA_COMPONENT_FUNCTION_API_DEF( void, UpdateSessionSettings, CNativeOfflineUI )
    PANORAMA_COMPONENT_FUNCTION_API_DEF( bool, StartLocalMatch, CNativeOfflineUI )
    PANORAMA_COMPONENT_FUNCTION_RAW_API_DEF( void, GetConfig, CNativeOfflineUI )
    PANORAMA_COMPONENT_FUNCTION_API_DEF( bool, SetCustomBotDifficulty, CNativeOfflineUI )
    PANORAMA_COMPONENT_FUNCTION_API_DEF( int, GetCustomBotDifficulty, CNativeOfflineUI )
    PANORAMA_COMPONENT_FUNCTION_API_DEF( const char *, GetLocalPlayerId, CNativeOfflineUI )
    PANORAMA_COMPONENT_FUNCTION_API_DEF( bool, IsTournamentMatch, CNativeOfflineUI )
    PANORAMA_COMPONENT_FUNCTION_API_DEF( int, GetPlayerTeamColor, CNativeOfflineUI )
    PANORAMA_COMPONENT_FUNCTION_RAW_API_DEF( void, GetPlayerStats, CNativeOfflineUI )
PANORAMA_COMPONENT_API_DEF_END( CNativeOfflineUI )

void InstallNativeOfflinePanoramaBindings()
{
    static CNativeOfflineUI local;
    PANORAMA_COMPONENT_API_INSTALL( CNativeOfflineUI, &local, "NativeOfflineAPI", "Native local sessions; online services unavailable" );
}
