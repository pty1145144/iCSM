#include <metal_stdlib>
#include <metal_common>
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
	float4 v3 [[attribute(3)]];
	float4 v4 [[attribute(4)]];
	float4 v5 [[attribute(5)]];
	float4 v6 [[attribute(6)]];
	float4 v7 [[attribute(7)]];
	float4 v8 [[attribute(8)]];
	float4 v9 [[attribute(9)]];
};

struct source_main_Output
{
	float4 oPos [[position]];
	float4 oFog [[user(fog)]];
	float4 oD0 [[user(color0)]];
	float4 oT0 [[user(texcoord0)]];
	float4 oT4 [[user(texcoord4)]];
};

vertex source_main_Output source_main (
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c1 = float4(5.000000000e+00, 4.000000000e+00, 3.000000000e+00, 2.200000048e+00); (void) c1;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	#define c0 uniforms.uniforms_float4[0]
	#define c2 uniforms.uniforms_float4[1]
	#define c8 uniforms.uniforms_float4[2]
	#define c9 uniforms.uniforms_float4[3]
	#define c10 uniforms.uniforms_float4[4]
	#define c11 uniforms.uniforms_float4[5]
	#define c16 uniforms.uniforms_float4[6]
	#define c57 uniforms.uniforms_float4[7]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define v7 input.v7
	#define v8 input.v8
	#define v9 input.v9
	#define oPos output.oPos
	#define oFog output.oFog
	#define oD0 output.oD0
	#define oT0 output.oT0
	#define oT4 output.oT4
	r0 = v2 + v2;
	r0 = (v3 * -c1.xxxx) + r0;
	r0 = (v4 * c1.yyyy) + r0;
	r0 = r0 + -v5;
	r1 = v2;
	r2 = (v3 * c1.zzzz) + -r1;
	r2 = (v4 * -c1.zzzz) + r2;
	r2 = r2 + v5;
	r3.xyz = r2.xyz * v1.xxx;
	r2 = (v1.xxxx * r2) + r0;
	r0.xyz = (r3.yzx * c0.zzz) + r0.yzx;
	r1 = -r1 + v4;
	r1 = (v1.xxxx * r2) + r1;
	r0.xyz = (v1.xxx * r0.xyz) + r1.yzx;
	r0.xyz = r0.xyz * c0.www;
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.xyz = r0.www * r0.xyz;
	r2.xyz = v8.xyz;
	r3.xyz = -r2.zxy + v9.zxy;
	r2.xyz = (v1.xxx * r3.xyz) + r2.zxy;
	r3.xyz = r0.xyz * r2.xyz;
	r0.xyz = (r2.zxy * r0.yzx) + -r3.xyz;
	r2.xyz = normalize(r0.xyz);
	r0.x = v1.x * c0.w;
	r0 = (r0.xxxx * r1) + v3;
	r1.y = c0.y;
	r1.xy = -r1.yy + c57.wz;
	r1.xy = (v1.xx * r1.xy) + c0.yy;
	r0.w = r0.w * r1.x;
	r1.x = v1.z + -c0.w;
	r0.w = r0.w * r1.x;
	r0.xyz = (r2.xyz * r0.www) + r0.xyz;
	r0.w = c0.y;
	oPos.x = dot(r0, c8);
	oPos.y = dot(r0, c9);
	oPos.z = dot(r0, c10);
	oPos.w = dot(r0, c11);
	r0.xyz = -r0.xyz + c2.xyz;
	r0.x = dot(r0.xyz, r0.xyz);
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = (-r0.x * c16.w) + c16.x;
	oFog = max(r0.x, c16.z);
	r0 = -v6.zyyz + v6.xwwx;
	r2.yz = v1.yz;
	oT0 = (r2.zyyz * r0) + v6.zyyz;
	r0.x = log2(v0.x);
	r0.y = log2(v0.y);
	r0.z = log2(v0.z);
	r0.xyz = r0.xyz * c1.www;
	r2.x = exp2(r0.x);
	r2.y = exp2(r0.y);
	r2.z = exp2(r0.z);
	r0.x = log2(v7.x);
	r0.y = log2(v7.y);
	r0.z = log2(v7.z);
	r0.xyz = r0.xyz * c1.www;
	r3.x = exp2(r0.x);
	r3.y = exp2(r0.y);
	r3.z = exp2(r0.z);
	r2.w = v0.w;
	r3.w = v7.w;
	r0 = mix(r2, r3, v1.xxxx);
	oD0.w = r1.y * r0.w;
	oD0.xyz = r0.xyz;
	oT4 = c0.yyyy;
	#undef c0
	#undef c2
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c16
	#undef c57
	#undef v0
	#undef v1
	#undef v2
	#undef v3
	#undef v4
	#undef v5
	#undef v6
	#undef v7
	#undef v8
	#undef v9
	#undef oPos
	#undef oFog
	#undef oD0
	#undef oT0
	#undef oT4
	return output;
}

