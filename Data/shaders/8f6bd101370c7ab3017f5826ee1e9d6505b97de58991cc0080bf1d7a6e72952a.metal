#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[36];
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
	const float4 c26 = float4(2.0, -1.0, 0.0, 1.0); (void) c26;
	const float4 c27 = float4(0.5, 0.159154935, 6.283185478, -3.141592739); (void) c27;
	const float4 c31 = float4(0.57735002, -0.400000005, 5.0, -0.300000011); (void) c31;
	const float4 c32 = float4(0.298999992, 0.587000012, 0.114, -3.333333253); (void) c32;
	const float4 c34 = float4(-2.0, 3.0, -0.000001, 1000000.0); (void) c34;
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
	float4 r23;
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
	#define c29 uniforms.uniforms_float4[27]
	#define c30 uniforms.uniforms_float4[28]
	#define c33 uniforms.uniforms_float4[29]
	#define c101 uniforms.uniforms_float4[30]
	#define c102 uniforms.uniforms_float4[31]
	#define c105 uniforms.uniforms_float4[32]
	#define c106 uniforms.uniforms_float4[33]
	#define c107 uniforms.uniforms_float4[34]
	#define c109 uniforms.uniforms_float4[35]
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
	r1.xyz = c32.xyz;
	r1.x = dot(c102.xyz, r1.xyz);
	r1.y = r1.x + c34.z;
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.x = ((r1.y >= 0.0) ? r1.x : c34.w);
	r1.yzw = r0.zxy * c31.xxx;
	r1.yzw = (r0.zxy * c31.xxx) + -r1.wyz;
	r2 = s3_texture.sample(s3, v0.xy);
	r2.y = r2.x * c12.w;
	r2.y = (r2.y * c27.y) + c27.x;
	r2.y = fract(r2.y);
	r2.y = (r2.y * c27.z) + c27.w;
	r3.xy = float2(cos(r2.y), sin(r2.y));
	r1.yzw = r1.yzw * r3.yyy;
	r1.yzw = (r0.xyz * r3.xxx) + r1.yzw;
	r2.y = -r3.x + c26.w;
	r2.z = dot(c31.xxx, r0.xyz);
	r2.z = r2.z * c31.x;
	r3.xyz = (r2.zzz * r2.yyy) + r1.yzw;
	r1.y = abs(c12.w);
	r3.w = c26.w;
	r0.w = r2.x;
	r1.z = -r2.w + c26.w;
	r0 = ((-r1.y >= 0.0) ? r0 : r3);
	r2.xyz = r0.xyz * r0.xyz;
	r2.xyz = r2.xyz * r2.xyz;
	r1.y = dot(r2.xyz, c32.xyz);
	r1.w = r1.y + c34.z;
	r1.y = ((r1.y == 0.0) ? FLT_MAX : 1.0 / r1.y);
	r1.y = ((r1.w >= 0.0) ? r1.y : c34.w);
	r1.w = dot(r0.xyz, c32.xyz);
	r2.xyz = r1.www * r2.xyz;
	r3.xyz = mix(r0.xyz, r1.www, -c101.yyy);
	r2.xyz = (r2.xyz * r1.yyy) + -r0.xyz;
	r2.xyz = (c101.yyy * r2.xyz) + r0.xyz;
	r2.xyz = ((c101.y >= 0.0) ? r2.xyz : r3.xyz);
	r1.y = abs(c101.y);
	r2.xyz = ((-r1.y >= 0.0) ? r0.xyz : r2.xyz);
	r1.yw = -c33.xw + c33.yz;
	r1.y = ((r1.y == 0.0) ? FLT_MAX : 1.0 / r1.y);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r3.xyz = c23.xyz + -v5.xyz;
	r4.xyz = normalize(r3.xyz);
	r3.xyz = c3.xyz + -v5.xyz;
	r2.w = dot(r3.xyz, r3.xyz);
	r2.w = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r5.xyz = (r3.xyz * r2.www) + r4.xyz;
	r6.xyz = normalize(r5.xyz);
	r5 = s1_texture.sample(s1, v0.xy);
	r5.xyz = (r5.xyz * c26.xxx) + c26.yyy;
	r7.x = dot(v2.xyz, r5.xyz);
	r7.y = dot(v3.xyz, r5.xyz);
	r7.z = dot(v4.xyz, r5.xyz);
	r5.xyz = normalize(r7.xyz);
	r6.z = clamp(dot(r5.xyz, r6.xyz), 0.0, 1.0);
	r3.w = clamp(dot(r5.xyz, r4.xyz), 0.0, 1.0);
	r4.w = r3.w * r6.z;
	r7.xyz = r2.www * r3.xyz;
	r7.w = dot(r7.xyz, r5.xyz);
	r8.z = clamp(r7.w, 0.0, 1.0);
	r7.w = r7.w + r7.w;
	r9.x = -r8.z + c26.w;
	r10.x = pow(abs(r9.x), c105.x);
	r4.w = r4.w * r10.x;
	r9.x = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r3.w = (r3.w * r3.w) + r3.w;
	r3.w = r3.w * c27.x;
	r9.x = ((r9.x == 0.0) ? FLT_MAX : 1.0 / r9.x);
	r4.w = r4.w * r9.x;
	r9.yzw = c21.xyz + -v5.xyz;
	r11.xyz = normalize(r9.yzw);
	r9.yzw = (r3.xyz * r2.www) + r11.xyz;
	r12.xyz = normalize(r9.yzw);
	r8.x = clamp(dot(r5.xyz, r12.xyz), 0.0, 1.0);
	r9.y = clamp(dot(r5.xyz, r11.xyz), 0.0, 1.0);
	r9.z = r8.x * r9.y;
	r9.z = r10.x * r9.z;
	r9.w = ((r9.y == 0.0) ? FLT_MAX : rsqrt(abs(r9.y)));
	r9.y = (r9.y * r9.y) + r9.y;
	r9.y = r9.y * c27.x;
	r9.w = ((r9.w == 0.0) ? FLT_MAX : 1.0 / r9.w);
	r10.y = (r9.z * r9.w) + r4.w;
	r9.z = r9.w * r9.z;
	r12.xyz = c25.xyz + -v5.xyz;
	r13.xyz = normalize(r12.xyz);
	r12.xyz = (r3.xyz * r2.www) + r13.xyz;
	r14.xyz = normalize(r12.xyz);
	r6.y = clamp(dot(r5.xyz, r14.xyz), 0.0, 1.0);
	r10.z = clamp(dot(r5.xyz, r13.xyz), 0.0, 1.0);
	r10.w = clamp(dot(r7.xyz, r13.xyz), 0.0, 1.0);
	r11.w = r6.y * r10.z;
	r11.w = r10.x * r11.w;
	r12.x = ((r10.z == 0.0) ? FLT_MAX : rsqrt(abs(r10.z)));
	r10.z = (r10.z * r10.z) + r10.z;
	r10.z = r10.z * c27.x;
	r12.x = ((r12.x == 0.0) ? FLT_MAX : 1.0 / r12.x);
	r10.y = (r11.w * r12.x) + r10.y;
	r11.w = r11.w * r12.x;
	r13.x = c23.w + -v5.x;
	r13.y = c24.w + -v5.y;
	r13.z = c25.w + -v5.z;
	r14.xyz = normalize(r13.xyz);
	r12.yzw = (r3.xyz * r2.www) + r14.xyz;
	r13.xyz = normalize(r12.yzw);
	r6.x = clamp(dot(r5.xyz, r13.xyz), 0.0, 1.0);
	r12.y = clamp(dot(r5.xyz, r14.xyz), 0.0, 1.0);
	r12.z = clamp(dot(r7.xyz, r14.xyz), 0.0, 1.0);
	r12.w = r6.x * r12.y;
	r10.x = r10.x * r12.w;
	r12.w = ((r12.y == 0.0) ? FLT_MAX : rsqrt(abs(r12.y)));
	r12.y = (r12.y * r12.y) + r12.y;
	r12.y = r12.y * c27.x;
	r12.w = ((r12.w == 0.0) ? FLT_MAX : 1.0 / r12.w);
	r10.y = (r10.x * r12.w) + r10.y;
	r10.x = r10.x * r12.w;
	r13.xy = r10.yy + -c33.xw;
	r1.yw = clamp(r1.yw * r13.xy, float2(0.0), float2(1.0));
	r10.y = (r1.y * c34.x) + c34.y;
	r1.y = r1.y * r1.y;
	r1.y = r1.y * r10.y;
	r10.y = (r1.w * c34.x) + c34.y;
	r1.w = r1.w * r1.w;
	r1.w = r1.w * r10.y;
	r1.y = r1.w * r1.y;
	r13 = s10_texture.sample(s10, v0.xy);
	r1.w = r13.y * c101.w;
	r14.xyz = (r0.xyz * r1.www) + -c106.xyz;
	r1.w = clamp(r1.w, 0.0, 1.0);
	r14.xyz = (r1.www * r14.xyz) + c106.xyz;
	r15.xyz = c22.xyz * v1.yyy;
	r16.xyz = r4.www * r15.xyz;
	r17.xyz = c20.xyz * v1.xxx;
	r16.xyz = (r9.zzz * r17.xyz) + r16.xyz;
	r18.xyz = c24.xyz * v1.zzz;
	r16.xyz = (r11.www * r18.xyz) + r16.xyz;
	r19.x = c20.w * v1.w;
	r19.y = c21.w * v1.w;
	r19.z = c22.w * v1.w;
	r16.xyz = (r10.xxx * r19.xyz) + r16.xyz;
	r1.w = c26.w;
	r1.w = (v6.w * c11.w) + r1.w;
	r4.w = r13.x * c105.y;
	r1.w = r1.w * r4.w;
	r16.xyz = r1.www * r16.xyz;
	r20.xyz = r14.xyz * r16.xyz;
	r1.w = dot(r20.xyz, c32.xyz);
	r1.y = r1.w * r1.y;
	r1.y = r1.y * c106.w;
	r20.x = ((r5.x >= 0.0) ? c26.z : c26.w);
	r20.y = ((r5.y >= 0.0) ? c26.z : c26.w);
	r20.z = ((r5.z >= 0.0) ? c26.z : c26.w);
	r21.xyz = r5.xyz * r5.xyz;
	r20.xyz = r20.xyz * r21.xyz;
	r22.xyz = r20.xxx * c5.xyz;
	r23.x = ((r5.x >= 0.0) ? c26.w : c26.z);
	r23.y = ((r5.y >= 0.0) ? c26.w : c26.z);
	r23.z = ((r5.z >= 0.0) ? c26.w : c26.z);
	r21.xyz = r21.xyz * r23.xyz;
	r22.xyz = (r21.xxx * c4.xyz) + r22.xyz;
	r21.xyw = (r21.yyy * c6.xyz) + r22.xyz;
	r20.xyw = (r20.yyy * c7.xyz) + r21.xyw;
	r20.xyw = (r21.zzz * c8.xyz) + r20.xyw;
	r20.xyz = (r20.zzz * c9.xyz) + r20.xyw;
	r20.xyz = (r17.xyz * r9.yyy) + r20.xyz;
	r20.xyz = (r15.xyz * r3.www) + r20.xyz;
	r10.xyz = (r18.xyz * r10.zzz) + r20.xyz;
	r10.xyz = (r19.xyz * r12.yyy) + r10.xyz;
	r20 = (v5.xyzx * c26.wwwz) + c26.zzzw;
	r1.w = dot(r20, c18);
	r3.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r21.x = dot(r20, c15);
	r21.y = dot(r20, c16);
	r21.z = dot(r20, c17);
	r20.xyz = r3.www * r21.xyz;
	r21 = s8_texture.sample(s8, r20.xy);
	r21.xyz = ((-r1.w >= 0.0) ? c26.zzz : r21.xyz);
	r22.xyz = r21.xyz * c28.xyz;
	r20.w = c26.w;
	r20 = float4(s11_texture.sample_compare(s11, (r20.xyz).xy, (r20.xyz).z));
	r1.w = clamp(r20.x, 0.0, 1.0);
	r3.w = -r1.w + c26.w;
	r1.w = (c109.y * r3.w) + r1.w;
	r23.x = c26.w;
	r20.yzw = c14.xyz + -v5.xyz;
	r3.w = dot(r20.yzw, r20.yzw);
	r23.z = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r23.y = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r3.w = clamp(dot(c13.xyz, r23.xyz), 0.0, 1.0);
	r4.w = clamp(mix(r1.w, r20.x, r3.w), 0.0, 1.0);
	r22.xyz = r4.www * r22.xyz;
	r20.yzw = r20.yzw * r23.yyy;
	r1.w = ((r23.y == 0.0) ? FLT_MAX : 1.0 / r23.y);
	r1.w = r1.w + -c13.w;
	r4.w = dot(r20.yzw, r5.xyz);
	r3.xyz = (r3.xyz * r2.www) + r20.yzw;
	r2.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r2.w = clamp((r2.w * c19.w) + c19.x, 0.0, 1.0);
	r9.y = min(r2.w, c19.z);
	r2.w = r9.y * r9.y;
	r23.xyz = normalize(r3.xyz);
	r8.y = clamp(dot(r5.xyz, r23.xyz), 0.0, 1.0);
	r3.x = clamp(r4.w + c28.w, 0.0, 1.0);
	r4.w = clamp(r4.w, 0.0, 1.0);
	r3.y = ((r4.w == 0.0) ? FLT_MAX : rsqrt(abs(r4.w)));
	r3.y = ((r3.y == 0.0) ? FLT_MAX : 1.0 / r3.y);
	r3.x = r3.x * r3.w;
	r20.yzw = r22.xyz * r3.xxx;
	r9.y = c31.y;
	r3.x = r9.y * c13.w;
	r3.x = ((r3.x == 0.0) ? FLT_MAX : 1.0 / r3.x);
	r1.w = clamp(r1.w * r3.x, 0.0, 1.0);
	r10.xyz = (r20.yzw * r1.www) + r10.xyz;
	r1.w = r1.w * r3.w;
	r20.yzw = r1.www * c28.xyz;
	r20.yzw = r20.yzw * r21.xyz;
	r1.w = dot(r10.xyz, c32.xyz);
	r3.xz = r1.ww + -c2.xw;
	r9.yz = -c2.xw + c2.yz;
	r1.w = ((r9.z == 0.0) ? FLT_MAX : 1.0 / r9.z);
	r4.w = ((r9.y == 0.0) ? FLT_MAX : 1.0 / r9.y);
	r3.x = clamp(r3.x * r4.w, 0.0, 1.0);
	r1.w = clamp(r1.w * r3.z, 0.0, 1.0);
	r3.z = (r1.w * c34.x) + c34.y;
	r1.w = r1.w * r1.w;
	r1.y = (r3.z * r1.w) + r1.y;
	r1.w = (r3.x * c34.x) + c34.y;
	r3.x = r3.x * r3.x;
	r1.w = r1.w * r3.x;
	r1.y = r1.y * r1.w;
	r0.w = r0.w * r1.y;
	r21.xyz = mix(r0.xyz, r2.xyz, r0.www);
	r0.xyz = r0.xyz + c26.yyy;
	r0.xyz = (r13.yyy * r0.xyz) + c26.www;
	r0.w = dot(r21.xyz, c32.xyz);
	r2.xyz = r0.www * c102.xyz;
	r1.xyw = (r2.xyz * r1.xxx) + -r21.xyz;
	r1.xyw = (c102.www * r1.xyw) + r21.xyz;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r1.xyw = (r1.xyw * r0.www) + -r21.xyz;
	r2.xyz = (r16.xyz * r14.xyz) + r10.xyz;
	r10.xyz = r10.xyz + v6.xyz;
	r0.w = dot(r2.xyz, c32.xyz);
	r0.w = r0.w + c31.w;
	r0.w = clamp(r0.w * c32.w, 0.0, 1.0);
	r2.x = (r0.w * c34.x) + c34.y;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r2.x;
	r1.xyw = (r0.www * r1.xyw) + r21.xyz;
	r1.xyw = r13.zzz * r1.xyw;
	r8.w = r13.w;
	r21 = s7_texture.sample(s7, r8.xw);
	r0.w = clamp(dot(r7.xyz, r11.xyz), 0.0, 1.0);
	r2.x = clamp(r11.z, 0.0, 1.0);
	r2.x = (r2.x * r2.x) + r2.x;
	r2.x = r2.x * c27.x;
	r2.xyz = r2.xxx * r17.xyz;
	r3.x = r8.z * r8.z;
	r11 = s4_texture.sample(s4, r8.zw);
	r22.w = r3.x * r3.x;
	r3.x = r1.z * r22.w;
	r23.xyz = r3.xxx * v6.xyz;
	r22.xyz = r23.xyz * c31.zzz;
	r22 = ((-r1.z >= 0.0) ? c26.zzzz : r22);
	r0.w = r0.w * r22.w;
	r23.xyz = (r0.www * c31.zzz) + -r21.xyz;
	r23.xyz = (r1.zzz * r23.xyz) + r21.xyz;
	r21.xyz = ((-r1.z >= 0.0) ? r21.xyz : r23.xyz);
	r9.yzw = r9.www * r21.xyz;
	r9.yzw = (r9.yzw * r17.xyz) + r22.xyz;
	r0.w = clamp(dot(r7.xyz, r4.xyz), 0.0, 1.0);
	r0.w = r0.w * r22.w;
	r6.w = r8.w;
	r4 = s7_texture.sample(s7, r8.yw);
	r3.xyz = r3.yyy * r4.xyz;
	r4 = s7_texture.sample(s7, r6.zw);
	r8.xyz = (r0.www * c31.zzz) + -r4.xyz;
	r8.xyz = (r1.zzz * r8.xyz) + r4.xyz;
	r4.xyz = ((-r1.z >= 0.0) ? r4.xyz : r8.xyz);
	r4.xyz = r9.xxx * r4.xyz;
	r4.xyz = (r4.xyz * r15.xyz) + r9.yzw;
	r0.w = r10.w * r22.w;
	r4.w = r12.z * r22.w;
	r8 = s7_texture.sample(s7, r6.yw);
	r6 = s7_texture.sample(s7, r6.xw);
	r9.xyz = (r0.www * c31.zzz) + -r8.xyz;
	r9.xyz = (r1.zzz * r9.xyz) + r8.xyz;
	r8.xyz = ((-r1.z >= 0.0) ? r8.xyz : r9.xyz);
	r8.xyz = r12.xxx * r8.xyz;
	r4.xyz = (r8.xyz * r18.xyz) + r4.xyz;
	r8.xyz = (r4.www * c31.zzz) + -r6.xyz;
	r8.xyz = (r1.zzz * r8.xyz) + r6.xyz;
	r6.xyz = ((-r1.z >= 0.0) ? r6.xyz : r8.xyz);
	r0.w = mix(r11.y, c26.w, r1.z);
	r1.z = r13.x * r11.z;
	r4.w = mix(c10.x, c10.y, r13.y);
	r1.z = r1.z * c0.w;
	r6.xyz = r12.www * r6.xyz;
	r4.xyz = (r6.xyz * r19.xyz) + r4.xyz;
	r6.x = -r20.x + c26.w;
	r6.x = (c109.y * r6.x) + r20.x;
	r8.x = clamp(mix(r6.x, r20.x, r3.w), 0.0, 1.0);
	r6.xyz = r8.xxx * r20.yzw;
	r3.xyz = (r3.xyz * r6.xyz) + r4.xyz;
	r3.xyz = r5.www * r3.xyz;
	r3.xyz = r4.www * r3.xyz;
	r3.w = dot(r5.xyz, r5.xyz);
	r4.xyz = r7.xyz * r3.www;
	r4.xyz = (r7.www * r5.xyz) + -r4.xyz;
	r3.w = clamp(dot(r5.xyz, v9.xyz), 0.0, 1.0);
	r5.x = ((r4.x >= 0.0) ? c26.z : c26.w);
	r5.y = ((r4.y >= 0.0) ? c26.z : c26.w);
	r5.z = ((r4.z >= 0.0) ? c26.z : c26.w);
	r6.xyz = r4.xyz * r4.xyz;
	r4.x = ((r4.x >= 0.0) ? c26.w : c26.z);
	r4.y = ((r4.y >= 0.0) ? c26.w : c26.z);
	r4.z = ((r4.z >= 0.0) ? c26.w : c26.z);
	r4.xyz = r6.xyz * r4.xyz;
	r5.xyz = r5.xyz * r6.xyz;
	r6.xyz = r5.xxx * c5.xyz;
	r6.xyz = (r4.xxx * c4.xyz) + r6.xyz;
	r4.xyw = (r4.yyy * c6.xyz) + r6.xyz;
	r4.xyw = (r5.yyy * c7.xyz) + r4.xyw;
	r4.xyz = (r4.zzz * c8.xyz) + r4.xyw;
	r4.xyz = (r5.zzz * c9.xyz) + r4.xyz;
	r2.xyz = r2.xyz * r4.xyz;
	r4.x = v7.w;
	r4.y = v8.w;
	r4.z = v9.w;
	r4.xyz = -r4.xyz + c21.xyz;
	r5.xyz = normalize(r4.xyz);
	r4.x = clamp(dot(-v9.xyz, r5.xyz), 0.0, 1.0);
	r4.x = (r4.x * r4.x) + r4.x;
	r4.x = r4.x * c27.x;
	r4.xyz = r4.xxx * r17.xyz;
	r5.xyz = c0.xyz * v6.xyz;
	r4.xyz = (r5.xyz * r4.xyz) + -r2.xyz;
	r2.xyz = (r3.www * r4.xyz) + r2.xyz;
	r2.xyz = r1.zzz * r2.xyz;
	r2.xyz = (r3.xyz * r0.www) + r2.xyz;
	r0.xyz = r0.xyz * r2.xyz;
	r0.xyz = (r1.xyw * r10.xyz) + r0.xyz;
	r0.xyz = (r16.xyz * r14.xyz) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	oC0.xyz = (r2.www * r0.xyz) + r1.xyz;
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

