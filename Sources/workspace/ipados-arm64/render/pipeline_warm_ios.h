#pragma once
namespace SourceMetal {
void warmRegisterFunction(id<MTLFunction> function, id<MTLLibrary> library, NSString *key, NSString *policy);
id<MTLLibrary> warmLibrary(NSString *key, NSString *policy);
id<MTLLibrary> warmProceduralLibrary(NSString *source);
id<MTLFunction> warmProceduralFunction(id<MTLLibrary> library, NSString *source, NSString *entry);
id<MTLRenderPipelineState> warmPipeline(Device &d, MTLRenderPipelineDescriptor *descriptor);
void warmInitialize(Device &d);
void warmForget(Device &d);
void warmCheckpoint(Device &d, bool force=false);
}
extern "C" void SourceMetalPipelineCheckpoint(bool force);
