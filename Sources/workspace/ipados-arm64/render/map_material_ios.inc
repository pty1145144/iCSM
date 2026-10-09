// World-only material specialization. Source's lightmapped helper selects
// static DETAIL shader combinations here; model/weapon shaders are untouched.
// Keep structural detail (tiles, brick, wood), alpha, terrain blending and
// unusually strong/negative detail layers. The named layers below were found
// in the supplied 2019 BSP/VPK audit; removing them sacrifices fine surface
// grain while preserving the base texture, UVs and baked illumination.
#if defined(SOURCE_IOS)
static ConVar icsm_map_detail_optimize("icsm_map_detail_optimize","0",
    FCVAR_ARCHIVE | FCVAR_RELEASE,"World fine-grain material specialization; reload materials/maps after changing",
    true,0,true,1);
static unsigned icsmWorldDetailSpecializations=0;
static bool ICSMKeepWorldDetail(const char *name,int mode,float factor,bool simpleOpaque)
{
    if(!icsm_map_detail_optimize.GetBool() || !name || !simpleOpaque || mode!=0 || factor<=0 || factor>1)
        return true;
    char path[256];V_strncpy(path,name,sizeof(path));V_FixSlashes(path,'/');
    const char *layers[]={"detail/noise_detail_01",
        "concrete/hr_c/hr_concrete_wall_painted_001_detail",
        "concrete/hr_c/hr_concrete_wall_painted_002_detail",
        "concrete/hr_c/hr_concrete_polished_001_detail"};
    for(unsigned i=0;i<ARRAYSIZE(layers);++i)if(!V_stricmp(path,layers[i])) {
        ++icsmWorldDetailSpecializations;return false;
    }
    return true;
}
CON_COMMAND(icsm_map_material_status,"Report the world-only material specialization")
{
    Msg("ICSM_MAP_MATERIAL enabled=%d specialized_material_snapshots=%u skin_shader_affected=0\n",
        icsm_map_detail_optimize.GetBool(),icsmWorldDetailSpecializations);
}
#else
static bool ICSMKeepWorldDetail(const char *,int,float,bool) {return true;}
#endif
