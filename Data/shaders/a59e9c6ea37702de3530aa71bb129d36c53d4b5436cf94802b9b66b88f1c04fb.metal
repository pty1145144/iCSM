#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[37];
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
	const float4 c26 = float4(1.591549367e-01, 5.000000000e-01, 6.283185482e+00, -3.141592741e+00); (void) c26;
	const float4 c27 = float4(5.773500204e-01, 1.000000000e+00, 2.000000000e+00, -1.000000000e+00); (void) c27;
	const float4 c29 = float4(3.021148033e-03, 2.114803717e-02, 1.208459213e-02, 6.042296067e-02); (void) c29;
	const float4 c31 = float4(1.953125000e-03, 9.765625000e-04, 0.000000000e+00, 1.000000000e+00); (void) c31;
	const float4 c32 = float4(-9.765625000e-04, 1.953125000e-03, 0.000000000e+00, 1.000000000e+00); (void) c32;
	const float4 c34 = float4(0.000000000e+00, 1.000000000e+00, -4.000000060e-01, 1.953125000e-03); (void) c34;
	const float4 c35 = float4(-1.953125000e-03, 1.953125000e-03, 0.000000000e+00, 1.000000000e+00); (void) c35;
	const float4 c36 = float4(9.969788790e-02, 1.661631465e-01, 1.399999976e+00, -9.999999975e-07); (void) c36;
	const float4 c37 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, 1.000000000e+06); (void) c37;
	const float4 c38 = float4(-3.000000119e-01, -3.333333254e+00, -2.000000000e+00, 3.000000000e+00); (void) c38;
	const float4 c39 = float4(-1.953125000e-03, 9.765625000e-04, 0.000000000e+00, 1.000000000e+00); (void) c39;
	const float4 c40 = float4(-1.953125000e-03, -9.765625000e-04, 0.000000000e+00, 1.000000000e+00); (void) c40;
	const float4 c41 = float4(-9.765625000e-04, 9.765625000e-04, 0.000000000e+00, 1.000000000e+00); (void) c41;
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
	#define c24 uniforms.uniforms_float4[24]
	#define c25 uniforms.uniforms_float4[25]
	#define c28 uniforms.uniforms_float4[26]
	#define c30 uniforms.uniforms_float4[27]
	#define c33 uniforms.uniforms_float4[28]
	#define c101 uniforms.uniforms_float4[29]
	#define c102 uniforms.uniforms_float4[30]
	#define c103 uniforms.uniforms_float4[31]
	#define c104 uniforms.uniforms_float4[32]
	#define c105 uniforms.uniforms_float4[33]
	#define c106 uniforms.uniforms_float4[34]
	#define c107 uniforms.uniforms_float4[35]
	#define c109 uniforms.uniforms_float4[36]
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
	r0.x = c19.y + -v5.z;
	r0.x = r0.x + -c27.z;
	oC0.w = clamp(r0.x * c19.w, 0.0, 1.0);
	r0 = (v5.xyzx * c34.yyyx) + c34.xxxy;
	r1.x = dot(r0, c18);
	r1.y = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r2.x = dot(r0, c15);
	r2.y = dot(r0, c16);
	r2.z = dot(r0, c17);
	r0.xyz = r1.yyy * r2.xyz;
	r2 = r0.xyzx * c34.yyyx;
	r3 = r2 + c34.wwxy;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c35;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c35.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c35.xxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.y = dot(r3, c29.xxxx);
	r3 = r2 + c34.wxxy;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c35.xzzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c34.xwxy;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c35.zxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c29.yyyy);
	r1.y = r1.z + r1.y;
	r3 = r2 + c31;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c31.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c32;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c39;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c29.zzzz);
	r1.y = r1.z + r1.y;
	r3 = r2 + c40;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c40.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c39.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c32.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c29.zzzz);
	r1.y = r1.z + r1.y;
	r3 = r2 + c31.yyzw;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c41;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c41.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c32.xxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c29.wwww);
	r1.y = r1.z + r1.y;
	r3 = r2 + c31.yzzw;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c32.xzzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c32.zxzw;
	r2 = r2 + c31.zyzw;
	r2 = float4(s11_texture.sample_compare(s11, (r2.xyz).xy, (r2.xyz).z));
	r3.w = r2.x;
	r2 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r2.x;
	r1.z = dot(r3, c36.xxxx);
	r1.y = r1.z + r1.y;
	r0.w = c27.y;
	r2 = float4(s11_texture.sample_compare(s11, (r0.xyz).xy, (r0.xyz).z));
	r0 = s8_texture.sample(s8, r0.xy);
	r0.xyz = ((-r1.x >= 0.0) ? c34.xxx : r0.xyz);
	r0.w = (r2.x * c36.y) + r1.y;
	r1.x = pow(abs(r0.w), c36.z);
	r0.w = -r1.x + c27.y;
	r0.w = (c109.y * r0.w) + r1.x;
	r2.x = c27.y;
	r1.yzw = c14.xyz + -v5.xyz;
	r2.w = dot(r1.yzw, r1.yzw);
	r2.z = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r2.y = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r2.x = clamp(dot(c13.xyz, r2.xyz), 0.0, 1.0);
	r3.x = clamp(mix(r0.w, r1.x, r2.x), 0.0, 1.0);
	r0.w = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r1.yzw = r1.yzw * r2.yyy;
	r0.w = r0.w + -c13.w;
	r2.z = c34.z;
	r2.y = r2.z * c13.w;
	r2.y = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r0.w = clamp(r0.w * r2.y, 0.0, 1.0);
	r2.y = r0.w * r2.x;
	r2.yzw = r2.yyy * c28.xyz;
	r2.yzw = r0.xyz * r2.yzw;
	r0.xyz = r0.xyz * c28.xyz;
	r2.yzw = r3.xxx * r2.yzw;
	r3.xyz = c22.xyz * v1.yyy;
	r4.xyz = c23.xyz + -v5.xyz;
	r5.xyz = normalize(r4.xyz);
	r4 = s1_texture.sample(s1, v0.xy);
	r4.xyz = (r4.xyz * c27.zzz) + c27.www;
	r6.x = dot(v2.xyz, r4.xyz);
	r6.y = dot(v3.xyz, r4.xyz);
	r6.z = dot(v4.xyz, r4.xyz);
	r4.xyz = normalize(r6.xyz);
	r3.w = clamp(dot(r4.xyz, r5.xyz), 0.0, 1.0);
	r5.w = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r5.w = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r6.xyz = c3.xyz + -v5.xyz;
	r6.w = dot(r6.xyz, r6.xyz);
	r6.w = ((r6.w == 0.0) ? FLT_MAX : rsqrt(abs(r6.w)));
	r5.xyz = (r6.xyz * r6.www) + r5.xyz;
	r7.xyz = normalize(r5.xyz);
	r5.y = clamp(dot(r4.xyz, r7.xyz), 0.0, 1.0);
	r7 = s10_texture.sample(s10, v0.xy);
	r8.w = r7.w;
	r5.z = r8.w;
	r9 = s7_texture.sample(s7, r5.yz);
	r5.y = r3.w * r5.y;
	r3.w = (r3.w * r3.w) + r3.w;
	r3.w = r3.w * c26.y;
	r9.xyz = r5.www * r9.xyz;
	r9.xyz = r3.xyz * r9.xyz;
	r10.xyz = c21.xyz + -v5.xyz;
	r11.xyz = normalize(r10.xyz);
	r10.xyz = (r6.xyz * r6.www) + r11.xyz;
	r12.xyz = normalize(r10.xyz);
	r8.x = clamp(dot(r4.xyz, r12.xyz), 0.0, 1.0);
	r10 = s7_texture.sample(s7, r8.xw);
	r7.w = clamp(dot(r4.xyz, r11.xyz), 0.0, 1.0);
	r9.w = clamp(r11.z, 0.0, 1.0);
	r9.w = (r9.w * r9.w) + r9.w;
	r9.w = r9.w * c26.y;
	r10.w = ((r7.w == 0.0) ? FLT_MAX : rsqrt(abs(r7.w)));
	r10.w = ((r10.w == 0.0) ? FLT_MAX : 1.0 / r10.w);
	r10.xyz = r10.www * r10.xyz;
	r11.xyz = c20.xyz * v1.xxx;
	r9.xyz = (r10.xyz * r11.xyz) + r9.xyz;
	r10.xyz = c24.xyz * v1.zzz;
	r12.xyz = c25.xyz + -v5.xyz;
	r13.xyz = normalize(r12.xyz);
	r12.xyz = (r6.xyz * r6.www) + r13.xyz;
	r11.w = clamp(dot(r4.xyz, r13.xyz), 0.0, 1.0);
	r13.xyz = normalize(r12.xyz);
	r5.x = clamp(dot(r4.xyz, r13.xyz), 0.0, 1.0);
	r12 = s7_texture.sample(s7, r5.xz);
	r5.x = r11.w * r5.x;
	r5.z = ((r11.w == 0.0) ? FLT_MAX : rsqrt(abs(r11.w)));
	r11.w = (r11.w * r11.w) + r11.w;
	r11.w = r11.w * c26.y;
	r5.z = ((r5.z == 0.0) ? FLT_MAX : 1.0 / r5.z);
	r12.xyz = r5.zzz * r12.xyz;
	r9.xyz = (r12.xyz * r10.xyz) + r9.xyz;
	r12.x = dot(r1.yzw, r4.xyz);
	r1.yzw = (r6.xyz * r6.www) + r1.yzw;
	r6.xyz = r6.www * r6.xyz;
	r13.xyz = normalize(r1.yzw);
	r8.y = clamp(dot(r4.xyz, r13.xyz), 0.0, 1.0);
	r13 = s7_texture.sample(s7, r8.yw);
	r1.y = clamp(r12.x, 0.0, 1.0);
	r1.z = clamp(r12.x + c28.w, 0.0, 1.0);
	r1.z = r1.z * r2.x;
	r1.y = ((r1.y == 0.0) ? FLT_MAX : rsqrt(abs(r1.y)));
	r1.y = ((r1.y == 0.0) ? FLT_MAX : 1.0 / r1.y);
	r12.xyz = r1.yyy * r13.xyz;
	r2.yzw = (r12.xyz * r2.yzw) + r9.xyz;
	r2.yzw = r4.www * r2.yzw;
	r1.y = clamp(r1.x, 0.0, 1.0);
	r1.w = -r1.y + c27.y;
	r1.y = (c109.y * r1.w) + r1.y;
	r4.w = clamp(mix(r1.y, r1.x, r2.x), 0.0, 1.0);
	r0.xyz = r0.xyz * r4.www;
	r0.xyz = r0.xyz * r1.zzz;
	r1.x = ((r4.x >= 0.0) ? c34.x : c34.y);
	r1.y = ((r4.y >= 0.0) ? c34.x : c34.y);
	r1.z = ((r4.z >= 0.0) ? c34.x : c34.y);
	r9.xyz = r4.xyz * r4.xyz;
	r1.xyz = r1.xyz * r9.xyz;
	r12.xyz = r1.xxx * c5.xyz;
	r13.x = ((r4.x >= 0.0) ? c34.y : c34.x);
	r13.y = ((r4.y >= 0.0) ? c34.y : c34.x);
	r13.z = ((r4.z >= 0.0) ? c34.y : c34.x);
	r9.xyz = r9.xyz * r13.xyz;
	r12.xyz = (r9.xxx * c4.xyz) + r12.xyz;
	r12.xyz = (r9.yyy * c6.xyz) + r12.xyz;
	r1.xyw = (r1.yyy * c7.xyz) + r12.xyz;
	r1.xyw = (r9.zzz * c8.xyz) + r1.xyw;
	r1.xyz = (r1.zzz * c9.xyz) + r1.xyw;
	r1.w = (r7.w * r7.w) + r7.w;
	r2.x = r7.w * r8.x;
	r1.w = r1.w * c26.y;
	r1.xyz = (r11.xyz * r1.www) + r1.xyz;
	r1.xyz = (r3.xyz * r3.www) + r1.xyz;
	r1.xyz = (r10.xyz * r11.www) + r1.xyz;
	r0.xyz = (r0.xyz * r0.www) + r1.xyz;
	r1.xyz = r0.xyz + v6.xyz;
	r9.xyz = r1.xyz + -c103.xxx;
	r9.xyz = clamp(r9.xyz * c103.yyy, float3(0.0), float3(1.0));
	r0.w = dot(r4.xyz, r4.xyz);
	r12.xyz = r6.xyz * r0.www;
	r8.z = dot(r6.xyz, r4.xyz);
	r0.w = r8.z + r8.z;
	r8.z = clamp(r8.z, 0.0, 1.0);
	r6.xyz = (r0.www * r4.xyz) + -r12.xyz;
	r0.w = clamp(dot(r4.xyz, v9.xyz), 0.0, 1.0);
	r4 = s6_texture.sample(s6, r6.xyz);
	r12.xyz = r4.xyz * c30.zzz;
	r13.xyz = r12.xyz * r12.xyz;
	r13.xyz = r13.xyz * r13.xyz;
	r1.w = dot(r13.xyz, c37.xyz);
	r3.w = r1.w + c36.w;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = ((r3.w >= 0.0) ? r1.w : c37.w);
	r3.w = dot(r12.xyz, c37.xyz);
	r13.xyz = r3.www * r13.xyz;
	r4.xyz = (c30.zzz * -r4.xyz) + r3.www;
	r4.xyz = (-c103.www * r4.xyz) + r12.xyz;
	r13.xyz = (r13.xyz * r1.www) + -r12.xyz;
	r13.xyz = (c103.www * r13.xyz) + r12.xyz;
	r4.xyz = ((c103.w >= 0.0) ? r13.xyz : r4.xyz);
	r1.w = abs(c103.w);
	r4.xyz = ((-r1.w >= 0.0) ? r12.xyz : r4.xyz);
	r9.xyz = (r4.xyz * r9.xyz) + -r4.xyz;
	r4.xyz = (c101.xxx * r9.xyz) + r4.xyz;
	r9.xyz = (r4.xyz * r4.xyz) + -r4.xyz;
	r4.xyz = (c103.zzz * r9.xyz) + r4.xyz;
	r12 = s0_texture.sample(s0, v0.xy);
	r9.xyz = r12.www * c104.xyz;
	r4.xyz = r4.xyz * r9.xyz;
	r1.w = mix(c10.x, c10.y, r7.y);
	r2.yzw = (r2.yzw * r1.www) + r4.xyz;
	r4.x = ((r6.x >= 0.0) ? c34.x : c34.y);
	r4.y = ((r6.y >= 0.0) ? c34.x : c34.y);
	r4.z = ((r6.z >= 0.0) ? c34.x : c34.y);
	r9.xyz = r6.xyz * r6.xyz;
	r6.x = ((r6.x >= 0.0) ? c34.y : c34.x);
	r6.y = ((r6.y >= 0.0) ? c34.y : c34.x);
	r6.z = ((r6.z >= 0.0) ? c34.y : c34.x);
	r6.xyz = r9.xyz * r6.xyz;
	r4.xyz = r4.xyz * r9.xyz;
	r9.xyz = r4.xxx * c5.xyz;
	r9.xyz = (r6.xxx * c4.xyz) + r9.xyz;
	r6.xyw = (r6.yyy * c6.xyz) + r9.xyz;
	r4.xyw = (r4.yyy * c7.xyz) + r6.xyw;
	r4.xyw = (r6.zzz * c8.xyz) + r4.xyw;
	r4.xyz = (r4.zzz * c9.xyz) + r4.xyw;
	r6.xyz = r9.www * r11.xyz;
	r4.xyz = r4.xyz * r6.xyz;
	r6.x = v7.w;
	r6.y = v8.w;
	r6.z = v9.w;
	r6.xyz = -r6.xyz + c21.xyz;
	r9.xyz = normalize(r6.xyz);
	r1.w = clamp(dot(-v9.xyz, r9.xyz), 0.0, 1.0);
	r1.w = (r1.w * r1.w) + r1.w;
	r1.w = r1.w * c26.y;
	r6.xyz = r1.www * r11.xyz;
	r9.xyz = c0.xyz * v6.xyz;
	r6.xyz = (r9.xyz * r6.xyz) + -r4.xyz;
	r4.xyz = (r0.www * r6.xyz) + r4.xyz;
	r6 = s4_texture.sample(s4, r8.zw);
	r0.w = -r8.z + c27.y;
	r1.w = pow(abs(r0.w), c105.x);
	r0.w = r7.x * r6.z;
	r0.w = r0.w * c0.w;
	r4.xyz = r0.www * r4.xyz;
	r2.yzw = (r2.yzw * r6.yyy) + r4.xyz;
	r4.xyz = r12.zxy * c27.xxx;
	r4.xyz = (r12.zxy * c27.xxx) + -r4.zxy;
	r6.xy = c26.xy;
	r0.w = (c12.w * r6.x) + r6.y;
	r0.w = fract(r0.w);
	r0.w = (r0.w * c26.z) + c26.w;
	r6.xy = float2(cos(r0.w), sin(r0.w));
	r4.xyz = r4.xyz * r6.yyy;
	r4.xyz = (r12.xyz * r6.xxx) + r4.xyz;
	r0.w = -r6.x + c27.y;
	r3.w = dot(c27.xxx, r12.xyz);
	r3.w = r3.w * c27.x;
	r4.xyz = (r3.www * r0.www) + r4.xyz;
	r0.w = abs(c12.w);
	r4.xyz = ((-r0.w >= 0.0) ? r12.xyz : r4.xyz);
	r6.xyz = r4.xyz + c27.www;
	r6.xyz = (r7.yyy * r6.xyz) + c27.yyy;
	r2.yzw = r2.yzw * r6.xyz;
	r6.xyz = r4.xyz * r4.xyz;
	r6.xyz = r6.xyz * r6.xyz;
	r0.w = dot(r4.xyz, c37.xyz);
	r8.xyz = r0.www * r6.xyz;
	r3.w = dot(r6.xyz, c37.xyz);
	r6.xyz = mix(r4.xyz, r0.www, -c101.yyy);
	r0.w = r3.w + c36.w;
	r3.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r0.w = ((r0.w >= 0.0) ? r3.w : c37.w);
	r8.xyz = (r8.xyz * r0.www) + -r4.xyz;
	r8.xyz = (c101.yyy * r8.xyz) + r4.xyz;
	r6.xyz = ((c101.y >= 0.0) ? r8.xyz : r6.xyz);
	r0.w = abs(c101.y);
	r6.xyz = ((-r0.w >= 0.0) ? r4.xyz : r6.xyz);
	r0.w = r1.w * r5.y;
	r0.w = r5.w * r0.w;
	r2.x = r1.w * r2.x;
	r1.w = r1.w * r5.x;
	r3.w = (r2.x * r10.w) + r0.w;
	r3.xyz = r3.xyz * r0.www;
	r0.w = r10.w * r2.x;
	r3.xyz = (r0.www * r11.xyz) + r3.xyz;
	r0.w = (r1.w * r5.z) + r3.w;
	r1.w = r5.z * r1.w;
	r3.xyz = (r1.www * r10.xyz) + r3.xyz;
	r5.xy = r0.ww + -c33.xw;
	r5.zw = -c33.xw + c33.yz;
	r0.w = ((r5.z == 0.0) ? FLT_MAX : 1.0 / r5.z);
	r1.w = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r1.w = clamp(r1.w * r5.y, 0.0, 1.0);
	r0.w = clamp(r0.w * r5.x, 0.0, 1.0);
	r2.x = (r0.w * c38.z) + c38.w;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r2.x;
	r2.x = (r1.w * c38.z) + c38.w;
	r1.w = r1.w * r1.w;
	r1.w = r1.w * r2.x;
	r0.w = r0.w * r1.w;
	r5.y = c27.y;
	r1.w = (v6.w * c11.w) + r5.y;
	r2.x = r7.x * c105.y;
	r1.w = r1.w * r2.x;
	r3.xyz = r1.www * r3.xyz;
	r1.w = r7.y * c101.w;
	r5.xyz = (r4.xyz * r1.www) + -c106.xyz;
	r1.w = clamp(r1.w, 0.0, 1.0);
	r5.xyz = (r1.www * r5.xyz) + c106.xyz;
	r7.xyw = r3.xyz * r5.xyz;
	r1.w = dot(r7.xyw, c37.xyz);
	r0.w = r0.w * r1.w;
	r0.w = r0.w * c106.w;
	r1.w = dot(r0.xyz, c37.xyz);
	r0.xyz = (r3.xyz * r5.xyz) + r0.xyz;
	r0.x = dot(r0.xyz, c37.xyz);
	r0.x = r0.x + c38.x;
	r0.x = clamp(r0.x * c38.y, 0.0, 1.0);
	r0.yz = r1.ww + -c2.xw;
	r7.xy = -c2.xw + c2.yz;
	r1.w = ((r7.y == 0.0) ? FLT_MAX : 1.0 / r7.y);
	r2.x = ((r7.x == 0.0) ? FLT_MAX : 1.0 / r7.x);
	r0.y = clamp(r0.y * r2.x, 0.0, 1.0);
	r0.z = clamp(r0.z * r1.w, 0.0, 1.0);
	r1.w = (r0.z * c38.z) + c38.w;
	r0.z = r0.z * r0.z;
	r0.z = (r1.w * r0.z) + r0.w;
	r0.w = (r0.y * c38.z) + c38.w;
	r0.y = r0.y * r0.y;
	r0.y = r0.y * r0.w;
	r0.y = r0.z * r0.y;
	r7.xyw = mix(r4.xyz, r6.xyz, r0.yyy);
	r0.y = dot(r7.xyw, c37.xyz);
	r0.yzw = r0.yyy * c102.xyz;
	r4.xyz = c37.xyz;
	r1.w = dot(c102.xyz, r4.xyz);
	r2.x = r1.w + c36.w;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = ((r2.x >= 0.0) ? r1.w : c37.w);
	r0.yzw = (r0.yzw * r1.www) + -r7.xyw;
	r0.yzw = (c102.www * r0.yzw) + r7.xyw;
	r1.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r0.yzw = (r0.yzw * r1.www) + -r7.xyw;
	r1.w = (r0.x * c38.z) + c38.w;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r1.w;
	r0.xyz = (r0.xxx * r0.yzw) + r7.xyw;
	r0.xyz = r7.zzz * r0.xyz;
	r0.xyz = (r0.xyz * r1.xyz) + r2.yzw;
	r0.xyz = (r3.xyz * r5.xyz) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	oC0.xyz = r0.xyz * c30.xxx;
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

