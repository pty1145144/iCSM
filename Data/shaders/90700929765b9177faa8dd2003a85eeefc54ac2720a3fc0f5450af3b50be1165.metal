#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[12];
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
	const float4 c1 = float4(2.200000048e+00, 1.591549367e-01, 5.000000000e-01, 3.921568859e-03); (void) c1;
	const float4 c3 = float4(6.283185482e+00, -3.141592741e+00, 2.000000000e+00, -1.000000000e+00); (void) c3;
	const float4 c4 = float4(8.999999762e-01, -2.000000000e+00, 3.000000000e+00, 0.000000000e+00); (void) c4;
	const float4 c5 = float4(-1.550099228e-06, -2.170138941e-05, 2.604166744e-03, 2.604166802e-04); (void) c5;
	const float4 c6 = float4(-2.083333395e-02, -1.250000000e-01, 1.000000000e+00, 5.000000000e-01); (void) c6;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	#define c0 uniforms.uniforms_float4[0]
	#define c2 uniforms.uniforms_float4[1]
	#define c8 uniforms.uniforms_float4[2]
	#define c9 uniforms.uniforms_float4[3]
	#define c10 uniforms.uniforms_float4[4]
	#define c11 uniforms.uniforms_float4[5]
	#define c15 uniforms.uniforms_float4[6]
	#define c56 uniforms.uniforms_float4[7]
	#define c57 uniforms.uniforms_float4[8]
	#define c58 uniforms.uniforms_float4[9]
	#define c59 uniforms.uniforms_float4[10]
	#define c60 uniforms.uniforms_float4[11]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define oPos output.oPos
	#define oFog output.oFog
	#define oD0 output.oD0
	#define oT0 output.oT0
	#define oT4 output.oT4
	r0.x = log2(v0.x);
	r0.y = log2(v0.y);
	r0.z = log2(v0.z);
	r0.xyz = r0.xyz * c1.xxx;
	r1.x = exp2(r0.x);
	r1.y = exp2(r0.y);
	r1.z = exp2(r0.z);
	r1.w = v0.w;
	r0.x = dot(v1, c58);
	r0.y = dot(v1, c59);
	r0.z = dot(v1, c60);
	r2.xyz = r0.xyz + -c2.xyz;
	r0.w = dot(r2.xyz, r2.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r2 = r0.wwww * c56.xzwy;
	r3.x = (c56.w * r0.w) + -r2.y;
	r3.x = ((r3.x == 0.0) ? FLT_MAX : 1.0 / r3.x);
	r2.x = max(r2.x, v4.z);
	r3.y = (c56.z * -r0.w) + r2.x;
	r3.x = (r3.y * -r3.x) + c0.y;
	r3 = r1 * r3.xxxx;
	r2.yz = float2(r2.yz < r2.xx);
	r3 = (r2.zzzz * -r3) + r3;
	r4 = mix(r1, r3, r2.yyyy);
	r1.x = r0.w + -c57.x;
	r1.x = r1.x * c57.y;
	r1.x = max(r1.x, c0.x);
	r1.x = min(r1.x, c0.y);
	r1.x = -r1.x + c0.y;
	r3 = r1.xxxx * r4;
	r1.x = float(c0.x >= r1.x);
	r1.y = float(r3.w < c1.w);
	r1.z = -r2.x * r2.z;
	r1.z = (r2.y * r1.z) + r2.x;
	r1.x = (r1.x * -r1.z) + r1.z;
	r1.x = (r1.y * -r1.x) + r1.x;
	r1.x = min(r2.w, r1.x);
	r1.y = (r1.x * -c0.w) + r0.w;
	r1.z = r1.x * c0.w;
	r1.w = ((r1.z == 0.0) ? FLT_MAX : 1.0 / r1.z);
	r1.z = float(r1.z < r0.w);
	r1.y = r1.w * r1.y;
	r1.y = max(r1.y, c0.x);
	r1.y = min(r1.y, c0.y);
	r1.w = (r1.y * c4.y) + c4.z;
	r1.y = r1.y * r1.y;
	r1.y = r1.y * r1.w;
	r2 = (r3 * r1.yyyy) + -r3;
	r1.y = r1.x + r1.x;
	r0.w = float(r0.w < r1.y);
	r2 = r2 * r0.wwww;
	oD0 = (r1.zzzz * r2) + r3;
	r0.w = abs(v6.z);
	r2.z = float(c4.x < r0.w);
	r2.y = float(c4.x >= r0.w);
	r2.xw = c0.xy;
	r3.xyz = r2.xyz * v6.zxy;
	r2.xyz = (v6.yzx * r2.yzx) + -r3.xyz;
	r3.xyz = normalize(r2.xyz);
	r2.xyz = r3.yzx * v6.zxy;
	r2.xyz = (v6.yzx * r3.zxy) + -r2.xyz;
	r0.w = (v4.y * c1.y) + c1.z;
	r0.w = fract(r0.w);
	r0.w = (r0.w * c3.x) + c3.y;
	r4.xy = float2(cos(r0.w), sin(r0.w));
	r5 = (v5.xyyx * c3.zzzz) + c3.wwww;
	r5 = r5 * c15.xyyx;
	r4.yzw = r4.xyy * r5.xyw;
	r0.w = (r5.z * r4.x) + -r4.w;
	r1.y = r4.z + r4.y;
	r1.y = r1.x * r1.y;
	r0.w = r1.x * r0.w;
	r1.xyw = (r1.yyy * r2.xyz) + r0.xyz;
	r1.xyw = (r0.www * r3.xyz) + r1.xyw;
	r2.xyz = mix(r0.xyz, r1.xyw, r1.zzz);
	oPos.x = dot(r2, c8);
	oPos.y = dot(r2, c9);
	oPos.z = dot(r2, c10);
	oPos.w = dot(r2, c11);
	r0.xy = -v2.zw + v2.xy;
	r0.zw = (v5.yx * c15.yx) + c15.wz;
	oT0.xy = (r0.wz * r0.xy) + v2.zw;
	r0.xy = -v3.wz + v3.yx;
	oT0.zw = (r0.zw * r0.xy) + v3.wz;
	oT4 = c0.yyyy;
	oFog = c0.y;
	#undef c0
	#undef c2
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c15
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
	#undef v6
	#undef oPos
	#undef oFog
	#undef oD0
	#undef oT0
	#undef oT4
	return output;
}

