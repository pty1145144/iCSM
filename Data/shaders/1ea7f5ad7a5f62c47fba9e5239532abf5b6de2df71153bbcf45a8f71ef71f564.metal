#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[4];
};

struct source_main_Input
{
	float4 v0 [[user(color0)]];
	float4 t0 [[user(texcoord0)]];
	float4 t1 [[user(texcoord1)]];
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
	float4 r0;
	float4 r1;
	float4 r2;
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c29 uniforms.uniforms_float4[2]
	#define c30 uniforms.uniforms_float4[3]
	#define v0 input.v0
	#define t0 input.t0
	#define t1 input.t1
	#define oC0 output.oC0
	r0 = s1_texture.sample(s1, t0.xy);
	r1 = s0_texture.sample(s0, t0.xy);
	r2.xyz = -t1.xyz + c1.xyz;
	r1.w = dot(r2.xyz, r2.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = clamp((r1.w * c0.w) + c0.x, 0.0, 1.0);
	r0.x = min(r1.w, c0.z);
	r1.w = r0.x * r0.x;
	r0.x = r0.z * r0.z;
	r0.yzw = r1.zyx * v0.zyx;
	r0.xyz = r0.wzy * r0.xxx;
	r1.xyz = r0.xyz * c30.xxx;
	r0.w = c30.x;
	r0.xyz = (r0.xyz * -r0.www) + c29.xyz;
	r0.xyz = (r1.www * r0.xyz) + r1.xyz;
	r0.w = t1.w * c29.w;
	oC0 = r0;
	#undef c0
	#undef c1
	#undef c29
	#undef c30
	#undef v0
	#undef t0
	#undef t1
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

