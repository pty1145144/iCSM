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
	const float4 c2 = float4(1.591549367e-01, 5.000000000e-01, 6.283185482e+00, -3.141592741e+00); (void) c2;
	const float4 c26 = float4(0.000000000e+00, 1.000000000e+00, -4.000000060e-01, 1.953125000e-03); (void) c26;
	const float4 c27 = float4(-1.953125000e-03, 1.953125000e-03, 0.000000000e+00, 1.000000000e+00); (void) c27;
	const float4 c31 = float4(3.021148033e-03, 2.114803717e-02, 1.208459213e-02, 6.042296067e-02); (void) c31;
	const float4 c32 = float4(1.953125000e-03, 9.765625000e-04, 0.000000000e+00, 1.000000000e+00); (void) c32;
	const float4 c33 = float4(-9.765625000e-04, 1.953125000e-03, 0.000000000e+00, 1.000000000e+00); (void) c33;
	const float4 c34 = float4(9.969788790e-02, 1.661631465e-01, 1.399999976e+00, -3.000000119e-01); (void) c34;
	const float4 c35 = float4(5.773500204e-01, 1.000000000e+00, 2.000000000e+00, -1.000000000e+00); (void) c35;
	const float4 c36 = float4(-2.000000000e+00, 3.000000000e+00, -9.999999975e-07, 1.000000000e+06); (void) c36;
	const float4 c37 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -3.333333254e+00); (void) c37;
	const float4 c38 = float4(-1.953125000e-03, 9.765625000e-04, 0.000000000e+00, 1.000000000e+00); (void) c38;
	const float4 c39 = float4(-1.953125000e-03, -9.765625000e-04, 0.000000000e+00, 1.000000000e+00); (void) c39;
	const float4 c40 = float4(-9.765625000e-04, 9.765625000e-04, 0.000000000e+00, 1.000000000e+00); (void) c40;
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
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
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
	#define c19 uniforms.uniforms_float4[18]
	#define c20 uniforms.uniforms_float4[19]
	#define c21 uniforms.uniforms_float4[20]
	#define c22 uniforms.uniforms_float4[21]
	#define c23 uniforms.uniforms_float4[22]
	#define c24 uniforms.uniforms_float4[23]
	#define c25 uniforms.uniforms_float4[24]
	#define c28 uniforms.uniforms_float4[25]
	#define c29 uniforms.uniforms_float4[26]
	#define c30 uniforms.uniforms_float4[27]
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
	r1.xyz = r0.zxy * c35.xxx;
	r1.xyz = (r0.zxy * c35.xxx) + -r1.zxy;
	r2.xy = c2.xy;
	r0.w = (c12.w * r2.x) + r2.y;
	r0.w = fract(r0.w);
	r0.w = (r0.w * c2.z) + c2.w;
	r2.xy = float2(cos(r0.w), sin(r0.w));
	r1.xyz = r1.xyz * r2.yyy;
	r1.xyz = (r0.xyz * r2.xxx) + r1.xyz;
	r0.w = -r2.x + c35.y;
	r1.w = dot(c35.xxx, r0.xyz);
	r1.w = r1.w * c35.x;
	r1.xyz = (r1.www * r0.www) + r1.xyz;
	r0.w = abs(c12.w);
	r0.xyz = ((-r0.w >= 0.0) ? r0.xyz : r1.xyz);
	r0.w = dot(r0.xyz, c37.xyz);
	r1.xyz = r0.www * c102.xyz;
	r2.xyz = c37.xyz;
	r0.w = dot(c102.xyz, r2.xyz);
	r1.w = r0.w + c36.z;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r1.w >= 0.0) ? r0.w : c36.w);
	r1.xyz = (r1.xyz * r0.www) + -r0.xyz;
	r1.xyz = (c102.www * r1.xyz) + r0.xyz;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r1.xyz = (r1.xyz * r0.www) + -r0.xyz;
	r2 = (v5.xyzx * c26.yyyx) + c26.xxxy;
	r0.w = dot(r2, c18);
	r1.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r3.x = dot(r2, c15);
	r3.y = dot(r2, c16);
	r3.z = dot(r2, c17);
	r2.xyz = r1.www * r3.xyz;
	r3 = r2.xyzx * c26.yyyx;
	r4 = r3 + c26.wwxy;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c27;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c27.yxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c27.xxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r1.w = dot(r4, c31.xxxx);
	r4 = r3 + c26.wxxy;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c27.xzzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c26.xwxy;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c27.zxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r4.x = dot(r4, c31.yyyy);
	r1.w = r1.w + r4.x;
	r4 = r3 + c32;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c32.yxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c33;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c38;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r4.x = dot(r4, c31.zzzz);
	r1.w = r1.w + r4.x;
	r4 = r3 + c39;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c39.yxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c38.yxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c33.yxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r4.x = dot(r4, c31.zzzz);
	r1.w = r1.w + r4.x;
	r4 = r3 + c32.yyzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c40;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c40.yxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c33.xxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r4.x = dot(r4, c31.wwww);
	r1.w = r1.w + r4.x;
	r4 = r3 + c32.yzzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c33.xzzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c33.zxzw;
	r3 = r3 + c32.zyzw;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4.w = r3.x;
	r3 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r3.x;
	r3.x = dot(r4, c34.xxxx);
	r1.w = r1.w + r3.x;
	r2.w = c35.y;
	r3 = float4(s11_texture.sample_compare(s11, (r2.xyz).xy, (r2.xyz).z));
	r2 = s8_texture.sample(s8, r2.xy);
	r2.xyz = ((-r0.w >= 0.0) ? c26.xxx : r2.xyz);
	r0.w = (r3.x * c34.y) + r1.w;
	r1.w = pow(abs(r0.w), c34.z);
	r0.w = clamp(r1.w, 0.0, 1.0);
	r2.w = -r0.w + c35.y;
	r0.w = (c109.y * r2.w) + r0.w;
	r3.x = c35.y;
	r4.xyz = c14.xyz + -v5.xyz;
	r2.w = dot(r4.xyz, r4.xyz);
	r3.z = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r3.y = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r2.w = clamp(dot(c13.xyz, r3.xyz), 0.0, 1.0);
	r3.x = clamp(mix(r0.w, r1.w, r2.w), 0.0, 1.0);
	r5.xyz = r2.xyz * c28.xyz;
	r3.xzw = r3.xxx * r5.xyz;
	r4.xyz = r3.yyy * r4.xyz;
	r0.w = ((r3.y == 0.0) ? FLT_MAX : 1.0 / r3.y);
	r0.w = r0.w + -c13.w;
	r5 = s1_texture.sample(s1, v0.xy);
	r5.xyz = (r5.xyz * c35.zzz) + c35.www;
	r6.x = dot(v2.xyz, r5.xyz);
	r6.y = dot(v3.xyz, r5.xyz);
	r6.z = dot(v4.xyz, r5.xyz);
	r5.xyz = normalize(r6.xyz);
	r3.y = dot(r4.xyz, r5.xyz);
	r4.w = clamp(r3.y + c28.w, 0.0, 1.0);
	r3.y = clamp(r3.y, 0.0, 1.0);
	r3.y = ((r3.y == 0.0) ? FLT_MAX : rsqrt(abs(r3.y)));
	r3.y = ((r3.y == 0.0) ? FLT_MAX : 1.0 / r3.y);
	r4.w = r2.w * r4.w;
	r3.xzw = r3.xzw * r4.www;
	r6.z = c26.z;
	r4.w = r6.z * c13.w;
	r4.w = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r0.w = clamp(r0.w * r4.w, 0.0, 1.0);
	r6.x = ((r5.x >= 0.0) ? c26.x : c26.y);
	r6.y = ((r5.y >= 0.0) ? c26.x : c26.y);
	r6.z = ((r5.z >= 0.0) ? c26.x : c26.y);
	r7.xyz = r5.xyz * r5.xyz;
	r6.xyz = r6.xyz * r7.xyz;
	r8.xyz = r6.xxx * c5.xyz;
	r9.x = ((r5.x >= 0.0) ? c26.y : c26.x);
	r9.y = ((r5.y >= 0.0) ? c26.y : c26.x);
	r9.z = ((r5.z >= 0.0) ? c26.y : c26.x);
	r7.xyz = r7.xyz * r9.xyz;
	r8.xyz = (r7.xxx * c4.xyz) + r8.xyz;
	r7.xyw = (r7.yyy * c6.xyz) + r8.xyz;
	r6.xyw = (r6.yyy * c7.xyz) + r7.xyw;
	r6.xyw = (r7.zzz * c8.xyz) + r6.xyw;
	r6.xyz = (r6.zzz * c9.xyz) + r6.xyw;
	r7.xyz = c21.xyz + -v5.xyz;
	r8.xyz = normalize(r7.xyz);
	r4.w = clamp(dot(r5.xyz, r8.xyz), 0.0, 1.0);
	r6.w = (r4.w * r4.w) + r4.w;
	r6.w = r6.w * c2.y;
	r7.xyz = c20.xyz * v1.xxx;
	r6.xyz = (r7.xyz * r6.www) + r6.xyz;
	r9.xyz = c22.xyz * v1.yyy;
	r10.xyz = c23.xyz + -v5.xyz;
	r11.xyz = normalize(r10.xyz);
	r6.w = clamp(dot(r5.xyz, r11.xyz), 0.0, 1.0);
	r7.w = (r6.w * r6.w) + r6.w;
	r7.w = r7.w * c2.y;
	r6.xyz = (r9.xyz * r7.www) + r6.xyz;
	r10.xyz = c24.xyz * v1.zzz;
	r12.xyz = c25.xyz + -v5.xyz;
	r13.xyz = normalize(r12.xyz);
	r7.w = clamp(dot(r5.xyz, r13.xyz), 0.0, 1.0);
	r8.w = (r7.w * r7.w) + r7.w;
	r8.w = r8.w * c2.y;
	r6.xyz = (r10.xyz * r8.www) + r6.xyz;
	r12.x = c23.w + -v5.x;
	r12.y = c24.w + -v5.y;
	r12.z = c25.w + -v5.z;
	r14.xyz = normalize(r12.xyz);
	r8.w = clamp(dot(r5.xyz, r14.xyz), 0.0, 1.0);
	r9.w = (r8.w * r8.w) + r8.w;
	r9.w = r9.w * c2.y;
	r12.x = c20.w * v1.w;
	r12.y = c21.w * v1.w;
	r12.z = c22.w * v1.w;
	r6.xyz = (r12.xyz * r9.www) + r6.xyz;
	r3.xzw = (r3.xzw * r0.www) + r6.xyz;
	r0.w = r0.w * r2.w;
	r6.xyz = r0.www * c28.xyz;
	r2.xyz = r2.xyz * r6.xyz;
	r15 = s10_texture.sample(s10, v0.xy);
	r0.w = r15.y * c101.w;
	r6.xyz = (r0.xyz * r0.www) + -c106.xyz;
	r0.w = clamp(r0.w, 0.0, 1.0);
	r6.xyz = (r0.www * r6.xyz) + c106.xyz;
	r16.xyz = c3.xyz + -v5.xyz;
	r0.w = dot(r16.xyz, r16.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r11.xyz = (r16.xyz * r0.www) + r11.xyz;
	r17.xyz = normalize(r11.xyz);
	r11.z = clamp(dot(r5.xyz, r17.xyz), 0.0, 1.0);
	r9.w = r6.w * r11.z;
	r6.w = ((r6.w == 0.0) ? FLT_MAX : rsqrt(abs(r6.w)));
	r6.w = ((r6.w == 0.0) ? FLT_MAX : 1.0 / r6.w);
	r17.xyz = r0.www * r16.xyz;
	r10.w = dot(r17.xyz, r5.xyz);
	r18.z = clamp(r10.w, 0.0, 1.0);
	r10.w = r10.w + r10.w;
	r12.w = -r18.z + c35.y;
	r13.w = pow(abs(r12.w), c105.x);
	r9.w = r9.w * r13.w;
	r9.w = r6.w * r9.w;
	r19.xyz = r9.xyz * r9.www;
	r20.xyz = (r16.xyz * r0.www) + r8.xyz;
	r8.x = clamp(r8.z, 0.0, 1.0);
	r8.x = (r8.x * r8.x) + r8.x;
	r8.x = r8.x * c2.y;
	r8.xyz = r7.xyz * r8.xxx;
	r21.xyz = normalize(r20.xyz);
	r18.x = clamp(dot(r5.xyz, r21.xyz), 0.0, 1.0);
	r9.w = r4.w * r18.x;
	r4.w = ((r4.w == 0.0) ? FLT_MAX : rsqrt(abs(r4.w)));
	r4.w = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r9.w = r13.w * r9.w;
	r9.w = r4.w * r9.w;
	r19.xyz = (r9.www * r7.xyz) + r19.xyz;
	r13.xyz = (r16.xyz * r0.www) + r13.xyz;
	r20.xyz = normalize(r13.xyz);
	r11.y = clamp(dot(r5.xyz, r20.xyz), 0.0, 1.0);
	r9.w = r7.w * r11.y;
	r7.w = ((r7.w == 0.0) ? FLT_MAX : rsqrt(abs(r7.w)));
	r7.w = ((r7.w == 0.0) ? FLT_MAX : 1.0 / r7.w);
	r9.w = r13.w * r9.w;
	r9.w = r7.w * r9.w;
	r13.xyz = (r9.www * r10.xyz) + r19.xyz;
	r14.xyz = (r16.xyz * r0.www) + r14.xyz;
	r4.xyz = (r16.xyz * r0.www) + r4.xyz;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = clamp((r0.w * c19.w) + c19.x, 0.0, 1.0);
	r9.w = min(r0.w, c19.z);
	r0.w = r9.w * r9.w;
	r16.xyz = normalize(r4.xyz);
	r18.y = clamp(dot(r5.xyz, r16.xyz), 0.0, 1.0);
	r4.xyz = normalize(r14.xyz);
	r11.x = clamp(dot(r5.xyz, r4.xyz), 0.0, 1.0);
	r4.x = r8.w * r11.x;
	r4.y = ((r8.w == 0.0) ? FLT_MAX : rsqrt(abs(r8.w)));
	r4.y = ((r4.y == 0.0) ? FLT_MAX : 1.0 / r4.y);
	r4.x = r13.w * r4.x;
	r4.x = r4.y * r4.x;
	r13.xyz = (r4.xxx * r12.xyz) + r13.xyz;
	r14.y = c35.y;
	r4.x = (v6.w * c11.w) + r14.y;
	r4.z = r15.x * c105.y;
	r4.x = r4.x * r4.z;
	r13.xyz = r4.xxx * r13.xyz;
	r14.xyz = (r13.xyz * r6.xyz) + r3.xzw;
	r3.xzw = r3.xzw + v6.xyz;
	r4.x = dot(r14.xyz, c37.xyz);
	r4.x = r4.x + c34.w;
	r4.x = clamp(r4.x * c37.w, 0.0, 1.0);
	r4.z = (r4.x * c36.x) + c36.y;
	r4.x = r4.x * r4.x;
	r4.x = r4.x * r4.z;
	r1.xyz = (r4.xxx * r1.xyz) + r0.xyz;
	r0.xyz = r0.xyz + c35.www;
	r0.xyz = (r15.yyy * r0.xyz) + c35.yyy;
	r1.xyz = r15.zzz * r1.xyz;
	r18.w = r15.w;
	r14 = s7_texture.sample(s7, r18.xw);
	r4.xzw = r4.www * r14.xyz;
	r11.w = r18.w;
	r14 = s7_texture.sample(s7, r11.zw);
	r14.xyz = r6.www * r14.xyz;
	r9.xyz = r9.xyz * r14.xyz;
	r4.xzw = (r4.xzw * r7.xyz) + r9.xyz;
	r9 = s7_texture.sample(s7, r11.yw);
	r11 = s7_texture.sample(s7, r11.xw);
	r11.xyz = r4.yyy * r11.xyz;
	r9.xyz = r7.www * r9.xyz;
	r4.xyz = (r9.xyz * r10.xyz) + r4.xzw;
	r4.xyz = (r11.xyz * r12.xyz) + r4.xyz;
	r4.w = -r1.w + c35.y;
	r4.w = (c109.y * r4.w) + r1.w;
	r6.w = clamp(mix(r4.w, r1.w, r2.w), 0.0, 1.0);
	r2.xyz = r2.xyz * r6.www;
	r9 = s7_texture.sample(s7, r18.yw);
	r11 = s4_texture.sample(s4, r18.zw);
	r9.xyz = r3.yyy * r9.xyz;
	r2.xyz = (r9.xyz * r2.xyz) + r4.xyz;
	r2.xyz = r5.www * r2.xyz;
	r1.w = mix(c10.x, c10.y, r15.y);
	r2.w = r15.x * r11.z;
	r2.w = r2.w * c0.w;
	r2.xyz = r1.www * r2.xyz;
	r1.w = dot(r5.xyz, r5.xyz);
	r4.xyz = r17.xyz * r1.www;
	r4.xyz = (r10.www * r5.xyz) + -r4.xyz;
	r1.w = clamp(dot(r5.xyz, v9.xyz), 0.0, 1.0);
	r5.x = ((r4.x >= 0.0) ? c26.x : c26.y);
	r5.y = ((r4.y >= 0.0) ? c26.x : c26.y);
	r5.z = ((r4.z >= 0.0) ? c26.x : c26.y);
	r9.xyz = r4.xyz * r4.xyz;
	r4.x = ((r4.x >= 0.0) ? c26.y : c26.x);
	r4.y = ((r4.y >= 0.0) ? c26.y : c26.x);
	r4.z = ((r4.z >= 0.0) ? c26.y : c26.x);
	r4.xyz = r9.xyz * r4.xyz;
	r5.xyz = r5.xyz * r9.xyz;
	r9.xyz = r5.xxx * c5.xyz;
	r9.xyz = (r4.xxx * c4.xyz) + r9.xyz;
	r4.xyw = (r4.yyy * c6.xyz) + r9.xyz;
	r4.xyw = (r5.yyy * c7.xyz) + r4.xyw;
	r4.xyz = (r4.zzz * c8.xyz) + r4.xyw;
	r4.xyz = (r5.zzz * c9.xyz) + r4.xyz;
	r4.xyz = r8.xyz * r4.xyz;
	r5.x = v7.w;
	r5.y = v8.w;
	r5.z = v9.w;
	r5.xyz = -r5.xyz + c21.xyz;
	r8.xyz = normalize(r5.xyz);
	r3.y = clamp(dot(-v9.xyz, r8.xyz), 0.0, 1.0);
	r3.y = (r3.y * r3.y) + r3.y;
	r3.y = r3.y * c2.y;
	r5.xyz = r3.yyy * r7.xyz;
	r7.xyz = c0.xyz * v6.xyz;
	r5.xyz = (r7.xyz * r5.xyz) + -r4.xyz;
	r4.xyz = (r1.www * r5.xyz) + r4.xyz;
	r4.xyz = r2.www * r4.xyz;
	r2.xyz = (r2.xyz * r11.yyy) + r4.xyz;
	r0.xyz = r0.xyz * r2.xyz;
	r0.xyz = (r1.xyz * r3.xzw) + r0.xyz;
	r0.xyz = (r13.xyz * r6.xyz) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	oC0.xyz = (r0.www * r0.xyz) + r1.xyz;
	#undef c0
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
	#undef c29
	#undef c30
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

