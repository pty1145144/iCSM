#include <metal_stdlib>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[8];
};

struct source_main_Input
{
	float4 v0 [[attribute(0)]];
	float4 v1 [[attribute(1)]];
	float4 v2 [[attribute(2)]];
};

struct source_main_Output
{
	float4 oPos [[position]];
	float4 oT3 [[user(texcoord3)]];
	float4 oT4 [[user(texcoord4)]];
	float4 oT5 [[user(texcoord5)]];
	float4 oT6 [[user(texcoord6)]];
	float4 oT7 [[user(texcoord7)]];
};

vertex source_main_Output source_main (
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	float4 r0;
	float4 r1;
	float4 r2;
	#define c0 uniforms.uniforms_float4[0]
	#define c8 uniforms.uniforms_float4[1]
	#define c9 uniforms.uniforms_float4[2]
	#define c10 uniforms.uniforms_float4[3]
	#define c11 uniforms.uniforms_float4[4]
	#define c58 uniforms.uniforms_float4[5]
	#define c59 uniforms.uniforms_float4[6]
	#define c60 uniforms.uniforms_float4[7]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define oPos output.oPos
	#define oT3 output.oT3
	#define oT4 output.oT4
	#define oT5 output.oT5
	#define oT6 output.oT6
	#define oT7 output.oT7
	r0.x = dot(v2.xyz, c58.xyz);
	r0.y = dot(v2.xyz, c59.xyz);
	r0.z = dot(v2.xyz, c60.xyz);
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	oT4.xyz = r0.www * r0.xyz;
	r1.x = dot(v1.xyz, c58.xyz);
	r1.y = dot(v1.xyz, c59.xyz);
	r1.z = dot(v1.xyz, c60.xyz);
	r2.xyz = r0.yzx * r1.zxy;
	r0.xyz = (r1.yzx * r0.zxy) + -r2.xyz;
	r0.xyz = r0.xyz * v2.www;
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	oT5.xyz = r0.www * r0.xyz;
	r0.x = dot(r1.xyz, r1.xyz);
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	oT6.xyz = r0.xxx * r1.xyz;
	r0.w = c0.y;
	r0.x = dot(v0, c58);
	r0.y = dot(v0, c59);
	r0.z = dot(v0, c60);
	r1.x = dot(r0, c8);
	r1.y = dot(r0, c9);
	r1.z = dot(r0, c10);
	r1.w = dot(r0, c11);
	oT3.xyz = r0.xyz;
	oPos = r1;
	oT7 = r1;
	#undef c0
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c58
	#undef c59
	#undef c60
	#undef v0
	#undef v1
	#undef v2
	#undef oPos
	#undef oT3
	#undef oT4
	#undef oT5
	#undef oT6
	#undef oT7
	return output;
}

