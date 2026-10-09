#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[16];
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
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c3 = float4(-1.0, 1.0, -0.400000005, 0.0); (void) c3;
	const float4 c4 = float4(0.001953125, 0.0, 1.0, -0.001953125); (void) c4;
	const float4 c5 = float4(0.003021148, 0.021148037, 0.012084592, 0.06042296); (void) c5;
	const float4 c7 = float4(-0.000976562, 0.001953125, 0.0, 1.0); (void) c7;
	const float4 c8 = float4(0.001953125, 0.000976562, 0.0, 1.0); (void) c8;
	const float4 c9 = float4(0.099697888, 0.166163144, 1.399999979, 25.0); (void) c9;
	const float4 c10 = float4(-2.0, 3.0, 0.0008, -0.080000001); (void) c10;
	const float4 c11 = float4(-0.001953125, 0.000976562, 0.0, 1.0); (void) c11;
	const float4 c13 = float4(-0.001953125, -0.000976562, 0.0, 1.0); (void) c13;
	const float4 c14 = float4(-0.000976562, 0.000976562, 0.0, 1.0); (void) c14;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c2 uniforms.uniforms_float4[2]
	#define c6 uniforms.uniforms_float4[3]
	#define c12 uniforms.uniforms_float4[4]
	#define c20 uniforms.uniforms_float4[5]
	#define c21 uniforms.uniforms_float4[6]
	#define c22 uniforms.uniforms_float4[7]
	#define c23 uniforms.uniforms_float4[8]
	#define c28 uniforms.uniforms_float4[9]
	#define c29 uniforms.uniforms_float4[10]
	#define c30 uniforms.uniforms_float4[11]
	#define c43 uniforms.uniforms_float4[12]
	#define c44 uniforms.uniforms_float4[13]
	#define c45 uniforms.uniforms_float4[14]
	#define c46 uniforms.uniforms_float4[15]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define oC0 output.oC0
	r0.xyz = -c6.xyz + v2.xyz;
	r0.x = dot(r0.xyz, r0.xyz);
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = (r0.x * c10.z) + c10.w;
	r0.x = clamp(r0.x * c9.w, 0.0, 1.0);
	r0.y = (r0.x * c10.x) + c10.y;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r0.y;
	r1 = s0_texture.sample(s0, v0.xy);
	r0.y = r1.w + c3.x;
	r2.yz = c3.yz;
	r0.y = (c20.w * r0.y) + r2.y;
	r0.y = r0.y * c1.w;
	r0.z = (r0.y * v4.w) + -r0.y;
	r0.y = (c12.w * r0.z) + r0.y;
	r0.x = r0.x * r0.y;
	r0.y = abs(c12.y);
	r0.z = c29.w * v5.z;
	oC0.w = ((-r0.y >= 0.0) ? r0.x : r0.z);
	r0.x = ((v6.w == 0.0) ? FLT_MAX : 1.0 / v6.w);
	r0.xyz = r0.xxx * v6.xyz;
	r3 = r0.xyzx * c3.yyyw;
	r4 = r3 + c4.xxyz;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c4.wxyz;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c4.xwyz;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c4.wwyz;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r2.x = dot(r4, c5.xxxx);
	r4 = r3 + c4.xyyz;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c4.wyyz;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c4.yxyz;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c4.ywyz;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r2.y = dot(r4, c5.yyyy);
	r2.x = r2.y + r2.x;
	r4 = r3 + c8;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c8.yxzw;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c7;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c11;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r2.y = dot(r4, c5.zzzz);
	r2.x = r2.y + r2.x;
	r4 = r3 + c13;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c13.yxzw;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c11.yxzw;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c7.yxzw;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r2.y = dot(r4, c5.zzzz);
	r2.x = r2.y + r2.x;
	r4 = r3 + c8.yyzw;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c14;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c14.yxzw;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c7.xxzw;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r2.y = dot(r4, c5.wwww);
	r2.x = r2.y + r2.x;
	r4 = r3 + c8.yzzw;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c7.xzzw;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c7.zxzw;
	r3 = r3 + c8.zyzw;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z));
	r4.w = r3.x;
	r3 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r3.x;
	r2.y = dot(r4, c9.xxxx);
	r2.x = r2.y + r2.x;
	r0.w = c3.y;
	r3 = float4(s8_texture.sample_compare(s8, (r0.xyz).xy, (r0.xyz).z));
	r0 = s7_texture.sample(s7, r0.xy);
	r0.xyz = r0.xyz * c28.xyz;
	r0.w = (r3.x * c9.y) + r2.x;
	r2.x = pow(abs(r0.w), c9.z);
	r0.w = clamp(r2.x, 0.0, 1.0);
	r2.y = -r0.w + c3.y;
	r0.w = (c2.y * r2.y) + r0.w;
	r3.x = c3.y;
	r4.xyz = c23.xyz + -v2.xyz;
	r2.y = dot(r4.xyz, r4.xyz);
	r3.z = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r3.y = ((r2.y == 0.0) ? FLT_MAX : rsqrt(abs(r2.y)));
	r2.y = clamp(dot(c22.xyz, r3.xyz), 0.0, 1.0);
	r3.x = clamp(mix(r0.w, r2.x, r2.y), 0.0, 1.0);
	r0.xyz = r0.xyz * r3.xxx;
	r3.xzw = r3.yyy * r4.xyz;
	r0.w = ((r3.y == 0.0) ? FLT_MAX : 1.0 / r3.y);
	r0.w = r0.w + -c22.w;
	r2.x = dot(r3.xzw, v1.xyz);
	r2.x = clamp(r2.x + c28.w, 0.0, 1.0);
	r2.x = r2.x * r2.y;
	r0.xyz = r0.xyz * r2.xxx;
	r2.x = r2.z * c22.w;
	r2.x = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r0.w = clamp(r0.w * r2.x, 0.0, 1.0);
	r0.xyz = r0.www * r0.xyz;
	r0.xyz = ((-v6.w >= 0.0) ? c3.www : r0.xyz);
	r2.xyz = v4.xyz;
	r2.xyz = r2.xyz + v3.xyz;
	r0.xyz = (r2.xyz * c0.www) + r0.xyz;
	r0.w = clamp(v0.y, 0.0, 1.0);
	r2.xy = r0.ww + -c46.yz;
	r2.zw = -c46.yz + c46.zw;
	r0.w = ((r2.z == 0.0) ? FLT_MAX : 1.0 / r2.z);
	r2.z = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r2.y = clamp(r2.z * r2.y, 0.0, 1.0);
	r0.w = clamp(r0.w * r2.x, 0.0, 1.0);
	r2.x = (r0.w * c10.x) + c10.y;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r2.x;
	r3.xyz = c43.xyz;
	r2.xzw = -r3.xyz + c44.xyz;
	r2.xzw = (r0.www * r2.xzw) + c43.xyz;
	r0.w = (r2.y * c10.x) + c10.y;
	r2.y = r2.y * r2.y;
	r0.w = r0.w * r2.y;
	r0.w = r0.w * r0.w;
	r3.xyz = mix(r2.xzw, c45.xyz, r0.www);
	r2.xyz = r3.xyz * c1.xyz;
	r3.x = c46.x;
	r2.xyz = ((-r3.x >= 0.0) ? c1.xyz : r2.xyz);
	r2.xyz = r2.xyz + c3.xxx;
	r0.w = clamp(r1.w + c12.x, 0.0, 1.0);
	r2.xyz = (r0.www * r2.xyz) + c3.yyy;
	r0.xyz = r0.xyz * r2.xyz;
	r0.xyz = r0.xyz * r1.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	r2.xyz = c20.xyz + -v2.xyz;
	r0.w = dot(r2.xyz, r2.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = clamp((r0.w * c21.w) + c21.x, 0.0, 1.0);
	r1.w = min(r0.w, c21.z);
	r0.w = r1.w * r1.w;
	oC0.xyz = (r0.www * r0.xyz) + r1.xyz;
	#undef c0
	#undef c1
	#undef c2
	#undef c6
	#undef c12
	#undef c20
	#undef c21
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

