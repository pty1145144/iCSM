#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[33];
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
	texture2d<float> s4_texture [[texture(4)]],
	sampler s4 [[sampler(4)]],
	texturecube<float> s6_texture [[texture(6)]],
	sampler s6 [[sampler(6)]],
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
	const float4 c2 = float4(0.003021148, 0.021148037, 0.012084592, 0.06042296); (void) c2;
	const float4 c24 = float4(-0.000976562, 0.001953125, 0.0, 1.0); (void) c24;
	const float4 c25 = float4(-0.001953125, 0.001953125, 0.0, 1.0); (void) c25;
	const float4 c26 = float4(0.0, 1.0, -0.400000005, 0.001953125); (void) c26;
	const float4 c27 = float4(0.001953125, 0.000976562, 0.0, 1.0); (void) c27;
	const float4 c31 = float4(0.099697888, 0.166163144, 1.399999979, -0.000001); (void) c31;
	const float4 c32 = float4(0.298999992, 0.587000012, 0.114, 1000000.0); (void) c32;
	const float4 c33 = float4(0.57735002, 1.0, 2.0, -1.0); (void) c33;
	const float4 c34 = float4(-0.300000011, -3.333333253, -2.0, 3.0); (void) c34;
	const float4 c35 = float4(-0.001953125, 0.000976562, 0.0, 1.0); (void) c35;
	const float4 c36 = float4(-0.001953125, -0.000976562, 0.0, 1.0); (void) c36;
	const float4 c37 = float4(-0.000976562, 0.000976562, 0.0, 1.0); (void) c37;
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
	#define c28 uniforms.uniforms_float4[22]
	#define c29 uniforms.uniforms_float4[23]
	#define c30 uniforms.uniforms_float4[24]
	#define c101 uniforms.uniforms_float4[25]
	#define c102 uniforms.uniforms_float4[26]
	#define c103 uniforms.uniforms_float4[27]
	#define c104 uniforms.uniforms_float4[28]
	#define c105 uniforms.uniforms_float4[29]
	#define c106 uniforms.uniforms_float4[30]
	#define c107 uniforms.uniforms_float4[31]
	#define c109 uniforms.uniforms_float4[32]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	oC0.w = r0.w * c1.w;
	r1 = (v5.xyzx * c26.yyyx) + c26.xxxy;
	r0.w = dot(r1, c18);
	r2.x = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r3.x = dot(r1, c15);
	r3.y = dot(r1, c16);
	r3.z = dot(r1, c17);
	r1.xyz = r2.xxx * r3.xyz;
	r2 = r1.xyzx * c26.yyyx;
	r3 = r2 + c26.wwxy;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c25;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c25.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c25.xxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r3.x = dot(r3, c2.xxxx);
	r4 = r2 + c26.wxxy;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r5 = r2 + c25.xzzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r2 + c26.xwxy;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r2 + c25.zxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r3.y = dot(r4, c2.yyyy);
	r3.x = r3.y + r3.x;
	r4 = r2 + c27;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r5 = r2 + c27.yxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r2 + c24;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r2 + c35;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r3.y = dot(r4, c2.zzzz);
	r3.x = r3.y + r3.x;
	r4 = r2 + c36;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r5 = r2 + c36.yxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r2 + c35.yxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r2 + c24.yxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r3.y = dot(r4, c2.zzzz);
	r3.x = r3.y + r3.x;
	r4 = r2 + c27.yyzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r5 = r2 + c37;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r2 + c37.yxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r2 + c24.xxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r3.y = dot(r4, c2.wwww);
	r3.x = r3.y + r3.x;
	r4 = r2 + c27.yzzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r5 = r2 + c24.xzzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r2 + c24.zxzw;
	r2 = r2 + c27.zyzw;
	r2 = float4(s11_texture.sample_compare(s11, (r2.xyz).xy, (r2.xyz).z));
	r4.w = r2.x;
	r2 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r2.x;
	r2.x = dot(r4, c31.xxxx);
	r2.x = r2.x + r3.x;
	r1.w = c33.y;
	r3 = float4(s11_texture.sample_compare(s11, (r1.xyz).xy, (r1.xyz).z));
	r1 = s8_texture.sample(s8, r1.xy);
	r1.xyz = ((-r0.w >= 0.0) ? c26.xxx : r1.xyz);
	r0.w = (r3.x * c31.y) + r2.x;
	r1.w = pow(abs(r0.w), c31.z);
	r0.w = clamp(r1.w, 0.0, 1.0);
	r2.x = -r0.w + c33.y;
	r0.w = (c109.y * r2.x) + r0.w;
	r2.x = c33.y;
	r3.xyz = c14.xyz + -v5.xyz;
	r2.w = dot(r3.xyz, r3.xyz);
	r2.z = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r2.y = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r2.x = clamp(dot(c13.xyz, r2.xyz), 0.0, 1.0);
	r3.w = clamp(mix(r0.w, r1.w, r2.x), 0.0, 1.0);
	r4.xyz = r1.xyz * c28.xyz;
	r4.xyz = r3.www * r4.xyz;
	r3.xyz = r2.yyy * r3.xyz;
	r0.w = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r0.w = r0.w + -c13.w;
	r5 = s1_texture.sample(s1, v0.xy);
	r2.yzw = (r5.xyz * c33.zzz) + c33.www;
	r5.x = dot(v2.xyz, r2.yzw);
	r5.y = dot(v3.xyz, r2.yzw);
	r5.z = dot(v4.xyz, r2.yzw);
	r6.xyz = normalize(r5.xyz);
	r2.y = dot(r3.xyz, r6.xyz);
	r2.z = clamp(r2.y + c28.w, 0.0, 1.0);
	r2.y = clamp(r2.y, 0.0, 1.0);
	r2.y = ((r2.y == 0.0) ? FLT_MAX : rsqrt(abs(r2.y)));
	r2.y = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r2.z = r2.z * r2.x;
	r4.xyz = r4.xyz * r2.zzz;
	r5.x = ((r6.x >= 0.0) ? c26.x : c26.y);
	r5.y = ((r6.y >= 0.0) ? c26.x : c26.y);
	r5.z = ((r6.z >= 0.0) ? c26.x : c26.y);
	r7.xyz = r6.xyz * r6.xyz;
	r5.xyz = r5.xyz * r7.xyz;
	r8.xyz = r5.xxx * c5.xyz;
	r9.x = ((r6.x >= 0.0) ? c26.y : c26.x);
	r9.y = ((r6.y >= 0.0) ? c26.y : c26.x);
	r9.z = ((r6.z >= 0.0) ? c26.y : c26.x);
	r7.xyz = r7.xyz * r9.xyz;
	r8.xyz = (r7.xxx * c4.xyz) + r8.xyz;
	r7.xyw = (r7.yyy * c6.xyz) + r8.xyz;
	r7.xyw = (r5.yyy * c7.xyz) + r7.xyw;
	r7.xyz = (r7.zzz * c8.xyz) + r7.xyw;
	r5.xyz = (r5.zzz * c9.xyz) + r7.xyz;
	r7.xyz = c21.xyz + -v5.xyz;
	r8.xyz = normalize(r7.xyz);
	r2.z = clamp(dot(r6.xyz, r8.xyz), 0.0, 1.0);
	r2.w = (r2.z * r2.z) + r2.z;
	r2.w = r2.w * c0.y;
	r7.xyz = c20.xyz * v1.xxx;
	r5.xyz = (r7.xyz * r2.www) + r5.xyz;
	r9.xyz = c23.xyz + -v5.xyz;
	r10.xyz = normalize(r9.xyz);
	r2.w = clamp(dot(r6.xyz, r10.xyz), 0.0, 1.0);
	r3.w = (r2.w * r2.w) + r2.w;
	r3.w = r3.w * c0.y;
	r9.xyz = c22.xyz * v1.yyy;
	r5.xyz = (r9.xyz * r3.www) + r5.xyz;
	r11.z = c26.z;
	r3.w = r11.z * c13.w;
	r3.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r0.w = clamp(r0.w * r3.w, 0.0, 1.0);
	r4.xyz = (r4.xyz * r0.www) + r5.xyz;
	r0.w = r0.w * r2.x;
	r5.xyz = r0.www * c28.xyz;
	r1.xyz = r1.xyz * r5.xyz;
	r5.xyz = r4.xyz + v6.xyz;
	r11.xyz = r5.xyz + -c103.xxx;
	r11.xyz = clamp(r11.xyz * c103.yyy, float3(0.0), float3(1.0));
	r0.w = dot(r6.xyz, r6.xyz);
	r12.xyz = c3.xyz + -v5.xyz;
	r3.w = dot(r12.xyz, r12.xyz);
	r3.w = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r13.xyz = r3.www * r12.xyz;
	r14.xyz = r0.www * r13.xyz;
	r13.z = dot(r13.xyz, r6.xyz);
	r0.w = r13.z + r13.z;
	r13.z = clamp(r13.z, 0.0, 1.0);
	r14.xyz = (r0.www * r6.xyz) + -r14.xyz;
	r14 = s6_texture.sample(s6, r14.xyz);
	r15.xyz = r14.xyz * c30.zzz;
	r16.xyz = r15.xyz * r15.xyz;
	r16.xyz = r16.xyz * r16.xyz;
	r0.w = dot(r16.xyz, c32.xyz);
	r4.w = r0.w + c31.w;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r4.w >= 0.0) ? r0.w : c32.w);
	r4.w = dot(r15.xyz, c32.xyz);
	r16.xyz = r4.www * r16.xyz;
	r14.xyz = (c30.zzz * -r14.xyz) + r4.www;
	r14.xyz = (-c103.www * r14.xyz) + r15.xyz;
	r16.xyz = (r16.xyz * r0.www) + -r15.xyz;
	r16.xyz = (c103.www * r16.xyz) + r15.xyz;
	r14.xyz = ((c103.w >= 0.0) ? r16.xyz : r14.xyz);
	r0.w = abs(c103.w);
	r14.xyz = ((-r0.w >= 0.0) ? r15.xyz : r14.xyz);
	r11.xyz = (r14.xyz * r11.xyz) + -r14.xyz;
	r11.xyz = (c101.xxx * r11.xyz) + r14.xyz;
	r14.xyz = (r11.xyz * r11.xyz) + -r11.xyz;
	r11.xyz = (c103.zzz * r14.xyz) + r11.xyz;
	r14.xyz = r5.www * c104.xyz;
	r11.xyz = r11.xyz * r14.xyz;
	r0.w = -r1.w + c33.y;
	r0.w = (c109.y * r0.w) + r1.w;
	r4.w = clamp(mix(r0.w, r1.w, r2.x), 0.0, 1.0);
	r1.xyz = r1.xyz * r4.www;
	r0.w = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r10.xyz = (r12.xyz * r3.www) + r10.xyz;
	r14.xyz = normalize(r10.xyz);
	r10.x = clamp(dot(r6.xyz, r14.xyz), 0.0, 1.0);
	r14 = s10_texture.sample(s10, v0.xy);
	r13.w = r14.w;
	r10.y = r13.w;
	r15 = s7_texture.sample(s7, r10.xy);
	r1.w = r2.w * r10.x;
	r10.xyz = r0.www * r15.xyz;
	r10.xyz = r9.xyz * r10.xyz;
	r8.xyz = (r12.xyz * r3.www) + r8.xyz;
	r3.xyz = (r12.xyz * r3.www) + r3.xyz;
	r2.x = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r2.x = clamp((r2.x * c19.w) + c19.x, 0.0, 1.0);
	r3.w = min(r2.x, c19.z);
	r2.x = r3.w * r3.w;
	r12.xyz = normalize(r3.xyz);
	r13.y = clamp(dot(r6.xyz, r12.xyz), 0.0, 1.0);
	r3 = s7_texture.sample(s7, r13.yw);
	r3.xyz = r2.yyy * r3.xyz;
	r12.xyz = normalize(r8.xyz);
	r13.x = clamp(dot(r6.xyz, r12.xyz), 0.0, 1.0);
	r6 = s7_texture.sample(s7, r13.xw);
	r2.y = r2.z * r13.x;
	r2.z = ((r2.z == 0.0) ? FLT_MAX : rsqrt(abs(r2.z)));
	r2.z = ((r2.z == 0.0) ? FLT_MAX : 1.0 / r2.z);
	r8 = s4_texture.sample(s4, r13.zw);
	r2.w = -r13.z + c33.y;
	r3.w = pow(abs(r2.w), c105.x);
	r6.xyz = r2.zzz * r6.xyz;
	r6.xyz = (r6.xyz * r7.xyz) + r10.xyz;
	r1.xyz = (r3.xyz * r1.xyz) + r6.xyz;
	r1.xyz = r5.www * r1.xyz;
	r2.w = mix(c10.x, c10.y, r14.y);
	r1.xyz = (r1.xyz * r2.www) + r11.xyz;
	r1.xyz = r8.yyy * r1.xyz;
	r3.xyz = r0.zxy * c33.xxx;
	r3.xyz = (r0.zxy * c33.xxx) + -r3.zxy;
	r6.xy = c0.xy;
	r2.w = (c12.w * r6.x) + r6.y;
	r2.w = fract(r2.w);
	r2.w = (r2.w * c0.z) + c0.w;
	r6.xy = float2(cos(r2.w), sin(r2.w));
	r3.xyz = r3.xyz * r6.yyy;
	r3.xyz = (r0.xyz * r6.xxx) + r3.xyz;
	r2.w = -r6.x + c33.y;
	r4.w = dot(c33.xxx, r0.xyz);
	r4.w = r4.w * c33.x;
	r3.xyz = (r4.www * r2.www) + r3.xyz;
	r2.w = abs(c12.w);
	r0.xyz = ((-r2.w >= 0.0) ? r0.xyz : r3.xyz);
	r3.xyz = r0.xyz + c33.www;
	r3.xyz = (r14.yyy * r3.xyz) + c33.yyy;
	r1 = r1 * r3;
	r3.xyz = c32.xyz;
	r2.w = dot(c102.xyz, r3.xyz);
	r3.x = r2.w + c31.w;
	r2.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r2.w = ((r3.x >= 0.0) ? r2.w : c32.w);
	r3.x = dot(r0.xyz, c32.xyz);
	r3.xyz = r3.xxx * c102.xyz;
	r3.xyz = (r3.xyz * r2.www) + -r0.xyz;
	r3.xyz = (c102.www * r3.xyz) + r0.xyz;
	r2.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r3.xyz = (r3.xyz * r2.www) + -r0.xyz;
	r2.y = r2.y * r3.w;
	r2.y = r2.z * r2.y;
	r0.w = r0.w * r1.w;
	r6.xyz = r9.xyz * r0.www;
	r2.yzw = (r2.yyy * r7.xyz) + r6.xyz;
	r6.y = c33.y;
	r0.w = (v6.w * c11.w) + r6.y;
	r1.w = r14.x * c105.y;
	r0.w = r0.w * r1.w;
	r2.yzw = r0.www * r2.yzw;
	r0.w = r14.y * c101.w;
	r6.xyz = (r0.xyz * r0.www) + -c106.xyz;
	r0.w = clamp(r0.w, 0.0, 1.0);
	r6.xyz = (r0.www * r6.xyz) + c106.xyz;
	r4.xyz = (r2.yzw * r6.xyz) + r4.xyz;
	r0.w = dot(r4.xyz, c32.xyz);
	r0.w = r0.w + c34.x;
	r0.w = clamp(r0.w * c34.y, 0.0, 1.0);
	r1.w = (r0.w * c34.z) + c34.w;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.w;
	r0.xyz = (r0.www * r3.xyz) + r0.xyz;
	r0.xyz = r14.zzz * r0.xyz;
	r0.xyz = (r0.xyz * r5.xyz) + r1.xyz;
	r0.xyz = (r2.yzw * r6.xyz) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r3.x = c30.x;
	r0.xyz = (r0.xyz * -r3.xxx) + c29.xyz;
	oC0.xyz = (r2.xxx * r0.xyz) + r1.xyz;
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
	#undef c28
	#undef c29
	#undef c30
	#undef c101
	#undef c102
	#undef c103
	#undef c104
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

