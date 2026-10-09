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
	float4 v5 [[attribute(5)]];
	float4 v6 [[attribute(6)]];
	float4 v7 [[attribute(7)]];
	float4 v8 [[attribute(8)]];
	float4 v9 [[attribute(9)]];
	float4 v10 [[attribute(10)]];
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
	const float4 c1 = float4(-128.0, -64.0, 0.015873017, 1.0); (void) c1;
	const float4 c2 = float4(-2.0, 1.0, 765.005859374, 0.000030517); (void) c2;
	const float4 c3 = float4(2.200000047, 0.333333342, 0.000001, 0.0); (void) c3;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	int4 a0;
	const int ARRAYBASE_58 = 0;
	#define c0 uniforms.uniforms_float4[159]
	#define c8 uniforms.uniforms_float4[160]
	#define c9 uniforms.uniforms_float4[161]
	#define c10 uniforms.uniforms_float4[162]
	#define c11 uniforms.uniforms_float4[163]
	#define c13 uniforms.uniforms_float4[164]
	#define c27 uniforms.uniforms_float4[165]
	#define c28 uniforms.uniforms_float4[166]
	#define c29 uniforms.uniforms_float4[167]
	#define c48 uniforms.uniforms_float4[168]
	#define c49 uniforms.uniforms_float4[169]
	#define c50 uniforms.uniforms_float4[170]
	#define c52 uniforms.uniforms_float4[171]
	#define c53 uniforms.uniforms_float4[172]
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
	#define v8 input.v8
	#define v9 input.v9
	#define v10 input.v10
	#define o0 output.o0
	#define o1 output.o1
	#define o2 output.o2
	#define o3 output.o3
	#define o4 output.o4
	#define o5 output.o5
	#define o6 output.o6
	#define o7 output.o7
	#define o8 output.o8
	r0.xyz = v4.xyz + v4.xyz;
	r1.x = log2(r0.x);
	r1.y = log2(r0.y);
	r1.z = log2(r0.z);
	r0.xyz = r1.xyz * c3.xxx;
	r1.x = exp2(r0.x);
	r1.y = exp2(r0.y);
	r1.z = exp2(r0.z);
	r0.xyz = v5.xyz + v5.xyz;
	r2.x = log2(r0.x);
	r2.y = log2(r0.y);
	r2.z = log2(r0.z);
	r0.xyz = r2.xyz * c3.xxx;
	r2.x = exp2(r0.x);
	r2.y = exp2(r0.y);
	r2.z = exp2(r0.z);
	r0.xyz = r1.xyz + r2.xyz;
	r1.xyz = v6.xyz + v6.xyz;
	r2.x = log2(r1.x);
	r2.y = log2(r1.y);
	r2.z = log2(r1.z);
	r1.xyz = r2.xyz * c3.xxx;
	r2.x = exp2(r1.x);
	r2.y = exp2(r1.y);
	r2.z = exp2(r1.z);
	r0.xyz = r0.xyz + r2.xyz;
	r0.w = v4.w;
	r0.w = r0.w + v5.w;
	r0.w = r0.w + v6.w;
	r1.x = r0.w * c3.y;
	r1.xyz = r1.xxx * c50.yzw;
	o7.xyz = (r0.xyz * c3.yyy) + -r1.xyz;
	o5.xyz = r1.xyz;
	r0.xy = c1.xx + v3.xy;
	r1.xy = float2(r0.xy < c0.xx);
	r0.xy = abs(r0.xy) + -r1.xy;
	r0.z = (r1.x * c2.x) + c2.y;
	r0.xy = r0.xy + c1.yy;
	r1.xy = float2(r0.xy < c0.xx);
	r0.xy = abs(r0.xy) + -r1.xy;
	r1.xy = (r1.xy * c2.xx) + c2.yy;
	r1.z = (r0.x * -c1.z) + c1.w;
	r2.z = (r0.y * -c1.z) + r1.z;
	r2.xy = r0.xy * c1.zz;
	r3.xyz = normalize(r2.xyz);
	r1.xy = r1.xy * r3.xy;
	r1.z = r0.z * r3.z;
	r0.xyz = c13.xxx * v10.xyz;
	r1.w = abs(c50.x);
	r1.w = float(-r1.w < r1.w);
	r0.xyz = (r1.www * r1.xyz) + r0.xyz;
	r1.xyz = c2.zzz * v2.zyx;
	a0.xyz = int3(floor(abs(r1.xyz) + float3(0.5)) * sign(r1.xyz));
	r1.xy = c0.yy + v1.xy;
	r1.xy = r1.xy * c2.ww;
	r2 = r1.yyyy * uniforms.uniforms_float4[ARRAYBASE_58 + a0.y];
	r2 = (uniforms.uniforms_float4[ARRAYBASE_58 + a0.x] * r1.xxxx) + r2;
	r1.z = r1.y + r1.x;
	r1.z = -r1.z + c0.y;
	r2 = (uniforms.uniforms_float4[ARRAYBASE_58 + a0.z] * r1.zzzz) + r2;
	r3.x = dot(r0.xyz, r2.xyz);
	r4 = r1.yyyy * uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.y];
	r5 = r1.yyyy * uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.y];
	r5 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.x] * r1.xxxx) + r5;
	r4 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.x] * r1.xxxx) + r4;
	r4 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.z] * r1.zzzz) + r4;
	r5 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.z] * r1.zzzz) + r5;
	r3.y = dot(r0.xyz, r4.xyz);
	r3.z = dot(r0.xyz, r5.xyz);
	r0.xyz = normalize(r3.xyz);
	r1.xyz = v0.xyz;
	r3.xyz = (v9.xyz * c13.xxx) + r1.xyz;
	r3.w = v0.w;
	r2.x = dot(r3, r2);
	r2.y = dot(r3, r4);
	r2.z = dot(r3, r5);
	r1.xyz = -r2.xyz + c29.xyz;
	r3.x = dot(r1.xyz, r1.xyz);
	r3.x = ((r3.x == 0.0) ? FLT_MAX : rsqrt(abs(r3.x)));
	r3.yzw = r1.xyz * r3.xxx;
	r1.xyz = (r1.xyz * -r3.xxx) + -c28.xyz;
	r1.xyz = (c27.www * r1.xyz) + r3.yzw;
	r1.x = dot(r0.xyz, r1.xyz);
	o3.xyz = r0.xyz;
	r0.x = max(r1.x, c0.x);
	r0.x = (r0.x * r0.x) + r0.x;
	r0.x = r0.x * c0.w;
	r0.y = c0.y;
	r0.y = dot(c28.xyz, r0.yyy);
	r0.y = float(c3.z < r0.y);
	r0.x = r0.y * r0.x;
	r0.y = (r0.w * c3.y) + -r0.x;
	o5.w = (r1.w * r0.y) + r0.x;
	o1.x = dot(v7, c48);
	o1.y = dot(v7, c49);
	o2.x = dot(v7, c52);
	o2.y = dot(v7, c53);
	r2.w = c0.y;
	r0.x = dot(r2, c8);
	r0.y = dot(r2, c9);
	r0.z = dot(r2, c10);
	r0.w = dot(r2, c11);
	o4.xyz = r2.xyz;
	o0 = r0;
	o8 = r0;
	o1.zw = c0.xy * v8.xx;
	o2.zw = c0.xy * v8.xy;
	o3.w = c0.x;
	o4.w = c0.x;
	o6 = c0.xxxx;
	o7.w = c0.x;
	#undef c0
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c13
	#undef c27
	#undef c28
	#undef c29
	#undef c48
	#undef c49
	#undef c50
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
	#undef v8
	#undef v9
	#undef v10
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

