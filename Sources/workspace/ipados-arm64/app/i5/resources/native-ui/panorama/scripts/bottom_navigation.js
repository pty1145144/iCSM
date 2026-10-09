'use strict';
var ICSMBottomNavigation = (function () {
    var running = false;

    function fpsEnabled() {
        return Number(GameInterfaceAPI.GetSettingString('net_graph')) > 0;
    }

    function refresh() {
        var button = $('#MainMenuNavBarFPS');
        if (!button || !button.IsValid()) return false;
        var enabled = fpsEnabled();
        button.SetHasClass('icsm-fps-enabled', enabled);
        var dismiss = $('#ICSMFPSDismiss');
        if (dismiss && dismiss.IsValid()) dismiss.SetHasClass('hidden', !enabled);

        // net_graphheight is measured in surface pixels. Panorama's actual
        // UI scale converts the bottom bar's 1080p layout to the same units.
        // Reserve the 168px bar/margin plus space for the original four rows.
        var scale = $.GetContextPanel().actualuiscale_y;
        if (enabled && scale > 0) {
            var height = Math.max(64, Math.ceil(320 * scale));
            if (Number(GameInterfaceAPI.GetSettingString('net_graphheight')) !== height)
                GameInterfaceAPI.SetSettingString('net_graphheight', String(height));
        }
        return true;
    }

    function update() {
        if (!refresh()) { running = false; return; }
        $.Schedule(0.5, update);
    }

    function setFPS(enabled) {
        UiToolkitAPI.HideTextTooltip();
        GameInterfaceAPI.SetSettingString('net_graph', enabled ? '1' : '0');
        refresh();
        // The original setter does not write archived ConVars to disk.
        GameInterfaceAPI.ConsoleCommand('host_writeconfig');
    }

    return {
        Init: function () { if (!running) { running = true; update(); } },
        ToggleFPS: function () { setFPS(!fpsEnabled()); },
        CloseFPS: function () { if (fpsEnabled()) setFPS(false); },
        ShowFPSTooltip: function () {
            UiToolkitAPI.ShowTextTooltip('MainMenuNavBarFPS', fpsEnabled() ? 'FPS display: On' : 'FPS display: Off');
        }
    };
})();
