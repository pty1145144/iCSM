#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[170];
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
	const float4 c1 = float4(765.005859374, 0.0, 0.0, 0.0); (void) c1;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	int4 a0;
	const int ARRAYBASE_58 = 0;
	#define c0 uniforms.uniforms_float4[159]
	#define c2 uniforms.uniforms_float4[160]
	#define c8 uniforms.uniforms_float4[161]
	#define c9 uniforms.uniforms_float4[162]
	#define c10 uniforms.uniforms_float4[163]
	#define c11 uniforms.uniforms_float4[164]
	#define c16 uniforms.uniforms_float4[165]
	#define c49 uniforms.uniforms_float4[166]
	#define c50 uniforms.uniforms_float4[167]
	#define c51 uniforms.uniforms_float4[168]
	#define c52 uniforms.uniforms_float4[169]
	#define c58 uniforms.uniforms_float4[0]
	#define c59 uniforms.uniforms_float4[1]
	#define c60 uniforms.uniforms_float4[2]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
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
	r0.x = v1.y + v1.x;
	r0.x = -r0.x + c0.y;
	r0.yzw = v2.zyx * c1.xxx;
	a0.xyz = int3(floor(abs(r0.zyw) + float3(0.5)) * sign(r0.zyw));
	r1 = v1.yyyy * uniforms.uniforms_float4[ARRAYBASE_58 + a0.x];
	r1 = (uniforms.uniforms_float4[ARRAYBASE_58 + a0.y] * v1.xxxx) + r1;
	r1 = (uniforms.uniforms_float4[ARRAYBASE_58 + a0.z] * r0.xxxx) + r1;
	r2.x = dot(v0, r1);
	r3 = v1.yyyy * uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.x];
	r4 = v1.yyyy * uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.x];
	r4 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.y] * v1.xxxx) + r4;
	r3 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.y] * v1.xxxx) + r3;
	r3 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.z] * r0.xxxx) + r3;
	r0 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.z] * r0.xxxx) + r4;
	r2.y = dot(v0, r3);
	r2.z = dot(v0, r0);
	r2.w = c0.y;
	r4.y = dot(r2, c9);
	r5.y = -r4.y;
	r5.x = dot(r2, c8);
	r4.w = dot(r2, c11);
	r4.z = dot(r2, c10);
	oT7.xyz = r2.xyz;
	r2.xy = r4.ww + r5.xy;
	oPos.x = r5.x;
	oT5.xy = r2.xy * c0.ww;
	r2.x = dot(v0, c58);
	r2.y = dot(v0, c59);
	r2.z = dot(v0, c60);
	r2.xyz = -r2.xyz + c2.xyz;
	r0.w = dot(r2.xyz, r2.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r1.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r2.xyz = r0.www * r2.xyz;
	r0.w = (-r1.w * c16.w) + c16.x;
	oFog = max(r0.w, c16.z);
	oT6.xyz = -r2.xyz;
	r5.x = dot(v5.xyz, r1.xyz);
	r1.x = dot(v3.xyz, r1.xyz);
	r5.y = dot(v5.xyz, r3.xyz);
	r1.y = dot(v3.xyz, r3.xyz);
	r5.z = dot(v5.xyz, r0.xyz);
	r1.z = dot(v3.xyz, r0.xyz);
	r0.xyz = normalize(r5.xyz);
	oT1.x = dot(r2.xyz, r0.xyz);
	oT3.xyz = r0.xyz;
	r0.xyz = r5.yzx * r1.zxy;
	r0.xyz = (r1.yzx * r5.zxy) + -r0.xyz;
	r3.xyz = normalize(r1.xyz);
	r0.xyz = r0.xyz * v5.www;
	r1.xyz = normalize(r0.xyz);
	oT1.y = dot(r2.xyz, r1.xyz);
	oT4.xyz = r1.xyz;
	oT1.z = dot(r2.xyz, r3.xyz);
	oT2.xyz = r3.xyz;
	oT0.x = dot(v4, c49);
	oT0.y = dot(v4, c50);
	oT0.w = dot(v4, c51);
	oT0.z = dot(v4, c52);
	oPos.yzw = r4.yzw;
	oT7.w = r4.z;
	oT5.z = r4.w;
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
	#undef v3
	#undef v4
	#undef v5
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

