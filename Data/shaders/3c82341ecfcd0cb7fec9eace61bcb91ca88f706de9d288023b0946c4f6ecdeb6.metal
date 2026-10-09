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
	const float4 c16 = float4(2.0, -1.0, 1.0, 0.0); (void) c16;
	const float4 c17 = float4(6.283185478, -3.141592739, 0.499999584, 0.5); (void) c17;
	const float4 c18 = float4(5.0, 0.298999992, 0.587000012, 0.114); (void) c18;
	const float4 c26 = float4(-0.300000011, -3.333333253, -2.0, 3.0); (void) c26;
	const float4 c27 = float4(-0.000001, 1000000.0, 0.0, 0.0); (void) c27;
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
	float4 r21;
	float4 r22;
	float4 r23;
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
	r1.yzw = c18.yzw;
	r1.x = dot(c102.xyz, r1.yzw);
	r1.y = r1.x + c27.x;
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.x = ((r1.y >= 0.0) ? r1.x : c27.y);
	r1.yzw = r0.zxy * c15.www;
	r1.yzw = (r0.zxy * c15.www) + -r1.wyz;
	r2 = s3_texture.sample(s3, v0.xy);
	r2.z = r2.x * c12.w;
	r2.z = (r2.z * c15.y) + c15.z;
	r2.z = fract(r2.z);
	r2.z = (r2.z * c17.x) + c17.y;
	r3.xy = float2(cos(r2.z), sin(r2.z));
	r1.yzw = r1.yzw * r3.yyy;
	r1.yzw = (r0.xyz * r3.xxx) + r1.yzw;
	r2.z = -r3.x + c16.z;
	r3.x = dot(c15.www, r0.xyz);
	r3.x = r3.x * c15.w;
	r3.xyz = (r3.xxx * r2.zzz) + r1.yzw;
	r1.y = abs(c12.w);
	r3.w = c16.z;
	r0.w = r2.x;
	r0 = ((-r1.y >= 0.0) ? r0 : r3);
	r1.yzw = r0.xyz * r0.xyz;
	r1.yzw = r1.yzw * r1.yzw;
	r2.x = dot(r1.yzw, c18.yzw);
	r2.z = r2.x + c27.x;
	r2.x = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r2.x = ((r2.z >= 0.0) ? r2.x : c27.y);
	r2.z = dot(r0.xyz, c18.yzw);
	r1.yzw = r1.yzw * r2.zzz;
	r3.xyz = mix(r0.xyz, r2.zzz, -c101.yyy);
	r1.yzw = (r1.yzw * r2.xxx) + -r0.xyz;
	r1.yzw = (c101.yyy * r1.yzw) + r0.xyz;
	r1.yzw = ((c101.y >= 0.0) ? r1.yzw : r3.xyz);
	r2.x = abs(c101.y);
	r1.yzw = ((-r2.x >= 0.0) ? r0.xyz : r1.yzw);
	r3 = (v5.xyzx * c16.zzzw) + c16.wwwz;
	r4.x = dot(r3, c73);
	r4.y = dot(r3, c74);
	r2.xz = (r4.xy * c13.xx) + c13.yy;
	r4.zw = clamp(r2.xz, float2(0.0), float2(1.0));
	r2.xz = -r2.xz + r4.zw;
	r2.x = dot(r2.xz, c16.zz) + c16.w;
	r2.z = dot(r3, c77);
	r5.x = ((-abs(r2.x) >= 0.0) ? r4.x : r2.z);
	r2.z = dot(r3, c78);
	r5.y = ((-abs(r2.x) >= 0.0) ? r4.y : r2.z);
	r4.x = dot(r3, c69);
	r4.y = dot(r3, c70);
	r3.z = dot(r3, c71);
	r4.zw = (r4.xy * c13.xx) + c13.yy;
	r5.zw = clamp(r4.zw, float2(0.0), float2(1.0));
	r4.zw = -r4.zw + r5.zw;
	r2.z = dot(r4.zw, c16.zz) + c16.w;
	r4.xy = ((-abs(r2.z) >= 0.0) ? r4.xy : r5.xy);
	r4.zw = clamp(r4.xy, float2(0.0), float2(1.0));
	r4.xy = r4.xy + -c13.zz;
	r4.xy = abs(r4.xy) + -c67.zz;
	r4.xy = clamp(r4.xy * c67.ww, float2(0.0), float2(1.0));
	r4.xy = -r4.xy + c16.zz;
	r5.xy = c86.xy;
	r5.xy = ((-abs(r2.x) >= 0.0) ? r5.xy : c87.xy);
	r2.x = ((-abs(r2.x) >= 0.0) ? c16.z : c16.w);
	r2.x = ((-abs(r2.z) >= 0.0) ? c16.z : r2.x);
	r5.xy = ((-abs(r2.z) >= 0.0) ? c85.xy : r5.xy);
	r3.xy = (r4.zw * c13.zz) + r5.xy;
	r2.x = clamp((r4.x * r4.y) + r2.x, 0.0, 1.0);
	r3.w = c16.w;
	r4 = r3 + c14.xxyy;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
	r5 = r3 + c14.zxyy;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
	r4.y = r5.x;
	r5 = r3 + c14.xzyy;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
	r4.z = r5.x;
	r5 = r3 + c14.zzyy;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
	r4.w = r5.x;
	r2.z = dot(r4, c13.wwww);
	r4 = r3 + c14.xyyy;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
	r5 = r3 + c14.zyyy;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
	r4.y = r5.x;
	r5 = r3 + c14.yzyy;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
	r4.z = r5.x;
	r5 = r3 + c14.yxyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
	r4.w = r5.x;
	r3.y = dot(r4, c14.wwww);
	r2.z = r2.z + r3.y;
	r2.z = (r3.x * c15.x) + r2.z;
	r2.z = r2.z + c16.y;
	r2.x = (r2.x * r2.z) + c16.z;
	r3.xyz = -c89.xyz + v5.xyz;
	r2.z = dot(r3.xyz, r3.xyz);
	r2.z = clamp((r2.z * c68.y) + c68.x, 0.0, 1.0);
	r3.x = mix(r2.x, c16.z, r2.z);
	r3.yzw = c23.xyz + -v5.xyz;
	r4.xyz = normalize(r3.yzw);
	r2.x = (r2.y * c17.z) + c17.w;
	r2.x = fract(r2.x);
	r2.x = (r2.x * c17.x) + c17.y;
	r5.xy = float2(cos(r2.x), sin(r2.x));
	r6 = s1_texture.sample(s1, v0.xy);
	r3.yzw = (r6.xyz * c16.xxx) + c16.yyy;
	r6.x = dot(v2.xyz, r3.yzw);
	r6.y = dot(v3.xyz, r3.yzw);
	r6.z = dot(v4.xyz, r3.yzw);
	r7.xyz = normalize(r6.xyz);
	r3.yzw = r7.zxy * v8.yzx;
	r3.yzw = (r7.yzx * v8.zxy) + -r3.yzw;
	r6.xyz = normalize(r3.yzw);
	r3.yzw = r5.xxx * r6.xyz;
	r5.xzw = r6.yzx * r7.zxy;
	r5.xzw = (r7.yzx * r6.zxy) + -r5.xzw;
	r6.xyz = normalize(r5.xzw);
	r3.yzw = (r5.yyy * r6.xyz) + r3.yzw;
	r5.xyz = normalize(r3.yzw);
	r2.x = dot(r4.xyz, r5.xxx);
	r2.z = (r2.x * -r2.x) + c16.z;
	r2.z = ((r2.z == 0.0) ? FLT_MAX : rsqrt(abs(r2.z)));
	r2.z = ((r2.z == 0.0) ? FLT_MAX : 1.0 / r2.z);
	r3.yzw = c3.xyz + -v5.xyz;
	r4.w = dot(r3.yzw, r3.yzw);
	r4.w = ((r4.w == 0.0) ? FLT_MAX : rsqrt(abs(r4.w)));
	r6.xyz = r3.yzw * r4.www;
	r5.w = dot(r6.xyz, r5.xyz);
	r7.w = (r5.w * -r5.w) + c16.z;
	r7.w = ((r7.w == 0.0) ? FLT_MAX : rsqrt(abs(r7.w)));
	r7.w = ((r7.w == 0.0) ? FLT_MAX : 1.0 / r7.w);
	r2.z = r2.z * r7.w;
	r2.x = clamp((r5.w * r2.x) + r2.z, 0.0, 1.0);
	r8.zw = c16.zw;
	r2.y = ((-r2.y >= 0.0) ? r8.w : c10.w);
	r2.z = -r2.w + c16.z;
	r8.xyw = (r3.yzw * r4.www) + r4.xyz;
	r9.xyz = normalize(r8.xyw);
	r2.w = clamp(dot(r7.xyz, r9.xyz), 0.0, 1.0);
	r9.x = mix(r2.w, r2.x, r2.y);
	r2.x = clamp(dot(r7.xyz, r4.xyz), 0.0, 1.0);
	r2.w = clamp(dot(r6.xyz, r4.xyz), 0.0, 1.0);
	r4.x = r2.x * r9.x;
	r9.z = clamp(dot(r6.xyz, r7.xyz), 0.0, 1.0);
	r4.y = -r9.z + c16.z;
	r8.x = pow(abs(r4.y), c105.x);
	r4.x = r4.x * r8.x;
	r4.y = ((r2.x == 0.0) ? FLT_MAX : rsqrt(abs(r2.x)));
	r2.x = (r2.x * r2.x) + r2.x;
	r2.x = r2.x * c13.z;
	r4.y = ((r4.y == 0.0) ? FLT_MAX : 1.0 / r4.y);
	r4.x = r4.y * r4.x;
	r10.xyz = c22.xyz * v1.yyy;
	r11.xyz = r4.xxx * r10.xyz;
	r12.xyz = c21.xyz + -v5.xyz;
	r13.xyz = normalize(r12.xyz);
	r4.z = dot(r13.xyz, r5.xxx);
	r8.y = (r4.z * -r4.z) + c16.z;
	r8.y = ((r8.y == 0.0) ? FLT_MAX : rsqrt(abs(r8.y)));
	r8.y = ((r8.y == 0.0) ? FLT_MAX : 1.0 / r8.y);
	r8.y = r7.w * r8.y;
	r4.z = clamp((r5.w * r4.z) + r8.y, 0.0, 1.0);
	r12.xyz = (r3.yzw * r4.www) + r13.xyz;
	r14.xyz = normalize(r12.xyz);
	r8.y = clamp(dot(r7.xyz, r14.xyz), 0.0, 1.0);
	r9.y = mix(r8.y, r4.z, r2.y);
	r4.z = clamp(dot(r7.xyz, r13.xyz), 0.0, 1.0);
	r8.y = r4.z * r9.y;
	r8.y = r8.x * r8.y;
	r8.w = ((r4.z == 0.0) ? FLT_MAX : rsqrt(abs(r4.z)));
	r4.z = (r4.z * r4.z) + r4.z;
	r4.z = r4.z * c13.z;
	r8.w = ((r8.w == 0.0) ? FLT_MAX : 1.0 / r8.w);
	r10.w = r8.w * r8.y;
	r4.x = (r8.y * r8.w) + r4.x;
	r12.xyz = c20.xyz * v1.xxx;
	r14.xyz = r10.www * r12.xyz;
	r11.xyz = (r14.xyz * r3.xxx) + r11.xyz;
	r14.xyz = c25.xyz + -v5.xyz;
	r15.xyz = normalize(r14.xyz);
	r8.y = dot(r15.xyz, r5.xxx);
	r10.w = (r8.y * -r8.y) + c16.z;
	r10.w = ((r10.w == 0.0) ? FLT_MAX : rsqrt(abs(r10.w)));
	r10.w = ((r10.w == 0.0) ? FLT_MAX : 1.0 / r10.w);
	r10.w = r7.w * r10.w;
	r8.y = clamp((r5.w * r8.y) + r10.w, 0.0, 1.0);
	r14.xyz = (r3.yzw * r4.www) + r15.xyz;
	r16.xyz = normalize(r14.xyz);
	r10.w = clamp(dot(r7.xyz, r16.xyz), 0.0, 1.0);
	r14.y = mix(r10.w, r8.y, r2.y);
	r8.y = clamp(dot(r7.xyz, r15.xyz), 0.0, 1.0);
	r10.w = clamp(dot(r6.xyz, r15.xyz), 0.0, 1.0);
	r11.w = r8.y * r14.y;
	r11.w = r8.x * r11.w;
	r12.w = ((r8.y == 0.0) ? FLT_MAX : rsqrt(abs(r8.y)));
	r8.y = (r8.y * r8.y) + r8.y;
	r8.y = r8.y * c13.z;
	r12.w = ((r12.w == 0.0) ? FLT_MAX : 1.0 / r12.w);
	r13.w = r11.w * r12.w;
	r4.x = (r11.w * r12.w) + r4.x;
	r15.xyz = c24.xyz * v1.zzz;
	r11.xyz = (r13.www * r15.xyz) + r11.xyz;
	r16.x = c23.w + -v5.x;
	r16.y = c24.w + -v5.y;
	r16.z = c25.w + -v5.z;
	r17.xyz = normalize(r16.xyz);
	r11.w = dot(r17.xyz, r5.xxx);
	r13.w = (r11.w * -r11.w) + c16.z;
	r13.w = ((r13.w == 0.0) ? FLT_MAX : rsqrt(abs(r13.w)));
	r13.w = ((r13.w == 0.0) ? FLT_MAX : 1.0 / r13.w);
	r7.w = r7.w * r13.w;
	r5.w = clamp((r5.w * r11.w) + r7.w, 0.0, 1.0);
	r16.xyz = (r3.yzw * r4.www) + r17.xyz;
	r18.xyz = normalize(r16.xyz);
	r7.w = clamp(dot(r7.xyz, r18.xyz), 0.0, 1.0);
	r14.x = mix(r7.w, r5.w, r2.y);
	r5.w = clamp(dot(r7.xyz, r17.xyz), 0.0, 1.0);
	r7.w = clamp(dot(r6.xyz, r17.xyz), 0.0, 1.0);
	r11.w = r5.w * r14.x;
	r11.w = r8.x * r11.w;
	r13.w = ((r5.w == 0.0) ? FLT_MAX : rsqrt(abs(r5.w)));
	r5.w = (r5.w * r5.w) + r5.w;
	r5.w = r5.w * c13.z;
	r13.w = ((r13.w == 0.0) ? FLT_MAX : 1.0 / r13.w);
	r14.w = r11.w * r13.w;
	r4.x = (r11.w * r13.w) + r4.x;
	r16.xy = r4.xx + -c33.xw;
	r17.x = c20.w * v1.w;
	r17.y = c21.w * v1.w;
	r17.z = c22.w * v1.w;
	r11.xyz = (r14.www * r17.xyz) + r11.xyz;
	r4.x = (v6.w * c11.w) + r8.z;
	r18 = s10_texture.sample(s10, v0.xy);
	r8.z = r18.x * c105.y;
	r4.x = r4.x * r8.z;
	r11.xyz = r4.xxx * r11.xyz;
	r4.x = r18.y * c101.w;
	r19.xyz = (r0.xyz * r4.xxx) + -c106.xyz;
	r4.x = clamp(r4.x, 0.0, 1.0);
	r19.xyz = (r4.xxx * r19.xyz) + c106.xyz;
	r20.xyz = r11.xyz * r19.xyz;
	r4.x = dot(r20.xyz, c18.yzw);
	r16.zw = -c33.xw + c33.yz;
	r8.z = ((r16.z == 0.0) ? FLT_MAX : 1.0 / r16.z);
	r11.w = ((r16.w == 0.0) ? FLT_MAX : 1.0 / r16.w);
	r11.w = clamp(r11.w * r16.y, 0.0, 1.0);
	r8.z = clamp(r8.z * r16.x, 0.0, 1.0);
	r14.w = (r8.z * c26.z) + c26.w;
	r8.z = r8.z * r8.z;
	r8.z = r8.z * r14.w;
	r14.w = (r11.w * c26.z) + c26.w;
	r11.w = r11.w * r11.w;
	r11.w = r11.w * r14.w;
	r8.z = r8.z * r11.w;
	r4.x = r4.x * r8.z;
	r4.x = r4.x * c106.w;
	r16.x = ((r7.x >= 0.0) ? c16.w : c16.z);
	r16.y = ((r7.y >= 0.0) ? c16.w : c16.z);
	r16.z = ((r7.z >= 0.0) ? c16.w : c16.z);
	r20.xyz = r7.xyz * r7.xyz;
	r16.xyz = r16.xyz * r20.xyz;
	r21.xyz = r16.xxx * c5.xyz;
	r22.x = ((r7.x >= 0.0) ? c16.z : c16.w);
	r22.y = ((r7.y >= 0.0) ? c16.z : c16.w);
	r22.z = ((r7.z >= 0.0) ? c16.z : c16.w);
	r20.xyz = r20.xyz * r22.xyz;
	r21.xyz = (r20.xxx * c4.xyz) + r21.xyz;
	r20.xyw = (r20.yyy * c6.xyz) + r21.xyz;
	r16.xyw = (r16.yyy * c7.xyz) + r20.xyw;
	r16.xyw = (r20.zzz * c8.xyz) + r16.xyw;
	r16.xyz = (r16.zzz * c9.xyz) + r16.xyw;
	r20.xyz = r4.zzz * r12.xyz;
	r16.xyz = (r20.xyz * r3.xxx) + r16.xyz;
	r16.xyz = (r10.xyz * r2.xxx) + r16.xyz;
	r16.xyz = (r15.xyz * r8.yyy) + r16.xyz;
	r16.xyz = (r17.xyz * r5.www) + r16.xyz;
	r2.x = dot(r16.xyz, c18.yzw);
	r8.yz = r2.xx + -c2.xw;
	r20.xy = -c2.xw + c2.yz;
	r2.x = ((r20.y == 0.0) ? FLT_MAX : 1.0 / r20.y);
	r4.z = ((r20.x == 0.0) ? FLT_MAX : 1.0 / r20.x);
	r4.z = clamp(r4.z * r8.y, 0.0, 1.0);
	r2.x = clamp(r2.x * r8.z, 0.0, 1.0);
	r5.w = (r2.x * c26.z) + c26.w;
	r2.x = r2.x * r2.x;
	r2.x = (r5.w * r2.x) + r4.x;
	r4.x = (r4.z * c26.z) + c26.w;
	r4.z = r4.z * r4.z;
	r4.x = r4.z * r4.x;
	r2.x = r2.x * r4.x;
	r0.w = r0.w * r2.x;
	r20.xyz = mix(r0.xyz, r1.yzw, r0.www);
	r0.xyz = r0.xyz + c16.yyy;
	r0.xyz = (r18.yyy * r0.xyz) + c16.zzz;
	r0.w = dot(r20.xyz, c18.yzw);
	r1.yzw = r0.www * c102.xyz;
	r1.xyz = (r1.yzw * r1.xxx) + -r20.xyz;
	r1.xyz = (c102.www * r1.xyz) + r20.xyz;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r1.xyz = (r1.xyz * r0.www) + -r20.xyz;
	r21.xyz = (r11.xyz * r19.xyz) + r16.xyz;
	r16.xyz = r16.xyz + v6.xyz;
	r0.w = dot(r21.xyz, c18.yzw);
	r0.w = r0.w + c26.x;
	r0.w = clamp(r0.w * c26.y, 0.0, 1.0);
	r1.w = (r0.w * c26.z) + c26.w;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.w;
	r1.xyz = (r0.www * r1.xyz) + r20.xyz;
	r1.xyz = r18.zzz * r1.xyz;
	r9.w = r18.w;
	r20 = s7_texture.sample(s7, r9.yw);
	r0.w = clamp(dot(r6.xyz, r13.xyz), 0.0, 1.0);
	r1.w = clamp(r13.z, 0.0, 1.0);
	r1.w = (r1.w * r1.w) + r1.w;
	r1.w = r1.w * c13.z;
	r13.xyz = r1.www * r12.xyz;
	r1.w = r9.z * r9.z;
	r21 = s4_texture.sample(s4, r9.zw);
	r22.w = r1.w * r1.w;
	r1.w = r2.z * r22.w;
	r23.xyz = r1.www * v6.xyz;
	r22.xyz = r23.xyz * c18.xxx;
	r22 = ((-r2.z >= 0.0) ? c16.wwww : r22);
	r0.w = r0.w * r22.w;
	r23.xyz = (r0.www * c18.xxx) + -r20.xyz;
	r23.xyz = (r2.zzz * r23.xyz) + r20.xyz;
	r20.xyz = ((-r2.z >= 0.0) ? r20.xyz : r23.xyz);
	r8.yzw = r8.www * r20.xyz;
	r8.yzw = r12.xyz * r8.yzw;
	r8.yzw = (r8.yzw * r3.xxx) + r22.xyz;
	r20 = s7_texture.sample(s7, r9.xw);
	r14.z = r9.w;
	r0.w = r2.w * r22.w;
	r9.xyz = (r0.www * c18.xxx) + -r20.xyz;
	r9.xyz = (r2.zzz * r9.xyz) + r20.xyz;
	r9.xyz = ((-r2.z >= 0.0) ? r20.xyz : r9.xyz);
	r4.xyz = r4.yyy * r9.xyz;
	r4.xyz = (r4.xyz * r10.xyz) + r8.yzw;
	r9 = s7_texture.sample(s7, r14.yz);
	r14 = s7_texture.sample(s7, r14.xz);
	r0.w = r10.w * r22.w;
	r1.w = r7.w * r22.w;
	r8.yzw = (r1.www * c18.xxx) + -r14.xyz;
	r8.yzw = (r2.zzz * r8.yzw) + r14.xyz;
	r8.yzw = ((-r2.z >= 0.0) ? r14.xyz : r8.yzw);
	r8.yzw = r13.www * r8.yzw;
	r10.xyz = (r0.www * c18.xxx) + -r9.xyz;
	r10.xyz = (r2.zzz * r10.xyz) + r9.xyz;
	r9.xyz = ((-r2.z >= 0.0) ? r9.xyz : r10.xyz);
	r0.w = mix(r21.y, c16.z, r2.z);
	r1.w = r18.x * r21.z;
	r1.w = r1.w * c0.w;
	r2.xzw = r12.www * r9.xyz;
	r2.xzw = (r2.xzw * r15.xyz) + r4.xyz;
	r2.xzw = (r8.yzw * r17.xyz) + r2.xzw;
	r2.xzw = r6.www * r2.xzw;
	r3.x = mix(c10.x, c10.y, r18.y);
	r2.xzw = r2.xzw * r3.xxx;
	r4.xyz = r7.xyz * r5.yzx;
	r4.xyz = (r5.xyz * r7.yzx) + -r4.xyz;
	r8.yzw = r5.yzx * r4.xyz;
	r4.xyz = (r4.zxy * r5.zxy) + -r8.yzw;
	r3.x = dot(r4.xyz, r4.xyz);
	r3.x = ((r3.x == 0.0) ? FLT_MAX : rsqrt(abs(r3.x)));
	r4.xyz = (r4.xyz * r3.xxx) + -r6.xyz;
	r4.xyz = (r2.yyy * r4.xyz) + r6.xyz;
	r2.y = dot(r7.xyz, r4.xyz);
	r2.y = r2.y + r2.y;
	r3.x = dot(r7.xyz, r7.xyz);
	r4.xyz = r4.xyz * r3.xxx;
	r4.xyz = (r2.yyy * r7.xyz) + -r4.xyz;
	r5.x = ((r4.x >= 0.0) ? c16.z : c16.w);
	r5.y = ((r4.y >= 0.0) ? c16.z : c16.w);
	r5.z = ((r4.z >= 0.0) ? c16.z : c16.w);
	r6.xyz = r4.xyz * r4.xyz;
	r4.x = ((r4.x >= 0.0) ? c16.w : c16.z);
	r4.y = ((r4.y >= 0.0) ? c16.w : c16.z);
	r4.z = ((r4.z >= 0.0) ? c16.w : c16.z);
	r4.xyz = r6.xyz * r4.xyz;
	r5.xyz = r5.xyz * r6.xyz;
	r6.xyz = r4.xxx * c5.xyz;
	r6.xyz = (r5.xxx * c4.xyz) + r6.xyz;
	r5.xyw = (r5.yyy * c6.xyz) + r6.xyz;
	r5.xyw = (r4.yyy * c7.xyz) + r5.xyw;
	r5.xyz = (r5.zzz * c8.xyz) + r5.xyw;
	r4.xyz = (r4.zzz * c9.xyz) + r5.xyz;
	r4.xyz = r13.xyz * r4.xyz;
	r5.x = v7.w;
	r5.y = v8.w;
	r5.z = v9.w;
	r5.xyz = -r5.xyz + c21.xyz;
	r6.xyz = normalize(r5.xyz);
	r2.y = clamp(dot(-v9.xyz, r6.xyz), 0.0, 1.0);
	r2.y = (r2.y * r2.y) + r2.y;
	r2.y = r2.y * c13.z;
	r5.xyz = r2.yyy * r12.xyz;
	r6.xyz = c0.xyz * v6.xyz;
	r5.xyz = (r6.xyz * r5.xyz) + -r4.xyz;
	r2.y = clamp(dot(r7.xyz, v9.xyz), 0.0, 1.0);
	r4.xyz = (r2.yyy * r5.xyz) + r4.xyz;
	r4.xyz = r1.www * r4.xyz;
	r2.xyz = (r2.xzw * r0.www) + r4.xyz;
	r0.xyz = r0.xyz * r2.xyz;
	r0.xyz = (r1.xyz * r16.xyz) + r0.xyz;
	r0.xyz = (r11.xyz * r19.xyz) + r0.xyz;
	r1.x = v2.w;
	r1.y = v3.w;
	r1.z = v4.w;
	r2.xyz = (r3.yzw * r4.www) + r1.xyz;
	r0.w = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r0.w = clamp((r0.w * c19.w) + c19.x, 0.0, 1.0);
	r1.w = min(r0.w, c19.z);
	r0.w = r1.w * r1.w;
	r1.x = clamp(dot(r7.xyz, r1.xyz), 0.0, 1.0);
	r3.xyz = normalize(r2.xyz);
	r1.y = clamp(dot(r7.xyz, r3.xyz), 0.0, 1.0);
	r1.y = r1.x * r1.y;
	r1.x = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.y = r8.x * r1.y;
	r1.x = r1.x * r1.y;
	r1.yzw = v6.www * v6.xyz;
	r1.yzw = r1.yzw * c107.xyz;
	r1.xyz = r1.yzw * r1.xxx;
	r0.xyz = (r1.xyz * r18.xxx) + r0.xyz;
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

