// Explicit capability/GPU probe, based on Apple's MTLFXFrameInterpolator SDK
// contract. Two identical static frames have valid zero motion and fixed depth.
// This does not supply fabricated inputs to the game or present extra frames.
// Completion waits occur only inside this explicitly requested diagnostic.
CON_COMMAND(icsm_metal_frame_interpolation_probe,"Test native MetalFX frame interpolation on static synthetic frames; no gameplay integration") {
    auto d=g_sourceNativeDevice;if(!d || d->profileRemaining)return;
    @autoreleasepool {
    NSMutableDictionary *result=[@{@"scope":@"Static synthetic scene, not game frames or display pacing",
        @"device":device().name,@"supported":@NO,@"factory_created":@NO,@"passed":@NO,
        @"gameplay_interpolation_enabled":@NO,@"encoded_calls":@0} mutableCopy];
    if(@available(iOS 26.0, *)) {
        const bool supported=[MTLFXFrameInterpolatorDescriptor supportsDevice:device()];
        result[@"supported"]=@(supported);
        if(supported) {
            commit(*d,true);
            const unsigned w=256,h=192,pitch=w*4;
            auto desc=[MTLFXFrameInterpolatorDescriptor new];
            desc.inputWidth=desc.outputWidth=w;desc.inputHeight=desc.outputHeight=h;
            desc.colorTextureFormat=desc.outputTextureFormat=MTLPixelFormatBGRA8Unorm;
            desc.depthTextureFormat=MTLPixelFormatDepth32Float;
            desc.motionTextureFormat=MTLPixelFormatRG16Float;
            desc.uiTextureFormat=MTLPixelFormatBGRA8Unorm;
            auto effect=[desc newFrameInterpolatorWithDevice:device()];
            result[@"factory_created"]=@(effect!=nil);
            if(effect) {
                auto texture=[&](MTLPixelFormat format,MTLTextureUsage usage) {
                    auto t=[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:format width:w height:h mipmapped:NO];
                    t.storageMode=MTLStorageModePrivate;t.usage=usage|MTLTextureUsageRenderTarget;
                    return [device() newTextureWithDescriptor:t];
                };
                auto color=texture(desc.colorTextureFormat,effect.colorTextureUsage);
                auto previous=texture(desc.colorTextureFormat,effect.colorTextureUsage);
                auto depth=texture(desc.depthTextureFormat,effect.depthTextureUsage);
                auto motion=texture(desc.motionTextureFormat,effect.motionTextureUsage);
                auto output=texture(desc.outputTextureFormat,effect.outputTextureUsage);
                auto readback=[device() newBufferWithLength:pitch*h options:MTLResourceStorageModeShared];
                bool passed=color && previous && depth && motion && output && readback;
                NSMutableArray *calls=[NSMutableArray array];
                if(passed) {
                    effect.colorTexture=color;effect.prevColorTexture=previous;
                    effect.depthTexture=depth;effect.motionTexture=motion;effect.outputTexture=output;
                    effect.contentWidth=w;effect.contentHeight=h;
                    effect.motionVectorScaleX=effect.motionVectorScaleY=1;
                    effect.depthReversed=NO;effect.jitterOffsetX=effect.jitterOffsetY=0;
                    effect.deltaTime=1.0f/60;effect.nearPlane=0.1f;effect.farPlane=100;
                    effect.fieldOfView=60;effect.aspectRatio=float(w)/h;
                    if(@available(iOS 27.0,*)) {
                        effect.worldToViewMatrix=matrix_identity_float4x4;
                        const float ys=1/tanf(float(M_PI)/6),xs=ys/effect.aspectRatio;
                        const float z=effect.farPlane/(effect.nearPlane-effect.farPlane);
                        simd_float4x4 projection={};
                        projection.columns[0]=(simd_float4){xs,0,0,0};
                        projection.columns[1]=(simd_float4){0,ys,0,0};
                        projection.columns[2]=(simd_float4){0,0,z,-1};
                        projection.columns[3]=(simd_float4){0,0,effect.nearPlane*z,0};
                        effect.viewToClipMatrix=projection;
                    }
                    for(unsigned frame=0;frame<2;++frame) {
                        auto command=[d->queue commandBuffer];
                        command.label=@"iCSM explicit static MetalFX frame interpolation probe";
                        // Uniform opaque color represents an unmoving full-screen plane.
                        for(auto t:{color,previous,motion,output}) {
                            auto pass=[MTLRenderPassDescriptor renderPassDescriptor];
                            pass.colorAttachments[0].texture=t;
                            pass.colorAttachments[0].loadAction=MTLLoadActionClear;
                            pass.colorAttachments[0].storeAction=MTLStoreActionStore;
                            pass.colorAttachments[0].clearColor=(t==color || t==previous)?
                                MTLClearColorMake(208.0/255,160.0/255,96.0/255,1):MTLClearColorMake(0,0,0,0);
                            auto encoder=[command renderCommandEncoderWithDescriptor:pass];[encoder endEncoding];
                        }
                        auto pass=[MTLRenderPassDescriptor renderPassDescriptor];
                        pass.depthAttachment.texture=depth;pass.depthAttachment.clearDepth=0.5;
                        pass.depthAttachment.loadAction=MTLLoadActionClear;pass.depthAttachment.storeAction=MTLStoreActionStore;
                        auto encoder=[command renderCommandEncoderWithDescriptor:pass];[encoder endEncoding];
                        effect.shouldResetHistory=(frame==0);
                        [effect encodeToCommandBuffer:command];
                        auto blit=[command blitCommandEncoder];
                        [blit copyFromTexture:output sourceSlice:0 sourceLevel:0 sourceOrigin:MTLOriginMake(0,0,0)
                            sourceSize:MTLSizeMake(w,h,1) toBuffer:readback destinationOffset:0
                            destinationBytesPerRow:pitch destinationBytesPerImage:pitch*h];
                        [blit endEncoding];[command commit];[command waitUntilCompleted];
                        bool completed=command.status==MTLCommandBufferStatusCompleted && !command.error;
                        unsigned maxError=0;
                        auto pixels=static_cast<const uint8_t*>(readback.contents);
                        const uint8_t expected[]={96,160,208,255};
                        for(unsigned y=0;y<h;++y)for(unsigned x=0;x<w;++x)for(unsigned k=0;k<4;++k)
                            maxError=std::max(maxError,unsigned(abs(int(pixels[y*pitch+x*4+k])-int(expected[k]))));
                        [calls addObject:@{@"history_reset":@(frame==0),@"completed":@(completed),
                            @"max_color_error":@(maxError),@"error":command.error.description?:@""}];
                        passed=passed && completed && maxError<=4;
                    }
                }
                result[@"passed"]=@(passed);result[@"calls"]=calls;result[@"encoded_calls"]=@(calls.count);
                result[@"size"]=@[@(w),@(h)];
            }
        }
    }
    NSData *json=[NSJSONSerialization dataWithJSONObject:result options:NSJSONWritingPrettyPrinted error:nil];
    [json writeToFile:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/I5/frame-interpolation-probe.json"] atomically:YES];
    Msg("ICSM_FRAME_INTERPOLATION_PROBE supported=%d factory=%d static_gpu_passed=%d calls=%lu gameplay_enabled=0\n",
        [result[@"supported"] boolValue],[result[@"factory_created"] boolValue],[result[@"passed"] boolValue],
        (unsigned long)[result[@"encoded_calls"] unsignedLongLongValue]);
    }
}
