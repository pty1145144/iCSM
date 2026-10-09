// Included by the independent I5 source_device.mm. Observe the actual Metal
// attachments and D3D viewport used by Source draws, only when requested.
static unsigned resolutionAuditRemaining=0;
static NSMutableDictionary *resolutionAuditRows;
static NSMutableDictionary *resolutionAuditSamplerRows;
static NSDictionary *resolutionAuditResult=@{};
static void recordQualitySampler(const SourceMetal::Device &d,const SourceMetal::Shader &shader,
                                 unsigned slot,id<MTLTexture> texture,bool world)
{
    if(!texture || (!shader.worldMaterialSamplerMask && shader.name.find("phong")==std::string::npos &&
                   shader.name.find("vertexlit")==std::string::npos))return;
    const auto &cache=d.samplerCache[slot];
    const auto &state=d.state.sampler[slot];
    const unsigned originalAnisotropy=state[D3DSAMP_MINFILTER]==D3DTEXF_ANISOTROPIC || state[D3DSAMP_MAGFILTER]==D3DTEXF_ANISOTROPIC ? std::max(1u,std::min(16u,state[D3DSAMP_MAXANISOTROPY])):1;
    NSString *name=@(shader.name.c_str());
    NSString *key=[NSString stringWithFormat:@"%@/%u/%d/%g/%u/%lu/%lu/%lu",name,slot,world,cache.minLOD,
        cache.maxAnisotropy,(unsigned long)texture.width,(unsigned long)texture.height,(unsigned long)texture.mipmapLevelCount];
    NSMutableDictionary *row=resolutionAuditSamplerRows[key];
    if(!row && resolutionAuditSamplerRows.count<256) {
        row=[@{@"pixel_shader":name,@"slot":@(slot),@"world_eligible":@(world),
               @"min_lod":@(cache.minLOD),@"max_anisotropy":@(cache.maxAnisotropy),
               @"source_anisotropy":@(originalAnisotropy),
               @"texture_pixels":@[@(texture.width),@(texture.height)],
               @"mip_levels":@(texture.mipmapLevelCount),@"draws":@0} mutableCopy];
        resolutionAuditSamplerRows[key]=row;
    }
    if(row)row[@"draws"]=@([row[@"draws"] unsignedLongLongValue]+1);
}
static void recordResolutionDraw(const SourceMetal::Device &d,const SourceMetal::Image *image,
                                 const SourceMetal::Shader &shader) {
    if(!resolutionAuditRemaining)return;
    const auto &v=d.state.viewport;
    NSString *target=image?(image->image->texture.label?:@"unlabelled color target"):@"depth only";
    unsigned w=image?std::max(1u,image->image->width>>image->mip):d.renderWidth;
    unsigned h=image?std::max(1u,image->image->height>>image->mip):d.renderHeight;
    NSString *name=@(shader.name.c_str());
    NSString *key=[NSString stringWithFormat:@"%@/%u/%u/%u/%u/%u/%u/%@",target,w,h,v.X,v.Y,v.Width,v.Height,name];
    NSMutableDictionary *row=resolutionAuditRows[key];
    if(!row){
        row=[@{@"target":target,@"texture_pixels":@[@(w),@(h)],
                @"viewport_pixels":@[@(v.X),@(v.Y),@(v.Width),@(v.Height)],
                @"pixel_shader":name,@"draws":@0} mutableCopy];
        resolutionAuditRows[key]=row;
    }
    row[@"draws"]=@([row[@"draws"] unsignedLongLongValue]+1);
}
static void finishResolutionAudit(const SourceMetal::Device &d) {
    if(!resolutionAuditRemaining || --resolutionAuditRemaining)return;
    auto l=SourceMetal::layer();
    resolutionAuditResult=@{@"frame":@(d.frame),@"backbuffer_pixels":@[@(d.width),@(d.height)],
        @"drawable_pixels":@[@((unsigned)l.drawableSize.width),@((unsigned)l.drawableSize.height)],
        @"material_samplers":[resolutionAuditSamplerRows.allValues copy],
        @"draw_targets":[resolutionAuditRows.allValues copy]};
    resolutionAuditRows=nil;
    resolutionAuditSamplerRows=nil;
    NSData *data=[NSJSONSerialization dataWithJSONObject:resolutionAuditResult options:0 error:nil];
    Msg("ICSM_RESOLUTION_AUDIT %s\n",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding].UTF8String);
}
extern "C" __attribute__((visibility("default"))) NSDictionary *SourceMetalResolutionAuditSnapshot() {
    return resolutionAuditResult;
}
CON_COMMAND(icsm_metal_resolution_audit,"Record actual attachment and viewport sizes for the next Metal frame") {
    if(!g_sourceNativeDevice)return;
    resolutionAuditRows=[NSMutableDictionary dictionary];
    resolutionAuditSamplerRows=[NSMutableDictionary dictionary];
    resolutionAuditRemaining=std::max(1,std::min(3,args.ArgC()>1?atoi(args[1]):1));
}
