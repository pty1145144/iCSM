// Included in native_resources.mm inside SourceMetal. CPU-only Source lightmap
// pages retain their exact bytes. GPU uploads use the existing completion-gated
// staging pool and the same tracked command queue as draws, never CPU writes to
// a texture that a previous GPU frame might still sample.
static ConVar icsm_metal_lightmap_upload("icsm_metal_lightmap_upload", "1", FCVAR_RELEASE,
    "I5 ordered lightmap staging uploads; diagnostic A/B switch");
static uint64_t lightmapShadowLocks=0,lightmapUploads=0,lightmapUploadBytes=0;
static uint64_t lightmapInvalidations=0,lightmapRememberedPages=0;
static uint64_t lightmapRequestedBytes=0,lightmapUnchanged=0;

void configureLightmapShadow(Texture &t,DWORD usage,const char *label) {
    // CMatLightmaps::AllocateLightmapTexture creates single-level 2D pages
    // with this exact debug name. GPU-written/render-target textures cannot
    // use a CPU mirror. Do not extend this path to arbitrary game textures.
    int page=-1,consumed=0;
    t.cpuLightmap=label && sscanf(label,"[lightmap %d]%n",&page,&consumed)==1 &&
        consumed==int(strlen(label)) && page>=0 && !(usage&(D3DUSAGE_RENDERTARGET|D3DUSAGE_DEPTHSTENCIL)) &&
        t.depth==1 && t.levels==1 && t.slices==1 && t.samples==1 && !t.format.depth &&
        t.format.block==1 && (t.format.bytes==4 || t.format.bytes==8);
    t.lightmapDevice=t.cpuLightmap ? ::g_sourceNativeDevice:nullptr;
}
bool lightmapShadowLock(const Image &image,unsigned mip,unsigned face) {
    const auto &t=*image.image;
    return icsm_metal_lightmap_upload.GetBool() && t.cpuLightmap && t.cpuShadowValid &&
        t.lightmapDevice && mip==0 && face==0;
}
void invalidateLightmapShadow(Texture &t,bool renderTarget) {
    if(!t.cpuLightmap)return;
    ++lightmapInvalidations;perfCount(PerfCount::LightmapInvalidations);
    t.cpuShadowValid=false;
    if(renderTarget) {t.cpuLightmap=false;t.cpuShadow.clear();t.cpuShadow.shrink_to_fit();t.cpuQueuedShadow.clear();t.cpuQueuedShadow.shrink_to_fit();}
}
bool lockLightmapShadow(Texture &t,Texture::Lock &l,D3DLOCKED_BOX &out) {
    if(!icsm_metal_lightmap_upload.GetBool() || !t.cpuLightmap || !t.cpuShadowValid)return false;
    // Pitch may span the full page even for a subrectangle; Source's
    // CPixelWriter uses the returned pitch rather than assuming tight rows.
    l.pitch=t.width*t.format.bytes;l.imagePitch=l.pitch*t.height;l.shadow=true;
    out.pBits=t.cpuShadow.data()+l.region.origin.y*l.pitch+l.region.origin.x*t.format.bytes;
    out.RowPitch=l.pitch;out.SlicePitch=l.imagePitch;
    ++lightmapShadowLocks;perfCount(PerfCount::LightmapShadowLocks);
    return true;
}
void unlockLightmapShadow(Texture &t,Texture::Lock &l) {
    if(l.flags&D3DLOCK_READONLY)return;
    // The queued mirror is the exact contents after all preceding queue
    // writes, even if they have not completed. Only this CPU-owned lightmap
    // path can retain it; every external GPU write invalidates the mirror.
    lightmapRequestedBytes+=((l.region.size.width*t.format.bytes+255u)&~255u)*l.region.size.height;
    unsigned left=t.width,right=0,top=t.height,bottom=0;
    const unsigned x0=l.region.origin.x,x1=x0+l.region.size.width;
    const unsigned y0=l.region.origin.y,y1=y0+l.region.size.height;
    for(unsigned y=y0;y<y1;++y) {
        const auto *now=t.cpuShadow.data()+(y*t.width+x0)*t.format.bytes;
        const auto *old=t.cpuQueuedShadow.data()+(y*t.width+x0)*t.format.bytes;
        if(!memcmp(now,old,(x1-x0)*t.format.bytes))continue;
        unsigned first=x0,last=x1;
        while(first<last && !memcmp(now+(first-x0)*t.format.bytes,old+(first-x0)*t.format.bytes,t.format.bytes))++first;
        while(last>first && !memcmp(now+(last-x0-1)*t.format.bytes,old+(last-x0-1)*t.format.bytes,t.format.bytes))--last;
        left=std::min(left,first);right=std::max(right,last);top=std::min(top,y);bottom=y+1;
    }
    if(left>=right || top>=bottom){++lightmapUnchanged;return;}
    const MTLRegion changed=MTLRegionMake2D(left,top,right-left,bottom-top);
    auto &d=*t.lightmapDevice;
    endEncoder(d);beginCommand(d);
    const unsigned rowBytes=changed.size.width*t.format.bytes;
    const unsigned stagingPitch=(rowBytes+255u)&~255u;
    const unsigned size=stagingPitch*changed.size.height;
    const auto *source=t.cpuShadow.data()+changed.origin.y*t.width*t.format.bytes+changed.origin.x*t.format.bytes;
    const void *bytes=source;
    if(changed.origin.x!=0 || changed.size.width!=t.width || stagingPitch!=t.width*t.format.bytes) {
        l.data.resize(size);
        for(unsigned row=0;row<changed.size.height;++row)
            memcpy(l.data.data()+row*stagingPitch,source+row*t.width*t.format.bytes,rowBytes);
        bytes=l.data.data();
    }
    NSUInteger offset=0;auto buffer=d.upload(bytes,size,offset);
    auto blit=[d.command blitCommandEncoder];blit.label=@"Source ordered CPU lightmap update";
    [blit copyFromBuffer:buffer sourceOffset:offset sourceBytesPerRow:stagingPitch
        sourceBytesPerImage:0 sourceSize:changed.size toTexture:t.texture
        destinationSlice:0 destinationLevel:0 destinationOrigin:changed.origin];
    [blit endEncoding];
    for(unsigned row=0;row<changed.size.height;++row)
        memcpy(t.cpuQueuedShadow.data()+(row+changed.origin.y)*t.width*t.format.bytes+changed.origin.x*t.format.bytes,
               source+row*t.width*t.format.bytes,rowBytes);
    ++lightmapUploads;lightmapUploadBytes+=size;
    perfCount(PerfCount::Blits);perfCount(PerfCount::LightmapUploads);
    perfCount(PerfCount::LightmapUploadBytes,size);
}
void rememberLightmapWrite(Texture &t,const Texture::Lock &l) {
    if(!t.cpuLightmap || (l.flags&D3DLOCK_READONLY))return;
    const bool full=l.region.origin.x==0 && l.region.origin.y==0 &&
        l.region.size.width==t.width && l.region.size.height==t.height;
    if(full) {
        if(!t.cpuShadowValid)++lightmapRememberedPages;
        t.cpuShadow=l.data;t.cpuQueuedShadow=l.data;t.cpuShadowValid=true;
    } else if(t.cpuShadowValid) {
        const unsigned rowBytes=l.region.size.width*t.format.bytes;
        for(unsigned row=0;row<l.region.size.height;++row) {
            memcpy(t.cpuShadow.data()+(row+l.region.origin.y)*t.width*t.format.bytes+l.region.origin.x*t.format.bytes,
                   l.data.data()+row*l.pitch,rowBytes);
            memcpy(t.cpuQueuedShadow.data()+(row+l.region.origin.y)*t.width*t.format.bytes+l.region.origin.x*t.format.bytes,
                   l.data.data()+row*l.pitch,rowBytes);
        }
    }
}
extern "C" __attribute__((visibility("default"))) NSDictionary *SourceMetalCombatSnapshot() {
    return @{@"ordered_lightmap_uploads":@(icsm_metal_lightmap_upload.GetBool()),
        @"shadow_locks":@(lightmapShadowLocks),@"uploads":@(lightmapUploads),
        @"upload_bytes":@(lightmapUploadBytes),@"invalidations":@(lightmapInvalidations),
        @"requested_upload_bytes":@(lightmapRequestedBytes),@"unchanged_updates":@(lightmapUnchanged),
        @"remembered_full_pages":@(lightmapRememberedPages)};
}
