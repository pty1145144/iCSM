#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[2];
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
	const float4 c0 = float4(0.5, 2.0, -1.0, 1.0); (void) c0;
	const float4 c1 = float4(0.330000012, 0.670000015, 0.0, 0.0); (void) c1;
	const float4 c2 = float4(0.700000011, 1.428571462, 1.0, 0.0); (void) c2;
	float4 r0;
	float4 r1;
	#define c5 uniforms.uniforms_float4[0]
	#define c10 uniforms.uniforms_float4[1]
	#define v0 input.v0
	#define oC0 output.oC0
	r0.xy = (v0.zw * c0.yy) + c0.zz;
	r0.xy = abs(r0.xy) * abs(r0.xy);
	r0.zw = r0.xy * r0.xy;
	r0.xy = (r0.xy * -r0.zw) + c0.ww;
	r0.x = (r0.x * -r0.y) + c0.w;
	r0.y = clamp(c2.x + -v0.w, 0.0, 1.0);
	r0.x = r0.x * r0.y;
	r0.x = (r0.x * -c2.y) + c2.z;
	r0.x = (r0.x * c1.x) + c1.y;
	r1 = s0_texture.sample(s0, v0.zw);
	r0.yzw = r1.xyz * c5.xxx;
	r1 = s1_texture.sample(s1, v0.xy);
	r0.yzw = (r0.yzw * c0.xxx) + r1.xyz;
	r0.xyz = r0.xxx * r0.yzw;
	oC0.xyz = (c10.xxx * -r0.xyz) + r0.xyz;
	oC0.w = c0.w;
	#undef c5
	#undef c10
	#undef v0
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

