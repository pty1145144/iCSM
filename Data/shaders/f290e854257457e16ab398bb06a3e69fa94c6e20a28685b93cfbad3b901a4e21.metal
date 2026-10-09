#include <metal_stdlib>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[1];
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
	float4 oT0 [[user(texcoord0)]];
	float4 oT1 [[user(texcoord1)]];
};

vertex source_main_Output source_main (
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	#define c0 uniforms.uniforms_float4[0]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define oPos output.oPos
	#define oT0 output.oT0
	#define oT1 output.oT1
	oPos = (v0.xyzx * c0.yyyx) + c0.xxxy;
	oT0.xy = v1.xy;
	oT1 = v2;
	#undef c0
	#undef v0
	#undef v1
	#undef v2
	#undef oPos
	#undef oT0
	#undef oT1
	return output;
}

