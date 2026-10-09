#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[6];
};

struct source_main_Input
{
	float4 t0 [[user(texcoord0)]];
	float4 t2 [[user(texcoord2)]];
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
	float4 r2;
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c11 uniforms.uniforms_float4[2]
	#define c12 uniforms.uniforms_float4[3]
	#define c29 uniforms.uniforms_float4[4]
	#define c30 uniforms.uniforms_float4[5]
	#define t0 input.t0
	#define t2 input.t2
	#define t7 input.t7
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, t0.xy);
	r1.xyz = -t7.xyz + c11.xyz;
	r1.x = dot(r1.xyz, r1.xyz);
	r1.x = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.x = clamp((r1.x * c12.w) + c12.x, 0.0, 1.0);
	r2.w = min(r1.x, c12.z);
	r1.x = r2.w * r2.w;
	r0 = r0 * t2;
	r0 = r0 * c0;
	r1.yzw = r0.zyx * c1.xxx;
	r2.xyz = r1.wzy * c30.www;
	r2.w = c30.w;
	r1.yzw = (r1.yzw * -r2.www) + c29.zyx;
	r0.xyz = (r1.xxx * r1.wzy) + r2.xyz;
	oC0 = r0;
	#undef c0
	#undef c1
	#undef c11
	#undef c12
	#undef c29
	#undef c30
	#undef t0
	#undef t2
	#undef t7
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

