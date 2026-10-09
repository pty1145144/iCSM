'use strict';
var ICSMProfile = (function () {
    var running = false;
    var displayedName = null;
    function update() {
        var label = $('#ICSMProfileName');
        if (!label || !label.IsValid()) { running = false; return; }
        var name = String(MyPersonaAPI.GetName() || '');
        // CLabel::SetTextInternal invalidates text layout even for identical
        // content. Cache the source name instead of comparing rendered text.
        if (name !== displayedName && name.length > 0) {
            label.text = name;
            displayedName = name;
        }
        $.Schedule(0.5, update);
    }
    return { Init: function () { if (!running) { running = true; update(); } } };
})();
