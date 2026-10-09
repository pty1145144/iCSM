#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[22];
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
	const float4 c1 = float4(-1.280000000e+02, -6.400000000e+01, 1.587301679e-02, 1.000000000e+00); (void) c1;
	const float4 c2 = float4(9.999999747e-05, 2.989999950e-01, 5.870000124e-01, 1.140000001e-01); (void) c2;
	const float4 c3 = float4(-2.000000000e+00, 3.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c3;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
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
	#define c48 uniforms.uniforms_float4[16]
	#define c49 uniforms.uniforms_float4[17]
	#define c50 uniforms.uniforms_float4[18]
	#define c58 uniforms.uniforms_float4[19]
	#define c59 uniforms.uniforms_float4[20]
	#define c60 uniforms.uniforms_float4[21]
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
	o0.w = dot(r0, c11);
	r1.xyz = c49.xyz;
	r1.xyz = r1.xyz + c48.xyz;
	r2.xyz = -r0.xyz + r1.xyz;
	r1.w = dot(r2.xyz, r2.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	o10.xyz = r1.www * r2.xyz;
	r2.xyz = -r0.xyz + c29.xyz;
	r1.w = dot(r2.xyz, r2.xyz);
	r3.y = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r2.xyz = r2.xyz * r3.yyy;
	r2.x = dot(c28.xyz, -r2.xyz);
	r2.x = r2.x + -c30.z;
	r2.x = r2.x * c30.w;
	r2.x = max(r2.x, c2.x);
	r3.x = pow(abs(r2.x), c30.x);
	r2.x = min(r3.x, c0.y);
	r4.x = c0.y;
	r3.z = c0.y;
	r4.yz = r1.ww * r3.yz;
	r1.w = dot(c31.xyz, r4.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r2.x = (r1.w * r2.x) + -r1.w;
	r1.w = (c28.w * r2.x) + r1.w;
	r2.x = -r1.w + c0.y;
	o2.x = (c27.w * r2.x) + r1.w;
	r1.w = -c50.y + c50.x;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r2 = c1.xxxx + v2;
	r3 = float4(r2 < c0.xxxx);
	r2 = abs(r2) + -r3;
	r3.xyz = (r3.xzw * -c0.zzz) + c0.yyy;
	r2 = r2 + c1.yyyy;
	r4 = float4(r2 < c0.xxxx);
	r2 = abs(r2) + -r4;
	r4 = (r4 * -c0.zzzz) + c0.yyyy;
	r5.xy = (r2.xz * -c1.zz) + c1.ww;
	r5.xy = (r2.yw * -c1.zz) + r5.xy;
	r2 = r2.zwxy * c1.zzzz;
	r5.zw = r2.zw;
	r6.xyz = normalize(r5.zwx);
	r2.z = r5.y;
	r5.xyz = normalize(r2.xyz);
	r2.xy = r4.xy * r6.xy;
	r2.z = r3.x * r6.z;
	r4.xy = r4.zw * r5.xy;
	r4.z = r3.y * r5.z;
	r5.x = dot(r2.xyz, c58.xyz);
	r5.y = dot(r2.xyz, c59.xyz);
	r5.z = dot(r2.xyz, c60.xyz);
	r2.xyz = float3(r5.xyz < c0.xxx);
	a0.x = int(floor(abs(r2.y) + 0.5) * sign(r2.y));
	r3.xyw = r5.xyz * r5.xyz;
	r6.xyz = r3.yyy * uniforms.uniforms_float4[ARRAYBASE_23 + a0.x].xyz;
	a0.xy = int2(floor(abs(r2.xz) + float2(0.5)) * sign(r2.xz));
	r2.xyz = (r3.xxx * uniforms.uniforms_float4[ARRAYBASE_21 + a0.x].xyz) + r6.xyz;
	r2.xyz = (r3.www * uniforms.uniforms_float4[ARRAYBASE_25 + a0.y].xyz) + r2.xyz;
	r2.w = dot(c2.yzw, r2.xyz);
	o7.xyz = r2.xyz;
	r2.x = r2.w + -c50.y;
	r1.w = clamp(r1.w * r2.x, 0.0, 1.0);
	r2.x = (r1.w * c3.x) + c3.y;
	r1.w = r1.w * r1.w;
	o7.w = r1.w * r2.x;
	r2.x = dot(r0, c8);
	r2.y = dot(r0, c9);
	r2.w = dot(r0, c10);
	o6.xyz = r0.xyz;
	o0.xyz = r2.xyw;
	o3.w = r2.x;
	o4.w = r2.y;
	o1 = c0.yyxx * v1.xyxx;
	o2.yzw = c0.xxx;
	r0.x = dot(r4.xyz, c58.xyz);
	o3.x = r0.x;
	r0.y = dot(r4.xyz, c59.xyz);
	r0.z = dot(r4.xyz, c60.xyz);
	r2.xyz = r0.yzx * r5.zxy;
	r2.xyz = (r5.yzx * r0.zxy) + -r2.xyz;
	o3.z = r5.x;
	o4.z = r5.y;
	o5.z = r5.z;
	o8.xyz = r0.xyz;
	o4.x = r0.y;
	o5.x = r0.z;
	r0.xyz = r3.zzz * r2.xyz;
	o3.y = r0.x;
	o4.y = r0.y;
	o5.y = r0.z;
	o9.xyz = r0.xyz;
	o5.w = r2.w;
	o6.w = r2.w;
	o8.w = r1.x;
	o9.w = r1.y;
	o10.w = r1.z;
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
	#undef c48
	#undef c49
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

