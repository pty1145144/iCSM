#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[5];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord4)]];
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
	const float4 c0 = float4(-1.000000000e+00, 1.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c0;
	float4 r0;
	float4 r1;
	#define c1 uniforms.uniforms_float4[0]
	#define c12 uniforms.uniforms_float4[1]
	#define c20 uniforms.uniforms_float4[2]
	#define c21 uniforms.uniforms_float4[3]
	#define c29 uniforms.uniforms_float4[4]
	#define v0 input.v0
	#define v1 input.v1
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	r0.x = r0.w + c0.x;
	r0.w = c20.w;
	r0.x = (r0.w * r0.x) + c0.y;
	r0.x = r0.x * c1.w;
	r0.y = abs(c12.y);
	r0.z = c29.w * v1.w;
	oC0.w = ((-r0.y >= 0.0) ? r0.x : r0.z);
	r0.xyz = c20.xyz + -v1.xyz;
	r0.x = dot(r0.xyz, r0.xyz);
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = clamp((r0.x * c21.w) + c21.x, 0.0, 1.0);
	r1.x = min(r0.x, c21.z);
	r0.x = r1.x * r1.x;
	oC0.xyz = r0.xxx * c29.xyz;
	#undef c1
	#undef c12
	#undef c20
	#undef c21
	#undef c29
	#undef v0
	#undef v1
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

