#include <metal_stdlib>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[4];
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
	float4 oT5 [[user(texcoord5)]];
	float4 oT6 [[user(texcoord6)]];
};

vertex source_main_Output source_main (
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	#define c0 uniforms.uniforms_float4[0]
	#define c48 uniforms.uniforms_float4[1]
	#define c49 uniforms.uniforms_float4[2]
	#define c50 uniforms.uniforms_float4[3]
	#define v0 input.v0
	#define v1 input.v1
	#define oPos output.oPos
	#define oT0 output.oT0
	#define oT1 output.oT1
	#define oT2 output.oT2
	#define oT3 output.oT3
	#define oT4 output.oT4
	#define oT5 output.oT5
	#define oT6 output.oT6
	oT1.xy = v1.xy + c48.xy;
	oT2.xy = v1.xy + c49.xy;
	oT3.xy = v1.xy + c50.xy;
	oT4.xy = v1.xy + -c48.xy;
	oT5.xy = v1.xy + -c49.xy;
	oT6.xy = v1.xy + -c50.xy;
	oPos = (v0.xyzx * c0.yyyx) + c0.xxxy;
	oT0.xy = v1.xy;
	#undef c0
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
	#undef oT5
	#undef oT6
	return output;
}

