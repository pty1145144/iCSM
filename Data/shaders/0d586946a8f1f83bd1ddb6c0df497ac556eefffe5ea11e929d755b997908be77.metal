#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[12];
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
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
	texture2d<float> s7_texture [[texture(7)]],
	sampler s7 [[sampler(7)]],
	texture2d<float> s12_texture [[texture(12)]],
	sampler s12 [[sampler(12)]],
	texture2d<float> s13_texture [[texture(13)]],
	sampler s13 [[sampler(13)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(2.000000000e+00, -1.000000000e+00, 1.000000000e+00, 0.000000000e+00); (void) c0;
	const float4 c2 = float4(-4.000000060e-01, 0.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c2;
	float4 r0;
	float4 r1;
	float4 r2;
	#define c1 uniforms.uniforms_float4[0]
	#define c3 uniforms.uniforms_float4[1]
	#define c12 uniforms.uniforms_float4[2]
	#define c21 uniforms.uniforms_float4[3]
	#define c22 uniforms.uniforms_float4[4]
	#define c23 uniforms.uniforms_float4[5]
	#define c24 uniforms.uniforms_float4[6]
	#define c25 uniforms.uniforms_float4[7]
	#define c27 uniforms.uniforms_float4[8]
	#define c28 uniforms.uniforms_float4[9]
	#define c29 uniforms.uniforms_float4[10]
	#define c30 uniforms.uniforms_float4[11]
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
	r1.xyz = (r1.xyz * c0.xxx) + c0.yyy;
	r0.xyz = r0.xyz * r1.yyy;
	r0.xyz = (r1.xxx * v3.xyz) + r0.xyz;
	r0.xyz = (r1.zzz * v2.xyz) + r0.xyz;
	r1.xyz = normalize(r0.xyz);
	r0.xyz = c23.xyz + -v4.xyz;
	r0.w = dot(r0.xyz, r0.xyz);
	r2.y = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r2.z = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.xyz = r0.xyz * r2.yyy;
	r0.x = dot(r0.xyz, r1.xyz);
	r0.x = clamp(r0.x + c28.w, 0.0, 1.0);
	r2.x = c0.z;
	r0.y = clamp(dot(c22.xyz, r2.xyz), 0.0, 1.0);
	r0.z = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r0.z = r0.z + -c22.w;
	r0.x = r0.x * r0.y;
	r1 = (v4.xyzx * c0.zzzw) + c0.wwwz;
	r2.x = dot(r1, c24);
	r2.y = dot(r1, c25);
	r0.y = dot(r1, c27);
	r0.w = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r1.xy = r0.ww * r2.xy;
	r1 = s7_texture.sample(s7, r1.xy);
	r1.xyz = r1.xyz * c28.xyz;
	r1.xyz = r0.xxx * r1.xyz;
	r0.w = c22.w;
	r0.x = r0.w * c2.x;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = clamp(r0.x * r0.z, 0.0, 1.0);
	r0.xzw = r0.xxx * r1.xyz;
	r1 = s13_texture.sample(s13, v0.xy);
	r1.x = clamp(r1.y + c12.x, 0.0, 1.0);
	r1.y = c0.y;
	r1.yzw = r1.yyy + c1.xyz;
	r1.xyz = (r1.xxx * r1.yzw) + c0.zzz;
	r0.xzw = r0.xzw * r1.xyz;
	r1 = s0_texture.sample(s0, v0.xy);
	r0.xzw = r0.xzw * r1.xyz;
	r1 = s12_texture.sample(s12, v0.zw);
	r1.xyz = r1.xyz * c3.www;
	r0.xzw = r0.xzw * r1.xyz;
	r0.xzw = r0.xzw * c30.xxx;
	oC0.xyz = ((-r0.y >= 0.0) ? c0.www : r0.xzw);
	r0.x = c21.y + -v4.z;
	r0.x = r0.x + -c0.x;
	r0.x = clamp(r0.x * c21.w, 0.0, 1.0);
	r0.y = abs(c12.y);
	r0.z = c29.w * v4.w;
	oC0.w = ((-r0.y >= 0.0) ? r0.x : r0.z);
	#undef c1
	#undef c3
	#undef c12
	#undef c21
	#undef c22
	#undef c23
	#undef c24
	#undef c25
	#undef c27
	#undef c28
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

