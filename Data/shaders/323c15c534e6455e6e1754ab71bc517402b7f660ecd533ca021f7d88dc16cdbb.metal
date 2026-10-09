#include <metal_stdlib>
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
	float4 oT0 [[user(texcoord0)]];
	float4 oT1 [[user(texcoord1)]];
	float4 oT2 [[user(texcoord2)]];
	float4 oT3 [[user(texcoord3)]];
	float4 oT4 [[user(texcoord4)]];
};

vertex source_main_Output source_main (
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	float4 r0;
	float4 r1;
	#define c0 uniforms.uniforms_float4[0]
	#define c4 uniforms.uniforms_float4[1]
	#define c5 uniforms.uniforms_float4[2]
	#define c6 uniforms.uniforms_float4[3]
	#define c7 uniforms.uniforms_float4[4]
	#define c48 uniforms.uniforms_float4[5]
	#define c49 uniforms.uniforms_float4[6]
	#define c50 uniforms.uniforms_float4[7]
	#define v0 input.v0
	#define v1 input.v1
	#define oPos output.oPos
	#define oT0 output.oT0
	#define oT1 output.oT1
	#define oT2 output.oT2
	#define oT3 output.oT3
	#define oT4 output.oT4
	oPos.x = dot(v0, c4);
	oPos.y = dot(v0, c5);
	oPos.z = dot(v0, c6);
	oPos.w = dot(v0, c7);
	r0.xyz = (v1.xyx * c0.yyx) + c0.xxy;
	r0.w = dot(r0.xyz, c49.xyw);
	r0.x = dot(r0.xyz, c50.xyw);
	r1.yz = r0.wx + -c48.xy;
	r1.xw = r0.wx + c48.xy;
	oT4.xy = r1.yz * c48.zw;
	oT0.xy = r1.yz;
	oT1.xy = r1.yw;
	oT3.xy = r1.xw;
	oT2.xy = r1.xz;
	#undef c0
	#undef c4
	#undef c5
	#undef c6
	#undef c7
	#undef c48
	#undef c49
	#undef c50
	#undef v0
	#undef v1
	#undef oPos
	#undef oT0
	#undef oT1
	#undef oT2
	#undef oT3
	#undef oT4
	return output;
}

