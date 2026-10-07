// Availability describes this accountless build. No online account data is
// synthesized. Local settings and map launch come from the native Source APIs.
var NativeOfflineUI = {
    Unavailable: function () {
        UiToolkitAPI.ShowGenericPopupOk('离线模式', '此原生版本提供本地地图与机器人对战；本地基础武器库存可用；Steam、官方匹配和在线服务不可用。', '', function () {});
    }
};
var LobbyAPI = {
    IsSessionActive: function () { return NativeOfflineAPI.IsSessionActive(); },
    CreateSession: function () { NativeOfflineAPI.CreateSession(); },
    GetSessionSettings: function () { return NativeOfflineAPI.GetSessionSettings(); },
    UpdateSessionSettings: function (settings) { NativeOfflineAPI.UpdateSessionSettings(settings); },
    BIsHost: function () { return NativeOfflineAPI.IsSessionActive(); },
    StartMatchmaking: function () { return NativeOfflineAPI.StartLocalMatch(); },
    StopMatchmaking: function () {}, // Local launch has no matchmaking queue.
    GetMatchmakingStatusString: function () { return ''; },
    GetTimeSpentMatchmaking: function () { return 0; },
    GetMapWaitTimeInSeconds: function () { return 0; }
};
var GameTypesAPI = {
    GetConfig: function () { return NativeOfflineAPI.GetConfig(); },
    GetSkirmishName: function (id) {
        var token = NativeOfflineAPI.GetSkirmishName(Number(id));
        return token ? '#' + token : '';
    },
    GetSkirmishInternalName: function (id) { return NativeOfflineAPI.GetSkirmishInternalName(Number(id)); },
    // Preserve the original voting script's API spelling.
    GetSkrimishIcon: function (id) { return NativeOfflineAPI.GetSkirmishIcon(Number(id)); },
    GetSkirmishIdFromInternalName: function (name) { return NativeOfflineAPI.GetSkirmishIdFromInternalName(name); },
    GetFriendlyMapName: function (map) { return $.Localize(GameStateAPI.GetMapDisplayNameToken(map)); },
    GetGameModeType: function (mode) {
        var types = NativeOfflineAPI.GetConfig().gameTypes;
        for (var type in types)
            if (types[type].gameModes.hasOwnProperty(mode)) return type;
        return '';
    },
    GetMapGroupAttribute: function (group, key) {
        var entry = NativeOfflineAPI.GetConfig().mapgroups[group];
        return entry && entry[key] !== undefined ? entry[key] : '';
    },
    SetCustomBotDifficulty: function (value) { return NativeOfflineAPI.SetCustomBotDifficulty(Number(value)); },
    GetCustomBotDifficulty: function () { return NativeOfflineAPI.GetCustomBotDifficulty(); }
};
var MyPersonaAPI = {
    GetLauncherType: function () { return 'native-offline'; },
    // The original Wingman tab hints an online rank fetch before applying
    // local session settings. This accountless build has no ranks to fetch.
    HintLoadPipRanks: function () {},
    IsInventoryValid: function () { return false; },
    IsConnectedToGC: function () { return false; },
    GetMyOfficialTeamName: function () { return ''; },
    GetMyOfficialTournamentName: function () { return ''; },
    GetName: function () { return NativeOfflineAPI.GetPlayerName(); },
    GetXuid: function () { return NativeOfflineAPI.GetLocalPlayerId(); }
};
var PartyListAPI = {
    GetLocalPlayerForHireAdvertising: function () { return ''; },
    GetCount: function () { return 0; },
    GetPartySystemSetting: function () { return ''; },
    GetPartyMemberSetting: function (id, key) {
        if (key === 'game/teamcolor') {
            var value = NativeOfflineAPI.GetPlayerTeamColor(id);
            return value >= 0 ? String(value) : '';
        }
        return '';
    },
    GetFriendIsTalking: function () { return false; }
};
var CompetitiveMatchAPI = { HasOngoingMatch: function () { return false; } };
var SteamOverlayAPI = { IsEnabled: function () { return false; }, OpenURL: NativeOfflineUI.Unavailable };
// The original workshop picker calls these subscription-shaped methods. Here
// they enumerate only maps shipped locally, with no Steam account or requests.
var WorkshopAPI = {
    GetNumSubscribedMaps: function () { return NativeWorkshopAPI.GetMaps().length; },
    GetSubscribedMapID: function (index) {
        var map = NativeWorkshopAPI.GetMaps()[index];
        return map ? map.id : '';
    },
    GetWorkshopMapInfo: function (id) {
        var maps = NativeWorkshopAPI.GetMaps();
        for (var i = 0; i < maps.length; ++i)
            if (maps[i].id === id) return maps[i];
        return null;
    }
};
var MatchStatsAPI = {
    GetUiExperienceType: function () { return ''; },
    IsConnectedToCommunityServer: function () { return false; },
    IsTournamentMatch: function () { return NativeOfflineAPI.IsTournamentMatch(); },
    GetPlayerStatsJSO: function (id) { return NativeOfflineAPI.GetPlayerStats(id); },
    DoesSupportOvertimeStats: function () { return false; }, // Replicated totals have no separate overtime buckets.
    GetServerWebsiteURL: function () { return ''; } // This local server has no website.
};
