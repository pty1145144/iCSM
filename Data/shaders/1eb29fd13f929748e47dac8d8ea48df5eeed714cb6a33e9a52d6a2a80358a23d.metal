#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[29];
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
	const float4 c13 = float4(1.591549367e-01, 5.000000000e-01, 6.283185482e+00, -3.141592741e+00); (void) c13;
	const float4 c14 = float4(5.773500204e-01, 1.000000000e+00, 2.000000000e+00, -1.000000000e+00); (void) c14;
	const float4 c15 = float4(1.000000000e+06, -3.000000119e-01, -3.333333254e+00, 0.000000000e+00); (void) c15;
	const float4 c16 = float4(-2.000000000e+00, 3.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c16;
	const float4 c17 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -9.999999975e-07); (void) c17;
	const float4 c18 = float4(0.000000000e+00, 1.000000000e+00, 7.963267271e-04, 9.999997020e-01); (void) c18;
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
	#define c103 uniforms.uniforms_float4[24]
	#define c104 uniforms.uniforms_float4[25]
	#define c105 uniforms.uniforms_float4[26]
	#define c106 uniforms.uniforms_float4[27]
	#define c107 uniforms.uniforms_float4[28]
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
	r0.x = r0.x + -c14.z;
	oC0.w = clamp(r0.x * c19.w, 0.0, 1.0);
	r0.xyz = c23.xyz + -v5.xyz;
	r1.xyz = normalize(r0.xyz);
	r0 = s1_texture.sample(s1, v0.xy);
	r0.xyz = (r0.xyz * c14.zzz) + c14.www;
	r2.x = dot(v2.xyz, r0.xyz);
	r2.y = dot(v3.xyz, r0.xyz);
	r2.z = dot(v4.xyz, r0.xyz);
	r0.xyz = normalize(r2.xyz);
	r2.xyz = r0.zxy * v8.yzx;
	r2.xyz = (r0.yzx * v8.zxy) + -r2.xyz;
	r3.xyz = normalize(r2.xyz);
	r2.xyz = r0.zxy * r3.yzx;
	r2.xyz = (r0.yzx * r3.zxy) + -r2.xyz;
	r3.xyz = r3.xyz * c18.zzz;
	r4.xyz = normalize(r2.xyz);
	r2.xyz = (r4.xyz * c18.www) + r3.xyz;
	r3.xyz = normalize(r2.xyz);
	r1.w = dot(r1.xyz, r3.xxx);
	r2.x = (r1.w * -r1.w) + c14.y;
	r2.x = ((r2.x == 0.0) ? FLT_MAX : rsqrt(abs(r2.x)));
	r2.x = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r2.yzw = c3.xyz + -v5.xyz;
	r3.w = dot(r2.yzw, r2.yzw);
	r3.w = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r4.xyz = r2.yzw * r3.www;
	r4.w = dot(r4.xyz, r3.xyz);
	r5.x = (r4.w * -r4.w) + c14.y;
	r5.x = ((r5.x == 0.0) ? FLT_MAX : rsqrt(abs(r5.x)));
	r5.x = ((r5.x == 0.0) ? FLT_MAX : 1.0 / r5.x);
	r2.x = r2.x * r5.x;
	r1.w = clamp((r4.w * r1.w) + r2.x, 0.0, 1.0);
	r5.yzw = (r2.yzw * r3.www) + r1.xyz;
	r1.x = clamp(dot(r0.xyz, r1.xyz), 0.0, 1.0);
	r6.xyz = normalize(r5.yzw);
	r1.y = clamp(dot(r0.xyz, r6.xyz), 0.0, 1.0);
	r6.x = mix(r1.y, r1.w, c10.w);
	r7 = s10_texture.sample(s10, v0.xy);
	r6.w = r7.w;
	r8 = s7_texture.sample(s7, r6.xw);
	r1.y = r1.x * r6.x;
	r1.z = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r1.x = (r1.x * r1.x) + r1.x;
	r1.x = r1.x * c13.y;
	r1.z = ((r1.z == 0.0) ? FLT_MAX : 1.0 / r1.z);
	r5.yzw = r1.zzz * r8.xyz;
	r8.xyz = c22.xyz * v1.yyy;
	r5.yzw = r5.yzw * r8.xyz;
	r9.xyz = c21.xyz + -v5.xyz;
	r10.xyz = normalize(r9.xyz);
	r1.w = dot(r10.xyz, r3.xxx);
	r2.x = (r1.w * -r1.w) + c14.y;
	r2.x = ((r2.x == 0.0) ? FLT_MAX : rsqrt(abs(r2.x)));
	r2.x = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r2.x = r2.x * r5.x;
	r1.w = clamp((r4.w * r1.w) + r2.x, 0.0, 1.0);
	r9.xyz = (r2.yzw * r3.www) + r10.xyz;
	r11.xyz = normalize(r9.xyz);
	r2.x = clamp(dot(r0.xyz, r11.xyz), 0.0, 1.0);
	r6.y = mix(r2.x, r1.w, c10.w);
	r9 = s7_texture.sample(s7, r6.yw);
	r1.w = clamp(dot(r0.xyz, r10.xyz), 0.0, 1.0);
	r2.x = clamp(r10.z, 0.0, 1.0);
	r2.x = (r2.x * r2.x) + r2.x;
	r2.x = r2.x * c13.y;
	r6.x = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r6.x = ((r6.x == 0.0) ? FLT_MAX : 1.0 / r6.x);
	r9.xyz = r6.xxx * r9.xyz;
	r10.xyz = c20.xyz * v1.xxx;
	r5.yzw = (r9.xyz * r10.xyz) + r5.yzw;
	r9.xyz = c25.xyz + -v5.xyz;
	r11.xyz = normalize(r9.xyz);
	r7.w = dot(r11.xyz, r3.xxx);
	r8.w = (r7.w * -r7.w) + c14.y;
	r8.w = ((r8.w == 0.0) ? FLT_MAX : rsqrt(abs(r8.w)));
	r8.w = ((r8.w == 0.0) ? FLT_MAX : 1.0 / r8.w);
	r8.w = r5.x * r8.w;
	r7.w = clamp((r4.w * r7.w) + r8.w, 0.0, 1.0);
	r9.xyz = (r2.yzw * r3.www) + r11.xyz;
	r8.w = clamp(dot(r0.xyz, r11.xyz), 0.0, 1.0);
	r11.xyz = normalize(r9.xyz);
	r9.x = clamp(dot(r0.xyz, r11.xyz), 0.0, 1.0);
	r11.y = mix(r9.x, r7.w, c10.w);
	r11.z = r6.w;
	r9 = s7_texture.sample(s7, r11.yz);
	r7.w = r8.w * r11.y;
	r9.w = ((r8.w == 0.0) ? FLT_MAX : rsqrt(abs(r8.w)));
	r8.w = (r8.w * r8.w) + r8.w;
	r8.w = r8.w * c13.y;
	r9.w = ((r9.w == 0.0) ? FLT_MAX : 1.0 / r9.w);
	r9.xyz = r9.www * r9.xyz;
	r12.xyz = c24.xyz * v1.zzz;
	r5.yzw = (r9.xyz * r12.xyz) + r5.yzw;
	r9.x = c23.w + -v5.x;
	r9.y = c24.w + -v5.y;
	r9.z = c25.w + -v5.z;
	r13.xyz = normalize(r9.xyz);
	r9.x = dot(r13.xyz, r3.xxx);
	r9.y = (r9.x * -r9.x) + c14.y;
	r9.y = ((r9.y == 0.0) ? FLT_MAX : rsqrt(abs(r9.y)));
	r9.y = ((r9.y == 0.0) ? FLT_MAX : 1.0 / r9.y);
	r5.x = r5.x * r9.y;
	r4.w = clamp((r4.w * r9.x) + r5.x, 0.0, 1.0);
	r9.xyz = (r2.yzw * r3.www) + r13.xyz;
	r5.x = clamp(dot(r0.xyz, r13.xyz), 0.0, 1.0);
	r13.xyz = normalize(r9.xyz);
	r9.x = clamp(dot(r0.xyz, r13.xyz), 0.0, 1.0);
	r11.x = mix(r9.x, r4.w, c10.w);
	r13 = s7_texture.sample(s7, r11.xz);
	r4.w = r5.x * r11.x;
	r9.x = ((r5.x == 0.0) ? FLT_MAX : rsqrt(abs(r5.x)));
	r5.x = (r5.x * r5.x) + r5.x;
	r5.x = r5.x * c13.y;
	r9.x = ((r9.x == 0.0) ? FLT_MAX : 1.0 / r9.x);
	r11.xyz = r9.xxx * r13.xyz;
	r13.x = c20.w * v1.w;
	r13.y = c21.w * v1.w;
	r13.z = c22.w * v1.w;
	r5.yzw = (r11.xyz * r13.xyz) + r5.yzw;
	r5.yzw = r0.www * r5.yzw;
	r11.xyz = r0.xyz * r3.yzx;
	r11.xyz = (r3.xyz * r0.yzx) + -r11.xyz;
	r14.xyz = r3.yzx * r11.xyz;
	r3.xyz = (r11.zxy * r3.zxy) + -r14.xyz;
	r0.w = dot(r3.xyz, r3.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r3.xyz = (r3.xyz * r0.www) + -r4.xyz;
	r3.xyz = (c10.www * r3.xyz) + r4.xyz;
	r6.z = clamp(dot(r4.xyz, r0.xyz), 0.0, 1.0);
	r0.w = dot(r0.xyz, r3.xyz);
	r0.w = r0.w + r0.w;
	r4.x = dot(r0.xyz, r0.xyz);
	r3.xyz = r3.xyz * r4.xxx;
	r3.xyz = (r0.www * r0.xyz) + -r3.xyz;
	r11 = s6_texture.sample(s6, r3.xyz);
	r4.xyz = r11.xyz * c30.zzz;
	r14.xyz = r4.xyz * r4.xyz;
	r14.xyz = r14.xyz * r14.xyz;
	r0.w = dot(r14.xyz, c17.xyz);
	r9.y = r0.w + c17.w;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r9.y >= 0.0) ? r0.w : c15.x);
	r9.y = dot(r4.xyz, c17.xyz);
	r14.xyz = r9.yyy * r14.xyz;
	r11.xyz = (c30.zzz * -r11.xyz) + r9.yyy;
	r11.xyz = (-c103.www * r11.xyz) + r4.xyz;
	r14.xyz = (r14.xyz * r0.www) + -r4.xyz;
	r14.xyz = (c103.www * r14.xyz) + r4.xyz;
	r11.xyz = ((c103.w >= 0.0) ? r14.xyz : r11.xyz);
	r0.w = abs(c103.w);
	r4.xyz = ((-r0.w >= 0.0) ? r4.xyz : r11.xyz);
	r11.x = ((r0.x >= 0.0) ? c18.x : c18.y);
	r11.y = ((r0.y >= 0.0) ? c18.x : c18.y);
	r11.z = ((r0.z >= 0.0) ? c18.x : c18.y);
	r14.xyz = r0.xyz * r0.xyz;
	r11.xyz = r11.xyz * r14.xyz;
	r15.xyz = r11.xxx * c5.xyz;
	r16.x = ((r0.x >= 0.0) ? c18.y : c18.x);
	r16.y = ((r0.y >= 0.0) ? c18.y : c18.x);
	r16.z = ((r0.z >= 0.0) ? c18.y : c18.x);
	r14.xyz = r14.xyz * r16.xyz;
	r15.xyz = (r14.xxx * c4.xyz) + r15.xyz;
	r14.xyw = (r14.yyy * c6.xyz) + r15.xyz;
	r11.xyw = (r11.yyy * c7.xyz) + r14.xyw;
	r11.xyw = (r14.zzz * c8.xyz) + r11.xyw;
	r11.xyz = (r11.zzz * c9.xyz) + r11.xyw;
	r0.w = (r1.w * r1.w) + r1.w;
	r1.w = r1.w * r6.y;
	r0.w = r0.w * c13.y;
	r11.xyz = (r10.xyz * r0.www) + r11.xyz;
	r11.xyz = (r8.xyz * r1.xxx) + r11.xyz;
	r11.xyz = (r12.xyz * r8.www) + r11.xyz;
	r11.xyz = (r13.xyz * r5.xxx) + r11.xyz;
	r14.xyz = r11.xyz + v6.xyz;
	r15.xyz = r14.xyz + -c103.xxx;
	r15.xyz = clamp(r15.xyz * c103.yyy, float3(0.0), float3(1.0));
	r15.xyz = (r4.xyz * r15.xyz) + -r4.xyz;
	r4.xyz = (c101.xxx * r15.xyz) + r4.xyz;
	r15.xyz = (r4.xyz * r4.xyz) + -r4.xyz;
	r4.xyz = (c103.zzz * r15.xyz) + r4.xyz;
	r15 = s0_texture.sample(s0, v0.xy);
	r16.xyz = r15.www * c104.xyz;
	r4.xyz = r4.xyz * r16.xyz;
	r0.w = mix(c10.x, c10.y, r7.y);
	r4.xyz = (r5.yzw * r0.www) + r4.xyz;
	r5.x = ((r3.x >= 0.0) ? c18.x : c18.y);
	r5.y = ((r3.y >= 0.0) ? c18.x : c18.y);
	r5.z = ((r3.z >= 0.0) ? c18.x : c18.y);
	r16.xyz = r3.xyz * r3.xyz;
	r3.x = ((r3.x >= 0.0) ? c18.y : c18.x);
	r3.y = ((r3.y >= 0.0) ? c18.y : c18.x);
	r3.z = ((r3.z >= 0.0) ? c18.y : c18.x);
	r3.xyz = r16.xyz * r3.xyz;
	r5.xyz = r5.xyz * r16.xyz;
	r16.xyz = r5.xxx * c5.xyz;
	r16.xyz = (r3.xxx * c4.xyz) + r16.xyz;
	r16.xyz = (r3.yyy * c6.xyz) + r16.xyz;
	r5.xyw = (r5.yyy * c7.xyz) + r16.xyz;
	r3.xyz = (r3.zzz * c8.xyz) + r5.xyw;
	r3.xyz = (r5.zzz * c9.xyz) + r3.xyz;
	r5.xyz = r2.xxx * r10.xyz;
	r3.xyz = r3.xyz * r5.xyz;
	r5.x = v7.w;
	r5.y = v8.w;
	r5.z = v9.w;
	r5.xyz = -r5.xyz + c21.xyz;
	r16.xyz = normalize(r5.xyz);
	r0.w = clamp(dot(-v9.xyz, r16.xyz), 0.0, 1.0);
	r0.w = (r0.w * r0.w) + r0.w;
	r0.w = r0.w * c13.y;
	r5.xyz = r0.www * r10.xyz;
	r16.xyz = c0.xyz * v6.xyz;
	r5.xyz = (r16.xyz * r5.xyz) + -r3.xyz;
	r0.w = clamp(dot(r0.xyz, v9.xyz), 0.0, 1.0);
	r3.xyz = (r0.www * r5.xyz) + r3.xyz;
	r5 = s4_texture.sample(s4, r6.zw);
	r0.w = -r6.z + c14.y;
	r1.x = pow(abs(r0.w), c105.x);
	r0.w = r7.x * r5.z;
	r0.w = r0.w * c0.w;
	r3.xyz = r0.www * r3.xyz;
	r3.xyz = (r4.xyz * r5.yyy) + r3.xyz;
	r4.xyz = r15.zxy * c14.xxx;
	r4.xyz = (r15.zxy * c14.xxx) + -r4.zxy;
	r5.xy = c13.xy;
	r0.w = (c12.w * r5.x) + r5.y;
	r0.w = fract(r0.w);
	r0.w = (r0.w * c13.z) + c13.w;
	r5.xy = float2(cos(r0.w), sin(r0.w));
	r4.xyz = r4.xyz * r5.yyy;
	r4.xyz = (r15.xyz * r5.xxx) + r4.xyz;
	r0.w = -r5.x + c14.y;
	r2.x = dot(c14.xxx, r15.xyz);
	r2.x = r2.x * c14.x;
	r4.xyz = (r2.xxx * r0.www) + r4.xyz;
	r0.w = abs(c12.w);
	r4.xyz = ((-r0.w >= 0.0) ? r15.xyz : r4.xyz);
	r5.xyz = r4.xyz + c14.www;
	r5.xyz = (r7.yyy * r5.xyz) + c14.yyy;
	r3.xyz = r3.xyz * r5.xyz;
	r5.xyz = r4.xyz * r4.xyz;
	r5.xyz = r5.xyz * r5.xyz;
	r0.w = dot(r4.xyz, c17.xyz);
	r6.yzw = r0.www * r5.xyz;
	r2.x = dot(r5.xyz, c17.xyz);
	r5.xyz = mix(r4.xyz, r0.www, -c101.yyy);
	r0.w = r2.x + c17.w;
	r2.x = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r0.w = ((r0.w >= 0.0) ? r2.x : c15.x);
	r6.yzw = (r6.yzw * r0.www) + -r4.xyz;
	r6.yzw = (c101.yyy * r6.yzw) + r4.xyz;
	r5.xyz = ((c101.y >= 0.0) ? r6.yzw : r5.xyz);
	r0.w = abs(c101.y);
	r5.xyz = ((-r0.w >= 0.0) ? r4.xyz : r5.xyz);
	r0.w = r1.x * r1.y;
	r0.w = r1.z * r0.w;
	r6.yzw = r8.xyz * r0.www;
	r1.y = r1.x * r1.w;
	r1.z = r6.x * r1.y;
	r0.w = (r1.y * r6.x) + r0.w;
	r1.yzw = (r1.zzz * r10.xyz) + r6.yzw;
	r2.x = r1.x * r7.w;
	r5.w = r9.w * r2.x;
	r0.w = (r2.x * r9.w) + r0.w;
	r1.yzw = (r5.www * r12.xyz) + r1.yzw;
	r2.x = r1.x * r4.w;
	r4.w = r9.x * r2.x;
	r0.w = (r2.x * r9.x) + r0.w;
	r6.xy = r0.ww + -c33.xw;
	r1.yzw = (r4.www * r13.xyz) + r1.yzw;
	r8.y = c14.y;
	r0.w = (v6.w * c11.w) + r8.y;
	r2.x = r7.x * c105.y;
	r0.w = r0.w * r2.x;
	r1.yzw = r0.www * r1.yzw;
	r0.w = r7.y * c101.w;
	r8.xyz = (r4.xyz * r0.www) + -c106.xyz;
	r0.w = clamp(r0.w, 0.0, 1.0);
	r8.xyz = (r0.www * r8.xyz) + c106.xyz;
	r9.xyz = r1.yzw * r8.xyz;
	r0.w = dot(r9.xyz, c17.xyz);
	r6.zw = -c33.xw + c33.yz;
	r2.x = ((r6.z == 0.0) ? FLT_MAX : 1.0 / r6.z);
	r4.w = ((r6.w == 0.0) ? FLT_MAX : 1.0 / r6.w);
	r4.w = clamp(r4.w * r6.y, 0.0, 1.0);
	r2.x = clamp(r2.x * r6.x, 0.0, 1.0);
	r5.w = (r2.x * c16.x) + c16.y;
	r2.x = r2.x * r2.x;
	r2.x = r2.x * r5.w;
	r5.w = (r4.w * c16.x) + c16.y;
	r4.w = r4.w * r4.w;
	r4.w = r4.w * r5.w;
	r2.x = r2.x * r4.w;
	r0.w = r0.w * r2.x;
	r0.w = r0.w * c106.w;
	r2.x = dot(r11.xyz, c17.xyz);
	r6.xyz = (r1.yzw * r8.xyz) + r11.xyz;
	r4.w = dot(r6.xyz, c17.xyz);
	r4.w = r4.w + c15.y;
	r4.w = clamp(r4.w * c15.z, 0.0, 1.0);
	r6.xy = r2.xx + -c2.xw;
	r6.zw = -c2.xw + c2.yz;
	r2.x = ((r6.w == 0.0) ? FLT_MAX : 1.0 / r6.w);
	r5.w = ((r6.z == 0.0) ? FLT_MAX : 1.0 / r6.z);
	r5.w = clamp(r5.w * r6.x, 0.0, 1.0);
	r2.x = clamp(r2.x * r6.y, 0.0, 1.0);
	r6.x = (r2.x * c16.x) + c16.y;
	r2.x = r2.x * r2.x;
	r0.w = (r6.x * r2.x) + r0.w;
	r2.x = (r5.w * c16.x) + c16.y;
	r5.w = r5.w * r5.w;
	r2.x = r2.x * r5.w;
	r0.w = r0.w * r2.x;
	r6.xyz = mix(r4.xyz, r5.xyz, r0.www);
	r0.w = dot(r6.xyz, c17.xyz);
	r4.xyz = r0.www * c102.xyz;
	r5.xyz = c17.xyz;
	r0.w = dot(c102.xyz, r5.xyz);
	r2.x = r0.w + c17.w;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r2.x >= 0.0) ? r0.w : c15.x);
	r4.xyz = (r4.xyz * r0.www) + -r6.xyz;
	r4.xyz = (c102.www * r4.xyz) + r6.xyz;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r4.xyz = (r4.xyz * r0.www) + -r6.xyz;
	r0.w = (r4.w * c16.x) + c16.y;
	r2.x = r4.w * r4.w;
	r0.w = r0.w * r2.x;
	r4.xyz = (r0.www * r4.xyz) + r6.xyz;
	r4.xyz = r7.zzz * r4.xyz;
	r3.xyz = (r4.xyz * r14.xyz) + r3.xyz;
	r1.yzw = (r1.yzw * r8.xyz) + r3.xyz;
	r3.x = v2.w;
	r3.y = v3.w;
	r3.z = v4.w;
	r2.xyz = (r2.yzw * r3.www) + r3.xyz;
	r0.w = clamp(dot(r0.xyz, r3.xyz), 0.0, 1.0);
	r3.xyz = normalize(r2.xyz);
	r0.x = clamp(dot(r0.xyz, r3.xyz), 0.0, 1.0);
	r0.x = r0.w * r0.x;
	r0.y = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r0.x = r1.x * r0.x;
	r0.x = r0.y * r0.x;
	r0.yzw = v6.www * v6.xyz;
	r0.yzw = r0.yzw * c107.xyz;
	r0.xyz = r0.yzw * r0.xxx;
	r0.xyz = (r0.xyz * r7.xxx) + r1.yzw;
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

