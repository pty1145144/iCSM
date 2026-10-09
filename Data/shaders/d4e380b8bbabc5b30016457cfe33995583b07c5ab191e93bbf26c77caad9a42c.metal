#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_relational>
#include <metal_geometric>
#include <metal_graphics>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[10];
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
	const float4 c3 = float4(-1.0, 1.0, -2.0, 3.0); (void) c3;
	const float4 c4 = float4(2.0, -2.0, 0.0, 10.0); (void) c4;
	const float4 c5 = float4(-0.0001, 0.0, -12.0, 0.5); (void) c5;
	const float4 c6 = float4(0.5, 1.0, 0.041666001, 0.0); (void) c6;
	const int4 i0 = int4(24, 0, 0, 0);
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c2 uniforms.uniforms_float4[2]
	#define c11 uniforms.uniforms_float4[3]
	#define c12 uniforms.uniforms_float4[4]
	#define c14 uniforms.uniforms_float4[5]
	#define c15 uniforms.uniforms_float4[6]
	#define c16 uniforms.uniforms_float4[7]
	#define c17 uniforms.uniforms_float4[8]
	#define c18 uniforms.uniforms_float4[9]
	#define v0 input.v0
	#define oC0 output.oC0
	r0 = s1_texture.sample(s1, v0.xy);
	r1.xy = c3.xy;
	r1.xyw = (v0.xyx * c4.xyz) + r1.xyy;
	r1.z = r0.x;
	r0.x = dot(r1, c15);
	r0.y = dot(r1, c16);
	r0.z = dot(r1, c17);
	r0.w = dot(r1, c18);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r1.xyz = r0.www * r0.xyz;
	r0.xyz = (r0.xyz * -r0.www) + c1.xyz;
	r0.x = dot(r0.xyz, r0.xyz);
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.w = c4.w;
	r0.xy = r0.xw + -c0.yy;
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r0.x = clamp(r0.y * r0.x, 0.0, 1.0);
	r0.y = (r0.x * c3.z) + c3.w;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r0.y;
	r0.y = r0.x * c0.z;
	r0.z = c0.z;
	r2 = (r0.zzzz * r0.xxxx) + c5.xxxx;
	if (any(r2.xyz < float3(0.0))) discard_fragment();
	r2.w = c3.y;
	r0.xzw = c4.zzz;
	r1.w = c5.z;
	for (int rep1 = 0; rep1 < i0.x; rep1++) {
		r3.xyz = r1.www * c2.xyz;
		r2.xyz = (r3.xyz * r0.yyy) + r1.xyz;
		r3.x = dot(r2, c11);
		r3.y = dot(r2, c12);
		r2.x = dot(r2, c14);
		r2.x = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
		r2.xy = (r3.xy * r2.xx) + c3.yy;
		r3.x = r2.x * c5.w;
		r3.y = (r2.y * -c6.x) + c6.y;
		r3.xy = clamp(r3.xy, float2(0.0), float2(1.0));
		r3 = s0_texture.sample(s0, r3.xy);
		r0.xzw = r0.xzw + r3.xyz;
		r1.w = r1.w + c3.y;
	}
	oC0.xyz = r0.xzw * c6.zzz;
	oC0.w = c3.y;
	#undef c0
	#undef c1
	#undef c2
	#undef c11
	#undef c12
	#undef c14
	#undef c15
	#undef c16
	#undef c17
	#undef c18
	#undef v0
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

