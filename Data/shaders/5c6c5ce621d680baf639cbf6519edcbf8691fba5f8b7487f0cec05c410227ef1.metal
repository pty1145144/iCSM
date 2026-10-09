#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[171];
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
	float4 oT2 [[user(texcoord2)]];
	float4 oT3 [[user(texcoord3)]];
	float4 oT7 [[user(texcoord7)]];
};

vertex source_main_Output source_main (
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c1 = float4(765.005859374, 0.000030517, 0.0, 0.0); (void) c1;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	int4 a0;
	const int ARRAYBASE_58 = 0;
	#define c0 uniforms.uniforms_float4[159]
	#define c2 uniforms.uniforms_float4[160]
	#define c8 uniforms.uniforms_float4[161]
	#define c9 uniforms.uniforms_float4[162]
	#define c10 uniforms.uniforms_float4[163]
	#define c11 uniforms.uniforms_float4[164]
	#define c16 uniforms.uniforms_float4[165]
	#define c47 uniforms.uniforms_float4[166]
	#define c48 uniforms.uniforms_float4[167]
	#define c49 uniforms.uniforms_float4[168]
	#define c52 uniforms.uniforms_float4[169]
	#define c53 uniforms.uniforms_float4[170]
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
	#define oT2 output.oT2
	#define oT3 output.oT3
	#define oT7 output.oT7
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
	oPos.w = dot(r1, c11);
	r0.x = dot(r1, c10);
	r0.yzw = -r1.xyz + c2.xyz;
	oT7.xyz = r1.xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.y = ((r0.y == 0.0) ? FLT_MAX : rsqrt(abs(r0.y)));
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r0.y = (-r0.y * c16.w) + c16.x;
	oFog = max(r0.y, c16.z);
	r0.yz = v3.yy * c49.xy;
	oT0.xy = (v3.xx * c48.xy) + r0.yz;
	r0.yz = v3.yy * c53.xy;
	oT3.xy = (v3.xx * c52.xy) + r0.yz;
	oPos.z = r0.x;
	oT7.w = r0.x;
	oT1.xy = c0.xx;
	oT2.xy = c0.xx;
	oD0 = c47;
	#undef c0
	#undef c2
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c16
	#undef c47
	#undef c48
	#undef c49
	#undef c52
	#undef c53
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
	#undef oT2
	#undef oT3
	#undef oT7
	return output;
}

