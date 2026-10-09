// World-only, fractional mip selection. Apple's sampler LOD clamp retains
// trilinear transitions; it does not deallocate the original texture mipmaps.
// A retained texel-density budget B maps to LOD -0.5*log2(B).
static float icsmWorldMinLOD=0;
static unsigned icsmWorldAnisotropyPercent=100;
static void ICSMWorldTextureBudgetChanged(IConVar *value,const char *,float)
{
    const float fraction=static_cast<ConVar *>(value)->GetFloat()*.01f;
    icsmWorldMinLOD=-.5f*log2f(fraction);
    icsmWorldAnisotropyPercent=static_cast<ConVar *>(value)->GetInt();
}
static ConVar icsm_world_texture_percent("icsm_world_texture_percent","100",
    FCVAR_ARCHIVE | FCVAR_RELEASE,"Preset world-surface sampling density; models, skins, lightmaps and UI are excluded",
    true,50,true,100,ICSMWorldTextureBudgetChanged);
