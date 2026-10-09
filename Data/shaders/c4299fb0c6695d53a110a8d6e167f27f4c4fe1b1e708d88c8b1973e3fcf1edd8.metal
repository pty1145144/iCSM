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
	const float4 c16 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -9.999999975e-07); (void) c16;
	const float4 c17 = float4(-2.000000000e+00, 3.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c17;
	const float4 c18 = float4(1.000000000e+06, -3.000000119e-01, -3.333333254e+00, 0.000000000e+00); (void) c18;
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
	r0.xyz = c16.xyz;
	r0.x = dot(c102.xyz, r0.xyz);
	r0.y = r0.x + c16.w;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = ((r0.y >= 0.0) ? r0.x : c18.x);
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
	r1.w = dot(r2.xyz, c16.xyz);
	r2.w = r1.w + c16.w;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = ((r2.w >= 0.0) ? r1.w : c18.x);
	r2.w = dot(r0.yzw, c16.xyz);
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
	r3.xyz = (r3.xyz * r1.www) + r12.xyz;
	r1.w = clamp(dot(r5.xyz, r12.xyz), 0.0, 1.0);
	r11.xyz = normalize(r3.xyz);
	r9.x = clamp(dot(r5.xyz, r11.xyz), 0.0, 1.0);
	r3.x = r1.w * r9.x;
	r3.x = r8.x * r3.x;
	r3.y = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.w = (r1.w * r1.w) + r1.w;
	r1.w = r1.w * c13.y;
	r3.y = ((r3.y == 0.0) ? FLT_MAX : 1.0 / r3.y);
	r3.z = (r3.x * r3.y) + r8.z;
	r3.x = r3.y * r3.x;
	r8.xz = r3.zz + -c33.xw;
	r10.yz = -c33.xw + c33.yz;
	r3.z = ((r10.y == 0.0) ? FLT_MAX : 1.0 / r10.y);
	r10.y = ((r10.z == 0.0) ? FLT_MAX : 1.0 / r10.z);
	r8.z = clamp(r8.z * r10.y, 0.0, 1.0);
	r3.z = clamp(r3.z * r8.x, 0.0, 1.0);
	r8.x = (r3.z * c17.x) + c17.y;
	r3.z = r3.z * r3.z;
	r3.z = r3.z * r8.x;
	r8.x = (r8.z * c17.x) + c17.y;
	r8.z = r8.z * r8.z;
	r8.x = r8.z * r8.x;
	r3.z = r3.z * r8.x;
	r11 = (v5.xyzx * c15.xxxy) + c15.yyyx;
	r12.x = dot(r11, c73);
	r12.y = dot(r11, c74);
	r8.xz = (r12.xy * c15.zz) + c15.ww;
	r10.yz = clamp(r8.xz, float2(0.0), float2(1.0));
	r8.xz = -r8.xz + r10.yz;
	r8.x = dot(r8.xz, c15.xx) + c15.y;
	r8.z = dot(r11, c77);
	r13.x = clamp(((-abs(r8.x) >= 0.0) ? r12.x : r8.z), 0.0, 1.0);
	r8.z = dot(r11, c78);
	r11.z = dot(r11, c71);
	r13.y = clamp(((-abs(r8.x) >= 0.0) ? r12.y : r8.z), 0.0, 1.0);
	r12.xy = c86.xy;
	r8.xz = ((-abs(r8.x) >= 0.0) ? r12.xy : c87.xy);
	r11.xy = (r13.xy * c13.yy) + r8.xz;
	r11.w = c15.y;
	r11 = float4(s8_texture.sample_compare(s8, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
	r10.yzw = -c89.xyz + v5.xyz;
	r8.x = dot(r10.yzw, r10.yzw);
	r8.x = clamp((r8.x * c68.y) + c68.x, 0.0, 1.0);
	r10.y = mix(r11.x, c14.y, r8.x);
	r11.xyz = c22.xyz * v1.yyy;
	r12.xyz = r3.www * r11.xyz;
	r13.xyz = c20.xyz * v1.xxx;
	r14.xyz = r7.www * r13.xyz;
	r12.xyz = (r14.xyz * r10.yyy) + r12.xyz;
	r14.xyz = c24.xyz * v1.zzz;
	r12.xyz = (r9.www * r14.xyz) + r12.xyz;
	r15.x = c20.w * v1.w;
	r15.y = c21.w * v1.w;
	r15.z = c22.w * v1.w;
	r12.xyz = (r3.xxx * r15.xyz) + r12.xyz;
	r16.y = c14.y;
	r3.x = (v6.w * c11.w) + r16.y;
	r16 = s10_texture.sample(s10, v0.xy);
	r3.w = r16.x * c105.y;
	r3.x = r3.x * r3.w;
	r12.xyz = r3.xxx * r12.xyz;
	r3.x = r16.y * c101.w;
	r17.xyz = (r0.yzw * r3.xxx) + -c106.xyz;
	r3.x = clamp(r3.x, 0.0, 1.0);
	r17.xyz = (r3.xxx * r17.xyz) + c106.xyz;
	r18.xyz = r12.xyz * r17.xyz;
	r3.x = dot(r18.xyz, c16.xyz);
	r3.x = r3.x * r3.z;
	r3.x = r3.x * c106.w;
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
	r18.xyz = (r19.xyz * r10.yyy) + r18.xyz;
	r18.xyz = (r11.xyz * r2.www) + r18.xyz;
	r8.xzw = (r14.xyz * r8.www) + r18.xyz;
	r8.xzw = (r15.xyz * r1.www) + r8.xzw;
	r1.w = dot(r8.xzw, c16.xyz);
	r3.zw = r1.ww + -c2.xw;
	r7.yw = -c2.xw + c2.yz;
	r1.w = ((r7.w == 0.0) ? FLT_MAX : 1.0 / r7.w);
	r2.w = ((r7.y == 0.0) ? FLT_MAX : 1.0 / r7.y);
	r2.w = clamp(r2.w * r3.z, 0.0, 1.0);
	r1.w = clamp(r1.w * r3.w, 0.0, 1.0);
	r3.z = (r1.w * c17.x) + c17.y;
	r1.w = r1.w * r1.w;
	r1.w = (r3.z * r1.w) + r3.x;
	r3.x = (r2.w * c17.x) + c17.y;
	r2.w = r2.w * r2.w;
	r2.w = r2.w * r3.x;
	r1.w = r1.w * r2.w;
	r3.xzw = mix(r0.yzw, r2.xyz, r1.www);
	r0.yzw = r0.yzw + c14.www;
	r0.yzw = (r16.yyy * r0.yzw) + c14.yyy;
	r1.w = dot(r3.xzw, c16.xyz);
	r2.xyz = r1.www * c102.xyz;
	r2.xyz = (r2.xyz * r0.xxx) + -r3.xzw;
	r2.xyz = (c102.www * r2.xyz) + r3.xzw;
	r0.x = clamp(c107.w + v6.w, 0.0, 1.0);
	r2.xyz = (r2.xyz * r0.xxx) + -r3.xzw;
	r18.xyz = (r12.xyz * r17.xyz) + r8.xzw;
	r8.xzw = r8.xzw + v6.xyz;
	r0.x = dot(r18.xyz, c16.xyz);
	r0.x = r0.x + c18.y;
	r0.x = clamp(r0.x * c18.z, 0.0, 1.0);
	r1.w = (r0.x * c17.x) + c17.y;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r1.w;
	r2.xyz = (r0.xxx * r2.xyz) + r3.xzw;
	r2.xyz = r16.zzz * r2.xyz;
	r6.w = r16.w;
	r18 = s7_texture.sample(s7, r6.xw);
	r3.xzw = r7.xxx * r18.xyz;
	r3.xzw = r11.xyz * r3.xzw;
	r11 = s7_texture.sample(s7, r6.yw);
	r7.xyw = r8.yyy * r11.xyz;
	r7.xyw = r13.xyz * r7.xyw;
	r3.xzw = (r7.xyw * r10.yyy) + r3.xzw;
	r9.z = r6.w;
	r6 = s4_texture.sample(s4, r6.zw);
	r11 = s7_texture.sample(s7, r9.yz);
	r9 = s7_texture.sample(s7, r9.xz);
	r7.xyw = r3.yyy * r9.xyz;
	r9.xyz = r10.xxx * r11.xyz;
	r3.xyz = (r9.xyz * r14.xyz) + r3.xzw;
	r3.xyz = (r7.xyw * r15.xyz) + r3.xyz;
	r3.xyz = r5.www * r3.xyz;
	r0.x = dot(r5.xyz, r5.xyz);
	r4.xyz = r4.xyz * r0.xxx;
	r4.xyz = (r4.www * r5.xyz) + -r4.xyz;
	r0.x = clamp(dot(r5.xyz, v9.xyz), 0.0, 1.0);
	r5 = s6_texture.sample(s6, r4.xyz);
	r7.xyw = r5.xyz * c30.zzz;
	r9.xyz = r7.xyw * r7.xyw;
	r9.xyz = r9.xyz * r9.xyz;
	r1.w = dot(r9.xyz, c16.xyz);
	r2.w = r1.w + c16.w;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = ((r2.w >= 0.0) ? r1.w : c18.x);
	r2.w = dot(r7.xyw, c16.xyz);
	r9.xyz = r2.www * r9.xyz;
	r5.xyz = (c30.zzz * -r5.xyz) + r2.www;
	r5.xyz = (-c103.www * r5.xyz) + r7.xyw;
	r9.xyz = (r9.xyz * r1.www) + -r7.xyw;
	r9.xyz = (c103.www * r9.xyz) + r7.xyw;
	r5.xyz = ((c103.w >= 0.0) ? r9.xyz : r5.xyz);
	r1.w = abs(c103.w);
	r5.xyz = ((-r1.w >= 0.0) ? r7.xyw : r5.xyz);
	r7.xyw = r8.xzw + -c103.xxx;
	r7.xyw = clamp(r7.xyw * c103.yyy, float3(0.0), float3(1.0));
	r7.xyw = (r5.xyz * r7.xyw) + -r5.xyz;
	r5.xyz = (c101.xxx * r7.xyw) + r5.xyz;
	r7.xyw = (r5.xyz * r5.xyz) + -r5.xyz;
	r5.xyz = (c103.zzz * r7.xyw) + r5.xyz;
	r1.xyz = r1.xyz * r5.xyz;
	r1.w = mix(c10.x, c10.y, r16.y);
	r2.w = r16.x * r6.z;
	r2.w = r2.w * c0.w;
	r1.xyz = (r3.xyz * r1.www) + r1.xyz;
	r3.x = ((r4.x >= 0.0) ? c15.y : c15.x);
	r3.y = ((r4.y >= 0.0) ? c15.y : c15.x);
	r3.z = ((r4.z >= 0.0) ? c15.y : c15.x);
	r5.xyz = r4.xyz * r4.xyz;
	r4.x = ((r4.x >= 0.0) ? c15.x : c15.y);
	r4.y = ((r4.y >= 0.0) ? c15.x : c15.y);
	r4.z = ((r4.z >= 0.0) ? c15.x : c15.y);
	r4.xyz = r5.xyz * r4.xyz;
	r3.xyz = r3.xyz * r5.xyz;
	r5.xyz = r3.xxx * c5.xyz;
	r5.xyz = (r4.xxx * c4.xyz) + r5.xyz;
	r4.xyw = (r4.yyy * c6.xyz) + r5.xyz;
	r3.xyw = (r3.yyy * c7.xyz) + r4.xyw;
	r3.xyw = (r4.zzz * c8.xyz) + r3.xyw;
	r3.xyz = (r3.zzz * c9.xyz) + r3.xyw;
	r4.xyz = r7.zzz * r13.xyz;
	r3.xyz = r3.xyz * r4.xyz;
	r4.x = v7.w;
	r4.y = v8.w;
	r4.z = v9.w;
	r4.xyz = -r4.xyz + c21.xyz;
	r5.xyz = normalize(r4.xyz);
	r1.w = clamp(dot(-v9.xyz, r5.xyz), 0.0, 1.0);
	r1.w = (r1.w * r1.w) + r1.w;
	r1.w = r1.w * c13.y;
	r4.xyz = r1.www * r13.xyz;
	r5.xyz = c0.xyz * v6.xyz;
	r4.xyz = (r5.xyz * r4.xyz) + -r3.xyz;
	r3.xyz = (r0.xxx * r4.xyz) + r3.xyz;
	r3.xyz = r2.www * r3.xyz;
	r1.xyz = (r1.xyz * r6.yyy) + r3.xyz;
	r0.xyz = r0.yzw * r1.xyz;
	r0.xyz = (r2.xyz * r8.xzw) + r0.xyz;
	r0.xyz = (r12.xyz * r17.xyz) + r0.xyz;
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

