#include <metal_stdlib>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[4];
};

struct source_main_Input
{
	float4 v0 [[attribute(0)]];
};

struct source_main_Output
{
	float4 oPos [[position]];
	float4 oT0 [[user(texcoord0)]];
};

vertex source_main_Output source_main (
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	float4 r0;
	#define c4 uniforms.uniforms_float4[0]
	#define c5 uniforms.uniforms_float4[1]
	#define c6 uniforms.uniforms_float4[2]
	#define c7 uniforms.uniforms_float4[3]
	#define v0 input.v0
	#define oPos output.oPos
	#define oT0 output.oT0
	oPos.x = dot(v0, c4);
	oPos.y = dot(v0, c5);
	oPos.w = dot(v0, c7);
	r0.x = dot(v0, c6);
	oPos.z = r0.x;
	oT0.x = r0.x;
	#undef c4
	#undef c5
	#undef c6
	#undef c7
	#undef v0
	#undef oPos
	#undef oT0
	return output;
}

