'use strict';
var ICSMProfile = (function () {
    var running = false;
    function update() {
        var label = $('#ICSMProfileName');
        if (!label || !label.IsValid()) { running = false; return; }
        var name = MyPersonaAPI.GetName();
        if (label.text !== name) label.text = name;
        $.Schedule(0.5, update);
    }
    return { Init: function () { if (!running) { running = true; update(); } } };
})();
