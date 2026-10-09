#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[164];
};

struct source_main_Input
{
	float4 v0 [[attribute(0)]];
	float4 v1 [[attribute(1)]];
	float4 v2 [[attribute(2)]];
	float4 v3 [[attribute(3)]];
	float4 v4 [[attribute(4)]];
};

struct source_main_Output
{
	float4 oPos [[position]];
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
	const float4 c1 = float4(7.650058594e+02, 0.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c1;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	int4 a0;
	const int ARRAYBASE_58 = 0;
	#define c0 uniforms.uniforms_float4[159]
	#define c8 uniforms.uniforms_float4[160]
	#define c9 uniforms.uniforms_float4[161]
	#define c10 uniforms.uniforms_float4[162]
	#define c11 uniforms.uniforms_float4[163]
	#define c58 uniforms.uniforms_float4[0]
	#define c59 uniforms.uniforms_float4[1]
	#define c60 uniforms.uniforms_float4[2]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define oPos output.oPos
	#define oT3 output.oT3
	#define oT4 output.oT4
	#define oT5 output.oT5
	#define oT6 output.oT6
	#define oT7 output.oT7
	r0.x = v3.y + v3.x;
	r0.x = -r0.x + c0.y;
	r0.yzw = v4.zyx * c1.xxx;
	a0.xyz = int3(floor(abs(r0.zyw) + float3(0.5)) * sign(r0.zyw));
	r1 = v3.yyyy * uniforms.uniforms_float4[ARRAYBASE_58 + a0.x];
	r1 = (uniforms.uniforms_float4[ARRAYBASE_58 + a0.y] * v3.xxxx) + r1;
	r1 = (uniforms.uniforms_float4[ARRAYBASE_58 + a0.z] * r0.xxxx) + r1;
	r2.x = dot(v2.xyz, r1.xyz);
	r3 = v3.yyyy * uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.x];
	r4 = v3.yyyy * uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.x];
	r4 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.y] * v3.xxxx) + r4;
	r3 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.y] * v3.xxxx) + r3;
	r3 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.z] * r0.xxxx) + r3;
	r0 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.z] * r0.xxxx) + r4;
	r2.y = dot(v2.xyz, r3.xyz);
	r2.z = dot(v2.xyz, r0.xyz);
	r2.w = dot(r2.xyz, r2.xyz);
	r2.w = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	oT4.xyz = r2.www * r2.xyz;
	r4.x = dot(v1.xyz, r1.xyz);
	r1.x = dot(v0, r1);
	r4.y = dot(v1.xyz, r3.xyz);
	r1.y = dot(v0, r3);
	r4.z = dot(v1.xyz, r0.xyz);
	r1.z = dot(v0, r0);
	r0.xyz = r2.yzx * r4.zxy;
	r0.xyz = (r4.yzx * r2.zxy) + -r0.xyz;
	r0.xyz = r0.xyz * v2.www;
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	oT5.xyz = r0.www * r0.xyz;
	r0.x = dot(r4.xyz, r4.xyz);
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	oT6.xyz = r0.xxx * r4.xyz;
	r1.w = c0.y;
	r0.x = dot(r1, c8);
	r0.y = dot(r1, c9);
	r0.z = dot(r1, c10);
	r0.w = dot(r1, c11);
	oT3.xyz = r1.xyz;
	oPos = r0;
	oT7 = r0;
	#undef c0
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c58
	#undef c59
	#undef c60
	#undef v0
	#undef v1
	#undef v2
	#undef v3
	#undef v4
	#undef oPos
	#undef oT3
	#undef oT4
	#undef oT5
	#undef oT6
	#undef oT7
	return output;
}

