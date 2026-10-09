#include <metal_stdlib>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[9];
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
	float4 o10 [[user(color0)]];
};

vertex source_main_Output source_main (
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	float4 r0;
	float4 r1;
	#define c0 uniforms.uniforms_float4[0]
	#define c8 uniforms.uniforms_float4[1]
	#define c9 uniforms.uniforms_float4[2]
	#define c10 uniforms.uniforms_float4[3]
	#define c11 uniforms.uniforms_float4[4]
	#define c47 uniforms.uniforms_float4[5]
	#define c58 uniforms.uniforms_float4[6]
	#define c59 uniforms.uniforms_float4[7]
	#define c60 uniforms.uniforms_float4[8]
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
	r0.w = c0.y;
	r1 = (v0.xyzx * c0.yyyx) + c0.xxxy;
	r0.x = dot(r1, c58);
	r0.y = dot(r1, c59);
	r0.z = dot(r1, c60);
	o0.x = dot(r0, c8);
	o0.y = dot(r0, c9);
	o0.w = dot(r0, c11);
	r0.w = dot(r0, c10);
	o8.x = dot(v1.xyz, c58.xyz);
	o8.y = dot(v1.xyz, c59.xyz);
	o8.z = dot(v1.xyz, c60.xyz);
	o10.w = c47.w * v4.w;
	o0.z = r0.w;
	o5 = r0;
	o1 = c0.yyxx * v2.xyxx;
	o2 = c0.yyxx * v2.xyxx;
	o3 = c0.yyxx * v3.xyxx;
	o4 = c0.xxxx;
	o6 = c0.xxxx;
	o7 = c0.xxxx;
	o8.w = c0.x;
	o9 = c0.yyxx * v2.xyxx;
	o10.xyz = v4.xyz;
	#undef c0
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c47
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

