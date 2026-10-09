#include <metal_stdlib>

using namespace metal;

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
	float4 o0 [[position]];
	float4 o1 [[user(texcoord0)]];
	float4 o2 [[user(texcoord1)]];
	float4 o3 [[user(texcoord2)]];
	float4 o4 [[user(texcoord3)]];
	float4 o5 [[user(texcoord4)]];
};

vertex source_main_Output source_main (
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define o0 output.o0
	#define o1 output.o1
	#define o2 output.o2
	#define o3 output.o3
	#define o4 output.o4
	#define o5 output.o5
	o0 = v0;
	o1 = v1;
	o2 = v2;
	o3 = v3;
	o4 = v4;
	o5 = v5;
	#undef v0
	#undef v1
	#undef v2
	#undef v3
	#undef v4
	#undef v5
	#undef o0
	#undef o1
	#undef o2
	#undef o3
	#undef o4
	#undef o5
	return output;
}

