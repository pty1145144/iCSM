#include <metal_stdlib>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[2];
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
	texture2d<float> s0_texture [[texture(0)]],
	sampler s0 [[sampler(0)]],
	texture2d<float> s1_texture [[texture(1)]],
	sampler s1 [[sampler(1)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(0.5, 0.114, 0.587000012, 0.298999992); (void) c0;
	float4 r0;
	float4 r1;
	float4 r2;
	#define c1 uniforms.uniforms_float4[0]
	#define c4 uniforms.uniforms_float4[1]
	#define t0 input.t0
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, t0.xy);
	r1.xy = c0.xx;
	r1 = s1_texture.sample(s1, r1.xy);
	r1.x = dot(r1.xyz, c0.wzy);
	r1.x = r1.x * c4.w;
	r1.yzw = r0.zyx + c4.zyx;
	r2.xyz = (r0.xyz * c4.xyz) + -r1.wzy;
	r0.xyz = (r1.xxx * r2.xyz) + r1.wzy;
	r0 = r0 * c1;
	oC0 = r0;
	#undef c1
	#undef c4
	#undef t0
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

