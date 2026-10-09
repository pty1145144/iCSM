// CPU-written vertex/index buffers only. All calls follow the existing single
// Source rendering thread; command buffers retain encoded resources as before.
// The last Source queue submission protects earlier uses on the same queue.
namespace SourceMetal {
struct BufferRetirement {
    id<MTLBuffer> buffer=nil;
    id<MTLCommandBuffer> command=nil;
    unsigned long long retiredFrame=0;
};
struct AvailableRenameBuffer {
    id<MTLBuffer> buffer=nil;
    unsigned long long retiredFrame=0;
};
struct RenameBufferPool {
    Device *owner=nullptr;
    std::map<NSUInteger,std::vector<AvailableRenameBuffer>> available;
    std::vector<BufferRetirement> pending;
    NSUInteger bytes=0, count=0;
    unsigned long long lastReapFrame=~0ull, allocations=0, reuses=0, evictions=0;
};
static RenameBufferPool renameBufferPool;
static constexpr NSUInteger renamePoolByteLimit=32*1024*1024, renamePoolCountLimit=128;
static void forgetRenameBuffers(Device &d) {
    if(renameBufferPool.owner==&d)renameBufferPool=RenameBufferPool{};
}
static void reapRenameBuffers(Device &d,bool force=false) {
    auto &pool=renameBufferPool;
    if(pool.owner!=&d) {pool=RenameBufferPool{};pool.owner=&d;}
    if(!force && pool.lastReapFrame==d.frame)return;
    pool.lastReapFrame=d.frame;
    for(auto it=pool.pending.begin();it!=pool.pending.end();) {
        if(!it->command || it->command.status==MTLCommandBufferStatusCompleted) {
            pool.available[it->buffer.length].push_back({it->buffer,it->retiredFrame});
            it=pool.pending.erase(it);
        }else ++it;
    }
}
static id<MTLBuffer> acquireRenameBuffer(Device &d,unsigned length) {
    const NSUInteger n=std::max(length,1u);
    if(icsm_metal_buffer_reuse.GetBool()) {
        reapRenameBuffers(d);
        auto &pool=renameBufferPool;
        auto it=pool.available.find(n);
        if(it!=pool.available.end()) {
            auto buffer=it->second.back().buffer;it->second.pop_back();
            if(it->second.empty())pool.available.erase(it);
            pool.bytes-=n;--pool.count;++pool.reuses;
            perfCount(PerfCount::BufferReuses);return buffer;
        }
    }else forgetRenameBuffers(d);
    ++renameBufferPool.allocations;perfCount(PerfCount::BufferAllocations);
    auto buffer=[device() newBufferWithLength:n options:MTLResourceStorageModeShared];
    if(!buffer)fatal("buffer rename allocation",@"out of memory");
    return buffer;
}
static void retireRenameBuffer(Device &d,id<MTLBuffer> buffer) {
    if(!icsm_metal_buffer_reuse.GetBool() || !buffer)return;
    reapRenameBuffers(d);
    auto &pool=renameBufferPool;
    // Cap ALL retained buffers, including in-flight batches. A miss allocates
    // without blocking; pooling never adds waitUntilCompleted to gameplay.
    if(buffer.length>renamePoolByteLimit)return;
    while(pool.count>=renamePoolCountLimit || buffer.length>renamePoolByteLimit-pool.bytes) {
        // Startup and map loading can leave many one-use sizes cached. Evict
        // the oldest COMPLETED entry so those cannot exclude hot geometry.
        // Pending entries are never candidates, regardless of memory pressure.
        auto oldest=pool.available.end();size_t index=0;auto frame=~0ull;
        for(auto it=pool.available.begin();it!=pool.available.end();++it)
            for(size_t i=0;i<it->second.size();++i)
                if(it->second[i].retiredFrame<=frame) {oldest=it;index=i;frame=it->second[i].retiredFrame;}
        if(oldest==pool.available.end())return;
        pool.bytes-=oldest->second[index].buffer.length;--pool.count;
        oldest->second.erase(oldest->second.begin()+index);
        if(oldest->second.empty())pool.available.erase(oldest);
        ++pool.evictions;perfCount(PerfCount::BufferEvictions);
    }
    pool.bytes+=buffer.length;++pool.count;
    auto command=d.command ?: d.lastSubmitted;
    if(!command || command.status==MTLCommandBufferStatusCompleted)
        pool.available[buffer.length].push_back({buffer,d.frame});
    else pool.pending.push_back({buffer,command,d.frame});
}
}
extern "C" __attribute__((visibility("default"))) NSDictionary *SourceMetalBufferSnapshot() {
    auto &p=SourceMetal::renameBufferPool;
    return @{@"enabled":@(icsm_metal_buffer_reuse.GetBool()),@"retained_bytes":@(p.bytes),
        @"retained_buffers":@(p.count),@"pending_buffers":@(p.pending.size()),
        @"allocations":@(p.allocations),@"reuses":@(p.reuses),
        @"evictions":@(p.evictions),
        @"byte_limit":@(SourceMetal::renamePoolByteLimit),@"count_limit":@(SourceMetal::renamePoolCountLimit)};
}
