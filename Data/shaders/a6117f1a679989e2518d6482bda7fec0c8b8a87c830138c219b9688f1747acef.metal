#include <metal_stdlib>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[5];
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
	#define c51 uniforms.uniforms_float4[4]
	#define v0 input.v0
	#define v1 input.v1
	#define oPos output.oPos
	#define oT0 output.oT0
	#define oT1 output.oT1
	#define oT2 output.oT2
	#define oT3 output.oT3
	oT0.xy = v1.xy + c48.xy;
	oT1.xy = v1.xy + c49.xy;
	oT2.xy = v1.xy + c50.xy;
	oT3.xy = v1.xy + c51.xy;
	oPos = (v0.xyzx * c0.yyyx) + c0.xxxy;
	#undef c0
	#undef c48
	#undef c49
	#undef c50
	#undef c51
	#undef v0
	#undef v1
	#undef oPos
	#undef oT0
	#undef oT1
	#undef oT2
	#undef oT3
	return output;
}

