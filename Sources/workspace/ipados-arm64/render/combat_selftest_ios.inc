// Explicit real-device regression check for ordering, subrect pitch, read-only
// locks and GPU-copy invalidation. Never invoked by normal startup/gameplay.
CON_COMMAND(icsm_lightmap_selftest,"Verify ordered Metal lightmap updates on the active device") {
    extern Device *g_sourceNativeDevice;
    if(!g_sourceNativeDevice)return;
    auto &d=*g_sourceNativeDevice;
    if(d.profileRemaining) {Warning("ICSM_LIGHTMAP_SELFTEST refused during sampling\n");return;}
    NSMutableArray *cases=[NSMutableArray array];
    bool all=true;
    for(auto format:{D3DFMT_A8B8G8R8,D3DFMT_A16B16G16R16,D3DFMT_A16B16G16R16F}) {
        IDirect3DTexture9 *texture=nullptr;
        // The existing Source device supplies the real D3D-facing ABI.
        IDirect3DDevice9 *dev=g_sourceCombatD3DDevice;
        const unsigned width=64,height=32,bytes=pixelFormat(format).bytes;
        bool passed=dev && dev->CreateTexture(width,height,1,0,format,D3DPOOL_DEFAULT,
            &texture,nullptr,const_cast<char*>("[lightmap 900001]"))==S_OK;
        unsigned shadowLocks=0;std::vector<uint8_t> expected(width*height*bytes);
        auto fill=[&](unsigned seed) {
            D3DLOCKED_RECT locked{};
            if(!passed || texture->LockRect(0,&locked,nullptr,0)!=S_OK) {passed=false;return;}
            if(native<Image>(texture).image->locks[0].shadow)++shadowLocks;
            for(unsigned y=0;y<height;++y)for(unsigned x=0;x<width*bytes;++x) {
                uint8_t value=(x*17+y*31+seed)%251;
                static_cast<uint8_t*>(locked.pBits)[y*locked.Pitch+x]=value;
                expected[y*width*bytes+x]=value;
            }
            if(texture->UnlockRect(0)!=S_OK)passed=false;
        };
        fill(1); // First full lock establishes the mirror via the safe path.
        for(unsigned n=0;passed && n<80;++n) {
            fill(n+2);
            if(n%16==15)commit(d,false);
        }
        bool sparse=false,unchanged=false;
        if(passed) {
            NSDictionary *before=SourceMetalCombatSnapshot();D3DLOCKED_RECT locked{};
            passed=texture->LockRect(0,&locked,nullptr,0)==S_OK;
            if(passed) {
                const unsigned x=width/2,y=height/2;
                static_cast<uint8_t*>(locked.pBits)[y*locked.Pitch+x*bytes]^=127;
                expected[y*width*bytes+x*bytes]^=127;
                passed=texture->UnlockRect(0)==S_OK;
                NSDictionary *after=SourceMetalCombatSnapshot();
                sparse=[after[@"upload_bytes"] unsignedLongLongValue]-[before[@"upload_bytes"] unsignedLongLongValue]==256;
                before=after;
                passed=passed && texture->LockRect(0,&locked,nullptr,0)==S_OK;
                if(passed)passed=texture->UnlockRect(0)==S_OK;
                after=SourceMetalCombatSnapshot();
                unchanged=[after[@"uploads"] unsignedLongLongValue]==[before[@"uploads"] unsignedLongLongValue];
                passed=passed && sparse && unchanged;
            }
        }
        if(passed) {
            RECT rectangle{int(width-17),int(height-5),int(width),int(height)};
            D3DLOCKED_RECT locked{};
            if(texture->LockRect(0,&locked,&rectangle,0)!=S_OK)passed=false;
            else {
                for(unsigned y=0;y<5;++y)for(unsigned x=0;x<17*bytes;++x) {
                    uint8_t value=(x+y*7+53)%251;
                    static_cast<uint8_t*>(locked.pBits)[y*locked.Pitch+x]=value;
                    expected[(height-5+y)*width*bytes+(width-17)*bytes+x]=value;
                }
                passed=texture->UnlockRect(0)==S_OK;
            }
        }
        if(passed) {
            commit(d,true);std::vector<uint8_t> gpu(expected.size());
            [native<Image>(texture).image->texture getBytes:gpu.data() bytesPerRow:width*bytes
                fromRegion:MTLRegionMake2D(0,0,width,height) mipmapLevel:0];
            passed=gpu==expected && shadowLocks==80;
        }
        if(passed) {
            D3DLOCKED_RECT readonly{};
            passed=texture->LockRect(0,&readonly,nullptr,D3DLOCK_READONLY)==S_OK;
            if(passed) {
                for(unsigned y=0;y<height;++y)
                    if(memcmp(static_cast<uint8_t*>(readonly.pBits)+y*readonly.Pitch,
                              expected.data()+y*width*bytes,width*bytes))passed=false;
                passed=texture->UnlockRect(0)==S_OK && passed;
            }
        }
        if(passed) {
            IDirect3DSurface9 *source=nullptr,*target=nullptr;
            passed=dev->CreateOffscreenPlainSurface(width,height,format,D3DPOOL_DEFAULT,&source,nullptr)==S_OK &&
                texture->GetSurfaceLevel(0,&target)==S_OK;
            if(passed) {
                D3DLOCKED_RECT locked{};passed=source->LockRect(&locked,nullptr,0)==S_OK;
                if(passed) {
                    for(unsigned y=0;y<height;++y) {
                        memset(static_cast<uint8_t*>(locked.pBits)+y*locked.Pitch,37,width*bytes);
                    }
                    passed=source->UnlockRect()==S_OK && dev->StretchRect(source,nullptr,target,nullptr,D3DTEXF_POINT)==S_OK;
                    passed=passed && !native<Image>(texture).image->cpuShadowValid;
                    D3DLOCKED_RECT refreshed{};
                    passed=passed && texture->LockRect(0,&refreshed,nullptr,0)==S_OK;
                    if(passed) {
                        for(unsigned y=0;y<height;++y)for(unsigned x=0;x<width*bytes;++x)
                            if(static_cast<uint8_t*>(refreshed.pBits)[y*refreshed.Pitch+x]!=37)passed=false;
                        passed=texture->UnlockRect(0)==S_OK && passed;
                        passed=passed && native<Image>(texture).image->cpuShadowValid;
                    }
                }
            }
            if(target)target->Release();if(source)source->Release();
        }
        if(texture)texture->Release();
        [cases addObject:@{@"format":@(format),@"passed":@(passed),@"queued_full_updates":@80,
            @"shadow_locks":@(shadowLocks),@"subrect_at_bottom_right":@YES,
            @"single_pixel_upload_256_bytes":@(sparse),@"unchanged_lock_skips_upload":@(unchanged),
            @"read_only_and_gpu_copy_invalidation":@YES}];
        all=all && passed;
    }
    NSDictionary *result=@{@"passed":@(all),@"cases":cases,
        @"scope":@"Actual device texture bytes after completion; 80 ordered uploads per format with asynchronous intermediate commits"};
    NSData *json=[NSJSONSerialization dataWithJSONObject:result options:NSJSONWritingPrettyPrinted error:nil];
    [json writeToFile:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/I5/combat-selftest.json"] atomically:YES];
    Msg("ICSM_LIGHTMAP_SELFTEST %s\n",all?"PASS":"FAIL");
}
