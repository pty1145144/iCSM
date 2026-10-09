#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[40];
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
	const float4 c13 = float4(0.159154935, 0.5, 6.283185478, -3.141592739); (void) c13;
	const float4 c14 = float4(0.57735002, 1.0, 2.0, -1.0); (void) c14;
	const float4 c15 = float4(1.0, 0.0, 1.041666626, -0.020833333); (void) c15;
	const float4 c16 = float4(0.000488281, 0.0, -0.000488281, 0.062499999); (void) c16;
	const float4 c17 = float4(0.125, 0.25, -0.000001, 1000000.0); (void) c17;
	const float4 c18 = float4(0.298999992, 0.587000012, 0.114, -0.300000011); (void) c18;
	const float4 c24 = float4(-3.333333253, -2.0, 3.0, 0.0); (void) c24;
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
	#define c19 uniforms.uniforms_float4[13]
	#define c20 uniforms.uniforms_float4[14]
	#define c21 uniforms.uniforms_float4[15]
	#define c22 uniforms.uniforms_float4[16]
	#define c23 uniforms.uniforms_float4[17]
	#define c30 uniforms.uniforms_float4[18]
	#define c33 uniforms.uniforms_float4[19]
	#define c67 uniforms.uniforms_float4[20]
	#define c68 uniforms.uniforms_float4[21]
	#define c69 uniforms.uniforms_float4[22]
	#define c70 uniforms.uniforms_float4[23]
	#define c71 uniforms.uniforms_float4[24]
	#define c73 uniforms.uniforms_float4[25]
	#define c74 uniforms.uniforms_float4[26]
	#define c77 uniforms.uniforms_float4[27]
	#define c78 uniforms.uniforms_float4[28]
	#define c85 uniforms.uniforms_float4[29]
	#define c86 uniforms.uniforms_float4[30]
	#define c87 uniforms.uniforms_float4[31]
	#define c89 uniforms.uniforms_float4[32]
	#define c101 uniforms.uniforms_float4[33]
	#define c102 uniforms.uniforms_float4[34]
	#define c103 uniforms.uniforms_float4[35]
	#define c104 uniforms.uniforms_float4[36]
	#define c105 uniforms.uniforms_float4[37]
	#define c106 uniforms.uniforms_float4[38]
	#define c107 uniforms.uniforms_float4[39]
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
	r0 = (v5.xyzx * c15.xxxy) + c15.yyyx;
	r1.x = dot(r0, c73);
	r1.y = dot(r0, c74);
	r1.zw = (r1.xy * c15.zz) + c15.ww;
	r2.xy = clamp(r1.zw, float2(0.0), float2(1.0));
	r1.zw = -r1.zw + r2.xy;
	r1.z = dot(r1.zw, c15.xx) + c15.y;
	r1.w = dot(r0, c77);
	r2.x = ((-abs(r1.z) >= 0.0) ? r1.x : r1.w);
	r1.x = dot(r0, c78);
	r2.y = ((-abs(r1.z) >= 0.0) ? r1.y : r1.x);
	r1.x = dot(r0, c69);
	r1.y = dot(r0, c70);
	r0.z = dot(r0, c71);
	r2.zw = (r1.xy * c15.zz) + c15.ww;
	r3.xy = clamp(r2.zw, float2(0.0), float2(1.0));
	r2.zw = -r2.zw + r3.xy;
	r1.w = dot(r2.zw, c15.xx) + c15.y;
	r1.xy = ((-abs(r1.w) >= 0.0) ? r1.xy : r2.xy);
	r2.xy = clamp(r1.xy, float2(0.0), float2(1.0));
	r1.xy = r1.xy + -c13.yy;
	r1.xy = abs(r1.xy) + -c67.zz;
	r1.xy = clamp(r1.xy * c67.ww, float2(0.0), float2(1.0));
	r1.xy = -r1.xy + c14.yy;
	r3.xy = c86.xy;
	r2.zw = ((-abs(r1.z) >= 0.0) ? r3.xy : c87.xy);
	r1.z = ((-abs(r1.z) >= 0.0) ? c15.x : c15.y);
	r1.z = ((-abs(r1.w) >= 0.0) ? c14.y : r1.z);
	r2.zw = ((-abs(r1.w) >= 0.0) ? c85.xy : r2.zw);
	r0.xy = (r2.xy * c13.yy) + r2.zw;
	r1.x = clamp((r1.x * r1.y) + r1.z, 0.0, 1.0);
	r0.w = c15.y;
	r2 = r0 + c16.xxyy;
	r2 = float4(s8_texture.sample_compare(s8, (r2.xyz).xy, (r2.xyz).z, level(r2.w)));
	r3 = r0 + c16.zxyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r2.y = r3.x;
	r3 = r0 + c16.xzyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r2.z = r3.x;
	r3 = r0 + c16.zzyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r2.w = r3.x;
	r1.y = dot(r2, c16.wwww);
	r2 = r0 + c16.xyyy;
	r2 = float4(s8_texture.sample_compare(s8, (r2.xyz).xy, (r2.xyz).z, level(r2.w)));
	r3 = r0 + c16.zyyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r2.y = r3.x;
	r3 = r0 + c16.yzyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r2.z = r3.x;
	r3 = r0 + c16.yxyy;
	r0 = float4(s8_texture.sample_compare(s8, (r0.xyz).xy, (r0.xyz).z, level(r0.w)));
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r2.w = r3.x;
	r0.y = dot(r2, c17.xxxx);
	r0.y = r0.y + r1.y;
	r0.x = (r0.x * c17.y) + r0.y;
	r0.x = r0.x + c14.w;
	r0.x = (r1.x * r0.x) + c14.y;
	r0.yzw = -c89.xyz + v5.xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.y = clamp((r0.y * c68.y) + c68.x, 0.0, 1.0);
	r1.x = mix(r0.x, c14.y, r0.y);
	r0 = s1_texture.sample(s1, v0.xy);
	r0.xyz = (r0.xyz * c14.zzz) + c14.www;
	r2.x = dot(v2.xyz, r0.xyz);
	r2.y = dot(v3.xyz, r0.xyz);
	r2.z = dot(v4.xyz, r0.xyz);
	r0.xyz = normalize(r2.xyz);
	r1.y = ((r0.x >= 0.0) ? c15.y : c15.x);
	r1.z = ((r0.y >= 0.0) ? c15.y : c15.x);
	r1.w = ((r0.z >= 0.0) ? c15.y : c15.x);
	r2.xyz = r0.xyz * r0.xyz;
	r1.yzw = r1.yzw * r2.xyz;
	r3.xyz = r1.yyy * c5.xyz;
	r4.x = ((r0.x >= 0.0) ? c15.x : c15.y);
	r4.y = ((r0.y >= 0.0) ? c15.x : c15.y);
	r4.z = ((r0.z >= 0.0) ? c15.x : c15.y);
	r2.xyz = r2.xyz * r4.xyz;
	r3.xyz = (r2.xxx * c4.xyz) + r3.xyz;
	r2.xyw = (r2.yyy * c6.xyz) + r3.xyz;
	r2.xyw = (r1.zzz * c7.xyz) + r2.xyw;
	r2.xyz = (r2.zzz * c8.xyz) + r2.xyw;
	r1.yzw = (r1.www * c9.xyz) + r2.xyz;
	r2.xyz = c21.xyz + -v5.xyz;
	r3.xyz = normalize(r2.xyz);
	r2.x = clamp(dot(r0.xyz, r3.xyz), 0.0, 1.0);
	r2.y = (r2.x * r2.x) + r2.x;
	r2.y = r2.y * c13.y;
	r4.xyz = c20.xyz * v1.xxx;
	r2.yzw = r2.yyy * r4.xyz;
	r1.yzw = (r2.yzw * r1.xxx) + r1.yzw;
	r2.yzw = c23.xyz + -v5.xyz;
	r5.xyz = normalize(r2.yzw);
	r2.y = clamp(dot(r0.xyz, r5.xyz), 0.0, 1.0);
	r2.z = (r2.y * r2.y) + r2.y;
	r2.z = r2.z * c13.y;
	r6.xyz = c22.xyz * v1.yyy;
	r1.yzw = (r6.xyz * r2.zzz) + r1.yzw;
	r7.xyz = r1.yzw + v6.xyz;
	r8.xyz = r7.xyz + -c103.xxx;
	r8.xyz = clamp(r8.xyz * c103.yyy, float3(0.0), float3(1.0));
	r2.z = dot(r0.xyz, r0.xyz);
	r9.xyz = c3.xyz + -v5.xyz;
	r2.w = dot(r9.xyz, r9.xyz);
	r2.w = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r10.xyz = r2.www * r9.xyz;
	r11.xyz = r2.zzz * r10.xyz;
	r10.z = dot(r10.xyz, r0.xyz);
	r2.z = r10.z + r10.z;
	r10.z = clamp(r10.z, 0.0, 1.0);
	r11.xyz = (r2.zzz * r0.xyz) + -r11.xyz;
	r12 = s6_texture.sample(s6, r11.xyz);
	r13.xyz = r12.xyz * c30.zzz;
	r14.xyz = r13.xyz * r13.xyz;
	r14.xyz = r14.xyz * r14.xyz;
	r2.z = dot(r14.xyz, c18.xyz);
	r3.w = r2.z + c17.z;
	r2.z = ((r2.z == 0.0) ? FLT_MAX : 1.0 / r2.z);
	r2.z = ((r3.w >= 0.0) ? r2.z : c17.w);
	r3.w = dot(r13.xyz, c18.xyz);
	r14.xyz = r3.www * r14.xyz;
	r12.xyz = (c30.zzz * -r12.xyz) + r3.www;
	r12.xyz = (-c103.www * r12.xyz) + r13.xyz;
	r14.xyz = (r14.xyz * r2.zzz) + -r13.xyz;
	r14.xyz = (c103.www * r14.xyz) + r13.xyz;
	r12.xyz = ((c103.w >= 0.0) ? r14.xyz : r12.xyz);
	r2.z = abs(c103.w);
	r12.xyz = ((-r2.z >= 0.0) ? r13.xyz : r12.xyz);
	r8.xyz = (r12.xyz * r8.xyz) + -r12.xyz;
	r8.xyz = (c101.xxx * r8.xyz) + r12.xyz;
	r12.xyz = (r8.xyz * r8.xyz) + -r8.xyz;
	r8.xyz = (c103.zzz * r12.xyz) + r8.xyz;
	r12 = s0_texture.sample(s0, v0.xy);
	r13.xyz = r12.www * c104.xyz;
	r8.xyz = r8.xyz * r13.xyz;
	r2.z = ((r2.y == 0.0) ? FLT_MAX : rsqrt(abs(r2.y)));
	r2.z = ((r2.z == 0.0) ? FLT_MAX : 1.0 / r2.z);
	r5.xyz = (r9.xyz * r2.www) + r5.xyz;
	r3.xyw = (r9.xyz * r2.www) + r3.xyz;
	r2.w = clamp(r3.z, 0.0, 1.0);
	r2.w = (r2.w * r2.w) + r2.w;
	r2.w = r2.w * c13.y;
	r9.xyz = r2.www * r4.xyz;
	r13.xyz = normalize(r3.xyw);
	r10.y = clamp(dot(r0.xyz, r13.xyz), 0.0, 1.0);
	r3.xyz = normalize(r5.xyz);
	r10.x = clamp(dot(r0.xyz, r3.xyz), 0.0, 1.0);
	r0.x = clamp(dot(r0.xyz, v9.xyz), 0.0, 1.0);
	r3 = s10_texture.sample(s10, v0.xy);
	r10.w = r3.w;
	r5 = s7_texture.sample(s7, r10.xw);
	r0.y = r2.y * r10.x;
	r5.xyz = r2.zzz * r5.xyz;
	r5.xyz = r6.xyz * r5.xyz;
	r0.z = ((r2.x == 0.0) ? FLT_MAX : rsqrt(abs(r2.x)));
	r2.x = r2.x * r10.y;
	r13 = s7_texture.sample(s7, r10.yw);
	r14 = s4_texture.sample(s4, r10.zw);
	r2.y = -r10.z + c14.y;
	r3.w = pow(abs(r2.y), c105.x);
	r2.x = r2.x * r3.w;
	r0.y = r0.y * r3.w;
	r0.y = r2.z * r0.y;
	r0.z = ((r0.z == 0.0) ? FLT_MAX : 1.0 / r0.z);
	r2.yzw = r0.zzz * r13.xyz;
	r2.yzw = r4.xyz * r2.yzw;
	r2.yzw = (r2.yzw * r1.xxx) + r5.xyz;
	r2.yzw = r0.www * r2.yzw;
	r0.w = mix(c10.x, c10.y, r3.y);
	r2.yzw = (r2.yzw * r0.www) + r8.xyz;
	r5.x = ((r11.x >= 0.0) ? c15.y : c15.x);
	r5.y = ((r11.y >= 0.0) ? c15.y : c15.x);
	r5.z = ((r11.z >= 0.0) ? c15.y : c15.x);
	r8.xyz = r11.xyz * r11.xyz;
	r10.x = ((r11.x >= 0.0) ? c15.x : c15.y);
	r10.y = ((r11.y >= 0.0) ? c15.x : c15.y);
	r10.z = ((r11.z >= 0.0) ? c15.x : c15.y);
	r10.xyz = r8.xyz * r10.xyz;
	r5.xyz = r5.xyz * r8.xyz;
	r8.xyz = r5.xxx * c5.xyz;
	r8.xyz = (r10.xxx * c4.xyz) + r8.xyz;
	r8.xyz = (r10.yyy * c6.xyz) + r8.xyz;
	r5.xyw = (r5.yyy * c7.xyz) + r8.xyz;
	r5.xyw = (r10.zzz * c8.xyz) + r5.xyw;
	r5.xyz = (r5.zzz * c9.xyz) + r5.xyw;
	r5.xyz = r9.xyz * r5.xyz;
	r8.x = v7.w;
	r8.y = v8.w;
	r8.z = v9.w;
	r8.xyz = -r8.xyz + c21.xyz;
	r9.xyz = normalize(r8.xyz);
	r0.w = clamp(dot(-v9.xyz, r9.xyz), 0.0, 1.0);
	r0.w = (r0.w * r0.w) + r0.w;
	r0.w = r0.w * c13.y;
	r8.xyz = r0.www * r4.xyz;
	r9.xyz = c0.xyz * v6.xyz;
	r8.xyz = (r9.xyz * r8.xyz) + -r5.xyz;
	r5.xyz = (r0.xxx * r8.xyz) + r5.xyz;
	r0.x = r3.x * r14.z;
	r0.x = r0.x * c0.w;
	r5.xyz = r0.xxx * r5.xyz;
	r2.yzw = (r2.yzw * r14.yyy) + r5.xyz;
	r5.xyz = r12.zxy * c14.xxx;
	r5.xyz = (r12.zxy * c14.xxx) + -r5.zxy;
	r8.xy = c13.xy;
	r0.x = (c12.w * r8.x) + r8.y;
	r0.x = fract(r0.x);
	r0.x = (r0.x * c13.z) + c13.w;
	r8.xy = float2(cos(r0.x), sin(r0.x));
	r5.xyz = r5.xyz * r8.yyy;
	r5.xyz = (r12.xyz * r8.xxx) + r5.xyz;
	r0.x = -r8.x + c14.y;
	r0.w = dot(c14.xxx, r12.xyz);
	r0.w = r0.w * c14.x;
	r5.xyz = (r0.www * r0.xxx) + r5.xyz;
	r0.x = abs(c12.w);
	r5.xyz = ((-r0.x >= 0.0) ? r12.xyz : r5.xyz);
	r8.xyz = r5.xyz + c14.www;
	r8.xyz = (r3.yyy * r8.xyz) + c14.yyy;
	r2.yzw = r2.yzw * r8.xyz;
	r8.xyz = r5.xyz * r5.xyz;
	r8.xyz = r8.xyz * r8.xyz;
	r0.x = dot(r5.xyz, c18.xyz);
	r9.xyz = r0.xxx * r8.xyz;
	r0.w = dot(r8.xyz, c18.xyz);
	r8.xyz = mix(r5.xyz, r0.xxx, -c101.yyy);
	r0.x = r0.w + c17.z;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.x = ((r0.x >= 0.0) ? r0.w : c17.w);
	r9.xyz = (r9.xyz * r0.xxx) + -r5.xyz;
	r9.xyz = (c101.yyy * r9.xyz) + r5.xyz;
	r8.xyz = ((c101.y >= 0.0) ? r9.xyz : r8.xyz);
	r0.x = abs(c101.y);
	r8.xyz = ((-r0.x >= 0.0) ? r5.xyz : r8.xyz);
	r0.x = r0.z * r2.x;
	r0.z = (r2.x * r0.z) + r0.y;
	r6.xyz = r6.xyz * r0.yyy;
	r0.yz = r0.zz + -c33.xw;
	r4.xyz = r4.xyz * r0.xxx;
	r4.xyz = (r4.xyz * r1.xxx) + r6.xyz;
	r6.y = c14.y;
	r0.x = (v6.w * c11.w) + r6.y;
	r0.w = r3.x * c105.y;
	r0.x = r0.x * r0.w;
	r4.xyz = r0.xxx * r4.xyz;
	r0.x = r3.y * c101.w;
	r3.xyw = (r5.xyz * r0.xxx) + -c106.xyz;
	r0.x = clamp(r0.x, 0.0, 1.0);
	r3.xyw = (r0.xxx * r3.xyw) + c106.xyz;
	r6.xyz = r3.xyw * r4.xyz;
	r0.x = dot(r6.xyz, c18.xyz);
	r6.xy = -c33.xw + c33.yz;
	r0.w = ((r6.x == 0.0) ? FLT_MAX : 1.0 / r6.x);
	r1.x = ((r6.y == 0.0) ? FLT_MAX : 1.0 / r6.y);
	r0.z = clamp(r0.z * r1.x, 0.0, 1.0);
	r0.y = clamp(r0.w * r0.y, 0.0, 1.0);
	r0.w = (r0.y * c24.y) + c24.z;
	r0.y = r0.y * r0.y;
	r0.y = r0.y * r0.w;
	r0.w = (r0.z * c24.y) + c24.z;
	r0.z = r0.z * r0.z;
	r0.z = r0.z * r0.w;
	r0.y = r0.z * r0.y;
	r0.x = r0.x * r0.y;
	r0.x = r0.x * c106.w;
	r0.y = dot(r1.yzw, c18.xyz);
	r1.xyz = (r4.xyz * r3.xyw) + r1.yzw;
	r0.z = dot(r1.xyz, c18.xyz);
	r0.z = r0.z + c18.w;
	r0.z = clamp(r0.z * c24.x, 0.0, 1.0);
	r0.yw = r0.yy + -c2.xw;
	r1.xy = -c2.xw + c2.yz;
	r1.y = ((r1.y == 0.0) ? FLT_MAX : 1.0 / r1.y);
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r0.yw = clamp(r0.yw * r1.xy, float2(0.0), float2(1.0));
	r1.x = (r0.w * c24.y) + c24.z;
	r0.w = r0.w * r0.w;
	r0.x = (r1.x * r0.w) + r0.x;
	r0.w = (r0.y * c24.y) + c24.z;
	r0.y = r0.y * r0.y;
	r0.y = r0.y * r0.w;
	r0.x = r0.x * r0.y;
	r1.xyz = mix(r5.xyz, r8.xyz, r0.xxx);
	r0.x = dot(r1.xyz, c18.xyz);
	r0.xyw = r0.xxx * c102.xyz;
	r5.xyz = c18.xyz;
	r1.w = dot(c102.xyz, r5.xyz);
	r2.x = r1.w + c17.z;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = ((r2.x >= 0.0) ? r1.w : c17.w);
	r0.xyw = (r0.xyw * r1.www) + -r1.xyz;
	r0.xyw = (c102.www * r0.xyw) + r1.xyz;
	r1.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r0.xyw = (r0.xyw * r1.www) + -r1.xyz;
	r1.w = (r0.z * c24.y) + c24.z;
	r0.z = r0.z * r0.z;
	r0.z = r0.z * r1.w;
	r0.xyz = (r0.zzz * r0.xyw) + r1.xyz;
	r0.xyz = r3.zzz * r0.xyz;
	r0.xyz = (r0.xyz * r7.xyz) + r2.yzw;
	r0.xyz = (r4.xyz * r3.xyw) + r0.xyz;
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

