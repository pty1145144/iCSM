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
	texture2d<float> s6_texture [[texture(6)]],
	sampler s6 [[sampler(6)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(2.0, -1.0, 0.0, 0.062499999); (void) c0;
	const float4 c2 = float4(0.187499998, 0.0, -0.000976562, 0.001953125); (void) c2;
	const float4 c3 = float4(-0.000976562, 0.001953125, 0.222222194, 0.444444389); (void) c3;
	const float4 c4 = float4(0.111111097, 0.0, 0.0, 0.0); (void) c4;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	#define c1 uniforms.uniforms_float4[0]
	#define c5 uniforms.uniforms_float4[1]
	#define c11 uniforms.uniforms_float4[2]
	#define c12 uniforms.uniforms_float4[3]
	#define c29 uniforms.uniforms_float4[4]
	#define t0 input.t0
	#define t5 input.t5
	#define t7 input.t7
	#define oC0 output.oC0
	r0 = s3_texture.sample(s3, t0.xy);
	r1.xy = c2.xy;
	r2.xy = c0.wz;
	r1 = s6_texture.sample(s6, r1.xy);
	r2 = s6_texture.sample(s6, r2.xy);
	r0.z = -r1.x + t5.z;
	r1.x = (r2.x * r0.z) + t5.x;
	r0.z = ((t5.z == 0.0) ? FLT_MAX : 1.0 / t5.z);
	r1.y = t5.y;
	r1.xy = r0.zz * r1.xy;
	r0.xy = (r0.xy * c0.xx) + c0.yy;
	r0.z = r0.w * c5.x;
	r0.xy = (r0.xy * r0.zz) + r1.xy;
	r1.xy = r0.xy + c2.wz;
	r2.xy = r0.xy + c2.zz;
	r3.xy = r0.xy + c3.xy;
	r0.xy = r0.xy + c2.ww;
	r1 = s2_texture.sample(s2, r1.xy);
	r2 = s2_texture.sample(s2, r2.xy);
	r0 = s2_texture.sample(s2, r0.xy);
	r3 = s2_texture.sample(s2, r3.xy);
	r1.xyz = r1.xyz * c3.zzz;
	r1.xyz = (r2.xyz * c3.www) + r1.xyz;
	r1.xyz = (r3.xyz * c3.zzz) + r1.xyz;
	r0.xyz = (r0.xyz * c4.xxx) + r1.xyz;
	r1.xyz = r0.xyz * c1.xyz;
	r2.xyz = c1.xyz;
	r0.xyz = (r0.xyz * -r2.xyz) + c29.xyz;
	r2.xyz = -t7.xyz + c11.xyz;
	r0.w = dot(r2.xyz, r2.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = clamp((r0.w * c12.w) + c12.x, 0.0, 1.0);
	r1.w = min(r0.w, c12.z);
	r0.w = r1.w * r1.w;
	r0.xyz = (r0.www * r0.xyz) + r1.xyz;
	r0.w = t7.w * c29.w;
	oC0 = r0;
	#undef c1
	#undef c5
	#undef c11
	#undef c12
	#undef c29
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

