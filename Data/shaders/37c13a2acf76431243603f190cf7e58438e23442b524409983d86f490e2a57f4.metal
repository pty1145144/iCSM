#include <metal_stdlib>
#include <metal_common>
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
	float4 v3 [[attribute(3)]];
	float4 v4 [[attribute(4)]];
	float4 v5 [[attribute(5)]];
	float4 v6 [[attribute(6)]];
	float4 v7 [[attribute(7)]];
	float4 v8 [[attribute(8)]];
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
	const float4 c1 = float4(2.200000047, 0.159154935, 0.5, 0.0); (void) c1;
	const float4 c3 = float4(6.283185478, -3.141592739, 2.0, -1.0); (void) c3;
	const float4 c8 = float4(-0.00000155, -0.000021701, 0.002604166, 0.000260416); (void) c8;
	const float4 c9 = float4(-0.020833333, -0.125, 1.0, 0.5); (void) c9;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	#define c0 uniforms.uniforms_float4[0]
	#define c2 uniforms.uniforms_float4[1]
	#define c4 uniforms.uniforms_float4[2]
	#define c5 uniforms.uniforms_float4[3]
	#define c6 uniforms.uniforms_float4[4]
	#define c7 uniforms.uniforms_float4[5]
	#define c16 uniforms.uniforms_float4[6]
	#define c48 uniforms.uniforms_float4[7]
	#define c49 uniforms.uniforms_float4[8]
	#define c50 uniforms.uniforms_float4[9]
	#define c55 uniforms.uniforms_float4[10]
	#define c56 uniforms.uniforms_float4[11]
	#define c57 uniforms.uniforms_float4[12]
	#define c58 uniforms.uniforms_float4[13]
	#define c59 uniforms.uniforms_float4[14]
	#define c60 uniforms.uniforms_float4[15]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define v7 input.v7
	#define v8 input.v8
	#define oPos output.oPos
	#define oFog output.oFog
	#define oD0 output.oD0
	#define oT0 output.oT0
	#define oT1 output.oT1
	#define oT4 output.oT4
	r0.x = dot(v1, c58);
	r0.y = dot(v1, c59);
	r0.z = dot(v1, c60);
	r1.xyz = r0.xyz + -c2.xyz;
	r0.xyz = -r0.xyz + c2.xyz;
	r0.x = dot(r0.xyz, r0.xyz);
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = (r0.x * c16.w) + c16.x;
	r0.x = max(r0.x, c0.x);
	r0.x = min(r0.x, c0.y);
	r0.x = min(r0.x, c16.z);
	r0.y = c0.y;
	r0.x = (c55.z * -r0.x) + r0.y;
	r0.z = dot(r1.xyz, r1.xyz);
	r0.z = ((r0.z == 0.0) ? FLT_MAX : rsqrt(abs(r0.z)));
	r0.z = ((r0.z == 0.0) ? FLT_MAX : 1.0 / r0.z);
	r1.xyz = r0.zzz * c56.xzw;
	r0.w = (c56.w * r0.z) + -r1.y;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r1.x = max(r1.x, v4.z);
	r1.yz = float2(r1.yz < r1.xx);
	r1.x = (c56.z * -r0.z) + r1.x;
	r0.z = r0.z + -c57.x;
	r0.z = r0.z * c57.y;
	r0.z = max(r0.z, c0.x);
	r0.z = min(r0.z, c0.y);
	r0.z = -r0.z + c0.y;
	r0.w = (r1.x * -r0.w) + c0.y;
	r2.x = log2(v0.x);
	r2.y = log2(v0.y);
	r2.z = log2(v0.z);
	r2.xyz = r2.xyz * c1.xxx;
	r3.x = exp2(r2.x);
	r3.y = exp2(r2.y);
	r3.z = exp2(r2.z);
	r3.w = v0.w;
	r2 = r0.wwww * r3;
	r2 = (r1.zzzz * -r2) + r2;
	r4 = mix(r3, r2, r1.yyyy);
	r1 = r0.zzzz * r4;
	oD0.w = r0.x * r1.w;
	oD0.xyz = r1.xyz;
	r0.x = (v4.y * c1.y) + c1.z;
	r0.x = fract(r0.x);
	r0.x = (r0.x * c3.x) + c3.y;
	r1.xy = float2(cos(r0.x), sin(r0.x));
	r2 = (v5.xyyx * c3.zzzz) + c3.wwww;
	r0.xzw = r1.xyy * r2.xyw;
	r1.x = (r2.z * r1.x) + -r0.w;
	r1.y = r0.z + r0.x;
	r1.zw = c0.xy;
	r2.x = dot(r1.xyz, c48.xyz);
	r2.y = dot(r1.xyz, c49.xyz);
	r2.z = dot(r1.xyz, c50.xyz);
	r1.xyz = v1.xyz;
	r1.xyz = (v4.zzz * r2.xyz) + r1.xyz;
	oPos.x = dot(r1, c4);
	oPos.y = dot(r1, c5);
	oPos.z = dot(r1, c6);
	oPos.w = dot(r1, c7);
	r0.xz = -v2.zw + v2.xy;
	r1.xy = v5.xy;
	oT0.xy = (r1.xy * r0.xz) + v2.zw;
	r0.xz = -v3.wz + v3.yx;
	oT0.zw = (r1.yx * r0.xz) + v3.wz;
	r0.x = mix(c55.x, c55.y, v8.x);
	r0.zw = v5.yx + -c0.ww;
	r0.zw = r0.zw + r0.zw;
	r1.xy = r0.xx * r0.wz;
	r1.xy = (r1.xy * c0.ww) + c0.ww;
	r1.zw = -v6.zw + v6.xy;
	oT4.xy = (r1.xy * r1.zw) + v6.zw;
	r0.x = -r0.y + c55.x;
	r0.x = (v8.x * r0.x) + c0.y;
	r0.xy = r0.xx * r0.zw;
	r0.xy = (r0.xy * c0.ww) + c0.ww;
	r0.zw = -v7.wz + v7.yx;
	oT4.zw = (r0.xy * r0.zw) + v7.wz;
	oT1.xyw = v4.xxx * c0.yxx;
	oT1.z = v8.x;
	oFog = c0.y;
	#undef c0
	#undef c2
	#undef c4
	#undef c5
	#undef c6
	#undef c7
	#undef c16
	#undef c48
	#undef c49
	#undef c50
	#undef c55
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
	#undef v7
	#undef v8
	#undef oPos
	#undef oFog
	#undef oD0
	#undef oT0
	#undef oT1
	#undef oT4
	return output;
}

