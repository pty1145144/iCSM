#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[26];
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
	const float4 c13 = float4(0.159154935, 0.5, 6.283185478, -3.141592739); (void) c13;
	const float4 c14 = float4(0.57735002, 1.0, 2.0, -1.0); (void) c14;
	const float4 c15 = float4(1000000.0, -0.300000011, -3.333333253, 0.0); (void) c15;
	const float4 c16 = float4(-2.0, 3.0, 0.0, 0.0); (void) c16;
	const float4 c17 = float4(0.298999992, 0.587000012, 0.114, -0.000001); (void) c17;
	const float4 c18 = float4(0.0, 1.0, 0.000796326, 0.999999703); (void) c18;
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
	#define c20 uniforms.uniforms_float4[13]
	#define c21 uniforms.uniforms_float4[14]
	#define c22 uniforms.uniforms_float4[15]
	#define c23 uniforms.uniforms_float4[16]
	#define c30 uniforms.uniforms_float4[17]
	#define c33 uniforms.uniforms_float4[18]
	#define c101 uniforms.uniforms_float4[19]
	#define c102 uniforms.uniforms_float4[20]
	#define c103 uniforms.uniforms_float4[21]
	#define c104 uniforms.uniforms_float4[22]
	#define c105 uniforms.uniforms_float4[23]
	#define c106 uniforms.uniforms_float4[24]
	#define c107 uniforms.uniforms_float4[25]
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
	r1 = s1_texture.sample(s1, v0.xy);
	r0.yzw = (r1.xyz * c14.zzz) + c14.www;
	r1.x = dot(v2.xyz, r0.yzw);
	r1.y = dot(v3.xyz, r0.yzw);
	r1.z = dot(v4.xyz, r0.yzw);
	r2.xyz = normalize(r1.xyz);
	r0.yzw = r2.zxy * v8.yzx;
	r0.yzw = (r2.yzx * v8.zxy) + -r0.yzw;
	r1.xyz = normalize(r0.yzw);
	r0.yzw = r1.yzx * r2.zxy;
	r0.yzw = (r2.yzx * r1.zxy) + -r0.yzw;
	r1.xyz = r1.xyz * c18.zzz;
	r3.xyz = normalize(r0.yzw);
	r0.yzw = (r3.xyz * c18.www) + r1.xyz;
	r1.xyz = normalize(r0.yzw);
	r0.yzw = r2.xyz * r1.yzx;
	r0.yzw = (r1.xyz * r2.yzx) + -r0.yzw;
	r3.xyz = r1.yzx * r0.yzw;
	r0.yzw = (r0.wyz * r1.zxy) + -r3.xyz;
	r2.w = dot(r0.yzw, r0.yzw);
	r2.w = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r3.xyz = c3.xyz + -v5.xyz;
	r3.w = dot(r3.xyz, r3.xyz);
	r3.w = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r4.xyz = r3.www * r3.xyz;
	r0.yzw = (r0.yzw * r2.www) + -r4.xyz;
	r0.yzw = (c10.www * r0.yzw) + r4.xyz;
	r2.w = dot(r2.xyz, r0.yzw);
	r2.w = r2.w + r2.w;
	r4.w = dot(r2.xyz, r2.xyz);
	r0.yzw = r0.yzw * r4.www;
	r0.yzw = (r2.www * r2.xyz) + -r0.yzw;
	r5 = s6_texture.sample(s6, r0.yzw);
	r6.xyz = r5.xyz * c30.zzz;
	r7.xyz = r6.xyz * r6.xyz;
	r7.xyz = r7.xyz * r7.xyz;
	r2.w = dot(r7.xyz, c17.xyz);
	r4.w = r2.w + c17.w;
	r2.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r2.w = ((r4.w >= 0.0) ? r2.w : c15.x);
	r4.w = dot(r6.xyz, c17.xyz);
	r7.xyz = r4.www * r7.xyz;
	r5.xyz = (c30.zzz * -r5.xyz) + r4.www;
	r5.xyz = (-c103.www * r5.xyz) + r6.xyz;
	r7.xyz = (r7.xyz * r2.www) + -r6.xyz;
	r7.xyz = (c103.www * r7.xyz) + r6.xyz;
	r5.xyz = ((c103.w >= 0.0) ? r7.xyz : r5.xyz);
	r5.xyz = ((-r0.x >= 0.0) ? r6.xyz : r5.xyz);
	r6.x = ((r2.x >= 0.0) ? c18.x : c18.y);
	r6.y = ((r2.y >= 0.0) ? c18.x : c18.y);
	r6.z = ((r2.z >= 0.0) ? c18.x : c18.y);
	r7.xyz = r2.xyz * r2.xyz;
	r6.xyz = r6.xyz * r7.xyz;
	r8.xyz = r6.xxx * c5.xyz;
	r9.x = ((r2.x >= 0.0) ? c18.y : c18.x);
	r9.y = ((r2.y >= 0.0) ? c18.y : c18.x);
	r9.z = ((r2.z >= 0.0) ? c18.y : c18.x);
	r7.xyz = r7.xyz * r9.xyz;
	r8.xyz = (r7.xxx * c4.xyz) + r8.xyz;
	r7.xyw = (r7.yyy * c6.xyz) + r8.xyz;
	r6.xyw = (r6.yyy * c7.xyz) + r7.xyw;
	r6.xyw = (r7.zzz * c8.xyz) + r6.xyw;
	r6.xyz = (r6.zzz * c9.xyz) + r6.xyw;
	r7.xyz = c21.xyz + -v5.xyz;
	r8.xyz = normalize(r7.xyz);
	r0.x = clamp(dot(r2.xyz, r8.xyz), 0.0, 1.0);
	r2.w = (r0.x * r0.x) + r0.x;
	r2.w = r2.w * c13.y;
	r7.xyz = c20.xyz * v1.xxx;
	r6.xyz = (r7.xyz * r2.www) + r6.xyz;
	r9.xyz = c23.xyz + -v5.xyz;
	r10.xyz = normalize(r9.xyz);
	r2.w = clamp(dot(r2.xyz, r10.xyz), 0.0, 1.0);
	r4.w = (r2.w * r2.w) + r2.w;
	r4.w = r4.w * c13.y;
	r9.xyz = c22.xyz * v1.yyy;
	r6.xyz = (r9.xyz * r4.www) + r6.xyz;
	r11.xyz = r6.xyz + v6.xyz;
	r12.xyz = r11.xyz + -c103.xxx;
	r12.xyz = clamp(r12.xyz * c103.yyy, float3(0.0), float3(1.0));
	r12.xyz = (r5.xyz * r12.xyz) + -r5.xyz;
	r5.xyz = (c101.xxx * r12.xyz) + r5.xyz;
	r12.xyz = (r5.xyz * r5.xyz) + -r5.xyz;
	r5.xyz = (c103.zzz * r12.xyz) + r5.xyz;
	r12 = s0_texture.sample(s0, v0.xy);
	r13.xyz = r12.www * c104.xyz;
	r5.xyz = r5.xyz * r13.xyz;
	r4.w = dot(r10.xyz, r1.xxx);
	r10.xyz = (r3.xyz * r3.www) + r10.xyz;
	r13.xyz = normalize(r10.xyz);
	r5.w = clamp(dot(r2.xyz, r13.xyz), 0.0, 1.0);
	r6.w = (r4.w * -r4.w) + c14.y;
	r6.w = ((r6.w == 0.0) ? FLT_MAX : rsqrt(abs(r6.w)));
	r6.w = ((r6.w == 0.0) ? FLT_MAX : 1.0 / r6.w);
	r1.y = dot(r4.xyz, r1.xyz);
	r1.x = dot(r8.xyz, r1.xxx);
	r10.z = clamp(dot(r4.xyz, r2.xyz), 0.0, 1.0);
	r1.z = (r1.y * -r1.y) + c14.y;
	r1.z = ((r1.z == 0.0) ? FLT_MAX : rsqrt(abs(r1.z)));
	r1.z = ((r1.z == 0.0) ? FLT_MAX : 1.0 / r1.z);
	r4.x = r6.w * r1.z;
	r4.x = clamp((r1.y * r4.w) + r4.x, 0.0, 1.0);
	r10.x = mix(r5.w, r4.x, c10.w);
	r4 = s10_texture.sample(s10, v0.xy);
	r10.w = r4.w;
	r13 = s7_texture.sample(s7, r10.xw);
	r4.w = r2.w * r10.x;
	r2.w = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r2.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r13.xyz = r2.www * r13.xyz;
	r13.xyz = r9.xyz * r13.xyz;
	r5.w = (r1.x * -r1.x) + c14.y;
	r5.w = ((r5.w == 0.0) ? FLT_MAX : rsqrt(abs(r5.w)));
	r5.w = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r1.z = r1.z * r5.w;
	r1.x = clamp((r1.y * r1.x) + r1.z, 0.0, 1.0);
	r8.xyw = (r3.xyz * r3.www) + r8.xyz;
	r1.y = clamp(r8.z, 0.0, 1.0);
	r1.y = (r1.y * r1.y) + r1.y;
	r1.y = r1.y * c13.y;
	r14.xyz = r1.yyy * r7.xyz;
	r15.xyz = normalize(r8.xyw);
	r1.y = clamp(dot(r2.xyz, r15.xyz), 0.0, 1.0);
	r10.y = mix(r1.y, r1.x, c10.w);
	r8 = s7_texture.sample(s7, r10.yw);
	r1.x = r0.x * r10.y;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r15 = s4_texture.sample(s4, r10.zw);
	r1.y = -r10.z + c14.y;
	r5.w = pow(abs(r1.y), c105.x);
	r8.xyz = r0.xxx * r8.xyz;
	r8.xyz = (r8.xyz * r7.xyz) + r13.xyz;
	r1.yzw = r1.www * r8.xyz;
	r6.w = mix(c10.x, c10.y, r4.y);
	r1.yzw = (r1.yzw * r6.www) + r5.xyz;
	r5.x = v7.w;
	r5.y = v8.w;
	r5.z = v9.w;
	r5.xyz = -r5.xyz + c21.xyz;
	r8.xyz = normalize(r5.xyz);
	r5.x = clamp(dot(-v9.xyz, r8.xyz), 0.0, 1.0);
	r5.x = (r5.x * r5.x) + r5.x;
	r5.x = r5.x * c13.y;
	r5.xyz = r5.xxx * r7.xyz;
	r8.x = ((r0.y >= 0.0) ? c18.x : c18.y);
	r8.y = ((r0.z >= 0.0) ? c18.x : c18.y);
	r8.z = ((r0.w >= 0.0) ? c18.x : c18.y);
	r10.xyz = r0.yzw * r0.yzw;
	r0.y = ((r0.y >= 0.0) ? c18.y : c18.x);
	r0.z = ((r0.z >= 0.0) ? c18.y : c18.x);
	r0.w = ((r0.w >= 0.0) ? c18.y : c18.x);
	r0.yzw = r10.xyz * r0.yzw;
	r8.xyz = r8.xyz * r10.xyz;
	r10.xyz = r8.xxx * c5.xyz;
	r10.xyz = (r0.yyy * c4.xyz) + r10.xyz;
	r10.xyz = (r0.zzz * c6.xyz) + r10.xyz;
	r8.xyw = (r8.yyy * c7.xyz) + r10.xyz;
	r0.yzw = (r0.www * c8.xyz) + r8.xyw;
	r0.yzw = (r8.zzz * c9.xyz) + r0.yzw;
	r0.yzw = r14.xyz * r0.yzw;
	r8.xyz = c0.xyz * v6.xyz;
	r5.xyz = (r8.xyz * r5.xyz) + -r0.yzw;
	r6.w = clamp(dot(r2.xyz, v9.xyz), 0.0, 1.0);
	r0.yzw = (r6.www * r5.xyz) + r0.yzw;
	r5.x = r4.x * r15.z;
	r5.x = r5.x * c0.w;
	r0.yzw = r0.yzw * r5.xxx;
	r0.yzw = (r1.yzw * r15.yyy) + r0.yzw;
	r1.yzw = r12.zxy * c14.xxx;
	r1.yzw = (r12.zxy * c14.xxx) + -r1.wyz;
	r5.xy = c13.xy;
	r5.x = (c12.w * r5.x) + r5.y;
	r5.x = fract(r5.x);
	r5.x = (r5.x * c13.z) + c13.w;
	r8.xy = float2(cos(r5.x), sin(r5.x));
	r1.yzw = r1.yzw * r8.yyy;
	r1.yzw = (r12.xyz * r8.xxx) + r1.yzw;
	r5.x = -r8.x + c14.y;
	r5.y = dot(c14.xxx, r12.xyz);
	r5.y = r5.y * c14.x;
	r1.yzw = (r5.yyy * r5.xxx) + r1.yzw;
	r5.x = abs(c12.w);
	r1.yzw = ((-r5.x >= 0.0) ? r12.xyz : r1.yzw);
	r5.xyz = r1.yzw + c14.www;
	r5.xyz = (r4.yyy * r5.xyz) + c14.yyy;
	r0.yzw = r0.yzw * r5.xyz;
	r5.xyz = r1.yzw * r1.yzw;
	r5.xyz = r5.xyz * r5.xyz;
	r6.w = dot(r1.yzw, c17.xyz);
	r8.xyz = r5.xyz * r6.www;
	r5.x = dot(r5.xyz, c17.xyz);
	r10.xyz = mix(r1.yzw, r6.www, -c101.yyy);
	r5.y = r5.x + c17.w;
	r5.x = ((r5.x == 0.0) ? FLT_MAX : 1.0 / r5.x);
	r5.x = ((r5.y >= 0.0) ? r5.x : c15.x);
	r5.xyz = (r8.xyz * r5.xxx) + -r1.yzw;
	r5.xyz = (c101.yyy * r5.xyz) + r1.yzw;
	r5.xyz = ((c101.y >= 0.0) ? r5.xyz : r10.xyz);
	r6.w = abs(c101.y);
	r5.xyz = ((-r6.w >= 0.0) ? r1.yzw : r5.xyz);
	r4.w = r4.w * r5.w;
	r2.w = r2.w * r4.w;
	r1.x = r1.x * r5.w;
	r4.w = (r1.x * r0.x) + r2.w;
	r8.xyz = r9.xyz * r2.www;
	r0.x = r0.x * r1.x;
	r7.xyz = (r0.xxx * r7.xyz) + r8.xyz;
	r8.xy = r4.ww + -c33.xw;
	r8.zw = -c33.xw + c33.yz;
	r0.x = ((r8.z == 0.0) ? FLT_MAX : 1.0 / r8.z);
	r1.x = ((r8.w == 0.0) ? FLT_MAX : 1.0 / r8.w);
	r1.x = clamp(r1.x * r8.y, 0.0, 1.0);
	r0.x = clamp(r0.x * r8.x, 0.0, 1.0);
	r2.w = (r0.x * c16.x) + c16.y;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r2.w;
	r2.w = (r1.x * c16.x) + c16.y;
	r1.x = r1.x * r1.x;
	r1.x = r1.x * r2.w;
	r0.x = r0.x * r1.x;
	r8.y = c14.y;
	r1.x = (v6.w * c11.w) + r8.y;
	r2.w = r4.x * c105.y;
	r1.x = r1.x * r2.w;
	r7.xyz = r1.xxx * r7.xyz;
	r1.x = r4.y * c101.w;
	r8.xyz = (r1.yzw * r1.xxx) + -c106.xyz;
	r1.x = clamp(r1.x, 0.0, 1.0);
	r8.xyz = (r1.xxx * r8.xyz) + c106.xyz;
	r9.xyz = r7.xyz * r8.xyz;
	r1.x = dot(r9.xyz, c17.xyz);
	r0.x = r0.x * r1.x;
	r0.x = r0.x * c106.w;
	r1.x = dot(r6.xyz, c17.xyz);
	r6.xyz = (r7.xyz * r8.xyz) + r6.xyz;
	r2.w = dot(r6.xyz, c17.xyz);
	r2.w = r2.w + c15.y;
	r2.w = clamp(r2.w * c15.z, 0.0, 1.0);
	r4.yw = r1.xx + -c2.xw;
	r6.xy = -c2.xw + c2.yz;
	r1.x = ((r6.y == 0.0) ? FLT_MAX : 1.0 / r6.y);
	r6.x = ((r6.x == 0.0) ? FLT_MAX : 1.0 / r6.x);
	r4.y = clamp(r4.y * r6.x, 0.0, 1.0);
	r1.x = clamp(r1.x * r4.w, 0.0, 1.0);
	r4.w = (r1.x * c16.x) + c16.y;
	r1.x = r1.x * r1.x;
	r0.x = (r4.w * r1.x) + r0.x;
	r1.x = (r4.y * c16.x) + c16.y;
	r4.y = r4.y * r4.y;
	r1.x = r1.x * r4.y;
	r0.x = r0.x * r1.x;
	r6.xyz = mix(r1.yzw, r5.xyz, r0.xxx);
	r0.x = dot(r6.xyz, c17.xyz);
	r1.xyz = r0.xxx * c102.xyz;
	r5.xyz = c17.xyz;
	r0.x = dot(c102.xyz, r5.xyz);
	r1.w = r0.x + c17.w;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = ((r1.w >= 0.0) ? r0.x : c15.x);
	r1.xyz = (r1.xyz * r0.xxx) + -r6.xyz;
	r1.xyz = (c102.www * r1.xyz) + r6.xyz;
	r0.x = clamp(c107.w + v6.w, 0.0, 1.0);
	r1.xyz = (r1.xyz * r0.xxx) + -r6.xyz;
	r0.x = (r2.w * c16.x) + c16.y;
	r1.w = r2.w * r2.w;
	r0.x = r0.x * r1.w;
	r1.xyz = (r0.xxx * r1.xyz) + r6.xyz;
	r1.xyz = r4.zzz * r1.xyz;
	r0.xyz = (r1.xyz * r11.xyz) + r0.yzw;
	r0.xyz = (r7.xyz * r8.xyz) + r0.xyz;
	r1.x = v2.w;
	r1.y = v3.w;
	r1.z = v4.w;
	r3.xyz = (r3.xyz * r3.www) + r1.xyz;
	r0.w = clamp(dot(r2.xyz, r1.xyz), 0.0, 1.0);
	r1.xyz = normalize(r3.xyz);
	r1.x = clamp(dot(r2.xyz, r1.xyz), 0.0, 1.0);
	r1.x = r0.w * r1.x;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r1.x = r5.w * r1.x;
	r0.w = r0.w * r1.x;
	r1.xyz = v6.www * v6.xyz;
	r1.xyz = r1.xyz * c107.xyz;
	r1.xyz = r0.www * r1.xyz;
	r0.xyz = (r1.xyz * r4.xxx) + r0.xyz;
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
	#undef c20
	#undef c21
	#undef c22
	#undef c23
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

