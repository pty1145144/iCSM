#include <metal_stdlib>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[10];
};

struct source_main_Input
{
	float4 v0 [[attribute(0)]];
	float4 v1 [[attribute(1)]];
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
	#define c49 uniforms.uniforms_float4[6]
	#define c58 uniforms.uniforms_float4[7]
	#define c59 uniforms.uniforms_float4[8]
	#define c60 uniforms.uniforms_float4[9]
	#define v0 input.v0
	#define v1 input.v1
	#define oPos output.oPos
	#define oT0 output.oT0
	r0 = (v0.xyzx * c0.yyyx) + c0.xxxy;
	r1.x = dot(r0, c58);
	r1.y = dot(r0, c59);
	r1.z = dot(r0, c60);
	r1.w = c0.y;
	oPos.x = dot(r1, c8);
	oPos.y = dot(r1, c9);
	oPos.z = dot(r1, c10);
	oPos.w = dot(r1, c11);
	r0.xy = v1.xy * c48.xy;
	r0.x = r0.y + r0.x;
	oT0.x = r0.x + c48.w;
	r0.xy = v1.xy * c49.xy;
	r0.x = r0.y + r0.x;
	oT0.y = r0.x + c49.w;
	#undef c0
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c48
	#undef c49
	#undef c58
	#undef c59
	#undef c60
	#undef v0
	#undef v1
	#undef oPos
	#undef oT0
	return output;
}

