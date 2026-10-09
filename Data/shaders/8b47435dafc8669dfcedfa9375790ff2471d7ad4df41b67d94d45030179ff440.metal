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
	const float4 c24 = float4(2.000000000e+00, -1.000000000e+00, 0.000000000e+00, 1.000000000e+00); (void) c24;
	const float4 c25 = float4(5.000000000e-01, 1.591549367e-01, 6.283185482e+00, -3.141592741e+00); (void) c25;
	const float4 c26 = float4(5.773500204e-01, -4.000000060e-01, 5.000000000e+00, -3.000000119e-01); (void) c26;
	const float4 c27 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -3.333333254e+00); (void) c27;
	const float4 c31 = float4(-2.000000000e+00, 3.000000000e+00, -9.999999975e-07, 1.000000000e+06); (void) c31;
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
	#define c19 uniforms.uniforms_float4[19]
	#define c20 uniforms.uniforms_float4[20]
	#define c21 uniforms.uniforms_float4[21]
	#define c22 uniforms.uniforms_float4[22]
	#define c23 uniforms.uniforms_float4[23]
	#define c28 uniforms.uniforms_float4[24]
	#define c29 uniforms.uniforms_float4[25]
	#define c30 uniforms.uniforms_float4[26]
	#define c33 uniforms.uniforms_float4[27]
	#define c101 uniforms.uniforms_float4[28]
	#define c102 uniforms.uniforms_float4[29]
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
	#define v7 input.v7
	#define v8 input.v8
	#define v9 input.v9
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	oC0.w = r0.w * c1.w;
	r1 = (v5.xyzx * c24.wwwz) + c24.zzzw;
	r2.x = dot(r1, c18);
	r2.y = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r3.x = dot(r1, c15);
	r3.y = dot(r1, c16);
	r3.z = dot(r1, c17);
	r1.xyz = r2.yyy * r3.xyz;
	r3 = s8_texture.sample(s8, r1.xy);
	r2.xyz = ((-r2.x >= 0.0) ? c24.zzz : r3.xyz);
	r3.y = c26.y;
	r2.w = r3.y * c13.w;
	r2.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r3.xyz = c14.xyz + -v5.xyz;
	r3.w = dot(r3.xyz, r3.xyz);
	r4.y = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r4.z = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r3.w = ((r4.y == 0.0) ? FLT_MAX : 1.0 / r4.y);
	r3.w = r3.w + -c13.w;
	r2.w = clamp(r2.w * r3.w, 0.0, 1.0);
	r4.x = c24.w;
	r3.w = clamp(dot(c13.xyz, r4.xyz), 0.0, 1.0);
	r3.xyz = r3.xyz * r4.yyy;
	r4.x = r2.w * r3.w;
	r4.xyz = r4.xxx * c28.xyz;
	r4.xyz = r2.xyz * r4.xyz;
	r2.xyz = r2.xyz * c28.xyz;
	r1.w = c24.w;
	r1 = float4(s11_texture.sample_compare(s11, (r1.xyz).xy, (r1.xyz).z));
	r1.y = -r1.x + c24.w;
	r1.y = (c109.y * r1.y) + r1.x;
	r4.w = clamp(mix(r1.y, r1.x, r3.w), 0.0, 1.0);
	r1.yzw = r4.www * r4.xyz;
	r4.xyz = c23.xyz + -v5.xyz;
	r5.xyz = normalize(r4.xyz);
	r4.xyz = c3.xyz + -v5.xyz;
	r4.w = dot(r4.xyz, r4.xyz);
	r4.w = ((r4.w == 0.0) ? FLT_MAX : rsqrt(abs(r4.w)));
	r6.xyz = r4.www * r4.xyz;
	r5.w = clamp(dot(r6.xyz, r5.xyz), 0.0, 1.0);
	r7 = s1_texture.sample(s1, v0.xy);
	r7.xyz = (r7.xyz * c24.xxx) + c24.yyy;
	r8.x = dot(v2.xyz, r7.xyz);
	r8.y = dot(v3.xyz, r7.xyz);
	r8.z = dot(v4.xyz, r7.xyz);
	r7.xyz = normalize(r8.xyz);
	r6.w = dot(r6.xyz, r7.xyz);
	r8.z = clamp(r6.w, 0.0, 1.0);
	r6.w = r6.w + r6.w;
	r9.x = r8.z * r8.z;
	r9.w = r9.x * r9.x;
	r10 = s3_texture.sample(s3, v0.xy);
	r10.y = -r10.w + c24.w;
	r10.z = r9.w * r10.y;
	r11.xyz = r10.zzz * v6.xyz;
	r9.xyz = r11.xyz * c26.zzz;
	r9 = ((-r10.y >= 0.0) ? c24.zzzz : r9);
	r5.w = r5.w * r9.w;
	r11.xyz = (r4.xyz * r4.www) + r5.xyz;
	r5.x = clamp(dot(r7.xyz, r5.xyz), 0.0, 1.0);
	r12.xyz = normalize(r11.xyz);
	r11.x = clamp(dot(r7.xyz, r12.xyz), 0.0, 1.0);
	r12 = s10_texture.sample(s10, v0.xy);
	r8.w = r12.w;
	r11.y = r8.w;
	r13 = s7_texture.sample(s7, r11.xy);
	r5.y = r5.x * r11.x;
	r11.xyz = (r5.www * c26.zzz) + -r13.xyz;
	r11.xyz = (r10.yyy * r11.xyz) + r13.xyz;
	r11.xyz = ((-r10.y >= 0.0) ? r13.xyz : r11.xyz);
	r5.z = ((r5.x == 0.0) ? FLT_MAX : rsqrt(abs(r5.x)));
	r5.x = (r5.x * r5.x) + r5.x;
	r5.x = r5.x * c25.x;
	r5.z = ((r5.z == 0.0) ? FLT_MAX : 1.0 / r5.z);
	r11.xyz = r5.zzz * r11.xyz;
	r13.xyz = c21.xyz + -v5.xyz;
	r14.xyz = normalize(r13.xyz);
	r5.w = clamp(dot(r6.xyz, r14.xyz), 0.0, 1.0);
	r5.w = r5.w * r9.w;
	r13.xyz = (r4.xyz * r4.www) + r14.xyz;
	r4.xyz = (r4.xyz * r4.www) + r3.xyz;
	r3.x = dot(r3.xyz, r7.xyz);
	r3.y = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r3.y = clamp((r3.y * c19.w) + c19.x, 0.0, 1.0);
	r4.w = min(r3.y, c19.z);
	r3.y = r4.w * r4.w;
	r15.xyz = normalize(r4.xyz);
	r8.y = clamp(dot(r7.xyz, r15.xyz), 0.0, 1.0);
	r4 = s7_texture.sample(s7, r8.yw);
	r15.xyz = normalize(r13.xyz);
	r8.x = clamp(dot(r7.xyz, r15.xyz), 0.0, 1.0);
	r13 = s7_texture.sample(s7, r8.xw);
	r15 = s4_texture.sample(s4, r8.zw);
	r3.z = -r8.z + c24.w;
	r4.w = pow(abs(r3.z), c105.x);
	r8.yzw = (r5.www * c26.zzz) + -r13.xyz;
	r8.yzw = (r10.yyy * r8.yzw) + r13.xyz;
	r8.yzw = ((-r10.y >= 0.0) ? r13.xyz : r8.yzw);
	r3.z = mix(r15.y, c24.w, r10.y);
	r5.w = r12.x * r15.z;
	r5.w = r5.w * c0.w;
	r9.w = clamp(dot(r7.xyz, r14.xyz), 0.0, 1.0);
	r10.y = clamp(r14.z, 0.0, 1.0);
	r10.y = (r10.y * r10.y) + r10.y;
	r10.y = r10.y * c25.x;
	r10.z = ((r9.w == 0.0) ? FLT_MAX : rsqrt(abs(r9.w)));
	r10.z = ((r10.z == 0.0) ? FLT_MAX : 1.0 / r10.z);
	r8.yzw = r8.yzw * r10.zzz;
	r13.xyz = c20.xyz * v1.xxx;
	r8.yzw = (r8.yzw * r13.xyz) + r9.xyz;
	r9.xyz = c22.xyz * v1.yyy;
	r8.yzw = (r11.xyz * r9.xyz) + r8.yzw;
	r10.w = clamp(r3.x, 0.0, 1.0);
	r3.x = clamp(r3.x + c28.w, 0.0, 1.0);
	r3.x = r3.x * r3.w;
	r10.w = ((r10.w == 0.0) ? FLT_MAX : rsqrt(abs(r10.w)));
	r10.w = ((r10.w == 0.0) ? FLT_MAX : 1.0 / r10.w);
	r4.xyz = r4.xyz * r10.www;
	r1.yzw = (r4.xyz * r1.yzw) + r8.yzw;
	r1.yzw = r7.www * r1.yzw;
	r4.x = mix(c10.x, c10.y, r12.y);
	r1.yzw = r1.yzw * r4.xxx;
	r4.x = dot(r7.xyz, r7.xyz);
	r4.xyz = r6.xyz * r4.xxx;
	r4.xyz = (r6.www * r7.xyz) + -r4.xyz;
	r6.x = ((r4.x >= 0.0) ? c24.z : c24.w);
	r6.y = ((r4.y >= 0.0) ? c24.z : c24.w);
	r6.z = ((r4.z >= 0.0) ? c24.z : c24.w);
	r8.yzw = r4.xyz * r4.xyz;
	r4.x = ((r4.x >= 0.0) ? c24.w : c24.z);
	r4.y = ((r4.y >= 0.0) ? c24.w : c24.z);
	r4.z = ((r4.z >= 0.0) ? c24.w : c24.z);
	r4.xyz = r8.yzw * r4.xyz;
	r6.xyz = r6.xyz * r8.yzw;
	r8.yzw = r6.xxx * c5.xyz;
	r8.yzw = (r4.xxx * c4.xyz) + r8.yzw;
	r8.yzw = (r4.yyy * c6.xyz) + r8.yzw;
	r6.xyw = (r6.yyy * c7.xyz) + r8.yzw;
	r4.xyz = (r4.zzz * c8.xyz) + r6.xyw;
	r4.xyz = (r6.zzz * c9.xyz) + r4.xyz;
	r6.xyz = r10.yyy * r13.xyz;
	r4.xyz = r4.xyz * r6.xyz;
	r6.x = v7.w;
	r6.y = v8.w;
	r6.z = v9.w;
	r6.xyz = -r6.xyz + c21.xyz;
	r11.xyz = normalize(r6.xyz);
	r6.x = clamp(dot(-v9.xyz, r11.xyz), 0.0, 1.0);
	r6.x = (r6.x * r6.x) + r6.x;
	r6.x = r6.x * c25.x;
	r6.xyz = r6.xxx * r13.xyz;
	r8.yzw = c0.xyz * v6.xyz;
	r6.xyz = (r8.yzw * r6.xyz) + -r4.xyz;
	r6.w = clamp(dot(r7.xyz, v9.xyz), 0.0, 1.0);
	r4.xyz = (r6.www * r6.xyz) + r4.xyz;
	r4.xyz = r5.www * r4.xyz;
	r1.yzw = (r1.yzw * r3.zzz) + r4.xyz;
	r3.z = r10.x * c12.w;
	r0.w = r10.x;
	r3.z = (r3.z * c25.y) + c25.x;
	r3.z = fract(r3.z);
	r3.z = (r3.z * c25.z) + c25.w;
	r6.xy = float2(cos(r3.z), sin(r3.z));
	r4.xyz = r0.zxy * c26.xxx;
	r4.xyz = (r0.zxy * c26.xxx) + -r4.zxy;
	r4.xyz = r6.yyy * r4.xyz;
	r4.xyz = (r0.xyz * r6.xxx) + r4.xyz;
	r3.z = -r6.x + c24.w;
	r5.w = dot(c26.xxx, r0.xyz);
	r5.w = r5.w * c26.x;
	r6.xyz = (r5.www * r3.zzz) + r4.xyz;
	r3.z = abs(c12.w);
	r6.w = c24.w;
	r0 = ((-r3.z >= 0.0) ? r0 : r6);
	r4.xyz = r0.xyz + c24.yyy;
	r4.xyz = (r12.yyy * r4.xyz) + c24.www;
	r1.yzw = r1.yzw * r4.xyz;
	r4.x = ((r7.x >= 0.0) ? c24.z : c24.w);
	r4.y = ((r7.y >= 0.0) ? c24.z : c24.w);
	r4.z = ((r7.z >= 0.0) ? c24.z : c24.w);
	r6.xyz = r7.xyz * r7.xyz;
	r7.x = ((r7.x >= 0.0) ? c24.w : c24.z);
	r7.y = ((r7.y >= 0.0) ? c24.w : c24.z);
	r7.z = ((r7.z >= 0.0) ? c24.w : c24.z);
	r7.xyz = r6.xyz * r7.xyz;
	r4.xyz = r4.xyz * r6.xyz;
	r6.xyz = r4.xxx * c5.xyz;
	r6.xyz = (r7.xxx * c4.xyz) + r6.xyz;
	r6.xyz = (r7.yyy * c6.xyz) + r6.xyz;
	r6.xyz = (r4.yyy * c7.xyz) + r6.xyz;
	r6.xyz = (r7.zzz * c8.xyz) + r6.xyz;
	r4.xyz = (r4.zzz * c9.xyz) + r6.xyz;
	r3.z = (r9.w * r9.w) + r9.w;
	r5.w = r8.x * r9.w;
	r5.w = r4.w * r5.w;
	r4.w = r4.w * r5.y;
	r4.w = r5.z * r4.w;
	r3.z = r3.z * c25.x;
	r4.xyz = (r13.xyz * r3.zzz) + r4.xyz;
	r4.xyz = (r9.xyz * r5.xxx) + r4.xyz;
	r5.xyz = r9.xyz * r4.www;
	r3.z = (r5.w * r10.z) + r4.w;
	r4.w = r10.z * r5.w;
	r5.xyz = (r4.www * r13.xyz) + r5.xyz;
	r6.xy = r3.zz + -c33.xw;
	r3.z = clamp(r1.x, 0.0, 1.0);
	r4.w = -r3.z + c24.w;
	r3.z = (c109.y * r4.w) + r3.z;
	r4.w = clamp(mix(r3.z, r1.x, r3.w), 0.0, 1.0);
	r2.xyz = r2.xyz * r4.www;
	r2.xyz = r2.xyz * r3.xxx;
	r2.xyz = (r2.xyz * r2.www) + r4.xyz;
	r1.x = dot(r2.xyz, c27.xyz);
	r3.xz = r1.xx + -c2.xw;
	r4.xy = -c2.xw + c2.yz;
	r1.x = ((r4.x == 0.0) ? FLT_MAX : 1.0 / r4.x);
	r2.w = ((r4.y == 0.0) ? FLT_MAX : 1.0 / r4.y);
	r2.w = clamp(r2.w * r3.z, 0.0, 1.0);
	r1.x = clamp(r1.x * r3.x, 0.0, 1.0);
	r3.x = (r1.x * c31.x) + c31.y;
	r1.x = r1.x * r1.x;
	r1.x = r1.x * r3.x;
	r3.x = (r2.w * c31.x) + c31.y;
	r2.w = r2.w * r2.w;
	r3.zw = -c33.xw + c33.yz;
	r3.z = ((r3.z == 0.0) ? FLT_MAX : 1.0 / r3.z);
	r3.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r3.zw = clamp(r3.zw * r6.xy, float2(0.0), float2(1.0));
	r4.x = (r3.z * c31.x) + c31.y;
	r3.z = r3.z * r3.z;
	r3.z = r3.z * r4.x;
	r4.x = (r3.w * c31.x) + c31.y;
	r3.w = r3.w * r3.w;
	r3.w = r3.w * r4.x;
	r3.z = r3.w * r3.z;
	r3.w = c24.w;
	r3.w = (v6.w * c11.w) + r3.w;
	r4.x = r12.x * c105.y;
	r3.w = r3.w * r4.x;
	r4.xyz = r3.www * r5.xyz;
	r3.w = r12.y * c101.w;
	r5.xyz = (r0.xyz * r3.www) + -c106.xyz;
	r3.w = clamp(r3.w, 0.0, 1.0);
	r5.xyz = (r3.www * r5.xyz) + c106.xyz;
	r6.xyz = r4.xyz * r5.xyz;
	r3.w = dot(r6.xyz, c27.xyz);
	r3.z = r3.w * r3.z;
	r3.z = r3.z * c106.w;
	r2.w = (r3.x * r2.w) + r3.z;
	r1.x = r1.x * r2.w;
	r0.w = r0.w * r1.x;
	r3.xzw = r0.xyz * r0.xyz;
	r3.xzw = r3.xzw * r3.xzw;
	r1.x = dot(r0.xyz, c27.xyz);
	r6.xyz = r1.xxx * r3.xzw;
	r2.w = dot(r3.xzw, c27.xyz);
	r3.xzw = mix(r0.xyz, r1.xxx, -c101.yyy);
	r1.x = r2.w + c31.z;
	r2.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r1.x = ((r1.x >= 0.0) ? r2.w : c31.w);
	r6.xyz = (r6.xyz * r1.xxx) + -r0.xyz;
	r6.xyz = (c101.yyy * r6.xyz) + r0.xyz;
	r3.xzw = ((c101.y >= 0.0) ? r6.xyz : r3.xzw);
	r1.x = abs(c101.y);
	r3.xzw = ((-r1.x >= 0.0) ? r0.xyz : r3.xzw);
	r6.xyz = mix(r0.xyz, r3.xzw, r0.www);
	r0.x = dot(r6.xyz, c27.xyz);
	r0.xyz = r0.xxx * c102.xyz;
	r7.xyz = c27.xyz;
	r0.w = dot(c102.xyz, r7.xyz);
	r1.x = r0.w + c31.z;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r1.x >= 0.0) ? r0.w : c31.w);
	r0.xyz = (r0.xyz * r0.www) + -r6.xyz;
	r0.xyz = (c102.www * r0.xyz) + r6.xyz;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r0.xyz = (r0.xyz * r0.www) + -r6.xyz;
	r3.xzw = (r4.xyz * r5.xyz) + r2.xyz;
	r2.xyz = r2.xyz + v6.xyz;
	r0.w = dot(r3.xzw, c27.xyz);
	r0.w = r0.w + c26.w;
	r0.w = clamp(r0.w * c27.w, 0.0, 1.0);
	r1.x = (r0.w * c31.x) + c31.y;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.x;
	r0.xyz = (r0.www * r0.xyz) + r6.xyz;
	r0.xyz = r12.zzz * r0.xyz;
	r0.xyz = (r0.xyz * r2.xyz) + r1.yzw;
	r0.xyz = (r4.xyz * r5.xyz) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	oC0.xyz = (r3.yyy * r0.xyz) + r1.xyz;
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
	#undef c19
	#undef c20
	#undef c21
	#undef c22
	#undef c23
	#undef c28
	#undef c29
	#undef c30
	#undef c33
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

