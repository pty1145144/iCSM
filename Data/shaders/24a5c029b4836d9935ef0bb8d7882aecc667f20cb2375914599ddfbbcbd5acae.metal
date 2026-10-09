#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[32];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord1)]];
	float4 v2 [[user(texcoord2)]];
	float4 v3 [[user(texcoord3)]];
	float4 v4 [[user(texcoord4)]];
	float4 v5 [[user(texcoord5)]];
	float4 v6 [[user(texcoord6)]];
};

struct source_main_Output
{
	float4 oC0 [[color(0)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	texture2d<float> s0_texture [[texture(0)]],
	sampler s0 [[sampler(0)]],
	texture2d<float> s1_texture [[texture(1)]],
	sampler s1 [[sampler(1)]],
	texture2d<float> s7_texture [[texture(7)]],
	sampler s7 [[sampler(7)]],
	texture2d<float> s8_texture [[texture(8)]],
	sampler s8 [[sampler(8)]],
	texture2d<float> s10_texture [[texture(10)]],
	sampler s10 [[sampler(10)]],
	depth2d<float> s11_texture [[texture(11)]],
	sampler s11 [[sampler(11)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(0.159154935, 0.5, 6.283185478, -3.141592739); (void) c0;
	const float4 c2 = float4(0.57735002, 1.0, 2.0, -1.0); (void) c2;
	const float4 c26 = float4(0.0, 1.0, -0.400000005, 0.001953125); (void) c26;
	const float4 c27 = float4(-0.001953125, 0.001953125, 0.0, 1.0); (void) c27;
	const float4 c29 = float4(0.003021148, 0.021148037, 0.012084592, 0.06042296); (void) c29;
	const float4 c31 = float4(0.001953125, 0.000976562, 0.0, 1.0); (void) c31;
	const float4 c32 = float4(-0.000976562, 0.001953125, 0.0, 1.0); (void) c32;
	const float4 c33 = float4(0.099697888, 0.166163144, 1.399999979, -0.300000011); (void) c33;
	const float4 c34 = float4(0.298999992, 0.587000012, 0.114, -3.333333253); (void) c34;
	const float4 c35 = float4(-2.0, 3.0, -0.000001, 1000000.0); (void) c35;
	const float4 c36 = float4(-0.001953125, 0.000976562, 0.0, 1.0); (void) c36;
	const float4 c37 = float4(-0.001953125, -0.000976562, 0.0, 1.0); (void) c37;
	const float4 c38 = float4(-0.000976562, 0.000976562, 0.0, 1.0); (void) c38;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	float4 r7;
	float4 r8;
	float4 r9;
	float4 r10;
	float4 r11;
	float4 r12;
	float4 r13;
	float4 r14;
	float4 r15;
	float4 r16;
	#define c1 uniforms.uniforms_float4[0]
	#define c3 uniforms.uniforms_float4[1]
	#define c4 uniforms.uniforms_float4[2]
	#define c5 uniforms.uniforms_float4[3]
	#define c6 uniforms.uniforms_float4[4]
	#define c7 uniforms.uniforms_float4[5]
	#define c8 uniforms.uniforms_float4[6]
	#define c9 uniforms.uniforms_float4[7]
	#define c10 uniforms.uniforms_float4[8]
	#define c11 uniforms.uniforms_float4[9]
	#define c12 uniforms.uniforms_float4[10]
	#define c13 uniforms.uniforms_float4[11]
	#define c14 uniforms.uniforms_float4[12]
	#define c15 uniforms.uniforms_float4[13]
	#define c16 uniforms.uniforms_float4[14]
	#define c17 uniforms.uniforms_float4[15]
	#define c18 uniforms.uniforms_float4[16]
	#define c19 uniforms.uniforms_float4[17]
	#define c20 uniforms.uniforms_float4[18]
	#define c21 uniforms.uniforms_float4[19]
	#define c22 uniforms.uniforms_float4[20]
	#define c23 uniforms.uniforms_float4[21]
	#define c24 uniforms.uniforms_float4[22]
	#define c25 uniforms.uniforms_float4[23]
	#define c28 uniforms.uniforms_float4[24]
	#define c30 uniforms.uniforms_float4[25]
	#define c101 uniforms.uniforms_float4[26]
	#define c102 uniforms.uniforms_float4[27]
	#define c105 uniforms.uniforms_float4[28]
	#define c106 uniforms.uniforms_float4[29]
	#define c107 uniforms.uniforms_float4[30]
	#define c109 uniforms.uniforms_float4[31]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define oC0 output.oC0
	r0.x = c19.y + -v5.z;
	r0.x = r0.x + -c2.z;
	oC0.w = clamp(r0.x * c19.w, 0.0, 1.0);
	r0.xyz = c34.xyz;
	r0.x = dot(c102.xyz, r0.xyz);
	r0.y = r0.x + c35.z;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = ((r0.y >= 0.0) ? r0.x : c35.w);
	r1.xy = c0.xy;
	r0.y = (c12.w * r1.x) + r1.y;
	r0.y = fract(r0.y);
	r0.y = (r0.y * c0.z) + c0.w;
	r1.xy = float2(cos(r0.y), sin(r0.y));
	r2 = s0_texture.sample(s0, v0.xy);
	r0.yzw = r2.zxy * c2.xxx;
	r0.yzw = (r2.zxy * c2.xxx) + -r0.wyz;
	r0.yzw = r1.yyy * r0.yzw;
	r0.yzw = (r2.xyz * r1.xxx) + r0.yzw;
	r1.x = -r1.x + c2.y;
	r1.y = dot(c2.xxx, r2.xyz);
	r1.y = r1.y * c2.x;
	r0.yzw = (r1.yyy * r1.xxx) + r0.yzw;
	r1.x = abs(c12.w);
	r0.yzw = ((-r1.x >= 0.0) ? r2.xyz : r0.yzw);
	r1.x = dot(r0.yzw, c34.xyz);
	r1.xyz = r1.xxx * c102.xyz;
	r1.xyz = (r1.xyz * r0.xxx) + -r0.yzw;
	r1.xyz = (c102.www * r1.xyz) + r0.yzw;
	r0.x = clamp(c107.w + v6.w, 0.0, 1.0);
	r1.xyz = (r1.xyz * r0.xxx) + -r0.yzw;
	r2 = (v5.xyzx * c26.yyyx) + c26.xxxy;
	r0.x = dot(r2, c18);
	r1.w = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r3.x = dot(r2, c15);
	r3.y = dot(r2, c16);
	r3.z = dot(r2, c17);
	r2.xyz = r1.www * r3.xyz;
	r3 = r2.xyzx * c26.yyyx;
	r4 = r3 + c26.wwxy;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c27;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c27.yxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c27.xxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r1.w = dot(r4, c29.xxxx);
	r4 = r3 + c26.wxxy;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c27.xzzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c26.xwxy;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c27.zxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r4.x = dot(r4, c29.yyyy);
	r1.w = r1.w + r4.x;
	r4 = r3 + c31;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c31.yxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c32;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c36;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r4.x = dot(r4, c29.zzzz);
	r1.w = r1.w + r4.x;
	r4 = r3 + c37;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c37.yxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c36.yxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c32.yxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r4.x = dot(r4, c29.zzzz);
	r1.w = r1.w + r4.x;
	r4 = r3 + c31.yyzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c38;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c38.yxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c32.xxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r4.x = dot(r4, c29.wwww);
	r1.w = r1.w + r4.x;
	r4 = r3 + c31.yzzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c32.xzzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c32.zxzw;
	r3 = r3 + c31.zyzw;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4.w = r3.x;
	r3 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r3.x;
	r3.x = dot(r4, c33.xxxx);
	r1.w = r1.w + r3.x;
	r2.w = c2.y;
	r3 = float4(s11_texture.sample_compare(s11, (r2.xyz).xy, (r2.xyz).z));
	r2 = s8_texture.sample(s8, r2.xy);
	r2.xyz = ((-r0.x >= 0.0) ? c26.xxx : r2.xyz);
	r0.x = (r3.x * c33.y) + r1.w;
	r1.w = pow(abs(r0.x), c33.z);
	r0.x = clamp(r1.w, 0.0, 1.0);
	r2.w = -r0.x + c2.y;
	r0.x = (c109.y * r2.w) + r0.x;
	r3.x = c2.y;
	r4.xyz = c14.xyz + -v5.xyz;
	r2.w = dot(r4.xyz, r4.xyz);
	r3.z = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r3.y = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r2.w = clamp(dot(c13.xyz, r3.xyz), 0.0, 1.0);
	r3.x = clamp(mix(r0.x, r1.w, r2.w), 0.0, 1.0);
	r5.xyz = r2.xyz * c28.xyz;
	r3.xzw = r3.xxx * r5.xyz;
	r4.xyz = r3.yyy * r4.xyz;
	r0.x = ((r3.y == 0.0) ? FLT_MAX : 1.0 / r3.y);
	r0.x = r0.x + -c13.w;
	r5 = s1_texture.sample(s1, v0.xy);
	r5.xyz = (r5.xyz * c2.zzz) + c2.www;
	r6.x = dot(v2.xyz, r5.xyz);
	r6.y = dot(v3.xyz, r5.xyz);
	r6.z = dot(v4.xyz, r5.xyz);
	r5.xyz = normalize(r6.xyz);
	r3.y = dot(r4.xyz, r5.xyz);
	r4.w = clamp(r3.y + c28.w, 0.0, 1.0);
	r3.y = clamp(r3.y, 0.0, 1.0);
	r3.y = ((r3.y == 0.0) ? FLT_MAX : rsqrt(abs(r3.y)));
	r3.y = ((r3.y == 0.0) ? FLT_MAX : 1.0 / r3.y);
	r4.w = r2.w * r4.w;
	r3.xzw = r3.xzw * r4.www;
	r6.x = ((r5.x >= 0.0) ? c26.x : c26.y);
	r6.y = ((r5.y >= 0.0) ? c26.x : c26.y);
	r6.z = ((r5.z >= 0.0) ? c26.x : c26.y);
	r7.xyz = r5.xyz * r5.xyz;
	r6.xyz = r6.xyz * r7.xyz;
	r8.xyz = r6.xxx * c5.xyz;
	r9.x = ((r5.x >= 0.0) ? c26.y : c26.x);
	r9.y = ((r5.y >= 0.0) ? c26.y : c26.x);
	r9.z = ((r5.z >= 0.0) ? c26.y : c26.x);
	r7.xyz = r7.xyz * r9.xyz;
	r8.xyz = (r7.xxx * c4.xyz) + r8.xyz;
	r7.xyw = (r7.yyy * c6.xyz) + r8.xyz;
	r6.xyw = (r6.yyy * c7.xyz) + r7.xyw;
	r6.xyw = (r7.zzz * c8.xyz) + r6.xyw;
	r6.xyz = (r6.zzz * c9.xyz) + r6.xyw;
	r7.xyz = c21.xyz + -v5.xyz;
	r8.xyz = normalize(r7.xyz);
	r4.w = clamp(dot(r5.xyz, r8.xyz), 0.0, 1.0);
	r6.w = (r4.w * r4.w) + r4.w;
	r6.w = r6.w * c0.y;
	r7.xyz = c20.xyz * v1.xxx;
	r6.xyz = (r7.xyz * r6.www) + r6.xyz;
	r9.xyz = c23.xyz + -v5.xyz;
	r10.xyz = normalize(r9.xyz);
	r6.w = clamp(dot(r5.xyz, r10.xyz), 0.0, 1.0);
	r7.w = (r6.w * r6.w) + r6.w;
	r7.w = r7.w * c0.y;
	r9.xyz = c22.xyz * v1.yyy;
	r6.xyz = (r9.xyz * r7.www) + r6.xyz;
	r11.xyz = c25.xyz + -v5.xyz;
	r12.xyz = normalize(r11.xyz);
	r7.w = clamp(dot(r5.xyz, r12.xyz), 0.0, 1.0);
	r8.w = (r7.w * r7.w) + r7.w;
	r8.w = r8.w * c0.y;
	r11.xyz = c24.xyz * v1.zzz;
	r6.xyz = (r11.xyz * r8.www) + r6.xyz;
	r13.z = c26.z;
	r8.w = r13.z * c13.w;
	r8.w = ((r8.w == 0.0) ? FLT_MAX : 1.0 / r8.w);
	r0.x = clamp(r0.x * r8.w, 0.0, 1.0);
	r3.xzw = (r3.xzw * r0.xxx) + r6.xyz;
	r0.x = r0.x * r2.w;
	r6.xyz = r0.xxx * c28.xyz;
	r2.xyz = r2.xyz * r6.xyz;
	r13 = s10_texture.sample(s10, v0.xy);
	r0.x = r13.y * c101.w;
	r6.xyz = (r0.yzw * r0.xxx) + -c106.xyz;
	r0.x = clamp(r0.x, 0.0, 1.0);
	r6.xyz = (r0.xxx * r6.xyz) + c106.xyz;
	r14.xyz = c3.xyz + -v5.xyz;
	r0.x = dot(r14.xyz, r14.xyz);
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r10.xyz = (r14.xyz * r0.xxx) + r10.xyz;
	r15.xyz = normalize(r10.xyz);
	r10.x = clamp(dot(r5.xyz, r15.xyz), 0.0, 1.0);
	r8.w = r6.w * r10.x;
	r6.w = ((r6.w == 0.0) ? FLT_MAX : rsqrt(abs(r6.w)));
	r6.w = ((r6.w == 0.0) ? FLT_MAX : 1.0 / r6.w);
	r15.xyz = r0.xxx * r14.xyz;
	r9.w = clamp(dot(r5.xyz, r15.xyz), 0.0, 1.0);
	r9.w = -r9.w + c2.y;
	r11.w = pow(abs(r9.w), c105.x);
	r8.w = r8.w * r11.w;
	r8.w = r6.w * r8.w;
	r15.xyz = r9.xyz * r8.www;
	r8.xyz = (r14.xyz * r0.xxx) + r8.xyz;
	r16.xyz = normalize(r8.xyz);
	r10.y = clamp(dot(r5.xyz, r16.xyz), 0.0, 1.0);
	r8.x = r4.w * r10.y;
	r4.w = ((r4.w == 0.0) ? FLT_MAX : rsqrt(abs(r4.w)));
	r4.w = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r8.x = r11.w * r8.x;
	r8.x = r4.w * r8.x;
	r8.xyz = (r8.xxx * r7.xyz) + r15.xyz;
	r12.xyz = (r14.xyz * r0.xxx) + r12.xyz;
	r4.xyz = (r14.xyz * r0.xxx) + r4.xyz;
	r14.xyz = normalize(r4.xyz);
	r10.z = clamp(dot(r5.xyz, r14.xyz), 0.0, 1.0);
	r4.xyz = normalize(r12.xyz);
	r4.x = clamp(dot(r5.xyz, r4.xyz), 0.0, 1.0);
	r0.x = r7.w * r4.x;
	r4.z = ((r7.w == 0.0) ? FLT_MAX : rsqrt(abs(r7.w)));
	r4.z = ((r4.z == 0.0) ? FLT_MAX : 1.0 / r4.z);
	r0.x = r11.w * r0.x;
	r0.x = r4.z * r0.x;
	r5.xyz = (r0.xxx * r11.xyz) + r8.xyz;
	r8.y = c2.y;
	r0.x = (v6.w * c11.w) + r8.y;
	r7.w = r13.x * c105.y;
	r0.x = r0.x * r7.w;
	r5.xyz = r0.xxx * r5.xyz;
	r8.xyz = (r5.xyz * r6.xyz) + r3.xzw;
	r3.xzw = r3.xzw + v6.xyz;
	r0.x = dot(r8.xyz, c34.xyz);
	r0.x = r0.x + c33.w;
	r0.x = clamp(r0.x * c34.w, 0.0, 1.0);
	r7.w = (r0.x * c35.x) + c35.y;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r7.w;
	r1.xyz = (r0.xxx * r1.xyz) + r0.yzw;
	r0.xyz = r0.yzw + c2.www;
	r0.xyz = (r13.yyy * r0.xyz) + c2.yyy;
	r1.xyz = r13.zzz * r1.xyz;
	r10.w = r13.w;
	r0.w = mix(c10.x, c10.y, r13.y);
	r8 = s7_texture.sample(s7, r10.xw);
	r8.xyz = r6.www * r8.xyz;
	r8.xyz = r9.xyz * r8.xyz;
	r12 = s7_texture.sample(s7, r10.yw);
	r9.xyz = r4.www * r12.xyz;
	r7.xyz = (r9.xyz * r7.xyz) + r8.xyz;
	r4.y = r10.w;
	r8 = s7_texture.sample(s7, r10.zw);
	r8.xyz = r3.yyy * r8.xyz;
	r10 = s7_texture.sample(s7, r4.xy);
	r4.xyz = r4.zzz * r10.xyz;
	r4.xyz = (r4.xyz * r11.xyz) + r7.xyz;
	r3.y = -r1.w + c2.y;
	r3.y = (c109.y * r3.y) + r1.w;
	r4.w = clamp(mix(r3.y, r1.w, r2.w), 0.0, 1.0);
	r2.xyz = r2.xyz * r4.www;
	r2.xyz = (r8.xyz * r2.xyz) + r4.xyz;
	r2.xyz = r5.www * r2.xyz;
	r2.xyz = r0.www * r2.xyz;
	r0.w = (r9.w * -r9.w) + c0.y;
	r1.w = r9.w * r9.w;
	r2.w = r1.w + r1.w;
	r1.w = (r1.w * c2.z) + c2.w;
	r3.y = mix(c12.y, c12.z, r1.w);
	r1.w = -c12.x + c12.y;
	r1.w = (r2.w * r1.w) + c12.x;
	r0.w = ((r0.w >= 0.0) ? r1.w : r3.y);
	r2.xyz = r0.www * r2.xyz;
	r0.xyz = r0.xyz * r2.xyz;
	r0.xyz = (r1.xyz * r3.xzw) + r0.xyz;
	r0.xyz = (r5.xyz * r6.xyz) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	oC0.xyz = r0.xyz * c30.xxx;
	#undef c1
	#undef c3
	#undef c4
	#undef c5
	#undef c6
	#undef c7
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c12
	#undef c13
	#undef c14
	#undef c15
	#undef c16
	#undef c17
	#undef c18
	#undef c19
	#undef c20
	#undef c21
	#undef c22
	#undef c23
	#undef c24
	#undef c25
	#undef c28
	#undef c30
	#undef c101
	#undef c102
	#undef c105
	#undef c106
	#undef c107
	#undef c109
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

