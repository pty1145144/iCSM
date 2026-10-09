#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[173];
};

struct source_main_Input
{
	float4 v0 [[attribute(0)]];
	float4 v1 [[attribute(1)]];
	float4 v2 [[attribute(2)]];
	float4 v3 [[attribute(3)]];
	float4 v4 [[attribute(4)]];
	float4 v6 [[attribute(6)]];
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
	float4 o9 [[user(texcoord8)]];
	float4 o10 [[user(texcoord9)]];
};

vertex source_main_Output source_main (
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c1 = float4(-2.0, 3.0, 0.0, 0.0); (void) c1;
	const float4 c2 = float4(765.005859374, 0.298999992, 0.587000012, 0.114); (void) c2;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	int4 a0;
	const int ARRAYBASE_58 = 0;
	const int ARRAYBASE_25 = 159;
	const int ARRAYBASE_23 = 161;
	const int ARRAYBASE_21 = 163;
	#define c0 uniforms.uniforms_float4[165]
	#define c8 uniforms.uniforms_float4[166]
	#define c9 uniforms.uniforms_float4[167]
	#define c10 uniforms.uniforms_float4[168]
	#define c11 uniforms.uniforms_float4[169]
	#define c21 uniforms.uniforms_float4[163]
	#define c23 uniforms.uniforms_float4[161]
	#define c25 uniforms.uniforms_float4[159]
	#define c48 uniforms.uniforms_float4[170]
	#define c49 uniforms.uniforms_float4[171]
	#define c50 uniforms.uniforms_float4[172]
	#define c58 uniforms.uniforms_float4[0]
	#define c59 uniforms.uniforms_float4[1]
	#define c60 uniforms.uniforms_float4[2]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v6 input.v6
	#define o0 output.o0
	#define o1 output.o1
	#define o2 output.o2
	#define o3 output.o3
	#define o4 output.o4
	#define o5 output.o5
	#define o6 output.o6
	#define o7 output.o7
	#define o8 output.o8
	#define o9 output.o9
	#define o10 output.o10
	r0.x = v2.y + v2.x;
	r0.x = -r0.x + c0.y;
	r0.yzw = c2.xxx * v3.zyx;
	a0.xyz = int3(floor(abs(r0.zyw) + float3(0.5)) * sign(r0.zyw));
	r1 = v2.yyyy * uniforms.uniforms_float4[ARRAYBASE_58 + a0.x];
	r1 = (uniforms.uniforms_float4[ARRAYBASE_58 + a0.y] * v2.xxxx) + r1;
	r1 = (uniforms.uniforms_float4[ARRAYBASE_58 + a0.z] * r0.xxxx) + r1;
	r2.x = dot(v0, r1);
	r3 = v2.yyyy * uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.x];
	r4 = v2.yyyy * uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.x];
	r4 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.y] * v2.xxxx) + r4;
	r3 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.y] * v2.xxxx) + r3;
	r3 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.z] * r0.xxxx) + r3;
	r0 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.z] * r0.xxxx) + r4;
	r2.y = dot(v0, r3);
	r2.z = dot(v0, r0);
	r2.w = c0.y;
	o0.w = dot(r2, c11);
	r4.xyz = c49.xyz;
	r4.xyz = r4.xyz + c48.xyz;
	r5.xyz = -r2.xyz + r4.xyz;
	r0.w = dot(r5.xyz, r5.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	o10.xyz = r0.www * r5.xyz;
	r0.w = -c50.y + c50.x;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r5.x = dot(v4.xyz, r1.xyz);
	r1.x = dot(v6.xyz, r1.xyz);
	r5.y = dot(v4.xyz, r3.xyz);
	r1.y = dot(v6.xyz, r3.xyz);
	r5.z = dot(v4.xyz, r0.xyz);
	r1.z = dot(v6.xyz, r0.xyz);
	r0.xyz = float3(r5.xyz < c0.xxx);
	a0.x = int(floor(abs(r0.y) + 0.5) * sign(r0.y));
	r3.xyz = r5.xyz * r5.xyz;
	r6.xyz = r3.yyy * uniforms.uniforms_float4[ARRAYBASE_23 + a0.x].xyz;
	a0.xy = int2(floor(abs(r0.xz) + float2(0.5)) * sign(r0.xz));
	r0.xyz = (r3.xxx * uniforms.uniforms_float4[ARRAYBASE_21 + a0.x].xyz) + r6.xyz;
	r0.xyz = (r3.zzz * uniforms.uniforms_float4[ARRAYBASE_25 + a0.y].xyz) + r0.xyz;
	r1.w = dot(c2.yzw, r0.xyz);
	o7.xyz = r0.xyz;
	r0.x = r1.w + -c50.y;
	r0.x = clamp(r0.w * r0.x, 0.0, 1.0);
	r0.y = (r0.x * c1.x) + c1.y;
	r0.x = r0.x * r0.x;
	o7.w = r0.x * r0.y;
	r0.x = dot(r2, c8);
	r0.y = dot(r2, c9);
	r0.w = dot(r2, c10);
	o6.xyz = r2.xyz;
	o0.xyz = r0.xyw;
	o3.w = r0.x;
	o4.w = r0.y;
	o1 = c0.yyxx * v1.xyxx;
	o2 = c0.xxxx;
	o3.x = r1.x;
	r0.xyz = r1.yzx * r5.zxy;
	r0.xyz = (r5.yzx * r1.zxy) + -r0.xyz;
	o3.z = r5.x;
	o4.z = r5.y;
	o5.z = r5.z;
	o8.xyz = r1.xyz;
	o4.x = r1.y;
	o5.x = r1.z;
	r0.xyz = r0.xyz * v6.www;
	o3.y = r0.x;
	o4.y = r0.y;
	o9.xyz = r0.xyz;
	o5.yw = r0.zw;
	o6.w = r0.w;
	o8.w = r4.x;
	o9.w = r4.y;
	o10.w = r4.z;
	#undef c0
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c21
	#undef c23
	#undef c25
	#undef c48
	#undef c49
	#undef c50
	#undef c58
	#undef c59
	#undef c60
	#undef v0
	#undef v1
	#undef v2
	#undef v3
	#undef v4
	#undef v6
	#undef o0
	#undef o1
	#undef o2
	#undef o3
	#undef o4
	#undef o5
	#undef o6
	#undef o7
	#undef o8
	#undef o9
	#undef o10
	return output;
}

