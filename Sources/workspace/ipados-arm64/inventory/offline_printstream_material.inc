// The community files are baked model materials, not paint-compositor inputs.
// Implement the public ICustomMaterial refcount contract so the existing weapon,
// worldmodel and viewmodel owners still select overrides by original basename.
#include "materialsystem/materialsystemutil.h"
namespace ICSMPrintstream
{
inline const char *Directory(int definition, int paint)
{
    if (definition == 1 && paint == 962) return "deagle";
    if (definition == 60 && paint == 984) return "m4a1s";
    return NULL;
}

class BakedMaterial : public ICustomMaterial
{
    CMaterialReference m_material;
    char m_base[MAX_PATH];
public:
    BakedMaterial(IMaterial *material, const char *base)
    {
        m_material.Init(material);
        V_strncpy(m_base, base, sizeof(m_base));
    }
    IMaterial *GetMaterial() override { return m_material; }
    void AddTexture(ICompositeTexture *) override {} // No generated textures.
    ICompositeTexture *GetTexture(int) override { return NULL; }
    bool IsValid() const override { return GetRaw() && !GetRaw()->IsErrorMaterial(); }
    bool CheckRegenerate(int) override { return false; }
    const char *GetBaseMaterialName() override { return m_base; }
    IMaterial *GetRaw() const { return m_material; }
};

inline bool Apply(CEconItemView *item, MDLHandle_t modelHandle)
{
    const int definitionIndex = item->GetItemDefinition()->GetDefinitionIndex();
    const char *directory = Directory(definitionIndex, item->GetCustomPaintKitIndex());
    if (!directory) return false;
    // Claim these exact two recipes even if loading fails: a baked base map
    // must never accidentally enter the original pattern-composition path.
    if (item->GetCustomMaterialCount()) return true;
    const auto *definition = item->GetStaticData();
    if (!definition || !definition->GetPaintData()->Count()) return true;
    const WeaponPaintableMaterial_t &paint = (*definition->GetPaintData())[0];
    const char *base = paint.m_szOriginalMaterialName[0] ? paint.m_szOriginalMaterialName : paint.m_szName;
    bool releaseModel = modelHandle == MDLHANDLE_INVALID;
    if (releaseModel)
    {
        if (!item->GetWorldDisplayModel()) return true;
        modelHandle = mdlcache->FindMDL(item->GetWorldDisplayModel());
    }
    if (modelHandle == MDLHANDLE_INVALID) return true;
    studiohdr_t *studio = mdlcache->GetStudioHdr(modelHandle);
    int index = -1;
    if (studio)
        for (int i = 0; i < studio->numtextures; ++i)
        {
            char name[MAX_PATH]; V_FileBase(studio->pTexture(i)->pszName(), name, sizeof(name));
            if (!V_stricmp(name, base)) { index = i; break; }
        }
    if (index >= 0)
    {
        char name[MAX_PATH];
        V_snprintf(name, sizeof(name), "models/weapons/icsm_printstream/%s/finish_s%d_t%d",
            directory, ICSMSkinQuality::Shader(), ICSMSkinQuality::Texture());
        IMaterial *material = g_pMaterialSystem->FindMaterial(name, TEXTURE_GROUP_MODEL, true);
        if (material && !material->IsErrorMaterial())
        {
            BakedMaterial *custom = new BakedMaterial(material, base);
            item->SetCustomMaterial(custom, index);
            custom->Release(); // SetCustomMaterial retained its own reference.
            Msg("ICSM_PRINTSTREAM_ATTACH definition=%d paint=%d index=%d base=%s material=%s\n",
                definitionIndex, item->GetCustomPaintKitIndex(), index, base, name);
        }
    }
    else Warning("ICSM_PRINTSTREAM model material mismatch definition=%d base=%s\n", definitionIndex, base);
    if (releaseModel) mdlcache->Release(modelHandle);
    return true;
}
}
