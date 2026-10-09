#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[25];
};

struct source_main_Input
{
	float4 v0 [[attribute(0)]];
	float4 v1 [[attribute(1)]];
	float4 v2 [[attribute(2)]];
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
	const float4 c1 = float4(-128.0, -64.0, 0.015873017, 1.0); (void) c1;
	const float4 c2 = float4(0.700000011, 0.0001, -2.0, 3.0); (void) c2;
	const float4 c3 = float4(0.298999992, 0.587000012, 0.114, 0.0); (void) c3;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	int4 a0;
	const int ARRAYBASE_25 = 0;
	const int ARRAYBASE_23 = 2;
	const int ARRAYBASE_21 = 4;
	#define c0 uniforms.uniforms_float4[6]
	#define c8 uniforms.uniforms_float4[7]
	#define c9 uniforms.uniforms_float4[8]
	#define c10 uniforms.uniforms_float4[9]
	#define c11 uniforms.uniforms_float4[10]
	#define c21 uniforms.uniforms_float4[4]
	#define c23 uniforms.uniforms_float4[2]
	#define c25 uniforms.uniforms_float4[0]
	#define c27 uniforms.uniforms_float4[11]
	#define c28 uniforms.uniforms_float4[12]
	#define c29 uniforms.uniforms_float4[13]
	#define c30 uniforms.uniforms_float4[14]
	#define c31 uniforms.uniforms_float4[15]
	#define c32 uniforms.uniforms_float4[16]
	#define c33 uniforms.uniforms_float4[17]
	#define c34 uniforms.uniforms_float4[18]
	#define c35 uniforms.uniforms_float4[19]
	#define c36 uniforms.uniforms_float4[20]
	#define c50 uniforms.uniforms_float4[21]
	#define c58 uniforms.uniforms_float4[22]
	#define c59 uniforms.uniforms_float4[23]
	#define c60 uniforms.uniforms_float4[24]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
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
	r0.w = c0.y;
	r0.x = dot(v0, c58);
	r0.y = dot(v0, c59);
	r0.z = dot(v0, c60);
	o0.x = dot(r0, c8);
	o0.y = dot(r0, c9);
	o0.w = dot(r0, c11);
	r0.w = dot(r0, c10);
	r1.xyz = -r0.xyz + c29.xyz;
	r1.w = dot(r1.xyz, r1.xyz);
	r2.y = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.xyz = r1.xyz * r2.yyy;
	r1.x = dot(c28.xyz, -r1.xyz);
	r1.x = r1.x + -c30.z;
	r1.x = r1.x * c30.w;
	r1.x = max(r1.x, c2.y);
	r2.x = pow(abs(r1.x), c30.x);
	r1.x = min(r2.x, c0.y);
	r3.x = c0.y;
	r2.z = c0.y;
	r3.yz = r1.ww * r2.yz;
	r1.y = dot(c31.xyz, r3.xyz);
	r1.y = ((r1.y == 0.0) ? FLT_MAX : 1.0 / r1.y);
	r1.x = (r1.y * r1.x) + -r1.y;
	r1.x = (c28.w * r1.x) + r1.y;
	r1.y = -r1.x + c0.y;
	o2.x = (c27.w * r1.y) + r1.x;
	r1.xyz = -r0.xyz + c34.xyz;
	o6 = r0;
	r0.x = dot(r1.xyz, r1.xyz);
	r0.y = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r1.xyz = r0.yyy * r1.xyz;
	r1.x = dot(c33.xyz, -r1.xyz);
	r1.x = r1.x + -c35.z;
	r1.x = r1.x * c35.w;
	r1.x = max(r1.x, c2.y);
	r2.x = pow(abs(r1.x), c35.x);
	r1.x = min(r2.x, c0.y);
	r0.z = c0.y;
	r0.yz = r0.yz * r0.xx;
	r0.x = c0.y;
	r0.x = dot(c36.xyz, r0.xyz);
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.y = (r0.x * r1.x) + -r0.x;
	r0.x = (c33.w * r0.y) + r0.x;
	r0.y = -r0.x + c0.y;
	o2.y = (c32.w * r0.y) + r0.x;
	r0.x = -c50.y + c50.x;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r1 = c1.xxxx + v2;
	r2 = float4(r1 < c0.xxxx);
	r1 = abs(r1) + -r2;
	r2.xyz = (r2.xzw * -c0.zzz) + c0.yyy;
	r1 = r1 + c1.yyyy;
	r3 = float4(r1 < c0.xxxx);
	r1 = abs(r1) + -r3;
	r3 = (r3 * -c0.zzzz) + c0.yyyy;
	r0.yz = (r1.xz * -c1.zz) + c1.ww;
	r4.xy = (r1.yw * -c1.zz) + r0.yz;
	r1 = r1.zwxy * c1.zzzz;
	r4.zw = r1.zw;
	r5.xyz = normalize(r4.zwx);
	r1.z = r4.y;
	r4.xyz = normalize(r1.xyz);
	r1.xy = r3.xy * r5.xy;
	r1.z = r2.x * r5.z;
	r3.xy = r3.zw * r4.xy;
	r3.z = r2.y * r4.z;
	r4.x = dot(r1.xyz, c58.xyz);
	r4.y = dot(r1.xyz, c59.xyz);
	r4.z = dot(r1.xyz, c60.xyz);
	r1.xyz = float3(r4.xyz < c0.xxx);
	a0.x = int(floor(abs(r1.y) + 0.5) * sign(r1.y));
	r2.xyw = r4.xyz * r4.xyz;
	r5.xyz = r2.yyy * uniforms.uniforms_float4[ARRAYBASE_23 + a0.x].xyz;
	a0.xy = int2(floor(abs(r1.xz) + float2(0.5)) * sign(r1.xz));
	r1.xyz = (r2.xxx * uniforms.uniforms_float4[ARRAYBASE_21 + a0.x].xyz) + r5.xyz;
	r1.xyz = (r2.www * uniforms.uniforms_float4[ARRAYBASE_25 + a0.y].xyz) + r1.xyz;
	r0.y = dot(c3.xyz, r1.xyz);
	o7.xyz = r1.xyz;
	r0.y = r0.y + -c50.y;
	r0.x = clamp(r0.x * r0.y, 0.0, 1.0);
	r0.y = (r0.x * c2.z) + c2.w;
	r0.x = r0.x * r0.x;
	o7.w = r0.x * r0.y;
	o0.z = r0.w;
	o1 = c0.yyxx * v1.xyxx;
	o2.zw = c0.xx;
	r0.x = dot(r3.xyz, c58.xyz);
	o3.x = r0.x;
	r0.y = dot(r3.xyz, c59.xyz);
	r0.z = dot(r3.xyz, c60.xyz);
	r1.xyz = r0.yzx * r4.zxy;
	r1.xyz = (r4.yzx * r0.zxy) + -r1.xyz;
	o3.z = r4.x;
	o4.z = r4.y;
	o5.z = r4.z;
	o8.xyz = r0.xyz;
	o4.x = r0.y;
	o5.x = r0.z;
	r0.xyz = r2.zzz * r1.xyz;
	o3.y = r0.x;
	r1.xyz = c8.xyz;
	r2.x = c2.x;
	r1.xyz = (r1.xyz * r2.xxx) + c9.xyz;
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
	#undef c32
	#undef c33
	#undef c34
	#undef c35
	#undef c36
	#undef c50
	#undef c58
	#undef c59
	#undef c60
	#undef v0
	#undef v1
	#undef v2
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

