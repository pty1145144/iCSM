var OfflineInventory = (function () {
    var team = 3, category = 'all', selectedItem = null;
    var inventory = [], skins = [], pendingSkin = null, skinPage = 0;
    var pageSize = 12, saving = false, status = '';
    var categories = [
        ['all', '全部'], ['secondary', '手枪'], ['smg', '冲锋枪'], ['rifle', '步枪'],
        ['sniper', '狙击枪'], ['shotgun', '霰弹枪'], ['machinegun', '机枪'], ['melee', '刀具']
    ];
    function Root() { return $.GetContextPanel(); }
    function Find(id) { return Root().FindChildInLayoutFile(id); }
    function Name(value) { return value && value.charAt(0) === '#' ? $.Localize(value) : value; }
    function Eligible(item, value) { return !!item.teams[value]; }
    function Variant(item, value) { return item.teams[value] || item.teams[3] || item.teams[2]; }
    function SharedGun(item) { return item.kind !== 'melee' && Eligible(item, 3) && Eligible(item, 2); }
    function FindItem(definition) {
        for (var i = 0; i < inventory.length; ++i) if (inventory[i].definition === definition) return inventory[i];
        return null;
    }
    function InventoryRow(item, value, side) {
        var row = Variant(item, value), ct = item.teams[3], t = item.teams[2];
        return { id: side ? 'OfflineKnife' + (side === 3 ? 'CT' : 'T') + item.definition : 'OfflineItem' + item.definition,
            definition: item.definition, name: item.name, kind: item.kind, image: row.image, paint: row.paint,
            subtitle: Name(row.skin_name), ct: !!ct, t: !!t, side: side || 0,
            equipped_ct: !!(ct && ct.equipped), equipped_t: !!(t && t.equipped),
            ct_action: 'OfflineEquipCT' + item.definition, t_action: 'OfflineEquipT' + item.definition };
    }
    function InventoryRows() {
        var rows = [];
        if (category === 'melee') {
            var ct = [], t = [];
            inventory.forEach(function (item) {
                if (item.kind !== 'melee') return;
                if (Eligible(item, 3)) ct.push(InventoryRow(item, 3, 3));
                if (Eligible(item, 2)) t.push(InventoryRow(item, 2, 2));
            });
            // Keep CT in the left column and T in the right even if a later
            // schema adds a team-only knife. Empty cells retain that alignment.
            for (var i = 0; i < Math.max(ct.length, t.length); ++i) {
                rows.push(ct[i] || { placeholder: true, side: 3 });
                rows.push(t[i] || { placeholder: true, side: 2 });
            }
        } else inventory.forEach(function (item) {
            if (category === 'all' || item.kind === category) rows.push(InventoryRow(item, team, 0));
        });
        return rows;
    }
    function Status(value) { status = value; Find('OfflineInventoryStatus').text = value; Publish(); }
    function ReadInventory() {
        var byDefinition = {};
        [3, 2].forEach(function (value) {
            (NativeInventoryAPI.GetInventory(value) || []).forEach(function (row) {
                var item = byDefinition[row.definition];
                if (!item) item = byDefinition[row.definition] = {
                    definition: row.definition, kind: row.kind, name: Name(row.name), teams: {}
                };
                item.teams[value] = row;
            });
        });
        inventory = Object.keys(byDefinition).map(function (key) { return byDefinition[key]; });
        var order = ['secondary', 'smg', 'rifle', 'sniper', 'shotgun', 'machinegun', 'melee'];
        inventory.sort(function (a, b) {
            return order.indexOf(a.kind) - order.indexOf(b.kind) || a.definition - b.definition;
        });
    }
    function Publish() {
        var mode = selectedItem ? 'skins' : (category === 'melee' ? 'knives' : 'inventory');
        var rows = [];
        if (selectedItem) {
            skins.slice(skinPage * pageSize, (skinPage + 1) * pageSize).forEach(function (skin) {
                rows.push({ id: 'OfflineSkin' + skin.paint, definition: selectedItem.definition,
                    paint: skin.paint, name: Name(skin.name), image: skin.image,
                    subtitle: skin.paint === pendingSkin.paint ? '待确认' : (skin.selected ? '已保存' : ''),
                    selected: skin.paint === pendingSkin.paint });
            });
        } else {
            rows = InventoryRows();
        }
        var state = { mode: mode, title: selectedItem ? selectedItem.name : '库存', category: category,
            status: status, items: rows, total: inventory.length, categories: categories.map(function (entry) {
                return { id: 'OfflineCategory_' + entry[0], key: entry[0], name: entry[1], selected: category === entry[0],
                    count: inventory.filter(function (item) { return entry[0] === 'all' || item.kind === entry[0]; }).length };
            }) };
        if (selectedItem) {
            state.skin = { definition: selectedItem.definition, team: team, shared: SharedGun(selectedItem),
                knife: selectedItem.kind === 'melee', locked_team: category === 'melee', ct: Eligible(selectedItem, 3),
                t: Eligible(selectedItem, 2), name: Name(pendingSkin.name), image: pendingSkin.image,
                total: skins.length, page: skinPage + 1, pages: Math.max(1, Math.ceil(skins.length / pageSize)),
                previous: skinPage > 0, next: (skinPage + 1) * pageSize < skins.length, confirm: !saving };
        }
        Root().SetAttributeString('icsm-inventory-state', JSON.stringify(state));
    }
    function DrawActions() {
        var actions = Find('OfflineInventoryNativeActions');
        actions.RemoveAndDeleteChildren();
        inventory.forEach(function (item) {
            [3, 2].forEach(function (value) {
                var button = $.CreatePanel('Button', actions, 'OfflineEquip' + (value === 3 ? 'CT' : 'T') + item.definition);
                button.enabled = Eligible(item, value);
                button.SetPanelEvent('onactivate', function () { EquipTeam(item.definition, value); });
            });
        });
    }
    function DrawInventory() {
        var list = Find('OfflineInventoryItems');
        list.RemoveAndDeleteChildren();
        Root().SetHasClass('knife-split', category === 'melee');
        InventoryRows().forEach(function (row) {
            var item = FindItem(row.definition), card = $.CreatePanel('Button', list, row.id || '');
            card.AddClass('offline-inventory-card');
            if (row.side) card.AddClass('offline-knife-card');
            if (row.placeholder) { card.enabled = false; card.style.opacity = '0'; return; }
            var image = $.CreatePanel('Image', card, '');
            image.AddClass('offline-inventory-image'); image.SetImage(row.image); image.hittest = false;
            var name = $.CreatePanel('Label', card, '');
            name.AddClass('offline-inventory-name'); name.text = item.name; name.hittest = false;
            var label = $.CreatePanel('Label', card, '');
            label.AddClass('offline-inventory-equipped'); label.text = row.subtitle; label.hittest = false;
            card.SetPanelEvent('onactivate', function () { OpenSkins(item, row.side); });
        });
        categories.forEach(function (entry) { Find('OfflineCategory_' + entry[0]).SetHasClass('equipped', category === entry[0]); });
        Find('OfflineInventoryTitle').text = '库存';
        Publish();
    }
    function Refresh() {
        if (selectedItem) return;
        ReadInventory();
        if (!status) status = '共 ' + inventory.length + ' 件武器与刀具';
        DrawActions(); DrawInventory();
    }
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
            card.FindChildTraverse('OfflineSkinLabel' + skin.paint).text = pending ? '✓ 待确认' : (skin.selected ? '已保存' : '点击预览');
        });
        Publish();
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
            card.SetPanelEvent('onactivate', function () { pendingSkin = skin; UpdateSelection(); Status(selectedItem.kind === 'melee' ? '确认皮肤后保存；长按刀具可装备' : '点击右下角确认后保存并装备'); });
        });
        UpdateSelection();
    }
    function OpenSkins(item, value) {
        selectedItem = item;
        if (value && Eligible(item, value)) team = value;
        if (!Eligible(item, team)) team = Eligible(item, 3) ? 3 : 2;
        skins = NativeInventoryAPI.GetSkins(team, item.definition) || [];
        pendingSkin = skins[0];
        skins.forEach(function (skin) { if (skin.selected) pendingSkin = skin; });
        if (!pendingSkin) { selectedItem = null; Status('该武器没有可用外观'); return; }
        skinPage = 0;
        skins.forEach(function (skin, i) { if (skin.paint === pendingSkin.paint) skinPage = Math.floor(i / pageSize); });
        Root().SetHasClass('skins-page', true);
        Find('OfflineInventoryItems').RemoveAndDeleteChildren();
        Find('OfflineInventoryTitle').text = item.name;
        Find('OfflineSkinTeam').text = (SharedGun(item) ? '警方／匪徒共用' : (team === 3 ? '警方' : '匪徒')) + ' · ' + item.name;
        Root().SetHasClass('skin-team-locked', SharedGun(item) || category === 'melee' || !Eligible(item, 3) || !Eligible(item, 2));
        Find('OfflineSkinConfirmText').text = item.kind === 'melee' ? '确认皮肤' : '确认并装备';
        Find('OfflineSkinCT').enabled = Eligible(item, 3); Find('OfflineSkinT').enabled = Eligible(item, 2);
        Find('OfflineSkinHint').text = '共 ' + skins.length + ' 种外观';
        status = item.kind === 'melee' ? '选择并保存该阵营的刀皮；返回后长按装备' : (SharedGun(item) ? '通用枪械皮肤同步应用于双方阵营' : '选择外观，确认后保存并装备');
        DrawSkinPage();
    }
    function CloseSkins() {
        selectedItem = null; pendingSkin = null; skins = [];
        Find('OfflineSkinChoices').RemoveAndDeleteChildren(); Find('OfflineSkinWeaponImage').SetImage('');
        Root().SetHasClass('skins-page', false);
    }
    function Confirm() {
        if (!selectedItem || !pendingSkin || saving) return;
        saving = true; Find('OfflineSkinConfirm').enabled = false; Publish();
        var itemName = selectedItem.name, skinName = Name(pendingSkin.name);
        var knife = selectedItem.kind === 'melee', shared = SharedGun(selectedItem);
        var success = knife ? NativeInventoryAPI.SaveSkin(team, selectedItem.definition, pendingSkin.paint) :
            NativeInventoryAPI.EquipSkin(team, selectedItem.definition, pendingSkin.paint);
        saving = false;
        if (success) { CloseSkins(); Refresh(); Status((shared ? '双方皮肤已同步：' : (knife ? '已保存' : '已为') + (team === 3 ? '警方' : '匪徒') + (knife ? '刀皮：' : '装备 ')) + itemName + ' · ' + skinName); }
        else { UpdateSelection(); Status('保存失败，请重试'); }
    }
    function EquipTeam(definition, value) {
        var item = null;
        inventory.forEach(function (entry) { if (entry.definition === definition) item = entry; });
        if (!item || !Eligible(item, value)) return;
        var success = NativeInventoryAPI.Equip(value, item.teams[value].slot, definition);
        if (success) { team = value; Refresh(); Status('已为' + (value === 3 ? '警方' : '匪徒') + '装备 ' + item.name + ' · 已保存'); }
        else Status('装备失败，请重试');
    }
    function ChangeSkinPage(delta) { if (selectedItem) { skinPage += delta; DrawSkinPage(); } }
    function SetSkinTeam(value) { if (selectedItem && !SharedGun(selectedItem) && category !== 'melee' && Eligible(selectedItem, value)) { var item = selectedItem; team = value; OpenSkins(item); } }
    function SetCategory(value) { CloseSkins(); category = value; Refresh(); Status('共 ' + inventory.filter(function (item) { return category === 'all' || item.kind === category; }).length + ' 件'); }
    function Back() { CloseSkins(); Refresh(); Status('共 ' + inventory.length + ' 件武器与刀具'); }
    // Bounded local development command uses the same panel events as UIKit.
    function ValidateUI(action, id) {
        var panel = id ? Root().FindChildTraverse(id) : null;
        if (action === 'activate' && panel && panel.enabled && id.indexOf('Offline') === 0)
            $.DispatchEvent('Activated', panel, 'mouse');
        if (action === 'state') $.Msg('ICSM_INVENTORY_STATE ', Root().GetAttributeString('icsm-inventory-state', ''));
    }
    return { Refresh: Refresh, SetCategory: SetCategory, Back: Back, Confirm: Confirm, ValidateUI: ValidateUI,
        ChangeSkinPage: ChangeSkinPage, SetSkinTeam: SetSkinTeam, EquipTeam: EquipTeam };
})();
(function () {
    $.RegisterForUnhandledEvent('MainMenuTabShown', function (tab) { if (tab === 'JsInventory') OfflineInventory.Refresh(); });
    OfflineInventory.Refresh();
})();
