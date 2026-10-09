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
	const float4 c14 = float4(5.773500204e-01, 1.000000000e+00, 2.000000000e+00, -1.000000000e+00); (void) c14;
	const float4 c15 = float4(1.000000000e+00, 0.000000000e+00, 1.041666627e+00, -2.083333395e-02); (void) c15;
	const float4 c16 = float4(1.000000000e+06, -3.000000119e-01, -3.333333254e+00, 0.000000000e+00); (void) c16;
	const float4 c17 = float4(-2.000000000e+00, 3.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c17;
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
	float4 r19;
	float4 r20;
	float4 r21;
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
	#define c68 uniforms.uniforms_float4[22]
	#define c71 uniforms.uniforms_float4[23]
	#define c73 uniforms.uniforms_float4[24]
	#define c74 uniforms.uniforms_float4[25]
	#define c77 uniforms.uniforms_float4[26]
	#define c78 uniforms.uniforms_float4[27]
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
	#define v7 input.v7
	#define v8 input.v8
	#define v9 input.v9
	#define oC0 output.oC0
	r0.x = c19.y + -v5.z;
	r0.x = r0.x + -c14.z;
	oC0.w = clamp(r0.x * c19.w, 0.0, 1.0);
	r0.xyz = c18.xyz;
	r0.x = dot(c102.xyz, r0.xyz);
	r0.y = r0.x + c18.w;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = ((r0.y >= 0.0) ? r0.x : c16.x);
	r1.xy = c13.xy;
	r0.y = (c12.w * r1.x) + r1.y;
	r0.y = fract(r0.y);
	r0.y = (r0.y * c13.z) + c13.w;
	r1.xy = float2(cos(r0.y), sin(r0.y));
	r2 = s0_texture.sample(s0, v0.xy);
	r0.yzw = r2.zxy * c14.xxx;
	r0.yzw = (r2.zxy * c14.xxx) + -r0.wyz;
	r0.yzw = r1.yyy * r0.yzw;
	r0.yzw = (r2.xyz * r1.xxx) + r0.yzw;
	r1.x = -r1.x + c14.y;
	r1.y = dot(c14.xxx, r2.xyz);
	r1.y = r1.y * c14.x;
	r0.yzw = (r1.yyy * r1.xxx) + r0.yzw;
	r1.x = abs(c12.w);
	r0.yzw = ((-r1.x >= 0.0) ? r2.xyz : r0.yzw);
	r1.xyz = r2.www * c104.xyz;
	r2.xyz = r0.yzw * r0.yzw;
	r2.xyz = r2.xyz * r2.xyz;
	r1.w = dot(r2.xyz, c18.xyz);
	r2.w = r1.w + c18.w;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = ((r2.w >= 0.0) ? r1.w : c16.x);
	r2.w = dot(r0.yzw, c18.xyz);
	r2.xyz = r2.www * r2.xyz;
	r3.xyz = mix(r0.yzw, r2.www, -c101.yyy);
	r2.xyz = (r2.xyz * r1.www) + -r0.yzw;
	r2.xyz = (c101.yyy * r2.xyz) + r0.yzw;
	r2.xyz = ((c101.y >= 0.0) ? r2.xyz : r3.xyz);
	r1.w = abs(c101.y);
	r2.xyz = ((-r1.w >= 0.0) ? r0.yzw : r2.xyz);
	r3.xyz = c23.xyz + -v5.xyz;
	r4.xyz = normalize(r3.xyz);
	r3.xyz = c3.xyz + -v5.xyz;
	r1.w = dot(r3.xyz, r3.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r5.xyz = (r3.xyz * r1.www) + r4.xyz;
	r6.xyz = normalize(r5.xyz);
	r5 = s1_texture.sample(s1, v0.xy);
	r5.xyz = (r5.xyz * c14.zzz) + c14.www;
	r7.x = dot(v2.xyz, r5.xyz);
	r7.y = dot(v3.xyz, r5.xyz);
	r7.z = dot(v4.xyz, r5.xyz);
	r5.xyz = normalize(r7.xyz);
	r6.x = clamp(dot(r5.xyz, r6.xyz), 0.0, 1.0);
	r2.w = clamp(dot(r5.xyz, r4.xyz), 0.0, 1.0);
	r3.w = r2.w * r6.x;
	r4.xyz = r1.www * r3.xyz;
	r4.w = dot(r4.xyz, r5.xyz);
	r6.z = clamp(r4.w, 0.0, 1.0);
	r4.w = r4.w + r4.w;
	r7.x = -r6.z + c14.y;
	r8.x = pow(abs(r7.x), c105.x);
	r3.w = r3.w * r8.x;
	r7.x = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r2.w = (r2.w * r2.w) + r2.w;
	r2.w = r2.w * c13.y;
	r7.x = ((r7.x == 0.0) ? FLT_MAX : 1.0 / r7.x);
	r3.w = r3.w * r7.x;
	r7.yzw = c21.xyz + -v5.xyz;
	r9.xyz = normalize(r7.yzw);
	r7.yzw = (r3.xyz * r1.www) + r9.xyz;
	r10.xyz = normalize(r7.yzw);
	r6.y = clamp(dot(r5.xyz, r10.xyz), 0.0, 1.0);
	r7.y = clamp(dot(r5.xyz, r9.xyz), 0.0, 1.0);
	r7.z = clamp(r9.z, 0.0, 1.0);
	r7.z = (r7.z * r7.z) + r7.z;
	r7.w = r6.y * r7.y;
	r7.w = r8.x * r7.w;
	r8.y = ((r7.y == 0.0) ? FLT_MAX : rsqrt(abs(r7.y)));
	r7.y = (r7.y * r7.y) + r7.y;
	r7.yz = r7.yz * c13.yy;
	r8.y = ((r8.y == 0.0) ? FLT_MAX : 1.0 / r8.y);
	r8.z = (r7.w * r8.y) + r3.w;
	r7.w = r7.w * r8.y;
	r9.xyz = c25.xyz + -v5.xyz;
	r10.xyz = normalize(r9.xyz);
	r9.xyz = (r3.xyz * r1.www) + r10.xyz;
	r8.w = clamp(dot(r5.xyz, r10.xyz), 0.0, 1.0);
	r10.xyz = normalize(r9.xyz);
	r9.y = clamp(dot(r5.xyz, r10.xyz), 0.0, 1.0);
	r9.w = r8.w * r9.y;
	r9.w = r8.x * r9.w;
	r10.x = ((r8.w == 0.0) ? FLT_MAX : rsqrt(abs(r8.w)));
	r8.w = (r8.w * r8.w) + r8.w;
	r8.w = r8.w * c13.y;
	r10.x = ((r10.x == 0.0) ? FLT_MAX : 1.0 / r10.x);
	r8.z = (r9.w * r10.x) + r8.z;
	r9.w = r9.w * r10.x;
	r11.x = c23.w + -v5.x;
	r11.y = c24.w + -v5.y;
	r11.z = c25.w + -v5.z;
	r12.xyz = normalize(r11.xyz);
	r10.yzw = (r3.xyz * r1.www) + r12.xyz;
	r11.x = clamp(dot(r5.xyz, r12.xyz), 0.0, 1.0);
	r12.xyz = normalize(r10.yzw);
	r9.x = clamp(dot(r5.xyz, r12.xyz), 0.0, 1.0);
	r10.y = r11.x * r9.x;
	r10.y = r8.x * r10.y;
	r10.z = ((r11.x == 0.0) ? FLT_MAX : rsqrt(abs(r11.x)));
	r10.w = (r11.x * r11.x) + r11.x;
	r10.w = r10.w * c13.y;
	r10.z = ((r10.z == 0.0) ? FLT_MAX : 1.0 / r10.z);
	r8.z = (r10.y * r10.z) + r8.z;
	r10.y = r10.z * r10.y;
	r11.xy = r8.zz + -c33.xw;
	r11.zw = -c33.xw + c33.yz;
	r8.z = ((r11.z == 0.0) ? FLT_MAX : 1.0 / r11.z);
	r11.z = ((r11.w == 0.0) ? FLT_MAX : 1.0 / r11.w);
	r11.y = clamp(r11.z * r11.y, 0.0, 1.0);
	r8.z = clamp(r8.z * r11.x, 0.0, 1.0);
	r11.x = (r8.z * c17.x) + c17.y;
	r8.z = r8.z * r8.z;
	r8.z = r8.z * r11.x;
	r11.x = (r11.y * c17.x) + c17.y;
	r11.y = r11.y * r11.y;
	r11.x = r11.y * r11.x;
	r8.z = r8.z * r11.x;
	r11 = (v5.xyzx * c15.xxxy) + c15.yyyx;
	r12.x = dot(r11, c73);
	r12.y = dot(r11, c74);
	r12.zw = (r12.xy * c15.zz) + c15.ww;
	r13.xy = clamp(r12.zw, float2(0.0), float2(1.0));
	r12.zw = -r12.zw + r13.xy;
	r12.z = dot(r12.zw, c15.xx) + c15.y;
	r12.w = dot(r11, c77);
	r13.x = clamp(((-abs(r12.z) >= 0.0) ? r12.x : r12.w), 0.0, 1.0);
	r12.x = dot(r11, c78);
	r11.z = dot(r11, c71);
	r13.y = clamp(((-abs(r12.z) >= 0.0) ? r12.y : r12.x), 0.0, 1.0);
	r12.xy = c86.xy;
	r12.xy = ((-abs(r12.z) >= 0.0) ? r12.xy : c87.xy);
	r11.xy = (r13.xy * c13.yy) + r12.xy;
	r11.w = c15.y;
	r11 = float4(s8_texture.sample_compare(s8, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
	r11.yzw = -c89.xyz + v5.xyz;
	r11.y = dot(r11.yzw, r11.yzw);
	r11.y = clamp((r11.y * c68.y) + c68.x, 0.0, 1.0);
	r12.x = mix(r11.x, c14.y, r11.y);
	r11.xyz = c22.xyz * v1.yyy;
	r12.yzw = r3.www * r11.xyz;
	r13.xyz = c20.xyz * v1.xxx;
	r14.xyz = r7.www * r13.xyz;
	r12.yzw = (r14.xyz * r12.xxx) + r12.yzw;
	r14.xyz = c24.xyz * v1.zzz;
	r12.yzw = (r9.www * r14.xyz) + r12.yzw;
	r15.x = c20.w * v1.w;
	r15.y = c21.w * v1.w;
	r15.z = c22.w * v1.w;
	r12.yzw = (r10.yyy * r15.xyz) + r12.yzw;
	r10.y = c14.y;
	r3.w = (v6.w * c11.w) + r10.y;
	r16 = s10_texture.sample(s10, v0.xy);
	r7.w = r16.x * c105.y;
	r3.w = r3.w * r7.w;
	r12.yzw = r3.www * r12.yzw;
	r3.w = r16.y * c101.w;
	r17.xyz = (r0.yzw * r3.www) + -c106.xyz;
	r3.w = clamp(r3.w, 0.0, 1.0);
	r17.xyz = (r3.www * r17.xyz) + c106.xyz;
	r18.xyz = r12.yzw * r17.xyz;
	r3.w = dot(r18.xyz, c18.xyz);
	r3.w = r3.w * r8.z;
	r3.w = r3.w * c106.w;
	r18.x = ((r5.x >= 0.0) ? c15.y : c15.x);
	r18.y = ((r5.y >= 0.0) ? c15.y : c15.x);
	r18.z = ((r5.z >= 0.0) ? c15.y : c15.x);
	r19.xyz = r5.xyz * r5.xyz;
	r18.xyz = r18.xyz * r19.xyz;
	r20.xyz = r18.xxx * c5.xyz;
	r21.x = ((r5.x >= 0.0) ? c15.x : c15.y);
	r21.y = ((r5.y >= 0.0) ? c15.x : c15.y);
	r21.z = ((r5.z >= 0.0) ? c15.x : c15.y);
	r19.xyz = r19.xyz * r21.xyz;
	r20.xyz = (r19.xxx * c4.xyz) + r20.xyz;
	r19.xyw = (r19.yyy * c6.xyz) + r20.xyz;
	r18.xyw = (r18.yyy * c7.xyz) + r19.xyw;
	r18.xyw = (r19.zzz * c8.xyz) + r18.xyw;
	r18.xyz = (r18.zzz * c9.xyz) + r18.xyw;
	r19.xyz = r7.yyy * r13.xyz;
	r18.xyz = (r19.xyz * r12.xxx) + r18.xyz;
	r18.xyz = (r11.xyz * r2.www) + r18.xyz;
	r18.xyz = (r14.xyz * r8.www) + r18.xyz;
	r18.xyz = (r15.xyz * r10.www) + r18.xyz;
	r2.w = dot(r18.xyz, c18.xyz);
	r7.yw = r2.ww + -c2.xw;
	r8.zw = -c2.xw + c2.yz;
	r2.w = ((r8.w == 0.0) ? FLT_MAX : 1.0 / r8.w);
	r8.z = ((r8.z == 0.0) ? FLT_MAX : 1.0 / r8.z);
	r7.y = clamp(r7.y * r8.z, 0.0, 1.0);
	r2.w = clamp(r2.w * r7.w, 0.0, 1.0);
	r7.w = (r2.w * c17.x) + c17.y;
	r2.w = r2.w * r2.w;
	r2.w = (r7.w * r2.w) + r3.w;
	r3.w = (r7.y * c17.x) + c17.y;
	r7.y = r7.y * r7.y;
	r3.w = r3.w * r7.y;
	r2.w = r2.w * r3.w;
	r19.xyz = mix(r0.yzw, r2.xyz, r2.www);
	r0.yzw = r0.yzw + c14.www;
	r0.yzw = (r16.yyy * r0.yzw) + c14.yyy;
	r2.x = dot(r19.xyz, c18.xyz);
	r2.xyz = r2.xxx * c102.xyz;
	r2.xyz = (r2.xyz * r0.xxx) + -r19.xyz;
	r2.xyz = (c102.www * r2.xyz) + r19.xyz;
	r0.x = clamp(c107.w + v6.w, 0.0, 1.0);
	r2.xyz = (r2.xyz * r0.xxx) + -r19.xyz;
	r20.xyz = (r12.yzw * r17.xyz) + r18.xyz;
	r18.xyz = r18.xyz + v6.xyz;
	r0.x = dot(r20.xyz, c18.xyz);
	r0.x = r0.x + c16.y;
	r0.x = clamp(r0.x * c16.z, 0.0, 1.0);
	r2.w = (r0.x * c17.x) + c17.y;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r2.w;
	r2.xyz = (r0.xxx * r2.xyz) + r19.xyz;
	r2.xyz = r16.zzz * r2.xyz;
	r6.w = r16.w;
	r19 = s7_texture.sample(s7, r6.xw);
	r7.xyw = r7.xxx * r19.xyz;
	r7.xyw = r11.xyz * r7.xyw;
	r11 = s7_texture.sample(s7, r6.yw);
	r8.yzw = r8.yyy * r11.xyz;
	r8.yzw = r13.xyz * r8.yzw;
	r7.xyw = (r8.yzw * r12.xxx) + r7.xyw;
	r9.z = r6.w;
	r6 = s4_texture.sample(s4, r6.zw);
	r11 = s7_texture.sample(s7, r9.yz);
	r9 = s7_texture.sample(s7, r9.xz);
	r8.yzw = r10.zzz * r9.xyz;
	r9.xyz = r10.xxx * r11.xyz;
	r7.xyw = (r9.xyz * r14.xyz) + r7.xyw;
	r7.xyw = (r8.yzw * r15.xyz) + r7.xyw;
	r7.xyw = r5.www * r7.xyw;
	r8.yzw = r18.xyz + -c103.xxx;
	r8.yzw = clamp(r8.yzw * c103.yyy, float3(0.0), float3(1.0));
	r0.x = dot(r5.xyz, r5.xyz);
	r4.xyz = r4.xyz * r0.xxx;
	r4.xyz = (r4.www * r5.xyz) + -r4.xyz;
	r9 = s6_texture.sample(s6, r4.xyz);
	r10.xyz = r9.xyz * c30.zzz;
	r11.xyz = r10.xyz * r10.xyz;
	r11.xyz = r11.xyz * r11.xyz;
	r0.x = dot(r11.xyz, c18.xyz);
	r2.w = r0.x + c18.w;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = ((r2.w >= 0.0) ? r0.x : c16.x);
	r2.w = dot(r10.xyz, c18.xyz);
	r11.xyz = r2.www * r11.xyz;
	r9.xyz = (c30.zzz * -r9.xyz) + r2.www;
	r9.xyz = (-c103.www * r9.xyz) + r10.xyz;
	r11.xyz = (r11.xyz * r0.xxx) + -r10.xyz;
	r11.xyz = (c103.www * r11.xyz) + r10.xyz;
	r9.xyz = ((c103.w >= 0.0) ? r11.xyz : r9.xyz);
	r0.x = abs(c103.w);
	r9.xyz = ((-r0.x >= 0.0) ? r10.xyz : r9.xyz);
	r8.yzw = (r9.xyz * r8.yzw) + -r9.xyz;
	r8.yzw = (c101.xxx * r8.yzw) + r9.xyz;
	r9.xyz = (r8.yzw * r8.yzw) + -r8.yzw;
	r8.yzw = (c103.zzz * r9.xyz) + r8.yzw;
	r1.xyz = r1.xyz * r8.yzw;
	r0.x = mix(c10.x, c10.y, r16.y);
	r1.xyz = (r7.xyw * r0.xxx) + r1.xyz;
	r7.xyz = r7.zzz * r13.xyz;
	r8.y = ((r4.x >= 0.0) ? c15.y : c15.x);
	r8.z = ((r4.y >= 0.0) ? c15.y : c15.x);
	r8.w = ((r4.z >= 0.0) ? c15.y : c15.x);
	r9.xyz = r4.xyz * r4.xyz;
	r4.x = ((r4.x >= 0.0) ? c15.x : c15.y);
	r4.y = ((r4.y >= 0.0) ? c15.x : c15.y);
	r4.z = ((r4.z >= 0.0) ? c15.x : c15.y);
	r4.xyz = r9.xyz * r4.xyz;
	r8.yzw = r8.yzw * r9.xyz;
	r9.xyz = r8.yyy * c5.xyz;
	r9.xyz = (r4.xxx * c4.xyz) + r9.xyz;
	r4.xyw = (r4.yyy * c6.xyz) + r9.xyz;
	r4.xyw = (r8.zzz * c7.xyz) + r4.xyw;
	r4.xyz = (r4.zzz * c8.xyz) + r4.xyw;
	r4.xyz = (r8.www * c9.xyz) + r4.xyz;
	r4.xyz = r7.xyz * r4.xyz;
	r7.x = v7.w;
	r7.y = v8.w;
	r7.z = v9.w;
	r7.xyz = -r7.xyz + c21.xyz;
	r9.xyz = normalize(r7.xyz);
	r0.x = clamp(dot(-v9.xyz, r9.xyz), 0.0, 1.0);
	r0.x = (r0.x * r0.x) + r0.x;
	r0.x = r0.x * c13.y;
	r7.xyz = r0.xxx * r13.xyz;
	r8.yzw = c0.xyz * v6.xyz;
	r7.xyz = (r8.yzw * r7.xyz) + -r4.xyz;
	r0.x = clamp(dot(r5.xyz, v9.xyz), 0.0, 1.0);
	r4.xyz = (r0.xxx * r7.xyz) + r4.xyz;
	r0.x = r16.x * r6.z;
	r0.x = r0.x * c0.w;
	r4.xyz = r0.xxx * r4.xyz;
	r1.xyz = (r1.xyz * r6.yyy) + r4.xyz;
	r0.xyz = r0.yzw * r1.xyz;
	r0.xyz = (r2.xyz * r18.xyz) + r0.xyz;
	r0.xyz = (r12.yzw * r17.xyz) + r0.xyz;
	r1.x = v2.w;
	r1.y = v3.w;
	r1.z = v4.w;
	r2.xyz = (r3.xyz * r1.www) + r1.xyz;
	r0.w = clamp(dot(r5.xyz, r1.xyz), 0.0, 1.0);
	r1.xyz = normalize(r2.xyz);
	r1.x = clamp(dot(r5.xyz, r1.xyz), 0.0, 1.0);
	r1.x = r0.w * r1.x;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r1.x = r8.x * r1.x;
	r0.w = r0.w * r1.x;
	r1.xyz = v6.www * v6.xyz;
	r1.xyz = r1.xyz * c107.xyz;
	r1.xyz = r0.www * r1.xyz;
	r0.xyz = (r1.xyz * r16.xxx) + r0.xyz;
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
	#undef c68
	#undef c71
	#undef c73
	#undef c74
	#undef c77
	#undef c78
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

