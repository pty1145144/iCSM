// A real GPU regression test for overlapping, offset scene rectangles. Only
// runs on an explicit command; test-only completion waits never enter gameplay.
CON_COMMAND(icsm_metal_spatial_selftest,"Verify MetalFX GPU pixels and scene cropping on this device") {
    auto d=g_sourceNativeDevice;if(!d || d->profileRemaining)return;
    NSMutableArray *cases=[NSMutableArray array];bool all=true;
    for(auto f:{MTLPixelFormatBGRA8Unorm,MTLPixelFormatRGBA8Unorm}) {
        commit(*d,true);
        const unsigned w=97,h=73,pitch=512;
        ICSMSceneRect src{5,7,32,24},dst{9,11,64,48};
        auto desc=[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:f width:w height:h mipmapped:NO];
        desc.storageMode=MTLStorageModePrivate;desc.usage=MTLTextureUsageShaderRead|MTLTextureUsageRenderTarget;
        auto target=[device() newTextureWithDescriptor:desc];
        auto upload=[device() newBufferWithLength:pitch*h options:MTLResourceStorageModeShared];
        auto readback=[device() newBufferWithLength:pitch*h options:MTLResourceStorageModeShared];
        bool ok=target && upload && readback;unsigned outsideErrors=0, maxInsideError=0;
        auto original=static_cast<uint8_t*>(upload.contents);
        if(ok) {
            for(unsigned y=0;y<h;++y)for(unsigned x=0;x<w;++x) {
                bool in=int(x)>=src.x && int(x)<src.x+src.width && int(y)>=src.y && int(y)<src.y+src.height;
                uint8_t c[]={uint8_t(in?96:3),uint8_t(in?160:17),uint8_t(in?208:39),255};
                memcpy(original+y*pitch+x*4,c,4);
            }
            beginCommand(*d);auto b=[d->command blitCommandEncoder];
            [b copyFromBuffer:upload sourceOffset:0 sourceBytesPerRow:pitch sourceBytesPerImage:pitch*h
                sourceSize:MTLSizeMake(w,h,1) toTexture:target destinationSlice:0 destinationLevel:0 destinationOrigin:MTLOriginMake(0,0,0)];
            [b endEncoding];
            ok=spatialEncode(*d,target,0,0,src,dst);
            b=[d->command blitCommandEncoder];
            [b copyFromTexture:target sourceSlice:0 sourceLevel:0 sourceOrigin:MTLOriginMake(0,0,0)
                sourceSize:MTLSizeMake(w,h,1) toBuffer:readback destinationOffset:0 destinationBytesPerRow:pitch destinationBytesPerImage:pitch*h];
            [b endEncoding];commit(*d,true);
            ok=ok && d->lastSubmitted.status==MTLCommandBufferStatusCompleted && !d->lastSubmitted.error;
            auto pixels=static_cast<uint8_t*>(readback.contents);
            for(unsigned y=0;y<h;++y)for(unsigned x=0;x<w;++x) {
                bool in=int(x)>=dst.x && int(x)<dst.x+dst.width && int(y)>=dst.y && int(y)<dst.y+dst.height;
                uint8_t c[]={96,160,208,255};
                for(unsigned k=0;k<4;++k) {
                    unsigned error=abs(int(pixels[y*pitch+x*4+k])-int(in?c[k]:original[y*pitch+x*4+k]));
                    if(in)maxInsideError=std::max(maxInsideError,error);else if(error)++outsideErrors;
                }
            }
            ok=ok && !outsideErrors && maxInsideError<=2;
        }
        [cases addObject:@{@"format":@(f),@"passed":@(ok),@"outside_destination_errors":@(outsideErrors),
            @"constant_color_max_error":@(maxInsideError),@"source":@[@5,@7,@32,@24],@"destination":@[@9,@11,@64,@48]}];
        all=all && ok;
    }
    // The test changes descriptor size. Recreate for the next real scene.
    spatialForget(*d);
    NSDictionary *result=@{@"passed":@(all),@"supported":@(spatialSupport()),@"cases":cases,
        @"scope":@"Actual GPU readback; overlapping source/destination, nonzero origins, untouched pixels outside destination"};
    NSData *json=[NSJSONSerialization dataWithJSONObject:result options:NSJSONWritingPrettyPrinted error:nil];
    [json writeToFile:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/I5/spatial-selftest.json"] atomically:YES];
    Msg("ICSM_SPATIAL_SELFTEST %s\n",all?"PASS":"FAIL");
}
