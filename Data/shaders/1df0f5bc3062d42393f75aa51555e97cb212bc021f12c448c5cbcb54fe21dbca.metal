#include <metal_stdlib>
#include <metal_common>
#include <metal_math>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[3];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord4)]];
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
	const float4 c0 = float4(-2.0, 0.0, 0.0, 0.0); (void) c0;
	float4 r0;
	#define c12 uniforms.uniforms_float4[0]
	#define c21 uniforms.uniforms_float4[1]
	#define c29 uniforms.uniforms_float4[2]
	#define v0 input.v0
	#define oC0 output.oC0
	r0.x = c21.y + -v0.z;
	r0.x = r0.x + c0.x;
	r0.x = clamp(r0.x * c21.w, 0.0, 1.0);
	r0.y = abs(c12.y);
	r0.z = c29.w * v0.w;
	oC0.w = ((-r0.y >= 0.0) ? r0.x : r0.z);
	oC0.xyz = c0.yyy;
	#undef c12
	#undef c21
	#undef c29
	#undef v0
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

