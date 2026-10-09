// A local index for Source's original (model, lighting, stencil) buckets.
// It changes lookup cost, not bucket insertion order, LOD or shadow geometry.
#include <vector>
#include <cstdint>
struct ICSMShadowBucketKey {
    const model_t *model;
    int lighting;
    unsigned stencil;
    bool operator==(const ICSMShadowBucketKey &rhs) const noexcept {
        return model==rhs.model && lighting==rhs.lighting && stencil==rhs.stencil;
    }
};
struct ICSMShadowBucketHash {
    size_t operator()(const ICSMShadowBucketKey &key) const noexcept {
        return (reinterpret_cast<uintptr_t>(key.model)>>4) ^
            (size_t(key.lighting)*0x9e3779b9u) ^ (size_t(key.stencil)<<3);
    }
};
class ICSMShadowBucketLookup {
    struct Cell {ICSMShadowBucketKey key{};int index=-1;};
    std::vector<Cell> cells;
public:
    void reserve(size_t count) {
        size_t capacity=128;while(capacity<count*2)capacity*=2;
        cells.resize(capacity);
    }
    int FindIndex(const ICSMShadowBucketKey &key) const {
        size_t slot=ICSMShadowBucketHash{}(key)&(cells.size()-1);
        while(cells[slot].index>=0) {
            if(cells[slot].key==key)return cells[slot].index;
            slot=(slot+1)&(cells.size()-1);
        }
        return -1;
    }
    void emplace(const ICSMShadowBucketKey &key,int index) {
        size_t slot=ICSMShadowBucketHash{}(key)&(cells.size()-1);
        while(cells[slot].index>=0 && !(cells[slot].key==key))slot=(slot+1)&(cells.size()-1);
        cells[slot]={key,index};
    }
};
#if defined(SOURCE_IOS)
static ConVar icsm_shadow_bucket_cache("icsm_shadow_bucket_cache","0",FCVAR_ARCHIVE|FCVAR_RELEASE,
    "Index original shadow-model buckets within each submission; preserve geometry and order",true,0,true,1);
static ConVar icsm_shadow_bucket_verify("icsm_shadow_bucket_verify","0",FCVAR_RELEASE,
    "Compare shadow bucket indices with the original linear search; disable during timing",true,0,true,1);
static unsigned long long icsmShadowBucketHits=0,icsmShadowBucketMisses=0;
static unsigned long long icsmShadowBucketChecks=0,icsmShadowBucketMismatches=0;
static bool ICSMShadowCacheEnabled(){return icsm_shadow_bucket_cache.GetBool();}
static bool ICSMShadowCacheVerify(){return icsm_shadow_bucket_verify.GetBool();}
CON_COMMAND(icsm_shadow_bucket_status,"Report shadow-only lookup and original-path verification counts") {
    Msg("ICSM_SHADOW_BUCKET enabled=%d hits=%llu misses=%llu checks=%llu mismatches=%llu\n",
        ICSMShadowCacheEnabled(),icsmShadowBucketHits,icsmShadowBucketMisses,
        icsmShadowBucketChecks,icsmShadowBucketMismatches);
}
#else
static bool ICSMShadowCacheEnabled(){return false;}
static bool ICSMShadowCacheVerify(){return false;}
static unsigned long long icsmShadowBucketHits=0,icsmShadowBucketMisses=0;
static unsigned long long icsmShadowBucketChecks=0,icsmShadowBucketMismatches=0;
#endif
