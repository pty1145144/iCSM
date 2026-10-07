#include "metal_spatial_ios.h"
// Source's engine_post_dx9.cpp uses a gamma-space LDR framebuffer on this
// path. MetalFX Perceptual preserves that convention; the final gamma LUT
// remains in Present. Text/UI is rendered after this explicit scene hook.
static ConVar icsm_metal_spatial_upscale("icsm_metal_spatial_upscale", "0",
    FCVAR_ARCHIVE | FCVAR_RELEASE, "MetalFX spatial scene upscale; 0 uses ordinary linear upscale", true, 0, true, 1);
namespace SourceMetal {
struct SpatialState {
    Device *owner=nullptr;
    id<MTLFXSpatialScaler> scaler=nil;
    id<MTLTexture> input=nil, output=nil;
    MTLPixelFormat format=MTLPixelFormatInvalid;
    ICSMSceneRect src{}, dst{};
    bool checked=false, supported=false;
    unsigned long long encoded=0, fallbacks=0, creations=0, lastFrame=0;
    double encodeCPU=0;
    NSString *error=@"";
};
static SpatialState spatial;
static bool spatialSupport() {
    if(!spatial.checked) {
        spatial.checked=true;
        if(@available(iOS 16.0, *))spatial.supported=[MTLFXSpatialScalerDescriptor supportsDevice:device()];
    }
    return spatial.supported;
}
static void spatialForget(Device &d) {
    if(spatial.owner!=&d)return;
    spatial.scaler=nil;spatial.input=nil;spatial.output=nil;
    spatial.owner=nullptr;spatial.format=MTLPixelFormatInvalid;
}
static bool spatialBounds(const ICSMSceneRect &r, id<MTLTexture> t, NSUInteger mip) {
    return r.x>=0 && r.y>=0 && r.width>0 && r.height>0 &&
        NSUInteger(r.x)+NSUInteger(r.width)<=std::max(NSUInteger(1),t.width>>mip) &&
        NSUInteger(r.y)+NSUInteger(r.height)<=std::max(NSUInteger(1),t.height>>mip);
}
static bool spatialEncode(Device &d, id<MTLTexture> target, NSUInteger mip, NSUInteger slice,
                           const ICSMSceneRect &src, const ICSMSceneRect &dst) {
    auto fail=[&](NSString *why) {spatial.error=why;++spatial.fallbacks;
        perfCount(PerfCount::SpatialFallbacks);return false;};
    if(!spatialSupport())return fail(@"MetalFX spatial unsupported by this GPU");
    if(!target || target.sampleCount!=1 || target.textureType!=MTLTextureType2D ||
       !spatialBounds(src,target,mip) || !spatialBounds(dst,target,mip) ||
       dst.width<src.width || dst.height<src.height ||
       (dst.width==src.width && dst.height==src.height))return fail(@"Scene rectangle or target is ineligible");
    const MTLPixelFormat f=target.pixelFormat;
    if(f!=MTLPixelFormatBGRA8Unorm && f!=MTLPixelFormatRGBA8Unorm)
        return fail(@"Scene target is not a supported gamma-space LDR format");
    if(spatial.owner!=&d || spatial.format!=f ||
       spatial.src.width!=src.width || spatial.src.height!=src.height ||
       spatial.dst.width!=dst.width || spatial.dst.height!=dst.height) {
        spatial.owner=&d;spatial.format=f;spatial.src=src;spatial.dst=dst;
        spatial.input=nil;spatial.output=nil;spatial.scaler=nil;++spatial.creations;
        auto desc=[MTLFXSpatialScalerDescriptor new];
        desc.colorTextureFormat=f;desc.outputTextureFormat=f;
        desc.inputWidth=src.width;desc.inputHeight=src.height;
        desc.outputWidth=dst.width;desc.outputHeight=dst.height;
        desc.colorProcessingMode=MTLFXSpatialScalerColorProcessingModePerceptual;
        spatial.scaler=[desc newSpatialScalerWithDevice:device()];
        if(spatial.scaler) {
            auto t=[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:f width:src.width height:src.height mipmapped:NO];
            t.storageMode=MTLStorageModePrivate;t.usage=spatial.scaler.colorTextureUsage;
            spatial.input=[device() newTextureWithDescriptor:t];
            t.width=dst.width;t.height=dst.height;t.usage=spatial.scaler.outputTextureUsage;
            spatial.output=[device() newTextureWithDescriptor:t];
            spatial.input.label=@"iCSM MetalFX compact scene input";
            spatial.output.label=@"iCSM MetalFX scene output";
        }
        // A failed descriptor is remembered, avoiding creation/logging every frame.
    }
    spatial.src=src;spatial.dst=dst;
    if(!spatial.scaler || !spatial.input || !spatial.output)return fail(@"MetalFX scaler or texture allocation failed");
    const double began=Plat_FloatTime();
    endEncoder(d);beginCommand(d);
    auto blit=[d.command blitCommandEncoder];
    [blit copyFromTexture:target sourceSlice:slice sourceLevel:mip
        sourceOrigin:MTLOriginMake(src.x,src.y,0) sourceSize:MTLSizeMake(src.width,src.height,1)
        toTexture:spatial.input destinationSlice:0 destinationLevel:0 destinationOrigin:MTLOriginMake(0,0,0)];
    [blit endEncoding];
    spatial.scaler.colorTexture=spatial.input;spatial.scaler.outputTexture=spatial.output;
    spatial.scaler.inputContentWidth=src.width;spatial.scaler.inputContentHeight=src.height;
    [spatial.scaler encodeToCommandBuffer:d.command];
    blit=[d.command blitCommandEncoder];
    [blit copyFromTexture:spatial.output sourceSlice:0 sourceLevel:0
        sourceOrigin:MTLOriginMake(0,0,0) sourceSize:MTLSizeMake(dst.width,dst.height,1)
        toTexture:target destinationSlice:slice destinationLevel:mip destinationOrigin:MTLOriginMake(dst.x,dst.y,0)];
    [blit endEncoding];
    // All resources use tracked hazards, and all work is ordered on d.queue.
    // No per-frame GPU wait, and no writes outside the destination rectangle.
    perfCount(PerfCount::Blits,2);perfCount(PerfCount::SpatialUpscales);
    ++spatial.encoded;spatial.lastFrame=d.frame;spatial.error=@"";
    spatial.encodeCPU=(Plat_FloatTime()-began)*1000;
    return true;
}
}
extern "C" __attribute__((visibility("default"))) NSDictionary *SourceMetalSpatialSnapshot() {
    using namespace SourceMetal;
    bool supported=spatialSupport();
    auto rect=[](const ICSMSceneRect &r) {return @[@(r.x),@(r.y),@(r.width),@(r.height)];};
    return @{@"supported":@(supported),@"requested":@(icsm_metal_spatial_upscale.GetBool()),
        @"active":@(icsm_metal_spatial_upscale.GetBool() && spatial.owner && spatial.encoded &&
            spatial.owner->frame-spatial.lastFrame<3),
        @"encoded_frames":@(spatial.encoded),@"fallbacks":@(spatial.fallbacks),
        @"scaler_creations":@(spatial.creations),@"input_rect":rect(spatial.src),@"output_rect":rect(spatial.dst),
        @"pixel_format":@(spatial.format),@"color_processing":@"perceptual",
        @"encode_cpu_ms":@(spatial.encodeCPU),@"last_error":spatial.error};
}
