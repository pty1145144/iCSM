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
	float4 t1 [[user(texcoord1)]];
	float4 t2 [[user(texcoord2)]];
	float4 t3 [[user(texcoord3)]];
	float4 t7 [[user(texcoord7), centroid_perspective]];
};

struct source_main_Output
{
	float4 oC0 [[color(0)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	texture2d<float> s1_texture [[texture(1)]],
	sampler s1 [[sampler(1)]],
	texture2d<float> s2_texture [[texture(2)]],
	sampler s2 [[sampler(2)]],
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(2.0, -1.0, 1.0, 0.0); (void) c0;
	const float4 c1 = float4(0.800000011, 0.200000002, 0.0, 0.0); (void) c1;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	#define c4 uniforms.uniforms_float4[0]
	#define c5 uniforms.uniforms_float4[1]
	#define c6 uniforms.uniforms_float4[2]
	#define c22 uniforms.uniforms_float4[3]
	#define c23 uniforms.uniforms_float4[4]
	#define c30 uniforms.uniforms_float4[5]
	#define t0 input.t0
	#define t1 input.t1
	#define t2 input.t2
	#define t3 input.t3
	#define t7 input.t7
	#define oC0 output.oC0
	r0 = s2_texture.sample(s2, t0.xy);
	r0.xyz = (r0.xyz * c0.xxx) + c0.yyy;
	r1.x = dot(c22.xyz, r0.xyz);
	r1.y = dot(c23.xyz, r0.xyz);
	r1.xy = r0.ww * r1.xy;
	r0.w = ((t3.w == 0.0) ? FLT_MAX : 1.0 / t3.w);
	r1.zw = r0.ww * t2.yx;
	r1.xy = (r1.xy * c5.xy) + r1.wz;
	r1 = s1_texture.sample(s1, r1.xy);
	r2 = s3_texture.sample(s3, t7.xy);
	r2.xyz = r2.xyz * c30.yyy;
	r2.xyz = r2.xyz * c30.xxx;
	r2.xyz = r2.xyz * c6.xyz;
	r1.xyz = (r1.xyz * c4.xyz) + -r2.xyz;
	r3.xyz = normalize(t1.xyz);
	r1.w = clamp(dot(r3.xyz, r0.xyz), 0.0, 1.0);
	r1.w = -r1.w + c0.z;
	r2.w = r1.w * r1.w;
	r2.w = r2.w * r2.w;
	r1.w = r1.w * r2.w;
	r1.w = (r1.w * c1.x) + c1.y;
	r0.xyz = (r1.www * r1.xyz) + r2.xyz;
	r0.w = c4.w;
	oC0 = r0;
	#undef c4
	#undef c5
	#undef c6
	#undef c22
	#undef c23
	#undef c30
	#undef t0
	#undef t1
	#undef t2
	#undef t3
	#undef t7
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

