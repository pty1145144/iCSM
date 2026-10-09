#include <metal_stdlib>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[14];
};

struct source_main_Input
{
	float4 v0 [[attribute(0)]];
	float4 v1 [[attribute(1)]];
	float4 v2 [[attribute(2)]];
	float4 v3 [[attribute(3)]];
	float4 v4 [[attribute(4)]];
	float4 v5 [[attribute(5)]];
};

struct source_main_Output
{
	float4 oPos [[position]];
	float4 oFog [[user(fog)]];
	float4 oD0 [[user(color0)]];
	float4 oT0 [[user(texcoord0)]];
	float4 oT1 [[user(texcoord1)]];
};

vertex source_main_Output source_main (
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c1 = float4(5.000000000e+00, 4.000000000e+00, 3.000000000e+00, 0.000000000e+00); (void) c1;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	#define c0 uniforms.uniforms_float4[0]
	#define c2 uniforms.uniforms_float4[1]
	#define c8 uniforms.uniforms_float4[2]
	#define c9 uniforms.uniforms_float4[3]
	#define c10 uniforms.uniforms_float4[4]
	#define c11 uniforms.uniforms_float4[5]
	#define c16 uniforms.uniforms_float4[6]
	#define c48 uniforms.uniforms_float4[7]
	#define c49 uniforms.uniforms_float4[8]
	#define c50 uniforms.uniforms_float4[9]
	#define c51 uniforms.uniforms_float4[10]
	#define c54 uniforms.uniforms_float4[11]
	#define c55 uniforms.uniforms_float4[12]
	#define c56 uniforms.uniforms_float4[13]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define oPos output.oPos
	#define oFog output.oFog
	#define oD0 output.oD0
	#define oT0 output.oT0
	#define oT1 output.oT1
	r0 = v2 + v2;
	r0 = (v3 * -c1.xxxx) + r0;
	r0 = (v4 * c1.yyyy) + r0;
	r0 = r0 + -v5;
	r1 = v2;
	r2 = (v3 * c1.zzzz) + -r1;
	r2 = (v4 * -c1.zzzz) + r2;
	r2 = r2 + v5;
	r3 = (v1.xxxx * r2) + r0;
	r2.xyz = r2.xyz * v1.xxx;
	r0.xyz = (r2.yzx * c0.zzz) + r0.yzx;
	r1 = -r1 + v4;
	r1 = (v1.xxxx * r3) + r1;
	r0.w = v1.x * c0.w;
	r2 = (r0.wwww * r1) + v3;
	r0.xyz = (v1.xxx * r0.xyz) + r1.yzx;
	r0.xyz = r0.xyz * c0.www;
	r1 = (r2.xyzx * c0.yyyx) + c0.xxxy;
	r3.x = dot(r1, c48);
	r3.y = dot(r1, c49);
	r3.z = dot(r1, c50);
	r1.xyz = (r2.www * c0.yxx) + r3.xyz;
	r1.w = c0.y;
	r0.w = dot(r1, c54);
	r1.x = dot(r1, c51);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = r0.w * r1.x;
	r3.w = c0.y;
	r1.x = dot(r3, c54);
	r1.y = dot(r3, c51);
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r0.w = (r1.y * r1.x) + -r0.w;
	r0.w = abs(r0.w);
	r1.x = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = float(r0.w < c55.x);
	r1.x = r1.x * c55.x;
	r1.x = (r2.w * r1.x) + -r2.w;
	r0.w = (r0.w * r1.x) + r2.w;
	r1.x = v1.z + -c0.w;
	r0.w = r0.w * r1.x;
	r1.x = dot(r0.xyz, r0.xyz);
	r1.x = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r0.xyz = r0.xyz * r1.xxx;
	r1.xyz = r2.zxy + -c2.zxy;
	r3.xyz = r0.xyz * r1.xyz;
	r0.xyz = (r1.zxy * r0.yzx) + -r3.xyz;
	r1.xyz = normalize(r0.xyz);
	r0.xyz = (r1.xyz * r0.www) + r2.xyz;
	r0.w = c0.y;
	oPos.x = dot(r0, c8);
	oPos.y = dot(r0, c9);
	oPos.w = dot(r0, c11);
	r0.w = dot(r0, c10);
	oT0.x = -v1.z + c0.y;
	oT0.y = v1.y * c56.x;
	r1.xyz = -r0.xyz + c2.xyz;
	oT1 = r0;
	r0.x = dot(r1.xyz, r1.xyz);
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = (-r0.x * c16.w) + c16.x;
	oFog = max(r0.x, c16.z);
	oPos.z = r0.w;
	oD0 = v0;
	#undef c0
	#undef c2
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c16
	#undef c48
	#undef c49
	#undef c50
	#undef c51
	#undef c54
	#undef c55
	#undef c56
	#undef v0
	#undef v1
	#undef v2
	#undef v3
	#undef v4
	#undef v5
	#undef oPos
	#undef oFog
	#undef oD0
	#undef oT0
	#undef oT1
	return output;
}

