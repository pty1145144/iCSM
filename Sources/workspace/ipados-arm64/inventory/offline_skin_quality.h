// Independent local gun/knife finish quality; world video settings stay intact.
#pragma once
#include "convar.h"
#include "materialsystem/icompositetexturegenerator.h"

namespace ICSMSkinQuality
{
inline int Shader()
{
    static ConVarRef value("icsm_skin_shader_detail");
    return value.IsValid() ? clamp(value.GetInt(), 0, 1) : 0;
}
inline int Texture()
{
    static ConVarRef value("icsm_skin_texture_detail");
    return value.IsValid() ? clamp(value.GetInt(), 0, 3) : 0;
}
inline int Signature()
{
    static ConVarRef gpu("gpu_level"), mip("mat_picmip");
    const int gpuLevel = gpu.IsValid() ? clamp(gpu.GetInt(), 0, 3) : 0;
    const int picMip = mip.IsValid() ? clamp(mip.GetInt(), -1, 4) : 0;
    return Shader() | (Texture() << 1) | (gpuLevel << 3) | ((picMip + 1) << 5);
}
inline CompositeTextureSize_t DiffuseSize()
{
    switch (Texture())
    {
    case 1: return COMPOSITE_TEXTURE_SIZE_256;
    case 2: return COMPOSITE_TEXTURE_SIZE_512;
    default: return COMPOSITE_TEXTURE_SIZE_1024;
    }
}
}
