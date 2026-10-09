#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[15];
};

struct source_main_Input
{
	float4 v0 [[attribute(0)]];
	float4 v1 [[attribute(1)]];
	float4 v2 [[attribute(2)]];
	float4 v3 [[attribute(3)]];
	float4 v4 [[attribute(4)]];
	float4 v5 [[attribute(5)]];
};

struct source_main_Output
{
	float4 oPos [[position]];
	float4 oFog [[user(fog)]];
	float4 oD0 [[user(color0)]];
	float4 oT0 [[user(texcoord0)]];
	float4 oT1 [[user(texcoord1)]];
	float4 oT4 [[user(texcoord4)]];
};

vertex source_main_Output source_main (
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c1 = float4(2.200000048e+00, 1.591549367e-01, 5.000000000e-01, 0.000000000e+00); (void) c1;
	const float4 c3 = float4(6.283185482e+00, -3.141592741e+00, 2.000000000e+00, -1.000000000e+00); (void) c3;
	const float4 c8 = float4(-1.550099228e-06, -2.170138941e-05, 2.604166744e-03, 2.604166802e-04); (void) c8;
	const float4 c9 = float4(-2.083333395e-02, -1.250000000e-01, 1.000000000e+00, 5.000000000e-01); (void) c9;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	#define c0 uniforms.uniforms_float4[0]
	#define c2 uniforms.uniforms_float4[1]
	#define c4 uniforms.uniforms_float4[2]
	#define c5 uniforms.uniforms_float4[3]
	#define c6 uniforms.uniforms_float4[4]
	#define c7 uniforms.uniforms_float4[5]
	#define c15 uniforms.uniforms_float4[6]
	#define c48 uniforms.uniforms_float4[7]
	#define c49 uniforms.uniforms_float4[8]
	#define c50 uniforms.uniforms_float4[9]
	#define c56 uniforms.uniforms_float4[10]
	#define c57 uniforms.uniforms_float4[11]
	#define c58 uniforms.uniforms_float4[12]
	#define c59 uniforms.uniforms_float4[13]
	#define c60 uniforms.uniforms_float4[14]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define oPos output.oPos
	#define oFog output.oFog
	#define oD0 output.oD0
	#define oT0 output.oT0
	#define oT1 output.oT1
	#define oT4 output.oT4
	r0.x = dot(v1, c58);
	r0.y = dot(v1, c59);
	r0.z = dot(v1, c60);
	r0.xyz = r0.xyz + -c2.xyz;
	r0.x = dot(r0.xyz, r0.xyz);
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.yzw = r0.xxx * c56.xzw;
	r1.x = (c56.w * r0.x) + -r0.z;
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r0.y = max(r0.y, v4.z);
	r0.zw = float2(r0.zw < r0.yy);
	r0.y = (c56.z * -r0.x) + r0.y;
	r0.x = r0.x + -c57.x;
	r0.x = r0.x * c57.y;
	r0.x = max(r0.x, c0.x);
	r0.x = min(r0.x, c0.y);
	r0.x = -r0.x + c0.y;
	r0.y = (r0.y * -r1.x) + c0.y;
	r1.x = log2(v0.x);
	r1.y = log2(v0.y);
	r1.z = log2(v0.z);
	r1.xyz = r1.xyz * c1.xxx;
	r2.x = exp2(r1.x);
	r2.y = exp2(r1.y);
	r2.z = exp2(r1.z);
	r2.w = v0.w;
	r1 = r0.yyyy * r2;
	r1 = (r0.wwww * -r1) + r1;
	r3 = mix(r2, r1, r0.zzzz);
	oD0 = r0.xxxx * r3;
	r0.x = (v4.y * c1.y) + c1.z;
	r0.x = fract(r0.x);
	r0.x = (r0.x * c3.x) + c3.y;
	r1.xy = float2(cos(r0.x), sin(r0.x));
	r0 = (v5.xyyx * c3.zzzz) + c3.wwww;
	r0 = r0 * c15.xyyx;
	r0.xyw = r1.xyy * r0.xyw;
	r1.x = (r0.z * r1.x) + -r0.w;
	r1.y = r0.y + r0.x;
	r1.z = c0.x;
	r0.x = dot(r1.xyz, c48.xyz);
	r0.y = dot(r1.xyz, c49.xyz);
	r0.z = dot(r1.xyz, c50.xyz);
	r1.xyz = v1.xyz;
	r0.xyz = (v4.zzz * r0.xyz) + r1.xyz;
	r0.w = c0.y;
	oPos.x = dot(r0, c4);
	oPos.y = dot(r0, c5);
	oPos.z = dot(r0, c6);
	oPos.w = dot(r0, c7);
	r0.xy = -v2.zw + v2.xy;
	r0.zw = (v5.yx * c15.yx) + c15.wz;
	oT0.xy = (r0.wz * r0.xy) + v2.zw;
	r0.xy = -v3.wz + v3.yx;
	oT0.zw = (r0.zw * r0.xy) + v3.wz;
	oT1 = v4.xxxx * c0.yxxx;
	oT4 = c0.yyyy;
	oFog = c0.y;
	#undef c0
	#undef c2
	#undef c4
	#undef c5
	#undef c6
	#undef c7
	#undef c15
	#undef c48
	#undef c49
	#undef c50
	#undef c56
	#undef c57
	#undef c58
	#undef c59
	#undef c60
	#undef v0
	#undef v1
	#undef v2
	#undef v3
	#undef v4
	#undef v5
	#undef oPos
	#undef oFog
	#undef oD0
	#undef oT0
	#undef oT1
	#undef oT4
	return output;
}

