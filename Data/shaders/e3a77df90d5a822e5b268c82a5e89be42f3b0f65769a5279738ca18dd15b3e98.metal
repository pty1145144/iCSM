#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[169];
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
	float4 oD0 [[user(color0)]];
	float4 oT0 [[user(texcoord0)]];
	float4 oT1 [[user(texcoord1)]];
	float4 oT7 [[user(texcoord7)]];
};

vertex source_main_Output source_main (
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c1 = float4(7.650058594e+02, 0.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c1;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	int4 a0;
	const int ARRAYBASE_58 = 0;
	#define c0 uniforms.uniforms_float4[159]
	#define c8 uniforms.uniforms_float4[160]
	#define c9 uniforms.uniforms_float4[161]
	#define c10 uniforms.uniforms_float4[162]
	#define c11 uniforms.uniforms_float4[163]
	#define c47 uniforms.uniforms_float4[164]
	#define c48 uniforms.uniforms_float4[165]
	#define c49 uniforms.uniforms_float4[166]
	#define c50 uniforms.uniforms_float4[167]
	#define c51 uniforms.uniforms_float4[168]
	#define c58 uniforms.uniforms_float4[0]
	#define c59 uniforms.uniforms_float4[1]
	#define c60 uniforms.uniforms_float4[2]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define oPos output.oPos
	#define oFog output.oFog
	#define oD0 output.oD0
	#define oT0 output.oT0
	#define oT1 output.oT1
	#define oT7 output.oT7
	r0.x = v1.y + v1.x;
	r0.x = -r0.x + c0.y;
	r0.yzw = v2.zyx * c1.xxx;
	a0.xyz = int3(floor(abs(r0.zyw) + float3(0.5)) * sign(r0.zyw));
	r1 = v1.yyyy * uniforms.uniforms_float4[ARRAYBASE_58 + a0.x];
	r1 = (uniforms.uniforms_float4[ARRAYBASE_58 + a0.y] * v1.xxxx) + r1;
	r1 = (uniforms.uniforms_float4[ARRAYBASE_58 + a0.z] * r0.xxxx) + r1;
	r1.x = dot(v0, r1);
	r2 = v1.yyyy * uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.x];
	r3 = v1.yyyy * uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.x];
	r3 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.y] * v1.xxxx) + r3;
	r2 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.y] * v1.xxxx) + r2;
	r2 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.z] * r0.xxxx) + r2;
	r0 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.z] * r0.xxxx) + r3;
	r1.z = dot(v0, r0);
	r1.y = dot(v0, r2);
	r1.w = c0.y;
	oPos.x = dot(r1, c8);
	oPos.y = dot(r1, c9);
	oPos.w = dot(r1, c11);
	r0.x = dot(r1, c10);
	oT7.xyz = r1.xyz;
	oT0.x = dot(v3, c48);
	oT0.y = dot(v3, c49);
	oT1.x = dot(v3, c50);
	oT1.y = dot(v3, c51);
	oPos.z = r0.x;
	oT7.w = r0.x;
	oFog = c0.x;
	oD0 = c47;
	#undef c0
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c47
	#undef c48
	#undef c49
	#undef c50
	#undef c51
	#undef c58
	#undef c59
	#undef c60
	#undef v0
	#undef v1
	#undef v2
	#undef v3
	#undef oPos
	#undef oFog
	#undef oD0
	#undef oT0
	#undef oT1
	#undef oT7
	return output;
}

