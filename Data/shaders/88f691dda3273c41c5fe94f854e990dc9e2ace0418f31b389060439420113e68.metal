#include <metal_stdlib>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[6];
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
	#define c48 uniforms.uniforms_float4[0]
	#define c49 uniforms.uniforms_float4[1]
	#define c50 uniforms.uniforms_float4[2]
	#define c51 uniforms.uniforms_float4[3]
	#define c52 uniforms.uniforms_float4[4]
	#define c53 uniforms.uniforms_float4[5]
	#define v0 input.v0
	#define v1 input.v1
	#define o0 output.o0
	#define o1 output.o1
	#define o2 output.o2
	r0.xy = c48.xy * v1.xy;
	r0.x = r0.y + r0.x;
	o1.z = r0.x + c48.w;
	r0.xy = c49.xy * v1.xy;
	r0.x = r0.y + r0.x;
	o1.w = r0.x + c49.w;
	r0.xy = c50.xy * v1.xy;
	r0.x = r0.y + r0.x;
	o2.x = r0.x + c50.w;
	r0.xy = c51.xy * v1.xy;
	r0.x = r0.y + r0.x;
	o2.y = r0.x + c51.w;
	r0.xy = c52.xy * v1.xy;
	r0.x = r0.y + r0.x;
	o2.z = r0.x + c52.w;
	r0.xy = c53.xy * v1.xy;
	r0.x = r0.y + r0.x;
	o2.w = r0.x + c53.w;
	o0 = v0;
	o1.xy = v1.xy;
	#undef c48
	#undef c49
	#undef c50
	#undef c51
	#undef c52
	#undef c53
	#undef v0
	#undef v1
	#undef o0
	#undef o1
	#undef o2
	return output;
}

