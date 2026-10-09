// Included only by I5's LightmappedGeneric helper, not model/skin shaders.
// Source already implements radiosity normal mapping and $forcebump. Keep
// those flags, textures, shader combinations and lightmap allocation intact.
// This opt-in restores their world-surface path independently of gpu_level,
// avoiding that preset's extra particles, reflections and post processing.
#if defined(SOURCE_IOS)
static ConVar icsm_world_bump_detail("icsm_world_bump_detail", "0",
    FCVAR_ARCHIVE | FCVAR_RELEASE,
    "Independent lightmapped surface normals; reload the map after changing",
    true, 0, true, 1);
static unsigned icsmWorldBumpMaterials=0,icsmWorldSSBumpMaterials=0;
static bool ICSMUseWorldBumpMapping()
{
    return g_pConfig->UseBumpmapping() || icsm_world_bump_detail.GetBool();
}
CON_COMMAND(icsm_world_material_status,"Report the independent Source world-material path")
{
    Msg("ICSM_WORLD_MATERIAL enabled=%d global_bump=%d global_specular=%d normal_material_initializations=%u ssbump_material_initializations=%u\n",
        icsm_world_bump_detail.GetBool(),g_pConfig->UseBumpmapping(),g_pConfig->UseSpecular(),
        icsmWorldBumpMaterials,icsmWorldSSBumpMaterials);
}
#else
static bool ICSMUseWorldBumpMapping() { return g_pConfig->UseBumpmapping(); }
#endif
