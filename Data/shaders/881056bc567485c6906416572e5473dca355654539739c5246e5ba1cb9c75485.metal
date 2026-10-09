#include <metal_stdlib>
#include <metal_common>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[1];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
};

struct source_main_Output
{
	float4 oC0 [[color(0)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(-5.000000000e-01, 5.000000000e-01, 9.990234375e-01, 4.882812500e-04); (void) c0;
	const float4 c1 = float4(0.000000000e+00, 1.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c1;
	float4 r0;
	float4 r1;
	#define c5 uniforms.uniforms_float4[0]
	#define v0 input.v0
	#define oC0 output.oC0
	r0.x = clamp(v0.z, 0.0, 1.0);
	r0.x = (r0.x * c0.z) + c0.w;
	r0.y = c1.x;
	r0 = s3_texture.sample(s3, r0.xy);
	r1.xy = c0.xy;
	r1.x = r1.x + c5.z;
	r1.xyz = (c5.www * r1.xxx) + r1.yyy;
	r1.w = c1.y;
	oC0 = r0 * r1;
	#undef c5
	#undef v0
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

