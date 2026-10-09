#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[27];
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
	texture2d<float> s10_texture [[texture(10)]],
	sampler s10 [[sampler(10)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c13 = float4(2.0, -1.0, 0.0, 1.0); (void) c13;
	const float4 c14 = float4(0.5, 0.159154935, 6.283185478, -3.141592739); (void) c14;
	const float4 c15 = float4(0.57735002, 0.499999584, 0.5, 5.0); (void) c15;
	const float4 c16 = float4(0.298999992, 0.587000012, 0.114, -0.300000011); (void) c16;
	const float4 c17 = float4(-3.333333253, -2.0, 3.0, -0.000001); (void) c17;
	const float4 c18 = float4(1000000.0, 0.0, 0.0, 0.0); (void) c18;
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
	#define c19 uniforms.uniforms_float4[13]
	#define c20 uniforms.uniforms_float4[14]
	#define c21 uniforms.uniforms_float4[15]
	#define c22 uniforms.uniforms_float4[16]
	#define c23 uniforms.uniforms_float4[17]
	#define c24 uniforms.uniforms_float4[18]
	#define c25 uniforms.uniforms_float4[19]
	#define c30 uniforms.uniforms_float4[20]
	#define c33 uniforms.uniforms_float4[21]
	#define c101 uniforms.uniforms_float4[22]
	#define c102 uniforms.uniforms_float4[23]
	#define c105 uniforms.uniforms_float4[24]
	#define c106 uniforms.uniforms_float4[25]
	#define c107 uniforms.uniforms_float4[26]
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
	r0.x = r0.x + -c13.x;
	oC0.w = clamp(r0.x * c19.w, 0.0, 1.0);
	r0.xyz = c16.xyz;
	r0.x = dot(c102.xyz, r0.xyz);
	r0.y = r0.x + c17.w;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = ((r0.y >= 0.0) ? r0.x : c18.x);
	r1 = s3_texture.sample(s3, v0.xy);
	r0.y = r1.x * c12.w;
	r0.y = (r0.y * c14.y) + c14.x;
	r0.y = fract(r0.y);
	r0.y = (r0.y * c14.z) + c14.w;
	r2.xy = float2(cos(r0.y), sin(r0.y));
	r3 = s0_texture.sample(s0, v0.xy);
	r0.yzw = r3.zxy * c15.xxx;
	r0.yzw = (r3.zxy * c15.xxx) + -r0.wyz;
	r0.yzw = r2.yyy * r0.yzw;
	r0.yzw = (r3.xyz * r2.xxx) + r0.yzw;
	r1.z = -r2.x + c13.w;
	r2.x = dot(c15.xxx, r3.xyz);
	r2.x = r2.x * c15.x;
	r2.xyz = (r2.xxx * r1.zzz) + r0.yzw;
	r0.y = abs(c12.w);
	r2.w = c13.w;
	r3.w = r1.x;
	r2 = ((-r0.y >= 0.0) ? r3 : r2);
	r0.yzw = r2.xyz * r2.xyz;
	r0.yzw = r0.yzw * r0.yzw;
	r1.x = dot(r0.yzw, c16.xyz);
	r1.z = r1.x + c17.w;
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.x = ((r1.z >= 0.0) ? r1.x : c18.x);
	r1.z = dot(r2.xyz, c16.xyz);
	r0.yzw = r0.yzw * r1.zzz;
	r3.xyz = mix(r2.xyz, r1.zzz, -c101.yyy);
	r0.yzw = (r0.yzw * r1.xxx) + -r2.xyz;
	r0.yzw = (c101.yyy * r0.yzw) + r2.xyz;
	r0.yzw = ((c101.y >= 0.0) ? r0.yzw : r3.xyz);
	r1.x = abs(c101.y);
	r0.yzw = ((-r1.x >= 0.0) ? r2.xyz : r0.yzw);
	r3.xyz = c23.xyz + -v5.xyz;
	r4.xyz = normalize(r3.xyz);
	r1.x = (r1.y * c15.y) + c15.z;
	r1.x = fract(r1.x);
	r1.x = (r1.x * c14.z) + c14.w;
	r3.xy = float2(cos(r1.x), sin(r1.x));
	r5 = s1_texture.sample(s1, v0.xy);
	r5.xyz = (r5.xyz * c13.xxx) + c13.yyy;
	r6.x = dot(v2.xyz, r5.xyz);
	r6.y = dot(v3.xyz, r5.xyz);
	r6.z = dot(v4.xyz, r5.xyz);
	r5.xyz = normalize(r6.xyz);
	r6.xyz = r5.zxy * v8.yzx;
	r6.xyz = (r5.yzx * v8.zxy) + -r6.xyz;
	r7.xyz = normalize(r6.xyz);
	r3.xzw = r3.xxx * r7.xyz;
	r6.xyz = r5.zxy * r7.yzx;
	r6.xyz = (r5.yzx * r7.zxy) + -r6.xyz;
	r7.xyz = normalize(r6.xyz);
	r3.xyz = (r3.yyy * r7.xyz) + r3.xzw;
	r6.xyz = normalize(r3.xyz);
	r1.x = dot(r4.xyz, r6.xxx);
	r1.z = (r1.x * -r1.x) + c13.w;
	r1.z = ((r1.z == 0.0) ? FLT_MAX : rsqrt(abs(r1.z)));
	r1.z = ((r1.z == 0.0) ? FLT_MAX : 1.0 / r1.z);
	r3.xyz = c3.xyz + -v5.xyz;
	r3.w = dot(r3.xyz, r3.xyz);
	r3.w = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r7.xyz = r3.www * r3.xyz;
	r4.w = dot(r7.xyz, r6.xyz);
	r6.w = (r4.w * -r4.w) + c13.w;
	r6.w = ((r6.w == 0.0) ? FLT_MAX : rsqrt(abs(r6.w)));
	r6.w = ((r6.w == 0.0) ? FLT_MAX : 1.0 / r6.w);
	r1.z = r1.z * r6.w;
	r1.x = clamp((r4.w * r1.x) + r1.z, 0.0, 1.0);
	r8.zw = c13.zw;
	r1.y = ((-r1.y >= 0.0) ? r8.z : c10.w);
	r1.z = -r1.w + c13.w;
	r8.xyz = (r3.xyz * r3.www) + r4.xyz;
	r9.xyz = normalize(r8.xyz);
	r1.w = clamp(dot(r5.xyz, r9.xyz), 0.0, 1.0);
	r9.x = mix(r1.w, r1.x, r1.y);
	r1.x = clamp(dot(r5.xyz, r4.xyz), 0.0, 1.0);
	r1.w = clamp(dot(r7.xyz, r4.xyz), 0.0, 1.0);
	r4.x = r1.x * r9.x;
	r9.z = clamp(dot(r7.xyz, r5.xyz), 0.0, 1.0);
	r4.y = -r9.z + c13.w;
	r7.w = pow(abs(r4.y), c105.x);
	r4.x = r4.x * r7.w;
	r4.y = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r1.x = (r1.x * r1.x) + r1.x;
	r1.x = r1.x * c14.x;
	r4.y = ((r4.y == 0.0) ? FLT_MAX : 1.0 / r4.y);
	r4.x = r4.y * r4.x;
	r8.xyz = c21.xyz + -v5.xyz;
	r10.xyz = normalize(r8.xyz);
	r4.z = dot(r10.xyz, r6.xxx);
	r8.x = (r4.z * -r4.z) + c13.w;
	r8.x = ((r8.x == 0.0) ? FLT_MAX : rsqrt(abs(r8.x)));
	r8.x = ((r8.x == 0.0) ? FLT_MAX : 1.0 / r8.x);
	r8.x = r6.w * r8.x;
	r4.z = clamp((r4.w * r4.z) + r8.x, 0.0, 1.0);
	r8.xyz = (r3.xyz * r3.www) + r10.xyz;
	r11.xyz = normalize(r8.xyz);
	r8.x = clamp(dot(r5.xyz, r11.xyz), 0.0, 1.0);
	r9.y = mix(r8.x, r4.z, r1.y);
	r4.z = clamp(dot(r5.xyz, r10.xyz), 0.0, 1.0);
	r8.x = r4.z * r9.y;
	r8.x = r7.w * r8.x;
	r8.y = ((r4.z == 0.0) ? FLT_MAX : rsqrt(abs(r4.z)));
	r4.z = (r4.z * r4.z) + r4.z;
	r8.y = ((r8.y == 0.0) ? FLT_MAX : 1.0 / r8.y);
	r8.z = (r8.x * r8.y) + r4.x;
	r8.x = r8.y * r8.x;
	r11.xyz = c25.xyz + -v5.xyz;
	r12.xyz = normalize(r11.xyz);
	r10.w = dot(r12.xyz, r6.xxx);
	r11.x = (r10.w * -r10.w) + c13.w;
	r11.x = ((r11.x == 0.0) ? FLT_MAX : rsqrt(abs(r11.x)));
	r11.x = ((r11.x == 0.0) ? FLT_MAX : 1.0 / r11.x);
	r11.x = r6.w * r11.x;
	r10.w = clamp((r4.w * r10.w) + r11.x, 0.0, 1.0);
	r11.xyz = (r3.xyz * r3.www) + r12.xyz;
	r13.xyz = normalize(r11.xyz);
	r11.x = clamp(dot(r5.xyz, r13.xyz), 0.0, 1.0);
	r13.y = mix(r11.x, r10.w, r1.y);
	r10.w = clamp(dot(r5.xyz, r12.xyz), 0.0, 1.0);
	r11.x = clamp(dot(r7.xyz, r12.xyz), 0.0, 1.0);
	r11.y = r10.w * r13.y;
	r11.y = r7.w * r11.y;
	r11.z = ((r10.w == 0.0) ? FLT_MAX : rsqrt(abs(r10.w)));
	r10.w = (r10.w * r10.w) + r10.w;
	r10.w = r10.w * c14.x;
	r11.z = ((r11.z == 0.0) ? FLT_MAX : 1.0 / r11.z);
	r8.z = (r11.y * r11.z) + r8.z;
	r11.y = r11.z * r11.y;
	r12.x = c23.w + -v5.x;
	r12.y = c24.w + -v5.y;
	r12.z = c25.w + -v5.z;
	r14.xyz = normalize(r12.xyz);
	r11.w = dot(r14.xyz, r6.xxx);
	r12.x = (r11.w * -r11.w) + c13.w;
	r12.x = ((r12.x == 0.0) ? FLT_MAX : rsqrt(abs(r12.x)));
	r12.x = ((r12.x == 0.0) ? FLT_MAX : 1.0 / r12.x);
	r6.w = r6.w * r12.x;
	r4.w = clamp((r4.w * r11.w) + r6.w, 0.0, 1.0);
	r12.xyz = (r3.xyz * r3.www) + r14.xyz;
	r15.xyz = normalize(r12.xyz);
	r6.w = clamp(dot(r5.xyz, r15.xyz), 0.0, 1.0);
	r13.x = mix(r6.w, r4.w, r1.y);
	r4.w = clamp(dot(r5.xyz, r14.xyz), 0.0, 1.0);
	r6.w = clamp(dot(r7.xyz, r14.xyz), 0.0, 1.0);
	r11.w = r4.w * r13.x;
	r11.w = r7.w * r11.w;
	r12.x = ((r4.w == 0.0) ? FLT_MAX : rsqrt(abs(r4.w)));
	r4.w = (r4.w * r4.w) + r4.w;
	r4.zw = r4.zw * c14.xx;
	r12.x = ((r12.x == 0.0) ? FLT_MAX : 1.0 / r12.x);
	r8.z = (r11.w * r12.x) + r8.z;
	r11.w = r11.w * r12.x;
	r12.yz = r8.zz + -c33.xw;
	r14.xy = -c33.xw + c33.yz;
	r8.z = ((r14.x == 0.0) ? FLT_MAX : 1.0 / r14.x);
	r12.w = ((r14.y == 0.0) ? FLT_MAX : 1.0 / r14.y);
	r12.z = clamp(r12.w * r12.z, 0.0, 1.0);
	r8.z = clamp(r8.z * r12.y, 0.0, 1.0);
	r12.y = (r8.z * c17.y) + c17.z;
	r8.z = r8.z * r8.z;
	r8.z = r8.z * r12.y;
	r12.y = (r12.z * c17.y) + c17.z;
	r12.z = r12.z * r12.z;
	r12.y = r12.z * r12.y;
	r8.z = r8.z * r12.y;
	r12.yzw = c22.xyz * v1.yyy;
	r14.xyz = r4.xxx * r12.yzw;
	r15.xyz = c20.xyz * v1.xxx;
	r14.xyz = (r8.xxx * r15.xyz) + r14.xyz;
	r16.xyz = c24.xyz * v1.zzz;
	r14.xyz = (r11.yyy * r16.xyz) + r14.xyz;
	r17.x = c20.w * v1.w;
	r17.y = c21.w * v1.w;
	r17.z = c22.w * v1.w;
	r14.xyz = (r11.www * r17.xyz) + r14.xyz;
	r4.x = (v6.w * c11.w) + r8.w;
	r18 = s10_texture.sample(s10, v0.xy);
	r8.x = r18.x * c105.y;
	r4.x = r4.x * r8.x;
	r14.xyz = r4.xxx * r14.xyz;
	r4.x = r18.y * c101.w;
	r19.xyz = (r2.xyz * r4.xxx) + -c106.xyz;
	r4.x = clamp(r4.x, 0.0, 1.0);
	r19.xyz = (r4.xxx * r19.xyz) + c106.xyz;
	r20.xyz = r14.xyz * r19.xyz;
	r4.x = dot(r20.xyz, c16.xyz);
	r4.x = r4.x * r8.z;
	r4.x = r4.x * c106.w;
	r8.x = ((r5.x >= 0.0) ? c13.z : c13.w);
	r8.z = ((r5.y >= 0.0) ? c13.z : c13.w);
	r8.w = ((r5.z >= 0.0) ? c13.z : c13.w);
	r20.xyz = r5.xyz * r5.xyz;
	r8.xzw = r8.xzw * r20.xyz;
	r21.xyz = r8.xxx * c5.xyz;
	r22.x = ((r5.x >= 0.0) ? c13.w : c13.z);
	r22.y = ((r5.y >= 0.0) ? c13.w : c13.z);
	r22.z = ((r5.z >= 0.0) ? c13.w : c13.z);
	r20.xyz = r20.xyz * r22.xyz;
	r21.xyz = (r20.xxx * c4.xyz) + r21.xyz;
	r20.xyw = (r20.yyy * c6.xyz) + r21.xyz;
	r20.xyw = (r8.zzz * c7.xyz) + r20.xyw;
	r20.xyz = (r20.zzz * c8.xyz) + r20.xyw;
	r8.xzw = (r8.www * c9.xyz) + r20.xyz;
	r8.xzw = (r15.xyz * r4.zzz) + r8.xzw;
	r8.xzw = (r12.yzw * r1.xxx) + r8.xzw;
	r8.xzw = (r16.xyz * r10.www) + r8.xzw;
	r8.xzw = (r17.xyz * r4.www) + r8.xzw;
	r1.x = dot(r8.xzw, c16.xyz);
	r4.zw = r1.xx + -c2.xw;
	r11.yw = -c2.xw + c2.yz;
	r1.x = ((r11.w == 0.0) ? FLT_MAX : 1.0 / r11.w);
	r10.w = ((r11.y == 0.0) ? FLT_MAX : 1.0 / r11.y);
	r4.z = clamp(r4.z * r10.w, 0.0, 1.0);
	r1.x = clamp(r1.x * r4.w, 0.0, 1.0);
	r4.w = (r1.x * c17.y) + c17.z;
	r1.x = r1.x * r1.x;
	r1.x = (r4.w * r1.x) + r4.x;
	r4.x = (r4.z * c17.y) + c17.z;
	r4.z = r4.z * r4.z;
	r4.x = r4.z * r4.x;
	r1.x = r1.x * r4.x;
	r1.x = r2.w * r1.x;
	r4.xzw = mix(r2.xyz, r0.yzw, r1.xxx);
	r0.yzw = r2.xyz + c13.yyy;
	r0.yzw = (r18.yyy * r0.yzw) + c13.www;
	r1.x = dot(r4.xzw, c16.xyz);
	r2.xyz = r1.xxx * c102.xyz;
	r2.xyz = (r2.xyz * r0.xxx) + -r4.xzw;
	r2.xyz = (c102.www * r2.xyz) + r4.xzw;
	r0.x = clamp(c107.w + v6.w, 0.0, 1.0);
	r2.xyz = (r2.xyz * r0.xxx) + -r4.xzw;
	r20.xyz = (r14.xyz * r19.xyz) + r8.xzw;
	r8.xzw = r8.xzw + v6.xyz;
	r0.x = dot(r20.xyz, c16.xyz);
	r0.x = r0.x + c16.w;
	r0.x = clamp(r0.x * c17.x, 0.0, 1.0);
	r1.x = (r0.x * c17.y) + c17.z;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r1.x;
	r2.xyz = (r0.xxx * r2.xyz) + r4.xzw;
	r2.xyz = r18.zzz * r2.xyz;
	r9.w = r18.w;
	r20 = s7_texture.sample(s7, r9.yw);
	r0.x = clamp(dot(r7.xyz, r10.xyz), 0.0, 1.0);
	r1.x = clamp(r10.z, 0.0, 1.0);
	r1.x = (r1.x * r1.x) + r1.x;
	r1.x = r1.x * c14.x;
	r4.xzw = r1.xxx * r15.xyz;
	r1.x = r9.z * r9.z;
	r10 = s4_texture.sample(s4, r9.zw);
	r21.w = r1.x * r1.x;
	r1.x = r1.z * r21.w;
	r22.xyz = r1.xxx * v6.xyz;
	r21.xyz = r22.xyz * c15.www;
	r21 = ((-r1.z >= 0.0) ? c13.zzzz : r21);
	r0.x = r0.x * r21.w;
	r22.xyz = (r0.xxx * c15.www) + -r20.xyz;
	r22.xyz = (r1.zzz * r22.xyz) + r20.xyz;
	r20.xyz = ((-r1.z >= 0.0) ? r20.xyz : r22.xyz);
	r20.xyz = r8.yyy * r20.xyz;
	r20.xyz = (r20.xyz * r15.xyz) + r21.xyz;
	r22 = s7_texture.sample(s7, r9.xw);
	r13.z = r9.w;
	r0.x = r1.w * r21.w;
	r9.xyz = (r0.xxx * c15.www) + -r22.xyz;
	r9.xyz = (r1.zzz * r9.xyz) + r22.xyz;
	r9.xyz = ((-r1.z >= 0.0) ? r22.xyz : r9.xyz);
	r9.xyz = r4.yyy * r9.xyz;
	r9.xyz = (r9.xyz * r12.yzw) + r20.xyz;
	r20 = s7_texture.sample(s7, r13.yz);
	r13 = s7_texture.sample(s7, r13.xz);
	r0.x = r11.x * r21.w;
	r1.x = r6.w * r21.w;
	r11.xyw = (r1.xxx * c15.www) + -r13.xyz;
	r11.xyw = (r1.zzz * r11.xyw) + r13.xyz;
	r11.xyw = ((-r1.z >= 0.0) ? r13.xyz : r11.xyw);
	r11.xyw = r12.xxx * r11.xyw;
	r12.xyz = (r0.xxx * c15.www) + -r20.xyz;
	r12.xyz = (r1.zzz * r12.xyz) + r20.xyz;
	r12.xyz = ((-r1.z >= 0.0) ? r20.xyz : r12.xyz);
	r0.x = mix(r10.y, c13.w, r1.z);
	r1.x = r18.x * r10.z;
	r1.x = r1.x * c0.w;
	r10.xyz = r11.zzz * r12.xyz;
	r9.xyz = (r10.xyz * r16.xyz) + r9.xyz;
	r9.xyz = (r11.xyw * r17.xyz) + r9.xyz;
	r9.xyz = r5.www * r9.xyz;
	r1.z = mix(c10.x, c10.y, r18.y);
	r9.xyz = r1.zzz * r9.xyz;
	r10.xyz = r5.xyz * r6.yzx;
	r10.xyz = (r6.xyz * r5.yzx) + -r10.xyz;
	r11.xyz = r6.yzx * r10.xyz;
	r6.xyz = (r10.zxy * r6.zxy) + -r11.xyz;
	r1.z = dot(r6.xyz, r6.xyz);
	r1.z = ((r1.z == 0.0) ? FLT_MAX : rsqrt(abs(r1.z)));
	r6.xyz = (r6.xyz * r1.zzz) + -r7.xyz;
	r1.yzw = (r1.yyy * r6.xyz) + r7.xyz;
	r2.w = dot(r5.xyz, r1.yzw);
	r2.w = r2.w + r2.w;
	r4.y = dot(r5.xyz, r5.xyz);
	r1.yzw = r1.yzw * r4.yyy;
	r1.yzw = (r2.www * r5.xyz) + -r1.yzw;
	r6.x = ((r1.y >= 0.0) ? c13.w : c13.z);
	r6.y = ((r1.z >= 0.0) ? c13.w : c13.z);
	r6.z = ((r1.w >= 0.0) ? c13.w : c13.z);
	r7.xyz = r1.yzw * r1.yzw;
	r1.y = ((r1.y >= 0.0) ? c13.z : c13.w);
	r1.z = ((r1.z >= 0.0) ? c13.z : c13.w);
	r1.w = ((r1.w >= 0.0) ? c13.z : c13.w);
	r1.yzw = r7.xyz * r1.yzw;
	r6.xyz = r6.xyz * r7.xyz;
	r7.xyz = r1.yyy * c5.xyz;
	r7.xyz = (r6.xxx * c4.xyz) + r7.xyz;
	r6.xyw = (r6.yyy * c6.xyz) + r7.xyz;
	r6.xyw = (r1.zzz * c7.xyz) + r6.xyw;
	r6.xyz = (r6.zzz * c8.xyz) + r6.xyw;
	r1.yzw = (r1.www * c9.xyz) + r6.xyz;
	r1.yzw = r4.xzw * r1.yzw;
	r4.x = v7.w;
	r4.y = v8.w;
	r4.z = v9.w;
	r4.xyz = -r4.xyz + c21.xyz;
	r6.xyz = normalize(r4.xyz);
	r2.w = clamp(dot(-v9.xyz, r6.xyz), 0.0, 1.0);
	r2.w = (r2.w * r2.w) + r2.w;
	r2.w = r2.w * c14.x;
	r4.xyz = r2.www * r15.xyz;
	r6.xyz = c0.xyz * v6.xyz;
	r4.xyz = (r6.xyz * r4.xyz) + -r1.yzw;
	r2.w = clamp(dot(r5.xyz, v9.xyz), 0.0, 1.0);
	r1.yzw = (r2.www * r4.xyz) + r1.yzw;
	r1.xyz = r1.xxx * r1.yzw;
	r1.xyz = (r9.xyz * r0.xxx) + r1.xyz;
	r0.xyz = r0.yzw * r1.xyz;
	r0.xyz = (r2.xyz * r8.xzw) + r0.xyz;
	r0.xyz = (r14.xyz * r19.xyz) + r0.xyz;
	r1.x = v2.w;
	r1.y = v3.w;
	r1.z = v4.w;
	r2.xyz = (r3.xyz * r3.www) + r1.xyz;
	r0.w = clamp(dot(r5.xyz, r1.xyz), 0.0, 1.0);
	r1.xyz = normalize(r2.xyz);
	r1.x = clamp(dot(r5.xyz, r1.xyz), 0.0, 1.0);
	r1.x = r0.w * r1.x;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r1.x = r7.w * r1.x;
	r0.w = r0.w * r1.x;
	r1.xyz = v6.www * v6.xyz;
	r1.xyz = r1.xyz * c107.xyz;
	r1.xyz = r0.www * r1.xyz;
	r0.xyz = (r1.xyz * r18.xxx) + r0.xyz;
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
	#undef c19
	#undef c20
	#undef c21
	#undef c22
	#undef c23
	#undef c24
	#undef c25
	#undef c30
	#undef c33
	#undef c101
	#undef c102
	#undef c105
	#undef c106
	#undef c107
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

