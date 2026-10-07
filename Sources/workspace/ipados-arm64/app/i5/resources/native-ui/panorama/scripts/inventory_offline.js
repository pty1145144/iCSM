var OfflineInventory = (function () {
    var team = 3;
    var category = 'secondary';
    var page = 'weapons';
    var selectedItem = null;
    var skins = [];
    var pendingSkin = null;
    var skinPage = 0;
    var pageSize = 12;
    var saving = false;
    function Root() { return $.GetContextPanel(); }
    function Find(id) { return Root().FindChildInLayoutFile(id); }
    function Name(value) { return value && value.charAt(0) === '#' ? $.Localize(value) : value; }
    function Status(value) { Find('OfflineInventoryStatus').text = value; }
    function UpdateSelection() {
        if (!pendingSkin) return;
        Find('OfflineSkinWeaponImage').SetImage(pendingSkin.image);
        Find('OfflineSkinSelectionName').text = Name(pendingSkin.name);
        Find('OfflineSkinConfirm').enabled = !saving;
        skins.slice(skinPage * pageSize, (skinPage + 1) * pageSize).forEach(function (skin) {
            var card = Find('OfflineSkinChoices').FindChildTraverse('OfflineSkin' + skin.paint);
            if (!card) return;
            var pending = skin.paint === pendingSkin.paint;
            card.SetHasClass('equipped', pending);
            card.FindChildTraverse('OfflineSkinLabel' + skin.paint).text = pending ?
                '✓ 待确认' : (skin.selected ? '已保存的外观' : '点击预览');
        });
    }
    function DrawSkinPage() {
        var choices = Find('OfflineSkinChoices');
        choices.RemoveAndDeleteChildren();
        var pages = Math.max(1, Math.ceil(skins.length / pageSize));
        skinPage = Math.max(0, Math.min(skinPage, pages - 1));
        Find('OfflineSkinPageNumber').text = (skinPage + 1) + ' / ' + pages;
        Find('OfflineSkinPrevious').enabled = skinPage > 0;
        Find('OfflineSkinNext').enabled = skinPage + 1 < pages;
        skins.slice(skinPage * pageSize, (skinPage + 1) * pageSize).forEach(function (skin) {
            var card = $.CreatePanel('Button', choices, 'OfflineSkin' + skin.paint);
            card.AddClass('offline-skin-card');
            var image = $.CreatePanel('Image', card, '');
            image.AddClass('offline-skin-image'); image.SetImage(skin.image); image.hittest = false;
            var name = $.CreatePanel('Label', card, '');
            name.AddClass('offline-skin-name'); name.text = Name(skin.name); name.hittest = false;
            var label = $.CreatePanel('Label', card, 'OfflineSkinLabel' + skin.paint);
            label.AddClass('offline-inventory-equipped'); label.hittest = false;
            card.SetPanelEvent('onactivate', function () {
                pendingSkin = skin;
                UpdateSelection();
                Status('已预览 ' + Name(skin.name) + ' · 点击右下角确认后保存');
            });
        });
        UpdateSelection();
    }
    function OpenSkins(item) {
        selectedItem = item;
        skins = NativeInventoryAPI.GetSkins(team, item.definition) || [];
        pendingSkin = null;
        skins.forEach(function (skin) { if (skin.selected) pendingSkin = skin; });
        if (!pendingSkin) pendingSkin = skins[0];
        skinPage = 0;
        skins.forEach(function (skin, i) {
            if (pendingSkin && skin.paint === pendingSkin.paint) skinPage = Math.floor(i / pageSize);
        });
        Root().SetHasClass('skins-page', true);
        Find('OfflineInventoryItems').RemoveAndDeleteChildren();
        Find('OfflineInventoryTitle').text = Name(item.name) + ' · 选择皮肤';
        Find('OfflineSkinTeam').text = (team === 3 ? '反恐精英' : '恐怖分子') + ' · ' + Name(item.name);
        Find('OfflineSkinHint').text = '共 ' + skins.length + ' 种外观 · 点击皮肤查看预览，确认后保存并装备。';
        DrawSkinPage();
        Status('选择 ' + Name(item.name) + ' 的外观');
    }
    function CloseSkins() {
        selectedItem = null;
        pendingSkin = null;
        skins = [];
        Find('OfflineSkinChoices').RemoveAndDeleteChildren();
        Find('OfflineSkinWeaponImage').SetImage('');
        Root().SetHasClass('skins-page', false);
    }
    function Refresh() {
        if (selectedItem) return;
        var list = Find('OfflineInventoryItems');
        if (!list) return;
        Root().SetHasClass('skins-page', false);
        Find('OfflineInventoryTitle').text = '库存 · 离线装备';
        list.RemoveAndDeleteChildren();
        var items = NativeInventoryAPI.GetInventory(team) || [];
        items.sort(function (a, b) { return a.slot - b.slot || b.equipped - a.equipped || a.definition - b.definition; });
        items.forEach(function (item) {
            if (item.category !== (page === 'knives' ? 'melee' : category)) return;
            var card = $.CreatePanel('Button', list, 'OfflineItem' + item.definition);
            card.AddClass('offline-inventory-card');
            card.SetHasClass('equipped', item.equipped === 1);
            var image = $.CreatePanel('Image', card, '');
            image.AddClass('offline-inventory-image'); image.SetImage(item.image); image.hittest = false;
            var name = $.CreatePanel('Label', card, '');
            name.AddClass('offline-inventory-name'); name.text = Name(item.name); name.hittest = false;
            var label = $.CreatePanel('Label', card, '');
            label.AddClass('offline-inventory-equipped');
            label.text = item.equipped ? '✓ 已装备 · ' + Name(item.skin_name) : Name(item.skin_name);
            label.hittest = false;
            card.SetPanelEvent('onactivate', function () { OpenSkins(item); });
        });
    }
    function Confirm() {
        if (!selectedItem || !pendingSkin || saving) return;
        saving = true;
        Find('OfflineSkinConfirm').enabled = false;
        var itemName = Name(selectedItem.name), skinName = Name(pendingSkin.name);
        var success = NativeInventoryAPI.EquipSkin(team, selectedItem.definition, pendingSkin.paint);
        saving = false;
        if (success) {
            CloseSkins();
            Refresh();
            Status('已装备 ' + itemName + ' · ' + skinName + ' · 已保存到本机');
        } else {
            UpdateSelection();
            Status('保存失败，选择尚未应用，请重试');
        }
    }
    function ChangeSkinPage(delta) {
        if (!selectedItem) return;
        skinPage += delta;
        DrawSkinPage();
    }
    function SetTeam(value) { CloseSkins(); team = value; Refresh(); }
    function SetCategory(value) { CloseSkins(); category = value; Refresh(); }
    function Back() { CloseSkins(); Refresh(); Status('离线装备 · 无需联网'); }
    function SetPage(value) {
        CloseSkins(); page = value;
        Root().SetHasClass('knives-page', page === 'knives');
        Find('OfflineInventoryHint').text = page === 'knives' ?
            '点击刀具选择皮肤，再点击右下角确认。CT 与 T 可分别装备，下次出生生效。' :
            '点击武器选择皮肤，再点击右下角确认。后续出生配枪与购买时生效。';
        Status('离线装备 · 无需联网');
        Refresh();
    }
    return { Refresh: Refresh, SetTeam: SetTeam, SetCategory: SetCategory, SetPage: SetPage,
        Back: Back, Confirm: Confirm, ChangeSkinPage: ChangeSkinPage };
})();
(function () {
    $('#OfflineInventoryCT').checked = true;
    $('#OfflineInventorySecondary').checked = true;
    $('#OfflineInventoryWeaponsPage').checked = true;
    $.RegisterForUnhandledEvent('MainMenuTabShown', function (tab) {
        if (tab === 'JsInventory') OfflineInventory.Refresh();
    });
    OfflineInventory.Refresh();
})();
