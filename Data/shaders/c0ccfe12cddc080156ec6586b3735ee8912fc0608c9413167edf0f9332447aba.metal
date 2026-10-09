#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[30];
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
	texture2d<float> s10_texture [[texture(10)]],
	sampler s10 [[sampler(10)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c13 = float4(5.000000000e-01, 1.591549367e-01, 6.283185482e+00, -3.141592741e+00); (void) c13;
	const float4 c14 = float4(5.773500204e-01, 4.999995828e-01, 5.000000000e-01, 5.000000000e+00); (void) c14;
	const float4 c15 = float4(2.000000000e+00, -1.000000000e+00, 0.000000000e+00, 1.000000000e+00); (void) c15;
	const float4 c16 = float4(-2.000000000e+00, 3.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c16;
	const float4 c17 = float4(1.000000000e+06, -3.000000119e-01, -3.333333254e+00, 0.000000000e+00); (void) c17;
	const float4 c18 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -9.999999975e-07); (void) c18;
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
	#define c29 uniforms.uniforms_float4[20]
	#define c30 uniforms.uniforms_float4[21]
	#define c33 uniforms.uniforms_float4[22]
	#define c101 uniforms.uniforms_float4[23]
	#define c102 uniforms.uniforms_float4[24]
	#define c103 uniforms.uniforms_float4[25]
	#define c104 uniforms.uniforms_float4[26]
	#define c105 uniforms.uniforms_float4[27]
	#define c106 uniforms.uniforms_float4[28]
	#define c107 uniforms.uniforms_float4[29]
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
	r0.xyz = c23.xyz + -v5.xyz;
	r1.xyz = normalize(r0.xyz);
	r0 = s3_texture.sample(s3, v0.xy);
	r1.w = (r0.y * c14.y) + c14.z;
	r1.w = fract(r1.w);
	r1.w = (r1.w * c13.z) + c13.w;
	r2.xy = float2(cos(r1.w), sin(r1.w));
	r3 = s1_texture.sample(s1, v0.xy);
	r3.xyz = (r3.xyz * c15.xxx) + c15.yyy;
	r4.x = dot(v2.xyz, r3.xyz);
	r4.y = dot(v3.xyz, r3.xyz);
	r4.z = dot(v4.xyz, r3.xyz);
	r3.xyz = normalize(r4.xyz);
	r4.xyz = r3.zxy * v8.yzx;
	r4.xyz = (r3.yzx * v8.zxy) + -r4.xyz;
	r5.xyz = normalize(r4.xyz);
	r4.xyz = r3.zxy * r5.yzx;
	r4.xyz = (r3.yzx * r5.zxy) + -r4.xyz;
	r2.xzw = r2.xxx * r5.xyz;
	r5.xyz = normalize(r4.xyz);
	r2.xyz = (r2.yyy * r5.xyz) + r2.xzw;
	r4.xyz = normalize(r2.xyz);
	r1.w = dot(r1.xyz, r4.xxx);
	r2.x = (r1.w * -r1.w) + c15.w;
	r2.x = ((r2.x == 0.0) ? FLT_MAX : rsqrt(abs(r2.x)));
	r2.x = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r2.yzw = c3.xyz + -v5.xyz;
	r4.w = dot(r2.yzw, r2.yzw);
	r4.w = ((r4.w == 0.0) ? FLT_MAX : rsqrt(abs(r4.w)));
	r5.xyz = r2.yzw * r4.www;
	r5.w = dot(r5.xyz, r4.xyz);
	r6.x = (r5.w * -r5.w) + c15.w;
	r6.x = ((r6.x == 0.0) ? FLT_MAX : rsqrt(abs(r6.x)));
	r6.x = ((r6.x == 0.0) ? FLT_MAX : 1.0 / r6.x);
	r2.x = r2.x * r6.x;
	r1.w = clamp((r5.w * r1.w) + r2.x, 0.0, 1.0);
	r6.yzw = (r2.yzw * r4.www) + r1.xyz;
	r7.xyz = normalize(r6.yzw);
	r2.x = clamp(dot(r3.xyz, r7.xyz), 0.0, 1.0);
	r6.zw = c15.zw;
	r0.y = ((-r0.y >= 0.0) ? r6.z : c10.w);
	r7.x = mix(r2.x, r1.w, r0.y);
	r8 = s10_texture.sample(s10, v0.xy);
	r7.w = r8.w;
	r9 = s7_texture.sample(s7, r7.xw);
	r1.w = clamp(dot(r5.xyz, r1.xyz), 0.0, 1.0);
	r1.x = clamp(dot(r3.xyz, r1.xyz), 0.0, 1.0);
	r7.z = clamp(dot(r5.xyz, r3.xyz), 0.0, 1.0);
	r1.y = r7.z * r7.z;
	r10.w = r1.y * r1.y;
	r0.w = -r0.w + c15.w;
	r1.y = r10.w * r0.w;
	r11.xyz = r1.yyy * v6.xyz;
	r10.xyz = r11.xyz * c14.www;
	r10 = ((-r0.w >= 0.0) ? c15.zzzz : r10);
	r1.y = r1.w * r10.w;
	r1.yzw = (r1.yyy * c14.www) + -r9.xyz;
	r1.yzw = (r0.www * r1.yzw) + r9.xyz;
	r1.yzw = ((-r0.w >= 0.0) ? r9.xyz : r1.yzw);
	r2.x = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r2.x = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r1.yzw = r1.yzw * r2.xxx;
	r9.xyz = c21.xyz + -v5.xyz;
	r11.xyz = normalize(r9.xyz);
	r6.y = dot(r11.xyz, r4.xxx);
	r6.z = (r6.y * -r6.y) + c15.w;
	r6.z = ((r6.z == 0.0) ? FLT_MAX : rsqrt(abs(r6.z)));
	r6.z = ((r6.z == 0.0) ? FLT_MAX : 1.0 / r6.z);
	r6.z = r6.z * r6.x;
	r6.y = clamp((r5.w * r6.y) + r6.z, 0.0, 1.0);
	r9.xyz = (r2.yzw * r4.www) + r11.xyz;
	r12.xyz = normalize(r9.xyz);
	r6.z = clamp(dot(r3.xyz, r12.xyz), 0.0, 1.0);
	r7.y = mix(r6.z, r6.y, r0.y);
	r9 = s7_texture.sample(s7, r7.yw);
	r6.y = clamp(dot(r5.xyz, r11.xyz), 0.0, 1.0);
	r6.y = r6.y * r10.w;
	r12.xyz = (r6.yyy * c14.www) + -r9.xyz;
	r12.xyz = (r0.www * r12.xyz) + r9.xyz;
	r9.xyz = ((-r0.w >= 0.0) ? r9.xyz : r12.xyz);
	r6.y = clamp(dot(r3.xyz, r11.xyz), 0.0, 1.0);
	r6.z = clamp(r11.z, 0.0, 1.0);
	r6.z = (r6.z * r6.z) + r6.z;
	r6.z = r6.z * c13.x;
	r8.w = ((r6.y == 0.0) ? FLT_MAX : rsqrt(abs(r6.y)));
	r8.w = ((r8.w == 0.0) ? FLT_MAX : 1.0 / r8.w);
	r9.xyz = r8.www * r9.xyz;
	r11.xyz = c20.xyz * v1.xxx;
	r9.xyz = (r9.xyz * r11.xyz) + r10.xyz;
	r10.xyz = c22.xyz * v1.yyy;
	r1.yzw = (r1.yzw * r10.xyz) + r9.xyz;
	r9.xyz = c25.xyz + -v5.xyz;
	r12.xyz = normalize(r9.xyz);
	r9.x = dot(r12.xyz, r4.xxx);
	r9.y = (r9.x * -r9.x) + c15.w;
	r9.y = ((r9.y == 0.0) ? FLT_MAX : rsqrt(abs(r9.y)));
	r9.y = ((r9.y == 0.0) ? FLT_MAX : 1.0 / r9.y);
	r9.y = r6.x * r9.y;
	r9.x = clamp((r5.w * r9.x) + r9.y, 0.0, 1.0);
	r9.yzw = (r2.yzw * r4.www) + r12.xyz;
	r13.xyz = normalize(r9.yzw);
	r9.y = clamp(dot(r3.xyz, r13.xyz), 0.0, 1.0);
	r13.y = mix(r9.y, r9.x, r0.y);
	r13.z = r7.w;
	r9 = s4_texture.sample(s4, r7.zw);
	r7.z = -r7.z + c15.w;
	r9.x = pow(abs(r7.z), c105.x);
	r14 = s7_texture.sample(s7, r13.yz);
	r7.z = clamp(dot(r5.xyz, r12.xyz), 0.0, 1.0);
	r7.w = clamp(dot(r3.xyz, r12.xyz), 0.0, 1.0);
	r7.z = r7.z * r10.w;
	r12.xyz = (r7.zzz * c14.www) + -r14.xyz;
	r12.xyz = (r0.www * r12.xyz) + r14.xyz;
	r12.xyz = ((-r0.w >= 0.0) ? r14.xyz : r12.xyz);
	r7.z = ((r7.w == 0.0) ? FLT_MAX : rsqrt(abs(r7.w)));
	r7.z = ((r7.z == 0.0) ? FLT_MAX : 1.0 / r7.z);
	r12.xyz = r7.zzz * r12.xyz;
	r14.xyz = c24.xyz * v1.zzz;
	r1.yzw = (r12.xyz * r14.xyz) + r1.yzw;
	r12.x = c23.w + -v5.x;
	r12.y = c24.w + -v5.y;
	r12.z = c25.w + -v5.z;
	r15.xyz = normalize(r12.xyz);
	r9.w = dot(r15.xyz, r4.xxx);
	r11.w = (r9.w * -r9.w) + c15.w;
	r11.w = ((r11.w == 0.0) ? FLT_MAX : rsqrt(abs(r11.w)));
	r11.w = ((r11.w == 0.0) ? FLT_MAX : 1.0 / r11.w);
	r6.x = r6.x * r11.w;
	r5.w = clamp((r5.w * r9.w) + r6.x, 0.0, 1.0);
	r12.xyz = (r2.yzw * r4.www) + r15.xyz;
	r16.xyz = normalize(r12.xyz);
	r6.x = clamp(dot(r3.xyz, r16.xyz), 0.0, 1.0);
	r13.x = mix(r6.x, r5.w, r0.y);
	r12 = s7_texture.sample(s7, r13.xz);
	r5.w = clamp(dot(r5.xyz, r15.xyz), 0.0, 1.0);
	r6.x = clamp(dot(r3.xyz, r15.xyz), 0.0, 1.0);
	r5.w = r5.w * r10.w;
	r15.xyz = (r5.www * c14.www) + -r12.xyz;
	r15.xyz = (r0.www * r15.xyz) + r12.xyz;
	r12.xyz = ((-r0.w >= 0.0) ? r12.xyz : r15.xyz);
	r5.w = mix(r9.y, c15.w, r0.w);
	r0.w = r8.x * r9.z;
	r0.w = r0.w * c0.w;
	r9.y = ((r6.x == 0.0) ? FLT_MAX : rsqrt(abs(r6.x)));
	r9.y = ((r9.y == 0.0) ? FLT_MAX : 1.0 / r9.y);
	r12.xyz = r9.yyy * r12.xyz;
	r15.x = c20.w * v1.w;
	r15.y = c21.w * v1.w;
	r15.z = c22.w * v1.w;
	r1.yzw = (r12.xyz * r15.xyz) + r1.yzw;
	r1.yzw = r3.www * r1.yzw;
	r12.xyz = r3.xyz * r4.yzx;
	r12.xyz = (r4.xyz * r3.yzx) + -r12.xyz;
	r16.xyz = r4.yzx * r12.xyz;
	r4.xyz = (r12.zxy * r4.zxy) + -r16.xyz;
	r3.w = dot(r4.xyz, r4.xyz);
	r3.w = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r4.xyz = (r4.xyz * r3.www) + -r5.xyz;
	r4.xyz = (r0.yyy * r4.xyz) + r5.xyz;
	r0.y = dot(r3.xyz, r4.xyz);
	r0.y = r0.y + r0.y;
	r3.w = dot(r3.xyz, r3.xyz);
	r4.xyz = r4.xyz * r3.www;
	r4.xyz = (r0.yyy * r3.xyz) + -r4.xyz;
	r12 = s6_texture.sample(s6, r4.xyz);
	r5.xyz = r12.xyz * c30.zzz;
	r16.xyz = r5.xyz * r5.xyz;
	r16.xyz = r16.xyz * r16.xyz;
	r0.y = dot(r16.xyz, c18.xyz);
	r3.w = r0.y + c18.w;
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r0.y = ((r3.w >= 0.0) ? r0.y : c17.x);
	r3.w = dot(r5.xyz, c18.xyz);
	r16.xyz = r3.www * r16.xyz;
	r12.xyz = (c30.zzz * -r12.xyz) + r3.www;
	r12.xyz = (-c103.www * r12.xyz) + r5.xyz;
	r16.xyz = (r16.xyz * r0.yyy) + -r5.xyz;
	r16.xyz = (c103.www * r16.xyz) + r5.xyz;
	r12.xyz = ((c103.w >= 0.0) ? r16.xyz : r12.xyz);
	r0.y = abs(c103.w);
	r5.xyz = ((-r0.y >= 0.0) ? r5.xyz : r12.xyz);
	r12.x = ((r3.x >= 0.0) ? c15.z : c15.w);
	r12.y = ((r3.y >= 0.0) ? c15.z : c15.w);
	r12.z = ((r3.z >= 0.0) ? c15.z : c15.w);
	r16.xyz = r3.xyz * r3.xyz;
	r12.xyz = r12.xyz * r16.xyz;
	r17.xyz = r12.xxx * c5.xyz;
	r18.x = ((r3.x >= 0.0) ? c15.w : c15.z);
	r18.y = ((r3.y >= 0.0) ? c15.w : c15.z);
	r18.z = ((r3.z >= 0.0) ? c15.w : c15.z);
	r16.xyz = r16.xyz * r18.xyz;
	r17.xyz = (r16.xxx * c4.xyz) + r17.xyz;
	r16.xyw = (r16.yyy * c6.xyz) + r17.xyz;
	r12.xyw = (r12.yyy * c7.xyz) + r16.xyw;
	r12.xyw = (r16.zzz * c8.xyz) + r12.xyw;
	r12.xyz = (r12.zzz * c9.xyz) + r12.xyw;
	r0.y = (r6.y * r6.y) + r6.y;
	r3.w = r6.y * r7.y;
	r3.w = r9.x * r3.w;
	r0.y = r0.y * c13.x;
	r12.xyz = (r11.xyz * r0.yyy) + r12.xyz;
	r0.y = (r1.x * r1.x) + r1.x;
	r1.x = r1.x * r7.x;
	r1.x = r9.x * r1.x;
	r1.x = r2.x * r1.x;
	r0.y = r0.y * c13.x;
	r12.xyz = (r10.xyz * r0.yyy) + r12.xyz;
	r10.xyz = r10.xyz * r1.xxx;
	r0.y = (r3.w * r8.w) + r1.x;
	r1.x = r8.w * r3.w;
	r10.xyz = (r1.xxx * r11.xyz) + r10.xyz;
	r1.x = (r7.w * r7.w) + r7.w;
	r2.x = r7.w * r13.y;
	r2.x = r9.x * r2.x;
	r1.x = r1.x * c13.x;
	r7.xyw = (r14.xyz * r1.xxx) + r12.xyz;
	r1.x = (r6.x * r6.x) + r6.x;
	r3.w = r6.x * r13.x;
	r3.w = r9.x * r3.w;
	r1.x = r1.x * c13.x;
	r7.xyw = (r15.xyz * r1.xxx) + r7.xyw;
	r12.xyz = r7.xyw + v6.xyz;
	r13.xyz = r12.xyz + -c103.xxx;
	r13.xyz = clamp(r13.xyz * c103.yyy, float3(0.0), float3(1.0));
	r13.xyz = (r5.xyz * r13.xyz) + -r5.xyz;
	r0.z = r0.z * c101.x;
	r5.xyz = (r0.zzz * r13.xyz) + r5.xyz;
	r13.xyz = (r5.xyz * r5.xyz) + -r5.xyz;
	r5.xyz = (c103.zzz * r13.xyz) + r5.xyz;
	r13 = s0_texture.sample(s0, v0.xy);
	r16.xyz = r13.www * c104.xyz;
	r5.xyz = r5.xyz * r16.xyz;
	r0.z = mix(c10.x, c10.y, r8.y);
	r1.xyz = (r1.yzw * r0.zzz) + r5.xyz;
	r5.x = v7.w;
	r5.y = v8.w;
	r5.z = v9.w;
	r5.xyz = -r5.xyz + c21.xyz;
	r16.xyz = normalize(r5.xyz);
	r0.z = clamp(dot(-v9.xyz, r16.xyz), 0.0, 1.0);
	r0.z = (r0.z * r0.z) + r0.z;
	r0.z = r0.z * c13.x;
	r5.xyz = r0.zzz * r11.xyz;
	r6.xyz = r6.zzz * r11.xyz;
	r11.x = ((r4.x >= 0.0) ? c15.z : c15.w);
	r11.y = ((r4.y >= 0.0) ? c15.z : c15.w);
	r11.z = ((r4.z >= 0.0) ? c15.z : c15.w);
	r16.xyz = r4.xyz * r4.xyz;
	r4.x = ((r4.x >= 0.0) ? c15.w : c15.z);
	r4.y = ((r4.y >= 0.0) ? c15.w : c15.z);
	r4.z = ((r4.z >= 0.0) ? c15.w : c15.z);
	r4.xyz = r16.xyz * r4.xyz;
	r11.xyz = r11.xyz * r16.xyz;
	r16.xyz = r11.xxx * c5.xyz;
	r16.xyz = (r4.xxx * c4.xyz) + r16.xyz;
	r16.xyz = (r4.yyy * c6.xyz) + r16.xyz;
	r11.xyw = (r11.yyy * c7.xyz) + r16.xyz;
	r4.xyz = (r4.zzz * c8.xyz) + r11.xyw;
	r4.xyz = (r11.zzz * c9.xyz) + r4.xyz;
	r4.xyz = r6.xyz * r4.xyz;
	r6.xyz = c0.xyz * v6.xyz;
	r5.xyz = (r6.xyz * r5.xyz) + -r4.xyz;
	r0.z = clamp(dot(r3.xyz, v9.xyz), 0.0, 1.0);
	r4.xyz = (r0.zzz * r5.xyz) + r4.xyz;
	r4.xyz = r0.www * r4.xyz;
	r1.xyz = (r1.xyz * r5.www) + r4.xyz;
	r0.z = r0.x * c12.w;
	r13.w = r0.x;
	r0.x = (r0.z * c13.y) + c13.x;
	r0.x = fract(r0.x);
	r0.x = (r0.x * c13.z) + c13.w;
	r5.xy = float2(cos(r0.x), sin(r0.x));
	r0.xzw = r13.zxy * c14.xxx;
	r0.xzw = (r13.zxy * c14.xxx) + -r0.wxz;
	r0.xzw = r5.yyy * r0.xzw;
	r0.xzw = (r13.xyz * r5.xxx) + r0.xzw;
	r1.w = -r5.x + c15.w;
	r4.x = dot(c14.xxx, r13.xyz);
	r4.x = r4.x * c14.x;
	r5.xyz = (r4.xxx * r1.www) + r0.xzw;
	r0.x = abs(c12.w);
	r5.w = c15.w;
	r5 = ((-r0.x >= 0.0) ? r13 : r5);
	r0.xzw = r5.xyz + c15.yyy;
	r0.xzw = (r8.yyy * r0.xzw) + c15.www;
	r0.xzw = r0.xzw * r1.xyz;
	r1.xyz = r5.xyz * r5.xyz;
	r1.xyz = r1.xyz * r1.xyz;
	r1.w = dot(r5.xyz, c18.xyz);
	r4.xyz = r1.www * r1.xyz;
	r1.x = dot(r1.xyz, c18.xyz);
	r6.xyz = mix(r5.xyz, r1.www, -c101.yyy);
	r1.y = r1.x + c18.w;
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.x = ((r1.y >= 0.0) ? r1.x : c17.x);
	r1.xyz = (r4.xyz * r1.xxx) + -r5.xyz;
	r1.xyz = (c101.yyy * r1.xyz) + r5.xyz;
	r1.xyz = ((c101.y >= 0.0) ? r1.xyz : r6.xyz);
	r1.w = abs(c101.y);
	r1.xyz = ((-r1.w >= 0.0) ? r5.xyz : r1.xyz);
	r1.w = r7.z * r2.x;
	r0.y = (r2.x * r7.z) + r0.y;
	r0.y = (r3.w * r9.y) + r0.y;
	r2.x = r9.y * r3.w;
	r4.xy = r0.yy + -c33.xw;
	r6.xyz = (r1.www * r14.xyz) + r10.xyz;
	r6.xyz = (r2.xxx * r15.xyz) + r6.xyz;
	r0.y = (v6.w * c11.w) + r6.w;
	r1.w = r8.x * c105.y;
	r0.y = r0.y * r1.w;
	r6.xyz = r0.yyy * r6.xyz;
	r0.y = r8.y * c101.w;
	r9.yzw = (r5.xyz * r0.yyy) + -c106.xyz;
	r0.y = clamp(r0.y, 0.0, 1.0);
	r9.yzw = (r0.yyy * r9.yzw) + c106.xyz;
	r10.xyz = r6.xyz * r9.yzw;
	r0.y = dot(r10.xyz, c18.xyz);
	r8.yw = -c33.xw + c33.yz;
	r1.w = ((r8.y == 0.0) ? FLT_MAX : 1.0 / r8.y);
	r2.x = ((r8.w == 0.0) ? FLT_MAX : 1.0 / r8.w);
	r2.x = clamp(r2.x * r4.y, 0.0, 1.0);
	r1.w = clamp(r1.w * r4.x, 0.0, 1.0);
	r3.w = (r1.w * c16.x) + c16.y;
	r1.w = r1.w * r1.w;
	r1.w = r1.w * r3.w;
	r3.w = (r2.x * c16.x) + c16.y;
	r2.x = r2.x * r2.x;
	r2.x = r2.x * r3.w;
	r1.w = r1.w * r2.x;
	r0.y = r0.y * r1.w;
	r0.y = r0.y * c106.w;
	r1.w = dot(r7.xyw, c18.xyz);
	r4.xyz = (r6.xyz * r9.yzw) + r7.xyw;
	r2.x = dot(r4.xyz, c18.xyz);
	r2.x = r2.x + c17.y;
	r2.x = clamp(r2.x * c17.z, 0.0, 1.0);
	r4.xy = r1.ww + -c2.xw;
	r7.xy = -c2.xw + c2.yz;
	r1.w = ((r7.y == 0.0) ? FLT_MAX : 1.0 / r7.y);
	r3.w = ((r7.x == 0.0) ? FLT_MAX : 1.0 / r7.x);
	r3.w = clamp(r3.w * r4.x, 0.0, 1.0);
	r1.w = clamp(r1.w * r4.y, 0.0, 1.0);
	r4.x = (r1.w * c16.x) + c16.y;
	r1.w = r1.w * r1.w;
	r0.y = (r4.x * r1.w) + r0.y;
	r1.w = (r3.w * c16.x) + c16.y;
	r3.w = r3.w * r3.w;
	r1.w = r1.w * r3.w;
	r0.y = r0.y * r1.w;
	r0.y = r5.w * r0.y;
	r4.xyz = mix(r5.xyz, r1.xyz, r0.yyy);
	r0.y = dot(r4.xyz, c18.xyz);
	r1.xyz = r0.yyy * c102.xyz;
	r5.xyz = c18.xyz;
	r0.y = dot(c102.xyz, r5.xyz);
	r1.w = r0.y + c18.w;
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r0.y = ((r1.w >= 0.0) ? r0.y : c17.x);
	r1.xyz = (r1.xyz * r0.yyy) + -r4.xyz;
	r1.xyz = (c102.www * r1.xyz) + r4.xyz;
	r0.y = clamp(c107.w + v6.w, 0.0, 1.0);
	r1.xyz = (r1.xyz * r0.yyy) + -r4.xyz;
	r0.y = (r2.x * c16.x) + c16.y;
	r1.w = r2.x * r2.x;
	r0.y = r0.y * r1.w;
	r1.xyz = (r0.yyy * r1.xyz) + r4.xyz;
	r1.xyz = r8.zzz * r1.xyz;
	r0.xyz = (r1.xyz * r12.xyz) + r0.xzw;
	r0.xyz = (r6.xyz * r9.yzw) + r0.xyz;
	r1.x = v2.w;
	r1.y = v3.w;
	r1.z = v4.w;
	r2.xyz = (r2.yzw * r4.www) + r1.xyz;
	r0.w = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r0.w = clamp((r0.w * c19.w) + c19.x, 0.0, 1.0);
	r1.w = min(r0.w, c19.z);
	r0.w = r1.w * r1.w;
	r1.x = clamp(dot(r3.xyz, r1.xyz), 0.0, 1.0);
	r4.xyz = normalize(r2.xyz);
	r1.y = clamp(dot(r3.xyz, r4.xyz), 0.0, 1.0);
	r1.y = r1.x * r1.y;
	r1.x = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.y = r9.x * r1.y;
	r1.x = r1.x * r1.y;
	r1.yzw = v6.www * v6.xyz;
	r1.yzw = r1.yzw * c107.xyz;
	r1.xyz = r1.yzw * r1.xxx;
	r0.xyz = (r1.xyz * r8.xxx) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	oC0.xyz = (r0.www * r0.xyz) + r1.xyz;
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
	#undef c19
	#undef c20
	#undef c21
	#undef c22
	#undef c23
	#undef c24
	#undef c25
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

