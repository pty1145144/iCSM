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
	const float4 c26 = float4(5.000000000e-01, 1.591549367e-01, 6.283185482e+00, -3.141592741e+00); (void) c26;
	const float4 c27 = float4(5.000000000e+00, 2.989999950e-01, 5.870000124e-01, 1.140000001e-01); (void) c27;
	const float4 c29 = float4(2.000000000e+00, -1.000000000e+00, 0.000000000e+00, 1.000000000e+00); (void) c29;
	const float4 c31 = float4(-3.000000119e-01, -3.333333254e+00, -2.000000000e+00, 3.000000000e+00); (void) c31;
	const float4 c32 = float4(-9.999999975e-07, 1.000000000e+06, 0.000000000e+00, 0.000000000e+00); (void) c32;
	const float4 c34 = float4(5.773500204e-01, -4.000000060e-01, 4.999995828e-01, 5.000000000e-01); (void) c34;
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
	#define v7 input.v7
	#define v8 input.v8
	#define v9 input.v9
	#define oC0 output.oC0
	r0.x = c19.y + -v5.z;
	r0.x = r0.x + -c29.x;
	oC0.w = clamp(r0.x * c19.w, 0.0, 1.0);
	r0 = (v5.xyzx * c29.wwwz) + c29.zzzw;
	r1.x = dot(r0, c18);
	r1.y = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r2.x = dot(r0, c15);
	r2.y = dot(r0, c16);
	r2.z = dot(r0, c17);
	r0.xyz = r1.yyy * r2.xyz;
	r2 = s8_texture.sample(s8, r0.xy);
	r1.xyz = ((-r1.x >= 0.0) ? c29.zzz : r2.xyz);
	r2.y = c34.y;
	r1.w = r2.y * c13.w;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r2.xyz = c14.xyz + -v5.xyz;
	r2.w = dot(r2.xyz, r2.xyz);
	r3.y = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r3.z = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r2.w = ((r3.y == 0.0) ? FLT_MAX : 1.0 / r3.y);
	r2.w = r2.w + -c13.w;
	r1.w = clamp(r1.w * r2.w, 0.0, 1.0);
	r3.x = c29.w;
	r2.w = clamp(dot(c13.xyz, r3.xyz), 0.0, 1.0);
	r2.xyz = r2.xyz * r3.yyy;
	r3.x = r1.w * r2.w;
	r3.xyz = r3.xxx * c28.xyz;
	r3.xyz = r1.xyz * r3.xyz;
	r1.xyz = r1.xyz * c28.xyz;
	r0.w = c29.w;
	r0 = float4(s11_texture.sample_compare(s11, (r0.xyz).xy, (r0.xyz).z));
	r0.y = -r0.x + c29.w;
	r0.y = (c109.y * r0.y) + r0.x;
	r3.w = clamp(mix(r0.y, r0.x, r2.w), 0.0, 1.0);
	r0.yzw = r3.www * r3.xyz;
	r3.xyz = c23.xyz + -v5.xyz;
	r4.xyz = normalize(r3.xyz);
	r3 = s3_texture.sample(s3, v0.xy);
	r3.z = (r3.y * c34.z) + c34.w;
	r3.z = fract(r3.z);
	r3.z = (r3.z * c26.z) + c26.w;
	r5.xy = float2(cos(r3.z), sin(r3.z));
	r6 = s1_texture.sample(s1, v0.xy);
	r6.xyz = (r6.xyz * c29.xxx) + c29.yyy;
	r7.x = dot(v2.xyz, r6.xyz);
	r7.y = dot(v3.xyz, r6.xyz);
	r7.z = dot(v4.xyz, r6.xyz);
	r6.xyz = normalize(r7.xyz);
	r7.xyz = r6.zxy * v8.yzx;
	r7.xyz = (r6.yzx * v8.zxy) + -r7.xyz;
	r8.xyz = normalize(r7.xyz);
	r7.xyz = r6.zxy * r8.yzx;
	r7.xyz = (r6.yzx * r8.zxy) + -r7.xyz;
	r5.xzw = r5.xxx * r8.xyz;
	r8.xyz = normalize(r7.xyz);
	r5.xyz = (r5.yyy * r8.xyz) + r5.xzw;
	r7.xyz = normalize(r5.xyz);
	r3.z = dot(r4.xyz, r7.xxx);
	r4.w = (r3.z * -r3.z) + c29.w;
	r4.w = ((r4.w == 0.0) ? FLT_MAX : rsqrt(abs(r4.w)));
	r4.w = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r5.xyz = c3.xyz + -v5.xyz;
	r5.w = dot(r5.xyz, r5.xyz);
	r5.w = ((r5.w == 0.0) ? FLT_MAX : rsqrt(abs(r5.w)));
	r8.xyz = r5.www * r5.xyz;
	r7.w = dot(r8.xyz, r7.xyz);
	r8.w = (r7.w * -r7.w) + c29.w;
	r8.w = ((r8.w == 0.0) ? FLT_MAX : rsqrt(abs(r8.w)));
	r8.w = ((r8.w == 0.0) ? FLT_MAX : 1.0 / r8.w);
	r4.w = r4.w * r8.w;
	r3.z = clamp((r7.w * r3.z) + r4.w, 0.0, 1.0);
	r9.xyz = (r5.xyz * r5.www) + r4.xyz;
	r10.xyz = normalize(r9.xyz);
	r4.w = clamp(dot(r6.xyz, r10.xyz), 0.0, 1.0);
	r9.zw = c29.zw;
	r3.y = ((-r3.y >= 0.0) ? r9.z : c10.w);
	r10.z = mix(r4.w, r3.z, r3.y);
	r11 = s10_texture.sample(s10, v0.xy);
	r12.w = r11.w;
	r10.w = r12.w;
	r13 = s7_texture.sample(s7, r10.zw);
	r3.z = clamp(dot(r8.xyz, r4.xyz), 0.0, 1.0);
	r4.x = clamp(dot(r6.xyz, r4.xyz), 0.0, 1.0);
	r12.z = clamp(dot(r8.xyz, r6.xyz), 0.0, 1.0);
	r4.y = r12.z * r12.z;
	r14.w = r4.y * r4.y;
	r3.w = -r3.w + c29.w;
	r4.y = r14.w * r3.w;
	r4.yzw = r4.yyy * v6.xyz;
	r14.xyz = r4.yzw * c27.xxx;
	r14 = ((-r3.w >= 0.0) ? c29.zzzz : r14);
	r3.z = r3.z * r14.w;
	r4.yzw = (r3.zzz * c27.xxx) + -r13.xyz;
	r4.yzw = (r3.www * r4.yzw) + r13.xyz;
	r4.yzw = ((-r3.w >= 0.0) ? r13.xyz : r4.yzw);
	r3.z = ((r4.x == 0.0) ? FLT_MAX : rsqrt(abs(r4.x)));
	r3.z = ((r3.z == 0.0) ? FLT_MAX : 1.0 / r3.z);
	r4.yzw = r3.zzz * r4.yzw;
	r9.xyz = c21.xyz + -v5.xyz;
	r13.xyz = normalize(r9.xyz);
	r9.x = dot(r13.xyz, r7.xxx);
	r9.y = (r9.x * -r9.x) + c29.w;
	r9.y = ((r9.y == 0.0) ? FLT_MAX : rsqrt(abs(r9.y)));
	r9.y = ((r9.y == 0.0) ? FLT_MAX : 1.0 / r9.y);
	r9.y = r8.w * r9.y;
	r9.x = clamp((r7.w * r9.x) + r9.y, 0.0, 1.0);
	r15.xyz = (r5.xyz * r5.www) + r13.xyz;
	r16.xyz = normalize(r15.xyz);
	r9.y = clamp(dot(r6.xyz, r16.xyz), 0.0, 1.0);
	r12.x = mix(r9.y, r9.x, r3.y);
	r15 = s7_texture.sample(s7, r12.xw);
	r9.x = clamp(dot(r8.xyz, r13.xyz), 0.0, 1.0);
	r9.x = r9.x * r14.w;
	r9.xyz = (r9.xxx * c27.xxx) + -r15.xyz;
	r9.xyz = (r3.www * r9.xyz) + r15.xyz;
	r9.xyz = ((-r3.w >= 0.0) ? r15.xyz : r9.xyz);
	r11.w = clamp(dot(r6.xyz, r13.xyz), 0.0, 1.0);
	r13.x = clamp(r13.z, 0.0, 1.0);
	r13.x = (r13.x * r13.x) + r13.x;
	r13.x = r13.x * c26.x;
	r13.y = ((r11.w == 0.0) ? FLT_MAX : rsqrt(abs(r11.w)));
	r13.y = ((r13.y == 0.0) ? FLT_MAX : 1.0 / r13.y);
	r9.xyz = r9.xyz * r13.yyy;
	r15.xyz = c20.xyz * v1.xxx;
	r9.xyz = (r9.xyz * r15.xyz) + r14.xyz;
	r14.xyz = c22.xyz * v1.yyy;
	r4.yzw = (r4.yzw * r14.xyz) + r9.xyz;
	r9.xyz = c25.xyz + -v5.xyz;
	r16.xyz = normalize(r9.xyz);
	r9.x = dot(r16.xyz, r7.xxx);
	r9.y = (r9.x * -r9.x) + c29.w;
	r9.y = ((r9.y == 0.0) ? FLT_MAX : rsqrt(abs(r9.y)));
	r9.y = ((r9.y == 0.0) ? FLT_MAX : 1.0 / r9.y);
	r9.y = r8.w * r9.y;
	r9.x = clamp((r7.w * r9.x) + r9.y, 0.0, 1.0);
	r17.xyz = (r5.xyz * r5.www) + r16.xyz;
	r18.xyz = normalize(r17.xyz);
	r9.y = clamp(dot(r6.xyz, r18.xyz), 0.0, 1.0);
	r10.y = mix(r9.y, r9.x, r3.y);
	r17 = s7_texture.sample(s7, r10.yw);
	r9.x = clamp(dot(r8.xyz, r16.xyz), 0.0, 1.0);
	r9.y = clamp(dot(r6.xyz, r16.xyz), 0.0, 1.0);
	r9.x = r9.x * r14.w;
	r16.xyz = (r9.xxx * c27.xxx) + -r17.xyz;
	r16.xyz = (r3.www * r16.xyz) + r17.xyz;
	r16.xyz = ((-r3.w >= 0.0) ? r17.xyz : r16.xyz);
	r9.x = ((r9.y == 0.0) ? FLT_MAX : rsqrt(abs(r9.y)));
	r9.x = ((r9.x == 0.0) ? FLT_MAX : 1.0 / r9.x);
	r16.xyz = r9.xxx * r16.xyz;
	r17.xyz = c24.xyz * v1.zzz;
	r4.yzw = (r16.xyz * r17.xyz) + r4.yzw;
	r16.x = c23.w + -v5.x;
	r16.y = c24.w + -v5.y;
	r16.z = c25.w + -v5.z;
	r18.xyz = normalize(r16.xyz);
	r9.z = dot(r18.xyz, r7.xxx);
	r13.z = (r9.z * -r9.z) + c29.w;
	r13.z = ((r13.z == 0.0) ? FLT_MAX : rsqrt(abs(r13.z)));
	r13.z = ((r13.z == 0.0) ? FLT_MAX : 1.0 / r13.z);
	r8.w = r8.w * r13.z;
	r7.w = clamp((r7.w * r9.z) + r8.w, 0.0, 1.0);
	r16.xyz = (r5.xyz * r5.www) + r18.xyz;
	r5.xyz = (r5.xyz * r5.www) + r2.xyz;
	r2.x = dot(r2.xyz, r6.xyz);
	r19.xyz = normalize(r5.xyz);
	r2.y = clamp(dot(r6.xyz, r19.xyz), 0.0, 1.0);
	r12.y = mix(r2.y, c29.w, r3.y);
	r5 = s7_texture.sample(s7, r12.yw);
	r19 = s4_texture.sample(s4, r12.zw);
	r2.y = -r12.z + c29.w;
	r5.w = pow(abs(r2.y), c105.x);
	r20.xyz = normalize(r16.xyz);
	r2.y = clamp(dot(r6.xyz, r20.xyz), 0.0, 1.0);
	r10.x = mix(r2.y, r7.w, r3.y);
	r16 = s7_texture.sample(s7, r10.xw);
	r2.y = clamp(dot(r8.xyz, r18.xyz), 0.0, 1.0);
	r2.z = clamp(dot(r6.xyz, r18.xyz), 0.0, 1.0);
	r2.y = r2.y * r14.w;
	r12.yzw = (r2.yyy * c27.xxx) + -r16.xyz;
	r12.yzw = (r3.www * r12.yzw) + r16.xyz;
	r12.yzw = ((-r3.w >= 0.0) ? r16.xyz : r12.yzw);
	r2.y = mix(r19.y, c29.w, r3.w);
	r3.w = r11.x * r19.z;
	r3.w = r3.w * c0.w;
	r7.w = ((r2.z == 0.0) ? FLT_MAX : rsqrt(abs(r2.z)));
	r7.w = ((r7.w == 0.0) ? FLT_MAX : 1.0 / r7.w);
	r12.yzw = r7.www * r12.yzw;
	r16.x = c20.w * v1.w;
	r16.y = c21.w * v1.w;
	r16.z = c22.w * v1.w;
	r4.yzw = (r12.yzw * r16.xyz) + r4.yzw;
	r8.w = clamp(r2.x, 0.0, 1.0);
	r2.x = clamp(r2.x + c28.w, 0.0, 1.0);
	r2.x = r2.x * r2.w;
	r8.w = ((r8.w == 0.0) ? FLT_MAX : rsqrt(abs(r8.w)));
	r8.w = ((r8.w == 0.0) ? FLT_MAX : 1.0 / r8.w);
	r5.xyz = r5.xyz * r8.www;
	r0.yzw = (r5.xyz * r0.yzw) + r4.yzw;
	r0.yzw = r6.www * r0.yzw;
	r4.y = mix(c10.x, c10.y, r11.y);
	r0.yzw = r0.yzw * r4.yyy;
	r4.yzw = r6.xyz * r7.yzx;
	r4.yzw = (r7.xyz * r6.yzx) + -r4.yzw;
	r5.xyz = r7.yzx * r4.yzw;
	r4.yzw = (r4.wyz * r7.zxy) + -r5.xyz;
	r5.x = dot(r4.yzw, r4.yzw);
	r5.x = ((r5.x == 0.0) ? FLT_MAX : rsqrt(abs(r5.x)));
	r4.yzw = (r4.yzw * r5.xxx) + -r8.xyz;
	r4.yzw = (r3.yyy * r4.yzw) + r8.xyz;
	r3.y = dot(r6.xyz, r4.yzw);
	r3.y = r3.y + r3.y;
	r5.x = dot(r6.xyz, r6.xyz);
	r4.yzw = r4.yzw * r5.xxx;
	r4.yzw = (r3.yyy * r6.xyz) + -r4.yzw;
	r5.x = ((r4.y >= 0.0) ? c29.w : c29.z);
	r5.y = ((r4.z >= 0.0) ? c29.w : c29.z);
	r5.z = ((r4.w >= 0.0) ? c29.w : c29.z);
	r7.xyz = r4.yzw * r4.yzw;
	r4.y = ((r4.y >= 0.0) ? c29.z : c29.w);
	r4.z = ((r4.z >= 0.0) ? c29.z : c29.w);
	r4.w = ((r4.w >= 0.0) ? c29.z : c29.w);
	r4.yzw = r7.xyz * r4.yzw;
	r5.xyz = r5.xyz * r7.xyz;
	r7.xyz = r4.yyy * c5.xyz;
	r7.xyz = (r5.xxx * c4.xyz) + r7.xyz;
	r7.xyz = (r5.yyy * c6.xyz) + r7.xyz;
	r7.xyz = (r4.zzz * c7.xyz) + r7.xyz;
	r5.xyz = (r5.zzz * c8.xyz) + r7.xyz;
	r4.yzw = (r4.www * c9.xyz) + r5.xyz;
	r5.xyz = r13.xxx * r15.xyz;
	r4.yzw = r4.yzw * r5.xyz;
	r5.x = v7.w;
	r5.y = v8.w;
	r5.z = v9.w;
	r5.xyz = -r5.xyz + c21.xyz;
	r7.xyz = normalize(r5.xyz);
	r3.y = clamp(dot(-v9.xyz, r7.xyz), 0.0, 1.0);
	r3.y = (r3.y * r3.y) + r3.y;
	r3.y = r3.y * c26.x;
	r5.xyz = r3.yyy * r15.xyz;
	r7.xyz = c0.xyz * v6.xyz;
	r5.xyz = (r7.xyz * r5.xyz) + -r4.yzw;
	r3.y = clamp(dot(r6.xyz, v9.xyz), 0.0, 1.0);
	r4.yzw = (r3.yyy * r5.xyz) + r4.yzw;
	r4.yzw = r3.www * r4.yzw;
	r0.yzw = (r0.yzw * r2.yyy) + r4.yzw;
	r2.y = r3.x * c12.w;
	r8.w = r3.x;
	r2.y = (r2.y * c26.y) + c26.x;
	r2.y = fract(r2.y);
	r2.y = (r2.y * c26.z) + c26.w;
	r18.xy = float2(cos(r2.y), sin(r2.y));
	r19 = s0_texture.sample(s0, v0.xy);
	r3.xyw = r19.zxy * c34.xxx;
	r3.xyw = (r19.zxy * c34.xxx) + -r3.wxy;
	r3.xyw = r18.yyy * r3.xyw;
	r3.xyw = (r19.xyz * r18.xxx) + r3.xyw;
	r2.y = -r18.x + c29.w;
	r4.y = dot(c34.xxx, r19.xyz);
	r8.xyz = r19.xyz;
	r4.y = r4.y * c34.x;
	r18.xyz = (r4.yyy * r2.yyy) + r3.xyw;
	r2.y = abs(c12.w);
	r18.w = c29.w;
	r8 = ((-r2.y >= 0.0) ? r8 : r18);
	r3.xyw = r8.xyz + c29.yyy;
	r3.xyw = (r11.yyy * r3.xyw) + c29.www;
	r0.yzw = r0.yzw * r3.xyw;
	r3.x = ((r6.x >= 0.0) ? c29.z : c29.w);
	r3.y = ((r6.y >= 0.0) ? c29.z : c29.w);
	r3.w = ((r6.z >= 0.0) ? c29.z : c29.w);
	r4.yzw = r6.xyz * r6.xyz;
	r5.x = ((r6.x >= 0.0) ? c29.w : c29.z);
	r5.y = ((r6.y >= 0.0) ? c29.w : c29.z);
	r5.z = ((r6.z >= 0.0) ? c29.w : c29.z);
	r5.xyz = r4.yzw * r5.xyz;
	r3.xyw = r3.xyw * r4.yzw;
	r4.yzw = r3.xxx * c5.xyz;
	r4.yzw = (r5.xxx * c4.xyz) + r4.yzw;
	r4.yzw = (r5.yyy * c6.xyz) + r4.yzw;
	r4.yzw = (r3.yyy * c7.xyz) + r4.yzw;
	r4.yzw = (r5.zzz * c8.xyz) + r4.yzw;
	r3.xyw = (r3.www * c9.xyz) + r4.yzw;
	r2.y = (r11.w * r11.w) + r11.w;
	r4.y = r11.w * r12.x;
	r2.y = r2.y * c26.x;
	r3.xyw = (r15.xyz * r2.yyy) + r3.xyw;
	r2.y = (r4.x * r4.x) + r4.x;
	r4.x = r4.x * r10.z;
	r4.xy = r5.ww * r4.xy;
	r3.z = r3.z * r4.x;
	r2.y = r2.y * c26.x;
	r3.xyw = (r14.xyz * r2.yyy) + r3.xyw;
	r4.xzw = r14.xyz * r3.zzz;
	r2.y = (r4.y * r13.y) + r3.z;
	r3.z = r13.y * r4.y;
	r4.xyz = (r3.zzz * r15.xyz) + r4.xzw;
	r3.z = (r9.y * r9.y) + r9.y;
	r4.w = r9.y * r10.y;
	r4.w = r5.w * r4.w;
	r3.z = r3.z * c26.x;
	r3.xyz = (r17.xyz * r3.zzz) + r3.xyw;
	r3.w = (r2.z * r2.z) + r2.z;
	r2.z = r2.z * r10.x;
	r2.z = r5.w * r2.z;
	r3.w = r3.w * c26.x;
	r3.xyz = (r16.xyz * r3.www) + r3.xyz;
	r3.w = clamp(r0.x, 0.0, 1.0);
	r5.x = -r3.w + c29.w;
	r3.w = (c109.y * r5.x) + r3.w;
	r5.x = clamp(mix(r3.w, r0.x, r2.w), 0.0, 1.0);
	r1.xyz = r1.xyz * r5.xxx;
	r1.xyz = r1.xyz * r2.xxx;
	r1.xyz = (r1.xyz * r1.www) + r3.xyz;
	r0.x = dot(r1.xyz, c27.yzw);
	r2.xw = r0.xx + -c2.xw;
	r3.xy = -c2.xw + c2.yz;
	r0.x = ((r3.y == 0.0) ? FLT_MAX : 1.0 / r3.y);
	r1.w = ((r3.x == 0.0) ? FLT_MAX : 1.0 / r3.x);
	r1.w = clamp(r1.w * r2.x, 0.0, 1.0);
	r0.x = clamp(r0.x * r2.w, 0.0, 1.0);
	r2.x = (r0.x * c31.z) + c31.w;
	r0.x = r0.x * r0.x;
	r2.y = (r4.w * r9.x) + r2.y;
	r2.w = r9.x * r4.w;
	r3.xyz = (r2.www * r17.xyz) + r4.xyz;
	r2.y = (r2.z * r7.w) + r2.y;
	r2.z = r7.w * r2.z;
	r3.xyz = (r2.zzz * r16.xyz) + r3.xyz;
	r2.yz = r2.yy + -c33.xw;
	r4.xy = -c33.xw + c33.yz;
	r2.w = ((r4.x == 0.0) ? FLT_MAX : 1.0 / r4.x);
	r3.w = ((r4.y == 0.0) ? FLT_MAX : 1.0 / r4.y);
	r2.z = clamp(r2.z * r3.w, 0.0, 1.0);
	r2.y = clamp(r2.w * r2.y, 0.0, 1.0);
	r2.w = (r2.y * c31.z) + c31.w;
	r2.y = r2.y * r2.y;
	r2.y = r2.y * r2.w;
	r2.w = (r2.z * c31.z) + c31.w;
	r2.z = r2.z * r2.z;
	r2.z = r2.z * r2.w;
	r2.y = r2.z * r2.y;
	r2.z = (v6.w * c11.w) + r9.w;
	r2.w = r11.x * c105.y;
	r2.z = r2.z * r2.w;
	r3.xyz = r2.zzz * r3.xyz;
	r2.z = r11.y * c101.w;
	r4.xyz = (r8.xyz * r2.zzz) + -c106.xyz;
	r2.z = clamp(r2.z, 0.0, 1.0);
	r4.xyz = (r2.zzz * r4.xyz) + c106.xyz;
	r5.xyz = r3.xyz * r4.xyz;
	r2.z = dot(r5.xyz, c27.yzw);
	r2.y = r2.z * r2.y;
	r2.y = r2.y * c106.w;
	r0.x = (r2.x * r0.x) + r2.y;
	r2.x = (r1.w * c31.z) + c31.w;
	r1.w = r1.w * r1.w;
	r1.w = r1.w * r2.x;
	r0.x = r0.x * r1.w;
	r0.x = r8.w * r0.x;
	r2.xyz = r8.xyz * r8.xyz;
	r2.xyz = r2.xyz * r2.xyz;
	r1.w = dot(r8.xyz, c27.yzw);
	r5.xyz = r1.www * r2.xyz;
	r2.x = dot(r2.xyz, c27.yzw);
	r2.yzw = mix(r8.xyz, r1.www, -c101.yyy);
	r1.w = r2.x + c32.x;
	r2.x = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r1.w = ((r1.w >= 0.0) ? r2.x : c32.y);
	r5.xyz = (r5.xyz * r1.www) + -r8.xyz;
	r5.xyz = (c101.yyy * r5.xyz) + r8.xyz;
	r2.xyz = ((c101.y >= 0.0) ? r5.xyz : r2.yzw);
	r1.w = abs(c101.y);
	r2.xyz = ((-r1.w >= 0.0) ? r8.xyz : r2.xyz);
	r5.xyz = mix(r8.xyz, r2.xyz, r0.xxx);
	r0.x = dot(r5.xyz, c27.yzw);
	r2.xyz = r0.xxx * c102.xyz;
	r6.yzw = c27.yzw;
	r0.x = dot(c102.xyz, r6.yzw);
	r1.w = r0.x + c32.x;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = ((r1.w >= 0.0) ? r0.x : c32.y);
	r2.xyz = (r2.xyz * r0.xxx) + -r5.xyz;
	r2.xyz = (c102.www * r2.xyz) + r5.xyz;
	r0.x = clamp(c107.w + v6.w, 0.0, 1.0);
	r2.xyz = (r2.xyz * r0.xxx) + -r5.xyz;
	r6.xyz = (r3.xyz * r4.xyz) + r1.xyz;
	r1.xyz = r1.xyz + v6.xyz;
	r0.x = dot(r6.xyz, c27.yzw);
	r0.x = r0.x + c31.x;
	r0.x = clamp(r0.x * c31.y, 0.0, 1.0);
	r1.w = (r0.x * c31.z) + c31.w;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r1.w;
	r2.xyz = (r0.xxx * r2.xyz) + r5.xyz;
	r2.xyz = r11.zzz * r2.xyz;
	r0.xyz = (r2.xyz * r1.xyz) + r0.yzw;
	r0.xyz = (r3.xyz * r4.xyz) + r0.xyz;
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

