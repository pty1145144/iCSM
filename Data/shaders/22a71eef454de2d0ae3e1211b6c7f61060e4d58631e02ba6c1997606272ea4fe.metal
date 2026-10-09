#include <metal_stdlib>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[9];
};

struct source_main_Input
{
	float4 v0 [[attribute(0)]];
};

struct source_main_Output
{
	float4 oPos [[position]];
	float4 oT0 [[user(texcoord0)]];
};

vertex source_main_Output source_main (
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	float4 r0;
	float4 r1;
	#define c0 uniforms.uniforms_float4[0]
	#define c8 uniforms.uniforms_float4[1]
	#define c9 uniforms.uniforms_float4[2]
	#define c10 uniforms.uniforms_float4[3]
	#define c11 uniforms.uniforms_float4[4]
	#define c48 uniforms.uniforms_float4[5]
	#define c58 uniforms.uniforms_float4[6]
	#define c59 uniforms.uniforms_float4[7]
	#define c60 uniforms.uniforms_float4[8]
	#define v0 input.v0
	#define oPos output.oPos
	#define oT0 output.oT0
	r0.x = dot(v0, c58);
	r0.y = dot(v0, c59);
	r0.z = dot(v0, c60);
	r0.w = c0.y;
	oPos.x = dot(r0, c8);
	oPos.y = dot(r0, c9);
	r1.z = dot(r0, c10);
	r1.w = dot(r0, c11);
	r0.xy = r1.zw + -c48.yy;
	oPos.zw = r1.zw;
	r0.z = ((c48.x == 0.0) ? FLT_MAX : 1.0 / c48.x);
	oT0.xy = r0.zz * r0.xy;
	#undef c0
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c48
	#undef c58
	#undef c59
	#undef c60
	#undef v0
	#undef oPos
	#undef oT0
	return output;
}

