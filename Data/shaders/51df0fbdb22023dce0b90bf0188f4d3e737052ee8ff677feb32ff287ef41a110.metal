#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[9];
};

struct source_main_Input
{
	float4 t0 [[user(texcoord0)]];
	float4 t1 [[user(texcoord1)]];
	float4 t2 [[user(texcoord2)]];
	float4 t3 [[user(texcoord3)]];
	float4 t4 [[user(texcoord4)]];
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
	texturecube<float> s4_texture [[texture(4)]],
	sampler s4 [[sampler(4)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c4 = float4(2.0, -1.0, 1.0, 0.0); (void) c4;
	const float4 c6 = float4(0.298999992, 0.587000012, 0.114, 0.0); (void) c6;
	const float4 c7 = float4(0.400000005, 0.600000023, 0.0, 0.0); (void) c7;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c2 uniforms.uniforms_float4[2]
	#define c3 uniforms.uniforms_float4[3]
	#define c5 uniforms.uniforms_float4[4]
	#define c11 uniforms.uniforms_float4[5]
	#define c12 uniforms.uniforms_float4[6]
	#define c29 uniforms.uniforms_float4[7]
	#define c30 uniforms.uniforms_float4[8]
	#define t0 input.t0
	#define t1 input.t1
	#define t2 input.t2
	#define t3 input.t3
	#define t4 input.t4
	#define t5 input.t5
	#define t7 input.t7
	#define oC0 output.oC0
	r0 = s3_texture.sample(s3, t0.xy);
	r1.xy = t0.wz;
	r1 = s3_texture.sample(s3, r1.xy);
	r2.xyz = (r0.xyz * c4.xxx) + c4.yyy;
	r1.xyz = (r1.xyz * c4.xxx) + r2.xyz;
	r1.xyz = r1.xyz + c4.yyy;
	r2.xyz = normalize(r1.xyz);
	r1.xyz = r2.yyy * t4.xyz;
	r1.xyz = (r2.xxx * t3.xyz) + r1.xyz;
	r1.xyz = (r2.zzz * t2.xyz) + r1.xyz;
	r1.w = dot(r1.xyz, t1.xyz);
	r1.w = r1.w + r1.w;
	r2.w = dot(r1.xyz, r1.xyz);
	r3.xyz = r2.www * t1.xyz;
	r1.xyz = (r1.www * r1.xyz) + -r3.xyz;
	r1.w = ((t5.z == 0.0) ? FLT_MAX : 1.0 / t5.z);
	r3.xy = r1.ww * t5.xy;
	r1.w = r0.w * c5.x;
	r3.xy = (r2.xy * r1.ww) + r3.xy;
	r1 = s4_texture.sample(s4, r1.xyz);
	r3 = s2_texture.sample(s2, r3.xy);
	r1.xyz = r1.xyz * c30.zzz;
	r1.xyz = r0.www * r1.xyz;
	r1.xyz = r1.xyz * c0.xyz;
	r4.xyz = (r1.xyz * r1.xyz) + -r1.xyz;
	r1.xyz = (c2.xyz * r4.xyz) + r1.xyz;
	r1.w = dot(r1.xyz, c6.xyz);
	r4.xyz = mix(r1.www, r1.xyz, c3.xyz);
	r3.w = clamp(dot(r2.xyz, t1.xyz), 0.0, 1.0);
	r3.w = -r3.w + c4.z;
	r3.w = (r3.w * c7.x) + c7.y;
	r1.xyz = r3.www * r4.xyz;
	r1.xyz = (r3.xyz * c1.xyz) + r1.xyz;
	r2.xyz = -t7.xyz + c11.xyz;
	r1.w = dot(r2.xyz, r2.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = clamp((r1.w * c12.w) + c12.x, 0.0, 1.0);
	r2.x = min(r1.w, c12.z);
	r1.w = r2.x * r2.x;
	r0.xyz = mix(r1.xyz, c29.xyz, r1.www);
	oC0 = r0;
	#undef c0
	#undef c1
	#undef c2
	#undef c3
	#undef c5
	#undef c11
	#undef c12
	#undef c29
	#undef c30
	#undef t0
	#undef t1
	#undef t2
	#undef t3
	#undef t4
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

