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
	const float4 c22 = float4(5.000000000e-01, 1.591549367e-01, 6.283185482e+00, -3.141592741e+00); (void) c22;
	const float4 c23 = float4(1.953125000e-03, 0.000000000e+00, 1.000000000e+00, -1.953125000e-03); (void) c23;
	const float4 c24 = float4(5.773500204e-01, -4.000000060e-01, 3.021148033e-03, 2.114803717e-02); (void) c24;
	const float4 c25 = float4(1.953125000e-03, 9.765625000e-04, 0.000000000e+00, 1.000000000e+00); (void) c25;
	const float4 c26 = float4(1.208459213e-02, 6.042296067e-02, 9.969788790e-02, 1.661631465e-01); (void) c26;
	const float4 c27 = float4(-9.765625000e-04, 1.953125000e-03, 0.000000000e+00, 1.000000000e+00); (void) c27;
	const float4 c31 = float4(1.399999976e+00, 4.999995828e-01, 5.000000000e-01, 5.000000000e+00); (void) c31;
	const float4 c32 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -9.999999975e-07); (void) c32;
	const float4 c34 = float4(2.000000000e+00, -1.000000000e+00, 0.000000000e+00, 1.000000000e+00); (void) c34;
	const float4 c35 = float4(1.000000000e+06, -3.000000119e-01, -3.333333254e+00, 0.000000000e+00); (void) c35;
	const float4 c36 = float4(-2.000000000e+00, 3.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c36;
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
	float4 r15;
	float4 r16;
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
	r0 = (v5.xyzx * c34.wwwz) + c34.zzzw;
	r1.x = dot(r0, c18);
	r1.y = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r2.x = dot(r0, c15);
	r2.y = dot(r0, c16);
	r2.z = dot(r0, c17);
	r0.xyz = r1.yyy * r2.xyz;
	r2 = r0.xyzx * c34.wwwz;
	r3 = r2 + c23.xxyz;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c23.wxyz;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c23.xwyz;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c23.wwyz;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.y = dot(r3, c24.zzzz);
	r3 = r2 + c23.xyyz;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c23.wyyz;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c23.yxyz;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c23.ywyz;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c24.wwww);
	r1.y = r1.z + r1.y;
	r3 = r2 + c25;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c25.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c27;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c37;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c26.xxxx);
	r1.y = r1.z + r1.y;
	r3 = r2 + c38;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c38.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c37.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c27.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c26.xxxx);
	r1.y = r1.z + r1.y;
	r3 = r2 + c25.yyzw;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c39;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c39.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c27.xxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c26.yyyy);
	r1.y = r1.z + r1.y;
	r3 = r2 + c25.yzzw;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c27.xzzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c27.zxzw;
	r2 = r2 + c25.zyzw;
	r2 = float4(s11_texture.sample_compare(s11, (r2.xyz).xy, (r2.xyz).z));
	r3.w = r2.x;
	r2 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r2.x;
	r1.z = dot(r3, c26.zzzz);
	r1.y = r1.z + r1.y;
	r0.w = c34.w;
	r2 = float4(s11_texture.sample_compare(s11, (r0.xyz).xy, (r0.xyz).z));
	r0 = s8_texture.sample(s8, r0.xy);
	r0.xyz = ((-r1.x >= 0.0) ? c34.zzz : r0.xyz);
	r0.w = (r2.x * c26.w) + r1.y;
	r1.x = pow(abs(r0.w), c31.x);
	r0.w = clamp(r1.x, 0.0, 1.0);
	r1.y = -r0.w + c34.w;
	r0.w = (c109.y * r1.y) + r0.w;
	r2.x = c34.w;
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
	r2.yzw = (r4.xyz * c34.xxx) + c34.yyy;
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
	r4.y = c24.y;
	r2.z = r4.y * c13.w;
	r2.z = ((r2.z == 0.0) ? FLT_MAX : 1.0 / r2.z);
	r0.w = clamp(r0.w * r2.z, 0.0, 1.0);
	r4.x = ((r5.x >= 0.0) ? c34.z : c34.w);
	r4.y = ((r5.y >= 0.0) ? c34.z : c34.w);
	r4.z = ((r5.z >= 0.0) ? c34.z : c34.w);
	r6.xyz = r5.xyz * r5.xyz;
	r4.xyz = r4.xyz * r6.xyz;
	r7.xyz = r4.xxx * c5.xyz;
	r8.x = ((r5.x >= 0.0) ? c34.w : c34.z);
	r8.y = ((r5.y >= 0.0) ? c34.w : c34.z);
	r8.z = ((r5.z >= 0.0) ? c34.w : c34.z);
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
	r2.w = r2.w * c22.x;
	r6.xyz = c20.xyz * v1.xxx;
	r4.xyz = (r6.xyz * r2.www) + r4.xyz;
	r3.xyz = (r3.xyz * r0.www) + r4.xyz;
	r0.w = r0.w * r2.x;
	r4.xyz = r0.www * c28.xyz;
	r0.xyz = r0.xyz * r4.xyz;
	r4.xyz = r3.xyz + v6.xyz;
	r8.xyz = r4.xyz + -c103.xxx;
	r8.xyz = clamp(r8.xyz * c103.yyy, float3(0.0), float3(1.0));
	r9.xyz = r5.zxy * v8.yzx;
	r9.xyz = (r5.yzx * v8.zxy) + -r9.xyz;
	r10.xyz = normalize(r9.xyz);
	r9.xyz = r5.zxy * r10.yzx;
	r9.xyz = (r5.yzx * r10.zxy) + -r9.xyz;
	r11.xyz = normalize(r9.xyz);
	r9 = s3_texture.sample(s3, v0.xy);
	r0.w = (r9.y * c31.y) + c31.z;
	r0.w = fract(r0.w);
	r0.w = (r0.w * c22.z) + c22.w;
	r12.xy = float2(cos(r0.w), sin(r0.w));
	r10.xyz = r10.xyz * r12.xxx;
	r10.xyz = (r12.yyy * r11.xyz) + r10.xyz;
	r11.xyz = normalize(r10.xyz);
	r10.xyz = r5.xyz * r11.yzx;
	r10.xyz = (r11.xyz * r5.yzx) + -r10.xyz;
	r12.xyz = r11.yzx * r10.xyz;
	r10.xyz = (r10.zxy * r11.zxy) + -r12.xyz;
	r0.w = dot(r10.xyz, r10.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r12.xyz = c3.xyz + -v5.xyz;
	r2.w = dot(r12.xyz, r12.xyz);
	r2.w = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r13.xyz = r2.www * r12.xyz;
	r10.xyz = (r10.xyz * r0.www) + -r13.xyz;
	r14.zw = c34.zw;
	r0.w = ((-r9.y >= 0.0) ? r14.z : c10.w);
	r10.xyz = (r0.www * r10.xyz) + r13.xyz;
	r3.w = dot(r5.xyz, r10.xyz);
	r3.w = r3.w + r3.w;
	r5.w = dot(r5.xyz, r5.xyz);
	r10.xyz = r10.xyz * r5.www;
	r10.xyz = (r3.www * r5.xyz) + -r10.xyz;
	r15 = s6_texture.sample(s6, r10.xyz);
	r14.xyz = r15.xyz * c30.zzz;
	r16.xyz = r14.xyz * r14.xyz;
	r16.xyz = r16.xyz * r16.xyz;
	r3.w = dot(r16.xyz, c32.xyz);
	r5.w = r3.w + c32.w;
	r3.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r3.w = ((r5.w >= 0.0) ? r3.w : c35.x);
	r5.w = dot(r14.xyz, c32.xyz);
	r16.xyz = r5.www * r16.xyz;
	r15.xyz = (c30.zzz * -r15.xyz) + r5.www;
	r15.xyz = (-c103.www * r15.xyz) + r14.xyz;
	r16.xyz = (r16.xyz * r3.www) + -r14.xyz;
	r16.xyz = (c103.www * r16.xyz) + r14.xyz;
	r15.xyz = ((c103.w >= 0.0) ? r16.xyz : r15.xyz);
	r3.w = abs(c103.w);
	r14.xyz = ((-r3.w >= 0.0) ? r14.xyz : r15.xyz);
	r8.xyz = (r14.xyz * r8.xyz) + -r14.xyz;
	r3.w = r9.z * c101.x;
	r8.xyz = (r3.www * r8.xyz) + r14.xyz;
	r14.xyz = (r8.xyz * r8.xyz) + -r8.xyz;
	r8.xyz = (c103.zzz * r14.xyz) + r8.xyz;
	r15 = s0_texture.sample(s0, v0.xy);
	r14.xyz = r15.www * c104.xyz;
	r8.xyz = r8.xyz * r14.xyz;
	r3.w = -r1.x + c34.w;
	r3.w = (c109.y * r3.w) + r1.x;
	r5.w = clamp(mix(r3.w, r1.x, r2.x), 0.0, 1.0);
	r0.xyz = r0.xyz * r5.www;
	r1.x = dot(r7.xyz, r11.xxx);
	r2.x = dot(r13.xyz, r11.xyz);
	r3.w = (r1.x * -r1.x) + c34.w;
	r3.w = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r3.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r5.w = (r2.x * -r2.x) + c34.w;
	r5.w = ((r5.w == 0.0) ? FLT_MAX : rsqrt(abs(r5.w)));
	r5.w = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r3.w = r3.w * r5.w;
	r1.x = clamp((r2.x * r1.x) + r3.w, 0.0, 1.0);
	r11.xyz = (r12.xyz * r2.www) + r7.xyz;
	r1.yzw = (r12.xyz * r2.www) + r1.yzw;
	r2.x = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r2.x = clamp((r2.x * c19.w) + c19.x, 0.0, 1.0);
	r3.w = min(r2.x, c19.z);
	r2.x = r3.w * r3.w;
	r12.xyz = normalize(r1.yzw);
	r1.y = clamp(dot(r5.xyz, r12.xyz), 0.0, 1.0);
	r12.y = mix(r1.y, c34.w, r0.w);
	r14.xyz = normalize(r11.xyz);
	r1.y = clamp(dot(r5.xyz, r14.xyz), 0.0, 1.0);
	r12.x = mix(r1.y, r1.x, r0.w);
	r1 = s10_texture.sample(s10, v0.xy);
	r12.w = r1.w;
	r11 = s7_texture.sample(s7, r12.xw);
	r0.w = r2.z * r12.x;
	r1.w = ((r2.z == 0.0) ? FLT_MAX : rsqrt(abs(r2.z)));
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r2.z = clamp(dot(r13.xyz, r7.xyz), 0.0, 1.0);
	r12.z = clamp(dot(r13.xyz, r5.xyz), 0.0, 1.0);
	r2.w = clamp(dot(r5.xyz, v9.xyz), 0.0, 1.0);
	r3.w = clamp(r7.z, 0.0, 1.0);
	r3.w = (r3.w * r3.w) + r3.w;
	r3.w = r3.w * c22.x;
	r5.xyz = r3.www * r6.xyz;
	r3.w = r12.z * r12.z;
	r7.w = r3.w * r3.w;
	r3.w = -r9.w + c34.w;
	r5.w = r7.w * r3.w;
	r9.yzw = r5.www * v6.xyz;
	r7.xyz = r9.yzw * c31.www;
	r7 = ((-r3.w >= 0.0) ? c34.zzzz : r7);
	r2.z = r2.z * r7.w;
	r9.yzw = (r2.zzz * c31.www) + -r11.xyz;
	r9.yzw = (r3.www * r9.yzw) + r11.xyz;
	r9.yzw = ((-r3.w >= 0.0) ? r11.xyz : r9.yzw);
	r9.yzw = r1.www * r9.yzw;
	r7.xyz = (r9.yzw * r6.xyz) + r7.xyz;
	r11 = s7_texture.sample(s7, r12.yw);
	r13 = s4_texture.sample(s4, r12.zw);
	r2.z = -r12.z + c34.w;
	r5.w = pow(abs(r2.z), c105.x);
	r0.w = r0.w * r5.w;
	r9.yzw = r2.yyy * r11.xyz;
	r0.xyz = (r9.yzw * r0.xyz) + r7.xyz;
	r0.xyz = r4.www * r0.xyz;
	r2.y = mix(c10.x, c10.y, r1.y);
	r0.xyz = (r0.xyz * r2.yyy) + r8.xyz;
	r7.x = ((r10.x >= 0.0) ? c34.z : c34.w);
	r7.y = ((r10.y >= 0.0) ? c34.z : c34.w);
	r7.z = ((r10.z >= 0.0) ? c34.z : c34.w);
	r8.xyz = r10.xyz * r10.xyz;
	r9.y = ((r10.x >= 0.0) ? c34.w : c34.z);
	r9.z = ((r10.y >= 0.0) ? c34.w : c34.z);
	r9.w = ((r10.z >= 0.0) ? c34.w : c34.z);
	r9.yzw = r8.xyz * r9.yzw;
	r7.xyz = r7.xyz * r8.xyz;
	r8.xyz = r7.xxx * c5.xyz;
	r8.xyz = (r9.yyy * c4.xyz) + r8.xyz;
	r8.xyz = (r9.zzz * c6.xyz) + r8.xyz;
	r7.xyw = (r7.yyy * c7.xyz) + r8.xyz;
	r7.xyw = (r9.www * c8.xyz) + r7.xyw;
	r7.xyz = (r7.zzz * c9.xyz) + r7.xyw;
	r5.xyz = r5.xyz * r7.xyz;
	r7.x = v7.w;
	r7.y = v8.w;
	r7.z = v9.w;
	r7.xyz = -r7.xyz + c21.xyz;
	r8.xyz = normalize(r7.xyz);
	r2.y = clamp(dot(-v9.xyz, r8.xyz), 0.0, 1.0);
	r2.y = (r2.y * r2.y) + r2.y;
	r2.y = r2.y * c22.x;
	r7.xyz = r2.yyy * r6.xyz;
	r8.xyz = c0.xyz * v6.xyz;
	r7.xyz = (r8.xyz * r7.xyz) + -r5.xyz;
	r2.yzw = (r2.www * r7.xyz) + r5.xyz;
	r4.w = r1.x * r13.z;
	r5.x = mix(r13.y, c34.w, r3.w);
	r3.w = r4.w * c0.w;
	r2.yzw = r2.yzw * r3.www;
	r0.xyz = (r0.xyz * r5.xxx) + r2.yzw;
	r2.y = r9.x * c12.w;
	r15.w = r9.x;
	r2.y = (r2.y * c22.y) + c22.x;
	r2.y = fract(r2.y);
	r2.y = (r2.y * c22.z) + c22.w;
	r5.xy = float2(cos(r2.y), sin(r2.y));
	r2.yzw = r15.zxy * c24.xxx;
	r2.yzw = (r15.zxy * c24.xxx) + -r2.wyz;
	r2.yzw = r5.yyy * r2.yzw;
	r2.yzw = (r15.xyz * r5.xxx) + r2.yzw;
	r3.w = -r5.x + c34.w;
	r4.w = dot(c24.xxx, r15.xyz);
	r4.w = r4.w * c24.x;
	r5.xyz = (r4.www * r3.www) + r2.yzw;
	r2.y = abs(c12.w);
	r5.w = c34.w;
	r5 = ((-r2.y >= 0.0) ? r15 : r5);
	r2.yzw = r5.xyz + c34.yyy;
	r2.yzw = (r1.yyy * r2.yzw) + c34.www;
	r0.xyz = r0.xyz * r2.yzw;
	r2.yzw = r5.xyz * r5.xyz;
	r2.yzw = r2.yzw * r2.yzw;
	r3.w = dot(r5.xyz, c32.xyz);
	r7.xyz = r2.yzw * r3.www;
	r2.y = dot(r2.yzw, c32.xyz);
	r8.xyz = mix(r5.xyz, r3.www, -c101.yyy);
	r2.z = r2.y + c32.w;
	r2.y = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r2.y = ((r2.z >= 0.0) ? r2.y : c35.x);
	r2.yzw = (r7.xyz * r2.yyy) + -r5.xyz;
	r2.yzw = (c101.yyy * r2.yzw) + r5.xyz;
	r2.yzw = ((c101.y >= 0.0) ? r2.yzw : r8.xyz);
	r3.w = abs(c101.y);
	r2.yzw = ((-r3.w >= 0.0) ? r5.xyz : r2.yzw);
	r7.xy = (r0.ww * r1.ww) + -c33.xw;
	r0.w = r1.w * r0.w;
	r6.xyz = r6.xyz * r0.www;
	r7.zw = -c33.xw + c33.yz;
	r0.w = ((r7.z == 0.0) ? FLT_MAX : 1.0 / r7.z);
	r1.w = ((r7.w == 0.0) ? FLT_MAX : 1.0 / r7.w);
	r1.w = clamp(r1.w * r7.y, 0.0, 1.0);
	r0.w = clamp(r0.w * r7.x, 0.0, 1.0);
	r3.w = (r0.w * c36.x) + c36.y;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r3.w;
	r3.w = (r1.w * c36.x) + c36.y;
	r1.w = r1.w * r1.w;
	r1.w = r1.w * r3.w;
	r0.w = r0.w * r1.w;
	r1.w = (v6.w * c11.w) + r14.w;
	r1.x = r1.x * c105.y;
	r1.x = r1.w * r1.x;
	r6.xyz = r1.xxx * r6.xyz;
	r1.x = r1.y * c101.w;
	r7.xyz = (r5.xyz * r1.xxx) + -c106.xyz;
	r1.x = clamp(r1.x, 0.0, 1.0);
	r1.xyw = (r1.xxx * r7.xyz) + c106.xyz;
	r7.xyz = r1.xyw * r6.xyz;
	r3.w = dot(r7.xyz, c32.xyz);
	r0.w = r0.w * r3.w;
	r0.w = r0.w * c106.w;
	r3.w = dot(r3.xyz, c32.xyz);
	r3.xyz = (r6.xyz * r1.xyw) + r3.xyz;
	r3.x = dot(r3.xyz, c32.xyz);
	r3.x = r3.x + c35.y;
	r3.x = clamp(r3.x * c35.z, 0.0, 1.0);
	r3.yz = r3.ww + -c2.xw;
	r7.xy = -c2.xw + c2.yz;
	r3.w = ((r7.y == 0.0) ? FLT_MAX : 1.0 / r7.y);
	r4.w = ((r7.x == 0.0) ? FLT_MAX : 1.0 / r7.x);
	r3.y = clamp(r3.y * r4.w, 0.0, 1.0);
	r3.z = clamp(r3.w * r3.z, 0.0, 1.0);
	r3.w = (r3.z * c36.x) + c36.y;
	r3.z = r3.z * r3.z;
	r0.w = (r3.w * r3.z) + r0.w;
	r3.z = (r3.y * c36.x) + c36.y;
	r3.y = r3.y * r3.y;
	r3.y = r3.y * r3.z;
	r0.w = r0.w * r3.y;
	r0.w = r5.w * r0.w;
	r3.yzw = mix(r5.xyz, r2.yzw, r0.www);
	r0.w = dot(r3.yzw, c32.xyz);
	r2.yzw = r0.www * c102.xyz;
	r5.xyz = c32.xyz;
	r0.w = dot(c102.xyz, r5.xyz);
	r4.w = r0.w + c32.w;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r4.w >= 0.0) ? r0.w : c35.x);
	r2.yzw = (r2.yzw * r0.www) + -r3.yzw;
	r2.yzw = (c102.www * r2.yzw) + r3.yzw;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r2.yzw = (r2.yzw * r0.www) + -r3.yzw;
	r0.w = (r3.x * c36.x) + c36.y;
	r3.x = r3.x * r3.x;
	r0.w = r0.w * r3.x;
	r2.yzw = (r0.www * r2.yzw) + r3.yzw;
	r2.yzw = r1.zzz * r2.yzw;
	r0.xyz = (r2.yzw * r4.xyz) + r0.xyz;
	r0.xyz = (r6.xyz * r1.xyw) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r3.x = c30.x;
	r0.xyz = (r0.xyz * -r3.xxx) + c29.xyz;
	oC0.xyz = (r2.xxx * r0.xyz) + r1.xyz;
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

