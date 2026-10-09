#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[32];
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
	const float4 c19 = float4(2.000000000e+00, -1.000000000e+00, 0.000000000e+00, 1.000000000e+00); (void) c19;
	const float4 c22 = float4(5.000000000e-01, 1.591549367e-01, 6.283185482e+00, -3.141592741e+00); (void) c22;
	const float4 c23 = float4(5.000000000e+00, 2.989999950e-01, 5.870000124e-01, 1.140000001e-01); (void) c23;
	const float4 c24 = float4(-2.000000000e+00, 3.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c24;
	const float4 c25 = float4(-9.999999975e-07, 1.000000000e+06, -3.000000119e-01, -3.333333254e+00); (void) c25;
	const float4 c26 = float4(5.773500204e-01, -4.000000060e-01, 4.999995828e-01, 5.000000000e-01); (void) c26;
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
	#define c20 uniforms.uniforms_float4[19]
	#define c21 uniforms.uniforms_float4[20]
	#define c28 uniforms.uniforms_float4[21]
	#define c30 uniforms.uniforms_float4[22]
	#define c33 uniforms.uniforms_float4[23]
	#define c101 uniforms.uniforms_float4[24]
	#define c102 uniforms.uniforms_float4[25]
	#define c103 uniforms.uniforms_float4[26]
	#define c104 uniforms.uniforms_float4[27]
	#define c105 uniforms.uniforms_float4[28]
	#define c106 uniforms.uniforms_float4[29]
	#define c107 uniforms.uniforms_float4[30]
	#define c109 uniforms.uniforms_float4[31]
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
	r0.x = abs(c103.w);
	r1 = s3_texture.sample(s3, v0.xy);
	r0.y = (r1.y * c26.z) + c26.w;
	r0.y = fract(r0.y);
	r0.y = (r0.y * c22.z) + c22.w;
	r2.xy = float2(cos(r0.y), sin(r0.y));
	r3 = s1_texture.sample(s1, v0.xy);
	r0.yzw = (r3.xyz * c19.xxx) + c19.yyy;
	r3.x = dot(v2.xyz, r0.yzw);
	r3.y = dot(v3.xyz, r0.yzw);
	r3.z = dot(v4.xyz, r0.yzw);
	r4.xyz = normalize(r3.xyz);
	r0.yzw = r4.zxy * v8.yzx;
	r0.yzw = (r4.yzx * v8.zxy) + -r0.yzw;
	r3.xyz = normalize(r0.yzw);
	r0.yzw = r3.yzx * r4.zxy;
	r0.yzw = (r4.yzx * r3.zxy) + -r0.yzw;
	r2.xzw = r2.xxx * r3.xyz;
	r3.xyz = normalize(r0.yzw);
	r0.yzw = (r2.yyy * r3.xyz) + r2.xzw;
	r2.xyz = normalize(r0.yzw);
	r0.yzw = r4.xyz * r2.yzx;
	r0.yzw = (r2.xyz * r4.yzx) + -r0.yzw;
	r3.xyz = r2.yzx * r0.yzw;
	r0.yzw = (r0.wyz * r2.zxy) + -r3.xyz;
	r2.w = dot(r0.yzw, r0.yzw);
	r2.w = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r3.xyz = c3.xyz + -v5.xyz;
	r4.w = dot(r3.xyz, r3.xyz);
	r4.w = ((r4.w == 0.0) ? FLT_MAX : rsqrt(abs(r4.w)));
	r5.xyz = r3.xyz * r4.www;
	r0.yzw = (r0.yzw * r2.www) + -r5.xyz;
	r6.zw = c19.zw;
	r1.y = ((-r1.y >= 0.0) ? r6.z : c10.w);
	r0.yzw = (r1.yyy * r0.yzw) + r5.xyz;
	r2.w = dot(r4.xyz, r0.yzw);
	r2.w = r2.w + r2.w;
	r5.w = dot(r4.xyz, r4.xyz);
	r0.yzw = r0.yzw * r5.www;
	r0.yzw = (r2.www * r4.xyz) + -r0.yzw;
	r7 = s6_texture.sample(s6, r0.yzw);
	r6.xyz = r7.xyz * c30.zzz;
	r8.xyz = r6.xyz * r6.xyz;
	r8.xyz = r8.xyz * r8.xyz;
	r2.w = dot(r8.xyz, c23.yzw);
	r5.w = r2.w + c25.x;
	r2.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r2.w = ((r5.w >= 0.0) ? r2.w : c25.y);
	r5.w = dot(r6.xyz, c23.yzw);
	r8.xyz = r5.www * r8.xyz;
	r7.xyz = (c30.zzz * -r7.xyz) + r5.www;
	r7.xyz = (-c103.www * r7.xyz) + r6.xyz;
	r8.xyz = (r8.xyz * r2.www) + -r6.xyz;
	r8.xyz = (c103.www * r8.xyz) + r6.xyz;
	r7.xyz = ((c103.w >= 0.0) ? r8.xyz : r7.xyz);
	r6.xyz = ((-r0.x >= 0.0) ? r6.xyz : r7.xyz);
	r7 = (v5.xyzx * c19.wwwz) + c19.zzzw;
	r0.x = dot(r7, c18);
	r2.w = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r8.x = dot(r7, c15);
	r8.y = dot(r7, c16);
	r8.z = dot(r7, c17);
	r7.xyz = r2.www * r8.xyz;
	r8 = s8_texture.sample(s8, r7.xy);
	r8.xyz = ((-r0.x >= 0.0) ? c19.zzz : r8.xyz);
	r9.xyz = r8.xyz * c28.xyz;
	r7.w = c19.w;
	r7 = float4(s11_texture.sample_compare(s11, (r7.xyz).xy, (r7.xyz).z));
	r0.x = clamp(r7.x, 0.0, 1.0);
	r2.w = -r0.x + c19.w;
	r0.x = (c109.y * r2.w) + r0.x;
	r10.x = c19.w;
	r7.yzw = c14.xyz + -v5.xyz;
	r2.w = dot(r7.yzw, r7.yzw);
	r10.z = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r10.y = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r2.w = clamp(dot(c13.xyz, r10.xyz), 0.0, 1.0);
	r5.w = clamp(mix(r0.x, r7.x, r2.w), 0.0, 1.0);
	r9.xyz = r5.www * r9.xyz;
	r7.yzw = r7.yzw * r10.yyy;
	r0.x = ((r10.y == 0.0) ? FLT_MAX : 1.0 / r10.y);
	r0.x = r0.x + -c13.w;
	r5.w = dot(r7.yzw, r4.xyz);
	r7.yzw = (r3.xyz * r4.www) + r7.yzw;
	r10.xyz = normalize(r7.yzw);
	r7.y = clamp(dot(r4.xyz, r10.xyz), 0.0, 1.0);
	r10.y = mix(r7.y, c19.w, r1.y);
	r7.y = clamp(r5.w + c28.w, 0.0, 1.0);
	r5.w = clamp(r5.w, 0.0, 1.0);
	r5.w = ((r5.w == 0.0) ? FLT_MAX : rsqrt(abs(r5.w)));
	r5.w = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r7.y = r2.w * r7.y;
	r7.yzw = r9.xyz * r7.yyy;
	r9.x = ((r4.x >= 0.0) ? c19.z : c19.w);
	r9.y = ((r4.y >= 0.0) ? c19.z : c19.w);
	r9.z = ((r4.z >= 0.0) ? c19.z : c19.w);
	r11.xyz = r4.xyz * r4.xyz;
	r9.xyz = r9.xyz * r11.xyz;
	r12.xyz = r9.xxx * c5.xyz;
	r13.x = ((r4.x >= 0.0) ? c19.w : c19.z);
	r13.y = ((r4.y >= 0.0) ? c19.w : c19.z);
	r13.z = ((r4.z >= 0.0) ? c19.w : c19.z);
	r11.xyz = r11.xyz * r13.xyz;
	r12.xyz = (r11.xxx * c4.xyz) + r12.xyz;
	r11.xyw = (r11.yyy * c6.xyz) + r12.xyz;
	r9.xyw = (r9.yyy * c7.xyz) + r11.xyw;
	r9.xyw = (r11.zzz * c8.xyz) + r9.xyw;
	r9.xyz = (r9.zzz * c9.xyz) + r9.xyw;
	r11.xyz = c21.xyz + -v5.xyz;
	r12.xyz = normalize(r11.xyz);
	r8.w = clamp(dot(r4.xyz, r12.xyz), 0.0, 1.0);
	r9.w = (r8.w * r8.w) + r8.w;
	r9.w = r9.w * c22.x;
	r11.xyz = c20.xyz * v1.xxx;
	r9.xyz = (r11.xyz * r9.www) + r9.xyz;
	r13.y = c26.y;
	r9.w = r13.y * c13.w;
	r9.w = ((r9.w == 0.0) ? FLT_MAX : 1.0 / r9.w);
	r0.x = clamp(r0.x * r9.w, 0.0, 1.0);
	r7.yzw = (r7.yzw * r0.xxx) + r9.xyz;
	r0.x = r0.x * r2.w;
	r9.xyz = r0.xxx * c28.xyz;
	r8.xyz = r8.xyz * r9.xyz;
	r9.xyz = r7.yzw + v6.xyz;
	r13.xyz = r9.xyz + -c103.xxx;
	r13.xyz = clamp(r13.xyz * c103.yyy, float3(0.0), float3(1.0));
	r13.xyz = (r6.xyz * r13.xyz) + -r6.xyz;
	r0.x = r1.z * c101.x;
	r6.xyz = (r0.xxx * r13.xyz) + r6.xyz;
	r13.xyz = (r6.xyz * r6.xyz) + -r6.xyz;
	r6.xyz = (c103.zzz * r13.xyz) + r6.xyz;
	r13 = s0_texture.sample(s0, v0.xy);
	r14.xyz = r13.www * c104.xyz;
	r6.xyz = r6.xyz * r14.xyz;
	r0.x = -r7.x + c19.w;
	r0.x = (c109.y * r0.x) + r7.x;
	r1.z = clamp(mix(r0.x, r7.x, r2.w), 0.0, 1.0);
	r8.xyz = r1.zzz * r8.xyz;
	r3.xyz = (r3.xyz * r4.www) + r12.xyz;
	r14.xyz = normalize(r3.xyz);
	r0.x = clamp(dot(r4.xyz, r14.xyz), 0.0, 1.0);
	r1.z = dot(r5.xyz, r2.xyz);
	r2.x = dot(r12.xyz, r2.xxx);
	r2.y = (r1.z * -r1.z) + c19.w;
	r2.y = ((r2.y == 0.0) ? FLT_MAX : rsqrt(abs(r2.y)));
	r2.y = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r2.z = (r2.x * -r2.x) + c19.w;
	r2.z = ((r2.z == 0.0) ? FLT_MAX : rsqrt(abs(r2.z)));
	r2.z = ((r2.z == 0.0) ? FLT_MAX : 1.0 / r2.z);
	r2.y = r2.z * r2.y;
	r1.z = clamp((r1.z * r2.x) + r2.y, 0.0, 1.0);
	r10.x = mix(r0.x, r1.z, r1.y);
	r2 = s10_texture.sample(s10, v0.xy);
	r10.w = r2.w;
	r14 = s7_texture.sample(s7, r10.xw);
	r0.x = r8.w * r10.x;
	r1.y = ((r8.w == 0.0) ? FLT_MAX : rsqrt(abs(r8.w)));
	r1.y = ((r1.y == 0.0) ? FLT_MAX : 1.0 / r1.y);
	r1.z = clamp(dot(r5.xyz, r12.xyz), 0.0, 1.0);
	r10.z = clamp(dot(r5.xyz, r4.xyz), 0.0, 1.0);
	r2.w = clamp(dot(r4.xyz, v9.xyz), 0.0, 1.0);
	r3.x = clamp(r12.z, 0.0, 1.0);
	r3.x = (r3.x * r3.x) + r3.x;
	r3.x = r3.x * c22.x;
	r3.xyz = r3.xxx * r11.xyz;
	r4.x = r10.z * r10.z;
	r4.w = r4.x * r4.x;
	r1.w = -r1.w + c19.w;
	r5.x = r4.w * r1.w;
	r5.xyz = r5.xxx * v6.xyz;
	r4.xyz = r5.xyz * c23.xxx;
	r4 = ((-r1.w >= 0.0) ? c19.zzzz : r4);
	r1.z = r1.z * r4.w;
	r5.xyz = (r1.zzz * c23.xxx) + -r14.xyz;
	r5.xyz = (r1.www * r5.xyz) + r14.xyz;
	r5.xyz = ((-r1.w >= 0.0) ? r14.xyz : r5.xyz);
	r5.xyz = r1.yyy * r5.xyz;
	r4.xyz = (r5.xyz * r11.xyz) + r4.xyz;
	r12 = s7_texture.sample(s7, r10.yw);
	r14 = s4_texture.sample(s4, r10.zw);
	r1.z = -r10.z + c19.w;
	r4.w = pow(abs(r1.z), c105.x);
	r0.x = r0.x * r4.w;
	r5.xyz = r5.www * r12.xyz;
	r4.xyz = (r5.xyz * r8.xyz) + r4.xyz;
	r4.xyz = r3.www * r4.xyz;
	r1.z = mix(c10.x, c10.y, r2.y);
	r4.xyz = (r4.xyz * r1.zzz) + r6.xyz;
	r5.x = ((r0.y >= 0.0) ? c19.z : c19.w);
	r5.y = ((r0.z >= 0.0) ? c19.z : c19.w);
	r5.z = ((r0.w >= 0.0) ? c19.z : c19.w);
	r6.xyz = r0.yzw * r0.yzw;
	r0.y = ((r0.y >= 0.0) ? c19.w : c19.z);
	r0.z = ((r0.z >= 0.0) ? c19.w : c19.z);
	r0.w = ((r0.w >= 0.0) ? c19.w : c19.z);
	r0.yzw = r6.xyz * r0.yzw;
	r5.xyz = r5.xyz * r6.xyz;
	r6.xyz = r5.xxx * c5.xyz;
	r6.xyz = (r0.yyy * c4.xyz) + r6.xyz;
	r6.xyz = (r0.zzz * c6.xyz) + r6.xyz;
	r5.xyw = (r5.yyy * c7.xyz) + r6.xyz;
	r0.yzw = (r0.www * c8.xyz) + r5.xyw;
	r0.yzw = (r5.zzz * c9.xyz) + r0.yzw;
	r0.yzw = r3.xyz * r0.yzw;
	r3.x = v7.w;
	r3.y = v8.w;
	r3.z = v9.w;
	r3.xyz = -r3.xyz + c21.xyz;
	r5.xyz = normalize(r3.xyz);
	r1.z = clamp(dot(-v9.xyz, r5.xyz), 0.0, 1.0);
	r1.z = (r1.z * r1.z) + r1.z;
	r1.z = r1.z * c22.x;
	r3.xyz = r1.zzz * r11.xyz;
	r5.xyz = c0.xyz * v6.xyz;
	r3.xyz = (r5.xyz * r3.xyz) + -r0.yzw;
	r0.yzw = (r2.www * r3.xyz) + r0.yzw;
	r1.z = r2.x * r14.z;
	r2.w = mix(r14.y, c19.w, r1.w);
	r1.z = r1.z * c0.w;
	r0.yzw = r0.yzw * r1.zzz;
	r0.yzw = (r4.xyz * r2.www) + r0.yzw;
	r1.z = r1.x * c12.w;
	r13.w = r1.x;
	r1.x = (r1.z * c22.y) + c22.x;
	r1.x = fract(r1.x);
	r1.x = (r1.x * c22.z) + c22.w;
	r3.xy = float2(cos(r1.x), sin(r1.x));
	r1.xzw = r13.zxy * c26.xxx;
	r1.xzw = (r13.zxy * c26.xxx) + -r1.wxz;
	r1.xzw = r3.yyy * r1.xzw;
	r1.xzw = (r13.xyz * r3.xxx) + r1.xzw;
	r2.w = -r3.x + c19.w;
	r3.x = dot(c26.xxx, r13.xyz);
	r3.x = r3.x * c26.x;
	r3.xyz = (r3.xxx * r2.www) + r1.xzw;
	r1.x = abs(c12.w);
	r3.w = c19.w;
	r3 = ((-r1.x >= 0.0) ? r13 : r3);
	r1.xzw = r3.xyz + c19.yyy;
	r1.xzw = (r2.yyy * r1.xzw) + c19.www;
	r0.yzw = r0.yzw * r1.xzw;
	r1.xzw = r3.xyz * r3.xyz;
	r1.xzw = r1.xzw * r1.xzw;
	r2.w = dot(r3.xyz, c23.yzw);
	r4.xyz = r1.xzw * r2.www;
	r1.x = dot(r1.xzw, c23.yzw);
	r5.xyz = mix(r3.xyz, r2.www, -c101.yyy);
	r1.z = r1.x + c25.x;
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.x = ((r1.z >= 0.0) ? r1.x : c25.y);
	r1.xzw = (r4.xyz * r1.xxx) + -r3.xyz;
	r1.xzw = (c101.yyy * r1.xzw) + r3.xyz;
	r1.xzw = ((c101.y >= 0.0) ? r1.xzw : r5.xyz);
	r2.w = abs(c101.y);
	r1.xzw = ((-r2.w >= 0.0) ? r3.xyz : r1.xzw);
	r4.xy = (r0.xx * r1.yy) + -c33.xw;
	r0.x = r1.y * r0.x;
	r5.xyz = r11.xyz * r0.xxx;
	r4.zw = -c33.xw + c33.yz;
	r0.x = ((r4.z == 0.0) ? FLT_MAX : 1.0 / r4.z);
	r1.y = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r1.y = clamp(r1.y * r4.y, 0.0, 1.0);
	r0.x = clamp(r0.x * r4.x, 0.0, 1.0);
	r2.w = (r0.x * c24.x) + c24.y;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r2.w;
	r2.w = (r1.y * c24.x) + c24.y;
	r1.y = r1.y * r1.y;
	r1.y = r1.y * r2.w;
	r0.x = r0.x * r1.y;
	r1.y = (v6.w * c11.w) + r6.w;
	r2.x = r2.x * c105.y;
	r1.y = r1.y * r2.x;
	r4.xyz = r1.yyy * r5.xyz;
	r1.y = r2.y * c101.w;
	r2.xyw = (r3.xyz * r1.yyy) + -c106.xyz;
	r1.y = clamp(r1.y, 0.0, 1.0);
	r2.xyw = (r1.yyy * r2.xyw) + c106.xyz;
	r5.xyz = r2.xyw * r4.xyz;
	r1.y = dot(r5.xyz, c23.yzw);
	r0.x = r0.x * r1.y;
	r0.x = r0.x * c106.w;
	r1.y = dot(r7.yzw, c23.yzw);
	r5.xyz = (r4.xyz * r2.xyw) + r7.yzw;
	r4.w = dot(r5.xyz, c23.yzw);
	r4.w = r4.w + c25.z;
	r4.w = clamp(r4.w * c25.w, 0.0, 1.0);
	r5.xy = r1.yy + -c2.xw;
	r5.zw = -c2.xw + c2.yz;
	r1.y = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r5.z = ((r5.z == 0.0) ? FLT_MAX : 1.0 / r5.z);
	r5.x = clamp(r5.z * r5.x, 0.0, 1.0);
	r1.y = clamp(r1.y * r5.y, 0.0, 1.0);
	r5.y = (r1.y * c24.x) + c24.y;
	r1.y = r1.y * r1.y;
	r0.x = (r5.y * r1.y) + r0.x;
	r1.y = (r5.x * c24.x) + c24.y;
	r5.x = r5.x * r5.x;
	r1.y = r1.y * r5.x;
	r0.x = r0.x * r1.y;
	r0.x = r3.w * r0.x;
	r5.xyz = mix(r3.xyz, r1.xzw, r0.xxx);
	r0.x = dot(r5.xyz, c23.yzw);
	r1.xyz = r0.xxx * c102.xyz;
	r3.yzw = c23.yzw;
	r0.x = dot(c102.xyz, r3.yzw);
	r1.w = r0.x + c25.x;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = ((r1.w >= 0.0) ? r0.x : c25.y);
	r1.xyz = (r1.xyz * r0.xxx) + -r5.xyz;
	r1.xyz = (c102.www * r1.xyz) + r5.xyz;
	r0.x = clamp(c107.w + v6.w, 0.0, 1.0);
	r1.xyz = (r1.xyz * r0.xxx) + -r5.xyz;
	r0.x = (r4.w * c24.x) + c24.y;
	r1.w = r4.w * r4.w;
	r0.x = r0.x * r1.w;
	r1.xyz = (r0.xxx * r1.xyz) + r5.xyz;
	r1.xyz = r2.zzz * r1.xyz;
	r0.xyz = (r1.xyz * r9.xyz) + r0.yzw;
	r0.xyz = (r4.xyz * r2.xyw) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	oC0.xyz = r0.xyz * c30.xxx;
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
	#undef c20
	#undef c21
	#undef c28
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

