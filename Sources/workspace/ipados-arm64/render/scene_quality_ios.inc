// Included by Source's cascade-light manager. Preserve baked illumination,
// cascade count, atlas precision, PCF and the separate viewmodel shadow path.
#if defined(SOURCE_IOS)
static ConVar icsm_world_shadow_percent("icsm_world_shadow_percent", "100",
    FCVAR_ARCHIVE | FCVAR_RELEASE, "Preset world shadow coverage relative to the map's normal distance",
    true, 50, true, 100);
static float icsmShadowBaseDistance=0,icsmShadowDistance=0,icsmShadowCullVolume=0;
static float ICSMWorldShadowDistance(float distance)
{
    icsmShadowBaseDistance=distance;
    icsmShadowDistance=distance*icsm_world_shadow_percent.GetFloat()*.01f;
    return icsmShadowDistance;
}
static float ICSMWorldShadowCullVolume(float volume)
{
    // Source already culls small props only in the far world cascade. Raise
    // that cutoff gradually; nearby/player and viewmodel casters stay intact.
    icsmShadowCullVolume=volume/(icsm_world_shadow_percent.GetFloat()*.01f);
    return icsmShadowCullVolume;
}
static void ICSMShadowBudgetStatus()
{
    Msg("ICSM_SHADOW_BUDGET percent=%g base_distance=%g world_distance=%g far_prop_volume=%g viewmodel_distance=%g\n",
        icsm_world_shadow_percent.GetFloat(),icsmShadowBaseDistance,icsmShadowDistance,
        icsmShadowCullVolume,cl_csm_viewmodel_max_shadow_dist.GetFloat());
}
#else
static float ICSMWorldShadowDistance(float distance) { return distance; }
static float ICSMWorldShadowCullVolume(float volume) { return volume; }
static void ICSMShadowBudgetStatus() {}
#endif
