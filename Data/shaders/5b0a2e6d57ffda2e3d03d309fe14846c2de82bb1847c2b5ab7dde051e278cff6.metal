#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[31];
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
	const float4 c22 = float4(0.003021148, 0.021148037, 0.012084592, 0.06042296); (void) c22;
	const float4 c23 = float4(0.0, 1.0, -0.400000005, 0.001953125); (void) c23;
	const float4 c24 = float4(-0.000976562, 0.001953125, 0.0, 1.0); (void) c24;
	const float4 c25 = float4(0.001953125, 0.000976562, 0.0, 1.0); (void) c25;
	const float4 c26 = float4(-0.001953125, 0.001953125, 0.0, 1.0); (void) c26;
	const float4 c27 = float4(0.099697888, 0.166163144, 1.399999979, -0.000001); (void) c27;
	const float4 c29 = float4(0.298999992, 0.587000012, 0.114, 1000000.0); (void) c29;
	const float4 c31 = float4(-0.300000011, -3.333333253, -2.0, 3.0); (void) c31;
	const float4 c32 = float4(-0.001953125, 0.000976562, 0.0, 1.0); (void) c32;
	const float4 c34 = float4(-0.001953125, -0.000976562, 0.0, 1.0); (void) c34;
	const float4 c35 = float4(-0.000976562, 0.000976562, 0.0, 1.0); (void) c35;
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
	#define c28 uniforms.uniforms_float4[20]
	#define c30 uniforms.uniforms_float4[21]
	#define c33 uniforms.uniforms_float4[22]
	#define c101 uniforms.uniforms_float4[23]
	#define c102 uniforms.uniforms_float4[24]
	#define c103 uniforms.uniforms_float4[25]
	#define c104 uniforms.uniforms_float4[26]
	#define c105 uniforms.uniforms_float4[27]
	#define c106 uniforms.uniforms_float4[28]
	#define c107 uniforms.uniforms_float4[29]
	#define c109 uniforms.uniforms_float4[30]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define oC0 output.oC0
	r0 = (v5.xyzx * c23.yyyx) + c23.xxxy;
	r1.x = dot(r0, c18);
	r1.y = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r2.x = dot(r0, c15);
	r2.y = dot(r0, c16);
	r2.z = dot(r0, c17);
	r0.xyz = r1.yyy * r2.xyz;
	r2 = r0.xyzx * c23.yyyx;
	r3 = r2 + c23.wwxy;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c26;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c26.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c26.xxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.y = dot(r3, c22.xxxx);
	r3 = r2 + c23.wxxy;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c26.xzzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c23.xwxy;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c26.zxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c22.yyyy);
	r1.y = r1.z + r1.y;
	r3 = r2 + c25;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c25.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c24;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c32;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c22.zzzz);
	r1.y = r1.z + r1.y;
	r3 = r2 + c34;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c34.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c32.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c24.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c22.zzzz);
	r1.y = r1.z + r1.y;
	r3 = r2 + c25.yyzw;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c35;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c35.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c24.xxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c22.wwww);
	r1.y = r1.z + r1.y;
	r3 = r2 + c25.yzzw;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c24.xzzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c24.zxzw;
	r2 = r2 + c25.zyzw;
	r2 = float4(s11_texture.sample_compare(s11, (r2.xyz).xy, (r2.xyz).z));
	r3.w = r2.x;
	r2 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r2.x;
	r1.z = dot(r3, c27.xxxx);
	r1.y = r1.z + r1.y;
	r0.w = c19.y;
	r2 = float4(s11_texture.sample_compare(s11, (r0.xyz).xy, (r0.xyz).z));
	r0 = s8_texture.sample(s8, r0.xy);
	r0.xyz = ((-r1.x >= 0.0) ? c23.xxx : r0.xyz);
	r0.w = (r2.x * c27.y) + r1.y;
	r1.x = pow(abs(r0.w), c27.z);
	r0.w = clamp(r1.x, 0.0, 1.0);
	r1.y = -r0.w + c19.y;
	r0.w = (c109.y * r1.y) + r0.w;
	r2.x = c19.y;
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
	r2.yzw = (r4.xyz * c19.zzz) + c19.www;
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
	r4.x = ((r5.x >= 0.0) ? c23.x : c23.y);
	r4.y = ((r5.y >= 0.0) ? c23.x : c23.y);
	r4.z = ((r5.z >= 0.0) ? c23.x : c23.y);
	r6.xyz = r5.xyz * r5.xyz;
	r4.xyz = r4.xyz * r6.xyz;
	r7.xyz = r4.xxx * c5.xyz;
	r8.x = ((r5.x >= 0.0) ? c23.y : c23.x);
	r8.y = ((r5.y >= 0.0) ? c23.y : c23.x);
	r8.z = ((r5.z >= 0.0) ? c23.y : c23.x);
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
	r2.w = r2.w * c0.y;
	r6.xyz = c20.xyz * v1.xxx;
	r4.xyz = (r6.xyz * r2.www) + r4.xyz;
	r8.z = c23.z;
	r2.w = r8.z * c13.w;
	r2.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r0.w = clamp(r0.w * r2.w, 0.0, 1.0);
	r3.xyz = (r3.xyz * r0.www) + r4.xyz;
	r0.w = r0.w * r2.x;
	r4.xyz = r0.www * c28.xyz;
	r0.xyz = r0.xyz * r4.xyz;
	r4.xyz = r3.xyz + v6.xyz;
	r8.xyz = r4.xyz + -c103.xxx;
	r8.xyz = clamp(r8.xyz * c103.yyy, float3(0.0), float3(1.0));
	r0.w = dot(r5.xyz, r5.xyz);
	r9.xyz = c3.xyz + -v5.xyz;
	r2.w = dot(r9.xyz, r9.xyz);
	r2.w = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r10.xyz = r2.www * r9.xyz;
	r11.xyz = r0.www * r10.xyz;
	r10.z = dot(r10.xyz, r5.xyz);
	r0.w = r10.z + r10.z;
	r10.z = clamp(r10.z, 0.0, 1.0);
	r11.xyz = (r0.www * r5.xyz) + -r11.xyz;
	r11 = s6_texture.sample(s6, r11.xyz);
	r12.xyz = r11.xyz * c30.zzz;
	r13.xyz = r12.xyz * r12.xyz;
	r13.xyz = r13.xyz * r13.xyz;
	r0.w = dot(r13.xyz, c29.xyz);
	r3.w = r0.w + c27.w;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r3.w >= 0.0) ? r0.w : c29.w);
	r3.w = dot(r12.xyz, c29.xyz);
	r13.xyz = r3.www * r13.xyz;
	r11.xyz = (c30.zzz * -r11.xyz) + r3.www;
	r11.xyz = (-c103.www * r11.xyz) + r12.xyz;
	r13.xyz = (r13.xyz * r0.www) + -r12.xyz;
	r13.xyz = (c103.www * r13.xyz) + r12.xyz;
	r11.xyz = ((c103.w >= 0.0) ? r13.xyz : r11.xyz);
	r0.w = abs(c103.w);
	r11.xyz = ((-r0.w >= 0.0) ? r12.xyz : r11.xyz);
	r8.xyz = (r11.xyz * r8.xyz) + -r11.xyz;
	r8.xyz = (c101.xxx * r8.xyz) + r11.xyz;
	r11.xyz = (r8.xyz * r8.xyz) + -r8.xyz;
	r8.xyz = (c103.zzz * r11.xyz) + r8.xyz;
	r11 = s0_texture.sample(s0, v0.xy);
	r12.xyz = r11.www * c104.xyz;
	r8.xyz = r8.xyz * r12.xyz;
	r0.w = -r1.x + c19.y;
	r0.w = (c109.y * r0.w) + r1.x;
	r3.w = clamp(mix(r0.w, r1.x, r2.x), 0.0, 1.0);
	r0.xyz = r0.xyz * r3.www;
	r1.xyz = (r9.xyz * r2.www) + r1.yzw;
	r7.xyz = (r9.xyz * r2.www) + r7.xyz;
	r9.xyz = normalize(r7.xyz);
	r10.x = clamp(dot(r5.xyz, r9.xyz), 0.0, 1.0);
	r7.xyz = normalize(r1.xyz);
	r10.y = clamp(dot(r5.xyz, r7.xyz), 0.0, 1.0);
	r1 = s10_texture.sample(s10, v0.xy);
	r10.w = r1.w;
	r5 = s7_texture.sample(s7, r10.yw);
	r2.xyw = r2.yyy * r5.xyz;
	r0.xyz = r0.xyz * r2.xyw;
	r0.w = ((r2.z == 0.0) ? FLT_MAX : rsqrt(abs(r2.z)));
	r1.w = r2.z * r10.x;
	r2 = s7_texture.sample(s7, r10.xw);
	r5 = s4_texture.sample(s4, r10.zw);
	r2.w = -r10.z + c19.y;
	r3.w = pow(abs(r2.w), c105.x);
	r1.w = r1.w * r3.w;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r2.xyz = r0.www * r2.xyz;
	r0.xyz = (r2.xyz * r6.xyz) + r0.xyz;
	r0.xyz = r4.www * r0.xyz;
	r2.x = mix(c10.x, c10.y, r1.y);
	r0.xyz = (r0.xyz * r2.xxx) + r8.xyz;
	r0.xyz = r5.yyy * r0.xyz;
	r2.xyz = r11.zxy * c19.xxx;
	r2.xyz = (r11.zxy * c19.xxx) + -r2.zxy;
	r5.xy = c0.xy;
	r2.w = (c12.w * r5.x) + r5.y;
	r2.w = fract(r2.w);
	r2.w = (r2.w * c0.z) + c0.w;
	r5.xy = float2(cos(r2.w), sin(r2.w));
	r2.xyz = r2.xyz * r5.yyy;
	r2.xyz = (r11.xyz * r5.xxx) + r2.xyz;
	r2.w = -r5.x + c19.y;
	r3.w = dot(c19.xxx, r11.xyz);
	r3.w = r3.w * c19.x;
	r2.xyz = (r3.www * r2.www) + r2.xyz;
	r2.w = abs(c12.w);
	r2.xyz = ((-r2.w >= 0.0) ? r11.xyz : r2.xyz);
	r5.xyz = r2.xyz + c19.www;
	r5.xyz = (r1.yyy * r5.xyz) + c19.yyy;
	r0.xyz = r0.xyz * r5.xyz;
	r5.xyz = r2.xyz * r2.xyz;
	r5.xyz = r5.xyz * r5.xyz;
	r2.w = dot(r2.xyz, c29.xyz);
	r7.xyz = r2.www * r5.xyz;
	r3.w = dot(r5.xyz, c29.xyz);
	r5.xyz = mix(r2.xyz, r2.www, -c101.yyy);
	r2.w = r3.w + c27.w;
	r3.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r2.w = ((r2.w >= 0.0) ? r3.w : c29.w);
	r7.xyz = (r7.xyz * r2.www) + -r2.xyz;
	r7.xyz = (c101.yyy * r7.xyz) + r2.xyz;
	r5.xyz = ((c101.y >= 0.0) ? r7.xyz : r5.xyz);
	r2.w = abs(c101.y);
	r5.xyz = ((-r2.w >= 0.0) ? r2.xyz : r5.xyz);
	r7.xy = (r1.ww * r0.ww) + -c33.xw;
	r0.w = r0.w * r1.w;
	r6.xyz = r6.xyz * r0.www;
	r7.zw = -c33.xw + c33.yz;
	r0.w = ((r7.z == 0.0) ? FLT_MAX : 1.0 / r7.z);
	r1.w = ((r7.w == 0.0) ? FLT_MAX : 1.0 / r7.w);
	r1.w = clamp(r1.w * r7.y, 0.0, 1.0);
	r0.w = clamp(r0.w * r7.x, 0.0, 1.0);
	r2.w = (r0.w * c31.z) + c31.w;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r2.w;
	r2.w = (r1.w * c31.z) + c31.w;
	r1.w = r1.w * r1.w;
	r1.w = r1.w * r2.w;
	r0.w = r0.w * r1.w;
	r7.y = c19.y;
	r1.w = (v6.w * c11.w) + r7.y;
	r1.x = r1.x * c105.y;
	r1.x = r1.w * r1.x;
	r6.xyz = r1.xxx * r6.xyz;
	r1.x = r1.y * c101.w;
	r7.xyz = (r2.xyz * r1.xxx) + -c106.xyz;
	r1.x = clamp(r1.x, 0.0, 1.0);
	r1.xyw = (r1.xxx * r7.xyz) + c106.xyz;
	r7.xyz = r1.xyw * r6.xyz;
	r2.w = dot(r7.xyz, c29.xyz);
	r0.w = r0.w * r2.w;
	r0.w = r0.w * c106.w;
	r2.w = dot(r3.xyz, c29.xyz);
	r3.xyz = (r6.xyz * r1.xyw) + r3.xyz;
	r3.x = dot(r3.xyz, c29.xyz);
	r3.x = r3.x + c31.x;
	r3.x = clamp(r3.x * c31.y, 0.0, 1.0);
	r3.yz = r2.ww + -c2.xw;
	r7.xy = -c2.xw + c2.yz;
	r2.w = ((r7.y == 0.0) ? FLT_MAX : 1.0 / r7.y);
	r3.w = ((r7.x == 0.0) ? FLT_MAX : 1.0 / r7.x);
	r3.y = clamp(r3.w * r3.y, 0.0, 1.0);
	r2.w = clamp(r2.w * r3.z, 0.0, 1.0);
	r3.z = (r2.w * c31.z) + c31.w;
	r2.w = r2.w * r2.w;
	r0.w = (r3.z * r2.w) + r0.w;
	r2.w = (r3.y * c31.z) + c31.w;
	r3.y = r3.y * r3.y;
	r2.w = r2.w * r3.y;
	r0.w = r0.w * r2.w;
	r3.yzw = mix(r2.xyz, r5.xyz, r0.www);
	r0.w = dot(r3.yzw, c29.xyz);
	r2.xyz = r0.www * c102.xyz;
	r5.xyz = c29.xyz;
	r0.w = dot(c102.xyz, r5.xyz);
	r2.w = r0.w + c27.w;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r2.w >= 0.0) ? r0.w : c29.w);
	r2.xyz = (r2.xyz * r0.www) + -r3.yzw;
	r2.xyz = (c102.www * r2.xyz) + r3.yzw;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r2.xyz = (r2.xyz * r0.www) + -r3.yzw;
	r0.w = (r3.x * c31.z) + c31.w;
	r2.w = r3.x * r3.x;
	r0.w = r0.w * r2.w;
	r2.xyz = (r0.www * r2.xyz) + r3.yzw;
	r2.xyz = r1.zzz * r2.xyz;
	r0.xyz = (r2.xyz * r4.xyz) + r0.xyz;
	r0.xyz = (r6.xyz * r1.xyw) + r0.xyz;
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

