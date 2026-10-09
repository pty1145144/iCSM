#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[15];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord1)]];
	float4 v2 [[user(texcoord2)]];
	float4 v3 [[user(texcoord3)]];
	float4 v4 [[user(texcoord4)]];
	float4 v5 [[user(texcoord6)]];
	float4 v6 [[user(texcoord7)]];
	float4 v7 [[user(texcoord8)]];
};

struct source_main_Output
{
	float4 oC0 [[color(0)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	texture2d<float> s0_texture [[texture(0)]],
	sampler s0 [[sampler(0)]],
	texture2d<float> s2_texture [[texture(2)]],
	sampler s2 [[sampler(2)]],
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
	texture2d<float> s7_texture [[texture(7)]],
	sampler s7 [[sampler(7)]],
	depth2d<float> s8_texture [[texture(8)]],
	sampler s8 [[sampler(8)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(0.81649661, 0.577350258, 0.0, -0.400000005); (void) c0;
	const float4 c3 = float4(-0.408248334, 0.707106768, 0.577350258, 0.003021148); (void) c3;
	const float4 c5 = float4(-0.408248215, -0.707106828, 0.577350258, 0.021148037); (void) c5;
	const float4 c6 = float4(0.001953125, 0.0, 1.0, -0.001953125); (void) c6;
	const float4 c7 = float4(-0.000976562, 0.001953125, 0.0, 1.0); (void) c7;
	const float4 c8 = float4(0.012084592, 0.06042296, 0.099697888, 0.166163144); (void) c8;
	const float4 c9 = float4(0.001953125, 0.000976562, 0.0, 1.0); (void) c9;
	const float4 c10 = float4(2.0, -1.0, 1.0, 0.0); (void) c10;
	const float4 c11 = float4(1.399999979, 0.0, 0.0, 0.0); (void) c11;
	const float4 c13 = float4(-0.001953125, 0.000976562, 0.0, 1.0); (void) c13;
	const float4 c14 = float4(-0.001953125, -0.000976562, 0.0, 1.0); (void) c14;
	const float4 c15 = float4(-0.000976562, 0.000976562, 0.0, 1.0); (void) c15;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	#define c1 uniforms.uniforms_float4[0]
	#define c2 uniforms.uniforms_float4[1]
	#define c4 uniforms.uniforms_float4[2]
	#define c12 uniforms.uniforms_float4[3]
	#define c20 uniforms.uniforms_float4[4]
	#define c21 uniforms.uniforms_float4[5]
	#define c22 uniforms.uniforms_float4[6]
	#define c23 uniforms.uniforms_float4[7]
	#define c24 uniforms.uniforms_float4[8]
	#define c25 uniforms.uniforms_float4[9]
	#define c26 uniforms.uniforms_float4[10]
	#define c27 uniforms.uniforms_float4[11]
	#define c28 uniforms.uniforms_float4[12]
	#define c29 uniforms.uniforms_float4[13]
	#define c30 uniforms.uniforms_float4[14]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define v7 input.v7
	#define oC0 output.oC0
	r0.x = abs(c12.y);
	r0.y = c29.w * v4.w;
	r1 = s0_texture.sample(s0, v0.xy);
	r0.z = r1.w + c10.y;
	r2.yz = c10.yz;
	r0.z = (c20.w * r0.z) + r2.z;
	r0.z = r0.z * c1.w;
	oC0.w = ((-r0.x >= 0.0) ? r0.z : r0.y);
	r0 = (v4.xyzx * c10.zzzw) + c10.wwwz;
	r2.x = dot(r0, c27);
	r2.w = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r3.x = dot(r0, c24);
	r3.y = dot(r0, c25);
	r3.z = dot(r0, c26);
	r0.xyz = r2.www * r3.xyz;
	r3 = r0.xyzx * c10.zzzw;
	r4 = r3 + c6.xxyz;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c6.wxyz;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c6.xwyz;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c6.wwyz;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r2.w = dot(r4, c3.wwww);
	r4 = r3 + c6.xyyz;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c6.wyyz;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c6.yxyz;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c6.ywyz;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r4.x = dot(r4, c5.wwww);
	r2.w = r2.w + r4.x;
	r4 = r3 + c9;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c9.yxzw;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c7;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c13;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r4.x = dot(r4, c8.xxxx);
	r2.w = r2.w + r4.x;
	r4 = r3 + c14;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c14.yxzw;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c13.yxzw;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c7.yxzw;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r4.x = dot(r4, c8.xxxx);
	r2.w = r2.w + r4.x;
	r4 = r3 + c9.yyzw;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c15;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c15.yxzw;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c7.xxzw;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r4.x = dot(r4, c8.yyyy);
	r2.w = r2.w + r4.x;
	r4 = r3 + c9.yzzw;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c7.xzzw;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c7.zxzw;
	r3 = r3 + c9.zyzw;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z));
	r4.w = r3.x;
	r3 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r3.x;
	r3.x = dot(r4, c8.zzzz);
	r2.w = r2.w + r3.x;
	r0.w = c10.z;
	r3 = float4(s8_texture.sample_compare(s8, (r0.xyz).xy, (r0.xyz).z));
	r0 = s7_texture.sample(s7, r0.xy);
	r0.xyz = r0.xyz * c28.xyz;
	r0.w = (r3.x * c8.w) + r2.w;
	r2.w = pow(abs(r0.w), c11.x);
	r0.w = clamp(r2.w, 0.0, 1.0);
	r3.x = -r0.w + c10.z;
	r0.w = (c2.y * r3.x) + r0.w;
	r3.x = c10.z;
	r4.xyz = c23.xyz + -v4.xyz;
	r3.w = dot(r4.xyz, r4.xyz);
	r3.z = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r3.y = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r3.x = clamp(dot(c22.xyz, r3.xyz), 0.0, 1.0);
	r4.w = clamp(mix(r0.w, r2.w, r3.x), 0.0, 1.0);
	r0.xyz = r0.xyz * r4.www;
	r4.xyz = r3.yyy * r4.xyz;
	r0.w = ((r3.y == 0.0) ? FLT_MAX : 1.0 / r3.y);
	r0.w = r0.w + -c22.w;
	r5.xyz = v3.xyz;
	r3.yzw = r5.yzx * v2.zxy;
	r3.yzw = (v2.yzx * r5.zxy) + -r3.yzw;
	r3.yzw = r3.yzw * v3.www;
	r5 = s3_texture.sample(s3, v1.xy);
	r5.xyz = (r5.xyz * c10.xxx) + c10.yyy;
	r3.yzw = r3.yzw * r5.yyy;
	r3.yzw = (r5.xxx * v3.xyz) + r3.yzw;
	r3.yzw = (r5.zzz * v2.xyz) + r3.yzw;
	r6.xyz = normalize(r3.yzw);
	r2.w = dot(r4.xyz, r6.xyz);
	r2.w = clamp(r2.w + c28.w, 0.0, 1.0);
	r2.w = r2.w * r3.x;
	r0.xyz = r0.xyz * r2.www;
	r2.w = c22.w;
	r2.w = r2.w * c0.w;
	r2.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r0.w = clamp(r0.w * r2.w, 0.0, 1.0);
	r0.xyz = r0.www * r0.xyz;
	r0.xyz = ((-r2.x >= 0.0) ? c10.www : r0.xyz);
	r3.x = clamp(dot(r5.xz, c0.xy) + c0.z, 0.0, 1.0);
	r3.y = clamp(dot(r5.xyz, c3.xyz), 0.0, 1.0);
	r3.z = clamp(dot(r5.xyz, c5.xyz), 0.0, 1.0);
	r3.xyz = r3.xyz * r3.xyz;
	r4.xyz = r3.yyy * v6.xyz;
	r4.xyz = (r3.xxx * v5.xyz) + r4.xyz;
	r4.xyz = (r3.zzz * v7.xyz) + r4.xyz;
	r0.w = dot(r3.xyz, c10.zzz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.xyz = (r4.xyz * r0.www) + r0.xyz;
	r0.w = clamp(r1.w + c12.x, 0.0, 1.0);
	r2.xyw = r2.yyy + c1.xyz;
	r2.xyw = (r0.www * r2.xyw) + c10.zzz;
	r0.xyz = r0.xyz * r2.xyw;
	r3 = s2_texture.sample(s2, v1.zw);
	r2.xyw = (r3.xyz * c10.xxx) + c10.yyy;
	r2.xyz = (c4.www * r2.xyw) + r2.zzz;
	r1.xyz = r1.xyz * r2.xyz;
	r0.xyz = r0.xyz * r1.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	r2.xyz = c20.xyz + -v4.xyz;
	r0.w = dot(r2.xyz, r2.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = clamp((r0.w * c21.w) + c21.x, 0.0, 1.0);
	r1.w = min(r0.w, c21.z);
	r0.w = r1.w * r1.w;
	oC0.xyz = (r0.www * r0.xyz) + r1.xyz;
	#undef c1
	#undef c2
	#undef c4
	#undef c12
	#undef c20
	#undef c21
	#undef c22
	#undef c23
	#undef c24
	#undef c25
	#undef c26
	#undef c27
	#undef c28
	#undef c29
	#undef c30
	#undef v0
	#undef v1
	#undef v2
	#undef v3
	#undef v4
	#undef v5
	#undef v6
	#undef v7
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

