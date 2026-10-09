#include <metal_stdlib>
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
	float4 oT6 [[user(texcoord6)]];
	float4 oT7 [[user(texcoord7)]];
};

vertex source_main_Output source_main (
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c1 = float4(-128.0, -64.0, 0.015873017, 1.0); (void) c1;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	#define c0 uniforms.uniforms_float4[0]
	#define c2 uniforms.uniforms_float4[1]
	#define c8 uniforms.uniforms_float4[2]
	#define c9 uniforms.uniforms_float4[3]
	#define c10 uniforms.uniforms_float4[4]
	#define c11 uniforms.uniforms_float4[5]
	#define c16 uniforms.uniforms_float4[6]
	#define c49 uniforms.uniforms_float4[7]
	#define c50 uniforms.uniforms_float4[8]
	#define c51 uniforms.uniforms_float4[9]
	#define c52 uniforms.uniforms_float4[10]
	#define c58 uniforms.uniforms_float4[11]
	#define c59 uniforms.uniforms_float4[12]
	#define c60 uniforms.uniforms_float4[13]
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
	#define oT6 output.oT6
	#define oT7 output.oT7
	r0.w = c0.y;
	r0.x = dot(v0, c58);
	r0.y = dot(v0, c59);
	r0.z = dot(v0, c60);
	r1.y = dot(r0, c9);
	r2.y = -r1.y;
	r2.x = dot(r0, c8);
	r1.w = dot(r0, c11);
	r1.z = dot(r0, c10);
	r2.yz = r1.ww + r2.xy;
	oPos.x = r2.x;
	oT5.xy = r2.yz * c0.ww;
	r2.xyz = -r0.xyz + c2.xyz;
	oT7.xyz = r0.xyz;
	r0.x = dot(r2.xyz, r2.xyz);
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r0.y = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.xzw = r0.xxx * r2.xyz;
	r0.y = (-r0.y * c16.w) + c16.x;
	oFog = max(r0.y, c16.z);
	oT6.xyz = -r0.xzw;
	r2 = v1 + c1.xxxx;
	r3 = abs(r2);
	r2 = float4(r2 < c0.xxxx);
	r3 = -r2 + r3;
	r2.xyz = (r2.xzw * -c0.zzz) + c0.yyy;
	r3 = r3 + c1.yyyy;
	r4 = abs(r3);
	r3 = float4(r3 < c0.xxxx);
	r4 = -r3 + r4;
	r3 = (r3 * -c0.zzzz) + c0.yyyy;
	r5.xy = (r4.xz * -c1.zz) + c1.ww;
	r5.xy = (r4.yw * -c1.zz) + r5.xy;
	r4 = r4 * c1.zzzz;
	r6.z = r5.y;
	r6.xy = r4.zw;
	r5.zw = r4.xy;
	r4.xyz = normalize(r5.zwx);
	r5.xyz = normalize(r6.xyz);
	r6.xy = r3.zw * r5.xy;
	r6.z = r2.y * r5.z;
	r3.xy = r3.xy * r4.xy;
	r3.z = r2.x * r4.z;
	r4.x = dot(r6.xyz, c58.xyz);
	r4.y = dot(r6.xyz, c59.xyz);
	r4.z = dot(r6.xyz, c60.xyz);
	r5.xyz = normalize(r4.xyz);
	oT1.x = dot(r0.xzw, r5.xyz);
	oT3.xyz = r5.xyz;
	r5.x = dot(r3.xyz, c58.xyz);
	r5.y = dot(r3.xyz, c59.xyz);
	r5.z = dot(r3.xyz, c60.xyz);
	r2.xyw = r4.yzx * r5.zxy;
	r2.xyw = (r5.yzx * r4.zxy) + -r2.xyw;
	r3.xyz = normalize(r5.xyz);
	r2.xyz = r2.zzz * r2.xyw;
	r4.xyz = normalize(r2.xyz);
	oT1.y = dot(r0.xzw, r4.xyz);
	oT4.xyz = r4.xyz;
	oT1.z = dot(r0.xzw, r3.xyz);
	oT2.xyz = r3.xyz;
	oT0.x = dot(v2, c49);
	oT0.y = dot(v2, c50);
	oT0.w = dot(v2, c51);
	oT0.z = dot(v2, c52);
	oPos.yzw = r1.yzw;
	oT7.w = r1.z;
	oT5.z = r1.w;
	#undef c0
	#undef c2
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c16
	#undef c49
	#undef c50
	#undef c51
	#undef c52
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
	#undef oT6
	#undef oT7
	return output;
}

