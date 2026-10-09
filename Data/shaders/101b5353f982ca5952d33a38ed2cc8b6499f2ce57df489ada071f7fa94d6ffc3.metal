#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[38];
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
	const float4 c26 = float4(2.0, -1.0, 0.0, 1.0); (void) c26;
	const float4 c27 = float4(0.5, 0.159154935, 6.283185478, -3.141592739); (void) c27;
	const float4 c31 = float4(5.0, 0.298999992, 0.587000012, 0.114); (void) c31;
	const float4 c32 = float4(-2.0, 3.0, 0.0, 0.0); (void) c32;
	const float4 c34 = float4(-0.000001, 1000000.0, -0.300000011, -3.333333253); (void) c34;
	const float4 c35 = float4(0.57735002, -0.400000005, 0.499999584, 0.5); (void) c35;
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
	#define c103 uniforms.uniforms_float4[32]
	#define c104 uniforms.uniforms_float4[33]
	#define c105 uniforms.uniforms_float4[34]
	#define c106 uniforms.uniforms_float4[35]
	#define c107 uniforms.uniforms_float4[36]
	#define c109 uniforms.uniforms_float4[37]
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
	r0 = (v5.xyzx * c26.wwwz) + c26.zzzw;
	r1.x = dot(r0, c18);
	r1.y = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r2.x = dot(r0, c15);
	r2.y = dot(r0, c16);
	r2.z = dot(r0, c17);
	r0.xyz = r1.yyy * r2.xyz;
	r2 = s8_texture.sample(s8, r0.xy);
	r1.xyz = ((-r1.x >= 0.0) ? c26.zzz : r2.xyz);
	r2.y = c35.y;
	r1.w = r2.y * c13.w;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r2.xyz = c14.xyz + -v5.xyz;
	r2.w = dot(r2.xyz, r2.xyz);
	r3.y = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r3.z = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r2.w = ((r3.y == 0.0) ? FLT_MAX : 1.0 / r3.y);
	r2.w = r2.w + -c13.w;
	r1.w = clamp(r1.w * r2.w, 0.0, 1.0);
	r3.x = c26.w;
	r2.w = clamp(dot(c13.xyz, r3.xyz), 0.0, 1.0);
	r2.xyz = r2.xyz * r3.yyy;
	r3.x = r1.w * r2.w;
	r3.xyz = r3.xxx * c28.xyz;
	r3.xyz = r1.xyz * r3.xyz;
	r1.xyz = r1.xyz * c28.xyz;
	r0.w = c26.w;
	r0 = float4(s11_texture.sample_compare(s11, (r0.xyz).xy, (r0.xyz).z));
	r0.y = -r0.x + c26.w;
	r0.y = (c109.y * r0.y) + r0.x;
	r3.w = clamp(mix(r0.y, r0.x, r2.w), 0.0, 1.0);
	r0.yzw = r3.www * r3.xyz;
	r3.xyz = c23.xyz + -v5.xyz;
	r4.xyz = normalize(r3.xyz);
	r3 = s3_texture.sample(s3, v0.xy);
	r4.w = (r3.y * c35.z) + c35.w;
	r4.w = fract(r4.w);
	r4.w = (r4.w * c27.z) + c27.w;
	r5.xy = float2(cos(r4.w), sin(r4.w));
	r6 = s1_texture.sample(s1, v0.xy);
	r6.xyz = (r6.xyz * c26.xxx) + c26.yyy;
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
	r4.w = dot(r4.xyz, r7.xxx);
	r5.x = (r4.w * -r4.w) + c26.w;
	r5.x = ((r5.x == 0.0) ? FLT_MAX : rsqrt(abs(r5.x)));
	r5.x = ((r5.x == 0.0) ? FLT_MAX : 1.0 / r5.x);
	r5.yzw = c3.xyz + -v5.xyz;
	r7.w = dot(r5.yzw, r5.yzw);
	r7.w = ((r7.w == 0.0) ? FLT_MAX : rsqrt(abs(r7.w)));
	r8.xyz = r5.yzw * r7.www;
	r8.w = dot(r8.xyz, r7.xyz);
	r9.x = (r8.w * -r8.w) + c26.w;
	r9.x = ((r9.x == 0.0) ? FLT_MAX : rsqrt(abs(r9.x)));
	r9.x = ((r9.x == 0.0) ? FLT_MAX : 1.0 / r9.x);
	r5.x = r5.x * r9.x;
	r4.w = clamp((r8.w * r4.w) + r5.x, 0.0, 1.0);
	r9.yzw = (r5.yzw * r7.www) + r4.xyz;
	r10.xyz = normalize(r9.yzw);
	r5.x = clamp(dot(r6.xyz, r10.xyz), 0.0, 1.0);
	r9.zw = c26.zw;
	r3.y = ((-r3.y >= 0.0) ? r9.z : c10.w);
	r10.y = mix(r5.x, r4.w, r3.y);
	r11 = s10_texture.sample(s10, v0.xy);
	r12.w = r11.w;
	r10.z = r12.w;
	r13 = s7_texture.sample(s7, r10.yz);
	r4.w = clamp(dot(r8.xyz, r4.xyz), 0.0, 1.0);
	r4.x = clamp(dot(r6.xyz, r4.xyz), 0.0, 1.0);
	r12.z = clamp(dot(r8.xyz, r6.xyz), 0.0, 1.0);
	r4.y = r12.z * r12.z;
	r14.w = r4.y * r4.y;
	r3.w = -r3.w + c26.w;
	r4.y = r14.w * r3.w;
	r15.xyz = r4.yyy * v6.xyz;
	r14.xyz = r15.xyz * c31.xxx;
	r14 = ((-r3.w >= 0.0) ? c26.zzzz : r14);
	r4.y = r4.w * r14.w;
	r4.yzw = (r4.yyy * c31.xxx) + -r13.xyz;
	r4.yzw = (r3.www * r4.yzw) + r13.xyz;
	r4.yzw = ((-r3.w >= 0.0) ? r13.xyz : r4.yzw);
	r5.x = ((r4.x == 0.0) ? FLT_MAX : rsqrt(abs(r4.x)));
	r5.x = ((r5.x == 0.0) ? FLT_MAX : 1.0 / r5.x);
	r4.yzw = r4.yzw * r5.xxx;
	r13.xyz = c21.xyz + -v5.xyz;
	r15.xyz = normalize(r13.xyz);
	r9.y = dot(r15.xyz, r7.xxx);
	r9.z = (r9.y * -r9.y) + c26.w;
	r9.z = ((r9.z == 0.0) ? FLT_MAX : rsqrt(abs(r9.z)));
	r9.z = ((r9.z == 0.0) ? FLT_MAX : 1.0 / r9.z);
	r9.z = r9.z * r9.x;
	r9.y = clamp((r8.w * r9.y) + r9.z, 0.0, 1.0);
	r13.xyz = (r5.yzw * r7.www) + r15.xyz;
	r16.xyz = normalize(r13.xyz);
	r9.z = clamp(dot(r6.xyz, r16.xyz), 0.0, 1.0);
	r12.x = mix(r9.z, r9.y, r3.y);
	r13 = s7_texture.sample(s7, r12.xw);
	r9.y = clamp(dot(r8.xyz, r15.xyz), 0.0, 1.0);
	r9.y = r9.y * r14.w;
	r16.xyz = (r9.yyy * c31.xxx) + -r13.xyz;
	r16.xyz = (r3.www * r16.xyz) + r13.xyz;
	r13.xyz = ((-r3.w >= 0.0) ? r13.xyz : r16.xyz);
	r9.y = clamp(dot(r6.xyz, r15.xyz), 0.0, 1.0);
	r9.z = clamp(r15.z, 0.0, 1.0);
	r9.z = (r9.z * r9.z) + r9.z;
	r9.z = r9.z * c27.x;
	r10.w = ((r9.y == 0.0) ? FLT_MAX : rsqrt(abs(r9.y)));
	r10.w = ((r10.w == 0.0) ? FLT_MAX : 1.0 / r10.w);
	r13.xyz = r10.www * r13.xyz;
	r15.xyz = c20.xyz * v1.xxx;
	r13.xyz = (r13.xyz * r15.xyz) + r14.xyz;
	r14.xyz = c22.xyz * v1.yyy;
	r4.yzw = (r4.yzw * r14.xyz) + r13.xyz;
	r13.xyz = c25.xyz + -v5.xyz;
	r16.xyz = normalize(r13.xyz);
	r11.w = dot(r16.xyz, r7.xxx);
	r13.x = (r11.w * -r11.w) + c26.w;
	r13.x = ((r13.x == 0.0) ? FLT_MAX : rsqrt(abs(r13.x)));
	r13.x = ((r13.x == 0.0) ? FLT_MAX : 1.0 / r13.x);
	r9.x = r9.x * r13.x;
	r8.w = clamp((r8.w * r11.w) + r9.x, 0.0, 1.0);
	r13.xyz = (r5.yzw * r7.www) + r16.xyz;
	r5.yzw = (r5.yzw * r7.www) + r2.xyz;
	r2.x = dot(r2.xyz, r6.xyz);
	r2.y = ((r7.w == 0.0) ? FLT_MAX : 1.0 / r7.w);
	r2.y = clamp((r2.y * c19.w) + c19.x, 0.0, 1.0);
	r7.w = min(r2.y, c19.z);
	r2.y = r7.w * r7.w;
	r17.xyz = normalize(r5.yzw);
	r2.z = clamp(dot(r6.xyz, r17.xyz), 0.0, 1.0);
	r12.y = mix(r2.z, c26.w, r3.y);
	r17 = s7_texture.sample(s7, r12.yw);
	r18 = s4_texture.sample(s4, r12.zw);
	r2.z = -r12.z + c26.w;
	r5.y = pow(abs(r2.z), c105.x);
	r19.xyz = normalize(r13.xyz);
	r2.z = clamp(dot(r6.xyz, r19.xyz), 0.0, 1.0);
	r10.x = mix(r2.z, r8.w, r3.y);
	r13 = s7_texture.sample(s7, r10.xz);
	r2.z = clamp(dot(r8.xyz, r16.xyz), 0.0, 1.0);
	r5.z = clamp(dot(r6.xyz, r16.xyz), 0.0, 1.0);
	r2.z = r2.z * r14.w;
	r12.yzw = (r2.zzz * c31.xxx) + -r13.xyz;
	r12.yzw = (r3.www * r12.yzw) + r13.xyz;
	r12.yzw = ((-r3.w >= 0.0) ? r13.xyz : r12.yzw);
	r2.z = mix(r18.y, c26.w, r3.w);
	r3.w = r11.x * r18.z;
	r3.w = r3.w * c0.w;
	r5.w = ((r5.z == 0.0) ? FLT_MAX : rsqrt(abs(r5.z)));
	r5.w = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r12.yzw = r5.www * r12.yzw;
	r13.xyz = c24.xyz * v1.zzz;
	r4.yzw = (r12.yzw * r13.xyz) + r4.yzw;
	r7.w = clamp(r2.x, 0.0, 1.0);
	r2.x = clamp(r2.x + c28.w, 0.0, 1.0);
	r2.x = r2.x * r2.w;
	r7.w = ((r7.w == 0.0) ? FLT_MAX : rsqrt(abs(r7.w)));
	r7.w = ((r7.w == 0.0) ? FLT_MAX : 1.0 / r7.w);
	r12.yzw = r7.www * r17.xyz;
	r0.yzw = (r12.yzw * r0.yzw) + r4.yzw;
	r0.yzw = r6.www * r0.yzw;
	r4.yzw = r6.xyz * r7.yzx;
	r4.yzw = (r7.xyz * r6.yzx) + -r4.yzw;
	r12.yzw = r7.yzx * r4.yzw;
	r4.yzw = (r4.wyz * r7.zxy) + -r12.yzw;
	r6.w = dot(r4.yzw, r4.yzw);
	r6.w = ((r6.w == 0.0) ? FLT_MAX : rsqrt(abs(r6.w)));
	r4.yzw = (r4.yzw * r6.www) + -r8.xyz;
	r4.yzw = (r3.yyy * r4.yzw) + r8.xyz;
	r3.y = dot(r6.xyz, r4.yzw);
	r3.y = r3.y + r3.y;
	r6.w = dot(r6.xyz, r6.xyz);
	r4.yzw = r4.yzw * r6.www;
	r4.yzw = (r3.yyy * r6.xyz) + -r4.yzw;
	r7 = s6_texture.sample(s6, r4.yzw);
	r8.xyz = r7.xyz * c30.zzz;
	r12.yzw = r8.xyz * r8.xyz;
	r12.yzw = r12.yzw * r12.yzw;
	r3.y = dot(r12.yzw, c31.yzw);
	r6.w = r3.y + c34.x;
	r3.y = ((r3.y == 0.0) ? FLT_MAX : 1.0 / r3.y);
	r3.y = ((r6.w >= 0.0) ? r3.y : c34.y);
	r6.w = dot(r8.xyz, c31.yzw);
	r12.yzw = r6.www * r12.yzw;
	r7.xyz = (c30.zzz * -r7.xyz) + r6.www;
	r7.xyz = (-c103.www * r7.xyz) + r8.xyz;
	r12.yzw = (r12.yzw * r3.yyy) + -r8.xyz;
	r12.yzw = (c103.www * r12.yzw) + r8.xyz;
	r7.xyz = ((c103.w >= 0.0) ? r12.yzw : r7.xyz);
	r3.y = abs(c103.w);
	r7.xyz = ((-r3.y >= 0.0) ? r8.xyz : r7.xyz);
	r3.y = clamp(r0.x, 0.0, 1.0);
	r6.w = -r3.y + c26.w;
	r3.y = (c109.y * r6.w) + r3.y;
	r6.w = clamp(mix(r3.y, r0.x, r2.w), 0.0, 1.0);
	r1.xyz = r1.xyz * r6.www;
	r1.xyz = r1.xyz * r2.xxx;
	r8.x = ((r6.x >= 0.0) ? c26.z : c26.w);
	r8.y = ((r6.y >= 0.0) ? c26.z : c26.w);
	r8.z = ((r6.z >= 0.0) ? c26.z : c26.w);
	r12.yzw = r6.xyz * r6.xyz;
	r8.xyz = r8.xyz * r12.yzw;
	r16.xyz = r8.xxx * c5.xyz;
	r17.x = ((r6.x >= 0.0) ? c26.w : c26.z);
	r17.y = ((r6.y >= 0.0) ? c26.w : c26.z);
	r17.z = ((r6.z >= 0.0) ? c26.w : c26.z);
	r0.x = clamp(dot(r6.xyz, v9.xyz), 0.0, 1.0);
	r6.xyz = r12.yzw * r17.xyz;
	r12.yzw = (r6.xxx * c4.xyz) + r16.xyz;
	r6.xyw = (r6.yyy * c6.xyz) + r12.yzw;
	r6.xyw = (r8.yyy * c7.xyz) + r6.xyw;
	r6.xyz = (r6.zzz * c8.xyz) + r6.xyw;
	r6.xyz = (r8.zzz * c9.xyz) + r6.xyz;
	r2.x = (r9.y * r9.y) + r9.y;
	r2.w = r9.y * r12.x;
	r2.w = r5.y * r2.w;
	r2.x = r2.x * c27.x;
	r6.xyz = (r15.xyz * r2.xxx) + r6.xyz;
	r2.x = (r4.x * r4.x) + r4.x;
	r3.y = r4.x * r10.y;
	r3.y = r5.y * r3.y;
	r3.y = r5.x * r3.y;
	r2.x = r2.x * c27.x;
	r6.xyz = (r14.xyz * r2.xxx) + r6.xyz;
	r8.xyz = r14.xyz * r3.yyy;
	r2.x = (r2.w * r10.w) + r3.y;
	r2.w = r10.w * r2.w;
	r8.xyz = (r2.www * r15.xyz) + r8.xyz;
	r2.w = (r5.z * r5.z) + r5.z;
	r3.y = r5.z * r10.x;
	r3.y = r5.y * r3.y;
	r2.w = r2.w * c27.x;
	r5.xyz = (r13.xyz * r2.www) + r6.xyz;
	r1.xyz = (r1.xyz * r1.www) + r5.xyz;
	r5.xyz = r1.xyz + v6.xyz;
	r6.xyz = r5.xyz + -c103.xxx;
	r6.xyz = clamp(r6.xyz * c103.yyy, float3(0.0), float3(1.0));
	r6.xyz = (r7.xyz * r6.xyz) + -r7.xyz;
	r1.w = r3.z * c101.x;
	r6.xyz = (r1.www * r6.xyz) + r7.xyz;
	r7.xyz = (r6.xyz * r6.xyz) + -r6.xyz;
	r6.xyz = (c103.zzz * r7.xyz) + r6.xyz;
	r7 = s0_texture.sample(s0, v0.xy);
	r10.xyz = r7.www * c104.xyz;
	r6.xyz = r6.xyz * r10.xyz;
	r1.w = mix(c10.x, c10.y, r11.y);
	r0.yzw = (r0.yzw * r1.www) + r6.xyz;
	r6.x = ((r4.y >= 0.0) ? c26.z : c26.w);
	r6.y = ((r4.z >= 0.0) ? c26.z : c26.w);
	r6.z = ((r4.w >= 0.0) ? c26.z : c26.w);
	r10.xyz = r4.yzw * r4.yzw;
	r4.x = ((r4.y >= 0.0) ? c26.w : c26.z);
	r4.y = ((r4.z >= 0.0) ? c26.w : c26.z);
	r4.z = ((r4.w >= 0.0) ? c26.w : c26.z);
	r4.xyz = r10.xyz * r4.xyz;
	r6.xyz = r6.xyz * r10.xyz;
	r10.xyz = r6.xxx * c5.xyz;
	r10.xyz = (r4.xxx * c4.xyz) + r10.xyz;
	r4.xyw = (r4.yyy * c6.xyz) + r10.xyz;
	r4.xyw = (r6.yyy * c7.xyz) + r4.xyw;
	r4.xyz = (r4.zzz * c8.xyz) + r4.xyw;
	r4.xyz = (r6.zzz * c9.xyz) + r4.xyz;
	r6.xyz = r9.zzz * r15.xyz;
	r4.xyz = r4.xyz * r6.xyz;
	r6.x = v7.w;
	r6.y = v8.w;
	r6.z = v9.w;
	r6.xyz = -r6.xyz + c21.xyz;
	r9.xyz = normalize(r6.xyz);
	r1.w = clamp(dot(-v9.xyz, r9.xyz), 0.0, 1.0);
	r1.w = (r1.w * r1.w) + r1.w;
	r1.w = r1.w * c27.x;
	r6.xyz = r1.www * r15.xyz;
	r9.xyz = c0.xyz * v6.xyz;
	r6.xyz = (r9.xyz * r6.xyz) + -r4.xyz;
	r4.xyz = (r0.xxx * r6.xyz) + r4.xyz;
	r4.xyz = r3.www * r4.xyz;
	r0.xyz = (r0.yzw * r2.zzz) + r4.xyz;
	r0.w = r3.x * c12.w;
	r7.w = r3.x;
	r0.w = (r0.w * c27.y) + c27.x;
	r0.w = fract(r0.w);
	r0.w = (r0.w * c27.z) + c27.w;
	r4.xy = float2(cos(r0.w), sin(r0.w));
	r3.xzw = r7.zxy * c35.xxx;
	r3.xzw = (r7.zxy * c35.xxx) + -r3.wxz;
	r3.xzw = r4.yyy * r3.xzw;
	r3.xzw = (r7.xyz * r4.xxx) + r3.xzw;
	r0.w = -r4.x + c26.w;
	r1.w = dot(c35.xxx, r7.xyz);
	r1.w = r1.w * c35.x;
	r4.xyz = (r1.www * r0.www) + r3.xzw;
	r0.w = abs(c12.w);
	r4.w = c26.w;
	r4 = ((-r0.w >= 0.0) ? r7 : r4);
	r3.xzw = r4.xyz + c26.yyy;
	r3.xzw = (r11.yyy * r3.xzw) + c26.www;
	r0.xyz = r0.xyz * r3.xzw;
	r3.xzw = r4.xyz * r4.xyz;
	r3.xzw = r3.xzw * r3.xzw;
	r0.w = dot(r4.xyz, c31.yzw);
	r6.xyz = r0.www * r3.xzw;
	r1.w = dot(r3.xzw, c31.yzw);
	r3.xzw = mix(r4.xyz, r0.www, -c101.yyy);
	r0.w = r1.w + c34.x;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r0.w = ((r0.w >= 0.0) ? r1.w : c34.y);
	r6.xyz = (r6.xyz * r0.www) + -r4.xyz;
	r6.xyz = (c101.yyy * r6.xyz) + r4.xyz;
	r3.xzw = ((c101.y >= 0.0) ? r6.xyz : r3.xzw);
	r0.w = abs(c101.y);
	r3.xzw = ((-r0.w >= 0.0) ? r4.xyz : r3.xzw);
	r0.w = (r3.y * r5.w) + r2.x;
	r1.w = r5.w * r3.y;
	r2.xzw = (r1.www * r13.xyz) + r8.xyz;
	r6.xy = r0.ww + -c33.xw;
	r6.zw = -c33.xw + c33.yz;
	r0.w = ((r6.z == 0.0) ? FLT_MAX : 1.0 / r6.z);
	r1.w = ((r6.w == 0.0) ? FLT_MAX : 1.0 / r6.w);
	r1.w = clamp(r1.w * r6.y, 0.0, 1.0);
	r0.w = clamp(r0.w * r6.x, 0.0, 1.0);
	r3.y = (r0.w * c32.x) + c32.y;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r3.y;
	r3.y = (r1.w * c32.x) + c32.y;
	r1.w = r1.w * r1.w;
	r1.w = r1.w * r3.y;
	r0.w = r0.w * r1.w;
	r1.w = (v6.w * c11.w) + r9.w;
	r3.y = r11.x * c105.y;
	r1.w = r1.w * r3.y;
	r2.xzw = r1.www * r2.xzw;
	r1.w = r11.y * c101.w;
	r6.xyz = (r4.xyz * r1.www) + -c106.xyz;
	r1.w = clamp(r1.w, 0.0, 1.0);
	r6.xyz = (r1.www * r6.xyz) + c106.xyz;
	r7.xyz = r2.xzw * r6.xyz;
	r1.w = dot(r7.xyz, c31.yzw);
	r0.w = r0.w * r1.w;
	r0.w = r0.w * c106.w;
	r1.w = dot(r1.xyz, c31.yzw);
	r1.xyz = (r2.xzw * r6.xyz) + r1.xyz;
	r1.x = dot(r1.xyz, c31.yzw);
	r1.x = r1.x + c34.z;
	r1.x = clamp(r1.x * c34.w, 0.0, 1.0);
	r1.yz = r1.ww + -c2.xw;
	r7.xy = -c2.xw + c2.yz;
	r1.w = ((r7.y == 0.0) ? FLT_MAX : 1.0 / r7.y);
	r3.y = ((r7.x == 0.0) ? FLT_MAX : 1.0 / r7.x);
	r1.y = clamp(r1.y * r3.y, 0.0, 1.0);
	r1.z = clamp(r1.w * r1.z, 0.0, 1.0);
	r1.w = (r1.z * c32.x) + c32.y;
	r1.z = r1.z * r1.z;
	r0.w = (r1.w * r1.z) + r0.w;
	r1.z = (r1.y * c32.x) + c32.y;
	r1.y = r1.y * r1.y;
	r1.y = r1.y * r1.z;
	r0.w = r0.w * r1.y;
	r0.w = r4.w * r0.w;
	r1.yzw = mix(r4.xyz, r3.xzw, r0.www);
	r0.w = dot(r1.yzw, c31.yzw);
	r3.xyz = r0.www * c102.xyz;
	r4.yzw = c31.yzw;
	r0.w = dot(c102.xyz, r4.yzw);
	r3.w = r0.w + c34.x;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r3.w >= 0.0) ? r0.w : c34.y);
	r3.xyz = (r3.xyz * r0.www) + -r1.yzw;
	r3.xyz = (c102.www * r3.xyz) + r1.yzw;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r3.xyz = (r3.xyz * r0.www) + -r1.yzw;
	r0.w = (r1.x * c32.x) + c32.y;
	r1.x = r1.x * r1.x;
	r0.w = r0.w * r1.x;
	r1.xyz = (r0.www * r3.xyz) + r1.yzw;
	r1.xyz = r11.zzz * r1.xyz;
	r0.xyz = (r1.xyz * r5.xyz) + r0.xyz;
	r0.xyz = (r2.xzw * r6.xyz) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	oC0.xyz = (r2.yyy * r0.xyz) + r1.xyz;
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

