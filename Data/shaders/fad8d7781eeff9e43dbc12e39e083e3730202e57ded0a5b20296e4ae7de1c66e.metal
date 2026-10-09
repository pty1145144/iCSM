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
	const float4 c19 = float4(2.000000000e+00, -1.000000000e+00, 0.000000000e+00, 1.000000000e+00); (void) c19;
	const float4 c26 = float4(5.000000000e-01, 1.591549367e-01, 6.283185482e+00, -3.141592741e+00); (void) c26;
	const float4 c27 = float4(5.773500204e-01, -4.000000060e-01, 3.021148033e-03, 2.114803717e-02); (void) c27;
	const float4 c29 = float4(-9.765625000e-04, 1.953125000e-03, 0.000000000e+00, 1.000000000e+00); (void) c29;
	const float4 c31 = float4(1.208459213e-02, 6.042296067e-02, 9.969788790e-02, 1.661631465e-01); (void) c31;
	const float4 c32 = float4(1.953125000e-03, 9.765625000e-04, 0.000000000e+00, 1.000000000e+00); (void) c32;
	const float4 c34 = float4(1.953125000e-03, 0.000000000e+00, 1.000000000e+00, -1.953125000e-03); (void) c34;
	const float4 c35 = float4(1.399999976e+00, 5.000000000e+00, -3.000000119e-01, -3.333333254e+00); (void) c35;
	const float4 c36 = float4(-2.000000000e+00, 3.000000000e+00, 1.000000000e+06, 0.000000000e+00); (void) c36;
	const float4 c37 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -9.999999975e-07); (void) c37;
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
	float4 r22;
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
	#define c20 uniforms.uniforms_float4[19]
	#define c21 uniforms.uniforms_float4[20]
	#define c22 uniforms.uniforms_float4[21]
	#define c23 uniforms.uniforms_float4[22]
	#define c24 uniforms.uniforms_float4[23]
	#define c25 uniforms.uniforms_float4[24]
	#define c28 uniforms.uniforms_float4[25]
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
	r1.xyz = r0.zxy * c27.xxx;
	r1.xyz = (r0.zxy * c27.xxx) + -r1.zxy;
	r2 = s3_texture.sample(s3, v0.xy);
	r1.w = r2.x * c12.w;
	r1.w = (r1.w * c26.y) + c26.x;
	r1.w = fract(r1.w);
	r1.w = (r1.w * c26.z) + c26.w;
	r3.xy = float2(cos(r1.w), sin(r1.w));
	r1.xyz = r1.xyz * r3.yyy;
	r1.xyz = (r0.xyz * r3.xxx) + r1.xyz;
	r1.w = -r3.x + c19.w;
	r2.y = dot(c27.xxx, r0.xyz);
	r2.y = r2.y * c27.x;
	r1.xyz = (r2.yyy * r1.www) + r1.xyz;
	r2.y = abs(c12.w);
	r1.w = c19.w;
	r0.w = r2.x;
	r2.x = -r2.w + c19.w;
	r0 = ((-r2.y >= 0.0) ? r0 : r1);
	r1.xyz = r0.xyz * r0.xyz;
	r1.xyz = r1.xyz * r1.xyz;
	r1.w = dot(r1.xyz, c37.xyz);
	r2.y = r1.w + c37.w;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = ((r2.y >= 0.0) ? r1.w : c36.z);
	r2.y = dot(r0.xyz, c37.xyz);
	r1.xyz = r1.xyz * r2.yyy;
	r3.xyz = mix(r0.xyz, r2.yyy, -c101.yyy);
	r1.xyz = (r1.xyz * r1.www) + -r0.xyz;
	r1.xyz = (c101.yyy * r1.xyz) + r0.xyz;
	r1.xyz = ((c101.y >= 0.0) ? r1.xyz : r3.xyz);
	r1.w = abs(c101.y);
	r1.xyz = ((-r1.w >= 0.0) ? r0.xyz : r1.xyz);
	r3 = (v5.xyzx * c19.wwwz) + c19.zzzw;
	r1.w = dot(r3, c18);
	r2.y = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r4.x = dot(r3, c15);
	r4.y = dot(r3, c16);
	r4.z = dot(r3, c17);
	r3.xyz = r2.yyy * r4.xyz;
	r4 = r3.xyzx * c19.wwwz;
	r5 = r4 + c34.xxyz;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r6 = r4 + c34.wxyz;
	r6 = float4(s11_texture.sample_compare(s11, (r6.xyz).xy, (r6.xyz).z));
	r5.y = r6.x;
	r6 = r4 + c34.xwyz;
	r6 = float4(s11_texture.sample_compare(s11, (r6.xyz).xy, (r6.xyz).z));
	r5.z = r6.x;
	r6 = r4 + c34.wwyz;
	r6 = float4(s11_texture.sample_compare(s11, (r6.xyz).xy, (r6.xyz).z));
	r5.w = r6.x;
	r2.y = dot(r5, c27.zzzz);
	r5 = r4 + c34.xyyz;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r6 = r4 + c34.wyyz;
	r6 = float4(s11_texture.sample_compare(s11, (r6.xyz).xy, (r6.xyz).z));
	r5.y = r6.x;
	r6 = r4 + c34.yxyz;
	r6 = float4(s11_texture.sample_compare(s11, (r6.xyz).xy, (r6.xyz).z));
	r5.z = r6.x;
	r6 = r4 + c34.ywyz;
	r6 = float4(s11_texture.sample_compare(s11, (r6.xyz).xy, (r6.xyz).z));
	r5.w = r6.x;
	r2.z = dot(r5, c27.wwww);
	r2.y = r2.z + r2.y;
	r5 = r4 + c32;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r6 = r4 + c32.yxzw;
	r6 = float4(s11_texture.sample_compare(s11, (r6.xyz).xy, (r6.xyz).z));
	r5.y = r6.x;
	r6 = r4 + c29;
	r6 = float4(s11_texture.sample_compare(s11, (r6.xyz).xy, (r6.xyz).z));
	r5.z = r6.x;
	r6 = r4 + c38;
	r6 = float4(s11_texture.sample_compare(s11, (r6.xyz).xy, (r6.xyz).z));
	r5.w = r6.x;
	r2.z = dot(r5, c31.xxxx);
	r2.y = r2.z + r2.y;
	r5 = r4 + c39;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r6 = r4 + c39.yxzw;
	r6 = float4(s11_texture.sample_compare(s11, (r6.xyz).xy, (r6.xyz).z));
	r5.y = r6.x;
	r6 = r4 + c38.yxzw;
	r6 = float4(s11_texture.sample_compare(s11, (r6.xyz).xy, (r6.xyz).z));
	r5.z = r6.x;
	r6 = r4 + c29.yxzw;
	r6 = float4(s11_texture.sample_compare(s11, (r6.xyz).xy, (r6.xyz).z));
	r5.w = r6.x;
	r2.z = dot(r5, c31.xxxx);
	r2.y = r2.z + r2.y;
	r5 = r4 + c32.yyzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r6 = r4 + c40;
	r6 = float4(s11_texture.sample_compare(s11, (r6.xyz).xy, (r6.xyz).z));
	r5.y = r6.x;
	r6 = r4 + c40.yxzw;
	r6 = float4(s11_texture.sample_compare(s11, (r6.xyz).xy, (r6.xyz).z));
	r5.z = r6.x;
	r6 = r4 + c29.xxzw;
	r6 = float4(s11_texture.sample_compare(s11, (r6.xyz).xy, (r6.xyz).z));
	r5.w = r6.x;
	r2.z = dot(r5, c31.yyyy);
	r2.y = r2.z + r2.y;
	r5 = r4 + c32.yzzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r6 = r4 + c29.xzzw;
	r6 = float4(s11_texture.sample_compare(s11, (r6.xyz).xy, (r6.xyz).z));
	r5.y = r6.x;
	r6 = r4 + c29.zxzw;
	r4 = r4 + c32.zyzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r5.w = r4.x;
	r4 = float4(s11_texture.sample_compare(s11, (r6.xyz).xy, (r6.xyz).z));
	r5.z = r4.x;
	r2.z = dot(r5, c31.zzzz);
	r2.y = r2.z + r2.y;
	r3.w = c19.w;
	r4 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r3 = s8_texture.sample(s8, r3.xy);
	r3.xyz = ((-r1.w >= 0.0) ? c19.zzz : r3.xyz);
	r1.w = (r4.x * c31.w) + r2.y;
	r2.y = pow(abs(r1.w), c35.x);
	r1.w = clamp(r2.y, 0.0, 1.0);
	r2.z = -r1.w + c19.w;
	r1.w = (c109.y * r2.z) + r1.w;
	r4.x = c19.w;
	r5.xyz = c14.xyz + -v5.xyz;
	r2.z = dot(r5.xyz, r5.xyz);
	r4.z = ((r2.z == 0.0) ? FLT_MAX : 1.0 / r2.z);
	r4.y = ((r2.z == 0.0) ? FLT_MAX : rsqrt(abs(r2.z)));
	r2.z = clamp(dot(c13.xyz, r4.xyz), 0.0, 1.0);
	r3.w = clamp(mix(r1.w, r2.y, r2.z), 0.0, 1.0);
	r4.xzw = r3.xyz * c28.xyz;
	r4.xzw = r3.www * r4.xzw;
	r5.xyz = r4.yyy * r5.xyz;
	r1.w = ((r4.y == 0.0) ? FLT_MAX : 1.0 / r4.y);
	r1.w = r1.w + -c13.w;
	r6 = s1_texture.sample(s1, v0.xy);
	r6.xyz = (r6.xyz * c19.xxx) + c19.yyy;
	r7.x = dot(v2.xyz, r6.xyz);
	r7.y = dot(v3.xyz, r6.xyz);
	r7.z = dot(v4.xyz, r6.xyz);
	r6.xyz = normalize(r7.xyz);
	r2.w = dot(r5.xyz, r6.xyz);
	r3.w = clamp(r2.w + c28.w, 0.0, 1.0);
	r2.w = clamp(r2.w, 0.0, 1.0);
	r2.w = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r2.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r3.w = r2.z * r3.w;
	r4.xyz = r4.xzw * r3.www;
	r7.y = c27.y;
	r3.w = r7.y * c13.w;
	r3.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r1.w = clamp(r1.w * r3.w, 0.0, 1.0);
	r7.x = ((r6.x >= 0.0) ? c19.z : c19.w);
	r7.y = ((r6.y >= 0.0) ? c19.z : c19.w);
	r7.z = ((r6.z >= 0.0) ? c19.z : c19.w);
	r8.xyz = r6.xyz * r6.xyz;
	r7.xyz = r7.xyz * r8.xyz;
	r9.xyz = r7.xxx * c5.xyz;
	r10.x = ((r6.x >= 0.0) ? c19.w : c19.z);
	r10.y = ((r6.y >= 0.0) ? c19.w : c19.z);
	r10.z = ((r6.z >= 0.0) ? c19.w : c19.z);
	r8.xyz = r8.xyz * r10.xyz;
	r9.xyz = (r8.xxx * c4.xyz) + r9.xyz;
	r8.xyw = (r8.yyy * c6.xyz) + r9.xyz;
	r7.xyw = (r7.yyy * c7.xyz) + r8.xyw;
	r7.xyw = (r8.zzz * c8.xyz) + r7.xyw;
	r7.xyz = (r7.zzz * c9.xyz) + r7.xyw;
	r8.xyz = c21.xyz + -v5.xyz;
	r9.xyz = normalize(r8.xyz);
	r3.w = clamp(dot(r6.xyz, r9.xyz), 0.0, 1.0);
	r4.w = (r3.w * r3.w) + r3.w;
	r4.w = r4.w * c26.x;
	r8.xyz = c20.xyz * v1.xxx;
	r7.xyz = (r8.xyz * r4.www) + r7.xyz;
	r10.xyz = c22.xyz * v1.yyy;
	r11.xyz = c23.xyz + -v5.xyz;
	r12.xyz = normalize(r11.xyz);
	r4.w = clamp(dot(r6.xyz, r12.xyz), 0.0, 1.0);
	r5.w = (r4.w * r4.w) + r4.w;
	r5.w = r5.w * c26.x;
	r7.xyz = (r10.xyz * r5.www) + r7.xyz;
	r11.xyz = c24.xyz * v1.zzz;
	r13.xyz = c25.xyz + -v5.xyz;
	r14.xyz = normalize(r13.xyz);
	r5.w = clamp(dot(r6.xyz, r14.xyz), 0.0, 1.0);
	r7.w = (r5.w * r5.w) + r5.w;
	r7.w = r7.w * c26.x;
	r7.xyz = (r11.xyz * r7.www) + r7.xyz;
	r13.x = c23.w + -v5.x;
	r13.y = c24.w + -v5.y;
	r13.z = c25.w + -v5.z;
	r15.xyz = normalize(r13.xyz);
	r7.w = clamp(dot(r6.xyz, r15.xyz), 0.0, 1.0);
	r8.w = (r7.w * r7.w) + r7.w;
	r8.w = r8.w * c26.x;
	r13.x = c20.w * v1.w;
	r13.y = c21.w * v1.w;
	r13.z = c22.w * v1.w;
	r7.xyz = (r13.xyz * r8.www) + r7.xyz;
	r4.xyz = (r4.xyz * r1.www) + r7.xyz;
	r1.w = r1.w * r2.z;
	r7.xyz = r1.www * c28.xyz;
	r3.xyz = r3.xyz * r7.xyz;
	r1.w = dot(r4.xyz, c37.xyz);
	r7.xy = r1.ww + -c2.xw;
	r16.xy = -c2.xw + c2.yz;
	r1.w = ((r16.y == 0.0) ? FLT_MAX : 1.0 / r16.y);
	r7.z = ((r16.x == 0.0) ? FLT_MAX : 1.0 / r16.x);
	r7.x = clamp(r7.z * r7.x, 0.0, 1.0);
	r1.w = clamp(r1.w * r7.y, 0.0, 1.0);
	r7.y = (r1.w * c36.x) + c36.y;
	r1.w = r1.w * r1.w;
	r7.z = ((r4.w == 0.0) ? FLT_MAX : rsqrt(abs(r4.w)));
	r7.z = ((r7.z == 0.0) ? FLT_MAX : 1.0 / r7.z);
	r16.xyz = c3.xyz + -v5.xyz;
	r8.w = dot(r16.xyz, r16.xyz);
	r8.w = ((r8.w == 0.0) ? FLT_MAX : rsqrt(abs(r8.w)));
	r17.xyz = (r16.xyz * r8.www) + r12.xyz;
	r18.xyz = normalize(r17.xyz);
	r17.z = clamp(dot(r6.xyz, r18.xyz), 0.0, 1.0);
	r4.w = r4.w * r17.z;
	r18.xyz = r8.www * r16.xyz;
	r9.w = dot(r18.xyz, r6.xyz);
	r19.z = clamp(r9.w, 0.0, 1.0);
	r9.w = r9.w + r9.w;
	r10.w = -r19.z + c19.w;
	r11.w = pow(abs(r10.w), c105.x);
	r4.w = r4.w * r11.w;
	r4.w = r7.z * r4.w;
	r20.xyz = (r16.xyz * r8.www) + r9.xyz;
	r21.xyz = normalize(r20.xyz);
	r19.x = clamp(dot(r6.xyz, r21.xyz), 0.0, 1.0);
	r10.w = r3.w * r19.x;
	r3.w = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r3.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r10.w = r11.w * r10.w;
	r12.w = (r10.w * r3.w) + r4.w;
	r20.xyz = r10.xyz * r4.www;
	r4.w = r3.w * r10.w;
	r20.xyz = (r4.www * r8.xyz) + r20.xyz;
	r21.xyz = (r16.xyz * r8.www) + r14.xyz;
	r4.w = clamp(dot(r18.xyz, r14.xyz), 0.0, 1.0);
	r14.xyz = normalize(r21.xyz);
	r17.y = clamp(dot(r6.xyz, r14.xyz), 0.0, 1.0);
	r10.w = r5.w * r17.y;
	r5.w = ((r5.w == 0.0) ? FLT_MAX : rsqrt(abs(r5.w)));
	r5.w = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r10.w = r11.w * r10.w;
	r12.w = (r10.w * r5.w) + r12.w;
	r10.w = r5.w * r10.w;
	r14.xyz = (r10.www * r11.xyz) + r20.xyz;
	r10.w = ((r7.w == 0.0) ? FLT_MAX : rsqrt(abs(r7.w)));
	r10.w = ((r10.w == 0.0) ? FLT_MAX : 1.0 / r10.w);
	r20.xyz = (r16.xyz * r8.www) + r15.xyz;
	r13.w = clamp(dot(r18.xyz, r15.xyz), 0.0, 1.0);
	r5.xyz = (r16.xyz * r8.www) + r5.xyz;
	r15.xyz = normalize(r5.xyz);
	r19.y = clamp(dot(r6.xyz, r15.xyz), 0.0, 1.0);
	r5.xyz = normalize(r20.xyz);
	r17.x = clamp(dot(r6.xyz, r5.xyz), 0.0, 1.0);
	r5.x = r7.w * r17.x;
	r5.x = r11.w * r5.x;
	r5.y = (r5.x * r10.w) + r12.w;
	r5.x = r10.w * r5.x;
	r14.xyz = (r5.xxx * r13.xyz) + r14.xyz;
	r5.xy = r5.yy + -c33.xw;
	r15.xy = -c33.xw + c33.yz;
	r5.z = ((r15.x == 0.0) ? FLT_MAX : 1.0 / r15.x);
	r7.w = ((r15.y == 0.0) ? FLT_MAX : 1.0 / r15.y);
	r5.y = clamp(r5.y * r7.w, 0.0, 1.0);
	r5.x = clamp(r5.z * r5.x, 0.0, 1.0);
	r5.z = (r5.x * c36.x) + c36.y;
	r5.x = r5.x * r5.x;
	r5.x = r5.x * r5.z;
	r5.z = (r5.y * c36.x) + c36.y;
	r5.y = r5.y * r5.y;
	r5.y = r5.y * r5.z;
	r5.x = r5.y * r5.x;
	r15 = s10_texture.sample(s10, v0.xy);
	r5.y = r15.y * c101.w;
	r16.xyz = (r0.xyz * r5.yyy) + -c106.xyz;
	r5.y = clamp(r5.y, 0.0, 1.0);
	r16.xyz = (r5.yyy * r16.xyz) + c106.xyz;
	r7.w = c19.w;
	r5.y = (v6.w * c11.w) + r7.w;
	r5.z = r15.x * c105.y;
	r5.y = r5.y * r5.z;
	r14.xyz = r5.yyy * r14.xyz;
	r20.xyz = r16.xyz * r14.xyz;
	r5.y = dot(r20.xyz, c37.xyz);
	r5.x = r5.y * r5.x;
	r5.x = r5.x * c106.w;
	r1.w = (r7.y * r1.w) + r5.x;
	r5.x = (r7.x * c36.x) + c36.y;
	r5.y = r7.x * r7.x;
	r5.x = r5.y * r5.x;
	r1.w = r1.w * r5.x;
	r0.w = r0.w * r1.w;
	r5.xyz = mix(r0.xyz, r1.xyz, r0.www);
	r0.xyz = r0.xyz + c19.yyy;
	r0.xyz = (r15.yyy * r0.xyz) + c19.www;
	r0.w = dot(r5.xyz, c37.xyz);
	r1.xyz = r0.www * c102.xyz;
	r20.xyz = c37.xyz;
	r0.w = dot(c102.xyz, r20.xyz);
	r1.w = r0.w + c37.w;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r1.w >= 0.0) ? r0.w : c36.z);
	r1.xyz = (r1.xyz * r0.www) + -r5.xyz;
	r1.xyz = (c102.www * r1.xyz) + r5.xyz;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r1.xyz = (r1.xyz * r0.www) + -r5.xyz;
	r7.xyw = (r14.xyz * r16.xyz) + r4.xyz;
	r4.xyz = r4.xyz + v6.xyz;
	r0.w = dot(r7.xyw, c37.xyz);
	r0.w = r0.w + c35.z;
	r0.w = clamp(r0.w * c35.w, 0.0, 1.0);
	r1.w = (r0.w * c36.x) + c36.y;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.w;
	r1.xyz = (r0.www * r1.xyz) + r5.xyz;
	r1.xyz = r15.zzz * r1.xyz;
	r19.w = r15.w;
	r20 = s7_texture.sample(s7, r19.xw);
	r0.w = clamp(dot(r18.xyz, r9.xyz), 0.0, 1.0);
	r1.w = clamp(r9.z, 0.0, 1.0);
	r1.w = (r1.w * r1.w) + r1.w;
	r1.w = r1.w * c26.x;
	r5.xyz = r1.www * r8.xyz;
	r1.w = r19.z * r19.z;
	r21 = s4_texture.sample(s4, r19.zw);
	r22.w = r1.w * r1.w;
	r1.w = r2.x * r22.w;
	r7.xyw = r1.www * v6.xyz;
	r22.xyz = r7.xyw * c35.yyy;
	r22 = ((-r2.x >= 0.0) ? c19.zzzz : r22);
	r0.w = r0.w * r22.w;
	r7.xyw = (r0.www * c35.yyy) + -r20.xyz;
	r7.xyw = (r2.xxx * r7.xyw) + r20.xyz;
	r7.xyw = ((-r2.x >= 0.0) ? r20.xyz : r7.xyw);
	r7.xyw = r3.www * r7.xyw;
	r7.xyw = (r7.xyw * r8.xyz) + r22.xyz;
	r0.w = clamp(dot(r18.xyz, r12.xyz), 0.0, 1.0);
	r0.w = r0.w * r22.w;
	r17.w = r19.w;
	r12 = s7_texture.sample(s7, r19.yw);
	r9.xyz = r2.www * r12.xyz;
	r12 = s7_texture.sample(s7, r17.zw);
	r19.xyz = (r0.www * c35.yyy) + -r12.xyz;
	r19.xyz = (r2.xxx * r19.xyz) + r12.xyz;
	r12.xyz = ((-r2.x >= 0.0) ? r12.xyz : r19.xyz);
	r12.xyz = r7.zzz * r12.xyz;
	r7.xyz = (r12.xyz * r10.xyz) + r7.xyw;
	r0.w = r4.w * r22.w;
	r1.w = r13.w * r22.w;
	r12 = s7_texture.sample(s7, r17.yw);
	r17 = s7_texture.sample(s7, r17.xw);
	r10.xyz = (r0.www * c35.yyy) + -r12.xyz;
	r10.xyz = (r2.xxx * r10.xyz) + r12.xyz;
	r10.xyz = ((-r2.x >= 0.0) ? r12.xyz : r10.xyz);
	r10.xyz = r5.www * r10.xyz;
	r7.xyz = (r10.xyz * r11.xyz) + r7.xyz;
	r10.xyz = (r1.www * c35.yyy) + -r17.xyz;
	r10.xyz = (r2.xxx * r10.xyz) + r17.xyz;
	r10.xyz = ((-r2.x >= 0.0) ? r17.xyz : r10.xyz);
	r0.w = mix(r21.y, c19.w, r2.x);
	r1.w = r15.x * r21.z;
	r2.x = mix(c10.x, c10.y, r15.y);
	r1.w = r1.w * c0.w;
	r10.xyz = r10.www * r10.xyz;
	r7.xyz = (r10.xyz * r13.xyz) + r7.xyz;
	r2.w = -r2.y + c19.w;
	r2.w = (c109.y * r2.w) + r2.y;
	r3.w = clamp(mix(r2.w, r2.y, r2.z), 0.0, 1.0);
	r2.yzw = r3.www * r3.xyz;
	r2.yzw = (r9.xyz * r2.yzw) + r7.xyz;
	r2.yzw = r6.www * r2.yzw;
	r2.xyz = r2.xxx * r2.yzw;
	r2.w = dot(r6.xyz, r6.xyz);
	r3.xyz = r18.xyz * r2.www;
	r3.xyz = (r9.www * r6.xyz) + -r3.xyz;
	r2.w = clamp(dot(r6.xyz, v9.xyz), 0.0, 1.0);
	r6.x = ((r3.x >= 0.0) ? c19.z : c19.w);
	r6.y = ((r3.y >= 0.0) ? c19.z : c19.w);
	r6.z = ((r3.z >= 0.0) ? c19.z : c19.w);
	r7.xyz = r3.xyz * r3.xyz;
	r3.x = ((r3.x >= 0.0) ? c19.w : c19.z);
	r3.y = ((r3.y >= 0.0) ? c19.w : c19.z);
	r3.z = ((r3.z >= 0.0) ? c19.w : c19.z);
	r3.xyz = r7.xyz * r3.xyz;
	r6.xyz = r6.xyz * r7.xyz;
	r7.xyz = r6.xxx * c5.xyz;
	r7.xyz = (r3.xxx * c4.xyz) + r7.xyz;
	r3.xyw = (r3.yyy * c6.xyz) + r7.xyz;
	r3.xyw = (r6.yyy * c7.xyz) + r3.xyw;
	r3.xyz = (r3.zzz * c8.xyz) + r3.xyw;
	r3.xyz = (r6.zzz * c9.xyz) + r3.xyz;
	r3.xyz = r5.xyz * r3.xyz;
	r5.x = v7.w;
	r5.y = v8.w;
	r5.z = v9.w;
	r5.xyz = -r5.xyz + c21.xyz;
	r6.xyz = normalize(r5.xyz);
	r3.w = clamp(dot(-v9.xyz, r6.xyz), 0.0, 1.0);
	r3.w = (r3.w * r3.w) + r3.w;
	r3.w = r3.w * c26.x;
	r5.xyz = r3.www * r8.xyz;
	r6.xyz = c0.xyz * v6.xyz;
	r5.xyz = (r6.xyz * r5.xyz) + -r3.xyz;
	r3.xyz = (r2.www * r5.xyz) + r3.xyz;
	r3.xyz = r1.www * r3.xyz;
	r2.xyz = (r2.xyz * r0.www) + r3.xyz;
	r0.xyz = r0.xyz * r2.xyz;
	r0.xyz = (r1.xyz * r4.xyz) + r0.xyz;
	r0.xyz = (r14.xyz * r16.xyz) + r0.xyz;
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

