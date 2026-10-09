#include <metal_stdlib>
#include <metal_geometric>
#include <metal_texture>

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
	float oDepth [[depth(any)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	texture2d<float> s0_texture [[texture(0)]],
	sampler s0 [[sampler(0)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c1 = float4(0.212500005, 0.71539998, 0.072099998, 0.0); (void) c1;
	const float4 c2 = float4(1.0, 0.0, 0.0, 0.0); (void) c2;
	float4 r0;
	#define c0 uniforms.uniforms_float4[0]
	#define t0 input.t0
	#define oC0 output.oC0
	#define oDepth output.oDepth
	r0 = s0_texture.sample(s0, t0.xy);
	r0.x = dot(r0.xyz, c1.xyz);
	r0.y = -r0.x + c0.y;
	r0.x = r0.x + -c0.x;
	r0.y = ((r0.y >= 0.0) ? c2.x : c2.y);
	r0.w = ((r0.x >= 0.0) ? r0.y : c1.w);
	r0.xyz = c2.xxx;
	oC0 = r0;
	oDepth = c1.w;
	#undef c0
	#undef t0
	#undef oC0
	#undef oDepth
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

