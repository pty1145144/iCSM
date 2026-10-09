#include <metal_stdlib>
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
};

struct source_main_Output
{
	float4 o0 [[position]];
	float4 o1 [[user(texcoord0)]];
	float4 o2 [[user(texcoord1)]];
	float4 o3 [[user(texcoord2)]];
	float4 o4 [[user(texcoord3)]];
	float4 o5 [[user(color0)]];
	float4 o6 [[user(texcoord7)]];
};

vertex source_main_Output source_main (
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	float4 r0;
	#define c0 uniforms.uniforms_float4[0]
	#define c8 uniforms.uniforms_float4[1]
	#define c9 uniforms.uniforms_float4[2]
	#define c10 uniforms.uniforms_float4[3]
	#define c11 uniforms.uniforms_float4[4]
	#define c47 uniforms.uniforms_float4[5]
	#define c48 uniforms.uniforms_float4[6]
	#define c49 uniforms.uniforms_float4[7]
	#define c52 uniforms.uniforms_float4[8]
	#define c53 uniforms.uniforms_float4[9]
	#define c58 uniforms.uniforms_float4[10]
	#define c59 uniforms.uniforms_float4[11]
	#define c60 uniforms.uniforms_float4[12]
	#define v0 input.v0
	#define v1 input.v1
	#define o0 output.o0
	#define o1 output.o1
	#define o2 output.o2
	#define o3 output.o3
	#define o4 output.o4
	#define o5 output.o5
	#define o6 output.o6
	r0.w = c0.y;
	r0.x = dot(v0, c58);
	r0.y = dot(v0, c59);
	r0.z = dot(v0, c60);
	o0.x = dot(r0, c8);
	o0.y = dot(r0, c9);
	o0.w = dot(r0, c11);
	r0.w = dot(r0, c10);
	o6 = r0;
	r0.xy = c49.xy * v1.yy;
	o1.xy = (v1.xx * c48.xy) + r0.xy;
	r0.xy = c53.xy * v1.yy;
	o4.xy = (v1.xx * c52.xy) + r0.xy;
	o0.z = r0.w;
	o2.xy = c0.xx;
	o3.xy = c0.xx;
	o5 = c47;
	#undef c0
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c47
	#undef c48
	#undef c49
	#undef c52
	#undef c53
	#undef c58
	#undef c59
	#undef c60
	#undef v0
	#undef v1
	#undef o0
	#undef o1
	#undef o2
	#undef o3
	#undef o4
	#undef o5
	#undef o6
	return output;
}

