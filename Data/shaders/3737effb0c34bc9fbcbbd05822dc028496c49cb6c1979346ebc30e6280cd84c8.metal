#include <metal_stdlib>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[13];
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
	const float4 c1 = float4(1.0, -1.0, 0.0, 0.0); (void) c1;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	#define c0 uniforms.uniforms_float4[0]
	#define c2 uniforms.uniforms_float4[1]
	#define c4 uniforms.uniforms_float4[2]
	#define c5 uniforms.uniforms_float4[3]
	#define c6 uniforms.uniforms_float4[4]
	#define c7 uniforms.uniforms_float4[5]
	#define c16 uniforms.uniforms_float4[6]
	#define c48 uniforms.uniforms_float4[7]
	#define c49 uniforms.uniforms_float4[8]
	#define c50 uniforms.uniforms_float4[9]
	#define c58 uniforms.uniforms_float4[10]
	#define c59 uniforms.uniforms_float4[11]
	#define c60 uniforms.uniforms_float4[12]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define oPos output.oPos
	#define oFog output.oFog
	#define oD0 output.oD0
	#define oT0 output.oT0
	#define oT1 output.oT1
	#define oT2 output.oT2
	#define oT3 output.oT3
	#define oT7 output.oT7
	r0.x = dot(v0, c58);
	r0.y = dot(v0, c59);
	r0.z = dot(v0, c60);
	r0.xyz = -r0.xyz + c2.xyz;
	r0.x = dot(r0.xyz, r0.xyz);
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = (-r0.x * c16.w) + c16.x;
	oFog = max(r0.x, c16.z);
	r0.x = c0.x;
	r1 = (v0.xyzx * c1.xxyz) + c1.zzzx;
	r2.x = dot(r1, r1);
	r2.x = ((r2.x == 0.0) ? FLT_MAX : rsqrt(abs(r2.x)));
	r1 = r1 * r2.xxxx;
	r0.yzw = r1.zyw * c1.xyx;
	r2.x = dot(r0.yzw, r0.yzw);
	r2.x = ((r2.x == 0.0) ? FLT_MAX : rsqrt(abs(r2.x)));
	r0 = r0 * r2.xxxx;
	r2 = r1.yzxw * -r0.zxyw;
	r2 = (r0.yzxw * r1.zxyw) + r2;
	r3.xyz = -v0.xyz + c48.xyz;
	r0 = r0 * r3.yyyy;
	r0 = (r2 * r3.xxxx) + r0;
	r0 = (r1 * r3.zzzz) + r0;
	r0.w = dot(r0, r0);
	r1.x = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = r0.w * c50.x;
	r0.xyz = r0.xyz * r1.xxx;
	oT1.xyz = (r0.xyz * c0.www) + c0.www;
	r0.x = float(c0.y < r0.w);
	r1.xyz = r0.www * c49.xyz;
	r0.yzw = (c49.xyz * -r0.www) + c49.xyz;
	oD0.xyz = (r0.xxx * r0.yzw) + r1.xyz;
	r0.x = dot(v0, c4);
	r0.y = dot(v0, c5);
	r0.w = dot(v0, c7);
	r0.z = dot(v0, c6);
	oPos = r0;
	oT3 = r0;
	oT7.w = r0.z;
	oT0.xy = v1.xy;
	oT2.xyz = v2.xyz;
	oD0.w = v2.w;
	oT7.xyz = v0.xyz;
	#undef c0
	#undef c2
	#undef c4
	#undef c5
	#undef c6
	#undef c7
	#undef c16
	#undef c48
	#undef c49
	#undef c50
	#undef c58
	#undef c59
	#undef c60
	#undef v0
	#undef v1
	#undef v2
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

