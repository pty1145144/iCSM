#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[4];
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
	texture3d<float> s2_texture [[texture(2)]],
	sampler s2 [[sampler(2)]],
	texture3d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
	texture3d<float> s4_texture [[texture(4)]],
	sampler s4 [[sampler(4)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(0.5, 0.968750001, 0.015625, 1.0); (void) c0;
	const float4 c1 = float4(2.0, -1.0, 0.700000011, -1.428571462); (void) c1;
	const float4 c2 = float4(0.330000012, 0.670000015, 0.0, 0.0); (void) c2;
	float4 r0;
	float4 r1;
	float4 r2;
	#define c3 uniforms.uniforms_float4[0]
	#define c4 uniforms.uniforms_float4[1]
	#define c5 uniforms.uniforms_float4[2]
	#define c15 uniforms.uniforms_float4[3]
	#define v0 input.v0
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.zw);
	r0.xyz = r0.xyz * c5.xxx;
	r1 = s1_texture.sample(s1, v0.xy);
	r0.xyz = (r0.xyz * c0.xxx) + r1.xyz;
	r1.xyz = mix(r0.xyz, c15.xyz, c15.www);
	r0.xyz = (r1.xyz * c0.yyy) + c0.zzz;
	r2 = s2_texture.sample(s2, r0.xyz);
	r2.xyz = r2.xyz * c4.xxx;
	r1.xyz = (r1.xyz * c3.xxx) + r2.xyz;
	r2 = s3_texture.sample(s3, r0.xyz);
	r0 = s4_texture.sample(s4, r0.xyz);
	r1.xyz = (r2.xyz * c4.yyy) + r1.xyz;
	r0.xyz = (r0.xyz * c4.zzz) + r1.xyz;
	r1.xy = (v0.zw * c1.xx) + c1.yy;
	r1.xy = abs(r1.xy) * abs(r1.xy);
	r1.zw = r1.xy * r1.xy;
	r1.xy = (r1.xy * -r1.zw) + c0.ww;
	r0.w = (r1.x * -r1.y) + c0.w;
	r1.x = clamp(c1.z + -v0.w, 0.0, 1.0);
	r0.w = r0.w * r1.x;
	r0.w = (r0.w * c1.w) + -c1.y;
	r0.w = (r0.w * c2.x) + c2.y;
	oC0.xyz = r0.www * r0.xyz;
	oC0.w = c0.w;
	#undef c3
	#undef c4
	#undef c5
	#undef c15
	#undef v0
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

