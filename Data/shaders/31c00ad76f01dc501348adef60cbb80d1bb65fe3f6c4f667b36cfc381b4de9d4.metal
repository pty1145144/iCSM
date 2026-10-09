#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[35];
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
	const float4 c19 = float4(0.57735002, 1.0, 2.0, -1.0); (void) c19;
	const float4 c26 = float4(0.003021148, 0.021148037, 0.012084592, 0.06042296); (void) c26;
	const float4 c27 = float4(0.0, 1.0, -0.400000005, 0.001953125); (void) c27;
	const float4 c29 = float4(-0.000976562, 0.001953125, 0.0, 1.0); (void) c29;
	const float4 c31 = float4(0.001953125, 0.000976562, 0.0, 1.0); (void) c31;
	const float4 c32 = float4(-0.001953125, 0.001953125, 0.0, 1.0); (void) c32;
	const float4 c34 = float4(0.099697888, 0.166163144, 1.399999979, -0.000001); (void) c34;
	const float4 c35 = float4(0.298999992, 0.587000012, 0.114, 1000000.0); (void) c35;
	const float4 c36 = float4(-0.300000011, -3.333333253, -2.0, 3.0); (void) c36;
	const float4 c37 = float4(-0.001953125, 0.000976562, 0.0, 1.0); (void) c37;
	const float4 c38 = float4(-0.001953125, -0.000976562, 0.0, 1.0); (void) c38;
	const float4 c39 = float4(-0.000976562, 0.000976562, 0.0, 1.0); (void) c39;
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
	#define c1 uniforms.uniforms_float4[0]
	#define c2 uniforms.uniforms_float4[1]
	#define c3 uniforms.uniforms_float4[2]
	#define c4 uniforms.uniforms_float4[3]
	#define c5 uniforms.uniforms_float4[4]
	#define c6 uniforms.uniforms_float4[5]
	#define c7 uniforms.uniforms_float4[6]
	#define c8 uniforms.uniforms_float4[7]
	#define c9 uniforms.uniforms_float4[8]
	#define c10 uniforms.uniforms_float4[9]
	#define c11 uniforms.uniforms_float4[10]
	#define c12 uniforms.uniforms_float4[11]
	#define c13 uniforms.uniforms_float4[12]
	#define c14 uniforms.uniforms_float4[13]
	#define c15 uniforms.uniforms_float4[14]
	#define c16 uniforms.uniforms_float4[15]
	#define c17 uniforms.uniforms_float4[16]
	#define c18 uniforms.uniforms_float4[17]
	#define c20 uniforms.uniforms_float4[18]
	#define c21 uniforms.uniforms_float4[19]
	#define c22 uniforms.uniforms_float4[20]
	#define c23 uniforms.uniforms_float4[21]
	#define c24 uniforms.uniforms_float4[22]
	#define c25 uniforms.uniforms_float4[23]
	#define c28 uniforms.uniforms_float4[24]
	#define c30 uniforms.uniforms_float4[25]
	#define c33 uniforms.uniforms_float4[26]
	#define c101 uniforms.uniforms_float4[27]
	#define c102 uniforms.uniforms_float4[28]
	#define c103 uniforms.uniforms_float4[29]
	#define c104 uniforms.uniforms_float4[30]
	#define c105 uniforms.uniforms_float4[31]
	#define c106 uniforms.uniforms_float4[32]
	#define c107 uniforms.uniforms_float4[33]
	#define c109 uniforms.uniforms_float4[34]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define oC0 output.oC0
	r0 = (v5.xyzx * c27.yyyx) + c27.xxxy;
	r1.x = dot(r0, c18);
	r1.y = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r2.x = dot(r0, c15);
	r2.y = dot(r0, c16);
	r2.z = dot(r0, c17);
	r0.xyz = r1.yyy * r2.xyz;
	r2 = r0.xyzx * c27.yyyx;
	r3 = r2 + c27.wwxy;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c32;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c32.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c32.xxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.y = dot(r3, c26.xxxx);
	r3 = r2 + c27.wxxy;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c32.xzzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c27.xwxy;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c32.zxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c26.yyyy);
	r1.y = r1.z + r1.y;
	r3 = r2 + c31;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c31.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c29;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c37;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c26.zzzz);
	r1.y = r1.z + r1.y;
	r3 = r2 + c38;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c38.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c37.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c29.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c26.zzzz);
	r1.y = r1.z + r1.y;
	r3 = r2 + c31.yyzw;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c39;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c39.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c29.xxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c26.wwww);
	r1.y = r1.z + r1.y;
	r3 = r2 + c31.yzzw;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c29.xzzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c29.zxzw;
	r2 = r2 + c31.zyzw;
	r2 = float4(s11_texture.sample_compare(s11, (r2.xyz).xy, (r2.xyz).z));
	r3.w = r2.x;
	r2 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r2.x;
	r1.z = dot(r3, c34.xxxx);
	r1.y = r1.z + r1.y;
	r0.w = c19.y;
	r2 = float4(s11_texture.sample_compare(s11, (r0.xyz).xy, (r0.xyz).z));
	r0 = s8_texture.sample(s8, r0.xy);
	r0.xyz = ((-r1.x >= 0.0) ? c27.xxx : r0.xyz);
	r0.w = (r2.x * c34.y) + r1.y;
	r1.x = pow(abs(r0.w), c34.z);
	r0.w = -r1.x + c19.y;
	r0.w = (c109.y * r0.w) + r1.x;
	r2.x = c19.y;
	r1.yzw = c14.xyz + -v5.xyz;
	r2.w = dot(r1.yzw, r1.yzw);
	r2.z = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r2.y = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r2.x = clamp(dot(c13.xyz, r2.xyz), 0.0, 1.0);
	r3.x = clamp(mix(r0.w, r1.x, r2.x), 0.0, 1.0);
	r0.w = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r1.yzw = r1.yzw * r2.yyy;
	r0.w = r0.w + -c13.w;
	r2.z = c27.z;
	r2.y = r2.z * c13.w;
	r2.y = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r0.w = clamp(r0.w * r2.y, 0.0, 1.0);
	r2.y = r0.w * r2.x;
	r2.yzw = r2.yyy * c28.xyz;
	r2.yzw = r0.xyz * r2.yzw;
	r0.xyz = r0.xyz * c28.xyz;
	r2.yzw = r3.xxx * r2.yzw;
	r3.xyz = c22.xyz * v1.yyy;
	r4.xyz = c23.xyz + -v5.xyz;
	r5.xyz = normalize(r4.xyz);
	r4 = s1_texture.sample(s1, v0.xy);
	r4.xyz = (r4.xyz * c19.zzz) + c19.www;
	r6.x = dot(v2.xyz, r4.xyz);
	r6.y = dot(v3.xyz, r4.xyz);
	r6.z = dot(v4.xyz, r4.xyz);
	r4.xyz = normalize(r6.xyz);
	r3.w = clamp(dot(r4.xyz, r5.xyz), 0.0, 1.0);
	r5.w = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r5.w = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r6.xyz = c3.xyz + -v5.xyz;
	r6.w = dot(r6.xyz, r6.xyz);
	r6.w = ((r6.w == 0.0) ? FLT_MAX : rsqrt(abs(r6.w)));
	r5.xyz = (r6.xyz * r6.www) + r5.xyz;
	r7.xyz = normalize(r5.xyz);
	r5.y = clamp(dot(r4.xyz, r7.xyz), 0.0, 1.0);
	r7 = s10_texture.sample(s10, v0.xy);
	r8.w = r7.w;
	r5.z = r8.w;
	r9 = s7_texture.sample(s7, r5.yz);
	r5.y = r3.w * r5.y;
	r3.w = (r3.w * r3.w) + r3.w;
	r3.w = r3.w * c0.y;
	r9.xyz = r5.www * r9.xyz;
	r9.xyz = r3.xyz * r9.xyz;
	r10.xyz = c20.xyz * v1.xxx;
	r11.xyz = c21.xyz + -v5.xyz;
	r12.xyz = normalize(r11.xyz);
	r11.xyz = (r6.xyz * r6.www) + r12.xyz;
	r7.w = clamp(dot(r4.xyz, r12.xyz), 0.0, 1.0);
	r12.xyz = normalize(r11.xyz);
	r8.x = clamp(dot(r4.xyz, r12.xyz), 0.0, 1.0);
	r11 = s7_texture.sample(s7, r8.xw);
	r8.x = r7.w * r8.x;
	r9.w = ((r7.w == 0.0) ? FLT_MAX : rsqrt(abs(r7.w)));
	r7.w = (r7.w * r7.w) + r7.w;
	r7.w = r7.w * c0.y;
	r9.w = ((r9.w == 0.0) ? FLT_MAX : 1.0 / r9.w);
	r11.xyz = r9.www * r11.xyz;
	r9.xyz = (r11.xyz * r10.xyz) + r9.xyz;
	r11.xyz = c24.xyz * v1.zzz;
	r12.xyz = c25.xyz + -v5.xyz;
	r13.xyz = normalize(r12.xyz);
	r12.xyz = (r6.xyz * r6.www) + r13.xyz;
	r10.w = clamp(dot(r4.xyz, r13.xyz), 0.0, 1.0);
	r13.xyz = normalize(r12.xyz);
	r5.x = clamp(dot(r4.xyz, r13.xyz), 0.0, 1.0);
	r12 = s7_texture.sample(s7, r5.xz);
	r5.x = r10.w * r5.x;
	r5.z = ((r10.w == 0.0) ? FLT_MAX : rsqrt(abs(r10.w)));
	r10.w = (r10.w * r10.w) + r10.w;
	r10.w = r10.w * c0.y;
	r5.z = ((r5.z == 0.0) ? FLT_MAX : 1.0 / r5.z);
	r12.xyz = r5.zzz * r12.xyz;
	r9.xyz = (r12.xyz * r11.xyz) + r9.xyz;
	r11.w = dot(r1.yzw, r4.xyz);
	r1.yzw = (r6.xyz * r6.www) + r1.yzw;
	r6.xyz = r6.www * r6.xyz;
	r12.xyz = normalize(r1.yzw);
	r8.y = clamp(dot(r4.xyz, r12.xyz), 0.0, 1.0);
	r12 = s7_texture.sample(s7, r8.yw);
	r1.y = clamp(r11.w, 0.0, 1.0);
	r1.z = clamp(r11.w + c28.w, 0.0, 1.0);
	r1.z = r1.z * r2.x;
	r1.y = ((r1.y == 0.0) ? FLT_MAX : rsqrt(abs(r1.y)));
	r1.y = ((r1.y == 0.0) ? FLT_MAX : 1.0 / r1.y);
	r12.xyz = r1.yyy * r12.xyz;
	r2.yzw = (r12.xyz * r2.yzw) + r9.xyz;
	r2.yzw = r4.www * r2.yzw;
	r9.x = ((r4.x >= 0.0) ? c27.x : c27.y);
	r9.y = ((r4.y >= 0.0) ? c27.x : c27.y);
	r9.z = ((r4.z >= 0.0) ? c27.x : c27.y);
	r12.xyz = r4.xyz * r4.xyz;
	r9.xyz = r9.xyz * r12.xyz;
	r13.xyz = r9.xxx * c5.xyz;
	r14.x = ((r4.x >= 0.0) ? c27.y : c27.x);
	r14.y = ((r4.y >= 0.0) ? c27.y : c27.x);
	r14.z = ((r4.z >= 0.0) ? c27.y : c27.x);
	r12.xyz = r12.xyz * r14.xyz;
	r13.xyz = (r12.xxx * c4.xyz) + r13.xyz;
	r12.xyw = (r12.yyy * c6.xyz) + r13.xyz;
	r12.xyw = (r9.yyy * c7.xyz) + r12.xyw;
	r12.xyz = (r12.zzz * c8.xyz) + r12.xyw;
	r9.xyz = (r9.zzz * c9.xyz) + r12.xyz;
	r9.xyz = (r10.xyz * r7.www) + r9.xyz;
	r9.xyz = (r3.xyz * r3.www) + r9.xyz;
	r9.xyz = (r11.xyz * r10.www) + r9.xyz;
	r1.y = clamp(r1.x, 0.0, 1.0);
	r1.w = -r1.y + c19.y;
	r1.y = (c109.y * r1.w) + r1.y;
	r3.w = clamp(mix(r1.y, r1.x, r2.x), 0.0, 1.0);
	r0.xyz = r0.xyz * r3.www;
	r0.xyz = r0.xyz * r1.zzz;
	r0.xyz = (r0.xyz * r0.www) + r9.xyz;
	r1.xyz = r0.xyz + v6.xyz;
	r9.xyz = r1.xyz + -c103.xxx;
	r9.xyz = clamp(r9.xyz * c103.yyy, float3(0.0), float3(1.0));
	r0.w = dot(r4.xyz, r4.xyz);
	r12.xyz = r6.xyz * r0.www;
	r8.z = dot(r6.xyz, r4.xyz);
	r0.w = r8.z + r8.z;
	r8.z = clamp(r8.z, 0.0, 1.0);
	r4.xyz = (r0.www * r4.xyz) + -r12.xyz;
	r4 = s6_texture.sample(s6, r4.xyz);
	r6.xyz = r4.xyz * c30.zzz;
	r12.xyz = r6.xyz * r6.xyz;
	r12.xyz = r12.xyz * r12.xyz;
	r0.w = dot(r12.xyz, c35.xyz);
	r1.w = r0.w + c34.w;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r1.w >= 0.0) ? r0.w : c35.w);
	r1.w = dot(r6.xyz, c35.xyz);
	r12.xyz = r1.www * r12.xyz;
	r4.xyz = (c30.zzz * -r4.xyz) + r1.www;
	r4.xyz = (-c103.www * r4.xyz) + r6.xyz;
	r12.xyz = (r12.xyz * r0.www) + -r6.xyz;
	r12.xyz = (c103.www * r12.xyz) + r6.xyz;
	r4.xyz = ((c103.w >= 0.0) ? r12.xyz : r4.xyz);
	r0.w = abs(c103.w);
	r4.xyz = ((-r0.w >= 0.0) ? r6.xyz : r4.xyz);
	r6.xyz = (r4.xyz * r9.xyz) + -r4.xyz;
	r4.xyz = (c101.xxx * r6.xyz) + r4.xyz;
	r6.xyz = (r4.xyz * r4.xyz) + -r4.xyz;
	r4.xyz = (c103.zzz * r6.xyz) + r4.xyz;
	r6 = s0_texture.sample(s0, v0.xy);
	r9.xyz = r6.www * c104.xyz;
	r4.xyz = r4.xyz * r9.xyz;
	r0.w = mix(c10.x, c10.y, r7.y);
	r2.xyz = (r2.yzw * r0.www) + r4.xyz;
	r4 = s4_texture.sample(s4, r8.zw);
	r0.w = -r8.z + c19.y;
	r1.w = pow(abs(r0.w), c105.x);
	r2.xyz = r2.xyz * r4.yyy;
	r4.xyz = r6.zxy * c19.xxx;
	r4.xyz = (r6.zxy * c19.xxx) + -r4.zxy;
	r9.xy = c0.xy;
	r0.w = (c12.w * r9.x) + r9.y;
	r0.w = fract(r0.w);
	r0.w = (r0.w * c0.z) + c0.w;
	r12.xy = float2(cos(r0.w), sin(r0.w));
	r4.xyz = r4.xyz * r12.yyy;
	r4.xyz = (r6.xyz * r12.xxx) + r4.xyz;
	r0.w = -r12.x + c19.y;
	r2.w = dot(c19.xxx, r6.xyz);
	r2.w = r2.w * c19.x;
	r4.xyz = (r2.www * r0.www) + r4.xyz;
	r0.w = abs(c12.w);
	r4.xyz = ((-r0.w >= 0.0) ? r6.xyz : r4.xyz);
	r6.xyz = r4.xyz + c19.www;
	r6.xyz = (r7.yyy * r6.xyz) + c19.yyy;
	r2.xyz = r2.xyz * r6.xyz;
	r6.xyz = r4.xyz * r4.xyz;
	r6.xyz = r6.xyz * r6.xyz;
	r0.w = dot(r4.xyz, c35.xyz);
	r8.yzw = r0.www * r6.xyz;
	r2.w = dot(r6.xyz, c35.xyz);
	r6.xyz = mix(r4.xyz, r0.www, -c101.yyy);
	r0.w = r2.w + c34.w;
	r2.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r0.w = ((r0.w >= 0.0) ? r2.w : c35.w);
	r8.yzw = (r8.yzw * r0.www) + -r4.xyz;
	r8.yzw = (c101.yyy * r8.yzw) + r4.xyz;
	r6.xyz = ((c101.y >= 0.0) ? r8.yzw : r6.xyz);
	r0.w = abs(c101.y);
	r6.xyz = ((-r0.w >= 0.0) ? r4.xyz : r6.xyz);
	r0.w = r1.w * r5.y;
	r0.w = r5.w * r0.w;
	r2.w = r1.w * r8.x;
	r1.w = r1.w * r5.x;
	r3.w = (r2.w * r9.w) + r0.w;
	r3.xyz = r3.xyz * r0.www;
	r0.w = r9.w * r2.w;
	r3.xyz = (r0.www * r10.xyz) + r3.xyz;
	r0.w = (r1.w * r5.z) + r3.w;
	r1.w = r5.z * r1.w;
	r3.xyz = (r1.www * r11.xyz) + r3.xyz;
	r5.xy = r0.ww + -c33.xw;
	r5.zw = -c33.xw + c33.yz;
	r0.w = ((r5.z == 0.0) ? FLT_MAX : 1.0 / r5.z);
	r1.w = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r1.w = clamp(r1.w * r5.y, 0.0, 1.0);
	r0.w = clamp(r0.w * r5.x, 0.0, 1.0);
	r2.w = (r0.w * c36.z) + c36.w;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r2.w;
	r2.w = (r1.w * c36.z) + c36.w;
	r1.w = r1.w * r1.w;
	r1.w = r1.w * r2.w;
	r0.w = r0.w * r1.w;
	r5.y = c19.y;
	r1.w = (v6.w * c11.w) + r5.y;
	r2.w = r7.x * c105.y;
	r1.w = r1.w * r2.w;
	r3.xyz = r1.www * r3.xyz;
	r1.w = r7.y * c101.w;
	r5.xyz = (r4.xyz * r1.www) + -c106.xyz;
	r1.w = clamp(r1.w, 0.0, 1.0);
	r5.xyz = (r1.www * r5.xyz) + c106.xyz;
	r7.xyw = r3.xyz * r5.xyz;
	r1.w = dot(r7.xyw, c35.xyz);
	r0.w = r0.w * r1.w;
	r0.w = r0.w * c106.w;
	r1.w = dot(r0.xyz, c35.xyz);
	r0.xyz = (r3.xyz * r5.xyz) + r0.xyz;
	r0.x = dot(r0.xyz, c35.xyz);
	r0.x = r0.x + c36.x;
	r0.x = clamp(r0.x * c36.y, 0.0, 1.0);
	r0.yz = r1.ww + -c2.xw;
	r7.xy = -c2.xw + c2.yz;
	r1.w = ((r7.y == 0.0) ? FLT_MAX : 1.0 / r7.y);
	r2.w = ((r7.x == 0.0) ? FLT_MAX : 1.0 / r7.x);
	r0.y = clamp(r0.y * r2.w, 0.0, 1.0);
	r0.z = clamp(r0.z * r1.w, 0.0, 1.0);
	r1.w = (r0.z * c36.z) + c36.w;
	r0.z = r0.z * r0.z;
	r0.z = (r1.w * r0.z) + r0.w;
	r0.w = (r0.y * c36.z) + c36.w;
	r0.y = r0.y * r0.y;
	r0.y = r0.y * r0.w;
	r0.y = r0.z * r0.y;
	r7.xyw = mix(r4.xyz, r6.xyz, r0.yyy);
	r0.y = dot(r7.xyw, c35.xyz);
	r0.yzw = r0.yyy * c102.xyz;
	r4.xyz = c35.xyz;
	r1.w = dot(c102.xyz, r4.xyz);
	r2.w = r1.w + c34.w;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = ((r2.w >= 0.0) ? r1.w : c35.w);
	r0.yzw = (r0.yzw * r1.www) + -r7.xyw;
	r0.yzw = (c102.www * r0.yzw) + r7.xyw;
	r1.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r0.yzw = (r0.yzw * r1.www) + -r7.xyw;
	r1.w = (r0.x * c36.z) + c36.w;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r1.w;
	r0.xyz = (r0.xxx * r0.yzw) + r7.xyw;
	r0.xyz = r7.zzz * r0.xyz;
	r0.xyz = (r0.xyz * r1.xyz) + r2.xyz;
	r0.xyz = (r3.xyz * r5.xyz) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	oC0.xyz = r0.xyz * c30.xxx;
	oC0.w = c1.w;
	#undef c1
	#undef c2
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
	#undef c20
	#undef c21
	#undef c22
	#undef c23
	#undef c24
	#undef c25
	#undef c28
	#undef c30
	#undef c33
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

