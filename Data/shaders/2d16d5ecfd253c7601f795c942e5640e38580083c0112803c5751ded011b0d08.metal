#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[30];
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
	texture2d<float> s4_texture [[texture(4)]],
	sampler s4 [[sampler(4)]],
	texturecube<float> s6_texture [[texture(6)]],
	sampler s6 [[sampler(6)]],
	texture2d<float> s7_texture [[texture(7)]],
	sampler s7 [[sampler(7)]],
	texture2d<float> s10_texture [[texture(10)]],
	sampler s10 [[sampler(10)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c13 = float4(1.591549367e-01, 5.000000000e-01, 6.283185482e+00, -3.141592741e+00); (void) c13;
	const float4 c14 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -3.000000119e-01); (void) c14;
	const float4 c15 = float4(5.773500204e-01, 1.000000000e+00, 2.000000000e+00, -1.000000000e+00); (void) c15;
	const float4 c16 = float4(-3.333333254e+00, -2.000000000e+00, 3.000000000e+00, 0.000000000e+00); (void) c16;
	const float4 c17 = float4(0.000000000e+00, 1.000000000e+00, -9.999999975e-07, 1.000000000e+06); (void) c17;
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
	#define c101 uniforms.uniforms_float4[23]
	#define c102 uniforms.uniforms_float4[24]
	#define c103 uniforms.uniforms_float4[25]
	#define c104 uniforms.uniforms_float4[26]
	#define c105 uniforms.uniforms_float4[27]
	#define c106 uniforms.uniforms_float4[28]
	#define c107 uniforms.uniforms_float4[29]
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
	r0.xyz = c14.xyz;
	r0.x = dot(c102.xyz, r0.xyz);
	r0.y = r0.x + c17.z;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = ((r0.y >= 0.0) ? r0.x : c17.w);
	r1.xy = c13.xy;
	r0.y = (c12.w * r1.x) + r1.y;
	r0.y = fract(r0.y);
	r0.y = (r0.y * c13.z) + c13.w;
	r1.xy = float2(cos(r0.y), sin(r0.y));
	r2 = s0_texture.sample(s0, v0.xy);
	r0.yzw = r2.zxy * c15.xxx;
	r0.yzw = (r2.zxy * c15.xxx) + -r0.wyz;
	r0.yzw = r1.yyy * r0.yzw;
	r0.yzw = (r2.xyz * r1.xxx) + r0.yzw;
	r1.x = -r1.x + c15.y;
	r1.y = dot(c15.xxx, r2.xyz);
	r1.y = r1.y * c15.x;
	r0.yzw = (r1.yyy * r1.xxx) + r0.yzw;
	r1.x = abs(c12.w);
	r0.yzw = ((-r1.x >= 0.0) ? r2.xyz : r0.yzw);
	r1.xyz = r2.www * c104.xyz;
	r2.xyz = r0.yzw * r0.yzw;
	r2.xyz = r2.xyz * r2.xyz;
	r1.w = dot(r2.xyz, c14.xyz);
	r2.w = r1.w + c17.z;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = ((r2.w >= 0.0) ? r1.w : c17.w);
	r2.w = dot(r0.yzw, c14.xyz);
	r2.xyz = r2.www * r2.xyz;
	r3.xyz = mix(r0.yzw, r2.www, -c101.yyy);
	r2.xyz = (r2.xyz * r1.www) + -r0.yzw;
	r2.xyz = (c101.yyy * r2.xyz) + r0.yzw;
	r2.xyz = ((c101.y >= 0.0) ? r2.xyz : r3.xyz);
	r1.w = abs(c101.y);
	r2.xyz = ((-r1.w >= 0.0) ? r0.yzw : r2.xyz);
	r3.xy = -c33.xw + c33.yz;
	r1.w = ((r3.x == 0.0) ? FLT_MAX : 1.0 / r3.x);
	r2.w = ((r3.y == 0.0) ? FLT_MAX : 1.0 / r3.y);
	r3.xyz = c23.xyz + -v5.xyz;
	r4.xyz = normalize(r3.xyz);
	r3.xyz = c3.xyz + -v5.xyz;
	r3.w = dot(r3.xyz, r3.xyz);
	r3.w = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r5.xyz = (r3.xyz * r3.www) + r4.xyz;
	r6.xyz = normalize(r5.xyz);
	r5 = s1_texture.sample(s1, v0.xy);
	r5.xyz = (r5.xyz * c15.zzz) + c15.www;
	r7.x = dot(v2.xyz, r5.xyz);
	r7.y = dot(v3.xyz, r5.xyz);
	r7.z = dot(v4.xyz, r5.xyz);
	r5.xyz = normalize(r7.xyz);
	r6.x = clamp(dot(r5.xyz, r6.xyz), 0.0, 1.0);
	r4.x = clamp(dot(r5.xyz, r4.xyz), 0.0, 1.0);
	r4.y = r4.x * r6.x;
	r7.xyz = r3.www * r3.xyz;
	r4.z = dot(r7.xyz, r5.xyz);
	r6.z = clamp(r4.z, 0.0, 1.0);
	r4.z = r4.z + r4.z;
	r4.w = -r6.z + c15.y;
	r7.w = pow(abs(r4.w), c105.x);
	r4.y = r4.y * r7.w;
	r4.w = ((r4.x == 0.0) ? FLT_MAX : rsqrt(abs(r4.x)));
	r4.x = (r4.x * r4.x) + r4.x;
	r4.x = r4.x * c13.y;
	r4.w = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r4.y = r4.w * r4.y;
	r8.xyz = c21.xyz + -v5.xyz;
	r9.xyz = normalize(r8.xyz);
	r8.xyz = (r3.xyz * r3.www) + r9.xyz;
	r10.xyz = normalize(r8.xyz);
	r6.y = clamp(dot(r5.xyz, r10.xyz), 0.0, 1.0);
	r8.x = clamp(dot(r5.xyz, r9.xyz), 0.0, 1.0);
	r8.y = clamp(r9.z, 0.0, 1.0);
	r8.y = (r8.y * r8.y) + r8.y;
	r8.z = r6.y * r8.x;
	r8.z = r7.w * r8.z;
	r8.w = ((r8.x == 0.0) ? FLT_MAX : rsqrt(abs(r8.x)));
	r8.x = (r8.x * r8.x) + r8.x;
	r8.xy = r8.xy * c13.yy;
	r8.w = ((r8.w == 0.0) ? FLT_MAX : 1.0 / r8.w);
	r9.x = (r8.z * r8.w) + r4.y;
	r8.z = r8.w * r8.z;
	r9.yzw = c25.xyz + -v5.xyz;
	r10.xyz = normalize(r9.yzw);
	r9.yzw = (r3.xyz * r3.www) + r10.xyz;
	r10.x = clamp(dot(r5.xyz, r10.xyz), 0.0, 1.0);
	r11.xyz = normalize(r9.yzw);
	r11.x = clamp(dot(r5.xyz, r11.xyz), 0.0, 1.0);
	r9.y = r10.x * r11.x;
	r9.y = r7.w * r9.y;
	r9.z = ((r10.x == 0.0) ? FLT_MAX : rsqrt(abs(r10.x)));
	r9.w = (r10.x * r10.x) + r10.x;
	r9.w = r9.w * c13.y;
	r9.z = ((r9.z == 0.0) ? FLT_MAX : 1.0 / r9.z);
	r9.x = (r9.y * r9.z) + r9.x;
	r9.y = r9.z * r9.y;
	r10.xy = r9.xx + -c33.xw;
	r1.w = clamp(r1.w * r10.x, 0.0, 1.0);
	r2.w = clamp(r2.w * r10.y, 0.0, 1.0);
	r9.x = (r1.w * c16.y) + c16.z;
	r1.w = r1.w * r1.w;
	r1.w = r1.w * r9.x;
	r9.x = (r2.w * c16.y) + c16.z;
	r2.w = r2.w * r2.w;
	r2.w = r2.w * r9.x;
	r1.w = r1.w * r2.w;
	r10 = s10_texture.sample(s10, v0.xy);
	r2.w = r10.y * c101.w;
	r12.xyz = (r0.yzw * r2.www) + -c106.xyz;
	r2.w = clamp(r2.w, 0.0, 1.0);
	r12.xyz = (r2.www * r12.xyz) + c106.xyz;
	r13.xyz = c22.xyz * v1.yyy;
	r14.xyz = r4.yyy * r13.xyz;
	r15.xyz = c20.xyz * v1.xxx;
	r14.xyz = (r8.zzz * r15.xyz) + r14.xyz;
	r16.xyz = c24.xyz * v1.zzz;
	r14.xyz = (r9.yyy * r16.xyz) + r14.xyz;
	r4.y = c15.y;
	r2.w = (v6.w * c11.w) + r4.y;
	r4.y = r10.x * c105.y;
	r2.w = r2.w * r4.y;
	r14.xyz = r2.www * r14.xyz;
	r17.xyz = r12.xyz * r14.xyz;
	r2.w = dot(r17.xyz, c14.xyz);
	r1.w = r1.w * r2.w;
	r1.w = r1.w * c106.w;
	r17.x = ((r5.x >= 0.0) ? c17.x : c17.y);
	r17.y = ((r5.y >= 0.0) ? c17.x : c17.y);
	r17.z = ((r5.z >= 0.0) ? c17.x : c17.y);
	r18.xyz = r5.xyz * r5.xyz;
	r17.xyz = r17.xyz * r18.xyz;
	r19.xyz = r17.xxx * c5.xyz;
	r20.x = ((r5.x >= 0.0) ? c17.y : c17.x);
	r20.y = ((r5.y >= 0.0) ? c17.y : c17.x);
	r20.z = ((r5.z >= 0.0) ? c17.y : c17.x);
	r18.xyz = r18.xyz * r20.xyz;
	r19.xyz = (r18.xxx * c4.xyz) + r19.xyz;
	r18.xyw = (r18.yyy * c6.xyz) + r19.xyz;
	r17.xyw = (r17.yyy * c7.xyz) + r18.xyw;
	r17.xyw = (r18.zzz * c8.xyz) + r17.xyw;
	r17.xyz = (r17.zzz * c9.xyz) + r17.xyw;
	r17.xyz = (r15.xyz * r8.xxx) + r17.xyz;
	r17.xyz = (r13.xyz * r4.xxx) + r17.xyz;
	r9.xyw = (r16.xyz * r9.www) + r17.xyz;
	r2.w = dot(r9.xyw, c14.xyz);
	r4.xy = r2.ww + -c2.xw;
	r8.xz = -c2.xw + c2.yz;
	r2.w = ((r8.z == 0.0) ? FLT_MAX : 1.0 / r8.z);
	r8.x = ((r8.x == 0.0) ? FLT_MAX : 1.0 / r8.x);
	r4.x = clamp(r4.x * r8.x, 0.0, 1.0);
	r2.w = clamp(r2.w * r4.y, 0.0, 1.0);
	r4.y = (r2.w * c16.y) + c16.z;
	r2.w = r2.w * r2.w;
	r1.w = (r4.y * r2.w) + r1.w;
	r2.w = (r4.x * c16.y) + c16.z;
	r4.x = r4.x * r4.x;
	r2.w = r2.w * r4.x;
	r1.w = r1.w * r2.w;
	r17.xyz = mix(r0.yzw, r2.xyz, r1.www);
	r0.yzw = r0.yzw + c15.www;
	r0.yzw = (r10.yyy * r0.yzw) + c15.yyy;
	r1.w = dot(r17.xyz, c14.xyz);
	r2.xyz = r1.www * c102.xyz;
	r2.xyz = (r2.xyz * r0.xxx) + -r17.xyz;
	r2.xyz = (c102.www * r2.xyz) + r17.xyz;
	r0.x = clamp(c107.w + v6.w, 0.0, 1.0);
	r2.xyz = (r2.xyz * r0.xxx) + -r17.xyz;
	r18.xyz = (r14.xyz * r12.xyz) + r9.xyw;
	r9.xyw = r9.xyw + v6.xyz;
	r0.x = dot(r18.xyz, c14.xyz);
	r0.x = r0.x + c14.w;
	r0.x = clamp(r0.x * c16.x, 0.0, 1.0);
	r1.w = (r0.x * c16.y) + c16.z;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r1.w;
	r2.xyz = (r0.xxx * r2.xyz) + r17.xyz;
	r2.xyz = r10.zzz * r2.xyz;
	r6.w = r10.w;
	r17 = s7_texture.sample(s7, r6.xw);
	r4.xyw = r4.www * r17.xyz;
	r4.xyw = r13.xyz * r4.xyw;
	r13 = s7_texture.sample(s7, r6.yw);
	r8.xzw = r8.www * r13.xyz;
	r4.xyw = (r8.xzw * r15.xyz) + r4.xyw;
	r11.y = r6.w;
	r6 = s4_texture.sample(s4, r6.zw);
	r11 = s7_texture.sample(s7, r11.xy);
	r8.xzw = r9.zzz * r11.xyz;
	r4.xyw = (r8.xzw * r16.xyz) + r4.xyw;
	r4.xyw = r5.www * r4.xyw;
	r8.xzw = r9.xyw + -c103.xxx;
	r8.xzw = clamp(r8.xzw * c103.yyy, float3(0.0), float3(1.0));
	r0.x = dot(r5.xyz, r5.xyz);
	r7.xyz = r7.xyz * r0.xxx;
	r7.xyz = (r4.zzz * r5.xyz) + -r7.xyz;
	r11 = s6_texture.sample(s6, r7.xyz);
	r13.xyz = r11.xyz * c30.zzz;
	r16.xyz = r13.xyz * r13.xyz;
	r16.xyz = r16.xyz * r16.xyz;
	r0.x = dot(r16.xyz, c14.xyz);
	r1.w = r0.x + c17.z;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = ((r1.w >= 0.0) ? r0.x : c17.w);
	r1.w = dot(r13.xyz, c14.xyz);
	r16.xyz = r1.www * r16.xyz;
	r11.xyz = (c30.zzz * -r11.xyz) + r1.www;
	r11.xyz = (-c103.www * r11.xyz) + r13.xyz;
	r16.xyz = (r16.xyz * r0.xxx) + -r13.xyz;
	r16.xyz = (c103.www * r16.xyz) + r13.xyz;
	r11.xyz = ((c103.w >= 0.0) ? r16.xyz : r11.xyz);
	r0.x = abs(c103.w);
	r11.xyz = ((-r0.x >= 0.0) ? r13.xyz : r11.xyz);
	r8.xzw = (r11.xyz * r8.xzw) + -r11.xyz;
	r8.xzw = (c101.xxx * r8.xzw) + r11.xyz;
	r11.xyz = (r8.xzw * r8.xzw) + -r8.xzw;
	r8.xzw = (c103.zzz * r11.xyz) + r8.xzw;
	r1.xyz = r1.xyz * r8.xzw;
	r0.x = mix(c10.x, c10.y, r10.y);
	r1.xyz = (r4.xyw * r0.xxx) + r1.xyz;
	r4.x = v7.w;
	r4.y = v8.w;
	r4.z = v9.w;
	r4.xyz = -r4.xyz + c21.xyz;
	r11.xyz = normalize(r4.xyz);
	r0.x = clamp(dot(-v9.xyz, r11.xyz), 0.0, 1.0);
	r0.x = (r0.x * r0.x) + r0.x;
	r0.x = r0.x * c13.y;
	r4.xyz = r0.xxx * r15.xyz;
	r8.xyz = r8.yyy * r15.xyz;
	r10.y = ((r7.x >= 0.0) ? c17.x : c17.y);
	r10.z = ((r7.y >= 0.0) ? c17.x : c17.y);
	r10.w = ((r7.z >= 0.0) ? c17.x : c17.y);
	r11.xyz = r7.xyz * r7.xyz;
	r7.x = ((r7.x >= 0.0) ? c17.y : c17.x);
	r7.y = ((r7.y >= 0.0) ? c17.y : c17.x);
	r7.z = ((r7.z >= 0.0) ? c17.y : c17.x);
	r7.xyz = r11.xyz * r7.xyz;
	r10.yzw = r10.yzw * r11.xyz;
	r11.xyz = r10.yyy * c5.xyz;
	r11.xyz = (r7.xxx * c4.xyz) + r11.xyz;
	r11.xyz = (r7.yyy * c6.xyz) + r11.xyz;
	r11.xyz = (r10.zzz * c7.xyz) + r11.xyz;
	r7.xyz = (r7.zzz * c8.xyz) + r11.xyz;
	r7.xyz = (r10.www * c9.xyz) + r7.xyz;
	r7.xyz = r8.xyz * r7.xyz;
	r8.xyz = c0.xyz * v6.xyz;
	r4.xyz = (r8.xyz * r4.xyz) + -r7.xyz;
	r0.x = clamp(dot(r5.xyz, v9.xyz), 0.0, 1.0);
	r4.xyz = (r0.xxx * r4.xyz) + r7.xyz;
	r0.x = r10.x * r6.z;
	r0.x = r0.x * c0.w;
	r4.xyz = r0.xxx * r4.xyz;
	r1.xyz = (r1.xyz * r6.yyy) + r4.xyz;
	r0.xyz = r0.yzw * r1.xyz;
	r0.xyz = (r2.xyz * r9.xyw) + r0.xyz;
	r0.xyz = (r14.xyz * r12.xyz) + r0.xyz;
	r1.x = v2.w;
	r1.y = v3.w;
	r1.z = v4.w;
	r2.xyz = (r3.xyz * r3.www) + r1.xyz;
	r0.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r0.w = clamp((r0.w * c19.w) + c19.x, 0.0, 1.0);
	r1.w = min(r0.w, c19.z);
	r0.w = r1.w * r1.w;
	r1.x = clamp(dot(r5.xyz, r1.xyz), 0.0, 1.0);
	r3.xyz = normalize(r2.xyz);
	r1.y = clamp(dot(r5.xyz, r3.xyz), 0.0, 1.0);
	r1.y = r1.x * r1.y;
	r1.x = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.y = r7.w * r1.y;
	r1.x = r1.x * r1.y;
	r1.yzw = v6.www * v6.xyz;
	r1.yzw = r1.yzw * c107.xyz;
	r1.xyz = r1.yzw * r1.xxx;
	r0.xyz = (r1.xyz * r10.xxx) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	oC0.xyz = (r0.www * r0.xyz) + r1.xyz;
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
	#undef c101
	#undef c102
	#undef c103
	#undef c104
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

