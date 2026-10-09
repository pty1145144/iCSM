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
	const float4 c0 = float4(1.591549367e-01, 5.000000000e-01, 6.283185482e+00, -3.141592741e+00); (void) c0;
	const float4 c2 = float4(1.000000000e+00, 0.000000000e+00, 1.041666627e+00, -2.083333395e-02); (void) c2;
	const float4 c13 = float4(4.882812500e-04, 0.000000000e+00, -4.882812500e-04, 6.250000000e-02); (void) c13;
	const float4 c14 = float4(1.250000000e-01, 2.500000000e-01, -9.999999975e-07, 1.000000000e+06); (void) c14;
	const float4 c15 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -3.000000119e-01); (void) c15;
	const float4 c16 = float4(5.773500204e-01, 1.000000000e+00, 2.000000000e+00, -1.000000000e+00); (void) c16;
	const float4 c17 = float4(-3.333333254e+00, -2.000000000e+00, 3.000000000e+00, 0.000000000e+00); (void) c17;
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
	#define c1 uniforms.uniforms_float4[0]
	#define c3 uniforms.uniforms_float4[1]
	#define c4 uniforms.uniforms_float4[2]
	#define c5 uniforms.uniforms_float4[3]
	#define c6 uniforms.uniforms_float4[4]
	#define c7 uniforms.uniforms_float4[5]
	#define c8 uniforms.uniforms_float4[6]
	#define c9 uniforms.uniforms_float4[7]
	#define c10 uniforms.uniforms_float4[8]
	#define c11 uniforms.uniforms_float4[9]
	#define c12 uniforms.uniforms_float4[10]
	#define c20 uniforms.uniforms_float4[11]
	#define c21 uniforms.uniforms_float4[12]
	#define c22 uniforms.uniforms_float4[13]
	#define c23 uniforms.uniforms_float4[14]
	#define c24 uniforms.uniforms_float4[15]
	#define c25 uniforms.uniforms_float4[16]
	#define c30 uniforms.uniforms_float4[17]
	#define c67 uniforms.uniforms_float4[18]
	#define c68 uniforms.uniforms_float4[19]
	#define c69 uniforms.uniforms_float4[20]
	#define c70 uniforms.uniforms_float4[21]
	#define c71 uniforms.uniforms_float4[22]
	#define c73 uniforms.uniforms_float4[23]
	#define c74 uniforms.uniforms_float4[24]
	#define c77 uniforms.uniforms_float4[25]
	#define c78 uniforms.uniforms_float4[26]
	#define c85 uniforms.uniforms_float4[27]
	#define c86 uniforms.uniforms_float4[28]
	#define c87 uniforms.uniforms_float4[29]
	#define c89 uniforms.uniforms_float4[30]
	#define c101 uniforms.uniforms_float4[31]
	#define c102 uniforms.uniforms_float4[32]
	#define c103 uniforms.uniforms_float4[33]
	#define c104 uniforms.uniforms_float4[34]
	#define c105 uniforms.uniforms_float4[35]
	#define c106 uniforms.uniforms_float4[36]
	#define c107 uniforms.uniforms_float4[37]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	oC0.w = r0.w * c1.w;
	r1 = (v5.xyzx * c2.xxxy) + c2.yyyx;
	r2.x = dot(r1, c73);
	r2.y = dot(r1, c74);
	r2.zw = (r2.xy * c2.zz) + c2.ww;
	r3.xy = clamp(r2.zw, float2(0.0), float2(1.0));
	r2.zw = -r2.zw + r3.xy;
	r0.w = dot(r2.zw, c2.xx) + c2.y;
	r2.z = dot(r1, c77);
	r3.x = ((-abs(r0.w) >= 0.0) ? r2.x : r2.z);
	r2.x = dot(r1, c78);
	r3.y = ((-abs(r0.w) >= 0.0) ? r2.y : r2.x);
	r2.x = dot(r1, c69);
	r2.y = dot(r1, c70);
	r1.z = dot(r1, c71);
	r2.zw = (r2.xy * c2.zz) + c2.ww;
	r3.zw = clamp(r2.zw, float2(0.0), float2(1.0));
	r2.zw = -r2.zw + r3.zw;
	r2.z = dot(r2.zw, c2.xx) + c2.y;
	r2.xy = ((-abs(r2.z) >= 0.0) ? r2.xy : r3.xy);
	r3.xy = clamp(r2.xy, float2(0.0), float2(1.0));
	r2.xy = r2.xy + -c0.yy;
	r2.xy = abs(r2.xy) + -c67.zz;
	r2.xy = clamp(r2.xy * c67.ww, float2(0.0), float2(1.0));
	r2.xy = -r2.xy + c16.yy;
	r4.xy = c86.xy;
	r3.zw = ((-abs(r0.w) >= 0.0) ? r4.xy : c87.xy);
	r0.w = ((-abs(r0.w) >= 0.0) ? c2.x : c2.y);
	r0.w = ((-abs(r2.z) >= 0.0) ? c16.y : r0.w);
	r2.zw = ((-abs(r2.z) >= 0.0) ? c85.xy : r3.zw);
	r1.xy = (r3.xy * c0.yy) + r2.zw;
	r0.w = clamp((r2.x * r2.y) + r0.w, 0.0, 1.0);
	r1.w = c2.y;
	r2 = r1 + c13.xxyy;
	r2 = float4(s8_texture.sample_compare(s8, (r2.xyz).xy, (r2.xyz).z, level(r2.w)));
	r3 = r1 + c13.zxyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r2.y = r3.x;
	r3 = r1 + c13.xzyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r2.z = r3.x;
	r3 = r1 + c13.zzyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r2.w = r3.x;
	r2.x = dot(r2, c13.wwww);
	r3 = r1 + c13.xyyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r4 = r1 + c13.zyyy;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
	r3.y = r4.x;
	r4 = r1 + c13.yzyy;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
	r3.z = r4.x;
	r4 = r1 + c13.yxyy;
	r1 = float4(s8_texture.sample_compare(s8, (r1.xyz).xy, (r1.xyz).z, level(r1.w)));
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
	r3.w = r4.x;
	r1.y = dot(r3, c14.xxxx);
	r1.y = r1.y + r2.x;
	r1.x = (r1.x * c14.y) + r1.y;
	r1.x = r1.x + c16.w;
	r0.w = (r0.w * r1.x) + c16.y;
	r1.xyz = -c89.xyz + v5.xyz;
	r1.x = dot(r1.xyz, r1.xyz);
	r1.x = clamp((r1.x * c68.y) + c68.x, 0.0, 1.0);
	r2.x = mix(r0.w, c16.y, r1.x);
	r1 = s1_texture.sample(s1, v0.xy);
	r1.xyz = (r1.xyz * c16.zzz) + c16.www;
	r3.x = dot(v2.xyz, r1.xyz);
	r3.y = dot(v3.xyz, r1.xyz);
	r3.z = dot(v4.xyz, r1.xyz);
	r1.xyz = normalize(r3.xyz);
	r2.y = ((r1.x >= 0.0) ? c2.y : c2.x);
	r2.z = ((r1.y >= 0.0) ? c2.y : c2.x);
	r2.w = ((r1.z >= 0.0) ? c2.y : c2.x);
	r3.xyz = r1.xyz * r1.xyz;
	r2.yzw = r2.yzw * r3.xyz;
	r4.xyz = r2.yyy * c5.xyz;
	r5.x = ((r1.x >= 0.0) ? c2.x : c2.y);
	r5.y = ((r1.y >= 0.0) ? c2.x : c2.y);
	r5.z = ((r1.z >= 0.0) ? c2.x : c2.y);
	r3.xyz = r3.xyz * r5.xyz;
	r4.xyz = (r3.xxx * c4.xyz) + r4.xyz;
	r3.xyw = (r3.yyy * c6.xyz) + r4.xyz;
	r3.xyw = (r2.zzz * c7.xyz) + r3.xyw;
	r3.xyz = (r3.zzz * c8.xyz) + r3.xyw;
	r2.yzw = (r2.www * c9.xyz) + r3.xyz;
	r3.xyz = c21.xyz + -v5.xyz;
	r4.xyz = normalize(r3.xyz);
	r0.w = clamp(dot(r1.xyz, r4.xyz), 0.0, 1.0);
	r3.x = (r0.w * r0.w) + r0.w;
	r3.x = r3.x * c0.y;
	r3.yzw = c20.xyz * v1.xxx;
	r5.xyz = r3.xxx * r3.yzw;
	r2.yzw = (r5.xyz * r2.xxx) + r2.yzw;
	r5.xyz = c22.xyz * v1.yyy;
	r6.xyz = c23.xyz + -v5.xyz;
	r7.xyz = normalize(r6.xyz);
	r3.x = clamp(dot(r1.xyz, r7.xyz), 0.0, 1.0);
	r4.w = (r3.x * r3.x) + r3.x;
	r4.w = r4.w * c0.y;
	r2.yzw = (r5.xyz * r4.www) + r2.yzw;
	r6.xyz = c24.xyz * v1.zzz;
	r8.xyz = c25.xyz + -v5.xyz;
	r9.xyz = normalize(r8.xyz);
	r4.w = clamp(dot(r1.xyz, r9.xyz), 0.0, 1.0);
	r5.w = (r4.w * r4.w) + r4.w;
	r5.w = r5.w * c0.y;
	r2.yzw = (r6.xyz * r5.www) + r2.yzw;
	r8.x = c20.w * v1.w;
	r8.y = c21.w * v1.w;
	r8.z = c22.w * v1.w;
	r10.x = c23.w + -v5.x;
	r10.y = c24.w + -v5.y;
	r10.z = c25.w + -v5.z;
	r11.xyz = normalize(r10.xyz);
	r5.w = clamp(dot(r1.xyz, r11.xyz), 0.0, 1.0);
	r6.w = (r5.w * r5.w) + r5.w;
	r6.w = r6.w * c0.y;
	r2.yzw = (r8.xyz * r6.www) + r2.yzw;
	r10.xyz = r2.yzw + v6.xyz;
	r12.xyz = r10.xyz + -c103.xxx;
	r12.xyz = clamp(r12.xyz * c103.yyy, float3(0.0), float3(1.0));
	r6.w = abs(c103.w);
	r7.w = dot(r1.xyz, r1.xyz);
	r13.xyz = c3.xyz + -v5.xyz;
	r8.w = dot(r13.xyz, r13.xyz);
	r8.w = ((r8.w == 0.0) ? FLT_MAX : rsqrt(abs(r8.w)));
	r14.xyz = r8.www * r13.xyz;
	r15.xyz = r7.www * r14.xyz;
	r14.z = dot(r14.xyz, r1.xyz);
	r7.w = r14.z + r14.z;
	r14.z = clamp(r14.z, 0.0, 1.0);
	r15.xyz = (r7.www * r1.xyz) + -r15.xyz;
	r15 = s6_texture.sample(s6, r15.xyz);
	r16.xyz = r15.xyz * c30.zzz;
	r17.xyz = r16.xyz * r16.xyz;
	r17.xyz = r17.xyz * r17.xyz;
	r7.w = dot(r17.xyz, c15.xyz);
	r9.w = r7.w + c14.z;
	r7.w = ((r7.w == 0.0) ? FLT_MAX : 1.0 / r7.w);
	r7.w = ((r9.w >= 0.0) ? r7.w : c14.w);
	r9.w = dot(r16.xyz, c15.xyz);
	r17.xyz = r9.www * r17.xyz;
	r15.xyz = (c30.zzz * -r15.xyz) + r9.www;
	r15.xyz = (-c103.www * r15.xyz) + r16.xyz;
	r17.xyz = (r17.xyz * r7.www) + -r16.xyz;
	r17.xyz = (c103.www * r17.xyz) + r16.xyz;
	r15.xyz = ((c103.w >= 0.0) ? r17.xyz : r15.xyz);
	r15.xyz = ((-r6.w >= 0.0) ? r16.xyz : r15.xyz);
	r12.xyz = (r15.xyz * r12.xyz) + -r15.xyz;
	r12.xyz = (c101.xxx * r12.xyz) + r15.xyz;
	r15.xyz = (r12.xyz * r12.xyz) + -r12.xyz;
	r12.xyz = (c103.zzz * r15.xyz) + r12.xyz;
	r15.xyz = r1.www * c104.xyz;
	r12.xyz = r12.xyz * r15.xyz;
	r6.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r6.w = ((r6.w == 0.0) ? FLT_MAX : 1.0 / r6.w);
	r4.xyz = (r13.xyz * r8.www) + r4.xyz;
	r15.xyz = normalize(r4.xyz);
	r14.y = clamp(dot(r1.xyz, r15.xyz), 0.0, 1.0);
	r15 = s10_texture.sample(s10, v0.xy);
	r14.w = r15.w;
	r16 = s7_texture.sample(s7, r14.yw);
	r0.w = r0.w * r14.y;
	r4.xyz = r6.www * r16.xyz;
	r4.xyz = r3.yzw * r4.xyz;
	r7.w = ((r3.x == 0.0) ? FLT_MAX : rsqrt(abs(r3.x)));
	r7.w = ((r7.w == 0.0) ? FLT_MAX : 1.0 / r7.w);
	r7.xyz = (r13.xyz * r8.www) + r7.xyz;
	r16.xyz = normalize(r7.xyz);
	r14.x = clamp(dot(r1.xyz, r16.xyz), 0.0, 1.0);
	r16 = s7_texture.sample(s7, r14.xw);
	r3.x = r3.x * r14.x;
	r7.xyz = r7.www * r16.xyz;
	r7.xyz = r5.xyz * r7.xyz;
	r4.xyz = (r4.xyz * r2.xxx) + r7.xyz;
	r7.x = ((r4.w == 0.0) ? FLT_MAX : rsqrt(abs(r4.w)));
	r7.x = ((r7.x == 0.0) ? FLT_MAX : 1.0 / r7.x);
	r9.xyz = (r13.xyz * r8.www) + r9.xyz;
	r16.xyz = normalize(r9.xyz);
	r9.y = clamp(dot(r1.xyz, r16.xyz), 0.0, 1.0);
	r9.z = r14.w;
	r16 = s4_texture.sample(s4, r14.zw);
	r7.y = -r14.z + c16.y;
	r9.w = pow(abs(r7.y), c105.x);
	r14 = s7_texture.sample(s7, r9.yz);
	r4.w = r4.w * r9.y;
	r4.w = r9.w * r4.w;
	r4.w = r7.x * r4.w;
	r7.xyz = r7.xxx * r14.xyz;
	r4.xyz = (r7.xyz * r6.xyz) + r4.xyz;
	r7.xyz = (r13.xyz * r8.www) + r11.xyz;
	r11.xyz = normalize(r7.xyz);
	r9.x = clamp(dot(r1.xyz, r11.xyz), 0.0, 1.0);
	r11 = s7_texture.sample(s7, r9.xz);
	r7.x = r5.w * r9.x;
	r5.w = ((r5.w == 0.0) ? FLT_MAX : rsqrt(abs(r5.w)));
	r5.w = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r7.x = r9.w * r7.x;
	r7.x = r5.w * r7.x;
	r9.xyz = r5.www * r11.xyz;
	r4.xyz = (r9.xyz * r8.xyz) + r4.xyz;
	r4.xyz = r1.www * r4.xyz;
	r1.w = mix(c10.x, c10.y, r15.y);
	r4.xyz = (r4.xyz * r1.www) + r12.xyz;
	r4.xyz = r16.yyy * r4.xyz;
	r9.xyz = r0.zxy * c16.xxx;
	r9.xyz = (r0.zxy * c16.xxx) + -r9.zxy;
	r11.xy = c0.xy;
	r1.w = (c12.w * r11.x) + r11.y;
	r1.w = fract(r1.w);
	r1.w = (r1.w * c0.z) + c0.w;
	r11.xy = float2(cos(r1.w), sin(r1.w));
	r9.xyz = r9.xyz * r11.yyy;
	r9.xyz = (r0.xyz * r11.xxx) + r9.xyz;
	r1.w = -r11.x + c16.y;
	r5.w = dot(c16.xxx, r0.xyz);
	r5.w = r5.w * c16.x;
	r9.xyz = (r5.www * r1.www) + r9.xyz;
	r1.w = abs(c12.w);
	r0.xyz = ((-r1.w >= 0.0) ? r0.xyz : r9.xyz);
	r9.xyz = r0.xyz + c16.www;
	r9.xyz = (r15.yyy * r9.xyz) + c16.yyy;
	r4.xyz = r4.xyz * r9.xyz;
	r9.xyz = c15.xyz;
	r1.w = dot(c102.xyz, r9.xyz);
	r5.w = r1.w + c14.z;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = ((r5.w >= 0.0) ? r1.w : c14.w);
	r5.w = dot(r0.xyz, c15.xyz);
	r9.xyz = r5.www * c102.xyz;
	r9.xyz = (r9.xyz * r1.www) + -r0.xyz;
	r9.xyz = (c102.www * r9.xyz) + r0.xyz;
	r1.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r9.xyz = (r9.xyz * r1.www) + -r0.xyz;
	r0.w = r0.w * r9.w;
	r0.w = r6.w * r0.w;
	r3.yzw = r3.yzw * r0.www;
	r0.w = r3.x * r9.w;
	r0.w = r7.w * r0.w;
	r5.xyz = r5.xyz * r0.www;
	r3.xyz = (r3.yzw * r2.xxx) + r5.xyz;
	r3.xyz = (r4.www * r6.xyz) + r3.xyz;
	r3.xyz = (r7.xxx * r8.xyz) + r3.xyz;
	r5.y = c16.y;
	r0.w = (v6.w * c11.w) + r5.y;
	r1.w = r15.x * c105.y;
	r0.w = r0.w * r1.w;
	r3.xyz = r0.www * r3.xyz;
	r0.w = r15.y * c101.w;
	r5.xyz = (r0.xyz * r0.www) + -c106.xyz;
	r0.w = clamp(r0.w, 0.0, 1.0);
	r5.xyz = (r0.www * r5.xyz) + c106.xyz;
	r2.xyz = (r3.xyz * r5.xyz) + r2.yzw;
	r0.w = dot(r2.xyz, c15.xyz);
	r0.w = r0.w + c15.w;
	r0.w = clamp(r0.w * c17.x, 0.0, 1.0);
	r1.w = (r0.w * c17.y) + c17.z;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.w;
	r0.xyz = (r0.www * r9.xyz) + r0.xyz;
	r0.xyz = r15.zzz * r0.xyz;
	r0.xyz = (r0.xyz * r10.xyz) + r4.xyz;
	r0.xyz = (r3.xyz * r5.xyz) + r0.xyz;
	r2.x = v2.w;
	r2.y = v3.w;
	r2.z = v4.w;
	r3.xyz = (r13.xyz * r8.www) + r2.xyz;
	r0.w = clamp(dot(r1.xyz, r2.xyz), 0.0, 1.0);
	r2.xyz = normalize(r3.xyz);
	r1.x = clamp(dot(r1.xyz, r2.xyz), 0.0, 1.0);
	r1.x = r0.w * r1.x;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r1.x = r9.w * r1.x;
	r0.w = r0.w * r1.x;
	r1.xyz = v6.www * v6.xyz;
	r1.xyz = r1.xyz * c107.xyz;
	r1.xyz = r0.www * r1.xyz;
	r0.xyz = (r1.xyz * r15.xxx) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	oC0.xyz = r0.xyz * c30.xxx;
	#undef c1
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
	#undef c24
	#undef c25
	#undef c30
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
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

