#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[17];
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
	texture2d<float> s7_texture [[texture(7)]],
	sampler s7 [[sampler(7)]],
	depth2d<float> s8_texture [[texture(8)]],
	sampler s8 [[sampler(8)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c3 = float4(2.0, -1.0, 1.0, -0.400000005); (void) c3;
	const float4 c5 = float4(1.0, 0.0, 0.001953125, -0.001953125); (void) c5;
	const float4 c6 = float4(0.003021148, 0.021148037, 0.012084592, 0.06042296); (void) c6;
	const float4 c7 = float4(-0.000976562, 0.001953125, 0.0, 1.0); (void) c7;
	const float4 c8 = float4(0.001953125, 0.000976562, 0.0, 1.0); (void) c8;
	const float4 c9 = float4(0.099697888, 0.166163144, 1.399999979, 0.0); (void) c9;
	const float4 c11 = float4(-2.0, 3.0, 0.0, 0.0); (void) c11;
	const float4 c13 = float4(-0.001953125, 0.000976562, 0.0, 1.0); (void) c13;
	const float4 c14 = float4(-0.001953125, -0.000976562, 0.0, 1.0); (void) c14;
	const float4 c15 = float4(-0.000976562, 0.000976562, 0.0, 1.0); (void) c15;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c2 uniforms.uniforms_float4[2]
	#define c4 uniforms.uniforms_float4[3]
	#define c10 uniforms.uniforms_float4[4]
	#define c12 uniforms.uniforms_float4[5]
	#define c20 uniforms.uniforms_float4[6]
	#define c21 uniforms.uniforms_float4[7]
	#define c22 uniforms.uniforms_float4[8]
	#define c23 uniforms.uniforms_float4[9]
	#define c28 uniforms.uniforms_float4[10]
	#define c29 uniforms.uniforms_float4[11]
	#define c30 uniforms.uniforms_float4[12]
	#define c43 uniforms.uniforms_float4[13]
	#define c44 uniforms.uniforms_float4[14]
	#define c45 uniforms.uniforms_float4[15]
	#define c46 uniforms.uniforms_float4[16]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define v7 input.v7
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	r1.x = r0.w + c3.y;
	r1.zw = c3.zw;
	r1.x = (c20.w * r1.x) + r1.z;
	r1.x = r1.x * c1.w;
	r1.y = (r1.x * v5.w) + -r1.x;
	r1.x = (c12.w * r1.y) + r1.x;
	r1.y = abs(c12.y);
	r2.x = c29.w * v6.z;
	oC0.w = ((-r1.y >= 0.0) ? r1.x : r2.x);
	r1.x = ((v7.w == 0.0) ? FLT_MAX : 1.0 / v7.w);
	r2.xyz = r1.xxx * v7.xyz;
	r3 = r2.xyzx * c5.xxxy;
	r4 = r3 + c5.zzyx;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c5.wzyx;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c5.zwyx;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c5.wwyx;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r1.x = dot(r4, c6.xxxx);
	r4 = r3 + c5.zyyx;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c5.wyyx;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c5.yzyx;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c5.ywyx;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r1.y = dot(r4, c6.yyyy);
	r1.x = r1.y + r1.x;
	r4 = r3 + c8;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c8.yxzw;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c7;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c13;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r1.y = dot(r4, c6.zzzz);
	r1.x = r1.y + r1.x;
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
	r1.y = dot(r4, c6.zzzz);
	r1.x = r1.y + r1.x;
	r4 = r3 + c8.yyzw;
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
	r1.y = dot(r4, c6.wwww);
	r1.x = r1.y + r1.x;
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
	r1.y = dot(r4, c9.xxxx);
	r1.x = r1.y + r1.x;
	r2.w = c3.z;
	r3 = float4(s8_texture.sample_compare(s8, (r2.xyz).xy, (r2.xyz).z));
	r2 = s7_texture.sample(s7, r2.xy);
	r2.xyz = r2.xyz * c28.xyz;
	r1.x = (r3.x * c9.y) + r1.x;
	r2.w = pow(abs(r1.x), c9.z);
	r1.x = clamp(r2.w, 0.0, 1.0);
	r1.y = -r1.x + c3.z;
	r1.x = (c2.y * r1.y) + r1.x;
	r3.x = c3.z;
	r4.xyz = c23.xyz + -v3.xyz;
	r1.y = dot(r4.xyz, r4.xyz);
	r3.z = ((r1.y == 0.0) ? FLT_MAX : 1.0 / r1.y);
	r3.y = ((r1.y == 0.0) ? FLT_MAX : rsqrt(abs(r1.y)));
	r1.y = clamp(dot(c22.xyz, r3.xyz), 0.0, 1.0);
	r3.x = clamp(mix(r1.x, r2.w, r1.y), 0.0, 1.0);
	r2.xyz = r2.xyz * r3.xxx;
	r3.xzw = r3.yyy * r4.xyz;
	r1.x = ((r3.y == 0.0) ? FLT_MAX : 1.0 / r3.y);
	r1.x = r1.x + -c22.w;
	r2.w = dot(r3.xzw, v2.xyz);
	r2.w = clamp(r2.w + c28.w, 0.0, 1.0);
	r1.y = r1.y * r2.w;
	r2.xyz = r2.xyz * r1.yyy;
	r1.y = r1.w * c22.w;
	r1.y = ((r1.y == 0.0) ? FLT_MAX : 1.0 / r1.y);
	r1.x = clamp(r1.y * r1.x, 0.0, 1.0);
	r1.xyw = r1.xxx * r2.xyz;
	r1.xyw = ((-v7.w >= 0.0) ? c5.yyy : r1.xyw);
	r2.xyz = v5.xyz;
	r2.xyz = r2.xyz + v4.xyz;
	r1.xyw = (r2.xyz * c0.www) + r1.xyw;
	r2.x = clamp(v0.y, 0.0, 1.0);
	r2.xy = r2.xx + -c46.yz;
	r2.zw = -c46.yz + c46.zw;
	r2.z = ((r2.z == 0.0) ? FLT_MAX : 1.0 / r2.z);
	r2.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r2.xy = clamp(r2.zw * r2.xy, float2(0.0), float2(1.0));
	r2.z = (r2.x * c11.x) + c11.y;
	r2.x = r2.x * r2.x;
	r2.x = r2.x * r2.z;
	r3.xyz = c43.xyz;
	r3.xyz = -r3.xyz + c44.xyz;
	r2.xzw = (r2.xxx * r3.xyz) + c43.xyz;
	r3.x = (r2.y * c11.x) + c11.y;
	r2.y = r2.y * r2.y;
	r2.y = r2.y * r3.x;
	r2.y = r2.y * r2.y;
	r3.xyz = mix(r2.xzw, c45.xyz, r2.yyy);
	r2.xyz = r3.xyz * c1.xyz;
	r3.x = c46.x;
	r2.xyz = ((-r3.x >= 0.0) ? c1.xyz : r2.xyz);
	r2.xyz = r2.xyz + c3.yyy;
	r0.w = clamp(r0.w + c12.x, 0.0, 1.0);
	r2.xyz = (r0.www * r2.xyz) + c3.zzz;
	r1.xyw = r1.xyw * r2.xyz;
	r2 = s2_texture.sample(s2, v1.xy);
	r2.xyz = r2.xyz * c10.xyz;
	r2.xyz = (r2.xyz * c3.xxx) + c3.yyy;
	r2.xyz = (c4.www * r2.xyz) + r1.zzz;
	r0.xyz = r0.xyz * r2.xyz;
	r0.xyz = r1.xyw * r0.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	r2.xyz = c20.xyz + -v3.xyz;
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
	#undef c4
	#undef c10
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
	#undef v7
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

