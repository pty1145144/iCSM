// Local recipes use original schema compatibility, seed and wear contracts.
#pragma once
#include "offline_loadout.h"
#include "offline_skin_trials.h"
#include "offline_skin_catalog.h"

namespace ICSMSkin
{
static const char *const File = "cfg/icsm-skins.kv";
struct Selection
{
    int paint, seed;
    float wear;
    Selection() : paint(0), seed(0), wear(0.0f) {}
};

inline const GameItemDefinition_t *Definition(int team, int index)
{
    const GameItemDefinition_t *item = dynamic_cast<const GameItemDefinition_t *>(GetItemSchema()->GetItemDefinition(index));
    return item ? ICSMLoadout::Definition(team, item->GetLoadoutSlot(team), index) : NULL;
}

inline bool ValidRecipe(int definition, const Selection &skin)
{
    if (skin.seed < 0 || skin.seed > 1023 || !IsFinite(skin.wear)) return false;
    if (!skin.paint) return skin.seed == 0 && skin.wear == 0.0f;
    const CatalogEntry *recipe = FindCatalog(definition, skin.paint);
    const CPaintKit *paint = GetItemSchema()->GetPaintKitDefinition(skin.paint);
    const GameItemDefinition_t *item = dynamic_cast<const GameItemDefinition_t *>(GetItemSchema()->GetItemDefinition(definition));
    return recipe && paint && item && item->GetPaintData()->Count() > 0 &&
        skin.wear >= paint->flWearRemapMin && skin.wear <= paint->flWearRemapMax &&
        GetItemSchema()->GetAlternateIcon(Helper_GetAlternateIconKeyForWeaponPaintWearItem(definition, skin.paint, 0));
}

inline bool Valid(int team, int definition, const Selection &skin)
{
    return Definition(team, definition) && ValidRecipe(definition, skin);
}

inline Selection Trial(int definition, int paint)
{
    Selection skin;
    skin.paint = paint;
    const CPaintKit *kit = paint ? GetItemSchema()->GetPaintKitDefinition(paint) : NULL;
    if (kit) skin.wear = clamp(0.02f, kit->flWearRemapMin, kit->flWearRemapMax);
    return skin;
}

inline void EntryPath(char *path, int size, int team, int definition)
{
    V_snprintf(path, size, "%s/%d", team == TEAM_CT ? "ct" : "t", definition);
}

inline Selection Read(int team, int definition)
{
    Selection skin;
    if (!filesystem || !Definition(team, definition)) return skin;
    KeyValues::AutoDelete data(new KeyValues("iCSMOfflineSkins"));
    if (!data->LoadFromFile(filesystem, File, "MOD") || data->GetInt("version") != 1) return skin;
    char path[32]; EntryPath(path, sizeof(path), team, definition);
    KeyValues *entry = data->FindKey(path);
    if (!entry) return skin;
    skin.paint = entry->GetInt("paint");
    skin.seed = entry->GetInt("seed");
    skin.wear = entry->GetFloat("wear");
    return Valid(team, definition, skin) ? skin : Selection();
}

inline bool Save(int team, int definition, const Selection &skin)
{
    if (!filesystem || !Valid(team, definition, skin)) return false;
    KeyValues::AutoDelete data(new KeyValues("iCSMOfflineSkins"));
    if (data->LoadFromFile(filesystem, File, "MOD") && data->GetInt("version") != 1) return false;
    data->SetInt("version", 1);
    char path[32]; EntryPath(path, sizeof(path), team, definition);
    KeyValues *entry = data->FindKey(path, true);
    entry->SetInt("paint", skin.paint);
    entry->SetInt("seed", skin.seed);
    entry->SetFloat("wear", skin.wear);
    filesystem->CreateDirHierarchy("cfg", "MOD");
    if (!data->SaveToFile(filesystem, "cfg/icsm-skins.tmp", "MOD")) return false;
    return filesystem->RenameFile("cfg/icsm-skins.tmp", File, "MOD");
}
}
