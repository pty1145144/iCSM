#include <metal_stdlib>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[3];
};

struct source_main_Input
{
	float4 v0 [[attribute(0)]];
	float4 v1 [[attribute(1)]];
};

struct source_main_Output
{
	float4 o0 [[position]];
	float4 o1 [[user(texcoord0)]];
	float4 o2 [[user(texcoord1)]];
};

vertex source_main_Output source_main (
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	float4 r0;
	#define c0 uniforms.uniforms_float4[0]
	#define c48 uniforms.uniforms_float4[1]
	#define c49 uniforms.uniforms_float4[2]
	#define v0 input.v0
	#define v1 input.v1
	#define o0 output.o0
	#define o1 output.o1
	#define o2 output.o2
	r0.xy = (v1.xy * c48.zw) + c48.xy;
	o2 = r0.xyxy + c49;
	o1.xy = r0.xy;
	o0 = (v0.xyzx * c0.yyyx) + c0.xxxy;
	o1.zw = v1.xy;
	#undef c0
	#undef c48
	#undef c49
	#undef v0
	#undef v1
	#undef o0
	#undef o1
	#undef o2
	return output;
}

