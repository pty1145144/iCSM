// Included by native_resources.mm, in SourceMetal. Descriptors are captured
// from actual successful Source draws. No shader permutation is invented.
#include "pipeline_warm_identity.h"
#include <CommonCrypto/CommonDigest.h>
#include <atomic>
#include "touch_ios.h"
static Device *warmOwner=nullptr;
static NSMutableDictionary *warmRecords=nil,*warmFunctions=nil,*warmLibraries=nil;
static std::map<std::string,id<MTLRenderPipelineState>> warmStates;
static std::map<void*,id<MTLFunction>> warmFunctionOwners;
static NSString *warmPath=nil;
static NSMutableArray *warmArchiveDescriptors=nil;
static dispatch_queue_t warmSaveQueue=nullptr;
static std::atomic<bool> warmSavePending{false};
static std::atomic<uint64_t> warmSavedRevision{0},warmSaves{0},warmSaveFailures{0};
static std::atomic<double> warmSaveMS{0};
static uint64_t warmRevision=0;
static bool warmDirty=false;
static double warmChanged=0,warmLoadMS=0;
static uint64_t warmLoaded=0,warmHits=0,warmNew=0,warmFailures=0,warmArchiveHits=0,warmArchiveMisses=0;
static constexpr uint64_t warmArchiveLimit=64ULL*1024*1024;
static std::atomic<uint64_t> warmArchiveBytes{0};
static uint64_t warmLegacyArchiveBytes=0;
static NSString *warmFolder();
static uint64_t warmFileBytes(NSString *path) {
    NSDictionary *attributes=[[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil];
    return [attributes[NSFileSize] unsignedLongLongValue];
}
void warmLoadArchive(Device &d) {
    NSString *folder=warmFolder();if(!folder)return;
    auto files=NSFileManager.defaultManager;
    [files createDirectoryAtPath:folder withIntermediateDirectories:YES attributes:nil error:nil];
    // The old archive repeatedly re-imported its own script when checkpointed.
    // Never feed that accumulated script to Metal again. Shader libraries and
    // verified descriptor manifests remain valid and regenerate a compact file.
    NSString *legacy=[folder stringByAppendingPathComponent:[NSString stringWithFormat:@"pipelines-%llu.binary.metallib",device().registryID]];
    warmLegacyArchiveBytes=warmFileBytes(legacy);
    if(warmLegacyArchiveBytes)[files removeItemAtPath:legacy error:nil];
    d.archiveURL=[NSURL fileURLWithPath:[folder stringByAppendingPathComponent:[NSString stringWithFormat:@"pipelines-%llu-compact-v2.binary.metallib",device().registryID]]];
    warmArchiveBytes=warmFileBytes(d.archiveURL.path);
    auto descriptor=[MTLBinaryArchiveDescriptor new];NSError *error=nil;
    if(warmArchiveBytes.load() && warmArchiveBytes.load()<=warmArchiveLimit)descriptor.url=d.archiveURL;
    else if(warmArchiveBytes.load()) {
        Warning("ICSM_PIPELINE oversized optional archive discarded: %llu bytes\n",warmArchiveBytes.load());
        [files removeItemAtURL:d.archiveURL error:nil];warmArchiveBytes=0;
    }
    d.archive=[device() newBinaryArchiveWithDescriptor:descriptor error:&error];
    if(!d.archive && descriptor.url) {
        descriptor.url=nil;error=nil;warmArchiveBytes=0;
        d.archive=[device() newBinaryArchiveWithDescriptor:descriptor error:&error];
    }
    if(!d.archive)Warning("ICSM_PIPELINE binary cache unavailable; using normal compilation\n");
    Msg("ICSM_PIPELINE compact archive bytes=%llu discarded_legacy_bytes=%llu\n",warmArchiveBytes.load(),warmLegacyArchiveBytes);
}
// Build 81 uses the identical descriptor schema and shader keys. Accept only
// that known identity when migrating its existing prewarm manifest; every
// entry still passes shader SHA256 and complete descriptor round-trip checks.
static NSString *warmLegacyIdentity=@"96281ecd81821ea4ecf033fcd361550b78d5e2f07a989b283076d1bc51121ef1";
static void warmRememberDescriptor(MTLRenderPipelineDescriptor *descriptor) {
    MTLRenderPipelineDescriptor *snapshot=[descriptor copy];snapshot.binaryArchives=nil;
    [warmArchiveDescriptors addObject:snapshot];++warmRevision;
}
static NSString *warmHash(NSData *data) {
    unsigned char bytes[CC_SHA256_DIGEST_LENGTH];CC_SHA256(data.bytes,(CC_LONG)data.length,bytes);
    NSMutableString *s=[NSMutableString string];for(auto b:bytes)[s appendFormat:@"%02x",b];return s;
}
static NSString *warmFolder() { const char *p=getenv("SOURCE_METAL_CACHE");return p?@(p):nil; }
static NSString *warmLibraryID(NSString *key,NSString *policy) {return [policy stringByAppendingString:key];}
static bool warmValidKey(NSString *key) {
    if(![key isKindOfClass:NSString.class] || key.length!=64)return false;
    return [key rangeOfCharacterFromSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789abcdef"] invertedSet]].location==NSNotFound;
}
id<MTLLibrary> warmLibrary(NSString *key,NSString *policy) {
    return warmLibraries[warmLibraryID(key,policy)];
}
void warmRegisterFunction(id<MTLFunction> f,id<MTLLibrary> lib,NSString *key,NSString *policy) {
    if(!f || !warmValidKey(key) || !warmOwner)return;
    warmLibraries[warmLibraryID(key,policy)]=lib;
    warmFunctions[[NSValue valueWithPointer:(__bridge void*)f]]=@{@"key":key,@"policy":policy,@"entry":f.name};
    warmFunctionOwners[(__bridge void*)f]=f;
}
id<MTLLibrary> warmProceduralLibrary(NSString *source) {
    NSString *key=warmHash([source dataUsingEncoding:NSUTF8StringEncoding]);
    id<MTLLibrary> lib=warmLibrary(key,@"default");if(lib)return lib;
    NSString *path=[[warmFolder() stringByAppendingPathComponent:key] stringByAppendingString:@".metal"];
    [source writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
    NSError *e=nil;lib=[device() newLibraryWithSource:source options:nil error:&e];
    if(!lib)fatal("procedural shader",e.localizedDescription);
    warmLibraries[warmLibraryID(key,@"default")]=lib;return lib;
}
id<MTLFunction> warmProceduralFunction(id<MTLLibrary> lib,NSString *source,NSString *entry) {
    auto f=[lib newFunctionWithName:entry];warmRegisterFunction(f,lib,warmHash([source dataUsingEncoding:NSUTF8StringEncoding]),@"default");return f;
}
static NSDictionary *warmFunction(id<MTLFunction> f) {
    return f?warmFunctions[[NSValue valueWithPointer:(__bridge void*)f]]:nil;
}
// These are all immutable fields used by the Source Draw/Clear/StretchRect
// implementations. OS+code identity also guard SDK defaults for unused fields.
static NSDictionary *warmDescribe(MTLRenderPipelineDescriptor *d) {
    NSDictionary *v=warmFunction(d.vertexFunction),*f=warmFunction(d.fragmentFunction);
    if(!v || (d.fragmentFunction && !f))return nil;
    NSMutableArray *attrs=[NSMutableArray array],*layouts=[NSMutableArray array],*colors=[NSMutableArray array];
    if(d.vertexDescriptor)for(NSUInteger i=0;i<31;++i) {
        auto a=d.vertexDescriptor.attributes[i];auto l=d.vertexDescriptor.layouts[i];
        [attrs addObject:@[@(a.format),@(a.offset),@(a.bufferIndex)]];
        [layouts addObject:@[@(l.stride),@(l.stepFunction),@(l.stepRate)]];
    }
    for(NSUInteger i=0;i<8;++i) {auto c=d.colorAttachments[i];
        [colors addObject:@[@(c.pixelFormat),@(c.blendingEnabled),@(c.sourceRGBBlendFactor),@(c.destinationRGBBlendFactor),@(c.rgbBlendOperation),@(c.sourceAlphaBlendFactor),@(c.destinationAlphaBlendFactor),@(c.alphaBlendOperation),@(c.writeMask)]];
    }
    return @{@"vertex":v,@"fragment":f?:NSNull.null,@"attributes":attrs,@"layouts":layouts,@"colors":colors,
        @"depth":@(d.depthAttachmentPixelFormat),@"stencil":@(d.stencilAttachmentPixelFormat),@"samples":@(d.rasterSampleCount),
        @"coverage":@(d.alphaToCoverageEnabled),@"alpha_one":@(d.alphaToOneEnabled),@"raster":@(d.rasterizationEnabled),
        @"topology":@(d.inputPrimitiveTopology),@"indirect":@(d.supportIndirectCommandBuffers)};
}
static NSString *warmRecordID(NSDictionary *r) {return warmHash([NSJSONSerialization dataWithJSONObject:r options:NSJSONWritingSortedKeys error:nil]);}
static id<MTLRenderPipelineState> warmBuild(Device &d,MTLRenderPipelineDescriptor *desc,NSError **error) {
    if(d.archive) {
        desc.binaryArchives=@[d.archive];
        id<MTLRenderPipelineState> p=[device() newRenderPipelineStateWithDescriptor:desc options:MTLPipelineOptionFailOnBinaryArchiveMiss reflection:nil error:error];
        if(p){++warmArchiveHits;return p;}
        ++warmArchiveMisses;*error=nil;
        // Keep the live archive read-only. Mutating an imported archive expands
        // its serialized script in RAM; only the fresh checkpoint writer adds
        // descriptors. Missing binaries use the ordinary compilation fallback.
        desc.binaryArchives=nil;d.archiveDirty=true;
    }
    return [device() newRenderPipelineStateWithDescriptor:desc error:error];
}
id<MTLRenderPipelineState> warmPipeline(Device &d,MTLRenderPipelineDescriptor *desc) {
    NSDictionary *record=warmDescribe(desc);NSString *identity=record?warmRecordID(record):nil;
    if(identity) {auto it=warmStates.find(identity.UTF8String);if(it!=warmStates.end()){++warmHits;return it->second;}}
    perfCount(PerfCount::PipelineMisses);const double start=d.profileRemaining?Plat_FloatTime():0;
    NSError *error=nil;auto p=warmBuild(d,desc,&error);
    if(!p)fatal("pipeline",[NSString stringWithFormat:@"%@: %@",desc.label,error.localizedDescription]);
    warmRememberDescriptor(desc);
    if(start)perfPipelineTime((Plat_FloatTime()-start)*1000);
    ++warmNew;
    if(identity) {
        warmStates[identity.UTF8String]=p;
        if(!warmRecords[identity]){warmRecords[identity]=record;warmDirty=true;warmChanged=Plat_FloatTime();}
    }
    return p;
}
static id<MTLFunction> warmLoadFunction(NSDictionary *r) {
    if(![r isKindOfClass:NSDictionary.class])return nil;
    NSString *key=r[@"key"],*policy=r[@"policy"],*entry=r[@"entry"];
    if(!warmValidKey(key) || ![entry isKindOfClass:NSString.class] ||
       !([policy isEqual:@"source32"] || [policy isEqual:@"default"]))return nil;
    id<MTLLibrary> lib=warmLibrary(key,policy);NSError *e=nil;
    if(!lib) {
        NSString *path=[warmFolder() stringByAppendingPathComponent:key];
        NSData *source=[NSData dataWithContentsOfFile:[path stringByAppendingString:@".metal"]];
        if(!source || ![warmHash(source) isEqual:key])return nil;
        // newLibraryWithData releases the input file before Metal retains data.
        NSData *data=[NSData dataWithContentsOfFile:[path stringByAppendingString:@".metallib"]];
        if(data && [policy isEqual:@"source32"]) {
            dispatch_data_t dispatchData=dispatch_data_create(data.bytes,data.length,nullptr,^{(void)data;});
            lib=[device() newLibraryWithData:dispatchData error:&e];
        }
        if(!lib) {MTLCompileOptions *o=nil;
            if([policy isEqual:@"source32"]){o=[MTLCompileOptions new];o.fastMathEnabled=NO;o.languageVersion=MTLLanguageVersion3_2;}
            lib=[device() newLibraryWithSource:[[NSString alloc] initWithData:source encoding:NSUTF8StringEncoding] options:o error:&e];
        }
        if(!lib)return nil;
    }
    auto f=[lib newFunctionWithName:entry];warmRegisterFunction(f,lib,key,policy);return f;
}
static MTLRenderPipelineDescriptor *warmRestore(NSDictionary *r) {
    if(![r isKindOfClass:NSDictionary.class])return nil;
    auto desc=[MTLRenderPipelineDescriptor new];desc.vertexFunction=warmLoadFunction(r[@"vertex"]);
    if(!desc.vertexFunction)return nil;
    if(r[@"fragment"]!=NSNull.null){desc.fragmentFunction=warmLoadFunction(r[@"fragment"]);if(!desc.fragmentFunction)return nil;}
    NSArray *attrs=r[@"attributes"],*layouts=r[@"layouts"],*colors=r[@"colors"];
    if(![attrs isKindOfClass:NSArray.class] || ![layouts isKindOfClass:NSArray.class] || ![colors isKindOfClass:NSArray.class] ||
       colors.count!=8 || attrs.count!=layouts.count || (attrs.count && attrs.count!=31))return nil;
    if(attrs.count){auto v=[MTLVertexDescriptor new];for(NSUInteger i=0;i<31;++i){
        NSArray *a=attrs[i],*l=layouts[i];if(a.count!=3 || l.count!=3)return nil;
        v.attributes[i].format=(MTLVertexFormat)[a[0] unsignedIntegerValue];v.attributes[i].offset=[a[1] unsignedIntegerValue];v.attributes[i].bufferIndex=[a[2] unsignedIntegerValue];
        v.layouts[i].stride=[l[0] unsignedIntegerValue];v.layouts[i].stepFunction=(MTLVertexStepFunction)[l[1] unsignedIntegerValue];v.layouts[i].stepRate=[l[2] unsignedIntegerValue];
    }desc.vertexDescriptor=v;}
    for(NSUInteger i=0;i<8;++i){NSArray *a=colors[i];if(a.count!=9)return nil;auto c=desc.colorAttachments[i];
        c.pixelFormat=(MTLPixelFormat)[a[0] unsignedIntegerValue];c.blendingEnabled=[a[1] boolValue];c.sourceRGBBlendFactor=(MTLBlendFactor)[a[2] unsignedIntegerValue];c.destinationRGBBlendFactor=(MTLBlendFactor)[a[3] unsignedIntegerValue];c.rgbBlendOperation=(MTLBlendOperation)[a[4] unsignedIntegerValue];c.sourceAlphaBlendFactor=(MTLBlendFactor)[a[5] unsignedIntegerValue];c.destinationAlphaBlendFactor=(MTLBlendFactor)[a[6] unsignedIntegerValue];c.alphaBlendOperation=(MTLBlendOperation)[a[7] unsignedIntegerValue];c.writeMask=(MTLColorWriteMask)[a[8] unsignedIntegerValue];
    }
    desc.depthAttachmentPixelFormat=(MTLPixelFormat)[r[@"depth"] unsignedIntegerValue];desc.stencilAttachmentPixelFormat=(MTLPixelFormat)[r[@"stencil"] unsignedIntegerValue];desc.rasterSampleCount=[r[@"samples"] unsignedIntegerValue];desc.alphaToCoverageEnabled=[r[@"coverage"] boolValue];desc.alphaToOneEnabled=[r[@"alpha_one"] boolValue];desc.rasterizationEnabled=[r[@"raster"] boolValue];desc.inputPrimitiveTopology=(MTLPrimitiveTopologyClass)[r[@"topology"] unsignedIntegerValue];desc.supportIndirectCommandBuffers=[r[@"indirect"] boolValue];
    // Round-trip equality prevents partially restored entries entering cache.
    if(![warmDescribe(desc) isEqual:r])return nil;
    return desc;
}
void warmInitialize(Device &d) {
    warmOwner=&d;warmRecords=[NSMutableDictionary dictionary];warmFunctions=[NSMutableDictionary dictionary];warmLibraries=[NSMutableDictionary dictionary];warmStates.clear();warmFunctionOwners.clear();warmDirty=false;
    NSString *name=[NSString stringWithFormat:@"pipeline-descriptors-%llu-%s.json",device().registryID,ICSM_PIPELINE_IDENTITY];
    warmPath=[warmFolder() stringByAppendingPathComponent:name];
    warmArchiveDescriptors=[NSMutableArray array];
    if(!warmSaveQueue)warmSaveQueue=dispatch_queue_create("iCSM immutable pipeline cache writer",dispatch_queue_attr_make_with_qos_class(DISPATCH_QUEUE_SERIAL,QOS_CLASS_UTILITY,0));
    const char *enabled=getenv("ICSM_PIPELINE_PREWARM");if(enabled && !strcmp(enabled,"0"))return;
    double start=Plat_FloatTime();NSData *data=warmFileBytes(warmPath)<=16*1024*1024?[NSData dataWithContentsOfFile:warmPath]:nil;
    bool migrating=false;
    if(!data) {
        NSString *legacy=[warmFolder() stringByAppendingPathComponent:[NSString stringWithFormat:@"pipeline-descriptors-%llu-%@.json",device().registryID,warmLegacyIdentity]];
        data=warmFileBytes(legacy)<=16*1024*1024?[NSData dataWithContentsOfFile:legacy]:nil;migrating=data!=nil;
    }
    if(!data || data.length>16*1024*1024)return;
    NSDictionary *manifest=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    if(![manifest isKindOfClass:NSDictionary.class] || ![manifest[@"identity"] isEqual:(migrating?warmLegacyIdentity:@ICSM_PIPELINE_IDENTITY)] ||
       ![manifest[@"os"] isEqual:NSProcessInfo.processInfo.operatingSystemVersionString] ||
       [manifest[@"registry"] unsignedLongLongValue]!=device().registryID)return;
    NSDictionary *records=manifest[@"records"];if(![records isKindOfClass:NSDictionary.class] || records.count>2048)return;
    for(NSString *key in records) { @autoreleasepool {
        NSDictionary *record=records[key];
        if(!warmValidKey(key) || ![record isKindOfClass:NSDictionary.class] || ![warmRecordID(record) isEqual:key]){++warmFailures;continue;}
        // Cache corruption never makes startup fatal. Malformed entries skip.
        @try {auto desc=warmRestore(record);if(!desc){++warmFailures;continue;}
            NSError *error=nil;auto p=warmBuild(d,desc,&error);if(!p){++warmFailures;continue;}
            warmRememberDescriptor(desc);
            warmStates[key.UTF8String]=p;warmRecords[key]=record;++warmLoaded;
        } @catch(NSException *e) {++warmFailures;Warning("ICSM_PIPELINE skipped malformed descriptor\n");}
    }}
    warmLoadMS=(Plat_FloatTime()-start)*1000;
    if(migrating){warmDirty=true;warmChanged=Plat_FloatTime();}
    // Restored, already archived descriptors are not new work. In particular,
    // cold launch must not immediately reload and rewrite an unchanged archive.
    if(!migrating && !d.archiveDirty)warmSavedRevision=warmRevision;
    Msg("ICSM_PIPELINE_PREWARM loaded=%llu failures=%llu time_ms=%.3f\n",warmLoaded,warmFailures,warmLoadMS);
}
void warmCheckpoint(Device &d,bool force) {
    // Even lifecycle-forced checkpoints defer Metal compilation during a match.
    // All new immutable descriptors stay available for the next lobby checkpoint.
    if(SourceTouchSessionActive())return;
    if(warmOwner!=&d || (!warmDirty && !d.archiveDirty && warmRevision<=warmSavedRevision.load()))return;
    if(warmSavePending.load() || !warmArchiveDescriptors.count || !warmPath || !d.archiveURL)return;
    if(!force && Plat_FloatTime()-warmChanged<10)return;
    NSDictionary *manifest=@{@"schema":@1,@"identity":@ICSM_PIPELINE_IDENTITY,@"os":NSProcessInfo.processInfo.operatingSystemVersionString,@"registry":@(device().registryID),@"records":warmRecords};
    NSData *data=[NSJSONSerialization dataWithJSONObject:manifest options:NSJSONWritingSortedKeys error:nil];
    if(!data)return;
    // Never serialize the renderer's mutable archive or access Device/manifest
    // globals from the worker. These copied, immutable actual descriptors own
    // their functions. A separate archive is built and published atomically.
    // UIKit deactivation/termination must return without waiting for Metal's
    // compiler or filesystem; an interrupted save retains the previous cache.
    NSArray *descriptors=[warmArchiveDescriptors copy];
    NSString *manifestPath=[warmPath copy];NSURL *url=d.archiveURL;id<MTLDevice> gpu=device();
    const auto revision=warmRevision;
    warmSavePending=true;warmDirty=false;d.archiveDirty=false;warmChanged=Plat_FloatTime();
    dispatch_async(warmSaveQueue,^{@autoreleasepool {
        const double began=CACurrentMediaTime();NSError *error=nil;
        auto desc=[MTLBinaryArchiveDescriptor new];
        // Start empty every time. Importing the previous archive before adding
        // the full descriptor snapshot duplicates its script on each checkpoint.
        auto archive=[gpu newBinaryArchiveWithDescriptor:desc error:&error];
        bool ok=archive!=nil;
        for(MTLRenderPipelineDescriptor *pipeline in descriptors) {
            if(!ok)break;
            ok=[archive addRenderPipelineFunctionsWithDescriptor:pipeline error:&error];
        }
        NSString *suffix=[NSString stringWithFormat:@".%@.tmp",NSUUID.UUID.UUIDString];
        NSURL *temporary=[NSURL fileURLWithPath:[url.path stringByAppendingString:suffix]];
        if(ok)ok=[archive serializeToURL:temporary error:&error];
        uint64_t bytes=ok?warmFileBytes(temporary.path):0;
        if(ok && (!bytes || bytes>warmArchiveLimit))ok=false;
        if(ok)ok=rename(temporary.path.UTF8String,url.path.UTF8String)==0;
        [[NSFileManager defaultManager] removeItemAtURL:temporary error:nil];
        if(ok)ok=[data writeToFile:manifestPath atomically:YES];
        warmSaveMS=(CACurrentMediaTime()-began)*1000;
        if(ok){warmArchiveBytes=bytes;warmSavedRevision=revision;++warmSaves;}
        else{++warmSaveFailures;fprintf(stderr,"ICSM_PIPELINE async cache save failed; previous cache retained: %s\n",error.localizedDescription.UTF8String?:"publication failed");}
        warmSavePending=false;
    }});
}
void warmForget(Device &d) {warmCheckpoint(d,true);warmStates.clear();warmFunctions=nil;warmFunctionOwners.clear();warmLibraries=nil;warmRecords=nil;warmArchiveDescriptors=nil;warmOwner=nullptr;}
extern "C" __attribute__((visibility("default"))) void SourceMetalPipelineCheckpoint(bool force) {if(warmOwner)warmCheckpoint(*warmOwner,force);}
extern "C" __attribute__((visibility("default"))) NSDictionary *SourceMetalPipelineSnapshot() {
    return @{@"identity":@ICSM_PIPELINE_IDENTITY,@"loaded":@(warmLoaded),@"prewarm_ms":@(warmLoadMS),@"hits":@(warmHits),@"new_states":@(warmNew),@"failures":@(warmFailures),@"archive_hits":@(warmArchiveHits),@"archive_misses":@(warmArchiveMisses),@"saves":@(warmSaves.load()),@"records":@(warmRecords.count),@"dirty":@(warmDirty || warmRevision>warmSavedRevision.load()),@"save_pending":@(warmSavePending.load()),@"save_failures":@(warmSaveFailures.load()),@"save_worker_ms":@(warmSaveMS.load()),@"archive_bytes":@(warmArchiveBytes.load()),@"archive_limit_bytes":@(warmArchiveLimit),@"discarded_legacy_bytes":@(warmLegacyArchiveBytes),@"persistence":@"Fresh compact snapshot; live archive read-only; match checkpoints deferred",@"manifest":warmPath.lastPathComponent?:@""};
}
CON_COMMAND(icsm_metal_pipeline_save,"Checkpoint the actual device pipeline archive and immutable descriptors") {SourceMetalPipelineCheckpoint(true);}
CON_COMMAND(icsm_metal_pipeline_stats,"Print actual prewarm/archive hit counters") {
    NSData *data=[NSJSONSerialization dataWithJSONObject:SourceMetalPipelineSnapshot() options:0 error:nil];
    Msg("ICSM_PIPELINE_STATS %s\n",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding].UTF8String);
}
