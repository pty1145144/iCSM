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
	const float4 c22 = float4(1.591549367e-01, 5.000000000e-01, 6.283185482e+00, -3.141592741e+00); (void) c22;
	const float4 c23 = float4(5.773500204e-01, 1.000000000e+00, 2.000000000e+00, -1.000000000e+00); (void) c23;
	const float4 c24 = float4(-9.999999975e-07, 1.000000000e+06, -3.000000119e-01, -3.333333254e+00); (void) c24;
	const float4 c25 = float4(9.999997020e-01, 2.989999950e-01, 5.870000124e-01, 1.140000001e-01); (void) c25;
	const float4 c26 = float4(-2.000000000e+00, 3.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c26;
	const float4 c27 = float4(0.000000000e+00, 1.000000000e+00, -4.000000060e-01, 7.963267271e-04); (void) c27;
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
	#define c28 uniforms.uniforms_float4[22]
	#define c29 uniforms.uniforms_float4[23]
	#define c30 uniforms.uniforms_float4[24]
	#define c33 uniforms.uniforms_float4[25]
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
	#define v7 input.v7
	#define v8 input.v8
	#define v9 input.v9
	#define oC0 output.oC0
	r0.x = abs(c103.w);
	r1 = s1_texture.sample(s1, v0.xy);
	r0.yzw = (r1.xyz * c23.zzz) + c23.www;
	r1.x = dot(v2.xyz, r0.yzw);
	r1.y = dot(v3.xyz, r0.yzw);
	r1.z = dot(v4.xyz, r0.yzw);
	r2.xyz = normalize(r1.xyz);
	r0.yzw = r2.zxy * v8.yzx;
	r0.yzw = (r2.yzx * v8.zxy) + -r0.yzw;
	r1.xyz = normalize(r0.yzw);
	r0.yzw = r1.yzx * r2.zxy;
	r0.yzw = (r2.yzx * r1.zxy) + -r0.yzw;
	r1.xyz = r1.xyz * c27.www;
	r3.xyz = normalize(r0.yzw);
	r0.yzw = (r3.xyz * c25.xxx) + r1.xyz;
	r1.xyz = normalize(r0.yzw);
	r0.yzw = r2.xyz * r1.yzx;
	r0.yzw = (r1.xyz * r2.yzx) + -r0.yzw;
	r3.xyz = r1.yzx * r0.yzw;
	r0.yzw = (r0.wyz * r1.zxy) + -r3.xyz;
	r2.w = dot(r0.yzw, r0.yzw);
	r2.w = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r3.xyz = c3.xyz + -v5.xyz;
	r3.w = dot(r3.xyz, r3.xyz);
	r3.w = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r4.xyz = r3.www * r3.xyz;
	r0.yzw = (r0.yzw * r2.www) + -r4.xyz;
	r0.yzw = (c10.www * r0.yzw) + r4.xyz;
	r2.w = dot(r2.xyz, r0.yzw);
	r2.w = r2.w + r2.w;
	r4.w = dot(r2.xyz, r2.xyz);
	r0.yzw = r0.yzw * r4.www;
	r0.yzw = (r2.www * r2.xyz) + -r0.yzw;
	r5 = s6_texture.sample(s6, r0.yzw);
	r6.xyz = r5.xyz * c30.zzz;
	r7.xyz = r6.xyz * r6.xyz;
	r7.xyz = r7.xyz * r7.xyz;
	r2.w = dot(r7.xyz, c25.yzw);
	r4.w = r2.w + c24.x;
	r2.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r2.w = ((r4.w >= 0.0) ? r2.w : c24.y);
	r4.w = dot(r6.xyz, c25.yzw);
	r7.xyz = r4.www * r7.xyz;
	r5.xyz = (c30.zzz * -r5.xyz) + r4.www;
	r5.xyz = (-c103.www * r5.xyz) + r6.xyz;
	r7.xyz = (r7.xyz * r2.www) + -r6.xyz;
	r7.xyz = (c103.www * r7.xyz) + r6.xyz;
	r5.xyz = ((c103.w >= 0.0) ? r7.xyz : r5.xyz);
	r5.xyz = ((-r0.x >= 0.0) ? r6.xyz : r5.xyz);
	r6.x = ((r2.x >= 0.0) ? c27.x : c27.y);
	r6.y = ((r2.y >= 0.0) ? c27.x : c27.y);
	r6.z = ((r2.z >= 0.0) ? c27.x : c27.y);
	r7.xyz = r2.xyz * r2.xyz;
	r6.xyz = r6.xyz * r7.xyz;
	r8.xyz = r6.xxx * c5.xyz;
	r9.x = ((r2.x >= 0.0) ? c27.y : c27.x);
	r9.y = ((r2.y >= 0.0) ? c27.y : c27.x);
	r9.z = ((r2.z >= 0.0) ? c27.y : c27.x);
	r7.xyz = r7.xyz * r9.xyz;
	r8.xyz = (r7.xxx * c4.xyz) + r8.xyz;
	r7.xyw = (r7.yyy * c6.xyz) + r8.xyz;
	r6.xyw = (r6.yyy * c7.xyz) + r7.xyw;
	r6.xyw = (r7.zzz * c8.xyz) + r6.xyw;
	r6.xyz = (r6.zzz * c9.xyz) + r6.xyw;
	r7.xyz = c21.xyz + -v5.xyz;
	r8.xyz = normalize(r7.xyz);
	r0.x = clamp(dot(r2.xyz, r8.xyz), 0.0, 1.0);
	r2.w = (r0.x * r0.x) + r0.x;
	r2.w = r2.w * c22.y;
	r7.xyz = c20.xyz * v1.xxx;
	r6.xyz = (r7.xyz * r2.www) + r6.xyz;
	r9 = (v5.xyzx * c27.yyyx) + c27.xxxy;
	r2.w = dot(r9, c18);
	r4.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r10.x = dot(r9, c15);
	r10.y = dot(r9, c16);
	r10.z = dot(r9, c17);
	r9.xyz = r4.www * r10.xyz;
	r10 = s8_texture.sample(s8, r9.xy);
	r10.xyz = ((-r2.w >= 0.0) ? c27.xxx : r10.xyz);
	r11.xyz = r10.xyz * c28.xyz;
	r9.w = c23.y;
	r9 = float4(s11_texture.sample_compare(s11, (r9.xyz).xy, (r9.xyz).z));
	r2.w = clamp(r9.x, 0.0, 1.0);
	r4.w = -r2.w + c23.y;
	r2.w = (c109.y * r4.w) + r2.w;
	r12.x = c23.y;
	r9.yzw = c14.xyz + -v5.xyz;
	r4.w = dot(r9.yzw, r9.yzw);
	r12.z = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r12.y = ((r4.w == 0.0) ? FLT_MAX : rsqrt(abs(r4.w)));
	r4.w = clamp(dot(c13.xyz, r12.xyz), 0.0, 1.0);
	r5.w = clamp(mix(r2.w, r9.x, r4.w), 0.0, 1.0);
	r11.xyz = r5.www * r11.xyz;
	r9.yzw = r9.yzw * r12.yyy;
	r2.w = ((r12.y == 0.0) ? FLT_MAX : 1.0 / r12.y);
	r2.w = r2.w + -c13.w;
	r5.w = dot(r9.yzw, r2.xyz);
	r9.yzw = (r3.xyz * r3.www) + r9.yzw;
	r3.xyz = (r3.xyz * r3.www) + r8.xyz;
	r3.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r3.w = clamp((r3.w * c19.w) + c19.x, 0.0, 1.0);
	r6.w = min(r3.w, c19.z);
	r3.w = r6.w * r6.w;
	r12.xyz = normalize(r3.xyz);
	r3.x = clamp(dot(r2.xyz, r12.xyz), 0.0, 1.0);
	r12.xyz = normalize(r9.yzw);
	r3.y = clamp(dot(r2.xyz, r12.xyz), 0.0, 1.0);
	r3.z = clamp(r5.w + c28.w, 0.0, 1.0);
	r5.w = clamp(r5.w, 0.0, 1.0);
	r5.w = ((r5.w == 0.0) ? FLT_MAX : rsqrt(abs(r5.w)));
	r5.w = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r3.z = r3.z * r4.w;
	r9.yzw = r11.xyz * r3.zzz;
	r3.z = c27.z;
	r3.z = r3.z * c13.w;
	r3.z = ((r3.z == 0.0) ? FLT_MAX : 1.0 / r3.z);
	r2.w = clamp(r2.w * r3.z, 0.0, 1.0);
	r6.xyz = (r9.yzw * r2.www) + r6.xyz;
	r2.w = r2.w * r4.w;
	r9.yzw = r2.www * c28.xyz;
	r9.yzw = r9.yzw * r10.xyz;
	r10.xyz = r6.xyz + v6.xyz;
	r11.xyz = r10.xyz + -c103.xxx;
	r11.xyz = clamp(r11.xyz * c103.yyy, float3(0.0), float3(1.0));
	r11.xyz = (r5.xyz * r11.xyz) + -r5.xyz;
	r5.xyz = (c101.xxx * r11.xyz) + r5.xyz;
	r11.xyz = (r5.xyz * r5.xyz) + -r5.xyz;
	r5.xyz = (c103.zzz * r11.xyz) + r5.xyz;
	r11 = s0_texture.sample(s0, v0.xy);
	r12.xyz = r11.www * c104.xyz;
	r5.xyz = r5.xyz * r12.xyz;
	r2.w = -r9.x + c23.y;
	r2.w = (c109.y * r2.w) + r9.x;
	r3.z = clamp(mix(r2.w, r9.x, r4.w), 0.0, 1.0);
	r9.xyz = r3.zzz * r9.yzw;
	r2.w = -r3.y + c23.y;
	r12.y = (c10.w * r2.w) + r3.y;
	r13 = s10_texture.sample(s10, v0.xy);
	r12.w = r13.w;
	r14 = s7_texture.sample(s7, r12.yw);
	r14.xyz = r5.www * r14.xyz;
	r9.xyz = r9.xyz * r14.xyz;
	r1.y = dot(r4.xyz, r1.xyz);
	r1.x = dot(r8.xyz, r1.xxx);
	r1.z = clamp(r8.z, 0.0, 1.0);
	r1.z = (r1.z * r1.z) + r1.z;
	r1.z = r1.z * c22.y;
	r8.xyz = r1.zzz * r7.xyz;
	r12.z = clamp(dot(r4.xyz, r2.xyz), 0.0, 1.0);
	r1.z = clamp(dot(r2.xyz, v9.xyz), 0.0, 1.0);
	r2.x = (r1.y * -r1.y) + c23.y;
	r2.x = ((r2.x == 0.0) ? FLT_MAX : rsqrt(abs(r2.x)));
	r2.x = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r2.y = (r1.x * -r1.x) + c23.y;
	r2.y = ((r2.y == 0.0) ? FLT_MAX : rsqrt(abs(r2.y)));
	r2.y = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r2.x = r2.y * r2.x;
	r1.x = clamp((r1.y * r1.x) + r2.x, 0.0, 1.0);
	r12.x = mix(r3.x, r1.x, c10.w);
	r2 = s7_texture.sample(s7, r12.xw);
	r1.x = r0.x * r12.x;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r4 = s4_texture.sample(s4, r12.zw);
	r1.y = -r12.z + c23.y;
	r2.w = pow(abs(r1.y), c105.x);
	r1.x = r1.x * r2.w;
	r2.xyz = r0.xxx * r2.xyz;
	r2.xyz = (r2.xyz * r7.xyz) + r9.xyz;
	r2.xyz = r1.www * r2.xyz;
	r1.y = mix(c10.x, c10.y, r13.y);
	r2.xyz = (r2.xyz * r1.yyy) + r5.xyz;
	r3.x = ((r0.y >= 0.0) ? c27.x : c27.y);
	r3.y = ((r0.z >= 0.0) ? c27.x : c27.y);
	r3.z = ((r0.w >= 0.0) ? c27.x : c27.y);
	r5.xyz = r0.yzw * r0.yzw;
	r0.y = ((r0.y >= 0.0) ? c27.y : c27.x);
	r0.z = ((r0.z >= 0.0) ? c27.y : c27.x);
	r0.w = ((r0.w >= 0.0) ? c27.y : c27.x);
	r0.yzw = r5.xyz * r0.yzw;
	r3.xyz = r3.xyz * r5.xyz;
	r5.xyz = r3.xxx * c5.xyz;
	r5.xyz = (r0.yyy * c4.xyz) + r5.xyz;
	r5.xyz = (r0.zzz * c6.xyz) + r5.xyz;
	r5.xyz = (r3.yyy * c7.xyz) + r5.xyz;
	r0.yzw = (r0.www * c8.xyz) + r5.xyz;
	r0.yzw = (r3.zzz * c9.xyz) + r0.yzw;
	r0.yzw = r8.xyz * r0.yzw;
	r3.x = v7.w;
	r3.y = v8.w;
	r3.z = v9.w;
	r3.xyz = -r3.xyz + c21.xyz;
	r5.xyz = normalize(r3.xyz);
	r1.y = clamp(dot(-v9.xyz, r5.xyz), 0.0, 1.0);
	r1.y = (r1.y * r1.y) + r1.y;
	r1.y = r1.y * c22.y;
	r3.xyz = r1.yyy * r7.xyz;
	r5.xyz = c0.xyz * v6.xyz;
	r3.xyz = (r5.xyz * r3.xyz) + -r0.yzw;
	r0.yzw = (r1.zzz * r3.xyz) + r0.yzw;
	r1.y = r13.x * r4.z;
	r1.y = r1.y * c0.w;
	r0.yzw = r0.yzw * r1.yyy;
	r0.yzw = (r2.xyz * r4.yyy) + r0.yzw;
	r1.yzw = r11.zxy * c23.xxx;
	r1.yzw = (r11.zxy * c23.xxx) + -r1.wyz;
	r2.xy = c22.xy;
	r2.x = (c12.w * r2.x) + r2.y;
	r2.x = fract(r2.x);
	r2.x = (r2.x * c22.z) + c22.w;
	r4.xy = float2(cos(r2.x), sin(r2.x));
	r1.yzw = r1.yzw * r4.yyy;
	r1.yzw = (r11.xyz * r4.xxx) + r1.yzw;
	r2.x = -r4.x + c23.y;
	r2.y = dot(c23.xxx, r11.xyz);
	r2.y = r2.y * c23.x;
	r1.yzw = (r2.yyy * r2.xxx) + r1.yzw;
	r2.x = abs(c12.w);
	r1.yzw = ((-r2.x >= 0.0) ? r11.xyz : r1.yzw);
	r2.xyz = r1.yzw + c23.www;
	r2.xyz = (r13.yyy * r2.xyz) + c23.yyy;
	r0.yzw = r0.yzw * r2.xyz;
	r2.xyz = r1.yzw * r1.yzw;
	r2.xyz = r2.xyz * r2.xyz;
	r2.w = dot(r1.yzw, c25.yzw);
	r3.xyz = r2.www * r2.xyz;
	r2.x = dot(r2.xyz, c25.yzw);
	r4.xyz = mix(r1.yzw, r2.www, -c101.yyy);
	r2.y = r2.x + c24.x;
	r2.x = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r2.x = ((r2.y >= 0.0) ? r2.x : c24.y);
	r2.xyz = (r3.xyz * r2.xxx) + -r1.yzw;
	r2.xyz = (c101.yyy * r2.xyz) + r1.yzw;
	r2.xyz = ((c101.y >= 0.0) ? r2.xyz : r4.xyz);
	r2.w = abs(c101.y);
	r2.xyz = ((-r2.w >= 0.0) ? r1.yzw : r2.xyz);
	r3.xy = (r1.xx * r0.xx) + -c33.xw;
	r0.x = r0.x * r1.x;
	r4.xyz = r7.xyz * r0.xxx;
	r5.xy = -c33.xw + c33.yz;
	r0.x = ((r5.x == 0.0) ? FLT_MAX : 1.0 / r5.x);
	r1.x = ((r5.y == 0.0) ? FLT_MAX : 1.0 / r5.y);
	r1.x = clamp(r1.x * r3.y, 0.0, 1.0);
	r0.x = clamp(r0.x * r3.x, 0.0, 1.0);
	r2.w = (r0.x * c26.x) + c26.y;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r2.w;
	r2.w = (r1.x * c26.x) + c26.y;
	r1.x = r1.x * r1.x;
	r1.x = r1.x * r2.w;
	r0.x = r0.x * r1.x;
	r3.y = c23.y;
	r1.x = (v6.w * c11.w) + r3.y;
	r2.w = r13.x * c105.y;
	r1.x = r1.x * r2.w;
	r3.xyz = r1.xxx * r4.xyz;
	r1.x = r13.y * c101.w;
	r4.xyz = (r1.yzw * r1.xxx) + -c106.xyz;
	r1.x = clamp(r1.x, 0.0, 1.0);
	r4.xyz = (r1.xxx * r4.xyz) + c106.xyz;
	r5.xyz = r3.xyz * r4.xyz;
	r1.x = dot(r5.xyz, c25.yzw);
	r0.x = r0.x * r1.x;
	r0.x = r0.x * c106.w;
	r1.x = dot(r6.xyz, c25.yzw);
	r5.xyz = (r3.xyz * r4.xyz) + r6.xyz;
	r2.w = dot(r5.xyz, c25.yzw);
	r2.w = r2.w + c24.z;
	r2.w = clamp(r2.w * c24.w, 0.0, 1.0);
	r5.xy = r1.xx + -c2.xw;
	r5.zw = -c2.xw + c2.yz;
	r1.x = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r4.w = ((r5.z == 0.0) ? FLT_MAX : 1.0 / r5.z);
	r4.w = clamp(r4.w * r5.x, 0.0, 1.0);
	r1.x = clamp(r1.x * r5.y, 0.0, 1.0);
	r5.x = (r1.x * c26.x) + c26.y;
	r1.x = r1.x * r1.x;
	r0.x = (r5.x * r1.x) + r0.x;
	r1.x = (r4.w * c26.x) + c26.y;
	r4.w = r4.w * r4.w;
	r1.x = r1.x * r4.w;
	r0.x = r0.x * r1.x;
	r5.xyz = mix(r1.yzw, r2.xyz, r0.xxx);
	r0.x = dot(r5.xyz, c25.yzw);
	r1.xyz = r0.xxx * c102.xyz;
	r6.yzw = c25.yzw;
	r0.x = dot(c102.xyz, r6.yzw);
	r1.w = r0.x + c24.x;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = ((r1.w >= 0.0) ? r0.x : c24.y);
	r1.xyz = (r1.xyz * r0.xxx) + -r5.xyz;
	r1.xyz = (c102.www * r1.xyz) + r5.xyz;
	r0.x = clamp(c107.w + v6.w, 0.0, 1.0);
	r1.xyz = (r1.xyz * r0.xxx) + -r5.xyz;
	r0.x = (r2.w * c26.x) + c26.y;
	r1.w = r2.w * r2.w;
	r0.x = r0.x * r1.w;
	r1.xyz = (r0.xxx * r1.xyz) + r5.xyz;
	r1.xyz = r13.zzz * r1.xyz;
	r0.xyz = (r1.xyz * r10.xyz) + r0.yzw;
	r0.xyz = (r3.xyz * r4.xyz) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	oC0.xyz = (r3.www * r0.xyz) + r1.xyz;
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
	#undef c19
	#undef c20
	#undef c21
	#undef c28
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

