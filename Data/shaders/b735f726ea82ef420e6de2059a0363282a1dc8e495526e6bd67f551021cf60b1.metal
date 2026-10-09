#include <metal_stdlib>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[1];
};

struct source_main_Input
{
	float4 t0 [[user(texcoord0)]];
};

struct source_main_Output
{
	float4 oC0 [[color(0)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(0.0, 0.0, 0.0, 0.0); (void) c0;
	float4 r0;
	#define c29 uniforms.uniforms_float4[0]
	#define t0 input.t0
	#define oC0 output.oC0
	r0.w = t0.x * c29.w;
	r0.xyz = c0.xxx;
	oC0 = r0;
	#undef c29
	#undef t0
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

