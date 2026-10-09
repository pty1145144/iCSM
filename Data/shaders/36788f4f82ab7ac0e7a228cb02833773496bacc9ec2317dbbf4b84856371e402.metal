#include <metal_stdlib>
#include <metal_math>

using namespace metal;

struct source_main_Input
{
	float4 v0 [[user(texcoord1)]];
};

struct source_main_Output
{
	float4 oC0 [[color(0)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(1.0, 0.0, 0.0, 0.0); (void) c0;
	float4 r0;
	#define v0 input.v0
	#define oC0 output.oC0
	r0.x = ((v0.w == 0.0) ? FLT_MAX : 1.0 / v0.w);
	oC0.x = r0.x * v0.z;
	oC0.yzw = c0.xxx;
	#undef v0
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

