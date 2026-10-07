// Local map metadata supplies the original Panorama workshop map picker.
// The original GameTypes::GetMapGroup_Internal resolves @workshop/<id>/<map>
// and CMatchSessionOfflineCustom starts the already installed BSP offline.
#include "materialsystem/imaterial.h"
#include "materialsystem/imaterialvar.h"
#include "materialsystem/itexture.h"
#include "engine/ivmodelinfo.h"

CON_COMMAND_F(icsm_workshop_model, "Inspect the loaded Source model header and material table", FCVAR_RELEASE)
{
    if (args.ArgC() != 2) return;
    const model_t *model = modelinfo->GetModel(modelinfo->GetModelIndex(args[1]));
    if (!model) { Msg("ICSM_WORKSHOP_MODEL missing=%s\n", args[1]); return; }
    MDLCACHE_CRITICAL_SECTION();
    studiohdr_t *header = modelinfo->GetStudiomodel(model);
    Msg("ICSM_WORKSHOP_MODEL name=%s header=%s bones=%d textures=%d skins=%d\n",
        modelinfo->GetModelName(model), header ? header->pszName() : "none",
        header ? header->numbones : 0, header ? header->numtextures : 0,
        header ? header->numskinfamilies : 0);
    const int count = modelinfo->GetModelMaterialCount(model);
    if (count <= 0 || count > 256) return;
    CUtlVector<IMaterial *> table;
    table.SetCount(count);
    modelinfo->GetModelMaterials(model, count, table.Base());
    FOR_EACH_VEC(table, i)
        if (table[i]) Msg("ICSM_WORKSHOP_MODEL_MATERIAL index=%d name=%s error=%d shader=%s\n",
            i, table[i]->GetName(), table[i]->IsErrorMaterial(), table[i]->GetShaderName());
}

CON_COMMAND_F(icsm_workshop_material, "Inspect a workshop material and its base texture through Source", FCVAR_RELEASE)
{
    if (args.ArgC() != 2) return;
    IMaterial *material = materials->FindMaterial(args[1], TEXTURE_GROUP_OTHER, false);
    Msg("ICSM_WORKSHOP_MATERIAL name=%s error=%d shader=%s\n",
        material->GetName(), material->IsErrorMaterial(), material->GetShaderName());
    bool found = false;
    IMaterialVar *base = material->FindVar("$basetexture", &found, false);
    if (!found || !base->IsTexture()) return;
    ITexture *texture = base->GetTextureValue();
    Msg("ICSM_WORKSHOP_TEXTURE name=%s error=%d size=%dx%d\n", texture->GetName(),
        texture->IsError(), texture->GetActualWidth(), texture->GetActualHeight());
    CUtlBuffer data;
    CFmtStr file("materials/%s.vtf", texture->GetName());
    if (filesystem->ReadFile(file.Get(), "GAME", data))
        Msg("ICSM_WORKSHOP_TEXTURE_FILE bytes=%d magic=%08x\n", data.TellPut(),
            data.TellPut() >= 4 ? *static_cast<const unsigned *>(data.Base()) : 0);
}

class CNativeOfflineWorkshop
{
public:
    void JSRegisterFunc();
    void GetMaps(const v8::FunctionCallbackInfo<v8::Value>& info)
    {
        auto maps = v8::Array::New(info.GetIsolate());
        KeyValues::AutoDelete catalog(new KeyValues("LocalWorkshopMaps"));
        if (catalog->LoadFromFile(filesystem, "icsm_workshop_maps.kv", "GAME"))
        {
            unsigned index = 0;
            FOR_EACH_SUBKEY(catalog, entry)
            {
                const char *map = entry->GetString("map");
                CFmtStr filename("maps/%s.bsp", map);
                if (!*map || !filesystem->FileExists(filename.Get(), "GAME")) continue;
                maps->Set(info.GetIsolate()->GetCurrentContext(), index++,
                    JSObjectFromKeyValues(info.GetIsolate(), entry)).Check();
            }
        }
        info.GetReturnValue().Set(maps);
    }
};

PANORAMA_COMPONENT_API_DEF_BEGIN(CNativeOfflineWorkshop)
    PANORAMA_COMPONENT_FUNCTION_RAW_API_DEF(void, GetMaps, CNativeOfflineWorkshop)
PANORAMA_COMPONENT_API_DEF_END(CNativeOfflineWorkshop)

static void InstallNativeOfflineWorkshopBindings()
{
    static CNativeOfflineWorkshop local;
    PANORAMA_COMPONENT_API_INSTALL(CNativeOfflineWorkshop, &local, "NativeWorkshopAPI", "Installed offline workshop maps");
}
