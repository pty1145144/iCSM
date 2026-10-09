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
	texturecube<float> s1_texture [[texture(1)]],
	sampler s1 [[sampler(1)]],
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
	texture2d<float> s13_texture [[texture(13)]],
	sampler s13 [[sampler(13)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c1 = float4(2.000000000e+00, -1.000000000e+00, 1.000000000e+00, -2.000000000e+00); (void) c1;
	const float4 c2 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, 0.000000000e+00); (void) c2;
	float4 r0;
	float4 r1;
	#define c0 uniforms.uniforms_float4[0]
	#define c3 uniforms.uniforms_float4[1]
	#define c12 uniforms.uniforms_float4[2]
	#define c19 uniforms.uniforms_float4[3]
	#define c20 uniforms.uniforms_float4[4]
	#define c21 uniforms.uniforms_float4[5]
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
	r1.xyz = (r1.xyz * c1.xxx) + c1.yyy;
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
	r1 = s13_texture.sample(s13, v0.xy);
	r1.yz = abs(c12.wy);
	r0.w = ((-r1.y >= 0.0) ? c1.z : r1.x);
	r0.xyz = r0.www * r0.xyz;
	r0.xyz = r0.xyz * c0.xyz;
	r1.xyw = (r0.xyz * r0.xyz) + -r0.xyz;
	r0.xyz = (c19.xxx * r1.xyw) + r0.xyz;
	r0.w = dot(r0.xyz, c2.xyz);
	r1.xyw = mix(r0.www, r0.xyz, c3.xyz);
	oC0.xyz = r1.xyw * c30.xxx;
	r0.x = c21.y + -v4.z;
	r0.x = r0.x + c1.w;
	r0.x = clamp(r0.x * c21.w, 0.0, 1.0);
	r0.y = c29.w * v4.w;
	oC0.w = ((-r1.z >= 0.0) ? r0.x : r0.y);
	#undef c0
	#undef c3
	#undef c12
	#undef c19
	#undef c20
	#undef c21
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

