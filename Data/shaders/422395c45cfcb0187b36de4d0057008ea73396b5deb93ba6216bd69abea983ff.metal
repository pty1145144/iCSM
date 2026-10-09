#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[165];
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
	float4 oT0 [[user(texcoord0)]];
};

vertex source_main_Output source_main (
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c1 = float4(7.650058594e+02, 3.051757812e-05, 0.000000000e+00, 0.000000000e+00); (void) c1;
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
	#define c48 uniforms.uniforms_float4[164]
	#define c58 uniforms.uniforms_float4[0]
	#define c59 uniforms.uniforms_float4[1]
	#define c60 uniforms.uniforms_float4[2]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define oPos output.oPos
	#define oT0 output.oT0
	r0.xyz = v2.zyx * c1.xxx;
	a0.xyz = int3(floor(abs(r0.xyz) + float3(0.5)) * sign(r0.xyz));
	r0.xy = v1.xy + c0.yy;
	r0.xy = r0.xy * c1.yy;
	r1 = r0.yyyy * uniforms.uniforms_float4[ARRAYBASE_58 + a0.y];
	r1 = (uniforms.uniforms_float4[ARRAYBASE_58 + a0.x] * r0.xxxx) + r1;
	r0.z = r0.y + r0.x;
	r0.z = -r0.z + c0.y;
	r1 = (uniforms.uniforms_float4[ARRAYBASE_58 + a0.z] * r0.zzzz) + r1;
	r1.x = dot(v0, r1);
	r2 = r0.yyyy * uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.y];
	r3 = r0.yyyy * uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.y];
	r3 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.x] * r0.xxxx) + r3;
	r2 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.x] * r0.xxxx) + r2;
	r2 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.z] * r0.zzzz) + r2;
	r0 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.z] * r0.zzzz) + r3;
	r1.z = dot(v0, r0);
	r1.y = dot(v0, r2);
	r1.w = c0.y;
	oPos.x = dot(r1, c8);
	oPos.y = dot(r1, c9);
	r0.z = dot(r1, c10);
	r0.w = dot(r1, c11);
	r0.xy = r0.zw + -c48.yy;
	oPos.zw = r0.zw;
	r0.z = ((c48.x == 0.0) ? FLT_MAX : 1.0 / c48.x);
	oT0.xy = r0.zz * r0.xy;
	#undef c0
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c48
	#undef c58
	#undef c59
	#undef c60
	#undef v0
	#undef v1
	#undef v2
	#undef oPos
	#undef oT0
	return output;
}

