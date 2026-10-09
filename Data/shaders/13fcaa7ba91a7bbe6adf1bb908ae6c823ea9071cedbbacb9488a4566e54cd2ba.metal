#include <metal_stdlib>
#include <metal_relational>
#include <metal_graphics>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[2];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord2)]];
	float4 v2 [[user(texcoord6)]];
};

struct source_main_Output
{
	float4 oC0 [[color(0)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	texture2d<float> s4_texture [[texture(4)]],
	sampler s4 [[sampler(4)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(1.0, 0.0, -0.150000004, 0.0); (void) c0;
	float4 r0;
	float4 r1;
	#define c11 uniforms.uniforms_float4[0]
	#define c30 uniforms.uniforms_float4[1]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define oC0 output.oC0
	r0.xyz = c0.xxy * v0.xyx;
	r0.w = c11.w;
	r0 = s4_texture.sample(s4, r0.xy, bias(r0.w));
	r1 = (r0.wwww * v1.wwww) + c0.zzzz;
	r0.xyz = r0.xyz * v2.xyz;
	r0.xyz = r0.xyz * v1.xyz;
	oC0.xyz = r0.xyz * c30.xxx;
	if (any(r1.xyz < float3(0.0))) discard_fragment();
	oC0.w = c0.x;
	#undef c11
	#undef c30
	#undef v0
	#undef v1
	#undef v2
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

