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
	const float4 c26 = float4(5.773500204e-01, 1.000000000e+00, 2.000000000e+00, -1.000000000e+00); (void) c26;
	const float4 c27 = float4(-3.000000119e-01, -3.333333254e+00, -2.000000000e+00, 3.000000000e+00); (void) c27;
	const float4 c31 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, 1.000000000e+06); (void) c31;
	const float4 c32 = float4(0.000000000e+00, 1.000000000e+00, -4.000000060e-01, -9.999999975e-07); (void) c32;
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
	#define oC0 output.oC0
	r0.xyz = c31.xyz;
	r0.x = dot(c102.xyz, r0.xyz);
	r0.y = r0.x + c32.w;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = ((r0.y >= 0.0) ? r0.x : c31.w);
	r1.xy = c0.xy;
	r0.y = (c12.w * r1.x) + r1.y;
	r0.y = fract(r0.y);
	r0.y = (r0.y * c0.z) + c0.w;
	r1.xy = float2(cos(r0.y), sin(r0.y));
	r2 = s0_texture.sample(s0, v0.xy);
	r0.yzw = r2.zxy * c26.xxx;
	r0.yzw = (r2.zxy * c26.xxx) + -r0.wyz;
	r0.yzw = r1.yyy * r0.yzw;
	r0.yzw = (r2.xyz * r1.xxx) + r0.yzw;
	r1.x = -r1.x + c26.y;
	r1.y = dot(c26.xxx, r2.xyz);
	r1.y = r1.y * c26.x;
	r0.yzw = (r1.yyy * r1.xxx) + r0.yzw;
	r1.x = abs(c12.w);
	r0.yzw = ((-r1.x >= 0.0) ? r2.xyz : r0.yzw);
	r1.xyz = r2.www * c104.xyz;
	r2.xyz = r0.yzw * r0.yzw;
	r2.xyz = r2.xyz * r2.xyz;
	r1.w = dot(r2.xyz, c31.xyz);
	r2.w = r1.w + c32.w;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = ((r2.w >= 0.0) ? r1.w : c31.w);
	r2.w = dot(r0.yzw, c31.xyz);
	r2.xyz = r2.www * r2.xyz;
	r3.xyz = mix(r0.yzw, r2.www, -c101.yyy);
	r2.xyz = (r2.xyz * r1.www) + -r0.yzw;
	r2.xyz = (c101.yyy * r2.xyz) + r0.yzw;
	r2.xyz = ((c101.y >= 0.0) ? r2.xyz : r3.xyz);
	r1.w = abs(c101.y);
	r2.xyz = ((-r1.w >= 0.0) ? r0.yzw : r2.xyz);
	r3.xyz = c23.xyz + -v5.xyz;
	r4.xyz = normalize(r3.xyz);
	r3 = s1_texture.sample(s1, v0.xy);
	r3.xyz = (r3.xyz * c26.zzz) + c26.www;
	r5.x = dot(v2.xyz, r3.xyz);
	r5.y = dot(v3.xyz, r3.xyz);
	r5.z = dot(v4.xyz, r3.xyz);
	r3.xyz = normalize(r5.xyz);
	r1.w = clamp(dot(r3.xyz, r4.xyz), 0.0, 1.0);
	r5.xyz = c3.xyz + -v5.xyz;
	r2.w = dot(r5.xyz, r5.xyz);
	r2.w = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r4.xyz = (r5.xyz * r2.www) + r4.xyz;
	r6.xyz = normalize(r4.xyz);
	r4.z = clamp(dot(r3.xyz, r6.xyz), 0.0, 1.0);
	r5.w = r1.w * r4.z;
	r6.xyz = r2.www * r5.xyz;
	r6.w = dot(r6.xyz, r3.xyz);
	r7.z = clamp(r6.w, 0.0, 1.0);
	r6.w = r6.w + r6.w;
	r8.x = -r7.z + c26.y;
	r9.x = pow(abs(r8.x), c105.x);
	r5.w = r5.w * r9.x;
	r8.x = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.w = (r1.w * r1.w) + r1.w;
	r1.w = r1.w * c0.y;
	r8.x = ((r8.x == 0.0) ? FLT_MAX : 1.0 / r8.x);
	r5.w = r5.w * r8.x;
	r8.yzw = c21.xyz + -v5.xyz;
	r10.xyz = normalize(r8.yzw);
	r8.yzw = (r5.xyz * r2.www) + r10.xyz;
	r9.y = clamp(dot(r3.xyz, r10.xyz), 0.0, 1.0);
	r10.xyz = normalize(r8.yzw);
	r7.x = clamp(dot(r3.xyz, r10.xyz), 0.0, 1.0);
	r8.y = r9.y * r7.x;
	r8.y = r9.x * r8.y;
	r8.z = ((r9.y == 0.0) ? FLT_MAX : rsqrt(abs(r9.y)));
	r8.w = (r9.y * r9.y) + r9.y;
	r8.w = r8.w * c0.y;
	r8.z = ((r8.z == 0.0) ? FLT_MAX : 1.0 / r8.z);
	r9.y = (r8.y * r8.z) + r5.w;
	r8.y = r8.z * r8.y;
	r10.xyz = c25.xyz + -v5.xyz;
	r11.xyz = normalize(r10.xyz);
	r10.xyz = (r5.xyz * r2.www) + r11.xyz;
	r9.z = clamp(dot(r3.xyz, r11.xyz), 0.0, 1.0);
	r11.xyz = normalize(r10.xyz);
	r4.y = clamp(dot(r3.xyz, r11.xyz), 0.0, 1.0);
	r9.w = r9.z * r4.y;
	r9.w = r9.x * r9.w;
	r10.x = ((r9.z == 0.0) ? FLT_MAX : rsqrt(abs(r9.z)));
	r9.z = (r9.z * r9.z) + r9.z;
	r9.z = r9.z * c0.y;
	r10.x = ((r10.x == 0.0) ? FLT_MAX : 1.0 / r10.x);
	r9.y = (r9.w * r10.x) + r9.y;
	r11.x = c23.w + -v5.x;
	r11.y = c24.w + -v5.y;
	r11.z = c25.w + -v5.z;
	r12.xyz = normalize(r11.xyz);
	r10.yzw = (r5.xyz * r2.www) + r12.xyz;
	r11.x = clamp(dot(r3.xyz, r12.xyz), 0.0, 1.0);
	r12.xyz = normalize(r10.yzw);
	r4.x = clamp(dot(r3.xyz, r12.xyz), 0.0, 1.0);
	r10.y = r11.x * r4.x;
	r9.x = r9.x * r10.y;
	r10.y = ((r11.x == 0.0) ? FLT_MAX : rsqrt(abs(r11.x)));
	r10.z = (r11.x * r11.x) + r11.x;
	r10.z = r10.z * c0.y;
	r10.y = ((r10.y == 0.0) ? FLT_MAX : 1.0 / r10.y);
	r9.y = (r9.x * r10.y) + r9.y;
	r11.xy = r9.yy + -c33.xw;
	r11.zw = -c33.xw + c33.yz;
	r9.y = ((r11.z == 0.0) ? FLT_MAX : 1.0 / r11.z);
	r10.w = ((r11.w == 0.0) ? FLT_MAX : 1.0 / r11.w);
	r10.w = clamp(r10.w * r11.y, 0.0, 1.0);
	r9.y = clamp(r9.y * r11.x, 0.0, 1.0);
	r11.x = (r9.y * c27.z) + c27.w;
	r9.y = r9.y * r9.y;
	r9.y = r9.y * r11.x;
	r11.x = (r10.w * c27.z) + c27.w;
	r10.w = r10.w * r10.w;
	r10.w = r10.w * r11.x;
	r9.xyw = r9.xyw * r10.ywx;
	r11 = s10_texture.sample(s10, v0.xy);
	r10.w = r11.y * c101.w;
	r12.xyz = (r0.yzw * r10.www) + -c106.xyz;
	r10.w = clamp(r10.w, 0.0, 1.0);
	r12.xyz = (r10.www * r12.xyz) + c106.xyz;
	r13.xyz = c22.xyz * v1.yyy;
	r14.xyz = r5.www * r13.xyz;
	r15.xyz = c20.xyz * v1.xxx;
	r14.xyz = (r8.yyy * r15.xyz) + r14.xyz;
	r16.xyz = c24.xyz * v1.zzz;
	r14.xyz = (r9.www * r16.xyz) + r14.xyz;
	r17.x = c20.w * v1.w;
	r17.y = c21.w * v1.w;
	r17.z = c22.w * v1.w;
	r14.xyz = (r9.xxx * r17.xyz) + r14.xyz;
	r8.y = c26.y;
	r5.w = (v6.w * c11.w) + r8.y;
	r8.y = r11.x * c105.y;
	r5.w = r5.w * r8.y;
	r14.xyz = r5.www * r14.xyz;
	r18.xyz = r12.xyz * r14.xyz;
	r5.w = dot(r18.xyz, c31.xyz);
	r5.w = r5.w * r9.y;
	r5.w = r5.w * c106.w;
	r9.x = ((r3.x >= 0.0) ? c32.x : c32.y);
	r9.y = ((r3.y >= 0.0) ? c32.x : c32.y);
	r9.w = ((r3.z >= 0.0) ? c32.x : c32.y);
	r18.xyz = r3.xyz * r3.xyz;
	r9.xyw = r9.xyw * r18.xyz;
	r19.xyz = r9.xxx * c5.xyz;
	r20.x = ((r3.x >= 0.0) ? c32.y : c32.x);
	r20.y = ((r3.y >= 0.0) ? c32.y : c32.x);
	r20.z = ((r3.z >= 0.0) ? c32.y : c32.x);
	r18.xyz = r18.xyz * r20.xyz;
	r19.xyz = (r18.xxx * c4.xyz) + r19.xyz;
	r18.xyw = (r18.yyy * c6.xyz) + r19.xyz;
	r18.xyw = (r9.yyy * c7.xyz) + r18.xyw;
	r18.xyz = (r18.zzz * c8.xyz) + r18.xyw;
	r9.xyw = (r9.www * c9.xyz) + r18.xyz;
	r9.xyw = (r15.xyz * r8.www) + r9.xyw;
	r9.xyw = (r13.xyz * r1.www) + r9.xyw;
	r9.xyz = (r16.xyz * r9.zzz) + r9.xyw;
	r9.xyz = (r17.xyz * r10.zzz) + r9.xyz;
	r18 = (v5.xyzx * c32.yyyx) + c32.xxxy;
	r1.w = dot(r18, c18);
	r8.y = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r19.x = dot(r18, c15);
	r19.y = dot(r18, c16);
	r19.z = dot(r18, c17);
	r18.xyz = r8.yyy * r19.xyz;
	r19 = s8_texture.sample(s8, r18.xy);
	r19.xyz = ((-r1.w >= 0.0) ? c32.xxx : r19.xyz);
	r20.xyz = r19.xyz * c28.xyz;
	r18.w = c26.y;
	r18 = float4(s11_texture.sample_compare(s11, (r18.xyz).xy, (r18.xyz).z));
	r1.w = clamp(r18.x, 0.0, 1.0);
	r8.y = -r1.w + c26.y;
	r1.w = (c109.y * r8.y) + r1.w;
	r21.x = c26.y;
	r18.yzw = c14.xyz + -v5.xyz;
	r8.y = dot(r18.yzw, r18.yzw);
	r21.z = ((r8.y == 0.0) ? FLT_MAX : 1.0 / r8.y);
	r21.y = ((r8.y == 0.0) ? FLT_MAX : rsqrt(abs(r8.y)));
	r8.y = clamp(dot(c13.xyz, r21.xyz), 0.0, 1.0);
	r9.w = clamp(mix(r1.w, r18.x, r8.y), 0.0, 1.0);
	r20.xyz = r9.www * r20.xyz;
	r18.yzw = r18.yzw * r21.yyy;
	r1.w = ((r21.y == 0.0) ? FLT_MAX : 1.0 / r21.y);
	r1.w = r1.w + -c13.w;
	r8.w = dot(r18.yzw, r3.xyz);
	r5.xyz = (r5.xyz * r2.www) + r18.yzw;
	r2.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r2.w = clamp((r2.w * c19.w) + c19.x, 0.0, 1.0);
	r9.w = min(r2.w, c19.z);
	r2.w = r9.w * r9.w;
	r21.xyz = normalize(r5.xyz);
	r7.y = clamp(dot(r3.xyz, r21.xyz), 0.0, 1.0);
	r5.x = clamp(r8.w + c28.w, 0.0, 1.0);
	r8.w = clamp(r8.w, 0.0, 1.0);
	r5.y = ((r8.w == 0.0) ? FLT_MAX : rsqrt(abs(r8.w)));
	r5.y = ((r5.y == 0.0) ? FLT_MAX : 1.0 / r5.y);
	r5.x = r5.x * r8.y;
	r18.yzw = r20.xyz * r5.xxx;
	r5.z = c32.z;
	r5.x = r5.z * c13.w;
	r5.x = ((r5.x == 0.0) ? FLT_MAX : 1.0 / r5.x);
	r1.w = clamp(r1.w * r5.x, 0.0, 1.0);
	r9.xyz = (r18.yzw * r1.www) + r9.xyz;
	r1.w = r1.w * r8.y;
	r18.yzw = r1.www * c28.xyz;
	r18.yzw = r18.yzw * r19.xyz;
	r1.w = dot(r9.xyz, c31.xyz);
	r5.xz = r1.ww + -c2.xw;
	r10.zw = -c2.xw + c2.yz;
	r1.w = ((r10.w == 0.0) ? FLT_MAX : 1.0 / r10.w);
	r8.w = ((r10.z == 0.0) ? FLT_MAX : 1.0 / r10.z);
	r5.x = clamp(r5.x * r8.w, 0.0, 1.0);
	r1.w = clamp(r1.w * r5.z, 0.0, 1.0);
	r5.z = (r1.w * c27.z) + c27.w;
	r1.w = r1.w * r1.w;
	r1.w = (r5.z * r1.w) + r5.w;
	r5.z = (r5.x * c27.z) + c27.w;
	r5.x = r5.x * r5.x;
	r5.x = r5.x * r5.z;
	r1.w = r1.w * r5.x;
	r5.xzw = mix(r0.yzw, r2.xyz, r1.www);
	r0.yzw = r0.yzw + c26.www;
	r0.yzw = (r11.yyy * r0.yzw) + c26.yyy;
	r1.w = dot(r5.xzw, c31.xyz);
	r2.xyz = r1.www * c102.xyz;
	r2.xyz = (r2.xyz * r0.xxx) + -r5.xzw;
	r2.xyz = (c102.www * r2.xyz) + r5.xzw;
	r0.x = clamp(c107.w + v6.w, 0.0, 1.0);
	r2.xyz = (r2.xyz * r0.xxx) + -r5.xzw;
	r19.xyz = (r14.xyz * r12.xyz) + r9.xyz;
	r9.xyz = r9.xyz + v6.xyz;
	r0.x = dot(r19.xyz, c31.xyz);
	r0.x = r0.x + c27.x;
	r0.x = clamp(r0.x * c27.y, 0.0, 1.0);
	r1.w = (r0.x * c27.z) + c27.w;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r1.w;
	r2.xyz = (r0.xxx * r2.xyz) + r5.xzw;
	r2.xyz = r11.zzz * r2.xyz;
	r0.x = -r18.x + c26.y;
	r0.x = (c109.y * r0.x) + r18.x;
	r1.w = clamp(mix(r0.x, r18.x, r8.y), 0.0, 1.0);
	r5.xzw = r1.www * r18.yzw;
	r7.w = r11.w;
	r0.x = mix(c10.x, c10.y, r11.y);
	r11 = s7_texture.sample(s7, r7.xw);
	r8.yzw = r8.zzz * r11.xyz;
	r4.w = r7.w;
	r11 = s7_texture.sample(s7, r4.zw);
	r11.xyz = r8.xxx * r11.xyz;
	r11.xyz = r13.xyz * r11.xyz;
	r8.xyz = (r8.yzw * r15.xyz) + r11.xyz;
	r11 = s7_texture.sample(s7, r4.yw);
	r4 = s7_texture.sample(s7, r4.xw);
	r4.xyz = r10.yyy * r4.xyz;
	r10.xyz = r10.xxx * r11.xyz;
	r8.xyz = (r10.xyz * r16.xyz) + r8.xyz;
	r4.xyz = (r4.xyz * r17.xyz) + r8.xyz;
	r8 = s7_texture.sample(s7, r7.yw);
	r7 = s4_texture.sample(s4, r7.zw);
	r7.xzw = r5.yyy * r8.xyz;
	r4.xyz = (r7.xzw * r5.xzw) + r4.xyz;
	r4.xyz = r3.www * r4.xyz;
	r1.w = dot(r3.xyz, r3.xyz);
	r5.xyz = r6.xyz * r1.www;
	r3.xyz = (r6.www * r3.xyz) + -r5.xyz;
	r3 = s6_texture.sample(s6, r3.xyz);
	r5.xyz = r3.xyz * c30.zzz;
	r6.xyz = r5.xyz * r5.xyz;
	r6.xyz = r6.xyz * r6.xyz;
	r1.w = dot(r6.xyz, c31.xyz);
	r3.w = r1.w + c32.w;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = ((r3.w >= 0.0) ? r1.w : c31.w);
	r3.w = dot(r5.xyz, c31.xyz);
	r6.xyz = r3.www * r6.xyz;
	r3.xyz = (c30.zzz * -r3.xyz) + r3.www;
	r3.xyz = (-c103.www * r3.xyz) + r5.xyz;
	r6.xyz = (r6.xyz * r1.www) + -r5.xyz;
	r6.xyz = (c103.www * r6.xyz) + r5.xyz;
	r3.xyz = ((c103.w >= 0.0) ? r6.xyz : r3.xyz);
	r1.w = abs(c103.w);
	r3.xyz = ((-r1.w >= 0.0) ? r5.xyz : r3.xyz);
	r5.xyz = r9.xyz + -c103.xxx;
	r5.xyz = clamp(r5.xyz * c103.yyy, float3(0.0), float3(1.0));
	r5.xyz = (r3.xyz * r5.xyz) + -r3.xyz;
	r3.xyz = (c101.xxx * r5.xyz) + r3.xyz;
	r5.xyz = (r3.xyz * r3.xyz) + -r3.xyz;
	r3.xyz = (c103.zzz * r5.xyz) + r3.xyz;
	r1.xyz = r1.xyz * r3.xyz;
	r1.xyz = (r4.xyz * r0.xxx) + r1.xyz;
	r1.xyz = r7.yyy * r1.xyz;
	r0.xyz = r0.yzw * r1.xyz;
	r0.xyz = (r2.xyz * r9.xyz) + r0.xyz;
	r0.xyz = (r14.xyz * r12.xyz) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	oC0.xyz = (r2.www * r0.xyz) + r1.xyz;
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

