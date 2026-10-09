#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[43];
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
	depth2d<float> s8_texture [[texture(8)]],
	sampler s8 [[sampler(8)]],
	texture2d<float> s10_texture [[texture(10)]],
	sampler s10 [[sampler(10)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c13 = float4(1.591549367e-01, 5.000000000e-01, 6.283185482e+00, -3.141592741e+00); (void) c13;
	const float4 c14 = float4(1.000000000e+00, 0.000000000e+00, 1.041666627e+00, -2.083333395e-02); (void) c14;
	const float4 c15 = float4(4.882812500e-04, 0.000000000e+00, -4.882812500e-04, 6.250000000e-02); (void) c15;
	const float4 c16 = float4(1.250000000e-01, 2.500000000e-01, 7.963267271e-04, 9.999997020e-01); (void) c16;
	const float4 c17 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -9.999999975e-07); (void) c17;
	const float4 c18 = float4(5.773500204e-01, 1.000000000e+00, 2.000000000e+00, -1.000000000e+00); (void) c18;
	const float4 c26 = float4(1.000000000e+06, -3.000000119e-01, -3.333333254e+00, 0.000000000e+00); (void) c26;
	const float4 c27 = float4(-2.000000000e+00, 3.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c27;
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
	#define c67 uniforms.uniforms_float4[23]
	#define c68 uniforms.uniforms_float4[24]
	#define c69 uniforms.uniforms_float4[25]
	#define c70 uniforms.uniforms_float4[26]
	#define c71 uniforms.uniforms_float4[27]
	#define c73 uniforms.uniforms_float4[28]
	#define c74 uniforms.uniforms_float4[29]
	#define c77 uniforms.uniforms_float4[30]
	#define c78 uniforms.uniforms_float4[31]
	#define c85 uniforms.uniforms_float4[32]
	#define c86 uniforms.uniforms_float4[33]
	#define c87 uniforms.uniforms_float4[34]
	#define c89 uniforms.uniforms_float4[35]
	#define c101 uniforms.uniforms_float4[36]
	#define c102 uniforms.uniforms_float4[37]
	#define c103 uniforms.uniforms_float4[38]
	#define c104 uniforms.uniforms_float4[39]
	#define c105 uniforms.uniforms_float4[40]
	#define c106 uniforms.uniforms_float4[41]
	#define c107 uniforms.uniforms_float4[42]
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
	r0 = (v5.xyzx * c14.xxxy) + c14.yyyx;
	r1.x = dot(r0, c73);
	r1.y = dot(r0, c74);
	r1.zw = (r1.xy * c14.zz) + c14.ww;
	r2.xy = clamp(r1.zw, float2(0.0), float2(1.0));
	r1.zw = -r1.zw + r2.xy;
	r1.z = dot(r1.zw, c14.xx) + c14.y;
	r1.w = dot(r0, c77);
	r2.x = ((-abs(r1.z) >= 0.0) ? r1.x : r1.w);
	r1.x = dot(r0, c78);
	r2.y = ((-abs(r1.z) >= 0.0) ? r1.y : r1.x);
	r1.x = dot(r0, c69);
	r1.y = dot(r0, c70);
	r0.z = dot(r0, c71);
	r2.zw = (r1.xy * c14.zz) + c14.ww;
	r3.xy = clamp(r2.zw, float2(0.0), float2(1.0));
	r2.zw = -r2.zw + r3.xy;
	r1.w = dot(r2.zw, c14.xx) + c14.y;
	r1.xy = ((-abs(r1.w) >= 0.0) ? r1.xy : r2.xy);
	r2.xy = clamp(r1.xy, float2(0.0), float2(1.0));
	r1.xy = r1.xy + -c13.yy;
	r1.xy = abs(r1.xy) + -c67.zz;
	r1.xy = clamp(r1.xy * c67.ww, float2(0.0), float2(1.0));
	r1.xy = -r1.xy + c18.yy;
	r3.xy = c86.xy;
	r2.zw = ((-abs(r1.z) >= 0.0) ? r3.xy : c87.xy);
	r1.z = ((-abs(r1.z) >= 0.0) ? c14.x : c14.y);
	r1.z = ((-abs(r1.w) >= 0.0) ? c18.y : r1.z);
	r2.zw = ((-abs(r1.w) >= 0.0) ? c85.xy : r2.zw);
	r0.xy = (r2.xy * c13.yy) + r2.zw;
	r1.x = clamp((r1.x * r1.y) + r1.z, 0.0, 1.0);
	r0.w = c14.y;
	r2 = r0 + c15.xxyy;
	r2 = float4(s8_texture.sample_compare(s8, (r2.xyz).xy, (r2.xyz).z, level(r2.w)));
	r3 = r0 + c15.zxyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r2.y = r3.x;
	r3 = r0 + c15.xzyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r2.z = r3.x;
	r3 = r0 + c15.zzyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r2.w = r3.x;
	r1.y = dot(r2, c15.wwww);
	r2 = r0 + c15.xyyy;
	r2 = float4(s8_texture.sample_compare(s8, (r2.xyz).xy, (r2.xyz).z, level(r2.w)));
	r3 = r0 + c15.zyyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r2.y = r3.x;
	r3 = r0 + c15.yzyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r2.z = r3.x;
	r3 = r0 + c15.yxyy;
	r0 = float4(s8_texture.sample_compare(s8, (r0.xyz).xy, (r0.xyz).z, level(r0.w)));
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r2.w = r3.x;
	r0.y = dot(r2, c16.xxxx);
	r0.y = r0.y + r1.y;
	r0.x = (r0.x * c16.y) + r0.y;
	r0.x = r0.x + c18.w;
	r0.x = (r1.x * r0.x) + c18.y;
	r0.yzw = -c89.xyz + v5.xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.y = clamp((r0.y * c68.y) + c68.x, 0.0, 1.0);
	r1.x = mix(r0.x, c18.y, r0.y);
	r0.xyz = c23.xyz + -v5.xyz;
	r2.xyz = normalize(r0.xyz);
	r0 = s1_texture.sample(s1, v0.xy);
	r0.xyz = (r0.xyz * c18.zzz) + c18.www;
	r3.x = dot(v2.xyz, r0.xyz);
	r3.y = dot(v3.xyz, r0.xyz);
	r3.z = dot(v4.xyz, r0.xyz);
	r0.xyz = normalize(r3.xyz);
	r1.yzw = r0.zxy * v8.yzx;
	r1.yzw = (r0.yzx * v8.zxy) + -r1.yzw;
	r3.xyz = normalize(r1.yzw);
	r1.yzw = r0.zxy * r3.yzx;
	r1.yzw = (r0.yzx * r3.zxy) + -r1.yzw;
	r3.xyz = r3.xyz * c16.zzz;
	r4.xyz = normalize(r1.yzw);
	r1.yzw = (r4.xyz * c16.www) + r3.xyz;
	r3.xyz = normalize(r1.yzw);
	r1.y = dot(r2.xyz, r3.xxx);
	r1.z = (r1.y * -r1.y) + c18.y;
	r1.z = ((r1.z == 0.0) ? FLT_MAX : rsqrt(abs(r1.z)));
	r1.z = ((r1.z == 0.0) ? FLT_MAX : 1.0 / r1.z);
	r4.xyz = c3.xyz + -v5.xyz;
	r1.w = dot(r4.xyz, r4.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r5.xyz = r1.www * r4.xyz;
	r2.w = dot(r5.xyz, r3.xyz);
	r3.w = (r2.w * -r2.w) + c18.y;
	r3.w = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r3.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r1.z = r1.z * r3.w;
	r1.y = clamp((r2.w * r1.y) + r1.z, 0.0, 1.0);
	r6.xyz = (r4.xyz * r1.www) + r2.xyz;
	r1.z = clamp(dot(r0.xyz, r2.xyz), 0.0, 1.0);
	r2.xyz = normalize(r6.xyz);
	r2.x = clamp(dot(r0.xyz, r2.xyz), 0.0, 1.0);
	r6.x = mix(r2.x, r1.y, c10.w);
	r7 = s10_texture.sample(s10, v0.xy);
	r6.w = r7.w;
	r8 = s7_texture.sample(s7, r6.xw);
	r1.y = r1.z * r6.x;
	r2.x = ((r1.z == 0.0) ? FLT_MAX : rsqrt(abs(r1.z)));
	r1.z = (r1.z * r1.z) + r1.z;
	r1.z = r1.z * c13.y;
	r2.x = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r8.xyz = r2.xxx * r8.xyz;
	r9.xyz = c22.xyz * v1.yyy;
	r8.xyz = r8.xyz * r9.xyz;
	r10.xyz = c21.xyz + -v5.xyz;
	r11.xyz = normalize(r10.xyz);
	r2.y = dot(r11.xyz, r3.xxx);
	r2.z = (r2.y * -r2.y) + c18.y;
	r2.z = ((r2.z == 0.0) ? FLT_MAX : rsqrt(abs(r2.z)));
	r2.z = ((r2.z == 0.0) ? FLT_MAX : 1.0 / r2.z);
	r2.z = r2.z * r3.w;
	r2.y = clamp((r2.w * r2.y) + r2.z, 0.0, 1.0);
	r10.xyz = (r4.xyz * r1.www) + r11.xyz;
	r12.xyz = normalize(r10.xyz);
	r2.z = clamp(dot(r0.xyz, r12.xyz), 0.0, 1.0);
	r6.y = mix(r2.z, r2.y, c10.w);
	r10 = s7_texture.sample(s7, r6.yw);
	r2.y = clamp(dot(r0.xyz, r11.xyz), 0.0, 1.0);
	r2.z = clamp(r11.z, 0.0, 1.0);
	r2.z = (r2.z * r2.z) + r2.z;
	r2.z = r2.z * c13.y;
	r4.w = ((r2.y == 0.0) ? FLT_MAX : rsqrt(abs(r2.y)));
	r4.w = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r10.xyz = r4.www * r10.xyz;
	r11.xyz = c20.xyz * v1.xxx;
	r10.xyz = r10.xyz * r11.xyz;
	r8.xyz = (r10.xyz * r1.xxx) + r8.xyz;
	r10.xyz = c25.xyz + -v5.xyz;
	r12.xyz = normalize(r10.xyz);
	r5.w = dot(r12.xyz, r3.xxx);
	r6.x = (r5.w * -r5.w) + c18.y;
	r6.x = ((r6.x == 0.0) ? FLT_MAX : rsqrt(abs(r6.x)));
	r6.x = ((r6.x == 0.0) ? FLT_MAX : 1.0 / r6.x);
	r6.x = r3.w * r6.x;
	r5.w = clamp((r2.w * r5.w) + r6.x, 0.0, 1.0);
	r10.xyz = (r4.xyz * r1.www) + r12.xyz;
	r6.x = clamp(dot(r0.xyz, r12.xyz), 0.0, 1.0);
	r12.xyz = normalize(r10.xyz);
	r7.w = clamp(dot(r0.xyz, r12.xyz), 0.0, 1.0);
	r10.y = mix(r7.w, r5.w, c10.w);
	r10.z = r6.w;
	r12 = s7_texture.sample(s7, r10.yz);
	r5.w = r6.x * r10.y;
	r7.w = ((r6.x == 0.0) ? FLT_MAX : rsqrt(abs(r6.x)));
	r6.x = (r6.x * r6.x) + r6.x;
	r6.x = r6.x * c13.y;
	r7.w = ((r7.w == 0.0) ? FLT_MAX : 1.0 / r7.w);
	r12.xyz = r7.www * r12.xyz;
	r13.xyz = c24.xyz * v1.zzz;
	r8.xyz = (r12.xyz * r13.xyz) + r8.xyz;
	r12.x = c23.w + -v5.x;
	r12.y = c24.w + -v5.y;
	r12.z = c25.w + -v5.z;
	r14.xyz = normalize(r12.xyz);
	r8.w = dot(r14.xyz, r3.xxx);
	r9.w = (r8.w * -r8.w) + c18.y;
	r9.w = ((r9.w == 0.0) ? FLT_MAX : rsqrt(abs(r9.w)));
	r9.w = ((r9.w == 0.0) ? FLT_MAX : 1.0 / r9.w);
	r3.w = r3.w * r9.w;
	r2.w = clamp((r2.w * r8.w) + r3.w, 0.0, 1.0);
	r12.xyz = (r4.xyz * r1.www) + r14.xyz;
	r3.w = clamp(dot(r0.xyz, r14.xyz), 0.0, 1.0);
	r14.xyz = normalize(r12.xyz);
	r8.w = clamp(dot(r0.xyz, r14.xyz), 0.0, 1.0);
	r10.x = mix(r8.w, r2.w, c10.w);
	r12 = s7_texture.sample(s7, r10.xz);
	r2.w = r3.w * r10.x;
	r8.w = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r3.w = (r3.w * r3.w) + r3.w;
	r3.w = r3.w * c13.y;
	r8.w = ((r8.w == 0.0) ? FLT_MAX : 1.0 / r8.w);
	r10.xyz = r8.www * r12.xyz;
	r12.x = c20.w * v1.w;
	r12.y = c21.w * v1.w;
	r12.z = c22.w * v1.w;
	r8.xyz = (r10.xyz * r12.xyz) + r8.xyz;
	r8.xyz = r0.www * r8.xyz;
	r10.x = ((r0.x >= 0.0) ? c14.y : c14.x);
	r10.y = ((r0.y >= 0.0) ? c14.y : c14.x);
	r10.z = ((r0.z >= 0.0) ? c14.y : c14.x);
	r14.xyz = r0.xyz * r0.xyz;
	r10.xyz = r10.xyz * r14.xyz;
	r15.xyz = r10.xxx * c5.xyz;
	r16.x = ((r0.x >= 0.0) ? c14.x : c14.y);
	r16.y = ((r0.y >= 0.0) ? c14.x : c14.y);
	r16.z = ((r0.z >= 0.0) ? c14.x : c14.y);
	r14.xyz = r14.xyz * r16.xyz;
	r15.xyz = (r14.xxx * c4.xyz) + r15.xyz;
	r14.xyw = (r14.yyy * c6.xyz) + r15.xyz;
	r10.xyw = (r10.yyy * c7.xyz) + r14.xyw;
	r10.xyw = (r14.zzz * c8.xyz) + r10.xyw;
	r10.xyz = (r10.zzz * c9.xyz) + r10.xyw;
	r0.w = (r2.y * r2.y) + r2.y;
	r2.y = r2.y * r6.y;
	r0.w = r0.w * c13.y;
	r14.xyz = r0.www * r11.xyz;
	r10.xyz = (r14.xyz * r1.xxx) + r10.xyz;
	r10.xyz = (r9.xyz * r1.zzz) + r10.xyz;
	r10.xyz = (r13.xyz * r6.xxx) + r10.xyz;
	r10.xyz = (r12.xyz * r3.www) + r10.xyz;
	r14.xyz = r10.xyz + v6.xyz;
	r15.xyz = r14.xyz + -c103.xxx;
	r15.xyz = clamp(r15.xyz * c103.yyy, float3(0.0), float3(1.0));
	r16.xyz = r0.xyz * r3.yzx;
	r16.xyz = (r3.xyz * r0.yzx) + -r16.xyz;
	r17.xyz = r3.yzx * r16.xyz;
	r3.xyz = (r16.zxy * r3.zxy) + -r17.xyz;
	r0.w = dot(r3.xyz, r3.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r3.xyz = (r3.xyz * r0.www) + -r5.xyz;
	r3.xyz = (c10.www * r3.xyz) + r5.xyz;
	r6.z = clamp(dot(r5.xyz, r0.xyz), 0.0, 1.0);
	r0.w = dot(r0.xyz, r3.xyz);
	r0.w = r0.w + r0.w;
	r1.z = dot(r0.xyz, r0.xyz);
	r3.xyz = r3.xyz * r1.zzz;
	r3.xyz = (r0.www * r0.xyz) + -r3.xyz;
	r16 = s6_texture.sample(s6, r3.xyz);
	r5.xyz = r16.xyz * c30.zzz;
	r17.xyz = r5.xyz * r5.xyz;
	r17.xyz = r17.xyz * r17.xyz;
	r0.w = dot(r17.xyz, c17.xyz);
	r1.z = r0.w + c17.w;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r1.z >= 0.0) ? r0.w : c26.x);
	r1.z = dot(r5.xyz, c17.xyz);
	r17.xyz = r1.zzz * r17.xyz;
	r16.xyz = (c30.zzz * -r16.xyz) + r1.zzz;
	r16.xyz = (-c103.www * r16.xyz) + r5.xyz;
	r17.xyz = (r17.xyz * r0.www) + -r5.xyz;
	r17.xyz = (c103.www * r17.xyz) + r5.xyz;
	r16.xyz = ((c103.w >= 0.0) ? r17.xyz : r16.xyz);
	r0.w = abs(c103.w);
	r5.xyz = ((-r0.w >= 0.0) ? r5.xyz : r16.xyz);
	r15.xyz = (r5.xyz * r15.xyz) + -r5.xyz;
	r5.xyz = (c101.xxx * r15.xyz) + r5.xyz;
	r15.xyz = (r5.xyz * r5.xyz) + -r5.xyz;
	r5.xyz = (c103.zzz * r15.xyz) + r5.xyz;
	r15 = s0_texture.sample(s0, v0.xy);
	r16.xyz = r15.www * c104.xyz;
	r5.xyz = r5.xyz * r16.xyz;
	r0.w = mix(c10.x, c10.y, r7.y);
	r5.xyz = (r8.xyz * r0.www) + r5.xyz;
	r8.x = ((r3.x >= 0.0) ? c14.y : c14.x);
	r8.y = ((r3.y >= 0.0) ? c14.y : c14.x);
	r8.z = ((r3.z >= 0.0) ? c14.y : c14.x);
	r16.xyz = r3.xyz * r3.xyz;
	r3.x = ((r3.x >= 0.0) ? c14.x : c14.y);
	r3.y = ((r3.y >= 0.0) ? c14.x : c14.y);
	r3.z = ((r3.z >= 0.0) ? c14.x : c14.y);
	r3.xyz = r16.xyz * r3.xyz;
	r8.xyz = r8.xyz * r16.xyz;
	r16.xyz = r8.xxx * c5.xyz;
	r16.xyz = (r3.xxx * c4.xyz) + r16.xyz;
	r3.xyw = (r3.yyy * c6.xyz) + r16.xyz;
	r3.xyw = (r8.yyy * c7.xyz) + r3.xyw;
	r3.xyz = (r3.zzz * c8.xyz) + r3.xyw;
	r3.xyz = (r8.zzz * c9.xyz) + r3.xyz;
	r8.xyz = r2.zzz * r11.xyz;
	r3.xyz = r3.xyz * r8.xyz;
	r8.x = v7.w;
	r8.y = v8.w;
	r8.z = v9.w;
	r8.xyz = -r8.xyz + c21.xyz;
	r16.xyz = normalize(r8.xyz);
	r0.w = clamp(dot(-v9.xyz, r16.xyz), 0.0, 1.0);
	r0.w = (r0.w * r0.w) + r0.w;
	r0.w = r0.w * c13.y;
	r8.xyz = r0.www * r11.xyz;
	r16.xyz = c0.xyz * v6.xyz;
	r8.xyz = (r16.xyz * r8.xyz) + -r3.xyz;
	r0.w = clamp(dot(r0.xyz, v9.xyz), 0.0, 1.0);
	r3.xyz = (r0.www * r8.xyz) + r3.xyz;
	r16 = s4_texture.sample(s4, r6.zw);
	r0.w = -r6.z + c18.y;
	r1.z = pow(abs(r0.w), c105.x);
	r0.w = r7.x * r16.z;
	r0.w = r0.w * c0.w;
	r3.xyz = r0.www * r3.xyz;
	r3.xyz = (r5.xyz * r16.yyy) + r3.xyz;
	r5.xyz = r15.zxy * c18.xxx;
	r5.xyz = (r15.zxy * c18.xxx) + -r5.zxy;
	r6.xy = c13.xy;
	r0.w = (c12.w * r6.x) + r6.y;
	r0.w = fract(r0.w);
	r0.w = (r0.w * c13.z) + c13.w;
	r6.xy = float2(cos(r0.w), sin(r0.w));
	r5.xyz = r5.xyz * r6.yyy;
	r5.xyz = (r15.xyz * r6.xxx) + r5.xyz;
	r0.w = -r6.x + c18.y;
	r2.z = dot(c18.xxx, r15.xyz);
	r2.z = r2.z * c18.x;
	r5.xyz = (r2.zzz * r0.www) + r5.xyz;
	r0.w = abs(c12.w);
	r5.xyz = ((-r0.w >= 0.0) ? r15.xyz : r5.xyz);
	r6.xyz = r5.xyz + c18.www;
	r6.xyz = (r7.yyy * r6.xyz) + c18.yyy;
	r3.xyz = r3.xyz * r6.xyz;
	r6.xyz = r5.xyz * r5.xyz;
	r6.xyz = r6.xyz * r6.xyz;
	r0.w = dot(r5.xyz, c17.xyz);
	r8.xyz = r0.www * r6.xyz;
	r2.z = dot(r6.xyz, c17.xyz);
	r6.xyz = mix(r5.xyz, r0.www, -c101.yyy);
	r0.w = r2.z + c17.w;
	r2.z = ((r2.z == 0.0) ? FLT_MAX : 1.0 / r2.z);
	r0.w = ((r0.w >= 0.0) ? r2.z : c26.x);
	r8.xyz = (r8.xyz * r0.www) + -r5.xyz;
	r8.xyz = (c101.yyy * r8.xyz) + r5.xyz;
	r6.xyz = ((c101.y >= 0.0) ? r8.xyz : r6.xyz);
	r0.w = abs(c101.y);
	r6.xyz = ((-r0.w >= 0.0) ? r5.xyz : r6.xyz);
	r0.w = r1.z * r1.y;
	r0.w = r2.x * r0.w;
	r8.xyz = r9.xyz * r0.www;
	r1.y = r1.z * r2.y;
	r2.x = r4.w * r1.y;
	r0.w = (r1.y * r4.w) + r0.w;
	r2.xyz = r11.xyz * r2.xxx;
	r2.xyz = (r2.xyz * r1.xxx) + r8.xyz;
	r1.x = r1.z * r5.w;
	r1.y = r7.w * r1.x;
	r0.w = (r1.x * r7.w) + r0.w;
	r2.xyz = (r1.yyy * r13.xyz) + r2.xyz;
	r1.x = r1.z * r2.w;
	r1.y = r8.w * r1.x;
	r0.w = (r1.x * r8.w) + r0.w;
	r8.xy = r0.ww + -c33.xw;
	r2.xyz = (r1.yyy * r12.xyz) + r2.xyz;
	r1.y = c18.y;
	r0.w = (v6.w * c11.w) + r1.y;
	r1.x = r7.x * c105.y;
	r0.w = r0.w * r1.x;
	r2.xyz = r0.www * r2.xyz;
	r0.w = r7.y * c101.w;
	r9.xyz = (r5.xyz * r0.www) + -c106.xyz;
	r0.w = clamp(r0.w, 0.0, 1.0);
	r9.xyz = (r0.www * r9.xyz) + c106.xyz;
	r11.xyz = r2.xyz * r9.xyz;
	r0.w = dot(r11.xyz, c17.xyz);
	r1.xy = -c33.xw + c33.yz;
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.y = ((r1.y == 0.0) ? FLT_MAX : 1.0 / r1.y);
	r1.xy = clamp(r1.xy * r8.xy, float2(0.0), float2(1.0));
	r2.w = (r1.x * c27.x) + c27.y;
	r1.x = r1.x * r1.x;
	r1.x = r1.x * r2.w;
	r2.w = (r1.y * c27.x) + c27.y;
	r1.y = r1.y * r1.y;
	r1.y = r1.y * r2.w;
	r1.x = r1.y * r1.x;
	r0.w = r0.w * r1.x;
	r0.w = r0.w * c106.w;
	r1.x = dot(r10.xyz, c17.xyz);
	r8.xyz = (r2.xyz * r9.xyz) + r10.xyz;
	r1.y = dot(r8.xyz, c17.xyz);
	r1.y = r1.y + c26.y;
	r1.y = clamp(r1.y * c26.z, 0.0, 1.0);
	r7.yw = r1.xx + -c2.xw;
	r8.xy = -c2.xw + c2.yz;
	r1.x = ((r8.y == 0.0) ? FLT_MAX : 1.0 / r8.y);
	r2.w = ((r8.x == 0.0) ? FLT_MAX : 1.0 / r8.x);
	r2.w = clamp(r2.w * r7.y, 0.0, 1.0);
	r1.x = clamp(r1.x * r7.w, 0.0, 1.0);
	r3.w = (r1.x * c27.x) + c27.y;
	r1.x = r1.x * r1.x;
	r0.w = (r3.w * r1.x) + r0.w;
	r1.x = (r2.w * c27.x) + c27.y;
	r2.w = r2.w * r2.w;
	r1.x = r1.x * r2.w;
	r0.w = r0.w * r1.x;
	r8.xyz = mix(r5.xyz, r6.xyz, r0.www);
	r0.w = dot(r8.xyz, c17.xyz);
	r5.xyz = r0.www * c102.xyz;
	r6.xyz = c17.xyz;
	r0.w = dot(c102.xyz, r6.xyz);
	r1.x = r0.w + c17.w;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r1.x >= 0.0) ? r0.w : c26.x);
	r5.xyz = (r5.xyz * r0.www) + -r8.xyz;
	r5.xyz = (c102.www * r5.xyz) + r8.xyz;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r5.xyz = (r5.xyz * r0.www) + -r8.xyz;
	r0.w = (r1.y * c27.x) + c27.y;
	r1.x = r1.y * r1.y;
	r0.w = r0.w * r1.x;
	r5.xyz = (r0.www * r5.xyz) + r8.xyz;
	r5.xyz = r7.zzz * r5.xyz;
	r3.xyz = (r5.xyz * r14.xyz) + r3.xyz;
	r2.xyz = (r2.xyz * r9.xyz) + r3.xyz;
	r3.x = v2.w;
	r3.y = v3.w;
	r3.z = v4.w;
	r4.xyz = (r4.xyz * r1.www) + r3.xyz;
	r0.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r0.w = clamp((r0.w * c19.w) + c19.x, 0.0, 1.0);
	r1.x = min(r0.w, c19.z);
	r0.w = r1.x * r1.x;
	r1.x = clamp(dot(r0.xyz, r3.xyz), 0.0, 1.0);
	r3.xyz = normalize(r4.xyz);
	r0.x = clamp(dot(r0.xyz, r3.xyz), 0.0, 1.0);
	r0.x = r1.x * r0.x;
	r0.y = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r0.x = r1.z * r0.x;
	r0.x = r0.y * r0.x;
	r1.xyz = v6.www * v6.xyz;
	r1.xyz = r1.xyz * c107.xyz;
	r0.xyz = r0.xxx * r1.xyz;
	r0.xyz = (r0.xyz * r7.xxx) + r2.xyz;
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
	#undef c67
	#undef c68
	#undef c69
	#undef c70
	#undef c71
	#undef c73
	#undef c74
	#undef c77
	#undef c78
	#undef c85
	#undef c86
	#undef c87
	#undef c89
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

