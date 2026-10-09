#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[41];
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
	texture2d<float> s7_texture [[texture(7)]],
	sampler s7 [[sampler(7)]],
	depth2d<float> s8_texture [[texture(8)]],
	sampler s8 [[sampler(8)]],
	texture2d<float> s10_texture [[texture(10)]],
	sampler s10 [[sampler(10)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c13 = float4(1.041666626, -0.020833333, 0.5, 0.062499999); (void) c13;
	const float4 c14 = float4(0.000488281, 0.0, -0.000488281, 0.125); (void) c14;
	const float4 c15 = float4(0.25, 0.159154935, 0.5, 0.57735002); (void) c15;
	const float4 c16 = float4(6.283185478, -3.141592739, 5.0, -0.300000011); (void) c16;
	const float4 c17 = float4(2.0, -1.0, 1.0, 0.0); (void) c17;
	const float4 c18 = float4(0.298999992, 0.587000012, 0.114, -3.333333253); (void) c18;
	const float4 c26 = float4(-2.0, 3.0, -0.000001, 1000000.0); (void) c26;
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
	float4 r17;
	float4 r18;
	float4 r19;
	float4 r20;
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
	#define c19 uniforms.uniforms_float4[13]
	#define c20 uniforms.uniforms_float4[14]
	#define c21 uniforms.uniforms_float4[15]
	#define c22 uniforms.uniforms_float4[16]
	#define c23 uniforms.uniforms_float4[17]
	#define c24 uniforms.uniforms_float4[18]
	#define c25 uniforms.uniforms_float4[19]
	#define c29 uniforms.uniforms_float4[20]
	#define c30 uniforms.uniforms_float4[21]
	#define c33 uniforms.uniforms_float4[22]
	#define c67 uniforms.uniforms_float4[23]
	#define c68 uniforms.uniforms_float4[24]
	#define c69 uniforms.uniforms_float4[25]
	#define c70 uniforms.uniforms_float4[26]
	#define c71 uniforms.uniforms_float4[27]
	#define c73 uniforms.uniforms_float4[28]
	#define c74 uniforms.uniforms_float4[29]
	#define c77 uniforms.uniforms_float4[30]
	#define c78 uniforms.uniforms_float4[31]
	#define c85 uniforms.uniforms_float4[32]
	#define c86 uniforms.uniforms_float4[33]
	#define c87 uniforms.uniforms_float4[34]
	#define c89 uniforms.uniforms_float4[35]
	#define c101 uniforms.uniforms_float4[36]
	#define c102 uniforms.uniforms_float4[37]
	#define c105 uniforms.uniforms_float4[38]
	#define c106 uniforms.uniforms_float4[39]
	#define c107 uniforms.uniforms_float4[40]
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
	r0 = s0_texture.sample(s0, v0.xy);
	oC0.w = r0.w * c1.w;
	r1.xyz = c18.xyz;
	r1.x = dot(c102.xyz, r1.xyz);
	r1.y = r1.x + c26.z;
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.x = ((r1.y >= 0.0) ? r1.x : c26.w);
	r1.yzw = r0.zxy * c15.www;
	r1.yzw = (r0.zxy * c15.www) + -r1.wyz;
	r2 = s3_texture.sample(s3, v0.xy);
	r2.y = r2.x * c12.w;
	r2.y = (r2.y * c15.y) + c15.z;
	r2.y = fract(r2.y);
	r2.y = (r2.y * c16.x) + c16.y;
	r3.xy = float2(cos(r2.y), sin(r2.y));
	r1.yzw = r1.yzw * r3.yyy;
	r1.yzw = (r0.xyz * r3.xxx) + r1.yzw;
	r2.y = -r3.x + c17.z;
	r2.z = dot(c15.www, r0.xyz);
	r2.z = r2.z * c15.w;
	r3.xyz = (r2.zzz * r2.yyy) + r1.yzw;
	r1.y = abs(c12.w);
	r3.w = c17.z;
	r0.w = r2.x;
	r1.z = -r2.w + c17.z;
	r0 = ((-r1.y >= 0.0) ? r0 : r3);
	r2.xyz = r0.xyz * r0.xyz;
	r2.xyz = r2.xyz * r2.xyz;
	r1.y = dot(r2.xyz, c18.xyz);
	r1.w = r1.y + c26.z;
	r1.y = ((r1.y == 0.0) ? FLT_MAX : 1.0 / r1.y);
	r1.y = ((r1.w >= 0.0) ? r1.y : c26.w);
	r1.w = dot(r0.xyz, c18.xyz);
	r2.xyz = r1.www * r2.xyz;
	r3.xyz = mix(r0.xyz, r1.www, -c101.yyy);
	r2.xyz = (r2.xyz * r1.yyy) + -r0.xyz;
	r2.xyz = (c101.yyy * r2.xyz) + r0.xyz;
	r2.xyz = ((c101.y >= 0.0) ? r2.xyz : r3.xyz);
	r1.y = abs(c101.y);
	r2.xyz = ((-r1.y >= 0.0) ? r0.xyz : r2.xyz);
	r3 = s10_texture.sample(s10, v0.xy);
	r1.y = r3.y * c101.w;
	r4.xyz = (r0.xyz * r1.yyy) + -c106.xyz;
	r1.y = clamp(r1.y, 0.0, 1.0);
	r4.xyz = (r1.yyy * r4.xyz) + c106.xyz;
	r5 = (v5.xyzx * c17.zzzw) + c17.wwwz;
	r6.x = dot(r5, c73);
	r6.y = dot(r5, c74);
	r1.yw = (r6.xy * c13.xx) + c13.yy;
	r6.zw = clamp(r1.yw, float2(0.0), float2(1.0));
	r1.yw = -r1.yw + r6.zw;
	r1.y = dot(r1.yw, c17.zz) + c17.w;
	r1.w = dot(r5, c77);
	r7.x = ((-abs(r1.y) >= 0.0) ? r6.x : r1.w);
	r1.w = dot(r5, c78);
	r7.y = ((-abs(r1.y) >= 0.0) ? r6.y : r1.w);
	r6.x = dot(r5, c69);
	r6.y = dot(r5, c70);
	r5.z = dot(r5, c71);
	r6.zw = (r6.xy * c13.xx) + c13.yy;
	r7.zw = clamp(r6.zw, float2(0.0), float2(1.0));
	r6.zw = -r6.zw + r7.zw;
	r1.w = dot(r6.zw, c17.zz) + c17.w;
	r6.xy = ((-abs(r1.w) >= 0.0) ? r6.xy : r7.xy);
	r6.zw = clamp(r6.xy, float2(0.0), float2(1.0));
	r6.xy = r6.xy + -c13.zz;
	r6.xy = abs(r6.xy) + -c67.zz;
	r6.xy = clamp(r6.xy * c67.ww, float2(0.0), float2(1.0));
	r6.xy = -r6.xy + c17.zz;
	r7.xy = c86.xy;
	r7.xy = ((-abs(r1.y) >= 0.0) ? r7.xy : c87.xy);
	r1.y = ((-abs(r1.y) >= 0.0) ? c17.z : c17.w);
	r1.y = ((-abs(r1.w) >= 0.0) ? c17.z : r1.y);
	r7.xy = ((-abs(r1.w) >= 0.0) ? c85.xy : r7.xy);
	r5.xy = (r6.zw * c13.zz) + r7.xy;
	r1.y = clamp((r6.x * r6.y) + r1.y, 0.0, 1.0);
	r5.w = c17.w;
	r6 = r5 + c14.xxyy;
	r6 = float4(s8_texture.sample_compare(s8, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
	r7 = r5 + c14.zxyy;
	r7 = float4(s8_texture.sample_compare(s8, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
	r6.y = r7.x;
	r7 = r5 + c14.xzyy;
	r7 = float4(s8_texture.sample_compare(s8, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
	r6.z = r7.x;
	r7 = r5 + c14.zzyy;
	r7 = float4(s8_texture.sample_compare(s8, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
	r6.w = r7.x;
	r1.w = dot(r6, c13.wwww);
	r6 = r5 + c14.xyyy;
	r6 = float4(s8_texture.sample_compare(s8, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
	r7 = r5 + c14.zyyy;
	r7 = float4(s8_texture.sample_compare(s8, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
	r6.y = r7.x;
	r7 = r5 + c14.yzyy;
	r7 = float4(s8_texture.sample_compare(s8, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
	r6.z = r7.x;
	r7 = r5 + c14.yxyy;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
	r7 = float4(s8_texture.sample_compare(s8, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
	r6.w = r7.x;
	r2.w = dot(r6, c14.wwww);
	r1.w = r1.w + r2.w;
	r1.w = (r5.x * c15.x) + r1.w;
	r1.w = r1.w + c17.y;
	r1.y = (r1.y * r1.w) + c17.z;
	r5.xyz = -c89.xyz + v5.xyz;
	r1.w = dot(r5.xyz, r5.xyz);
	r1.w = clamp((r1.w * c68.y) + c68.x, 0.0, 1.0);
	r2.w = mix(r1.y, c17.z, r1.w);
	r5.xyz = c22.xyz * v1.yyy;
	r6.xyz = c23.xyz + -v5.xyz;
	r7.xyz = normalize(r6.xyz);
	r6.xyz = c3.xyz + -v5.xyz;
	r1.y = dot(r6.xyz, r6.xyz);
	r1.y = ((r1.y == 0.0) ? FLT_MAX : rsqrt(abs(r1.y)));
	r8.xyz = (r6.xyz * r1.yyy) + r7.xyz;
	r9.xyz = normalize(r8.xyz);
	r8 = s1_texture.sample(s1, v0.xy);
	r8.xyz = (r8.xyz * c17.xxx) + c17.yyy;
	r10.x = dot(v2.xyz, r8.xyz);
	r10.y = dot(v3.xyz, r8.xyz);
	r10.z = dot(v4.xyz, r8.xyz);
	r8.xyz = normalize(r10.xyz);
	r9.x = clamp(dot(r8.xyz, r9.xyz), 0.0, 1.0);
	r1.w = clamp(dot(r8.xyz, r7.xyz), 0.0, 1.0);
	r4.w = r1.w * r9.x;
	r10.xyz = r1.yyy * r6.xyz;
	r5.w = dot(r10.xyz, r8.xyz);
	r9.z = clamp(r5.w, 0.0, 1.0);
	r5.w = r5.w + r5.w;
	r6.w = -r9.z + c17.z;
	r7.w = pow(abs(r6.w), c105.x);
	r4.w = r4.w * r7.w;
	r6.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.w = (r1.w * r1.w) + r1.w;
	r1.w = r1.w * c13.z;
	r6.w = ((r6.w == 0.0) ? FLT_MAX : 1.0 / r6.w);
	r4.w = r4.w * r6.w;
	r11.xyz = r5.xyz * r4.www;
	r12.xyz = c21.xyz + -v5.xyz;
	r13.xyz = normalize(r12.xyz);
	r12.xyz = (r6.xyz * r1.yyy) + r13.xyz;
	r14.xyz = normalize(r12.xyz);
	r9.y = clamp(dot(r8.xyz, r14.xyz), 0.0, 1.0);
	r10.w = clamp(dot(r8.xyz, r13.xyz), 0.0, 1.0);
	r11.w = r9.y * r10.w;
	r11.w = r7.w * r11.w;
	r12.x = ((r10.w == 0.0) ? FLT_MAX : rsqrt(abs(r10.w)));
	r10.w = (r10.w * r10.w) + r10.w;
	r10.w = r10.w * c13.z;
	r12.x = ((r12.x == 0.0) ? FLT_MAX : 1.0 / r12.x);
	r12.y = r11.w * r12.x;
	r4.w = (r11.w * r12.x) + r4.w;
	r14.xyz = c20.xyz * v1.xxx;
	r12.yzw = r12.yyy * r14.xyz;
	r11.xyz = (r12.yzw * r2.www) + r11.xyz;
	r12.yzw = c24.xyz * v1.zzz;
	r15.xyz = c25.xyz + -v5.xyz;
	r16.xyz = normalize(r15.xyz);
	r15.xyz = (r6.xyz * r1.yyy) + r16.xyz;
	r17.xyz = normalize(r15.xyz);
	r15.y = clamp(dot(r8.xyz, r17.xyz), 0.0, 1.0);
	r11.w = clamp(dot(r8.xyz, r16.xyz), 0.0, 1.0);
	r13.w = clamp(dot(r10.xyz, r16.xyz), 0.0, 1.0);
	r14.w = r11.w * r15.y;
	r14.w = r7.w * r14.w;
	r15.w = ((r11.w == 0.0) ? FLT_MAX : rsqrt(abs(r11.w)));
	r11.w = (r11.w * r11.w) + r11.w;
	r11.w = r11.w * c13.z;
	r15.w = ((r15.w == 0.0) ? FLT_MAX : 1.0 / r15.w);
	r16.x = r14.w * r15.w;
	r4.w = (r14.w * r15.w) + r4.w;
	r11.xyz = (r16.xxx * r12.yzw) + r11.xyz;
	r16.x = c20.w * v1.w;
	r16.y = c21.w * v1.w;
	r16.z = c22.w * v1.w;
	r17.x = c23.w + -v5.x;
	r17.y = c24.w + -v5.y;
	r17.z = c25.w + -v5.z;
	r18.xyz = normalize(r17.xyz);
	r17.xyz = (r6.xyz * r1.yyy) + r18.xyz;
	r19.xyz = normalize(r17.xyz);
	r15.x = clamp(dot(r8.xyz, r19.xyz), 0.0, 1.0);
	r14.w = clamp(dot(r8.xyz, r18.xyz), 0.0, 1.0);
	r16.w = clamp(dot(r10.xyz, r18.xyz), 0.0, 1.0);
	r17.x = r14.w * r15.x;
	r17.x = r7.w * r17.x;
	r17.y = ((r14.w == 0.0) ? FLT_MAX : rsqrt(abs(r14.w)));
	r14.w = (r14.w * r14.w) + r14.w;
	r14.w = r14.w * c13.z;
	r17.y = ((r17.y == 0.0) ? FLT_MAX : 1.0 / r17.y);
	r17.z = r17.y * r17.x;
	r4.w = (r17.x * r17.y) + r4.w;
	r17.xw = r4.ww + -c33.xw;
	r11.xyz = (r17.zzz * r16.xyz) + r11.xyz;
	r17.z = c17.z;
	r4.w = (v6.w * c11.w) + r17.z;
	r17.z = r3.x * c105.y;
	r4.w = r4.w * r17.z;
	r11.xyz = r4.www * r11.xyz;
	r18.xyz = r4.xyz * r11.xyz;
	r4.w = dot(r18.xyz, c18.xyz);
	r18.xy = -c33.xw + c33.yz;
	r17.z = ((r18.x == 0.0) ? FLT_MAX : 1.0 / r18.x);
	r18.x = ((r18.y == 0.0) ? FLT_MAX : 1.0 / r18.y);
	r17.w = clamp(r17.w * r18.x, 0.0, 1.0);
	r17.x = clamp(r17.z * r17.x, 0.0, 1.0);
	r17.z = (r17.x * c26.x) + c26.y;
	r17.x = r17.x * r17.x;
	r17.x = r17.x * r17.z;
	r17.z = (r17.w * c26.x) + c26.y;
	r17.w = r17.w * r17.w;
	r17.z = r17.w * r17.z;
	r17.x = r17.z * r17.x;
	r4.w = r4.w * r17.x;
	r4.w = r4.w * c106.w;
	r17.x = ((r8.x >= 0.0) ? c17.w : c17.z);
	r17.z = ((r8.y >= 0.0) ? c17.w : c17.z);
	r17.w = ((r8.z >= 0.0) ? c17.w : c17.z);
	r18.xyz = r8.xyz * r8.xyz;
	r17.xzw = r17.xzw * r18.xyz;
	r19.xyz = r17.xxx * c5.xyz;
	r20.x = ((r8.x >= 0.0) ? c17.z : c17.w);
	r20.y = ((r8.y >= 0.0) ? c17.z : c17.w);
	r20.z = ((r8.z >= 0.0) ? c17.z : c17.w);
	r18.xyz = r18.xyz * r20.xyz;
	r19.xyz = (r18.xxx * c4.xyz) + r19.xyz;
	r18.xyw = (r18.yyy * c6.xyz) + r19.xyz;
	r18.xyw = (r17.zzz * c7.xyz) + r18.xyw;
	r18.xyz = (r18.zzz * c8.xyz) + r18.xyw;
	r17.xzw = (r17.www * c9.xyz) + r18.xyz;
	r18.xyz = r10.www * r14.xyz;
	r17.xzw = (r18.xyz * r2.www) + r17.xzw;
	r17.xzw = (r5.xyz * r1.www) + r17.xzw;
	r17.xzw = (r12.yzw * r11.www) + r17.xzw;
	r17.xzw = (r16.xyz * r14.www) + r17.xzw;
	r1.w = dot(r17.xzw, c18.xyz);
	r18.xy = r1.ww + -c2.xw;
	r18.zw = -c2.xw + c2.yz;
	r1.w = ((r18.w == 0.0) ? FLT_MAX : 1.0 / r18.w);
	r10.w = ((r18.z == 0.0) ? FLT_MAX : 1.0 / r18.z);
	r10.w = clamp(r10.w * r18.x, 0.0, 1.0);
	r1.w = clamp(r1.w * r18.y, 0.0, 1.0);
	r11.w = (r1.w * c26.x) + c26.y;
	r1.w = r1.w * r1.w;
	r1.w = (r11.w * r1.w) + r4.w;
	r4.w = (r10.w * c26.x) + c26.y;
	r10.w = r10.w * r10.w;
	r4.w = r4.w * r10.w;
	r1.w = r1.w * r4.w;
	r0.w = r0.w * r1.w;
	r18.xyz = mix(r0.xyz, r2.xyz, r0.www);
	r0.xyz = r0.xyz + c17.yyy;
	r0.xyz = (r3.yyy * r0.xyz) + c17.zzz;
	r0.w = dot(r18.xyz, c18.xyz);
	r2.xyz = r0.www * c102.xyz;
	r2.xyz = (r2.xyz * r1.xxx) + -r18.xyz;
	r2.xyz = (c102.www * r2.xyz) + r18.xyz;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r2.xyz = (r2.xyz * r0.www) + -r18.xyz;
	r19.xyz = (r11.xyz * r4.xyz) + r17.xzw;
	r17.xzw = r17.xzw + v6.xyz;
	r0.w = dot(r19.xyz, c18.xyz);
	r0.w = r0.w + c16.w;
	r0.w = clamp(r0.w * c18.w, 0.0, 1.0);
	r1.x = (r0.w * c26.x) + c26.y;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.x;
	r2.xyz = (r0.www * r2.xyz) + r18.xyz;
	r2.xyz = r3.zzz * r2.xyz;
	r0.w = clamp(dot(r10.xyz, r13.xyz), 0.0, 1.0);
	r1.x = clamp(r13.z, 0.0, 1.0);
	r1.x = (r1.x * r1.x) + r1.x;
	r1.x = r1.x * c13.z;
	r13.xyz = r1.xxx * r14.xyz;
	r1.x = r9.z * r9.z;
	r18.w = r1.x * r1.x;
	r1.x = r1.z * r18.w;
	r19.xyz = r1.xxx * v6.xyz;
	r18.xyz = r19.xyz * c16.zzz;
	r18 = ((-r1.z >= 0.0) ? c17.wwww : r18);
	r0.w = r0.w * r18.w;
	r9.w = r3.w;
	r19 = s7_texture.sample(s7, r9.yw);
	r20.xyz = (r0.www * c16.zzz) + -r19.xyz;
	r20.xyz = (r1.zzz * r20.xyz) + r19.xyz;
	r19.xyz = ((-r1.z >= 0.0) ? r19.xyz : r20.xyz);
	r19.xyz = r12.xxx * r19.xyz;
	r19.xyz = r14.xyz * r19.xyz;
	r18.xyz = (r19.xyz * r2.www) + r18.xyz;
	r0.w = clamp(dot(r10.xyz, r7.xyz), 0.0, 1.0);
	r0.w = r0.w * r18.w;
	r19 = s7_texture.sample(s7, r9.xw);
	r7.xyz = (r0.www * c16.zzz) + -r19.xyz;
	r7.xyz = (r1.zzz * r7.xyz) + r19.xyz;
	r7.xyz = ((-r1.z >= 0.0) ? r19.xyz : r7.xyz);
	r7.xyz = r6.www * r7.xyz;
	r5.xyz = (r7.xyz * r5.xyz) + r18.xyz;
	r0.w = r13.w * r18.w;
	r1.x = r16.w * r18.w;
	r15.z = r9.w;
	r9 = s4_texture.sample(s4, r9.zw);
	r18 = s7_texture.sample(s7, r15.yz);
	r19 = s7_texture.sample(s7, r15.xz);
	r7.xyz = (r0.www * c16.zzz) + -r18.xyz;
	r7.xyz = (r1.zzz * r7.xyz) + r18.xyz;
	r7.xyz = ((-r1.z >= 0.0) ? r18.xyz : r7.xyz);
	r7.xyz = r15.www * r7.xyz;
	r5.xyz = (r7.xyz * r12.yzw) + r5.xyz;
	r7.xyz = (r1.xxx * c16.zzz) + -r19.xyz;
	r7.xyz = (r1.zzz * r7.xyz) + r19.xyz;
	r7.xyz = ((-r1.z >= 0.0) ? r19.xyz : r7.xyz);
	r0.w = mix(r9.y, c17.z, r1.z);
	r1.x = r3.x * r9.z;
	r1.x = r1.x * c0.w;
	r7.xyz = r17.yyy * r7.xyz;
	r5.xyz = (r7.xyz * r16.xyz) + r5.xyz;
	r5.xyz = r8.www * r5.xyz;
	r1.z = mix(c10.x, c10.y, r3.y);
	r3.yzw = r1.zzz * r5.xyz;
	r5.x = v7.w;
	r5.y = v8.w;
	r5.z = v9.w;
	r5.xyz = -r5.xyz + c21.xyz;
	r7.xyz = normalize(r5.xyz);
	r1.z = clamp(dot(-v9.xyz, r7.xyz), 0.0, 1.0);
	r1.z = (r1.z * r1.z) + r1.z;
	r1.z = r1.z * c13.z;
	r5.xyz = r1.zzz * r14.xyz;
	r1.z = dot(r8.xyz, r8.xyz);
	r7.xyz = r10.xyz * r1.zzz;
	r7.xyz = (r5.www * r8.xyz) + -r7.xyz;
	r9.x = ((r7.x >= 0.0) ? c17.w : c17.z);
	r9.y = ((r7.y >= 0.0) ? c17.w : c17.z);
	r9.z = ((r7.z >= 0.0) ? c17.w : c17.z);
	r10.xyz = r7.xyz * r7.xyz;
	r7.x = ((r7.x >= 0.0) ? c17.z : c17.w);
	r7.y = ((r7.y >= 0.0) ? c17.z : c17.w);
	r7.z = ((r7.z >= 0.0) ? c17.z : c17.w);
	r7.xyz = r10.xyz * r7.xyz;
	r9.xyz = r9.xyz * r10.xyz;
	r10.xyz = r9.xxx * c5.xyz;
	r10.xyz = (r7.xxx * c4.xyz) + r10.xyz;
	r10.xyz = (r7.yyy * c6.xyz) + r10.xyz;
	r9.xyw = (r9.yyy * c7.xyz) + r10.xyz;
	r7.xyz = (r7.zzz * c8.xyz) + r9.xyw;
	r7.xyz = (r9.zzz * c9.xyz) + r7.xyz;
	r7.xyz = r13.xyz * r7.xyz;
	r9.xyz = c0.xyz * v6.xyz;
	r5.xyz = (r9.xyz * r5.xyz) + -r7.xyz;
	r1.z = clamp(dot(r8.xyz, v9.xyz), 0.0, 1.0);
	r5.xyz = (r1.zzz * r5.xyz) + r7.xyz;
	r1.xzw = r1.xxx * r5.xyz;
	r1.xzw = (r3.yzw * r0.www) + r1.xzw;
	r0.xyz = r0.xyz * r1.xzw;
	r0.xyz = (r2.xyz * r17.xzw) + r0.xyz;
	r0.xyz = (r11.xyz * r4.xyz) + r0.xyz;
	r2.x = v2.w;
	r2.y = v3.w;
	r2.z = v4.w;
	r1.xzw = (r6.xyz * r1.yyy) + r2.xyz;
	r0.w = ((r1.y == 0.0) ? FLT_MAX : 1.0 / r1.y);
	r0.w = clamp((r0.w * c19.w) + c19.x, 0.0, 1.0);
	r1.y = min(r0.w, c19.z);
	r0.w = r1.y * r1.y;
	r1.y = clamp(dot(r8.xyz, r2.xyz), 0.0, 1.0);
	r2.xyz = normalize(r1.xzw);
	r1.x = clamp(dot(r8.xyz, r2.xyz), 0.0, 1.0);
	r1.x = r1.y * r1.x;
	r1.y = ((r1.y == 0.0) ? FLT_MAX : rsqrt(abs(r1.y)));
	r1.y = ((r1.y == 0.0) ? FLT_MAX : 1.0 / r1.y);
	r1.x = r7.w * r1.x;
	r1.x = r1.y * r1.x;
	r1.yzw = v6.www * v6.xyz;
	r1.yzw = r1.yzw * c107.xyz;
	r1.xyz = r1.yzw * r1.xxx;
	r0.xyz = (r1.xyz * r3.xxx) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	oC0.xyz = (r0.www * r0.xyz) + r1.xyz;
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
	#undef c19
	#undef c20
	#undef c21
	#undef c22
	#undef c23
	#undef c24
	#undef c25
	#undef c29
	#undef c30
	#undef c33
	#undef c67
	#undef c68
	#undef c69
	#undef c70
	#undef c71
	#undef c73
	#undef c74
	#undef c77
	#undef c78
	#undef c85
	#undef c86
	#undef c87
	#undef c89
	#undef c101
	#undef c102
	#undef c105
	#undef c106
	#undef c107
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

