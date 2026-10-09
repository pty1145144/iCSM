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
	const float4 c19 = float4(2.0, -1.0, 0.0, 1.0); (void) c19;
	const float4 c26 = float4(0.5, 0.159154935, 6.283185478, -3.141592739); (void) c26;
	const float4 c27 = float4(5.0, 0.298999992, 0.587000012, 0.114); (void) c27;
	const float4 c29 = float4(-0.300000011, -3.333333253, -2.0, 3.0); (void) c29;
	const float4 c31 = float4(-0.000001, 1000000.0, 0.0, 0.0); (void) c31;
	const float4 c32 = float4(0.57735002, -0.400000005, 0.499999584, 0.5); (void) c32;
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
	r1 = (v5.xyzx * c19.wwwz) + c19.zzzw;
	r2.x = dot(r1, c18);
	r2.y = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r3.x = dot(r1, c15);
	r3.y = dot(r1, c16);
	r3.z = dot(r1, c17);
	r1.xyz = r2.yyy * r3.xyz;
	r3 = s8_texture.sample(s8, r1.xy);
	r2.xyz = ((-r2.x >= 0.0) ? c19.zzz : r3.xyz);
	r3.y = c32.y;
	r2.w = r3.y * c13.w;
	r2.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r3.xyz = c14.xyz + -v5.xyz;
	r3.w = dot(r3.xyz, r3.xyz);
	r4.y = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r4.z = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r3.w = ((r4.y == 0.0) ? FLT_MAX : 1.0 / r4.y);
	r3.w = r3.w + -c13.w;
	r2.w = clamp(r2.w * r3.w, 0.0, 1.0);
	r4.x = c19.w;
	r3.w = clamp(dot(c13.xyz, r4.xyz), 0.0, 1.0);
	r3.xyz = r3.xyz * r4.yyy;
	r4.x = r2.w * r3.w;
	r4.xyz = r4.xxx * c28.xyz;
	r4.xyz = r2.xyz * r4.xyz;
	r2.xyz = r2.xyz * c28.xyz;
	r1.w = c19.w;
	r1 = float4(s11_texture.sample_compare(s11, (r1.xyz).xy, (r1.xyz).z));
	r1.y = -r1.x + c19.w;
	r1.y = (c109.y * r1.y) + r1.x;
	r4.w = clamp(mix(r1.y, r1.x, r3.w), 0.0, 1.0);
	r1.yzw = r4.www * r4.xyz;
	r4.xyz = c23.xyz + -v5.xyz;
	r5.xyz = normalize(r4.xyz);
	r4 = s3_texture.sample(s3, v0.xy);
	r4.z = (r4.y * c32.z) + c32.w;
	r4.z = fract(r4.z);
	r4.z = (r4.z * c26.z) + c26.w;
	r6.xy = float2(cos(r4.z), sin(r4.z));
	r7 = s1_texture.sample(s1, v0.xy);
	r7.xyz = (r7.xyz * c19.xxx) + c19.yyy;
	r8.x = dot(v2.xyz, r7.xyz);
	r8.y = dot(v3.xyz, r7.xyz);
	r8.z = dot(v4.xyz, r7.xyz);
	r7.xyz = normalize(r8.xyz);
	r8.xyz = r7.zxy * v8.yzx;
	r8.xyz = (r7.yzx * v8.zxy) + -r8.xyz;
	r9.xyz = normalize(r8.xyz);
	r8.xyz = r7.zxy * r9.yzx;
	r8.xyz = (r7.yzx * r9.zxy) + -r8.xyz;
	r6.xzw = r6.xxx * r9.xyz;
	r9.xyz = normalize(r8.xyz);
	r6.xyz = (r6.yyy * r9.xyz) + r6.xzw;
	r8.xyz = normalize(r6.xyz);
	r4.z = dot(r5.xyz, r8.xxx);
	r5.w = (r4.z * -r4.z) + c19.w;
	r5.w = ((r5.w == 0.0) ? FLT_MAX : rsqrt(abs(r5.w)));
	r5.w = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r6.xyz = c3.xyz + -v5.xyz;
	r6.w = dot(r6.xyz, r6.xyz);
	r6.w = ((r6.w == 0.0) ? FLT_MAX : rsqrt(abs(r6.w)));
	r9.xyz = r6.www * r6.xyz;
	r8.w = dot(r9.xyz, r8.xyz);
	r9.w = (r8.w * -r8.w) + c19.w;
	r9.w = ((r9.w == 0.0) ? FLT_MAX : rsqrt(abs(r9.w)));
	r9.w = ((r9.w == 0.0) ? FLT_MAX : 1.0 / r9.w);
	r5.w = r5.w * r9.w;
	r4.z = clamp((r8.w * r4.z) + r5.w, 0.0, 1.0);
	r10.xyz = (r6.xyz * r6.www) + r5.xyz;
	r11.xyz = normalize(r10.xyz);
	r5.w = clamp(dot(r7.xyz, r11.xyz), 0.0, 1.0);
	r10.zw = c19.zw;
	r4.y = ((-r4.y >= 0.0) ? r10.z : c10.w);
	r11.z = mix(r5.w, r4.z, r4.y);
	r12 = s10_texture.sample(s10, v0.xy);
	r13.w = r12.w;
	r11.w = r13.w;
	r14 = s7_texture.sample(s7, r11.zw);
	r4.z = clamp(dot(r9.xyz, r5.xyz), 0.0, 1.0);
	r5.x = clamp(dot(r7.xyz, r5.xyz), 0.0, 1.0);
	r13.z = clamp(dot(r9.xyz, r7.xyz), 0.0, 1.0);
	r5.y = r13.z * r13.z;
	r15.w = r5.y * r5.y;
	r4.w = -r4.w + c19.w;
	r5.y = r15.w * r4.w;
	r5.yzw = r5.yyy * v6.xyz;
	r15.xyz = r5.yzw * c27.xxx;
	r15 = ((-r4.w >= 0.0) ? c19.zzzz : r15);
	r4.z = r4.z * r15.w;
	r5.yzw = (r4.zzz * c27.xxx) + -r14.xyz;
	r5.yzw = (r4.www * r5.yzw) + r14.xyz;
	r5.yzw = ((-r4.w >= 0.0) ? r14.xyz : r5.yzw);
	r4.z = ((r5.x == 0.0) ? FLT_MAX : rsqrt(abs(r5.x)));
	r4.z = ((r4.z == 0.0) ? FLT_MAX : 1.0 / r4.z);
	r5.yzw = r4.zzz * r5.yzw;
	r10.xyz = c21.xyz + -v5.xyz;
	r14.xyz = normalize(r10.xyz);
	r10.x = dot(r14.xyz, r8.xxx);
	r10.y = (r10.x * -r10.x) + c19.w;
	r10.y = ((r10.y == 0.0) ? FLT_MAX : rsqrt(abs(r10.y)));
	r10.y = ((r10.y == 0.0) ? FLT_MAX : 1.0 / r10.y);
	r10.y = r9.w * r10.y;
	r10.x = clamp((r8.w * r10.x) + r10.y, 0.0, 1.0);
	r16.xyz = (r6.xyz * r6.www) + r14.xyz;
	r17.xyz = normalize(r16.xyz);
	r10.y = clamp(dot(r7.xyz, r17.xyz), 0.0, 1.0);
	r13.x = mix(r10.y, r10.x, r4.y);
	r16 = s7_texture.sample(s7, r13.xw);
	r10.x = clamp(dot(r9.xyz, r14.xyz), 0.0, 1.0);
	r10.x = r10.x * r15.w;
	r10.xyz = (r10.xxx * c27.xxx) + -r16.xyz;
	r10.xyz = (r4.www * r10.xyz) + r16.xyz;
	r10.xyz = ((-r4.w >= 0.0) ? r16.xyz : r10.xyz);
	r12.w = clamp(dot(r7.xyz, r14.xyz), 0.0, 1.0);
	r14.x = clamp(r14.z, 0.0, 1.0);
	r14.x = (r14.x * r14.x) + r14.x;
	r14.x = r14.x * c26.x;
	r14.y = ((r12.w == 0.0) ? FLT_MAX : rsqrt(abs(r12.w)));
	r14.y = ((r14.y == 0.0) ? FLT_MAX : 1.0 / r14.y);
	r10.xyz = r10.xyz * r14.yyy;
	r16.xyz = c20.xyz * v1.xxx;
	r10.xyz = (r10.xyz * r16.xyz) + r15.xyz;
	r15.xyz = c22.xyz * v1.yyy;
	r5.yzw = (r5.yzw * r15.xyz) + r10.xyz;
	r10.xyz = c25.xyz + -v5.xyz;
	r17.xyz = normalize(r10.xyz);
	r10.x = dot(r17.xyz, r8.xxx);
	r10.y = (r10.x * -r10.x) + c19.w;
	r10.y = ((r10.y == 0.0) ? FLT_MAX : rsqrt(abs(r10.y)));
	r10.y = ((r10.y == 0.0) ? FLT_MAX : 1.0 / r10.y);
	r10.y = r9.w * r10.y;
	r10.x = clamp((r8.w * r10.x) + r10.y, 0.0, 1.0);
	r18.xyz = (r6.xyz * r6.www) + r17.xyz;
	r19.xyz = normalize(r18.xyz);
	r10.y = clamp(dot(r7.xyz, r19.xyz), 0.0, 1.0);
	r11.y = mix(r10.y, r10.x, r4.y);
	r18 = s7_texture.sample(s7, r11.yw);
	r10.x = clamp(dot(r9.xyz, r17.xyz), 0.0, 1.0);
	r10.y = clamp(dot(r7.xyz, r17.xyz), 0.0, 1.0);
	r10.x = r10.x * r15.w;
	r17.xyz = (r10.xxx * c27.xxx) + -r18.xyz;
	r17.xyz = (r4.www * r17.xyz) + r18.xyz;
	r17.xyz = ((-r4.w >= 0.0) ? r18.xyz : r17.xyz);
	r10.x = ((r10.y == 0.0) ? FLT_MAX : rsqrt(abs(r10.y)));
	r10.x = ((r10.x == 0.0) ? FLT_MAX : 1.0 / r10.x);
	r17.xyz = r10.xxx * r17.xyz;
	r18.xyz = c24.xyz * v1.zzz;
	r5.yzw = (r17.xyz * r18.xyz) + r5.yzw;
	r17.x = c23.w + -v5.x;
	r17.y = c24.w + -v5.y;
	r17.z = c25.w + -v5.z;
	r19.xyz = normalize(r17.xyz);
	r10.z = dot(r19.xyz, r8.xxx);
	r14.z = (r10.z * -r10.z) + c19.w;
	r14.z = ((r14.z == 0.0) ? FLT_MAX : rsqrt(abs(r14.z)));
	r14.z = ((r14.z == 0.0) ? FLT_MAX : 1.0 / r14.z);
	r9.w = r9.w * r14.z;
	r8.w = clamp((r8.w * r10.z) + r9.w, 0.0, 1.0);
	r17.xyz = (r6.xyz * r6.www) + r19.xyz;
	r6.xyz = (r6.xyz * r6.www) + r3.xyz;
	r3.x = dot(r3.xyz, r7.xyz);
	r20.xyz = normalize(r6.xyz);
	r3.y = clamp(dot(r7.xyz, r20.xyz), 0.0, 1.0);
	r13.y = mix(r3.y, c19.w, r4.y);
	r6 = s7_texture.sample(s7, r13.yw);
	r20 = s4_texture.sample(s4, r13.zw);
	r3.y = -r13.z + c19.w;
	r6.w = pow(abs(r3.y), c105.x);
	r21.xyz = normalize(r17.xyz);
	r3.y = clamp(dot(r7.xyz, r21.xyz), 0.0, 1.0);
	r11.x = mix(r3.y, r8.w, r4.y);
	r17 = s7_texture.sample(s7, r11.xw);
	r3.y = clamp(dot(r9.xyz, r19.xyz), 0.0, 1.0);
	r3.z = clamp(dot(r7.xyz, r19.xyz), 0.0, 1.0);
	r3.y = r3.y * r15.w;
	r13.yzw = (r3.yyy * c27.xxx) + -r17.xyz;
	r13.yzw = (r4.www * r13.yzw) + r17.xyz;
	r13.yzw = ((-r4.w >= 0.0) ? r17.xyz : r13.yzw);
	r3.y = mix(r20.y, c19.w, r4.w);
	r4.w = r12.x * r20.z;
	r4.w = r4.w * c0.w;
	r8.w = ((r3.z == 0.0) ? FLT_MAX : rsqrt(abs(r3.z)));
	r8.w = ((r8.w == 0.0) ? FLT_MAX : 1.0 / r8.w);
	r13.yzw = r8.www * r13.yzw;
	r17.x = c20.w * v1.w;
	r17.y = c21.w * v1.w;
	r17.z = c22.w * v1.w;
	r5.yzw = (r13.yzw * r17.xyz) + r5.yzw;
	r9.w = clamp(r3.x, 0.0, 1.0);
	r3.x = clamp(r3.x + c28.w, 0.0, 1.0);
	r3.x = r3.x * r3.w;
	r9.w = ((r9.w == 0.0) ? FLT_MAX : rsqrt(abs(r9.w)));
	r9.w = ((r9.w == 0.0) ? FLT_MAX : 1.0 / r9.w);
	r6.xyz = r6.xyz * r9.www;
	r1.yzw = (r6.xyz * r1.yzw) + r5.yzw;
	r1.yzw = r7.www * r1.yzw;
	r5.y = mix(c10.x, c10.y, r12.y);
	r1.yzw = r1.yzw * r5.yyy;
	r5.yzw = r7.xyz * r8.yzx;
	r5.yzw = (r8.xyz * r7.yzx) + -r5.yzw;
	r6.xyz = r8.yzx * r5.yzw;
	r5.yzw = (r5.wyz * r8.zxy) + -r6.xyz;
	r6.x = dot(r5.yzw, r5.yzw);
	r6.x = ((r6.x == 0.0) ? FLT_MAX : rsqrt(abs(r6.x)));
	r5.yzw = (r5.yzw * r6.xxx) + -r9.xyz;
	r5.yzw = (r4.yyy * r5.yzw) + r9.xyz;
	r4.y = dot(r7.xyz, r5.yzw);
	r4.y = r4.y + r4.y;
	r6.x = dot(r7.xyz, r7.xyz);
	r5.yzw = r5.yzw * r6.xxx;
	r5.yzw = (r4.yyy * r7.xyz) + -r5.yzw;
	r6.x = ((r5.y >= 0.0) ? c19.w : c19.z);
	r6.y = ((r5.z >= 0.0) ? c19.w : c19.z);
	r6.z = ((r5.w >= 0.0) ? c19.w : c19.z);
	r8.xyz = r5.yzw * r5.yzw;
	r5.y = ((r5.y >= 0.0) ? c19.z : c19.w);
	r5.z = ((r5.z >= 0.0) ? c19.z : c19.w);
	r5.w = ((r5.w >= 0.0) ? c19.z : c19.w);
	r5.yzw = r8.xyz * r5.yzw;
	r6.xyz = r6.xyz * r8.xyz;
	r8.xyz = r5.yyy * c5.xyz;
	r8.xyz = (r6.xxx * c4.xyz) + r8.xyz;
	r8.xyz = (r6.yyy * c6.xyz) + r8.xyz;
	r8.xyz = (r5.zzz * c7.xyz) + r8.xyz;
	r6.xyz = (r6.zzz * c8.xyz) + r8.xyz;
	r5.yzw = (r5.www * c9.xyz) + r6.xyz;
	r6.xyz = r14.xxx * r16.xyz;
	r5.yzw = r5.yzw * r6.xyz;
	r6.x = v7.w;
	r6.y = v8.w;
	r6.z = v9.w;
	r6.xyz = -r6.xyz + c21.xyz;
	r8.xyz = normalize(r6.xyz);
	r4.y = clamp(dot(-v9.xyz, r8.xyz), 0.0, 1.0);
	r4.y = (r4.y * r4.y) + r4.y;
	r4.y = r4.y * c26.x;
	r6.xyz = r4.yyy * r16.xyz;
	r8.xyz = c0.xyz * v6.xyz;
	r6.xyz = (r8.xyz * r6.xyz) + -r5.yzw;
	r4.y = clamp(dot(r7.xyz, v9.xyz), 0.0, 1.0);
	r5.yzw = (r4.yyy * r6.xyz) + r5.yzw;
	r5.yzw = r4.www * r5.yzw;
	r1.yzw = (r1.yzw * r3.yyy) + r5.yzw;
	r3.y = r4.x * c12.w;
	r0.w = r4.x;
	r3.y = (r3.y * c26.y) + c26.x;
	r3.y = fract(r3.y);
	r3.y = (r3.y * c26.z) + c26.w;
	r9.xy = float2(cos(r3.y), sin(r3.y));
	r4.xyw = r0.zxy * c32.xxx;
	r4.xyw = (r0.zxy * c32.xxx) + -r4.wxy;
	r4.xyw = r9.yyy * r4.xyw;
	r4.xyw = (r0.xyz * r9.xxx) + r4.xyw;
	r3.y = -r9.x + c19.w;
	r5.y = dot(c32.xxx, r0.xyz);
	r5.y = r5.y * c32.x;
	r9.xyz = (r5.yyy * r3.yyy) + r4.xyw;
	r3.y = abs(c12.w);
	r9.w = c19.w;
	r0 = ((-r3.y >= 0.0) ? r0 : r9);
	r4.xyw = r0.xyz + c19.yyy;
	r4.xyw = (r12.yyy * r4.xyw) + c19.www;
	r1.yzw = r1.yzw * r4.xyw;
	r4.x = ((r7.x >= 0.0) ? c19.z : c19.w);
	r4.y = ((r7.y >= 0.0) ? c19.z : c19.w);
	r4.w = ((r7.z >= 0.0) ? c19.z : c19.w);
	r5.yzw = r7.xyz * r7.xyz;
	r6.x = ((r7.x >= 0.0) ? c19.w : c19.z);
	r6.y = ((r7.y >= 0.0) ? c19.w : c19.z);
	r6.z = ((r7.z >= 0.0) ? c19.w : c19.z);
	r6.xyz = r5.yzw * r6.xyz;
	r4.xyw = r4.xyw * r5.yzw;
	r5.yzw = r4.xxx * c5.xyz;
	r5.yzw = (r6.xxx * c4.xyz) + r5.yzw;
	r5.yzw = (r6.yyy * c6.xyz) + r5.yzw;
	r5.yzw = (r4.yyy * c7.xyz) + r5.yzw;
	r5.yzw = (r6.zzz * c8.xyz) + r5.yzw;
	r4.xyw = (r4.www * c9.xyz) + r5.yzw;
	r3.y = (r12.w * r12.w) + r12.w;
	r5.y = r12.w * r13.x;
	r3.y = r3.y * c26.x;
	r4.xyw = (r16.xyz * r3.yyy) + r4.xyw;
	r3.y = (r5.x * r5.x) + r5.x;
	r5.x = r5.x * r11.z;
	r5.xy = r6.ww * r5.xy;
	r4.z = r4.z * r5.x;
	r3.y = r3.y * c26.x;
	r4.xyw = (r15.xyz * r3.yyy) + r4.xyw;
	r5.xzw = r15.xyz * r4.zzz;
	r3.y = (r5.y * r14.y) + r4.z;
	r4.z = r14.y * r5.y;
	r5.xyz = (r4.zzz * r16.xyz) + r5.xzw;
	r4.z = (r10.y * r10.y) + r10.y;
	r5.w = r10.y * r11.y;
	r5.w = r6.w * r5.w;
	r4.z = r4.z * c26.x;
	r4.xyz = (r18.xyz * r4.zzz) + r4.xyw;
	r4.w = (r3.z * r3.z) + r3.z;
	r3.z = r3.z * r11.x;
	r3.z = r6.w * r3.z;
	r4.w = r4.w * c26.x;
	r4.xyz = (r17.xyz * r4.www) + r4.xyz;
	r4.w = clamp(r1.x, 0.0, 1.0);
	r6.x = -r4.w + c19.w;
	r4.w = (c109.y * r6.x) + r4.w;
	r6.x = clamp(mix(r4.w, r1.x, r3.w), 0.0, 1.0);
	r2.xyz = r2.xyz * r6.xxx;
	r2.xyz = r2.xyz * r3.xxx;
	r2.xyz = (r2.xyz * r2.www) + r4.xyz;
	r1.x = dot(r2.xyz, c27.yzw);
	r3.xw = r1.xx + -c2.xw;
	r4.xy = -c2.xw + c2.yz;
	r1.x = ((r4.y == 0.0) ? FLT_MAX : 1.0 / r4.y);
	r2.w = ((r4.x == 0.0) ? FLT_MAX : 1.0 / r4.x);
	r2.w = clamp(r2.w * r3.x, 0.0, 1.0);
	r1.x = clamp(r1.x * r3.w, 0.0, 1.0);
	r3.x = (r1.x * c29.z) + c29.w;
	r1.x = r1.x * r1.x;
	r3.y = (r5.w * r10.x) + r3.y;
	r3.w = r10.x * r5.w;
	r4.xyz = (r3.www * r18.xyz) + r5.xyz;
	r3.y = (r3.z * r8.w) + r3.y;
	r3.z = r8.w * r3.z;
	r4.xyz = (r3.zzz * r17.xyz) + r4.xyz;
	r3.yz = r3.yy + -c33.xw;
	r5.xy = -c33.xw + c33.yz;
	r3.w = ((r5.x == 0.0) ? FLT_MAX : 1.0 / r5.x);
	r4.w = ((r5.y == 0.0) ? FLT_MAX : 1.0 / r5.y);
	r3.z = clamp(r3.z * r4.w, 0.0, 1.0);
	r3.y = clamp(r3.w * r3.y, 0.0, 1.0);
	r3.w = (r3.y * c29.z) + c29.w;
	r3.y = r3.y * r3.y;
	r3.y = r3.y * r3.w;
	r3.w = (r3.z * c29.z) + c29.w;
	r3.z = r3.z * r3.z;
	r3.z = r3.z * r3.w;
	r3.y = r3.z * r3.y;
	r3.z = (v6.w * c11.w) + r10.w;
	r3.w = r12.x * c105.y;
	r3.z = r3.z * r3.w;
	r4.xyz = r3.zzz * r4.xyz;
	r3.z = r12.y * c101.w;
	r5.xyz = (r0.xyz * r3.zzz) + -c106.xyz;
	r3.z = clamp(r3.z, 0.0, 1.0);
	r5.xyz = (r3.zzz * r5.xyz) + c106.xyz;
	r6.xyz = r4.xyz * r5.xyz;
	r3.z = dot(r6.xyz, c27.yzw);
	r3.y = r3.z * r3.y;
	r3.y = r3.y * c106.w;
	r1.x = (r3.x * r1.x) + r3.y;
	r3.x = (r2.w * c29.z) + c29.w;
	r2.w = r2.w * r2.w;
	r2.w = r2.w * r3.x;
	r1.x = r1.x * r2.w;
	r0.w = r0.w * r1.x;
	r3.xyz = r0.xyz * r0.xyz;
	r3.xyz = r3.xyz * r3.xyz;
	r1.x = dot(r0.xyz, c27.yzw);
	r6.xyz = r1.xxx * r3.xyz;
	r2.w = dot(r3.xyz, c27.yzw);
	r3.xyz = mix(r0.xyz, r1.xxx, -c101.yyy);
	r1.x = r2.w + c31.x;
	r2.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r1.x = ((r1.x >= 0.0) ? r2.w : c31.y);
	r6.xyz = (r6.xyz * r1.xxx) + -r0.xyz;
	r6.xyz = (c101.yyy * r6.xyz) + r0.xyz;
	r3.xyz = ((c101.y >= 0.0) ? r6.xyz : r3.xyz);
	r1.x = abs(c101.y);
	r3.xyz = ((-r1.x >= 0.0) ? r0.xyz : r3.xyz);
	r6.xyz = mix(r0.xyz, r3.xyz, r0.www);
	r0.x = dot(r6.xyz, c27.yzw);
	r0.xyz = r0.xxx * c102.xyz;
	r3.yzw = c27.yzw;
	r0.w = dot(c102.xyz, r3.yzw);
	r1.x = r0.w + c31.x;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r1.x >= 0.0) ? r0.w : c31.y);
	r0.xyz = (r0.xyz * r0.www) + -r6.xyz;
	r0.xyz = (c102.www * r0.xyz) + r6.xyz;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r0.xyz = (r0.xyz * r0.www) + -r6.xyz;
	r3.xyz = (r4.xyz * r5.xyz) + r2.xyz;
	r2.xyz = r2.xyz + v6.xyz;
	r0.w = dot(r3.xyz, c27.yzw);
	r0.w = r0.w + c29.x;
	r0.w = clamp(r0.w * c29.y, 0.0, 1.0);
	r1.x = (r0.w * c29.z) + c29.w;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.x;
	r0.xyz = (r0.www * r0.xyz) + r6.xyz;
	r0.xyz = r12.zzz * r0.xyz;
	r0.xyz = (r0.xyz * r2.xyz) + r1.yzw;
	r0.xyz = (r4.xyz * r5.xyz) + r0.xyz;
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

