#include <metal_stdlib>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[8];
};

struct source_main_Input
{
	float4 v0 [[attribute(0)]];
	float4 v1 [[attribute(1)]];
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
	const float4 c1 = float4(-1.280000000e+02, -6.400000000e+01, 1.587301679e-02, 1.000000000e+00); (void) c1;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	#define c0 uniforms.uniforms_float4[0]
	#define c8 uniforms.uniforms_float4[1]
	#define c9 uniforms.uniforms_float4[2]
	#define c10 uniforms.uniforms_float4[3]
	#define c11 uniforms.uniforms_float4[4]
	#define c58 uniforms.uniforms_float4[5]
	#define c59 uniforms.uniforms_float4[6]
	#define c60 uniforms.uniforms_float4[7]
	#define v0 input.v0
	#define v1 input.v1
	#define oPos output.oPos
	#define oT3 output.oT3
	#define oT4 output.oT4
	#define oT5 output.oT5
	#define oT6 output.oT6
	#define oT7 output.oT7
	r0 = v1 + c1.xxxx;
	r1 = abs(r0);
	r0 = float4(r0 < c0.xxxx);
	r1 = -r0 + r1;
	r0.xyz = (r0.xzw * -c0.zzz) + c0.yyy;
	r1 = r1 + c1.yyyy;
	r2 = abs(r1);
	r1 = float4(r1 < c0.xxxx);
	r2 = -r1 + r2;
	r1 = (r1 * -c0.zzzz) + c0.yyyy;
	r3.xy = (r2.xz * -c1.zz) + c1.ww;
	r3.xy = (r2.yw * -c1.zz) + r3.xy;
	r2 = r2 * c1.zzzz;
	r4.z = r3.y;
	r4.xy = r2.zw;
	r3.zw = r2.xy;
	r2.xyz = normalize(r3.zwx);
	r3.xyz = normalize(r4.xyz);
	r4.xy = r1.zw * r3.xy;
	r4.z = r0.y * r3.z;
	r1.xy = r1.xy * r2.xy;
	r1.z = r0.x * r2.z;
	r2.x = dot(r4.xyz, c58.xyz);
	r2.y = dot(r4.xyz, c59.xyz);
	r2.z = dot(r4.xyz, c60.xyz);
	r0.x = dot(r2.xyz, r2.xyz);
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	oT4.xyz = r0.xxx * r2.xyz;
	r3.x = dot(r1.xyz, c58.xyz);
	r3.y = dot(r1.xyz, c59.xyz);
	r3.z = dot(r1.xyz, c60.xyz);
	r0.xyw = r2.yzx * r3.zxy;
	r0.xyw = (r3.yzx * r2.zxy) + -r0.xyw;
	r0.xyz = r0.zzz * r0.xyw;
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	oT5.xyz = r0.www * r0.xyz;
	r0.x = dot(r3.xyz, r3.xyz);
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	oT6.xyz = r0.xxx * r3.xyz;
	r0.w = c0.y;
	r0.x = dot(v0, c58);
	r0.y = dot(v0, c59);
	r0.z = dot(v0, c60);
	r1.x = dot(r0, c8);
	r1.y = dot(r0, c9);
	r1.z = dot(r0, c10);
	r1.w = dot(r0, c11);
	oT3.xyz = r0.xyz;
	oPos = r1;
	oT7 = r1;
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
	#undef oPos
	#undef oT3
	#undef oT4
	#undef oT5
	#undef oT6
	#undef oT7
	return output;
}

