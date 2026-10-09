#include <metal_stdlib>
#include <metal_common>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[3];
};

struct source_main_Input
{
	float4 t0 [[user(texcoord0)]];
	float4 t1 [[user(texcoord1), centroid_perspective]];
	float4 t2 [[user(texcoord2), centroid_perspective]];
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
	const float4 c0 = float4(1.0, -2.0, 0.0, 0.0); (void) c0;
	float4 r0;
	#define c1 uniforms.uniforms_float4[0]
	#define c3 uniforms.uniforms_float4[1]
	#define c4 uniforms.uniforms_float4[2]
	#define t0 input.t0
	#define t1 input.t1
	#define t2 input.t2
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, t2.xy);
	r0.x = clamp((t1.w * t1.y) + t1.x, 0.0, 1.0);
	r0.x = clamp((r0.x * c4.x) + t1.z, 0.0, 1.0);
	r0.x = clamp(-r0.x + r0.w, 0.0, 1.0);
	r0.xyz = (r0.xxx * c1.xyz) + -r0.xxx;
	r0.xyz = r0.xyz + c0.xxx;
	r0.xyz = -r0.xyz + c0.xxx;
	r0.w = -t0.z + c3.y;
	r0.w = r0.w + c0.y;
	r0.w = clamp(r0.w * c3.w, 0.0, 1.0);
	r0.w = -r0.w + c0.x;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r0.w;
	r0.xyz = (r0.xyz * -r0.www) + c0.xxx;
	r0.w = c0.x;
	oC0 = r0;
	#undef c1
	#undef c3
	#undef c4
	#undef t0
	#undef t1
	#undef t2
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

