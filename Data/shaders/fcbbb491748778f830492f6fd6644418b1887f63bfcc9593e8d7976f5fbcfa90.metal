#include <metal_stdlib>
#include <metal_common>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[2];
};

struct source_main_Input
{
	float4 v0 [[user(color0)]];
	float4 t0 [[user(texcoord0)]];
	float4 t7 [[user(texcoord7)]];
};

struct source_main_Output
{
	float4 oC0 [[color(0)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	texture2d<float> s0_texture [[texture(0)]],
	sampler s0 [[sampler(0)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	float4 r0;
	float4 r1;
	#define c0 uniforms.uniforms_float4[0]
	#define c29 uniforms.uniforms_float4[1]
	#define v0 input.v0
	#define t0 input.t0
	#define t7 input.t7
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, t0.xy);
	r0 = clamp(r0 * v0, float4(0.0), float4(1.0));
	r1.xyz = mix(c0.xyz, r0.xyz, r0.www);
	r1.w = t7.w * c29.w;
	oC0 = r1;
	#undef c0
	#undef c29
	#undef v0
	#undef t0
	#undef t7
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

