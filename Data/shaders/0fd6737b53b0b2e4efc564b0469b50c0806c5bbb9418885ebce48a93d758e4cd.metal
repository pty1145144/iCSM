#include <metal_stdlib>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[6];
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
	texture2d<float> s0_texture [[texture(0)]],
	sampler s0 [[sampler(0)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	float4 r0;
	float4 r1;
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c2 uniforms.uniforms_float4[2]
	#define c3 uniforms.uniforms_float4[3]
	#define c4 uniforms.uniforms_float4[4]
	#define c5 uniforms.uniforms_float4[5]
	#define v0 input.v0
	#define oC0 output.oC0
	r0.xy = c1.xy + v0.xy;
	r0 = s0_texture.sample(s0, r0.xy);
	r0 = r0 * c1.zzzz;
	r1 = s0_texture.sample(s0, v0.xy);
	r0 = (c0.xxxx * r1) + r0;
	r1.xy = -c1.xy + v0.xy;
	r1 = s0_texture.sample(s0, r1.xy);
	r0 = (c1.zzzz * r1) + r0;
	r1.xy = c2.xy + v0.xy;
	r1 = s0_texture.sample(s0, r1.xy);
	r0 = (c2.zzzz * r1) + r0;
	r1.xy = -c2.xy + v0.xy;
	r1 = s0_texture.sample(s0, r1.xy);
	r0 = (c2.zzzz * r1) + r0;
	r1.xy = c3.xy + v0.xy;
	r1 = s0_texture.sample(s0, r1.xy);
	r0 = (c3.zzzz * r1) + r0;
	r1.xy = -c3.xy + v0.xy;
	r1 = s0_texture.sample(s0, r1.xy);
	r0 = (c3.zzzz * r1) + r0;
	r1.xy = c4.xy + v0.xy;
	r1 = s0_texture.sample(s0, r1.xy);
	r0 = (c4.zzzz * r1) + r0;
	r1.xy = -c4.xy + v0.xy;
	r1 = s0_texture.sample(s0, r1.xy);
	r0 = (c4.zzzz * r1) + r0;
	r1.xy = c5.xy + v0.xy;
	r1 = s0_texture.sample(s0, r1.xy);
	r0 = (c5.zzzz * r1) + r0;
	r1.xy = -c5.xy + v0.xy;
	r1 = s0_texture.sample(s0, r1.xy);
	oC0 = (c5.zzzz * r1) + r0;
	#undef c0
	#undef c1
	#undef c2
	#undef c3
	#undef c4
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

