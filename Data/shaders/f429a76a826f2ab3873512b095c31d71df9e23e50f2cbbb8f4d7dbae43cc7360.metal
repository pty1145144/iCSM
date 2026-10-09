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
	float4 v7 [[user(texcoord7)]];
	float4 v8 [[user(texcoord8)]];
	float4 v9 [[user(texcoord9)]];
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
	const float4 c19 = float4(0.5, 0.159154935, 6.283185478, -3.141592739); (void) c19;
	const float4 c22 = float4(0.001953125, 0.0, 1.0, -0.001953125); (void) c22;
	const float4 c23 = float4(0.57735002, -0.400000005, 0.003021148, 0.021148037); (void) c23;
	const float4 c24 = float4(0.001953125, 0.000976562, 0.0, 1.0); (void) c24;
	const float4 c25 = float4(0.012084592, 0.06042296, 0.099697888, 0.166163144); (void) c25;
	const float4 c26 = float4(-0.000976562, 0.001953125, 0.0, 1.0); (void) c26;
	const float4 c27 = float4(1.399999979, 0.499999584, 0.5, 5.0); (void) c27;
	const float4 c29 = float4(0.298999992, 0.587000012, 0.114, -0.000001); (void) c29;
	const float4 c31 = float4(2.0, -1.0, 0.0, 1.0); (void) c31;
	const float4 c32 = float4(1000000.0, -0.300000011, -3.333333253, 0.0); (void) c32;
	const float4 c34 = float4(-2.0, 3.0, 0.0, 0.0); (void) c34;
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
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c2 uniforms.uniforms_float4[2]
	#define c3 uniforms.uniforms_float4[3]
	#define c4 uniforms.uniforms_float4[4]
	#define c5 uniforms.uniforms_float4[5]
	#define c6 uniforms.uniforms_float4[6]
	#define c7 uniforms.uniforms_float4[7]
	#define c8 uniforms.uniforms_float4[8]
	#define c9 uniforms.uniforms_float4[9]
	#define c10 uniforms.uniforms_float4[10]
	#define c11 uniforms.uniforms_float4[11]
	#define c12 uniforms.uniforms_float4[12]
	#define c13 uniforms.uniforms_float4[13]
	#define c14 uniforms.uniforms_float4[14]
	#define c15 uniforms.uniforms_float4[15]
	#define c16 uniforms.uniforms_float4[16]
	#define c17 uniforms.uniforms_float4[17]
	#define c18 uniforms.uniforms_float4[18]
	#define c20 uniforms.uniforms_float4[19]
	#define c21 uniforms.uniforms_float4[20]
	#define c28 uniforms.uniforms_float4[21]
	#define c30 uniforms.uniforms_float4[22]
	#define c33 uniforms.uniforms_float4[23]
	#define c101 uniforms.uniforms_float4[24]
	#define c102 uniforms.uniforms_float4[25]
	#define c103 uniforms.uniforms_float4[26]
	#define c104 uniforms.uniforms_float4[27]
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
	#define v7 input.v7
	#define v8 input.v8
	#define v9 input.v9
	#define oC0 output.oC0
	r0 = (v5.xyzx * c31.wwwz) + c31.zzzw;
	r1.x = dot(r0, c18);
	r1.y = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r2.x = dot(r0, c15);
	r2.y = dot(r0, c16);
	r2.z = dot(r0, c17);
	r0.xyz = r1.yyy * r2.xyz;
	r2 = r0.xyzx * c31.wwwz;
	r3 = r2 + c22.xxyz;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c22.wxyz;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c22.xwyz;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c22.wwyz;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.y = dot(r3, c23.zzzz);
	r3 = r2 + c22.xyyz;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c22.wyyz;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c22.yxyz;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c22.ywyz;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c23.wwww);
	r1.y = r1.z + r1.y;
	r3 = r2 + c24;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c24.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c26;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c35;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c25.xxxx);
	r1.y = r1.z + r1.y;
	r3 = r2 + c36;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c36.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c35.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c26.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c25.xxxx);
	r1.y = r1.z + r1.y;
	r3 = r2 + c24.yyzw;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c37;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c37.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c26.xxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c25.yyyy);
	r1.y = r1.z + r1.y;
	r3 = r2 + c24.yzzw;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c26.xzzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c26.zxzw;
	r2 = r2 + c24.zyzw;
	r2 = float4(s11_texture.sample_compare(s11, (r2.xyz).xy, (r2.xyz).z));
	r3.w = r2.x;
	r2 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r2.x;
	r1.z = dot(r3, c25.zzzz);
	r1.y = r1.z + r1.y;
	r0.w = c31.w;
	r2 = float4(s11_texture.sample_compare(s11, (r0.xyz).xy, (r0.xyz).z));
	r0 = s8_texture.sample(s8, r0.xy);
	r0.xyz = ((-r1.x >= 0.0) ? c31.zzz : r0.xyz);
	r0.w = (r2.x * c25.w) + r1.y;
	r1.x = pow(abs(r0.w), c27.x);
	r0.w = clamp(r1.x, 0.0, 1.0);
	r1.y = -r0.w + c31.w;
	r0.w = (c109.y * r1.y) + r0.w;
	r2.x = c31.w;
	r1.yzw = c14.xyz + -v5.xyz;
	r2.w = dot(r1.yzw, r1.yzw);
	r2.z = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r2.y = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r2.x = clamp(dot(c13.xyz, r2.xyz), 0.0, 1.0);
	r3.x = clamp(mix(r0.w, r1.x, r2.x), 0.0, 1.0);
	r3.yzw = r0.xyz * c28.xyz;
	r3.xyz = r3.xxx * r3.yzw;
	r1.yzw = r1.yzw * r2.yyy;
	r0.w = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r0.w = r0.w + -c13.w;
	r4 = s1_texture.sample(s1, v0.xy);
	r2.yzw = (r4.xyz * c31.xxx) + c31.yyy;
	r4.x = dot(v2.xyz, r2.yzw);
	r4.y = dot(v3.xyz, r2.yzw);
	r4.z = dot(v4.xyz, r2.yzw);
	r5.xyz = normalize(r4.xyz);
	r2.y = dot(r1.yzw, r5.xyz);
	r2.z = clamp(r2.y + c28.w, 0.0, 1.0);
	r2.y = clamp(r2.y, 0.0, 1.0);
	r2.y = ((r2.y == 0.0) ? FLT_MAX : rsqrt(abs(r2.y)));
	r2.y = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r2.z = r2.z * r2.x;
	r3.xyz = r3.xyz * r2.zzz;
	r4.y = c23.y;
	r2.z = r4.y * c13.w;
	r2.z = ((r2.z == 0.0) ? FLT_MAX : 1.0 / r2.z);
	r0.w = clamp(r0.w * r2.z, 0.0, 1.0);
	r4.x = ((r5.x >= 0.0) ? c31.z : c31.w);
	r4.y = ((r5.y >= 0.0) ? c31.z : c31.w);
	r4.z = ((r5.z >= 0.0) ? c31.z : c31.w);
	r6.xyz = r5.xyz * r5.xyz;
	r4.xyz = r4.xyz * r6.xyz;
	r7.xyz = r4.xxx * c5.xyz;
	r8.x = ((r5.x >= 0.0) ? c31.w : c31.z);
	r8.y = ((r5.y >= 0.0) ? c31.w : c31.z);
	r8.z = ((r5.z >= 0.0) ? c31.w : c31.z);
	r6.xyz = r6.xyz * r8.xyz;
	r7.xyz = (r6.xxx * c4.xyz) + r7.xyz;
	r6.xyw = (r6.yyy * c6.xyz) + r7.xyz;
	r6.xyw = (r4.yyy * c7.xyz) + r6.xyw;
	r6.xyz = (r6.zzz * c8.xyz) + r6.xyw;
	r4.xyz = (r4.zzz * c9.xyz) + r6.xyz;
	r6.xyz = c21.xyz + -v5.xyz;
	r7.xyz = normalize(r6.xyz);
	r2.z = clamp(dot(r5.xyz, r7.xyz), 0.0, 1.0);
	r2.w = (r2.z * r2.z) + r2.z;
	r2.w = r2.w * c19.x;
	r6.xyz = c20.xyz * v1.xxx;
	r4.xyz = (r6.xyz * r2.www) + r4.xyz;
	r3.xyz = (r3.xyz * r0.www) + r4.xyz;
	r0.w = r0.w * r2.x;
	r4.xyz = r0.www * c28.xyz;
	r0.xyz = r0.xyz * r4.xyz;
	r4.xyz = r3.xyz + v6.xyz;
	r8.xyz = r4.xyz + -c103.xxx;
	r8.xyz = clamp(r8.xyz * c103.yyy, float3(0.0), float3(1.0));
	r9.xyz = r5.zxy * v8.yzx;
	r9.xyz = (r5.yzx * v8.zxy) + -r9.xyz;
	r10.xyz = normalize(r9.xyz);
	r9.xyz = r5.zxy * r10.yzx;
	r9.xyz = (r5.yzx * r10.zxy) + -r9.xyz;
	r11.xyz = normalize(r9.xyz);
	r9 = s3_texture.sample(s3, v0.xy);
	r0.w = (r9.y * c27.y) + c27.z;
	r0.w = fract(r0.w);
	r0.w = (r0.w * c19.z) + c19.w;
	r12.xy = float2(cos(r0.w), sin(r0.w));
	r10.xyz = r10.xyz * r12.xxx;
	r10.xyz = (r12.yyy * r11.xyz) + r10.xyz;
	r11.xyz = normalize(r10.xyz);
	r10.xyz = r5.xyz * r11.yzx;
	r10.xyz = (r11.xyz * r5.yzx) + -r10.xyz;
	r12.xyz = r11.yzx * r10.xyz;
	r10.xyz = (r10.zxy * r11.zxy) + -r12.xyz;
	r0.w = dot(r10.xyz, r10.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r12.xyz = c3.xyz + -v5.xyz;
	r2.w = dot(r12.xyz, r12.xyz);
	r2.w = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r13.xyz = r2.www * r12.xyz;
	r10.xyz = (r10.xyz * r0.www) + -r13.xyz;
	r14.zw = c31.zw;
	r0.w = ((-r9.y >= 0.0) ? r14.z : c10.w);
	r10.xyz = (r0.www * r10.xyz) + r13.xyz;
	r3.w = dot(r5.xyz, r10.xyz);
	r3.w = r3.w + r3.w;
	r5.w = dot(r5.xyz, r5.xyz);
	r10.xyz = r10.xyz * r5.www;
	r10.xyz = (r3.www * r5.xyz) + -r10.xyz;
	r15 = s6_texture.sample(s6, r10.xyz);
	r14.xyz = r15.xyz * c30.zzz;
	r16.xyz = r14.xyz * r14.xyz;
	r16.xyz = r16.xyz * r16.xyz;
	r3.w = dot(r16.xyz, c29.xyz);
	r5.w = r3.w + c29.w;
	r3.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r3.w = ((r5.w >= 0.0) ? r3.w : c32.x);
	r5.w = dot(r14.xyz, c29.xyz);
	r16.xyz = r5.www * r16.xyz;
	r15.xyz = (c30.zzz * -r15.xyz) + r5.www;
	r15.xyz = (-c103.www * r15.xyz) + r14.xyz;
	r16.xyz = (r16.xyz * r3.www) + -r14.xyz;
	r16.xyz = (c103.www * r16.xyz) + r14.xyz;
	r15.xyz = ((c103.w >= 0.0) ? r16.xyz : r15.xyz);
	r3.w = abs(c103.w);
	r14.xyz = ((-r3.w >= 0.0) ? r14.xyz : r15.xyz);
	r8.xyz = (r14.xyz * r8.xyz) + -r14.xyz;
	r3.w = r9.z * c101.x;
	r8.xyz = (r3.www * r8.xyz) + r14.xyz;
	r14.xyz = (r8.xyz * r8.xyz) + -r8.xyz;
	r8.xyz = (c103.zzz * r14.xyz) + r8.xyz;
	r15 = s0_texture.sample(s0, v0.xy);
	r14.xyz = r15.www * c104.xyz;
	r8.xyz = r8.xyz * r14.xyz;
	r3.w = -r1.x + c31.w;
	r3.w = (c109.y * r3.w) + r1.x;
	r5.w = clamp(mix(r3.w, r1.x, r2.x), 0.0, 1.0);
	r0.xyz = r0.xyz * r5.www;
	r1.x = dot(r7.xyz, r11.xxx);
	r2.x = dot(r13.xyz, r11.xyz);
	r3.w = (r1.x * -r1.x) + c31.w;
	r3.w = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r3.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r5.w = (r2.x * -r2.x) + c31.w;
	r5.w = ((r5.w == 0.0) ? FLT_MAX : rsqrt(abs(r5.w)));
	r5.w = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r3.w = r3.w * r5.w;
	r1.x = clamp((r2.x * r1.x) + r3.w, 0.0, 1.0);
	r11.xyz = (r12.xyz * r2.www) + r7.xyz;
	r1.yzw = (r12.xyz * r2.www) + r1.yzw;
	r12.xyz = normalize(r1.yzw);
	r1.y = clamp(dot(r5.xyz, r12.xyz), 0.0, 1.0);
	r12.y = mix(r1.y, c31.w, r0.w);
	r14.xyz = normalize(r11.xyz);
	r1.y = clamp(dot(r5.xyz, r14.xyz), 0.0, 1.0);
	r12.x = mix(r1.y, r1.x, r0.w);
	r1 = s10_texture.sample(s10, v0.xy);
	r12.w = r1.w;
	r11 = s7_texture.sample(s7, r12.xw);
	r0.w = r2.z * r12.x;
	r1.w = ((r2.z == 0.0) ? FLT_MAX : rsqrt(abs(r2.z)));
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r2.x = clamp(dot(r13.xyz, r7.xyz), 0.0, 1.0);
	r12.z = clamp(dot(r13.xyz, r5.xyz), 0.0, 1.0);
	r2.z = clamp(dot(r5.xyz, v9.xyz), 0.0, 1.0);
	r2.w = clamp(r7.z, 0.0, 1.0);
	r2.w = (r2.w * r2.w) + r2.w;
	r2.w = r2.w * c19.x;
	r5.xyz = r2.www * r6.xyz;
	r2.w = r12.z * r12.z;
	r7.w = r2.w * r2.w;
	r2.w = -r9.w + c31.w;
	r3.w = r7.w * r2.w;
	r9.yzw = r3.www * v6.xyz;
	r7.xyz = r9.yzw * c27.www;
	r7 = ((-r2.w >= 0.0) ? c31.zzzz : r7);
	r2.x = r2.x * r7.w;
	r9.yzw = (r2.xxx * c27.www) + -r11.xyz;
	r9.yzw = (r2.www * r9.yzw) + r11.xyz;
	r9.yzw = ((-r2.w >= 0.0) ? r11.xyz : r9.yzw);
	r9.yzw = r1.www * r9.yzw;
	r7.xyz = (r9.yzw * r6.xyz) + r7.xyz;
	r11 = s7_texture.sample(s7, r12.yw);
	r13 = s4_texture.sample(s4, r12.zw);
	r2.x = -r12.z + c31.w;
	r3.w = pow(abs(r2.x), c105.x);
	r0.w = r0.w * r3.w;
	r9.yzw = r2.yyy * r11.xyz;
	r0.xyz = (r9.yzw * r0.xyz) + r7.xyz;
	r0.xyz = r4.www * r0.xyz;
	r2.x = mix(c10.x, c10.y, r1.y);
	r0.xyz = (r0.xyz * r2.xxx) + r8.xyz;
	r7.x = ((r10.x >= 0.0) ? c31.z : c31.w);
	r7.y = ((r10.y >= 0.0) ? c31.z : c31.w);
	r7.z = ((r10.z >= 0.0) ? c31.z : c31.w);
	r8.xyz = r10.xyz * r10.xyz;
	r9.y = ((r10.x >= 0.0) ? c31.w : c31.z);
	r9.z = ((r10.y >= 0.0) ? c31.w : c31.z);
	r9.w = ((r10.z >= 0.0) ? c31.w : c31.z);
	r9.yzw = r8.xyz * r9.yzw;
	r7.xyz = r7.xyz * r8.xyz;
	r8.xyz = r7.xxx * c5.xyz;
	r8.xyz = (r9.yyy * c4.xyz) + r8.xyz;
	r8.xyz = (r9.zzz * c6.xyz) + r8.xyz;
	r7.xyw = (r7.yyy * c7.xyz) + r8.xyz;
	r7.xyw = (r9.www * c8.xyz) + r7.xyw;
	r7.xyz = (r7.zzz * c9.xyz) + r7.xyw;
	r5.xyz = r5.xyz * r7.xyz;
	r7.x = v7.w;
	r7.y = v8.w;
	r7.z = v9.w;
	r7.xyz = -r7.xyz + c21.xyz;
	r8.xyz = normalize(r7.xyz);
	r2.x = clamp(dot(-v9.xyz, r8.xyz), 0.0, 1.0);
	r2.x = (r2.x * r2.x) + r2.x;
	r2.x = r2.x * c19.x;
	r7.xyz = r2.xxx * r6.xyz;
	r8.xyz = c0.xyz * v6.xyz;
	r7.xyz = (r8.xyz * r7.xyz) + -r5.xyz;
	r2.xyz = (r2.zzz * r7.xyz) + r5.xyz;
	r3.w = r1.x * r13.z;
	r4.w = mix(r13.y, c31.w, r2.w);
	r2.w = r3.w * c0.w;
	r2.xyz = r2.www * r2.xyz;
	r0.xyz = (r0.xyz * r4.www) + r2.xyz;
	r2.x = r9.x * c12.w;
	r15.w = r9.x;
	r2.x = (r2.x * c19.y) + c19.x;
	r2.x = fract(r2.x);
	r2.x = (r2.x * c19.z) + c19.w;
	r5.xy = float2(cos(r2.x), sin(r2.x));
	r2.xyz = r15.zxy * c23.xxx;
	r2.xyz = (r15.zxy * c23.xxx) + -r2.zxy;
	r2.xyz = r5.yyy * r2.xyz;
	r2.xyz = (r15.xyz * r5.xxx) + r2.xyz;
	r2.w = -r5.x + c31.w;
	r3.w = dot(c23.xxx, r15.xyz);
	r3.w = r3.w * c23.x;
	r2.xyz = (r3.www * r2.www) + r2.xyz;
	r3.w = abs(c12.w);
	r2.w = c31.w;
	r2 = ((-r3.w >= 0.0) ? r15 : r2);
	r5.xyz = r2.xyz + c31.yyy;
	r5.xyz = (r1.yyy * r5.xyz) + c31.www;
	r0.xyz = r0.xyz * r5.xyz;
	r5.xyz = r2.xyz * r2.xyz;
	r5.xyz = r5.xyz * r5.xyz;
	r3.w = dot(r2.xyz, c29.xyz);
	r7.xyz = r3.www * r5.xyz;
	r4.w = dot(r5.xyz, c29.xyz);
	r5.xyz = mix(r2.xyz, r3.www, -c101.yyy);
	r3.w = r4.w + c29.w;
	r4.w = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r3.w = ((r3.w >= 0.0) ? r4.w : c32.x);
	r7.xyz = (r7.xyz * r3.www) + -r2.xyz;
	r7.xyz = (c101.yyy * r7.xyz) + r2.xyz;
	r5.xyz = ((c101.y >= 0.0) ? r7.xyz : r5.xyz);
	r3.w = abs(c101.y);
	r5.xyz = ((-r3.w >= 0.0) ? r2.xyz : r5.xyz);
	r7.xy = (r0.ww * r1.ww) + -c33.xw;
	r0.w = r1.w * r0.w;
	r6.xyz = r6.xyz * r0.www;
	r7.zw = -c33.xw + c33.yz;
	r0.w = ((r7.z == 0.0) ? FLT_MAX : 1.0 / r7.z);
	r1.w = ((r7.w == 0.0) ? FLT_MAX : 1.0 / r7.w);
	r1.w = clamp(r1.w * r7.y, 0.0, 1.0);
	r0.w = clamp(r0.w * r7.x, 0.0, 1.0);
	r3.w = (r0.w * c34.x) + c34.y;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r3.w;
	r3.w = (r1.w * c34.x) + c34.y;
	r1.w = r1.w * r1.w;
	r1.w = r1.w * r3.w;
	r0.w = r0.w * r1.w;
	r1.w = (v6.w * c11.w) + r14.w;
	r1.x = r1.x * c105.y;
	r1.x = r1.w * r1.x;
	r6.xyz = r1.xxx * r6.xyz;
	r1.x = r1.y * c101.w;
	r7.xyz = (r2.xyz * r1.xxx) + -c106.xyz;
	r1.x = clamp(r1.x, 0.0, 1.0);
	r1.xyw = (r1.xxx * r7.xyz) + c106.xyz;
	r7.xyz = r1.xyw * r6.xyz;
	r3.w = dot(r7.xyz, c29.xyz);
	r0.w = r0.w * r3.w;
	r0.w = r0.w * c106.w;
	r3.w = dot(r3.xyz, c29.xyz);
	r3.xyz = (r6.xyz * r1.xyw) + r3.xyz;
	r3.x = dot(r3.xyz, c29.xyz);
	r3.x = r3.x + c32.y;
	r3.x = clamp(r3.x * c32.z, 0.0, 1.0);
	r3.yz = r3.ww + -c2.xw;
	r7.xy = -c2.xw + c2.yz;
	r3.w = ((r7.y == 0.0) ? FLT_MAX : 1.0 / r7.y);
	r4.w = ((r7.x == 0.0) ? FLT_MAX : 1.0 / r7.x);
	r3.y = clamp(r3.y * r4.w, 0.0, 1.0);
	r3.z = clamp(r3.w * r3.z, 0.0, 1.0);
	r3.w = (r3.z * c34.x) + c34.y;
	r3.z = r3.z * r3.z;
	r0.w = (r3.w * r3.z) + r0.w;
	r3.z = (r3.y * c34.x) + c34.y;
	r3.y = r3.y * r3.y;
	r3.y = r3.y * r3.z;
	r0.w = r0.w * r3.y;
	r0.w = r2.w * r0.w;
	r3.yzw = mix(r2.xyz, r5.xyz, r0.www);
	r0.w = dot(r3.yzw, c29.xyz);
	r2.xyz = r0.www * c102.xyz;
	r5.xyz = c29.xyz;
	r0.w = dot(c102.xyz, r5.xyz);
	r2.w = r0.w + c29.w;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r2.w >= 0.0) ? r0.w : c32.x);
	r2.xyz = (r2.xyz * r0.www) + -r3.yzw;
	r2.xyz = (c102.www * r2.xyz) + r3.yzw;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r2.xyz = (r2.xyz * r0.www) + -r3.yzw;
	r0.w = (r3.x * c34.x) + c34.y;
	r2.w = r3.x * r3.x;
	r0.w = r0.w * r2.w;
	r2.xyz = (r0.www * r2.xyz) + r3.yzw;
	r2.xyz = r1.zzz * r2.xyz;
	r0.xyz = (r2.xyz * r4.xyz) + r0.xyz;
	r0.xyz = (r6.xyz * r1.xyw) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	oC0.xyz = r0.xyz * c30.xxx;
	oC0.w = c1.w;
	#undef c0
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
	#undef v7
	#undef v8
	#undef v9
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

