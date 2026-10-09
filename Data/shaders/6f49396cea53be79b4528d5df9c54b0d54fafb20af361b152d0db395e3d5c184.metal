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
	const float4 c2 = float4(3.021148033e-03, 2.114803717e-02, 1.208459213e-02, 6.042296067e-02); (void) c2;
	const float4 c26 = float4(-9.765625000e-04, 1.953125000e-03, 0.000000000e+00, 1.000000000e+00); (void) c26;
	const float4 c27 = float4(-1.953125000e-03, 1.953125000e-03, 0.000000000e+00, 1.000000000e+00); (void) c27;
	const float4 c31 = float4(0.000000000e+00, 1.000000000e+00, -4.000000060e-01, 1.953125000e-03); (void) c31;
	const float4 c32 = float4(1.953125000e-03, 9.765625000e-04, 0.000000000e+00, 1.000000000e+00); (void) c32;
	const float4 c33 = float4(9.969788790e-02, 1.661631465e-01, 1.399999976e+00, -9.999999975e-07); (void) c33;
	const float4 c34 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, 1.000000000e+06); (void) c34;
	const float4 c35 = float4(5.773500204e-01, 1.000000000e+00, 2.000000000e+00, -1.000000000e+00); (void) c35;
	const float4 c36 = float4(-3.000000119e-01, -3.333333254e+00, -2.000000000e+00, 3.000000000e+00); (void) c36;
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
	float4 r17;
	float4 r18;
	#define c1 uniforms.uniforms_float4[0]
	#define c3 uniforms.uniforms_float4[1]
	#define c4 uniforms.uniforms_float4[2]
	#define c5 uniforms.uniforms_float4[3]
	#define c6 uniforms.uniforms_float4[4]
	#define c7 uniforms.uniforms_float4[5]
	#define c8 uniforms.uniforms_float4[6]
	#define c9 uniforms.uniforms_float4[7]
	#define c10 uniforms.uniforms_float4[8]
	#define c11 uniforms.uniforms_float4[9]
	#define c12 uniforms.uniforms_float4[10]
	#define c13 uniforms.uniforms_float4[11]
	#define c14 uniforms.uniforms_float4[12]
	#define c15 uniforms.uniforms_float4[13]
	#define c16 uniforms.uniforms_float4[14]
	#define c17 uniforms.uniforms_float4[15]
	#define c18 uniforms.uniforms_float4[16]
	#define c19 uniforms.uniforms_float4[17]
	#define c20 uniforms.uniforms_float4[18]
	#define c21 uniforms.uniforms_float4[19]
	#define c22 uniforms.uniforms_float4[20]
	#define c23 uniforms.uniforms_float4[21]
	#define c24 uniforms.uniforms_float4[22]
	#define c25 uniforms.uniforms_float4[23]
	#define c28 uniforms.uniforms_float4[24]
	#define c29 uniforms.uniforms_float4[25]
	#define c30 uniforms.uniforms_float4[26]
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
	r0 = s0_texture.sample(s0, v0.xy);
	oC0.w = r0.w * c1.w;
	r1 = (v5.xyzx * c31.yyyx) + c31.xxxy;
	r0.w = dot(r1, c18);
	r2.x = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r3.x = dot(r1, c15);
	r3.y = dot(r1, c16);
	r3.z = dot(r1, c17);
	r1.xyz = r2.xxx * r3.xyz;
	r2 = r1.xyzx * c31.yyyx;
	r3 = r2 + c31.wwxy;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c27;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c27.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c27.xxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r3.x = dot(r3, c2.xxxx);
	r4 = r2 + c31.wxxy;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r5 = r2 + c27.xzzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r2 + c31.xwxy;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r2 + c27.zxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r3.y = dot(r4, c2.yyyy);
	r3.x = r3.y + r3.x;
	r4 = r2 + c32;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r5 = r2 + c32.yxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r2 + c26;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r2 + c37;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r3.y = dot(r4, c2.zzzz);
	r3.x = r3.y + r3.x;
	r4 = r2 + c38;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r5 = r2 + c38.yxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r2 + c37.yxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r2 + c26.yxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r3.y = dot(r4, c2.zzzz);
	r3.x = r3.y + r3.x;
	r4 = r2 + c32.yyzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r5 = r2 + c39;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r2 + c39.yxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r2 + c26.xxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r3.y = dot(r4, c2.wwww);
	r3.x = r3.y + r3.x;
	r4 = r2 + c32.yzzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r5 = r2 + c26.xzzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r2 + c26.zxzw;
	r2 = r2 + c32.zyzw;
	r2 = float4(s11_texture.sample_compare(s11, (r2.xyz).xy, (r2.xyz).z));
	r4.w = r2.x;
	r2 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r2.x;
	r2.x = dot(r4, c33.xxxx);
	r2.x = r2.x + r3.x;
	r1.w = c35.y;
	r3 = float4(s11_texture.sample_compare(s11, (r1.xyz).xy, (r1.xyz).z));
	r1 = s8_texture.sample(s8, r1.xy);
	r1.xyz = ((-r0.w >= 0.0) ? c31.xxx : r1.xyz);
	r0.w = (r3.x * c33.y) + r2.x;
	r1.w = pow(abs(r0.w), c33.z);
	r0.w = clamp(r1.w, 0.0, 1.0);
	r2.x = -r0.w + c35.y;
	r0.w = (c109.y * r2.x) + r0.w;
	r2.x = c35.y;
	r3.xyz = c14.xyz + -v5.xyz;
	r2.w = dot(r3.xyz, r3.xyz);
	r2.z = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r2.y = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r2.x = clamp(dot(c13.xyz, r2.xyz), 0.0, 1.0);
	r3.w = clamp(mix(r0.w, r1.w, r2.x), 0.0, 1.0);
	r4.xyz = r1.xyz * c28.xyz;
	r4.xyz = r3.www * r4.xyz;
	r3.xyz = r2.yyy * r3.xyz;
	r0.w = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r0.w = r0.w + -c13.w;
	r5 = s1_texture.sample(s1, v0.xy);
	r2.yzw = (r5.xyz * c35.zzz) + c35.www;
	r5.x = dot(v2.xyz, r2.yzw);
	r5.y = dot(v3.xyz, r2.yzw);
	r5.z = dot(v4.xyz, r2.yzw);
	r6.xyz = normalize(r5.xyz);
	r2.y = dot(r3.xyz, r6.xyz);
	r2.z = clamp(r2.y + c28.w, 0.0, 1.0);
	r2.y = clamp(r2.y, 0.0, 1.0);
	r2.y = ((r2.y == 0.0) ? FLT_MAX : rsqrt(abs(r2.y)));
	r2.y = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r2.z = r2.z * r2.x;
	r4.xyz = r4.xyz * r2.zzz;
	r5.x = ((r6.x >= 0.0) ? c31.x : c31.y);
	r5.y = ((r6.y >= 0.0) ? c31.x : c31.y);
	r5.z = ((r6.z >= 0.0) ? c31.x : c31.y);
	r7.xyz = r6.xyz * r6.xyz;
	r5.xyz = r5.xyz * r7.xyz;
	r8.xyz = r5.xxx * c5.xyz;
	r9.x = ((r6.x >= 0.0) ? c31.y : c31.x);
	r9.y = ((r6.y >= 0.0) ? c31.y : c31.x);
	r9.z = ((r6.z >= 0.0) ? c31.y : c31.x);
	r7.xyz = r7.xyz * r9.xyz;
	r8.xyz = (r7.xxx * c4.xyz) + r8.xyz;
	r7.xyw = (r7.yyy * c6.xyz) + r8.xyz;
	r7.xyw = (r5.yyy * c7.xyz) + r7.xyw;
	r7.xyz = (r7.zzz * c8.xyz) + r7.xyw;
	r5.xyz = (r5.zzz * c9.xyz) + r7.xyz;
	r7.xyz = c21.xyz + -v5.xyz;
	r8.xyz = normalize(r7.xyz);
	r2.z = clamp(dot(r6.xyz, r8.xyz), 0.0, 1.0);
	r2.w = (r2.z * r2.z) + r2.z;
	r2.w = r2.w * c0.y;
	r7.xyz = c20.xyz * v1.xxx;
	r5.xyz = (r7.xyz * r2.www) + r5.xyz;
	r9.xyz = c23.xyz + -v5.xyz;
	r10.xyz = normalize(r9.xyz);
	r2.w = clamp(dot(r6.xyz, r10.xyz), 0.0, 1.0);
	r3.w = (r2.w * r2.w) + r2.w;
	r3.w = r3.w * c0.y;
	r9.xyz = c22.xyz * v1.yyy;
	r5.xyz = (r9.xyz * r3.www) + r5.xyz;
	r11.xyz = c25.xyz + -v5.xyz;
	r12.xyz = normalize(r11.xyz);
	r3.w = clamp(dot(r6.xyz, r12.xyz), 0.0, 1.0);
	r4.w = (r3.w * r3.w) + r3.w;
	r4.w = r4.w * c0.y;
	r11.xyz = c24.xyz * v1.zzz;
	r5.xyz = (r11.xyz * r4.www) + r5.xyz;
	r13.z = c31.z;
	r4.w = r13.z * c13.w;
	r4.w = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r0.w = clamp(r0.w * r4.w, 0.0, 1.0);
	r4.xyz = (r4.xyz * r0.www) + r5.xyz;
	r0.w = r0.w * r2.x;
	r5.xyz = r0.www * c28.xyz;
	r1.xyz = r1.xyz * r5.xyz;
	r5.xyz = r4.xyz + v6.xyz;
	r13.xyz = r5.xyz + -c103.xxx;
	r13.xyz = clamp(r13.xyz * c103.yyy, float3(0.0), float3(1.0));
	r0.w = dot(r6.xyz, r6.xyz);
	r14.xyz = c3.xyz + -v5.xyz;
	r4.w = dot(r14.xyz, r14.xyz);
	r4.w = ((r4.w == 0.0) ? FLT_MAX : rsqrt(abs(r4.w)));
	r15.xyz = r4.www * r14.xyz;
	r16.xyz = r0.www * r15.xyz;
	r15.z = dot(r15.xyz, r6.xyz);
	r0.w = r15.z + r15.z;
	r15.z = clamp(r15.z, 0.0, 1.0);
	r16.xyz = (r0.www * r6.xyz) + -r16.xyz;
	r16 = s6_texture.sample(s6, r16.xyz);
	r17.xyz = r16.xyz * c30.zzz;
	r18.xyz = r17.xyz * r17.xyz;
	r18.xyz = r18.xyz * r18.xyz;
	r0.w = dot(r18.xyz, c34.xyz);
	r6.w = r0.w + c33.w;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r6.w >= 0.0) ? r0.w : c34.w);
	r6.w = dot(r17.xyz, c34.xyz);
	r18.xyz = r6.www * r18.xyz;
	r16.xyz = (c30.zzz * -r16.xyz) + r6.www;
	r16.xyz = (-c103.www * r16.xyz) + r17.xyz;
	r18.xyz = (r18.xyz * r0.www) + -r17.xyz;
	r18.xyz = (c103.www * r18.xyz) + r17.xyz;
	r16.xyz = ((c103.w >= 0.0) ? r18.xyz : r16.xyz);
	r0.w = abs(c103.w);
	r16.xyz = ((-r0.w >= 0.0) ? r17.xyz : r16.xyz);
	r13.xyz = (r16.xyz * r13.xyz) + -r16.xyz;
	r13.xyz = (c101.xxx * r13.xyz) + r16.xyz;
	r16.xyz = (r13.xyz * r13.xyz) + -r13.xyz;
	r13.xyz = (c103.zzz * r16.xyz) + r13.xyz;
	r16.xyz = r5.www * c104.xyz;
	r13.xyz = r13.xyz * r16.xyz;
	r0.w = -r1.w + c35.y;
	r0.w = (c109.y * r0.w) + r1.w;
	r6.w = clamp(mix(r0.w, r1.w, r2.x), 0.0, 1.0);
	r1.xyz = r1.xyz * r6.www;
	r0.w = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r10.xyz = (r14.xyz * r4.www) + r10.xyz;
	r16.xyz = normalize(r10.xyz);
	r10.y = clamp(dot(r6.xyz, r16.xyz), 0.0, 1.0);
	r16 = s10_texture.sample(s10, v0.xy);
	r15.w = r16.w;
	r10.z = r15.w;
	r17 = s7_texture.sample(s7, r10.yz);
	r1.w = r2.w * r10.y;
	r17.xyz = r0.www * r17.xyz;
	r17.xyz = r9.xyz * r17.xyz;
	r2.x = ((r2.z == 0.0) ? FLT_MAX : rsqrt(abs(r2.z)));
	r2.x = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r8.xyz = (r14.xyz * r4.www) + r8.xyz;
	r18.xyz = normalize(r8.xyz);
	r15.x = clamp(dot(r6.xyz, r18.xyz), 0.0, 1.0);
	r8 = s7_texture.sample(s7, r15.xw);
	r2.z = r2.z * r15.x;
	r8.xyz = r2.xxx * r8.xyz;
	r8.xyz = (r8.xyz * r7.xyz) + r17.xyz;
	r12.xyz = (r14.xyz * r4.www) + r12.xyz;
	r3.xyz = (r14.xyz * r4.www) + r3.xyz;
	r2.w = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r2.w = clamp((r2.w * c19.w) + c19.x, 0.0, 1.0);
	r4.w = min(r2.w, c19.z);
	r2.w = r4.w * r4.w;
	r14.xyz = normalize(r3.xyz);
	r15.y = clamp(dot(r6.xyz, r14.xyz), 0.0, 1.0);
	r14 = s7_texture.sample(s7, r15.yw);
	r17 = s4_texture.sample(s4, r15.zw);
	r3.x = -r15.z + c35.y;
	r4.w = pow(abs(r3.x), c105.x);
	r3.xyz = r2.yyy * r14.xyz;
	r14.xyz = normalize(r12.xyz);
	r10.x = clamp(dot(r6.xyz, r14.xyz), 0.0, 1.0);
	r6 = s7_texture.sample(s7, r10.xz);
	r2.y = r3.w * r10.x;
	r3.w = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r3.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r2.yz = r2.yz * r4.ww;
	r2.y = r3.w * r2.y;
	r6.xyz = r3.www * r6.xyz;
	r6.xyz = (r6.xyz * r11.xyz) + r8.xyz;
	r1.xyz = (r3.xyz * r1.xyz) + r6.xyz;
	r1.xyz = r5.www * r1.xyz;
	r3.x = mix(c10.x, c10.y, r16.y);
	r1.xyz = (r1.xyz * r3.xxx) + r13.xyz;
	r1.xyz = r17.yyy * r1.xyz;
	r3.xyz = r0.zxy * c35.xxx;
	r3.xyz = (r0.zxy * c35.xxx) + -r3.zxy;
	r6.xy = c0.xy;
	r3.w = (c12.w * r6.x) + r6.y;
	r3.w = fract(r3.w);
	r3.w = (r3.w * c0.z) + c0.w;
	r6.xy = float2(cos(r3.w), sin(r3.w));
	r3.xyz = r3.xyz * r6.yyy;
	r3.xyz = (r0.xyz * r6.xxx) + r3.xyz;
	r3.w = -r6.x + c35.y;
	r5.w = dot(c35.xxx, r0.xyz);
	r5.w = r5.w * c35.x;
	r3.xyz = (r5.www * r3.www) + r3.xyz;
	r3.w = abs(c12.w);
	r0.xyz = ((-r3.w >= 0.0) ? r0.xyz : r3.xyz);
	r3.xyz = r0.xyz + c35.www;
	r3.xyz = (r16.yyy * r3.xyz) + c35.yyy;
	r1.xyz = r1.xyz * r3.xyz;
	r3.xyz = c34.xyz;
	r3.x = dot(c102.xyz, r3.xyz);
	r3.y = r3.x + c33.w;
	r3.x = ((r3.x == 0.0) ? FLT_MAX : 1.0 / r3.x);
	r3.x = ((r3.y >= 0.0) ? r3.x : c34.w);
	r3.y = dot(r0.xyz, c34.xyz);
	r3.yzw = r3.yyy * c102.xyz;
	r3.xyz = (r3.yzw * r3.xxx) + -r0.xyz;
	r3.xyz = (c102.www * r3.xyz) + r0.xyz;
	r3.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r3.xyz = (r3.xyz * r3.www) + -r0.xyz;
	r1.w = r1.w * r4.w;
	r2.x = r2.x * r2.z;
	r0.w = r0.w * r1.w;
	r6.xyz = r9.xyz * r0.www;
	r6.xyz = (r2.xxx * r7.xyz) + r6.xyz;
	r2.xyz = (r2.yyy * r11.xyz) + r6.xyz;
	r6.y = c35.y;
	r0.w = (v6.w * c11.w) + r6.y;
	r1.w = r16.x * c105.y;
	r0.w = r0.w * r1.w;
	r2.xyz = r0.www * r2.xyz;
	r0.w = r16.y * c101.w;
	r6.xyz = (r0.xyz * r0.www) + -c106.xyz;
	r0.w = clamp(r0.w, 0.0, 1.0);
	r6.xyz = (r0.www * r6.xyz) + c106.xyz;
	r4.xyz = (r2.xyz * r6.xyz) + r4.xyz;
	r0.w = dot(r4.xyz, c34.xyz);
	r0.w = r0.w + c36.x;
	r0.w = clamp(r0.w * c36.y, 0.0, 1.0);
	r1.w = (r0.w * c36.z) + c36.w;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.w;
	r0.xyz = (r0.www * r3.xyz) + r0.xyz;
	r0.xyz = r16.zzz * r0.xyz;
	r0.xyz = (r0.xyz * r5.xyz) + r1.xyz;
	r0.xyz = (r2.xyz * r6.xyz) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	oC0.xyz = (r2.www * r0.xyz) + r1.xyz;
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

