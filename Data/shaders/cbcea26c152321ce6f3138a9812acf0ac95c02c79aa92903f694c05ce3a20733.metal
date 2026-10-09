#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[14];
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
	const float4 c1 = float4(2.200000048e+00, 1.591549367e-01, 5.000000000e-01, 3.921568859e-03); (void) c1;
	const float4 c3 = float4(6.283185482e+00, -3.141592741e+00, 2.000000000e+00, -1.000000000e+00); (void) c3;
	const float4 c4 = float4(-1.550099228e-06, -2.170138941e-05, 2.604166744e-03, 2.604166802e-04); (void) c4;
	const float4 c5 = float4(-2.083333395e-02, -1.250000000e-01, 1.000000000e+00, 5.000000000e-01); (void) c5;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	#define c0 uniforms.uniforms_float4[0]
	#define c2 uniforms.uniforms_float4[1]
	#define c48 uniforms.uniforms_float4[2]
	#define c49 uniforms.uniforms_float4[3]
	#define c50 uniforms.uniforms_float4[4]
	#define c51 uniforms.uniforms_float4[5]
	#define c52 uniforms.uniforms_float4[6]
	#define c53 uniforms.uniforms_float4[7]
	#define c54 uniforms.uniforms_float4[8]
	#define c56 uniforms.uniforms_float4[9]
	#define c57 uniforms.uniforms_float4[10]
	#define c58 uniforms.uniforms_float4[11]
	#define c59 uniforms.uniforms_float4[12]
	#define c60 uniforms.uniforms_float4[13]
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
	r1 = r0.xxxx * c56.xzwy;
	r0.y = (c56.w * r0.x) + -r1.y;
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r0.z = max(r1.x, v4.z);
	r0.w = (c56.z * -r0.x) + r0.z;
	r0.x = r0.x + -c57.x;
	r0.x = r0.x * c57.y;
	r0.x = max(r0.x, c0.x);
	r0.x = min(r0.x, c0.y);
	r0.x = -r0.x + c0.y;
	r0.y = (r0.w * -r0.y) + c0.y;
	r2.x = log2(v0.x);
	r2.y = log2(v0.y);
	r2.z = log2(v0.z);
	r2.xyz = r2.xyz * c1.xxx;
	r3.x = exp2(r2.x);
	r3.y = exp2(r2.y);
	r3.z = exp2(r2.z);
	r3.w = v0.w;
	r2 = r0.yyyy * r3;
	r0.yw = float2(r1.yz < r0.zz);
	r2 = (r0.wwww * -r2) + r2;
	r4 = mix(r3, r2, r0.yyyy);
	r2 = r0.xxxx * r4;
	r0.x = float(c0.x >= r0.x);
	r1.x = float(r2.w < c1.w);
	oD0 = r2;
	r0.w = -r0.z * r0.w;
	r0.y = (r0.y * r0.w) + r0.z;
	r0.x = (r0.x * -r0.y) + r0.y;
	r0.x = (r1.x * -r0.x) + r0.x;
	r0.x = min(r1.w, r0.x);
	r0.yz = (v4.wy * c1.yy) + c1.zz;
	r0.yz = fract(r0.yz);
	r0.yz = (r0.yz * c3.xx) + c3.yy;
	r1.xy = float2(cos(r0.z), sin(r0.z));
	r2.xy = float2(cos(r0.y), sin(r0.y));
	r3 = (v5.xyyx * c3.zzzz) + c3.wwww;
	r0.yzw = r1.xyy * r3.xyw;
	r1.z = (r3.z * r1.x) + -r0.w;
	r0.y = r0.z + r0.y;
	r1.xy = r2.xy * -r0.yy;
	r1.w = -r1.y;
	r2.x = dot(v1, c48);
	r2.y = dot(v1, c49);
	r2.z = dot(v1, c50);
	r0.xyz = (r1.xzw * r0.xxx) + r2.xyz;
	r0.w = c0.y;
	oPos.x = dot(r0, c51);
	oPos.y = dot(r0, c52);
	oPos.z = dot(r0, c53);
	oPos.w = dot(r0, c54);
	r0.xy = -v2.zw + v2.xy;
	r1.xy = v5.xy;
	oT0.xy = (r1.xy * r0.xy) + v2.zw;
	r0.xy = -v3.wz + v3.yx;
	oT0.zw = (r1.yx * r0.xy) + v3.wz;
	oT1 = v4.xxxx * c0.yxxx;
	oT4 = c0.yyyy;
	oFog = c0.y;
	#undef c0
	#undef c2
	#undef c48
	#undef c49
	#undef c50
	#undef c51
	#undef c52
	#undef c53
	#undef c54
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

