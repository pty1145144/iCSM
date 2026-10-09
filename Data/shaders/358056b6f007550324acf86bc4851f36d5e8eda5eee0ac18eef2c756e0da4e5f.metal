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
	const float4 c0 = float4(1.591549367e-01, 5.000000000e-01, 6.283185482e+00, -3.141592741e+00); (void) c0;
	const float4 c19 = float4(5.773500204e-01, 1.000000000e+00, 2.000000000e+00, -1.000000000e+00); (void) c19;
	const float4 c26 = float4(-3.000000119e-01, -3.333333254e+00, -2.000000000e+00, 3.000000000e+00); (void) c26;
	const float4 c27 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, 1.000000000e+06); (void) c27;
	const float4 c29 = float4(0.000000000e+00, 1.000000000e+00, -4.000000060e-01, -9.999999975e-07); (void) c29;
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
	r0 = s1_texture.sample(s1, v0.xy);
	r0.xyz = (r0.xyz * c19.zzz) + c19.www;
	r1.x = dot(v2.xyz, r0.xyz);
	r1.y = dot(v3.xyz, r0.xyz);
	r1.z = dot(v4.xyz, r0.xyz);
	r0.xyz = normalize(r1.xyz);
	r1.x = ((r0.x >= 0.0) ? c29.x : c29.y);
	r1.y = ((r0.y >= 0.0) ? c29.x : c29.y);
	r1.z = ((r0.z >= 0.0) ? c29.x : c29.y);
	r2.xyz = r0.xyz * r0.xyz;
	r1.xyz = r1.xyz * r2.xyz;
	r3.xyz = r1.xxx * c5.xyz;
	r4.x = ((r0.x >= 0.0) ? c29.y : c29.x);
	r4.y = ((r0.y >= 0.0) ? c29.y : c29.x);
	r4.z = ((r0.z >= 0.0) ? c29.y : c29.x);
	r2.xyz = r2.xyz * r4.xyz;
	r3.xyz = (r2.xxx * c4.xyz) + r3.xyz;
	r2.xyw = (r2.yyy * c6.xyz) + r3.xyz;
	r1.xyw = (r1.yyy * c7.xyz) + r2.xyw;
	r1.xyw = (r2.zzz * c8.xyz) + r1.xyw;
	r1.xyz = (r1.zzz * c9.xyz) + r1.xyw;
	r2.xyz = c20.xyz * v1.xxx;
	r3.xyz = c21.xyz + -v5.xyz;
	r4.xyz = normalize(r3.xyz);
	r1.w = clamp(dot(r0.xyz, r4.xyz), 0.0, 1.0);
	r2.w = (r1.w * r1.w) + r1.w;
	r2.w = r2.w * c0.y;
	r1.xyz = (r2.xyz * r2.www) + r1.xyz;
	r3.xyz = c22.xyz * v1.yyy;
	r5.xyz = c23.xyz + -v5.xyz;
	r6.xyz = normalize(r5.xyz);
	r2.w = clamp(dot(r0.xyz, r6.xyz), 0.0, 1.0);
	r3.w = (r2.w * r2.w) + r2.w;
	r3.w = r3.w * c0.y;
	r1.xyz = (r3.xyz * r3.www) + r1.xyz;
	r5.xyz = c24.xyz * v1.zzz;
	r7.xyz = c25.xyz + -v5.xyz;
	r8.xyz = normalize(r7.xyz);
	r3.w = clamp(dot(r0.xyz, r8.xyz), 0.0, 1.0);
	r4.w = (r3.w * r3.w) + r3.w;
	r4.w = r4.w * c0.y;
	r1.xyz = (r5.xyz * r4.www) + r1.xyz;
	r7.z = c29.z;
	r4.w = r7.z * c13.w;
	r4.w = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r7.xyz = c14.xyz + -v5.xyz;
	r5.w = dot(r7.xyz, r7.xyz);
	r9.y = ((r5.w == 0.0) ? FLT_MAX : rsqrt(abs(r5.w)));
	r9.z = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r5.w = ((r9.y == 0.0) ? FLT_MAX : 1.0 / r9.y);
	r5.w = r5.w + -c13.w;
	r4.w = clamp(r4.w * r5.w, 0.0, 1.0);
	r10 = (v5.xyzx * c29.yyyx) + c29.xxxy;
	r5.w = dot(r10, c18);
	r6.w = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r11.x = dot(r10, c15);
	r11.y = dot(r10, c16);
	r11.z = dot(r10, c17);
	r10.xyz = r6.www * r11.xyz;
	r11 = s8_texture.sample(s8, r10.xy);
	r11.xyz = ((-r5.w >= 0.0) ? c29.xxx : r11.xyz);
	r12.xyz = r11.xyz * c28.xyz;
	r10.w = c19.y;
	r10 = float4(s11_texture.sample_compare(s11, (r10.xyz).xy, (r10.xyz).z));
	r5.w = clamp(r10.x, 0.0, 1.0);
	r6.w = -r5.w + c19.y;
	r5.w = (c109.y * r6.w) + r5.w;
	r9.x = c19.y;
	r6.w = clamp(dot(c13.xyz, r9.xyz), 0.0, 1.0);
	r7.xyz = r7.xyz * r9.yyy;
	r7.w = clamp(mix(r5.w, r10.x, r6.w), 0.0, 1.0);
	r9.xyz = r7.www * r12.xyz;
	r5.w = dot(r7.xyz, r0.xyz);
	r7.w = clamp(r5.w + c28.w, 0.0, 1.0);
	r5.w = clamp(r5.w, 0.0, 1.0);
	r5.w = ((r5.w == 0.0) ? FLT_MAX : rsqrt(abs(r5.w)));
	r5.w = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r7.w = r6.w * r7.w;
	r9.xyz = r9.xyz * r7.www;
	r1.xyz = (r9.xyz * r4.www) + r1.xyz;
	r4.w = r4.w * r6.w;
	r9.xyz = r4.www * c28.xyz;
	r9.xyz = r9.xyz * r11.xyz;
	r10.yzw = r1.xyz + v6.xyz;
	r11.xyz = r10.yzw + -c103.xxx;
	r11.xyz = clamp(r11.xyz * c103.yyy, float3(0.0), float3(1.0));
	r4.w = dot(r0.xyz, r0.xyz);
	r12.xyz = c3.xyz + -v5.xyz;
	r7.w = dot(r12.xyz, r12.xyz);
	r7.w = ((r7.w == 0.0) ? FLT_MAX : rsqrt(abs(r7.w)));
	r13.xyz = r7.www * r12.xyz;
	r14.xyz = r4.www * r13.xyz;
	r13.z = dot(r13.xyz, r0.xyz);
	r4.w = r13.z + r13.z;
	r13.z = clamp(r13.z, 0.0, 1.0);
	r14.xyz = (r4.www * r0.xyz) + -r14.xyz;
	r14 = s6_texture.sample(s6, r14.xyz);
	r15.xyz = r14.xyz * c30.zzz;
	r16.xyz = r15.xyz * r15.xyz;
	r16.xyz = r16.xyz * r16.xyz;
	r4.w = dot(r16.xyz, c27.xyz);
	r8.w = r4.w + c29.w;
	r4.w = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r4.w = ((r8.w >= 0.0) ? r4.w : c27.w);
	r8.w = dot(r15.xyz, c27.xyz);
	r16.xyz = r8.www * r16.xyz;
	r14.xyz = (c30.zzz * -r14.xyz) + r8.www;
	r14.xyz = (-c103.www * r14.xyz) + r15.xyz;
	r16.xyz = (r16.xyz * r4.www) + -r15.xyz;
	r16.xyz = (c103.www * r16.xyz) + r15.xyz;
	r14.xyz = ((c103.w >= 0.0) ? r16.xyz : r14.xyz);
	r4.w = abs(c103.w);
	r14.xyz = ((-r4.w >= 0.0) ? r15.xyz : r14.xyz);
	r11.xyz = (r14.xyz * r11.xyz) + -r14.xyz;
	r11.xyz = (c101.xxx * r11.xyz) + r14.xyz;
	r14.xyz = (r11.xyz * r11.xyz) + -r11.xyz;
	r11.xyz = (c103.zzz * r14.xyz) + r11.xyz;
	r14 = s0_texture.sample(s0, v0.xy);
	r15.xyz = r14.www * c104.xyz;
	r11.xyz = r11.xyz * r15.xyz;
	r4.w = -r10.x + c19.y;
	r4.w = (c109.y * r4.w) + r10.x;
	r8.w = clamp(mix(r4.w, r10.x, r6.w), 0.0, 1.0);
	r9.xyz = r8.www * r9.xyz;
	r4.w = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r4.w = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r6.xyz = (r12.xyz * r7.www) + r6.xyz;
	r15.xyz = normalize(r6.xyz);
	r6.y = clamp(dot(r0.xyz, r15.xyz), 0.0, 1.0);
	r15 = s10_texture.sample(s10, v0.xy);
	r13.w = r15.w;
	r6.z = r13.w;
	r16 = s7_texture.sample(s7, r6.yz);
	r2.w = r2.w * r6.y;
	r16.xyz = r4.www * r16.xyz;
	r16.xyz = r3.xyz * r16.xyz;
	r4.xyz = (r12.xyz * r7.www) + r4.xyz;
	r17.xyz = normalize(r4.xyz);
	r13.x = clamp(dot(r0.xyz, r17.xyz), 0.0, 1.0);
	r17 = s7_texture.sample(s7, r13.xw);
	r4.x = r1.w * r13.x;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r17.xyz = r1.www * r17.xyz;
	r16.xyz = (r17.xyz * r2.xyz) + r16.xyz;
	r8.xyz = (r12.xyz * r7.www) + r8.xyz;
	r7.xyz = (r12.xyz * r7.www) + r7.xyz;
	r12.xyz = normalize(r7.xyz);
	r13.y = clamp(dot(r0.xyz, r12.xyz), 0.0, 1.0);
	r7 = s7_texture.sample(s7, r13.yw);
	r12 = s4_texture.sample(s4, r13.zw);
	r4.y = -r13.z + c19.y;
	r6.y = pow(abs(r4.y), c105.x);
	r7.xyz = r5.www * r7.xyz;
	r13.xyz = normalize(r8.xyz);
	r6.x = clamp(dot(r0.xyz, r13.xyz), 0.0, 1.0);
	r8 = s7_texture.sample(s7, r6.xz);
	r0.x = r3.w * r6.x;
	r0.y = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r0.x = r6.y * r0.x;
	r6.xzw = r0.yyy * r8.xyz;
	r6.xzw = (r6.xzw * r5.xyz) + r16.xyz;
	r6.xzw = (r7.xyz * r9.xyz) + r6.xzw;
	r6.xzw = r0.www * r6.xzw;
	r0.z = mix(c10.x, c10.y, r15.y);
	r6.xzw = (r6.xzw * r0.zzz) + r11.xyz;
	r6.xzw = r12.yyy * r6.xzw;
	r7.xyz = r14.zxy * c19.xxx;
	r7.xyz = (r14.zxy * c19.xxx) + -r7.zxy;
	r8.xy = c0.xy;
	r0.z = (c12.w * r8.x) + r8.y;
	r0.z = fract(r0.z);
	r0.z = (r0.z * c0.z) + c0.w;
	r8.xy = float2(cos(r0.z), sin(r0.z));
	r7.xyz = r7.xyz * r8.yyy;
	r7.xyz = (r14.xyz * r8.xxx) + r7.xyz;
	r0.z = -r8.x + c19.y;
	r0.w = dot(c19.xxx, r14.xyz);
	r0.w = r0.w * c19.x;
	r7.xyz = (r0.www * r0.zzz) + r7.xyz;
	r0.z = abs(c12.w);
	r7.xyz = ((-r0.z >= 0.0) ? r14.xyz : r7.xyz);
	r8.xyz = r7.xyz + c19.www;
	r8.xyz = (r15.yyy * r8.xyz) + c19.yyy;
	r6.xzw = r6.xzw * r8.xyz;
	r8.xyz = r7.xyz * r7.xyz;
	r8.xyz = r8.xyz * r8.xyz;
	r0.z = dot(r7.xyz, c27.xyz);
	r9.xyz = r0.zzz * r8.xyz;
	r0.w = dot(r8.xyz, c27.xyz);
	r8.xyz = mix(r7.xyz, r0.zzz, -c101.yyy);
	r0.z = r0.w + c29.w;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.z = ((r0.z >= 0.0) ? r0.w : c27.w);
	r9.xyz = (r9.xyz * r0.zzz) + -r7.xyz;
	r9.xyz = (c101.yyy * r9.xyz) + r7.xyz;
	r8.xyz = ((c101.y >= 0.0) ? r9.xyz : r8.xyz);
	r0.z = abs(c101.y);
	r8.xyz = ((-r0.z >= 0.0) ? r7.xyz : r8.xyz);
	r0.z = r2.w * r6.y;
	r0.w = r4.x * r6.y;
	r0.z = r4.w * r0.z;
	r2.w = (r0.w * r1.w) + r0.z;
	r3.xyz = r3.xyz * r0.zzz;
	r0.z = r1.w * r0.w;
	r2.xyz = (r0.zzz * r2.xyz) + r3.xyz;
	r0.z = (r0.x * r0.y) + r2.w;
	r0.x = r0.y * r0.x;
	r0.xyw = (r0.xxx * r5.xyz) + r2.xyz;
	r2.xy = r0.zz + -c33.xw;
	r2.zw = -c33.xw + c33.yz;
	r0.z = ((r2.z == 0.0) ? FLT_MAX : 1.0 / r2.z);
	r1.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r1.w = clamp(r1.w * r2.y, 0.0, 1.0);
	r0.z = clamp(r0.z * r2.x, 0.0, 1.0);
	r2.x = (r0.z * c26.z) + c26.w;
	r0.z = r0.z * r0.z;
	r0.z = r0.z * r2.x;
	r2.x = (r1.w * c26.z) + c26.w;
	r1.w = r1.w * r1.w;
	r1.w = r1.w * r2.x;
	r0.z = r0.z * r1.w;
	r2.y = c19.y;
	r1.w = (v6.w * c11.w) + r2.y;
	r2.x = r15.x * c105.y;
	r1.w = r1.w * r2.x;
	r0.xyw = r0.xyw * r1.www;
	r1.w = r15.y * c101.w;
	r2.xyz = (r7.xyz * r1.www) + -c106.xyz;
	r1.w = clamp(r1.w, 0.0, 1.0);
	r2.xyz = (r1.www * r2.xyz) + c106.xyz;
	r3.xyz = r0.xyw * r2.xyz;
	r1.w = dot(r3.xyz, c27.xyz);
	r0.z = r0.z * r1.w;
	r0.z = r0.z * c106.w;
	r1.w = dot(r1.xyz, c27.xyz);
	r1.xyz = (r0.xyw * r2.xyz) + r1.xyz;
	r1.x = dot(r1.xyz, c27.xyz);
	r1.x = r1.x + c26.x;
	r1.x = clamp(r1.x * c26.y, 0.0, 1.0);
	r1.yz = r1.ww + -c2.xw;
	r3.xy = -c2.xw + c2.yz;
	r1.w = ((r3.y == 0.0) ? FLT_MAX : 1.0 / r3.y);
	r2.w = ((r3.x == 0.0) ? FLT_MAX : 1.0 / r3.x);
	r1.y = clamp(r1.y * r2.w, 0.0, 1.0);
	r1.z = clamp(r1.w * r1.z, 0.0, 1.0);
	r1.w = (r1.z * c26.z) + c26.w;
	r1.z = r1.z * r1.z;
	r0.z = (r1.w * r1.z) + r0.z;
	r1.z = (r1.y * c26.z) + c26.w;
	r1.y = r1.y * r1.y;
	r1.y = r1.y * r1.z;
	r0.z = r0.z * r1.y;
	r1.yzw = mix(r7.xyz, r8.xyz, r0.zzz);
	r0.z = dot(r1.yzw, c27.xyz);
	r3.xyz = r0.zzz * c102.xyz;
	r4.xyz = c27.xyz;
	r0.z = dot(c102.xyz, r4.xyz);
	r2.w = r0.z + c29.w;
	r0.z = ((r0.z == 0.0) ? FLT_MAX : 1.0 / r0.z);
	r0.z = ((r2.w >= 0.0) ? r0.z : c27.w);
	r3.xyz = (r3.xyz * r0.zzz) + -r1.yzw;
	r3.xyz = (c102.www * r3.xyz) + r1.yzw;
	r0.z = clamp(c107.w + v6.w, 0.0, 1.0);
	r3.xyz = (r3.xyz * r0.zzz) + -r1.yzw;
	r0.z = (r1.x * c26.z) + c26.w;
	r1.x = r1.x * r1.x;
	r0.z = r0.z * r1.x;
	r1.xyz = (r0.zzz * r3.xyz) + r1.yzw;
	r1.xyz = r15.zzz * r1.xyz;
	r1.xyz = (r1.xyz * r10.yzw) + r6.xzw;
	r0.xyz = (r0.xyw * r2.xyz) + r1.xyz;
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

