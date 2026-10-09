#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[8];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord1)]];
	float4 v2 [[user(texcoord2)]];
	float4 v3 [[user(texcoord3)]];
	float4 v4 [[user(texcoord4)]];
};

struct source_main_Output
{
	float4 oC0 [[color(0)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	texture2d<float> s0_texture [[texture(0)]],
	sampler s0 [[sampler(0)]],
	texturecube<float> s1_texture [[texture(1)]],
	sampler s1 [[sampler(1)]],
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c2 = float4(2.0, -1.0, 1.0, 0.0); (void) c2;
	const float4 c4 = float4(0.298999992, 0.587000012, 0.114, 0.0); (void) c4;
	float4 r0;
	float4 r1;
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c3 uniforms.uniforms_float4[2]
	#define c12 uniforms.uniforms_float4[3]
	#define c19 uniforms.uniforms_float4[4]
	#define c20 uniforms.uniforms_float4[5]
	#define c29 uniforms.uniforms_float4[6]
	#define c30 uniforms.uniforms_float4[7]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define oC0 output.oC0
	r0.xyz = v3.xyz;
	r1.xyz = r0.yzx * v2.zxy;
	r0.xyz = (v2.yzx * r0.zxy) + -r1.xyz;
	r0.xyz = r0.xyz * v3.www;
	r1 = s3_texture.sample(s3, v1.xy);
	r1.xyz = (r1.xyz * c2.xxx) + c2.yyy;
	r0.xyz = r0.xyz * r1.yyy;
	r0.xyz = (r1.xxx * v3.xyz) + r0.xyz;
	r0.xyz = (r1.zzz * v2.xyz) + r0.xyz;
	r1.xyz = c20.xyz + -v4.xyz;
	r0.w = dot(r0.xyz, r1.xyz);
	r0.w = r0.w + r0.w;
	r1.w = dot(r0.xyz, r0.xyz);
	r1.xyz = r1.xyz * r1.www;
	r0.xyz = (r0.www * r0.xyz) + -r1.xyz;
	r0 = s1_texture.sample(s1, r0.xyz);
	r0.xyz = r0.xyz * c30.zzz;
	r0.xyz = r0.xyz * c0.xyz;
	r1.xyz = (r0.xyz * r0.xyz) + -r0.xyz;
	r0.xyz = (c19.xxx * r1.xyz) + r0.xyz;
	r0.w = dot(r0.xyz, c4.xyz);
	r1.xyz = mix(r0.www, r0.xyz, c3.xyz);
	oC0.xyz = r1.xyz * c30.xxx;
	r0 = s0_texture.sample(s0, v0.xy);
	r0.x = r0.w + c2.y;
	r0.z = c2.z;
	r0.x = (c20.w * r0.x) + r0.z;
	r0.x = r0.x * c1.w;
	r0.y = abs(c12.y);
	r0.z = c29.w * v4.w;
	oC0.w = ((-r0.y >= 0.0) ? r0.x : r0.z);
	#undef c0
	#undef c1
	#undef c3
	#undef c12
	#undef c19
	#undef c20
	#undef c29
	#undef c30
	#undef v0
	#undef v1
	#undef v2
	#undef v3
	#undef v4
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

