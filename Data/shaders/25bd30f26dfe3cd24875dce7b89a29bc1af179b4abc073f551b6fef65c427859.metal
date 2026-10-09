#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_relational>
#include <metal_graphics>
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
	texture2d<float> s0_texture [[texture(0)]],
	sampler s0 [[sampler(0)]],
	texture2d<float> s1_texture [[texture(1)]],
	sampler s1 [[sampler(1)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c1 = float4(0.05, 0.700000011, -0.5, 0.100000001); (void) c1;
	const float4 c2 = float4(-2.0, 3.0, 1.0, 0.300000011); (void) c2;
	const float4 c3 = float4(-0.200000002, 1.0, 0.0, 0.0); (void) c3;
	float4 r0;
	float4 r1;
	#define c0 uniforms.uniforms_float4[0]
	#define v0 input.v0
	#define oC0 output.oC0
	r0 = -c0.xxxx + v0.yyyy;
	if (any(r0.xyz < float3(0.0))) discard_fragment();
	r0.xz = c0.xz;
	r0.y = r0.z * c1.x;
	r0.y = fract(abs(r0.y));
	r0.y = ((c0.z >= 0.0) ? r0.y : -r0.y);
	r1.y = (v0.y * c1.y) + -r0.y;
	r1.x = v0.x;
	r1 = s1_texture.sample(s1, r1.xy);
	r0.yz = r1.xy + c1.zz;
	r1.x = -c0.x + c0.y;
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r0.w = clamp(r0.w * r1.x, 0.0, 1.0);
	r1.x = (r0.w * c2.x) + c2.y;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.x;
	r0.yz = r0.ww * r0.yz;
	r0.yz = (r0.yz * c1.ww) + v0.xy;
	r1 = s0_texture.sample(s0, r0.yz);
	r0.x = r0.x + c2.z;
	r0.y = -r0.x + c0.x;
	r0.x = -r0.x + v0.y;
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r0.x = clamp(r0.y * r0.x, 0.0, 1.0);
	r0.y = (r0.x * c2.x) + c2.y;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r0.y;
	r1.w = pow(abs(r0.x), c2.w);
	r0.xyz = r1.www * r1.xyz;
	r0.w = r0.w * r0.x;
	oC0.x = (r0.w * c3.x) + r0.x;
	oC0.yzw = (r0.yzy * c3.yyz) + c3.zzy;
	#undef c0
	#undef v0
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

