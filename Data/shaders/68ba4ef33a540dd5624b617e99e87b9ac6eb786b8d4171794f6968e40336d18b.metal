#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[33];
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
	const float4 c24 = float4(5.000000000e-01, 1.591549367e-01, 6.283185482e+00, -3.141592741e+00); (void) c24;
	const float4 c25 = float4(5.773500204e-01, -4.000000060e-01, 3.021148033e-03, 2.114803717e-02); (void) c25;
	const float4 c26 = float4(1.953125000e-03, 0.000000000e+00, 1.000000000e+00, -1.953125000e-03); (void) c26;
	const float4 c27 = float4(1.208459213e-02, 6.042296067e-02, 9.969788790e-02, 1.661631465e-01); (void) c27;
	const float4 c29 = float4(1.953125000e-03, 9.765625000e-04, 0.000000000e+00, 1.000000000e+00); (void) c29;
	const float4 c31 = float4(-9.765625000e-04, 1.953125000e-03, 0.000000000e+00, 1.000000000e+00); (void) c31;
	const float4 c32 = float4(1.399999976e+00, 5.000000000e+00, -3.000000119e-01, -3.333333254e+00); (void) c32;
	const float4 c34 = float4(2.000000000e+00, -1.000000000e+00, 0.000000000e+00, 1.000000000e+00); (void) c34;
	const float4 c35 = float4(-2.000000000e+00, 3.000000000e+00, 1.000000000e+06, 0.000000000e+00); (void) c35;
	const float4 c36 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -9.999999975e-07); (void) c36;
	const float4 c37 = float4(-1.953125000e-03, 9.765625000e-04, 0.000000000e+00, 1.000000000e+00); (void) c37;
	const float4 c38 = float4(-1.953125000e-03, -9.765625000e-04, 0.000000000e+00, 1.000000000e+00); (void) c38;
	const float4 c39 = float4(-9.765625000e-04, 9.765625000e-04, 0.000000000e+00, 1.000000000e+00); (void) c39;
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
	#define c22 uniforms.uniforms_float4[22]
	#define c23 uniforms.uniforms_float4[23]
	#define c28 uniforms.uniforms_float4[24]
	#define c30 uniforms.uniforms_float4[25]
	#define c33 uniforms.uniforms_float4[26]
	#define c101 uniforms.uniforms_float4[27]
	#define c102 uniforms.uniforms_float4[28]
	#define c105 uniforms.uniforms_float4[29]
	#define c106 uniforms.uniforms_float4[30]
	#define c107 uniforms.uniforms_float4[31]
	#define c109 uniforms.uniforms_float4[32]
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
	r0.x = r0.x + -c34.x;
	oC0.w = clamp(r0.x * c19.w, 0.0, 1.0);
	r0 = (v5.xyzx * c34.wwwz) + c34.zzzw;
	r1.x = dot(r0, c18);
	r1.y = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r2.x = dot(r0, c15);
	r2.y = dot(r0, c16);
	r2.z = dot(r0, c17);
	r0.xyz = r1.yyy * r2.xyz;
	r2 = r0.xyzx * c34.wwwz;
	r3 = r2 + c26.xxyz;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c26.wxyz;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c26.xwyz;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c26.wwyz;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.y = dot(r3, c25.zzzz);
	r3 = r2 + c26.xyyz;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c26.wyyz;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c26.yxyz;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c26.ywyz;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c25.wwww);
	r1.y = r1.z + r1.y;
	r3 = r2 + c29;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c29.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c31;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c37;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c27.xxxx);
	r1.y = r1.z + r1.y;
	r3 = r2 + c38;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c38.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c37.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c31.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c27.xxxx);
	r1.y = r1.z + r1.y;
	r3 = r2 + c29.yyzw;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c39;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c39.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c31.xxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c27.yyyy);
	r1.y = r1.z + r1.y;
	r3 = r2 + c29.yzzw;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c31.xzzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c31.zxzw;
	r2 = r2 + c29.zyzw;
	r2 = float4(s11_texture.sample_compare(s11, (r2.xyz).xy, (r2.xyz).z));
	r3.w = r2.x;
	r2 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r2.x;
	r1.z = dot(r3, c27.zzzz);
	r1.y = r1.z + r1.y;
	r0.w = c34.w;
	r2 = float4(s11_texture.sample_compare(s11, (r0.xyz).xy, (r0.xyz).z));
	r0 = s8_texture.sample(s8, r0.xy);
	r0.xyz = ((-r1.x >= 0.0) ? c34.zzz : r0.xyz);
	r0.w = (r2.x * c27.w) + r1.y;
	r1.x = pow(abs(r0.w), c32.x);
	r0.w = -r1.x + c34.w;
	r0.w = (c109.y * r0.w) + r1.x;
	r2.x = c34.w;
	r1.yzw = c14.xyz + -v5.xyz;
	r2.w = dot(r1.yzw, r1.yzw);
	r2.z = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r2.y = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r2.x = clamp(dot(c13.xyz, r2.xyz), 0.0, 1.0);
	r3.x = clamp(mix(r0.w, r1.x, r2.x), 0.0, 1.0);
	r0.w = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r1.yzw = r1.yzw * r2.yyy;
	r0.w = r0.w + -c13.w;
	r2.y = c25.y;
	r2.y = r2.y * c13.w;
	r2.y = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r0.w = clamp(r0.w * r2.y, 0.0, 1.0);
	r2.y = r0.w * r2.x;
	r2.yzw = r2.yyy * c28.xyz;
	r2.yzw = r0.xyz * r2.yzw;
	r0.xyz = r0.xyz * c28.xyz;
	r2.yzw = r3.xxx * r2.yzw;
	r3.xyz = c23.xyz + -v5.xyz;
	r4.xyz = normalize(r3.xyz);
	r3.xyz = c3.xyz + -v5.xyz;
	r3.w = dot(r3.xyz, r3.xyz);
	r3.w = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r5.xyz = r3.www * r3.xyz;
	r4.w = clamp(dot(r5.xyz, r4.xyz), 0.0, 1.0);
	r6 = s1_texture.sample(s1, v0.xy);
	r6.xyz = (r6.xyz * c34.xxx) + c34.yyy;
	r7.x = dot(v2.xyz, r6.xyz);
	r7.y = dot(v3.xyz, r6.xyz);
	r7.z = dot(v4.xyz, r6.xyz);
	r6.xyz = normalize(r7.xyz);
	r5.w = dot(r5.xyz, r6.xyz);
	r7.z = clamp(r5.w, 0.0, 1.0);
	r5.w = r5.w + r5.w;
	r8.x = r7.z * r7.z;
	r8.w = r8.x * r8.x;
	r9 = s3_texture.sample(s3, v0.xy);
	r9.y = -r9.w + c34.w;
	r9.z = r8.w * r9.y;
	r10.xyz = r9.zzz * v6.xyz;
	r8.xyz = r10.xyz * c32.yyy;
	r8 = ((-r9.y >= 0.0) ? c34.zzzz : r8);
	r4.w = r4.w * r8.w;
	r10.xyz = (r3.xyz * r3.www) + r4.xyz;
	r4.x = clamp(dot(r6.xyz, r4.xyz), 0.0, 1.0);
	r11.xyz = normalize(r10.xyz);
	r10.x = clamp(dot(r6.xyz, r11.xyz), 0.0, 1.0);
	r11 = s10_texture.sample(s10, v0.xy);
	r7.w = r11.w;
	r10.y = r7.w;
	r12 = s7_texture.sample(s7, r10.xy);
	r4.y = r4.x * r10.x;
	r10.xyz = (r4.www * c32.yyy) + -r12.xyz;
	r10.xyz = (r9.yyy * r10.xyz) + r12.xyz;
	r10.xyz = ((-r9.y >= 0.0) ? r12.xyz : r10.xyz);
	r4.z = ((r4.x == 0.0) ? FLT_MAX : rsqrt(abs(r4.x)));
	r4.x = (r4.x * r4.x) + r4.x;
	r4.x = r4.x * c24.x;
	r4.z = ((r4.z == 0.0) ? FLT_MAX : 1.0 / r4.z);
	r10.xyz = r4.zzz * r10.xyz;
	r12.xyz = c21.xyz + -v5.xyz;
	r13.xyz = normalize(r12.xyz);
	r4.w = clamp(dot(r5.xyz, r13.xyz), 0.0, 1.0);
	r4.w = r4.w * r8.w;
	r12.xyz = (r3.xyz * r3.www) + r13.xyz;
	r3.xyz = (r3.xyz * r3.www) + r1.yzw;
	r1.y = dot(r1.yzw, r6.xyz);
	r14.xyz = normalize(r3.xyz);
	r7.y = clamp(dot(r6.xyz, r14.xyz), 0.0, 1.0);
	r3 = s7_texture.sample(s7, r7.yw);
	r14.xyz = normalize(r12.xyz);
	r7.x = clamp(dot(r6.xyz, r14.xyz), 0.0, 1.0);
	r12 = s7_texture.sample(s7, r7.xw);
	r14 = s4_texture.sample(s4, r7.zw);
	r1.z = -r7.z + c34.w;
	r3.w = pow(abs(r1.z), c105.x);
	r7.yzw = (r4.www * c32.yyy) + -r12.xyz;
	r7.yzw = (r9.yyy * r7.yzw) + r12.xyz;
	r7.yzw = ((-r9.y >= 0.0) ? r12.xyz : r7.yzw);
	r1.z = mix(r14.y, c34.w, r9.y);
	r1.w = r11.x * r14.z;
	r1.w = r1.w * c0.w;
	r4.w = clamp(dot(r6.xyz, r13.xyz), 0.0, 1.0);
	r8.w = clamp(r13.z, 0.0, 1.0);
	r8.w = (r8.w * r8.w) + r8.w;
	r8.w = r8.w * c24.x;
	r9.y = ((r4.w == 0.0) ? FLT_MAX : rsqrt(abs(r4.w)));
	r9.y = ((r9.y == 0.0) ? FLT_MAX : 1.0 / r9.y);
	r7.yzw = r7.yzw * r9.yyy;
	r12.xyz = c20.xyz * v1.xxx;
	r7.yzw = (r7.yzw * r12.xyz) + r8.xyz;
	r8.xyz = c22.xyz * v1.yyy;
	r7.yzw = (r10.xyz * r8.xyz) + r7.yzw;
	r9.z = clamp(r1.y, 0.0, 1.0);
	r1.y = clamp(r1.y + c28.w, 0.0, 1.0);
	r1.y = r1.y * r2.x;
	r9.z = ((r9.z == 0.0) ? FLT_MAX : rsqrt(abs(r9.z)));
	r9.z = ((r9.z == 0.0) ? FLT_MAX : 1.0 / r9.z);
	r3.xyz = r3.xyz * r9.zzz;
	r2.yzw = (r3.xyz * r2.yzw) + r7.yzw;
	r2.yzw = r6.www * r2.yzw;
	r3.x = mix(c10.x, c10.y, r11.y);
	r2.yzw = r2.yzw * r3.xxx;
	r3.x = dot(r6.xyz, r6.xyz);
	r3.xyz = r5.xyz * r3.xxx;
	r3.xyz = (r5.www * r6.xyz) + -r3.xyz;
	r5.x = ((r3.x >= 0.0) ? c34.z : c34.w);
	r5.y = ((r3.y >= 0.0) ? c34.z : c34.w);
	r5.z = ((r3.z >= 0.0) ? c34.z : c34.w);
	r7.yzw = r3.xyz * r3.xyz;
	r3.x = ((r3.x >= 0.0) ? c34.w : c34.z);
	r3.y = ((r3.y >= 0.0) ? c34.w : c34.z);
	r3.z = ((r3.z >= 0.0) ? c34.w : c34.z);
	r3.xyz = r7.yzw * r3.xyz;
	r5.xyz = r5.xyz * r7.yzw;
	r7.yzw = r5.xxx * c5.xyz;
	r7.yzw = (r3.xxx * c4.xyz) + r7.yzw;
	r7.yzw = (r3.yyy * c6.xyz) + r7.yzw;
	r5.xyw = (r5.yyy * c7.xyz) + r7.yzw;
	r3.xyz = (r3.zzz * c8.xyz) + r5.xyw;
	r3.xyz = (r5.zzz * c9.xyz) + r3.xyz;
	r5.xyz = r8.www * r12.xyz;
	r3.xyz = r3.xyz * r5.xyz;
	r5.x = v7.w;
	r5.y = v8.w;
	r5.z = v9.w;
	r5.xyz = -r5.xyz + c21.xyz;
	r10.xyz = normalize(r5.xyz);
	r5.x = clamp(dot(-v9.xyz, r10.xyz), 0.0, 1.0);
	r5.x = (r5.x * r5.x) + r5.x;
	r5.x = r5.x * c24.x;
	r5.xyz = r5.xxx * r12.xyz;
	r7.yzw = c0.xyz * v6.xyz;
	r5.xyz = (r7.yzw * r5.xyz) + -r3.xyz;
	r5.w = clamp(dot(r6.xyz, v9.xyz), 0.0, 1.0);
	r3.xyz = (r5.www * r5.xyz) + r3.xyz;
	r3.xyz = r1.www * r3.xyz;
	r2.yzw = (r2.yzw * r1.zzz) + r3.xyz;
	r1.z = r9.x * c12.w;
	r5.w = r9.x;
	r1.z = (r1.z * c24.y) + c24.x;
	r1.z = fract(r1.z);
	r1.z = (r1.z * c24.z) + c24.w;
	r10.xy = float2(cos(r1.z), sin(r1.z));
	r13 = s0_texture.sample(s0, v0.xy);
	r3.xyz = r13.zxy * c25.xxx;
	r3.xyz = (r13.zxy * c25.xxx) + -r3.zxy;
	r3.xyz = r10.yyy * r3.xyz;
	r3.xyz = (r13.xyz * r10.xxx) + r3.xyz;
	r1.z = -r10.x + c34.w;
	r1.w = dot(c25.xxx, r13.xyz);
	r5.xyz = r13.xyz;
	r1.w = r1.w * c25.x;
	r10.xyz = (r1.www * r1.zzz) + r3.xyz;
	r1.z = abs(c12.w);
	r10.w = c34.w;
	r5 = ((-r1.z >= 0.0) ? r5 : r10);
	r3.xyz = r5.xyz + c34.yyy;
	r3.xyz = (r11.yyy * r3.xyz) + c34.www;
	r2.yzw = r2.yzw * r3.xyz;
	r3.xyz = r5.xyz * r5.xyz;
	r3.xyz = r3.xyz * r3.xyz;
	r1.z = dot(r5.xyz, c36.xyz);
	r7.yzw = r1.zzz * r3.xyz;
	r1.w = dot(r3.xyz, c36.xyz);
	r3.xyz = mix(r5.xyz, r1.zzz, -c101.yyy);
	r1.z = r1.w + c36.w;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.z = ((r1.z >= 0.0) ? r1.w : c35.z);
	r7.yzw = (r7.yzw * r1.zzz) + -r5.xyz;
	r7.yzw = (c101.yyy * r7.yzw) + r5.xyz;
	r3.xyz = ((c101.y >= 0.0) ? r7.yzw : r3.xyz);
	r1.z = abs(c101.y);
	r3.xyz = ((-r1.z >= 0.0) ? r5.xyz : r3.xyz);
	r7.y = ((r6.x >= 0.0) ? c34.z : c34.w);
	r7.z = ((r6.y >= 0.0) ? c34.z : c34.w);
	r7.w = ((r6.z >= 0.0) ? c34.z : c34.w);
	r9.xzw = r6.xyz * r6.xyz;
	r6.x = ((r6.x >= 0.0) ? c34.w : c34.z);
	r6.y = ((r6.y >= 0.0) ? c34.w : c34.z);
	r6.z = ((r6.z >= 0.0) ? c34.w : c34.z);
	r6.xyz = r9.xzw * r6.xyz;
	r7.yzw = r7.yzw * r9.xzw;
	r9.xzw = r7.yyy * c5.xyz;
	r9.xzw = (r6.xxx * c4.xyz) + r9.xzw;
	r6.xyw = (r6.yyy * c6.xyz) + r9.xzw;
	r6.xyw = (r7.zzz * c7.xyz) + r6.xyw;
	r6.xyz = (r6.zzz * c8.xyz) + r6.xyw;
	r6.xyz = (r7.www * c9.xyz) + r6.xyz;
	r1.z = (r4.w * r4.w) + r4.w;
	r1.w = r4.w * r7.x;
	r1.w = r3.w * r1.w;
	r3.w = r3.w * r4.y;
	r3.w = r4.z * r3.w;
	r1.z = r1.z * c24.x;
	r4.yzw = (r12.xyz * r1.zzz) + r6.xyz;
	r4.xyz = (r8.xyz * r4.xxx) + r4.yzw;
	r6.xyz = r8.xyz * r3.www;
	r1.z = (r1.w * r9.y) + r3.w;
	r1.w = r9.y * r1.w;
	r6.xyz = (r1.www * r12.xyz) + r6.xyz;
	r1.zw = r1.zz + -c33.xw;
	r3.w = clamp(r1.x, 0.0, 1.0);
	r4.w = -r3.w + c34.w;
	r3.w = (c109.y * r4.w) + r3.w;
	r4.w = clamp(mix(r3.w, r1.x, r2.x), 0.0, 1.0);
	r0.xyz = r0.xyz * r4.www;
	r0.xyz = r0.xyz * r1.yyy;
	r0.xyz = (r0.xyz * r0.www) + r4.xyz;
	r0.w = dot(r0.xyz, c36.xyz);
	r1.xy = r0.ww + -c2.xw;
	r4.xy = -c2.xw + c2.yz;
	r0.w = ((r4.y == 0.0) ? FLT_MAX : 1.0 / r4.y);
	r2.x = ((r4.x == 0.0) ? FLT_MAX : 1.0 / r4.x);
	r1.x = clamp(r1.x * r2.x, 0.0, 1.0);
	r0.w = clamp(r0.w * r1.y, 0.0, 1.0);
	r1.y = (r0.w * c35.x) + c35.y;
	r0.w = r0.w * r0.w;
	r4.xy = -c33.xw + c33.yz;
	r2.x = ((r4.x == 0.0) ? FLT_MAX : 1.0 / r4.x);
	r3.w = ((r4.y == 0.0) ? FLT_MAX : 1.0 / r4.y);
	r1.w = clamp(r1.w * r3.w, 0.0, 1.0);
	r1.z = clamp(r1.z * r2.x, 0.0, 1.0);
	r2.x = (r1.z * c35.x) + c35.y;
	r1.z = r1.z * r1.z;
	r1.z = r1.z * r2.x;
	r2.x = (r1.w * c35.x) + c35.y;
	r1.w = r1.w * r1.w;
	r1.w = r1.w * r2.x;
	r1.z = r1.w * r1.z;
	r1.w = c34.w;
	r1.w = (v6.w * c11.w) + r1.w;
	r2.x = r11.x * c105.y;
	r1.w = r1.w * r2.x;
	r4.xyz = r1.www * r6.xyz;
	r1.w = r11.y * c101.w;
	r6.xyz = (r5.xyz * r1.www) + -c106.xyz;
	r1.w = clamp(r1.w, 0.0, 1.0);
	r6.xyz = (r1.www * r6.xyz) + c106.xyz;
	r7.xyz = r4.xyz * r6.xyz;
	r1.w = dot(r7.xyz, c36.xyz);
	r1.z = r1.w * r1.z;
	r1.z = r1.z * c106.w;
	r0.w = (r1.y * r0.w) + r1.z;
	r1.y = (r1.x * c35.x) + c35.y;
	r1.x = r1.x * r1.x;
	r1.x = r1.x * r1.y;
	r0.w = r0.w * r1.x;
	r0.w = r5.w * r0.w;
	r1.xyz = mix(r5.xyz, r3.xyz, r0.www);
	r0.w = dot(r1.xyz, c36.xyz);
	r3.xyz = r0.www * c102.xyz;
	r5.xyz = c36.xyz;
	r0.w = dot(c102.xyz, r5.xyz);
	r1.w = r0.w + c36.w;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r1.w >= 0.0) ? r0.w : c35.z);
	r3.xyz = (r3.xyz * r0.www) + -r1.xyz;
	r3.xyz = (c102.www * r3.xyz) + r1.xyz;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r3.xyz = (r3.xyz * r0.www) + -r1.xyz;
	r5.xyz = (r4.xyz * r6.xyz) + r0.xyz;
	r0.xyz = r0.xyz + v6.xyz;
	r0.w = dot(r5.xyz, c36.xyz);
	r0.w = r0.w + c32.z;
	r0.w = clamp(r0.w * c32.w, 0.0, 1.0);
	r1.w = (r0.w * c35.x) + c35.y;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.w;
	r1.xyz = (r0.www * r3.xyz) + r1.xyz;
	r1.xyz = r11.zzz * r1.xyz;
	r0.xyz = (r1.xyz * r0.xyz) + r2.yzw;
	r0.xyz = (r4.xyz * r6.xyz) + r0.xyz;
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
	#undef c28
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

