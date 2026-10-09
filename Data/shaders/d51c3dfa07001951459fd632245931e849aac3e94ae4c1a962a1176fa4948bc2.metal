#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[34];
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
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
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
	const float4 c0 = float4(2.0, -1.0, 0.0, 1.0); (void) c0;
	const float4 c2 = float4(0.5, 0.159154935, 6.283185478, -3.141592739); (void) c2;
	const float4 c26 = float4(0.001953125, 0.0, 1.0, -0.001953125); (void) c26;
	const float4 c27 = float4(0.57735002, -0.400000005, 0.003021148, 0.021148037); (void) c27;
	const float4 c29 = float4(0.001953125, 0.000976562, 0.0, 1.0); (void) c29;
	const float4 c31 = float4(-0.000976562, 0.001953125, 0.0, 1.0); (void) c31;
	const float4 c32 = float4(0.012084592, 0.06042296, 0.099697888, 0.166163144); (void) c32;
	const float4 c33 = float4(1.399999979, 5.0, -0.000001, 1000000.0); (void) c33;
	const float4 c34 = float4(0.298999992, 0.587000012, 0.114, -0.300000011); (void) c34;
	const float4 c35 = float4(-3.333333253, -2.0, 3.0, 0.0); (void) c35;
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
	#define c103 uniforms.uniforms_float4[28]
	#define c104 uniforms.uniforms_float4[29]
	#define c105 uniforms.uniforms_float4[30]
	#define c106 uniforms.uniforms_float4[31]
	#define c107 uniforms.uniforms_float4[32]
	#define c109 uniforms.uniforms_float4[33]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define oC0 output.oC0
	r0.x = c19.y + -v5.z;
	r0.x = r0.x + -c0.x;
	oC0.w = clamp(r0.x * c19.w, 0.0, 1.0);
	r0 = (v5.xyzx * c0.wwwz) + c0.zzzw;
	r1.x = dot(r0, c18);
	r1.y = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r2.x = dot(r0, c15);
	r2.y = dot(r0, c16);
	r2.z = dot(r0, c17);
	r0.xyz = r1.yyy * r2.xyz;
	r2 = r0.xyzx * c0.wwwz;
	r3 = r2 + c26.xxyz;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c26.wxyz;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c26.xwyz;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c26.wwyz;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.y = dot(r3, c27.zzzz);
	r3 = r2 + c26.xyyz;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c26.wyyz;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c26.yxyz;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c26.ywyz;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c27.wwww);
	r1.y = r1.z + r1.y;
	r3 = r2 + c29;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c29.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c31;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c36;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c32.xxxx);
	r1.y = r1.z + r1.y;
	r3 = r2 + c37;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c37.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c36.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c31.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c32.xxxx);
	r1.y = r1.z + r1.y;
	r3 = r2 + c29.yyzw;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c38;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c38.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c31.xxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c32.yyyy);
	r1.y = r1.z + r1.y;
	r3 = r2 + c29.yzzw;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c31.xzzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c31.zxzw;
	r2 = r2 + c29.zyzw;
	r2 = float4(s11_texture.sample_compare(s11, (r2.xyz).xy, (r2.xyz).z));
	r3.w = r2.x;
	r2 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r2.x;
	r1.z = dot(r3, c32.zzzz);
	r1.y = r1.z + r1.y;
	r0.w = c0.w;
	r2 = float4(s11_texture.sample_compare(s11, (r0.xyz).xy, (r0.xyz).z));
	r0 = s8_texture.sample(s8, r0.xy);
	r0.xyz = ((-r1.x >= 0.0) ? c0.zzz : r0.xyz);
	r0.w = (r2.x * c32.w) + r1.y;
	r1.x = pow(abs(r0.w), c33.x);
	r0.w = -r1.x + c0.w;
	r0.w = (c109.y * r0.w) + r1.x;
	r2.x = c0.w;
	r1.yzw = c14.xyz + -v5.xyz;
	r2.w = dot(r1.yzw, r1.yzw);
	r2.z = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r2.y = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r2.x = clamp(dot(c13.xyz, r2.xyz), 0.0, 1.0);
	r3.x = clamp(mix(r0.w, r1.x, r2.x), 0.0, 1.0);
	r0.w = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r1.yzw = r1.yzw * r2.yyy;
	r0.w = r0.w + -c13.w;
	r2.y = c27.y;
	r2.y = r2.y * c13.w;
	r2.y = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r0.w = clamp(r0.w * r2.y, 0.0, 1.0);
	r2.y = r0.w * r2.x;
	r2.yzw = r2.yyy * c28.xyz;
	r2.yzw = r0.xyz * r2.yzw;
	r0.xyz = r0.xyz * c28.xyz;
	r2.yzw = r3.xxx * r2.yzw;
	r3.xyz = c21.xyz + -v5.xyz;
	r4.xyz = normalize(r3.xyz);
	r3.xyz = c3.xyz + -v5.xyz;
	r3.w = dot(r3.xyz, r3.xyz);
	r3.w = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r5.xyz = r3.www * r3.xyz;
	r4.w = clamp(dot(r5.xyz, r4.xyz), 0.0, 1.0);
	r6 = s1_texture.sample(s1, v0.xy);
	r6.xyz = (r6.xyz * c0.xxx) + c0.yyy;
	r7.x = dot(v2.xyz, r6.xyz);
	r7.y = dot(v3.xyz, r6.xyz);
	r7.z = dot(v4.xyz, r6.xyz);
	r6.xyz = normalize(r7.xyz);
	r5.w = dot(r5.xyz, r6.xyz);
	r7.z = clamp(r5.w, 0.0, 1.0);
	r5.w = r5.w + r5.w;
	r8.x = r7.z * r7.z;
	r8.w = r8.x * r8.x;
	r9 = s3_texture.sample(s3, v0.xy);
	r9.y = -r9.w + c0.w;
	r9.w = r8.w * r9.y;
	r10.xyz = r9.www * v6.xyz;
	r8.xyz = r10.xyz * c33.yyy;
	r8 = ((-r9.y >= 0.0) ? c0.zzzz : r8);
	r4.w = r4.w * r8.w;
	r10.xyz = (r3.xyz * r3.www) + r4.xyz;
	r4.x = clamp(dot(r6.xyz, r4.xyz), 0.0, 1.0);
	r11.xyz = normalize(r10.xyz);
	r7.x = clamp(dot(r6.xyz, r11.xyz), 0.0, 1.0);
	r10 = s10_texture.sample(s10, v0.xy);
	r7.w = r10.w;
	r11 = s7_texture.sample(s7, r7.xw);
	r4.y = r4.x * r7.x;
	r12.xyz = (r4.www * c33.yyy) + -r11.xyz;
	r12.xyz = (r9.yyy * r12.xyz) + r11.xyz;
	r11.xyz = ((-r9.y >= 0.0) ? r11.xyz : r12.xyz);
	r4.z = ((r4.x == 0.0) ? FLT_MAX : rsqrt(abs(r4.x)));
	r4.x = (r4.x * r4.x) + r4.x;
	r4.x = r4.x * c2.x;
	r4.z = ((r4.z == 0.0) ? FLT_MAX : 1.0 / r4.z);
	r11.xyz = r4.zzz * r11.xyz;
	r12.xyz = c20.xyz * v1.xxx;
	r8.xyz = (r11.xyz * r12.xyz) + r8.xyz;
	r11.xyz = c23.xyz + -v5.xyz;
	r13.xyz = normalize(r11.xyz);
	r4.w = clamp(dot(r5.xyz, r13.xyz), 0.0, 1.0);
	r4.w = r4.w * r8.w;
	r11.xyz = (r3.xyz * r3.www) + r13.xyz;
	r7.x = clamp(dot(r6.xyz, r13.xyz), 0.0, 1.0);
	r13.xyz = normalize(r11.xyz);
	r11.y = clamp(dot(r6.xyz, r13.xyz), 0.0, 1.0);
	r11.z = r7.w;
	r13 = s7_texture.sample(s7, r11.yz);
	r9.w = r7.x * r11.y;
	r14.xyz = (r4.www * c33.yyy) + -r13.xyz;
	r14.xyz = (r9.yyy * r14.xyz) + r13.xyz;
	r13.xyz = ((-r9.y >= 0.0) ? r13.xyz : r14.xyz);
	r4.w = ((r7.x == 0.0) ? FLT_MAX : rsqrt(abs(r7.x)));
	r7.x = (r7.x * r7.x) + r7.x;
	r7.x = r7.x * c2.x;
	r4.w = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r13.xyz = r4.www * r13.xyz;
	r14.xyz = c22.xyz * v1.yyy;
	r8.xyz = (r13.xyz * r14.xyz) + r8.xyz;
	r13.xyz = c25.xyz + -v5.xyz;
	r15.xyz = normalize(r13.xyz);
	r10.w = clamp(dot(r5.xyz, r15.xyz), 0.0, 1.0);
	r8.w = r8.w * r10.w;
	r13.xyz = (r3.xyz * r3.www) + r15.xyz;
	r10.w = clamp(dot(r6.xyz, r15.xyz), 0.0, 1.0);
	r3.xyz = (r3.xyz * r3.www) + r1.yzw;
	r1.y = dot(r1.yzw, r6.xyz);
	r15.xyz = normalize(r3.xyz);
	r7.y = clamp(dot(r6.xyz, r15.xyz), 0.0, 1.0);
	r3 = s7_texture.sample(s7, r7.yw);
	r15 = s4_texture.sample(s4, r7.zw);
	r1.z = -r7.z + c0.w;
	r3.w = pow(abs(r1.z), c105.x);
	r1.z = mix(r15.y, c0.w, r9.y);
	r15.xyz = normalize(r13.xyz);
	r11.x = clamp(dot(r6.xyz, r15.xyz), 0.0, 1.0);
	r13 = s7_texture.sample(s7, r11.xz);
	r1.w = r10.w * r11.x;
	r1.w = r3.w * r1.w;
	r7.yzw = (r8.www * c33.yyy) + -r13.xyz;
	r7.yzw = (r9.yyy * r7.yzw) + r13.xyz;
	r7.yzw = ((-r9.y >= 0.0) ? r13.xyz : r7.yzw);
	r8.w = ((r10.w == 0.0) ? FLT_MAX : rsqrt(abs(r10.w)));
	r9.y = (r10.w * r10.w) + r10.w;
	r9.y = r9.y * c2.x;
	r8.w = ((r8.w == 0.0) ? FLT_MAX : 1.0 / r8.w);
	r7.yzw = r7.yzw * r8.www;
	r1.w = r1.w * r8.w;
	r11.xyz = c24.xyz * v1.zzz;
	r7.yzw = (r7.yzw * r11.xyz) + r8.xyz;
	r8.x = clamp(r1.y, 0.0, 1.0);
	r1.y = clamp(r1.y + c28.w, 0.0, 1.0);
	r1.y = r1.y * r2.x;
	r8.x = ((r8.x == 0.0) ? FLT_MAX : rsqrt(abs(r8.x)));
	r8.x = ((r8.x == 0.0) ? FLT_MAX : 1.0 / r8.x);
	r3.xyz = r3.xyz * r8.xxx;
	r2.yzw = (r3.xyz * r2.yzw) + r7.yzw;
	r2.yzw = r6.www * r2.yzw;
	r3.x = ((r6.x >= 0.0) ? c0.z : c0.w);
	r3.y = ((r6.y >= 0.0) ? c0.z : c0.w);
	r3.z = ((r6.z >= 0.0) ? c0.z : c0.w);
	r7.yzw = r6.xyz * r6.xyz;
	r3.xyz = r3.xyz * r7.yzw;
	r8.xyz = r3.xxx * c5.xyz;
	r13.x = ((r6.x >= 0.0) ? c0.w : c0.z);
	r13.y = ((r6.y >= 0.0) ? c0.w : c0.z);
	r13.z = ((r6.z >= 0.0) ? c0.w : c0.z);
	r7.yzw = r7.yzw * r13.xyz;
	r8.xyz = (r7.yyy * c4.xyz) + r8.xyz;
	r8.xyz = (r7.zzz * c6.xyz) + r8.xyz;
	r8.xyz = (r3.yyy * c7.xyz) + r8.xyz;
	r7.yzw = (r7.www * c8.xyz) + r8.xyz;
	r3.xyz = (r3.zzz * c9.xyz) + r7.yzw;
	r3.xyz = (r12.xyz * r4.xxx) + r3.xyz;
	r3.xyz = (r14.xyz * r7.xxx) + r3.xyz;
	r3.xyz = (r11.xyz * r9.yyy) + r3.xyz;
	r4.x = clamp(r1.x, 0.0, 1.0);
	r6.w = -r4.x + c0.w;
	r4.x = (c109.y * r6.w) + r4.x;
	r6.w = clamp(mix(r4.x, r1.x, r2.x), 0.0, 1.0);
	r0.xyz = r0.xyz * r6.www;
	r0.xyz = r0.xyz * r1.yyy;
	r0.xyz = (r0.xyz * r0.www) + r3.xyz;
	r3.xyz = r0.xyz + v6.xyz;
	r7.xyz = r3.xyz + -c103.xxx;
	r7.xyz = clamp(r7.xyz * c103.yyy, float3(0.0), float3(1.0));
	r0.w = dot(r6.xyz, r6.xyz);
	r5.xyz = r5.xyz * r0.www;
	r5.xyz = (r5.www * r6.xyz) + -r5.xyz;
	r5 = s6_texture.sample(s6, r5.xyz);
	r6.xyz = r5.xyz * c30.zzz;
	r8.xyz = r6.xyz * r6.xyz;
	r8.xyz = r8.xyz * r8.xyz;
	r0.w = dot(r8.xyz, c34.xyz);
	r1.x = r0.w + c33.z;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r1.x >= 0.0) ? r0.w : c33.w);
	r1.x = dot(r6.xyz, c34.xyz);
	r8.xyz = r1.xxx * r8.xyz;
	r5.xyz = (c30.zzz * -r5.xyz) + r1.xxx;
	r5.xyz = (-c103.www * r5.xyz) + r6.xyz;
	r8.xyz = (r8.xyz * r0.www) + -r6.xyz;
	r8.xyz = (c103.www * r8.xyz) + r6.xyz;
	r5.xyz = ((c103.w >= 0.0) ? r8.xyz : r5.xyz);
	r0.w = abs(c103.w);
	r5.xyz = ((-r0.w >= 0.0) ? r6.xyz : r5.xyz);
	r6.xyz = (r5.xyz * r7.xyz) + -r5.xyz;
	r0.w = r9.z * c101.x;
	r1.x = r9.x * c12.w;
	r1.x = (r1.x * c2.y) + c2.x;
	r1.x = fract(r1.x);
	r1.x = (r1.x * c2.z) + c2.w;
	r7.xy = float2(cos(r1.x), sin(r1.x));
	r5.xyz = (r0.www * r6.xyz) + r5.xyz;
	r6.xyz = (r5.xyz * r5.xyz) + -r5.xyz;
	r5.xyz = (c103.zzz * r6.xyz) + r5.xyz;
	r6 = s0_texture.sample(s0, v0.xy);
	r8.xyz = r6.www * c104.xyz;
	r5.xyz = r5.xyz * r8.xyz;
	r0.w = mix(c10.x, c10.y, r10.y);
	r2.xyz = (r2.yzw * r0.www) + r5.xyz;
	r1.xyz = r1.zzz * r2.xyz;
	r2.xyz = r6.zxy * c27.xxx;
	r2.xyz = (r6.zxy * c27.xxx) + -r2.zxy;
	r2.xyz = r7.yyy * r2.xyz;
	r2.xyz = (r6.xyz * r7.xxx) + r2.xyz;
	r0.w = -r7.x + c0.w;
	r2.w = dot(c27.xxx, r6.xyz);
	r2.w = r2.w * c27.x;
	r2.xyz = (r2.www * r0.www) + r2.xyz;
	r0.w = abs(c12.w);
	r2.xyz = ((-r0.w >= 0.0) ? r6.xyz : r2.xyz);
	r5.xyz = r2.xyz + c0.yyy;
	r5.xyz = (r10.yyy * r5.xyz) + c0.www;
	r1.xyz = r1.xyz * r5.xyz;
	r5.xyz = c34.xyz;
	r0.w = dot(c102.xyz, r5.xyz);
	r2.w = r0.w + c33.z;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r2.w >= 0.0) ? r0.w : c33.w);
	r2.w = dot(r2.xyz, c34.xyz);
	r5.xyz = r2.www * c102.xyz;
	r5.xyz = (r5.xyz * r0.www) + -r2.xyz;
	r5.xyz = (c102.www * r5.xyz) + r2.xyz;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r5.xyz = (r5.xyz * r0.www) + -r2.xyz;
	r0.w = r3.w * r9.w;
	r2.w = r3.w * r4.y;
	r2.w = r4.z * r2.w;
	r0.w = r4.w * r0.w;
	r4.xyz = r14.xyz * r0.www;
	r4.xyz = (r2.www * r12.xyz) + r4.xyz;
	r4.xyz = (r1.www * r11.xyz) + r4.xyz;
	r0.w = c0.w;
	r0.w = (v6.w * c11.w) + r0.w;
	r1.w = r10.x * c105.y;
	r0.w = r0.w * r1.w;
	r4.xyz = r0.www * r4.xyz;
	r0.w = r10.y * c101.w;
	r6.xyz = (r2.xyz * r0.www) + -c106.xyz;
	r0.w = clamp(r0.w, 0.0, 1.0);
	r6.xyz = (r0.www * r6.xyz) + c106.xyz;
	r0.xyz = (r4.xyz * r6.xyz) + r0.xyz;
	r0.x = dot(r0.xyz, c34.xyz);
	r0.x = r0.x + c34.w;
	r0.x = clamp(r0.x * c35.x, 0.0, 1.0);
	r0.y = (r0.x * c35.y) + c35.z;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r0.y;
	r0.xyz = (r0.xxx * r5.xyz) + r2.xyz;
	r0.xyz = r10.zzz * r0.xyz;
	r0.xyz = (r0.xyz * r3.xyz) + r1.xyz;
	r0.xyz = (r4.xyz * r6.xyz) + r0.xyz;
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

