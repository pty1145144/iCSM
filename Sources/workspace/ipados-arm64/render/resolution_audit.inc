// Included by the independent I5 source_device.mm. Observe the actual Metal
// attachments and D3D viewport used by Source draws, only when requested.
static unsigned resolutionAuditRemaining=0;
static NSMutableDictionary *resolutionAuditRows;
static NSDictionary *resolutionAuditResult=@{};
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
        @"draw_targets":[resolutionAuditRows.allValues copy]};
    resolutionAuditRows=nil;
    NSData *data=[NSJSONSerialization dataWithJSONObject:resolutionAuditResult options:0 error:nil];
    Msg("ICSM_RESOLUTION_AUDIT %s\n",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding].UTF8String);
}
extern "C" __attribute__((visibility("default"))) NSDictionary *SourceMetalResolutionAuditSnapshot() {
    return resolutionAuditResult;
}
CON_COMMAND(icsm_metal_resolution_audit,"Record actual attachment and viewport sizes for the next Metal frame") {
    if(!g_sourceNativeDevice)return;
    resolutionAuditRows=[NSMutableDictionary dictionary];
    resolutionAuditRemaining=std::max(1,std::min(3,args.ArgC()>1?atoi(args[1]):1));
}
