// Explicit diagnostic only. Exercise actual D3D locks and queued Metal reads;
// old contents must survive DISCARD while the GPU command is still unsubmitted.
CON_COMMAND(icsm_buffer_selftest,"Verify Metal vertex/index rename ordering and partial locks") {
    auto dev=g_sourceCombatD3DDevice;
    if(!dev)return;
    auto &d=native<Device>(dev);
    if(d.profileRemaining) {Warning("ICSM_BUFFER_SELFTEST refused during sampling\n");return;}
    const bool previous=icsm_metal_buffer_reuse.GetBool();
    icsm_metal_buffer_reuse.SetValue(1);
    commit(d,true);reapRenameBuffers(d,true);
    NSMutableArray *results=[NSMutableArray array];
    auto verify=[&](auto buffer,const char *kind) {
        const unsigned length=4100, iterations=24;
        auto captured=[device() newBufferWithLength:length*iterations options:MTLResourceStorageModeShared];
        bool passed=captured!=nil;void *p=nullptr;
        if(passed)passed=buffer->Lock(0,length,&p,D3DLOCK_DISCARD)==S_OK;
        if(passed) {memset(p,17,length);passed=buffer->Unlock()==S_OK;}
        auto originalReuses=renameBufferPool.reuses;
        for(unsigned n=0;passed && n<iterations;++n) {
            endEncoder(d);beginCommand(d);
            auto old=native<Buffer>(buffer).buffer;
            auto encoder=[d.command blitCommandEncoder];
            [encoder copyFromBuffer:old sourceOffset:0 toBuffer:captured destinationOffset:n*length size:length];
            [encoder endEncoding];
            passed=buffer->Lock(0,length,&p,D3DLOCK_DISCARD)==S_OK;
            if(passed) {
                passed=native<Buffer>(buffer).buffer!=old;
                memset(p,18+n,length);passed=buffer->Unlock()==S_OK && passed;
            }
            // Each group also verifies reuse after completion, rather than
            // merely testing freshly allocated buffers with a pool enabled.
            if(n%8==7) {commit(d,true);reapRenameBuffers(d,true);}
        }
        commit(d,true);
        if(passed)for(unsigned n=0;n<iterations;++n) {
            auto bytes=static_cast<const uint8_t*>(captured.contents)+n*length;
            for(unsigned i=0;i<length;++i)if(bytes[i]!=17+n)passed=false;
        }
        const bool reused=renameBufferPool.reuses>originalReuses;
        passed=passed && reused;
        if(passed) {
            // A normal partial write preserves the untouched bytes.
            passed=buffer->Lock(37,11,&p,0)==S_OK;
            if(passed) {memset(p,201,11);passed=buffer->Unlock()==S_OK;}
            auto backing=native<Buffer>(buffer).buffer;
            passed=buffer->Lock(0,length,&p,D3DLOCK_READONLY)==S_OK && passed;
            if(passed) {
                for(unsigned i=0;i<length;++i)
                    if(static_cast<uint8_t*>(p)[i]!=(i>=37 && i<48 ? 201:17+iterations))passed=false;
                passed=backing==native<Buffer>(buffer).buffer && buffer->Unlock()==S_OK && passed;
            }
            passed=buffer->Lock(101,7,&p,D3DLOCK_NOOVERWRITE)==S_OK && passed;
            if(passed) {
                memset(p,91,7);
                passed=backing==native<Buffer>(buffer).buffer && buffer->Unlock()==S_OK;
            }
        }
        buffer->Release();
        [results addObject:@{@"kind":@(kind),@"passed":@(passed),@"completed_reuse":@(reused),@"queued_reads":@(iterations)}];
        return passed;
    };
    IDirect3DVertexBuffer9 *vertex=nullptr;IDirect3DIndexBuffer9 *index=nullptr;
    bool v=dev->CreateVertexBuffer(4100,D3DUSAGE_DYNAMIC,0,D3DPOOL_DEFAULT,&vertex,nullptr)==S_OK;
    bool i=dev->CreateIndexBuffer(4100,D3DUSAGE_DYNAMIC,D3DFMT_INDEX16,D3DPOOL_DEFAULT,&index,nullptr)==S_OK;
    if(v)v=verify(vertex,"vertex");if(i)i=verify(index,"index");
    icsm_metal_buffer_reuse.SetValue(previous);
    NSDictionary *report=@{@"passed":@(v && i),@"cases":results,@"pool":SourceMetalBufferSnapshot()};
    NSString *path=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/I5/buffer-selftest.json"];
    [[NSJSONSerialization dataWithJSONObject:report options:NSJSONWritingPrettyPrinted error:nil] writeToFile:path atomically:YES];
    Msg("ICSM_BUFFER_SELFTEST passed=%d vertex=%d index=%d\n",v && i,v,i);
}
