// Attach the original composite material to the native weapon. The viewmodel
// and CBaseWeaponWorldModel already copy overrides by material basename.
#if defined(SOURCE_IOS) && defined(CLIENT_DLL)
#include "igamesystem.h"
static ConVar icsm_skin_recipe_cache("icsm_skin_recipe_cache","1",FCVAR_RELEASE,
    "Reuse exact completed offline skin material recipes within a map; diagnostic A/B");
namespace ICSMSkinRecipeCache {
struct Entry {
    int definition,paint,seed,signature;
    float wear;
    CCustomMaterialOwner materials;
};
class Cache : public CAutoGameSystem {
public:
    CUtlVector<Entry*> entries;
    unsigned hits=0,misses=0;
    Cache():CAutoGameSystem("iCSM bounded skin recipe cache"){}
    void Clear() {FOR_EACH_VEC(entries,i)delete entries[i];entries.Purge();}
    void LevelShutdownPreEntity() override {Clear();}
    void Shutdown() override {Clear();}
    bool Restore(CEconItemView *item,int definition,int paint,int seed,float wear,int signature) {
        if(!icsm_skin_recipe_cache.GetBool()){Clear();return false;}
        FOR_EACH_VEC(entries,i) {
            Entry *e=entries[i];
            if(e->definition!=definition || e->paint!=paint || e->seed!=seed || e->wear!=wear || e->signature!=signature)continue;
            bool valid=true;
            for(int m=0;m<e->materials.GetCustomMaterialCount();++m) {
                auto material=e->materials.GetCustomMaterial(m);
                if(material && !material->IsValid()){valid=false;break;}
            }
            if(!valid)continue;
            e->materials.DuplicateCustomMaterialsToOther(item);
            // The owner API preserves original model material indices and
            // AddRef/Release. No private texture/processor memory is copied.
            entries.Remove(i);entries.AddToTail(e);++hits;return true;
        }
        ++misses;return false;
    }
    void Remember(CEconItemView *item,int definition,int paint,int seed,float wear,int signature) {
        if(!icsm_skin_recipe_cache.GetBool())return;
        FOR_EACH_VEC(entries,i) {
            const Entry *e=entries[i];
            if(e->definition==definition && e->paint==paint && e->seed==seed && e->wear==wear && e->signature==signature)return;
        }
        bool any=false;
        for(int i=0;i<item->GetCustomMaterialCount();++i) {
            auto m=item->GetCustomMaterial(i);if(!m)continue;
            if(!m->IsValid())return;any=true;
        }
        if(!any)return;
        // High skin quality creates large diffuse/exponent textures. Keep at
        // most 12 recipes, and clear them before the map/material shutdown.
        while(entries.Count()>=12){delete entries[0];entries.Remove(0);}
        auto e=new Entry;e->definition=definition;e->paint=paint;e->seed=seed;e->wear=wear;e->signature=signature;
        item->DuplicateCustomMaterialsToOther(&e->materials);entries.AddToTail(e);
    }
};
static Cache cache;
}
CON_COMMAND(icsm_skin_recipe_stats,"Print bounded completed skin recipe reuse") {
    Msg("ICSM_SKIN_CACHE recipes=%d hits=%u misses=%u\n",ICSMSkinRecipeCache::cache.entries.Count(),ICSMSkinRecipeCache::cache.hits,ICSMSkinRecipeCache::cache.misses);
}
#endif
void CWeaponCSBase::UpdateCustomMaterial(void)
{
#if defined(SOURCE_IOS)
    CEconItemView *item = GetAttributeContainer()->GetItem();
    if (!item || !item->IsValid() || item->GetItemID() != 0 ||
        !ICSMSkin::FindTrial(GetItemDefinitionIndex())) return;
    // Entity handles include the serial number. Bound this bookkeeping to
    // avoid retaining entries for discarded weapons across many matches.
    static CUtlMap<unsigned, int> quality(0, 0, DefLessFunc(unsigned));
    if (quality.Count() > 512) quality.RemoveAll();
    const unsigned handle = GetRefEHandle().ToInt();
    int entry = quality.Find(handle);
    const int signature = ICSMSkinQuality::Signature();
    const bool qualityChanged = item->GetCustomMaterialCount() &&
        (entry == quality.InvalidIndex() || quality[entry] != signature);
    const int paint = m_nFallbackPaintKit;
    const int seed = m_nFallbackSeed;
    const float wear = m_flFallbackWear;
    const bool changed = item->GetCustomPaintKitIndex() != paint ||
        item->GetCustomPaintKitSeed() != seed || item->GetCustomPaintKitWear() != wear;
    if (changed || qualityChanged)
    {
        ClearCustomMaterials();
        item->ClearCustomMaterials();
        m_bVisualsDataSet = false;
    }
    // Zero seed and zero wear are valid values; preserve them explicitly.
    item->SetOrAddAttributeValueByName("set item texture prefab", float(paint));
    item->SetOrAddAttributeValueByName("set item texture seed", float(seed));
    item->SetOrAddAttributeValueByName("set item texture wear", wear);
    if (!paint)
    {
        ClearCustomMaterials();
        item->ClearCustomMaterials();
        m_bVisualsDataSet = false;
        return;
    }
    ICSMSkin::Selection recipe;
    recipe.paint = paint; recipe.seed = seed; recipe.wear = wear;
    if (!ICSMSkin::ValidRecipe(GetItemDefinitionIndex(), recipe)) return;
    if (!item->GetCustomMaterialCount())
    {
        const bool reused=ICSMSkinRecipeCache::cache.Restore(item,GetItemDefinitionIndex(),paint,seed,wear,signature);
        // Generate once per recipe. Existing material manager finalizes GPU
        // composites asynchronously; the original renderer waits for IsValid.
        if(!reused)item->UpdateGeneratedMaterial(ICSMSkinQuality::Texture() != 0,
            MDLHANDLE_INVALID, ICSMSkinQuality::DiffuseSize());
        if (entry == quality.InvalidIndex()) quality.Insert(handle, signature);
        else quality[entry] = signature;
        Msg("ICSM_SKIN_QUALITY entity=%d shader=%d texture=%d size=%d signature=%d\n",
            entindex(), ICSMSkinQuality::Shader(), ICSMSkinQuality::Texture(),
            1 << ICSMSkinQuality::DiffuseSize(), signature);
        Msg("%s entity=%d definition=%d paint=%d seed=%d wear=%.6f materials=%d\n",reused?"ICSM_SKIN_REUSE":"ICSM_SKIN_GENERATE",
            entindex(), GetItemDefinitionIndex(), paint, seed, wear, item->GetCustomMaterialCount());
    }
    ICSMSkinRecipeCache::cache.Remember(item,GetItemDefinitionIndex(),paint,seed,wear,signature);
    if (!m_bVisualsDataSet && GetModelPtr() && item->GetCustomMaterialCount())
    {
        ClearCustomMaterials();
        for (int i = 0; i < item->GetCustomMaterialCount(); ++i)
            if (item->GetCustomMaterial(i)) SetCustomMaterial(item->GetCustomMaterial(i), i);
        m_bVisualsDataSet = GetCustomMaterialCount() > 0;
        Msg("ICSM_SKIN_ATTACH entity=%d materials=%d\n", entindex(), GetCustomMaterialCount());
    }
#endif
}

void CWeaponCSBase::CheckCustomMaterial(void)
{
    UpdateCustomMaterial();
}
