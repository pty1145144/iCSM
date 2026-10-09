#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[14];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord2)]];
	float4 v2 [[user(texcoord3)]];
	float4 v3 [[user(texcoord4)]];
	float4 v4 [[user(texcoord6)]];
	float4 v5 [[user(texcoord7)]];
	float4 v6 [[user(texcoord8)]];
};

struct source_main_Output
{
	float4 oC0 [[color(0)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	texture2d<float> s0_texture [[texture(0)]],
	sampler s0 [[sampler(0)]],
	texture2d<float> s7_texture [[texture(7)]],
	sampler s7 [[sampler(7)]],
	depth2d<float> s8_texture [[texture(8)]],
	sampler s8 [[sampler(8)]],
	texture2d<float> s13_texture [[texture(13)]],
	sampler s13 [[sampler(13)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c3 = float4(0.003021148, 0.021148037, 0.012084592, 0.06042296); (void) c3;
	const float4 c4 = float4(0.001953125, 0.0, 1.0, -0.001953125); (void) c4;
	const float4 c5 = float4(0.001953125, 0.000976562, 0.0, 1.0); (void) c5;
	const float4 c6 = float4(-0.000976562, 0.001953125, 0.0, 1.0); (void) c6;
	const float4 c7 = float4(0.099697888, 0.166163144, 1.399999979, 0.0); (void) c7;
	const float4 c8 = float4(-2.0, 3.0, 0.0, 0.0); (void) c8;
	const float4 c9 = float4(-1.0, 1.0, -0.400000005, 0.0); (void) c9;
	const float4 c10 = float4(-0.001953125, 0.000976562, 0.0, 1.0); (void) c10;
	const float4 c11 = float4(-0.001953125, -0.000976562, 0.0, 1.0); (void) c11;
	const float4 c13 = float4(-0.000976562, 0.000976562, 0.0, 1.0); (void) c13;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c2 uniforms.uniforms_float4[2]
	#define c12 uniforms.uniforms_float4[3]
	#define c20 uniforms.uniforms_float4[4]
	#define c22 uniforms.uniforms_float4[5]
	#define c23 uniforms.uniforms_float4[6]
	#define c28 uniforms.uniforms_float4[7]
	#define c29 uniforms.uniforms_float4[8]
	#define c30 uniforms.uniforms_float4[9]
	#define c43 uniforms.uniforms_float4[10]
	#define c44 uniforms.uniforms_float4[11]
	#define c45 uniforms.uniforms_float4[12]
	#define c46 uniforms.uniforms_float4[13]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define oC0 output.oC0
	r0.x = ((v6.w == 0.0) ? FLT_MAX : 1.0 / v6.w);
	r0.xyz = r0.xxx * v6.xyz;
	r1 = r0.xyzx * c9.yyyw;
	r2 = r1 + c4.xxyz;
	r2 = float4(s8_texture.sample_compare(s8, (r2.xyz).xy, (r2.xyz).z));
	r3 = r1 + c4.wxyz;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z));
	r2.y = r3.x;
	r3 = r1 + c4.xwyz;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z));
	r2.z = r3.x;
	r3 = r1 + c4.wwyz;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z));
	r2.w = r3.x;
	r2.x = dot(r2, c3.xxxx);
	r3 = r1 + c4.xyyz;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z));
	r4 = r1 + c4.wyyz;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r1 + c4.yxyz;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r1 + c4.ywyz;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r2.y = dot(r3, c3.yyyy);
	r2.x = r2.y + r2.x;
	r3 = r1 + c5;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z));
	r4 = r1 + c5.yxzw;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r1 + c6;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r1 + c10;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r2.y = dot(r3, c3.zzzz);
	r2.x = r2.y + r2.x;
	r3 = r1 + c11;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z));
	r4 = r1 + c11.yxzw;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r1 + c10.yxzw;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r1 + c6.yxzw;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r2.y = dot(r3, c3.zzzz);
	r2.x = r2.y + r2.x;
	r3 = r1 + c5.yyzw;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z));
	r4 = r1 + c13;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r1 + c13.yxzw;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r1 + c6.xxzw;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r2.y = dot(r3, c3.wwww);
	r2.x = r2.y + r2.x;
	r3 = r1 + c5.yzzw;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z));
	r4 = r1 + c6.xzzw;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r1 + c6.zxzw;
	r1 = r1 + c5.zyzw;
	r1 = float4(s8_texture.sample_compare(s8, (r1.xyz).xy, (r1.xyz).z));
	r3.w = r1.x;
	r1 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r1.x;
	r1.x = dot(r3, c7.xxxx);
	r1.x = r1.x + r2.x;
	r0.w = c9.y;
	r2 = float4(s8_texture.sample_compare(s8, (r0.xyz).xy, (r0.xyz).z));
	r0 = s7_texture.sample(s7, r0.xy);
	r0.xyz = r0.xyz * c28.xyz;
	r0.w = (r2.x * c7.y) + r1.x;
	r1.x = pow(abs(r0.w), c7.z);
	r0.w = clamp(r1.x, 0.0, 1.0);
	r1.y = -r0.w + c9.y;
	r0.w = (c2.y * r1.y) + r0.w;
	r2.x = c9.y;
	r1.yzw = c23.xyz + -v2.xyz;
	r2.w = dot(r1.yzw, r1.yzw);
	r2.z = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r2.y = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r2.x = clamp(dot(c22.xyz, r2.xyz), 0.0, 1.0);
	r3.x = clamp(mix(r0.w, r1.x, r2.x), 0.0, 1.0);
	r0.xyz = r0.xyz * r3.xxx;
	r1.xyz = r1.yzw * r2.yyy;
	r0.w = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r0.w = r0.w + -c22.w;
	r1.x = dot(r1.xyz, v1.xyz);
	r1.x = clamp(r1.x + c28.w, 0.0, 1.0);
	r1.x = r1.x * r2.x;
	r0.xyz = r0.xyz * r1.xxx;
	r1.yz = c9.yz;
	r1.x = r1.z * c22.w;
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r0.w = clamp(r0.w * r1.x, 0.0, 1.0);
	r0.xyz = r0.www * r0.xyz;
	r0.xyz = ((-v6.w >= 0.0) ? c9.www : r0.xyz);
	r2.xyz = v4.xyz;
	r1.xzw = r2.xyz + v3.xyz;
	r0.xyz = (r1.xzw * c0.www) + r0.xyz;
	r0.w = clamp(v0.y, 0.0, 1.0);
	r1.xz = r0.ww + -c46.yz;
	r2.xy = -c46.yz + c46.zw;
	r0.w = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r1.w = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r1.z = clamp(r1.w * r1.z, 0.0, 1.0);
	r0.w = clamp(r0.w * r1.x, 0.0, 1.0);
	r1.x = (r0.w * c8.x) + c8.y;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.x;
	r2.xyz = c43.xyz;
	r2.xyz = -r2.xyz + c44.xyz;
	r2.xyz = (r0.www * r2.xyz) + c43.xyz;
	r0.w = (r1.z * c8.x) + c8.y;
	r1.x = r1.z * r1.z;
	r0.w = r0.w * r1.x;
	r0.w = r0.w * r0.w;
	r1.xzw = mix(r2.xyz, c45.xyz, r0.www);
	r1.xzw = r1.xzw * c1.xyz;
	r2.x = c46.x;
	r1.xzw = ((-r2.x >= 0.0) ? c1.xyz : r1.xzw);
	r1.xzw = r1.xzw + c9.xxx;
	r2 = s13_texture.sample(s13, v0.xy);
	r0.w = clamp(r2.y + c12.x, 0.0, 1.0);
	r1.xzw = (r0.www * r1.xzw) + c9.yyy;
	r0.xyz = r0.xyz * r1.xzw;
	r2 = s0_texture.sample(s0, v0.xy);
	r0.xyz = r0.xyz * r2.xyz;
	r0.w = r2.w + c9.x;
	r0.w = (c20.w * r0.w) + r1.y;
	r0.w = r0.w * c1.w;
	oC0.xyz = r0.xyz * c30.xxx;
	r0.x = (r0.w * v4.w) + -r0.w;
	r0.x = (c12.w * r0.x) + r0.w;
	r0.y = abs(c12.y);
	r0.z = c29.w * v5.z;
	oC0.w = ((-r0.y >= 0.0) ? r0.x : r0.z);
	#undef c0
	#undef c1
	#undef c2
	#undef c12
	#undef c20
	#undef c22
	#undef c23
	#undef c28
	#undef c29
	#undef c30
	#undef c43
	#undef c44
	#undef c45
	#undef c46
	#undef v0
	#undef v1
	#undef v2
	#undef v3
	#undef v4
	#undef v5
	#undef v6
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

