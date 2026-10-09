#include <metal_stdlib>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[16];
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
	float4 oFog [[user(fog)]];
	float4 oT0 [[user(texcoord0)]];
	float4 oT1 [[user(texcoord1)]];
	float4 oT2 [[user(texcoord2)]];
	float4 oT3 [[user(texcoord3)]];
	float4 oT4 [[user(texcoord4)]];
	float4 oT5 [[user(texcoord5)]];
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
	float4 r3;
	float4 r4;
	#define c0 uniforms.uniforms_float4[0]
	#define c2 uniforms.uniforms_float4[1]
	#define c8 uniforms.uniforms_float4[2]
	#define c9 uniforms.uniforms_float4[3]
	#define c10 uniforms.uniforms_float4[4]
	#define c11 uniforms.uniforms_float4[5]
	#define c16 uniforms.uniforms_float4[6]
	#define c49 uniforms.uniforms_float4[7]
	#define c50 uniforms.uniforms_float4[8]
	#define c52 uniforms.uniforms_float4[9]
	#define c53 uniforms.uniforms_float4[10]
	#define c54 uniforms.uniforms_float4[11]
	#define c55 uniforms.uniforms_float4[12]
	#define c58 uniforms.uniforms_float4[13]
	#define c59 uniforms.uniforms_float4[14]
	#define c60 uniforms.uniforms_float4[15]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define oPos output.oPos
	#define oFog output.oFog
	#define oT0 output.oT0
	#define oT1 output.oT1
	#define oT2 output.oT2
	#define oT3 output.oT3
	#define oT4 output.oT4
	#define oT5 output.oT5
	#define oT7 output.oT7
	r1.w = c0.y;
	r1.x = dot(v0, c58);
	r1.y = dot(v0, c59);
	r1.z = dot(v0, c60);
	r2.x = dot(r1, c8);
	r2.y = dot(r1, c9);
	r0.w = dot(r1, c11);
	r0.xy = r2.xy + r0.ww;
	oT2.xy = r0.xy * c0.ww;
	r2.z = -r2.y;
	r3.xyz = -r1.xyz + c2.xyz;
	r0.xy = r2.xy;
	r4.x = dot(r3.xyz, r3.xyz);
	r2.zw = r2.zx + r0.ww;
	r3.w = ((r4.x == 0.0) ? FLT_MAX : rsqrt(abs(r4.x)));
	oT2.zw = r2.zw * c0.ww;
	r2.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	oT1.xyz = r3.xyz;
	r2.w = (-r2.w * c16.w) + c16.x;
	oFog = max(r2.w, c16.z);
	oT0.x = dot(v1, c49);
	oT0.y = dot(v1, c50);
	oT5.x = dot(r1, c52);
	oT5.y = dot(r1, c53);
	oT5.z = dot(r1, c54);
	oT5.w = dot(r1, c55);
	r0.z = dot(r1, c10);
	oT4.xyz = r1.xyz;
	oPos = r0;
	oT3 = r0;
	oT7.xy = v2.xy;
	#undef c0
	#undef c2
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c16
	#undef c49
	#undef c50
	#undef c52
	#undef c53
	#undef c54
	#undef c55
	#undef c58
	#undef c59
	#undef c60
	#undef v0
	#undef v1
	#undef v2
	#undef oPos
	#undef oFog
	#undef oT0
	#undef oT1
	#undef oT2
	#undef oT3
	#undef oT4
	#undef oT5
	#undef oT7
	return output;
}

