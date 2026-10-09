#include <metal_stdlib>

using namespace metal;

struct source_main_Input
{
	float4 v0 [[attribute(0)]];
	float4 v1 [[attribute(1)]];
	float4 v2 [[attribute(2)]];
	float4 v3 [[attribute(3)]];
};

struct source_main_Output
{
	float4 o0 [[position]];
	float4 o1 [[user(texcoord0)]];
	float4 o2 [[user(texcoord1)]];
	float4 o3 [[user(texcoord2)]];
};

vertex source_main_Output source_main (
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define o0 output.o0
	#define o1 output.o1
	#define o2 output.o2
	#define o3 output.o3
	o0 = v0;
	o1 = v1;
	o2 = v2;
	o3 = v3;
	#undef v0
	#undef v1
	#undef v2
	#undef v3
	#undef o0
	#undef o1
	#undef o2
	#undef o3
	return output;
}

