#include <metal_stdlib>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[13];
};

struct source_main_Input
{
	float4 v0 [[attribute(0)]];
	float4 v1 [[attribute(1)]];
	float4 v2 [[attribute(2)]];
	float4 v3 [[attribute(3)]];
};

struct source_main_Output
{
	float4 oPos [[position]];
	float4 oFog [[user(fog)]];
	float4 oD1 [[user(color1)]];
	float4 oT0 [[user(texcoord0)]];
	float4 oT1 [[user(texcoord1)]];
};

vertex source_main_Output source_main (
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c1 = float4(2.200000048e+00, 0.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c1;
	float4 r0;
	float4 r1;
	#define c0 uniforms.uniforms_float4[0]
	#define c2 uniforms.uniforms_float4[1]
	#define c8 uniforms.uniforms_float4[2]
	#define c9 uniforms.uniforms_float4[3]
	#define c10 uniforms.uniforms_float4[4]
	#define c11 uniforms.uniforms_float4[5]
	#define c13 uniforms.uniforms_float4[6]
	#define c16 uniforms.uniforms_float4[7]
	#define c48 uniforms.uniforms_float4[8]
	#define c49 uniforms.uniforms_float4[9]
	#define c58 uniforms.uniforms_float4[10]
	#define c59 uniforms.uniforms_float4[11]
	#define c60 uniforms.uniforms_float4[12]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define oPos output.oPos
	#define oFog output.oFog
	#define oD1 output.oD1
	#define oT0 output.oT0
	#define oT1 output.oT1
	r0.w = c0.y;
	r1 = v0;
	r1.xyz = (v3.xyz * c13.xxx) + r1.xyz;
	r0.x = dot(r1, c58);
	r0.y = dot(r1, c59);
	r0.z = dot(r1, c60);
	oPos.x = dot(r0, c8);
	oPos.y = dot(r0, c9);
	oPos.w = dot(r0, c11);
	r0.w = dot(r0, c10);
	r1.xyz = -r0.xyz + c2.xyz;
	oT1 = r0;
	r0.x = dot(r1.xyz, r1.xyz);
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = (-r0.x * c16.w) + c16.x;
	oFog = max(r0.x, c16.z);
	r0.x = log2(v1.x);
	r0.y = log2(v1.y);
	r0.z = log2(v1.z);
	r0.xyz = r0.xyz * c1.xxx;
	oD1.x = exp2(r0.x);
	oD1.y = exp2(r0.y);
	oD1.z = exp2(r0.z);
	oT0.x = dot(v2, c48);
	oT0.y = dot(v2, c49);
	oPos.z = r0.w;
	oD1.w = v1.w;
	#undef c0
	#undef c2
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c13
	#undef c16
	#undef c48
	#undef c49
	#undef c58
	#undef c59
	#undef c60
	#undef v0
	#undef v1
	#undef v2
	#undef v3
	#undef oPos
	#undef oFog
	#undef oD1
	#undef oT0
	#undef oT1
	return output;
}

