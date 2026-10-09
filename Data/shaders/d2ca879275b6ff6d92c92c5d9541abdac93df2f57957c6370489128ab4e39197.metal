#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[176];
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
	const float4 c1 = float4(-1.280000000e+02, -6.400000000e+01, 1.587301679e-02, 1.000000000e+00); (void) c1;
	const float4 c2 = float4(-2.000000000e+00, 3.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c2;
	const float4 c3 = float4(7.650058594e+02, 3.051757812e-05, 6.999999881e-01, 9.999999747e-05); (void) c3;
	const float4 c4 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, 0.000000000e+00); (void) c4;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	float4 r7;
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
	#define c27 uniforms.uniforms_float4[170]
	#define c28 uniforms.uniforms_float4[171]
	#define c29 uniforms.uniforms_float4[172]
	#define c30 uniforms.uniforms_float4[173]
	#define c31 uniforms.uniforms_float4[174]
	#define c50 uniforms.uniforms_float4[175]
	#define c58 uniforms.uniforms_float4[0]
	#define c59 uniforms.uniforms_float4[1]
	#define c60 uniforms.uniforms_float4[2]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
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
	r0.xyz = c3.xxx * v3.zyx;
	a0.xyz = int3(floor(abs(r0.xyz) + float3(0.5)) * sign(r0.xyz));
	r0.xy = c0.yy + v2.xy;
	r0.xy = r0.xy * c3.yy;
	r1 = r0.yyyy * uniforms.uniforms_float4[ARRAYBASE_58 + a0.y];
	r1 = (uniforms.uniforms_float4[ARRAYBASE_58 + a0.x] * r0.xxxx) + r1;
	r0.z = r0.y + r0.x;
	r0.z = -r0.z + c0.y;
	r1 = (uniforms.uniforms_float4[ARRAYBASE_58 + a0.z] * r0.zzzz) + r1;
	r2.x = dot(v0, r1);
	r3 = r0.yyyy * uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.y];
	r4 = r0.yyyy * uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.y];
	r4 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.x] * r0.xxxx) + r4;
	r3 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.x] * r0.xxxx) + r3;
	r3 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.z] * r0.zzzz) + r3;
	r0 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.z] * r0.zzzz) + r4;
	r2.y = dot(v0, r3);
	r2.z = dot(v0, r0);
	r2.w = c0.y;
	o0.x = dot(r2, c8);
	o0.y = dot(r2, c9);
	o0.w = dot(r2, c11);
	r0.w = dot(r2, c10);
	r4.xyz = -r2.xyz + c29.xyz;
	o6.xyz = r2.xyz;
	r1.w = dot(r4.xyz, r4.xyz);
	r2.y = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r4.xyz = r2.yyy * r4.xyz;
	r2.x = dot(c28.xyz, -r4.xyz);
	r2.x = r2.x + -c30.z;
	r2.x = r2.x * c30.w;
	r2.x = max(r2.x, c3.w);
	r3.w = pow(abs(r2.x), c30.x);
	r2.x = min(r3.w, c0.y);
	r2.z = c0.y;
	r4.yz = r1.ww * r2.yz;
	r4.x = c0.y;
	r1.w = dot(c31.xyz, r4.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r2.x = (r1.w * r2.x) + -r1.w;
	r1.w = (c28.w * r2.x) + r1.w;
	r2.x = -r1.w + c0.y;
	o2.x = (c27.w * r2.x) + r1.w;
	r1.w = -c50.y + c50.x;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r2 = c1.xxxx + v4;
	r4 = float4(r2 < c0.xxxx);
	r2 = abs(r2) + -r4;
	r4.xyz = (r4.xzw * -c0.zzz) + c0.yyy;
	r2 = r2 + c1.yyyy;
	r5 = float4(r2 < c0.xxxx);
	r2 = abs(r2) + -r5;
	r5 = (r5 * -c0.zzzz) + c0.yyyy;
	r6.xy = (r2.xz * -c1.zz) + c1.ww;
	r6.xy = (r2.yw * -c1.zz) + r6.xy;
	r2 = r2.zwxy * c1.zzzz;
	r6.zw = r2.zw;
	r7.xyz = normalize(r6.zwx);
	r2.z = r6.y;
	r6.xyz = normalize(r2.xyz);
	r2.xy = r5.xy * r7.xy;
	r2.z = r4.x * r7.z;
	r5.xy = r5.zw * r6.xy;
	r5.z = r4.y * r6.z;
	r6.x = dot(r2.xyz, r1.xyz);
	r1.x = dot(r5.xyz, r1.xyz);
	r6.y = dot(r2.xyz, r3.xyz);
	r1.y = dot(r5.xyz, r3.xyz);
	r1.z = dot(r5.xyz, r0.xyz);
	r6.z = dot(r2.xyz, r0.xyz);
	r0.xyz = float3(r6.xyz < c0.xxx);
	a0.x = int(floor(abs(r0.y) + 0.5) * sign(r0.y));
	r2.xyz = r6.xyz * r6.xyz;
	r3.xyz = r2.yyy * uniforms.uniforms_float4[ARRAYBASE_23 + a0.x].xyz;
	a0.xy = int2(floor(abs(r0.xz) + float2(0.5)) * sign(r0.xz));
	r0.xyz = (r2.xxx * uniforms.uniforms_float4[ARRAYBASE_21 + a0.x].xyz) + r3.xyz;
	r0.xyz = (r2.zzz * uniforms.uniforms_float4[ARRAYBASE_25 + a0.y].xyz) + r0.xyz;
	r2.x = dot(c4.xyz, r0.xyz);
	o7.xyz = r0.xyz;
	r0.x = r2.x + -c50.y;
	r0.x = clamp(r1.w * r0.x, 0.0, 1.0);
	r0.y = (r0.x * c2.x) + c2.y;
	r0.x = r0.x * r0.x;
	o7.w = r0.x * r0.y;
	o0.z = r0.w;
	o6.w = r0.w;
	o1 = c0.yyxx * v1.xyxx;
	o2.yzw = c0.xxx;
	o3.x = r1.x;
	r0.xyz = r1.yzx * r6.zxy;
	r0.xyz = (r6.yzx * r1.zxy) + -r0.xyz;
	o8.xyz = r1.xyz;
	o4.x = r1.y;
	o5.x = r1.z;
	o3.z = r6.x;
	o4.z = r6.y;
	o5.z = r6.z;
	r0.xyz = r4.zzz * r0.xyz;
	o3.y = r0.x;
	r1.z = c3.z;
	r2.xyz = c8.xyz;
	r1.xyz = (r2.xyz * r1.zzz) + c9.xyz;
	r1.xyz = r1.xyz + c11.xyz;
	r2.xyz = normalize(r1.xyz);
	o3.w = r2.x;
	o4.y = r0.y;
	o4.w = r2.y;
	o5.w = r2.z;
	o5.y = r0.z;
	o9.xyz = r0.xyz;
	o8.w = c0.x;
	o9.w = c0.x;
	o10 = c0.xxxx;
	#undef c0
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c21
	#undef c23
	#undef c25
	#undef c27
	#undef c28
	#undef c29
	#undef c30
	#undef c31
	#undef c50
	#undef c58
	#undef c59
	#undef c60
	#undef v0
	#undef v1
	#undef v2
	#undef v3
	#undef v4
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

