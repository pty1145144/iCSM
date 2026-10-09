#include <metal_stdlib>
#include <metal_math>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[3];
};

struct source_main_Input
{
	float4 v0 [[user(color0)]];
	float4 t0 [[user(texcoord0)]];
	float4 t5 [[user(texcoord5)]];
	float4 t7 [[user(texcoord7)]];
};

struct source_main_Output
{
	float4 oC0 [[color(0)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	texture2d<float> s2_texture [[texture(2)]],
	sampler s2 [[sampler(2)]],
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(2.0, -1.0, 0.0, 0.0); (void) c0;
	float4 r0;
	float4 r1;
	#define c1 uniforms.uniforms_float4[0]
	#define c5 uniforms.uniforms_float4[1]
	#define c29 uniforms.uniforms_float4[2]
	#define v0 input.v0
	#define t0 input.t0
	#define t5 input.t5
	#define t7 input.t7
	#define oC0 output.oC0
	r0 = s3_texture.sample(s3, t0.xy);
	r0.z = ((t5.z == 0.0) ? FLT_MAX : 1.0 / t5.z);
	r1.xy = r0.zz * t5.xy;
	r0.z = r0.w * c5.x;
	r0.xy = (r0.xy * c0.xx) + c0.yy;
	r0.z = r0.z * v0.w;
	r0.xy = (r0.xy * r0.zz) + r1.xy;
	r0 = s2_texture.sample(s2, r0.xy);
	r1.xyz = v0.xyz * c1.xyz;
	r0.xyz = r0.xyz * r1.xyz;
	r0.w = t7.w * c29.w;
	oC0 = r0;
	#undef c1
	#undef c5
	#undef c29
	#undef v0
	#undef t0
	#undef t5
	#undef t7
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

