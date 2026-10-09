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
	float4 v4 [[attribute(4)]];
	float4 v5 [[attribute(5)]];
	float4 v6 [[attribute(6)]];
	float4 v7 [[attribute(7)]];
};

struct source_main_Output
{
	float4 o0 [[position]];
	float4 o1 [[user(texcoord0)]];
	float4 o2 [[user(texcoord1)]];
	float4 o3 [[user(texcoord2)]];
	float4 o4 [[user(texcoord3)]];
	float4 o5 [[user(texcoord4)]];
	float4 o6 [[user(texcoord5)]];
	float4 o7 [[user(texcoord6)]];
	float4 o8 [[user(texcoord7)]];
};

vertex source_main_Output source_main (
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c1 = float4(7.650058594e+02, 2.200000048e+00, 0.000000000e+00, 0.000000000e+00); (void) c1;
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
	#define c13 uniforms.uniforms_float4[165]
	#define c16 uniforms.uniforms_float4[166]
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
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define v7 input.v7
	#define o0 output.o0
	#define o1 output.o1
	#define o2 output.o2
	#define o3 output.o3
	#define o4 output.o4
	#define o5 output.o5
	#define o6 output.o6
	#define o7 output.o7
	#define o8 output.o8
	r0.x = v1.y + v1.x;
	r0.x = -r0.x + c0.y;
	r0.yzw = c1.xxx * v2.zyx;
	a0.xyz = int3(floor(abs(r0.zyw) + float3(0.5)) * sign(r0.zyw));
	r1 = v1.yyyy * uniforms.uniforms_float4[ARRAYBASE_58 + a0.x];
	r1 = (uniforms.uniforms_float4[ARRAYBASE_58 + a0.y] * v1.xxxx) + r1;
	r1 = (uniforms.uniforms_float4[ARRAYBASE_58 + a0.z] * r0.xxxx) + r1;
	r0.yzw = c13.xxx * v7.xyz;
	o3.x = dot(r0.yzw, r1.xyz);
	r2 = v1.yyyy * uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.x];
	r3 = v1.yyyy * uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.x];
	r3 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.y] * v1.xxxx) + r3;
	r2 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.y] * v1.xxxx) + r2;
	r2 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.z] * r0.xxxx) + r2;
	r3 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.z] * r0.xxxx) + r3;
	o3.y = dot(r0.yzw, r2.xyz);
	o3.z = dot(r0.yzw, r3.xyz);
	r0.x = log2(v3.x);
	r0.y = log2(v3.y);
	r0.z = log2(v3.z);
	r0.xyz = r0.xyz * c1.yyy;
	o7.x = exp2(r0.x);
	o7.y = exp2(r0.y);
	o7.z = exp2(r0.z);
	o1.x = dot(v4, c48);
	o1.y = dot(v4, c49);
	o2.x = dot(v4, c52);
	o2.y = dot(v4, c53);
	r0 = v0;
	r0.xyz = (v6.xyz * c13.xxx) + r0.xyz;
	r1.x = dot(r0, r1);
	r1.y = dot(r0, r2);
	r1.z = dot(r0, r3);
	r0.xyz = -r1.xyz + c2.xyz;
	r0.x = dot(r0.xyz, r0.xyz);
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = clamp((r0.x * c16.w) + c16.x, 0.0, 1.0);
	o3.w = min(r0.x, c16.z);
	r1.w = c0.y;
	r0.x = dot(r1, c8);
	r0.y = dot(r1, c9);
	r0.z = dot(r1, c10);
	r0.w = dot(r1, c11);
	o4.xyz = r1.xyz;
	o0 = r0;
	o8 = r0;
	o1.zw = c0.xy * v5.xx;
	o2.zw = c0.xy * v5.xy;
	o4.w = c0.x;
	o5 = c0.xxxx;
	o6 = c0.xxxx;
	o7.w = v3.w;
	#undef c0
	#undef c2
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c13
	#undef c16
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
	#undef v4
	#undef v5
	#undef v6
	#undef v7
	#undef o0
	#undef o1
	#undef o2
	#undef o3
	#undef o4
	#undef o5
	#undef o6
	#undef o7
	#undef o8
	return output;
}

