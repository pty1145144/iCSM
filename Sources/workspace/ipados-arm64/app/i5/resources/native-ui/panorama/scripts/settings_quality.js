'use strict';
var ICSMQualitySettings = (function () {
    var running = false;
    var previousTier = -1, previousFPS = -1, previousFG = -1;
    function refresh() {
        var root = $.GetContextPanel();
        if (!root || !root.IsValid()) return false;
        for (var ancestor = root; ancestor; ancestor = ancestor.GetParent())
            if (!ancestor.visible) return true;
        var tier = Number(GameInterfaceAPI.GetSettingString('icsm_quality_preset'));
        var fps = Number(GameInterfaceAPI.GetSettingString('icsm_fps_limit'));
        var requested = Number(GameInterfaceAPI.GetSettingString('icsm_metal_frame_interpolation'));
        if (tier === previousTier && fps === previousFPS && requested === previousFG) return true;
        previousTier = tier; previousFPS = fps; previousFG = requested;
        ['VeryLow', 'Low', 'Medium', 'High'].forEach(function (name, index) {
            var button = root.FindChildTraverse('ICSMQuality' + name);
            if (button) button.SetHasClass('ICSMQualityTierSelected', tier === index);
        });
        var limit = root.FindChildTraverse('ICSMFrameRateLimit');
        var fg = root.FindChildTraverse('ICSMFrameInterpolation');
        if (limit) { limit.enabled = tier !== 0; limit.OnShow(); }
        if (fg) { fg.enabled = fps === 60; fg.OnShow(); }
        var note = root.FindChildTraverse('ICSMQualityFrameNote');
        if (note) note.text = tier === 0 ? '极低档固定基础60帧；切换回其他档位恢复此前帧率选择。' : '基础帧率可选60／90／120帧。';
        return true;
    }
    function update() {
        if (!refresh()) { running = false; return; }
        $.Schedule(0.5, update);
    }
    return {
        Init: function () { if (!running) { running = true; update(); } },
        Select: function (tier) {
            if (tier < 0 || tier > 3) return;
            // The ConVar callback applies the recipe once. A second explicit
            // apply would enqueue the same video-mode transition twice.
            GameInterfaceAPI.ConsoleCommand('icsm_quality_preset ' + tier + '; host_writeconfig');
            $.Schedule(0.1, refresh);
        }
    };
})();
