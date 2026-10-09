#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[31];
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
	const float4 c22 = float4(5.000000000e-01, 1.591549367e-01, 6.283185482e+00, -3.141592741e+00); (void) c22;
	const float4 c23 = float4(5.000000000e+00, 2.989999950e-01, 5.870000124e-01, 1.140000001e-01); (void) c23;
	const float4 c24 = float4(2.000000000e+00, -1.000000000e+00, 0.000000000e+00, 1.000000000e+00); (void) c24;
	const float4 c25 = float4(-3.000000119e-01, -3.333333254e+00, -2.000000000e+00, 3.000000000e+00); (void) c25;
	const float4 c26 = float4(-9.999999975e-07, 1.000000000e+06, 0.000000000e+00, 0.000000000e+00); (void) c26;
	const float4 c27 = float4(5.773500204e-01, -4.000000060e-01, 4.999995828e-01, 5.000000000e-01); (void) c27;
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
	#define c30 uniforms.uniforms_float4[23]
	#define c33 uniforms.uniforms_float4[24]
	#define c101 uniforms.uniforms_float4[25]
	#define c102 uniforms.uniforms_float4[26]
	#define c105 uniforms.uniforms_float4[27]
	#define c106 uniforms.uniforms_float4[28]
	#define c107 uniforms.uniforms_float4[29]
	#define c109 uniforms.uniforms_float4[30]
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
	r0.x = r0.x + -c24.x;
	oC0.w = clamp(r0.x * c19.w, 0.0, 1.0);
	r0 = (v5.xyzx * c24.wwwz) + c24.zzzw;
	r1.x = dot(r0, c18);
	r1.y = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r2.x = dot(r0, c15);
	r2.y = dot(r0, c16);
	r2.z = dot(r0, c17);
	r0.xyz = r1.yyy * r2.xyz;
	r2 = s8_texture.sample(s8, r0.xy);
	r1.xyz = ((-r1.x >= 0.0) ? c24.zzz : r2.xyz);
	r2.y = c27.y;
	r1.w = r2.y * c13.w;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r2.xyz = c14.xyz + -v5.xyz;
	r2.w = dot(r2.xyz, r2.xyz);
	r3.y = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r3.z = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r2.w = ((r3.y == 0.0) ? FLT_MAX : 1.0 / r3.y);
	r2.w = r2.w + -c13.w;
	r1.w = clamp(r1.w * r2.w, 0.0, 1.0);
	r3.x = c24.w;
	r2.w = clamp(dot(c13.xyz, r3.xyz), 0.0, 1.0);
	r2.xyz = r2.xyz * r3.yyy;
	r3.x = r1.w * r2.w;
	r3.xyz = r3.xxx * c28.xyz;
	r3.xyz = r1.xyz * r3.xyz;
	r1.xyz = r1.xyz * c28.xyz;
	r0.w = c24.w;
	r0 = float4(s11_texture.sample_compare(s11, (r0.xyz).xy, (r0.xyz).z));
	r0.y = -r0.x + c24.w;
	r0.y = (c109.y * r0.y) + r0.x;
	r3.w = clamp(mix(r0.y, r0.x, r2.w), 0.0, 1.0);
	r0.yzw = r3.www * r3.xyz;
	r3 = s3_texture.sample(s3, v0.xy);
	r3.z = (r3.y * c27.z) + c27.w;
	r3.z = fract(r3.z);
	r3.z = (r3.z * c22.z) + c22.w;
	r4.xy = float2(cos(r3.z), sin(r3.z));
	r5 = s1_texture.sample(s1, v0.xy);
	r5.xyz = (r5.xyz * c24.xxx) + c24.yyy;
	r6.x = dot(v2.xyz, r5.xyz);
	r6.y = dot(v3.xyz, r5.xyz);
	r6.z = dot(v4.xyz, r5.xyz);
	r5.xyz = normalize(r6.xyz);
	r6.xyz = r5.zxy * v8.yzx;
	r6.xyz = (r5.yzx * v8.zxy) + -r6.xyz;
	r7.xyz = normalize(r6.xyz);
	r6.xyz = r5.zxy * r7.yzx;
	r6.xyz = (r5.yzx * r7.zxy) + -r6.xyz;
	r4.xzw = r4.xxx * r7.xyz;
	r7.xyz = normalize(r6.xyz);
	r4.xyz = (r4.yyy * r7.xyz) + r4.xzw;
	r6.xyz = normalize(r4.xyz);
	r4.xyz = c21.xyz + -v5.xyz;
	r7.xyz = normalize(r4.xyz);
	r3.z = dot(r7.xyz, r6.xxx);
	r4.x = (r3.z * -r3.z) + c24.w;
	r4.x = ((r4.x == 0.0) ? FLT_MAX : rsqrt(abs(r4.x)));
	r4.x = ((r4.x == 0.0) ? FLT_MAX : 1.0 / r4.x);
	r4.yzw = c3.xyz + -v5.xyz;
	r6.w = dot(r4.yzw, r4.yzw);
	r6.w = ((r6.w == 0.0) ? FLT_MAX : rsqrt(abs(r6.w)));
	r8.xyz = r4.yzw * r6.www;
	r7.w = dot(r8.xyz, r6.xyz);
	r8.w = (r7.w * -r7.w) + c24.w;
	r8.w = ((r8.w == 0.0) ? FLT_MAX : rsqrt(abs(r8.w)));
	r8.w = ((r8.w == 0.0) ? FLT_MAX : 1.0 / r8.w);
	r4.x = r4.x * r8.w;
	r3.z = clamp((r7.w * r3.z) + r4.x, 0.0, 1.0);
	r9.xyz = (r4.yzw * r6.www) + r7.xyz;
	r4.xyz = (r4.yzw * r6.www) + r2.xyz;
	r2.x = dot(r2.xyz, r5.xyz);
	r10.xyz = normalize(r4.xyz);
	r2.y = clamp(dot(r5.xyz, r10.xyz), 0.0, 1.0);
	r4.xyz = normalize(r9.xyz);
	r2.z = clamp(dot(r5.xyz, r4.xyz), 0.0, 1.0);
	r4.zw = c24.zw;
	r3.y = ((-r3.y >= 0.0) ? r4.z : c10.w);
	r9.x = mix(r2.z, r3.z, r3.y);
	r10 = s10_texture.sample(s10, v0.xy);
	r9.w = r10.w;
	r11 = s7_texture.sample(s7, r9.xw);
	r2.z = clamp(dot(r8.xyz, r7.xyz), 0.0, 1.0);
	r9.z = clamp(dot(r8.xyz, r5.xyz), 0.0, 1.0);
	r3.z = r9.z * r9.z;
	r12.w = r3.z * r3.z;
	r3.z = -r3.w + c24.w;
	r3.w = r12.w * r3.z;
	r4.xyz = r3.www * v6.xyz;
	r12.xyz = r4.xyz * c23.xxx;
	r12 = ((-r3.z >= 0.0) ? c24.zzzz : r12);
	r2.z = r2.z * r12.w;
	r4.xyz = (r2.zzz * c23.xxx) + -r11.xyz;
	r4.xyz = (r3.zzz * r4.xyz) + r11.xyz;
	r4.xyz = ((-r3.z >= 0.0) ? r11.xyz : r4.xyz);
	r2.z = clamp(dot(r5.xyz, r7.xyz), 0.0, 1.0);
	r3.w = clamp(r7.z, 0.0, 1.0);
	r3.w = (r3.w * r3.w) + r3.w;
	r3.w = r3.w * c22.x;
	r6.w = ((r2.z == 0.0) ? FLT_MAX : rsqrt(abs(r2.z)));
	r6.w = ((r6.w == 0.0) ? FLT_MAX : 1.0 / r6.w);
	r4.xyz = r4.xyz * r6.www;
	r7.xyz = c20.xyz * v1.xxx;
	r4.xyz = (r4.xyz * r7.xyz) + r12.xyz;
	r7.w = clamp(r2.x, 0.0, 1.0);
	r2.x = clamp(r2.x + c28.w, 0.0, 1.0);
	r2.x = r2.x * r2.w;
	r7.w = ((r7.w == 0.0) ? FLT_MAX : rsqrt(abs(r7.w)));
	r7.w = ((r7.w == 0.0) ? FLT_MAX : 1.0 / r7.w);
	r9.y = mix(r2.y, c24.w, r3.y);
	r11 = s7_texture.sample(s7, r9.yw);
	r12 = s4_texture.sample(s4, r9.zw);
	r2.y = -r9.z + c24.w;
	r8.w = pow(abs(r2.y), c105.x);
	r9.yzw = r7.www * r11.xyz;
	r0.yzw = (r9.yzw * r0.yzw) + r4.xyz;
	r0.yzw = r5.www * r0.yzw;
	r2.y = mix(c10.x, c10.y, r10.y);
	r0.yzw = r0.yzw * r2.yyy;
	r4.xyz = r5.xyz * r6.yzx;
	r4.xyz = (r6.xyz * r5.yzx) + -r4.xyz;
	r9.yzw = r6.yzx * r4.xyz;
	r4.xyz = (r4.zxy * r6.zxy) + -r9.yzw;
	r2.y = dot(r4.xyz, r4.xyz);
	r2.y = ((r2.y == 0.0) ? FLT_MAX : rsqrt(abs(r2.y)));
	r4.xyz = (r4.xyz * r2.yyy) + -r8.xyz;
	r4.xyz = (r3.yyy * r4.xyz) + r8.xyz;
	r2.y = dot(r5.xyz, r4.xyz);
	r2.y = r2.y + r2.y;
	r3.y = dot(r5.xyz, r5.xyz);
	r4.xyz = r4.xyz * r3.yyy;
	r4.xyz = (r2.yyy * r5.xyz) + -r4.xyz;
	r6.x = ((r4.x >= 0.0) ? c24.w : c24.z);
	r6.y = ((r4.y >= 0.0) ? c24.w : c24.z);
	r6.z = ((r4.z >= 0.0) ? c24.w : c24.z);
	r8.xyz = r4.xyz * r4.xyz;
	r4.x = ((r4.x >= 0.0) ? c24.z : c24.w);
	r4.y = ((r4.y >= 0.0) ? c24.z : c24.w);
	r4.z = ((r4.z >= 0.0) ? c24.z : c24.w);
	r4.xyz = r8.xyz * r4.xyz;
	r6.xyz = r6.xyz * r8.xyz;
	r8.xyz = r4.xxx * c5.xyz;
	r8.xyz = (r6.xxx * c4.xyz) + r8.xyz;
	r8.xyz = (r6.yyy * c6.xyz) + r8.xyz;
	r8.xyz = (r4.yyy * c7.xyz) + r8.xyz;
	r6.xyz = (r6.zzz * c8.xyz) + r8.xyz;
	r4.xyz = (r4.zzz * c9.xyz) + r6.xyz;
	r6.xyz = r3.www * r7.xyz;
	r4.xyz = r4.xyz * r6.xyz;
	r6.x = v7.w;
	r6.y = v8.w;
	r6.z = v9.w;
	r6.xyz = -r6.xyz + c21.xyz;
	r8.xyz = normalize(r6.xyz);
	r2.y = clamp(dot(-v9.xyz, r8.xyz), 0.0, 1.0);
	r2.y = (r2.y * r2.y) + r2.y;
	r2.y = r2.y * c22.x;
	r6.xyz = r2.yyy * r7.xyz;
	r8.xyz = c0.xyz * v6.xyz;
	r6.xyz = (r8.xyz * r6.xyz) + -r4.xyz;
	r2.y = clamp(dot(r5.xyz, v9.xyz), 0.0, 1.0);
	r4.xyz = (r2.yyy * r6.xyz) + r4.xyz;
	r2.y = r10.x * r12.z;
	r5.w = mix(r12.y, c24.w, r3.z);
	r2.y = r2.y * c0.w;
	r3.yzw = r2.yyy * r4.xyz;
	r0.yzw = (r0.yzw * r5.www) + r3.yzw;
	r2.y = r3.x * c12.w;
	r3.w = r3.x;
	r2.y = (r2.y * c22.y) + c22.x;
	r2.y = fract(r2.y);
	r2.y = (r2.y * c22.z) + c22.w;
	r11.xy = float2(cos(r2.y), sin(r2.y));
	r12 = s0_texture.sample(s0, v0.xy);
	r4.xyz = r12.zxy * c27.xxx;
	r4.xyz = (r12.zxy * c27.xxx) + -r4.zxy;
	r4.xyz = r11.yyy * r4.xyz;
	r4.xyz = (r12.xyz * r11.xxx) + r4.xyz;
	r2.y = -r11.x + c24.w;
	r5.w = dot(c27.xxx, r12.xyz);
	r3.xyz = r12.xyz;
	r5.w = r5.w * c27.x;
	r11.xyz = (r5.www * r2.yyy) + r4.xyz;
	r2.y = abs(c12.w);
	r11.w = c24.w;
	r3 = ((-r2.y >= 0.0) ? r3 : r11);
	r4.xyz = r3.xyz + c24.yyy;
	r4.xyz = (r10.yyy * r4.xyz) + c24.www;
	r0.yzw = r0.yzw * r4.xyz;
	r4.xyz = r3.xyz * r3.xyz;
	r4.xyz = r4.xyz * r4.xyz;
	r2.y = dot(r3.xyz, c23.yzw);
	r6.xyz = r2.yyy * r4.xyz;
	r4.x = dot(r4.xyz, c23.yzw);
	r8.xyz = mix(r3.xyz, r2.yyy, -c101.yyy);
	r2.y = r4.x + c26.x;
	r4.x = ((r4.x == 0.0) ? FLT_MAX : 1.0 / r4.x);
	r2.y = ((r2.y >= 0.0) ? r4.x : c26.y);
	r4.xyz = (r6.xyz * r2.yyy) + -r3.xyz;
	r4.xyz = (c101.yyy * r4.xyz) + r3.xyz;
	r4.xyz = ((c101.y >= 0.0) ? r4.xyz : r8.xyz);
	r2.y = abs(c101.y);
	r4.xyz = ((-r2.y >= 0.0) ? r3.xyz : r4.xyz);
	r6.x = ((r5.x >= 0.0) ? c24.z : c24.w);
	r6.y = ((r5.y >= 0.0) ? c24.z : c24.w);
	r6.z = ((r5.z >= 0.0) ? c24.z : c24.w);
	r8.xyz = r5.xyz * r5.xyz;
	r5.x = ((r5.x >= 0.0) ? c24.w : c24.z);
	r5.y = ((r5.y >= 0.0) ? c24.w : c24.z);
	r5.z = ((r5.z >= 0.0) ? c24.w : c24.z);
	r5.xyz = r8.xyz * r5.xyz;
	r6.xyz = r6.xyz * r8.xyz;
	r8.xyz = r6.xxx * c5.xyz;
	r8.xyz = (r5.xxx * c4.xyz) + r8.xyz;
	r5.xyw = (r5.yyy * c6.xyz) + r8.xyz;
	r5.xyw = (r6.yyy * c7.xyz) + r5.xyw;
	r5.xyz = (r5.zzz * c8.xyz) + r5.xyw;
	r5.xyz = (r6.zzz * c9.xyz) + r5.xyz;
	r2.y = (r2.z * r2.z) + r2.z;
	r2.z = r2.z * r9.x;
	r2.z = r8.w * r2.z;
	r2.y = r2.y * c22.x;
	r5.xyz = (r7.xyz * r2.yyy) + r5.xyz;
	r2.y = clamp(r0.x, 0.0, 1.0);
	r5.w = -r2.y + c24.w;
	r2.y = (c109.y * r5.w) + r2.y;
	r5.w = clamp(mix(r2.y, r0.x, r2.w), 0.0, 1.0);
	r1.xyz = r1.xyz * r5.www;
	r1.xyz = r1.xyz * r2.xxx;
	r1.xyz = (r1.xyz * r1.www) + r5.xyz;
	r0.x = dot(r1.xyz, c23.yzw);
	r2.xy = r0.xx + -c2.xw;
	r5.xy = -c2.xw + c2.yz;
	r0.x = ((r5.x == 0.0) ? FLT_MAX : 1.0 / r5.x);
	r1.w = ((r5.y == 0.0) ? FLT_MAX : 1.0 / r5.y);
	r1.w = clamp(r1.w * r2.y, 0.0, 1.0);
	r0.x = clamp(r0.x * r2.x, 0.0, 1.0);
	r2.x = (r0.x * c25.z) + c25.w;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r2.x;
	r2.xy = (r2.zz * r6.ww) + -c33.xw;
	r2.z = r6.w * r2.z;
	r5.xyz = r7.xyz * r2.zzz;
	r2.zw = -c33.xw + c33.yz;
	r2.z = ((r2.z == 0.0) ? FLT_MAX : 1.0 / r2.z);
	r2.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r2.xy = clamp(r2.zw * r2.xy, float2(0.0), float2(1.0));
	r2.z = (r2.x * c25.z) + c25.w;
	r2.x = r2.x * r2.x;
	r2.x = r2.x * r2.z;
	r2.z = (r2.y * c25.z) + c25.w;
	r2.y = r2.y * r2.y;
	r2.y = r2.y * r2.z;
	r2.x = r2.y * r2.x;
	r2.y = (v6.w * c11.w) + r4.w;
	r2.z = r10.x * c105.y;
	r2.y = r2.y * r2.z;
	r2.yzw = r2.yyy * r5.xyz;
	r4.w = r10.y * c101.w;
	r5.xyz = (r3.xyz * r4.www) + -c106.xyz;
	r4.w = clamp(r4.w, 0.0, 1.0);
	r5.xyz = (r4.www * r5.xyz) + c106.xyz;
	r6.xyz = r2.yzw * r5.xyz;
	r4.w = dot(r6.xyz, c23.yzw);
	r2.x = r2.x * r4.w;
	r2.x = r2.x * c106.w;
	r4.w = (r1.w * c25.z) + c25.w;
	r1.w = r1.w * r1.w;
	r1.w = (r4.w * r1.w) + r2.x;
	r0.x = r0.x * r1.w;
	r0.x = r3.w * r0.x;
	r6.xyz = mix(r3.xyz, r4.xyz, r0.xxx);
	r0.x = dot(r6.xyz, c23.yzw);
	r3.xyz = r0.xxx * c102.xyz;
	r4.yzw = c23.yzw;
	r0.x = dot(c102.xyz, r4.yzw);
	r1.w = r0.x + c26.x;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = ((r1.w >= 0.0) ? r0.x : c26.y);
	r3.xyz = (r3.xyz * r0.xxx) + -r6.xyz;
	r3.xyz = (c102.www * r3.xyz) + r6.xyz;
	r0.x = clamp(c107.w + v6.w, 0.0, 1.0);
	r3.xyz = (r3.xyz * r0.xxx) + -r6.xyz;
	r4.xyz = (r2.yzw * r5.xyz) + r1.xyz;
	r1.xyz = r1.xyz + v6.xyz;
	r0.x = dot(r4.xyz, c23.yzw);
	r0.x = r0.x + c25.x;
	r0.x = clamp(r0.x * c25.y, 0.0, 1.0);
	r1.w = (r0.x * c25.z) + c25.w;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r1.w;
	r3.xyz = (r0.xxx * r3.xyz) + r6.xyz;
	r3.xyz = r10.zzz * r3.xyz;
	r0.xyz = (r3.xyz * r1.xyz) + r0.yzw;
	r0.xyz = (r2.yzw * r5.xyz) + r0.xyz;
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

