#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[33];
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
	const float4 c0 = float4(0.159154935, 0.5, 6.283185478, -3.141592739); (void) c0;
	const float4 c2 = float4(0.57735002, 1.0, 2.0, -1.0); (void) c2;
	const float4 c24 = float4(0.298999992, 0.587000012, 0.114, 1000000.0); (void) c24;
	const float4 c25 = float4(-0.300000011, -3.333333253, -2.0, 3.0); (void) c25;
	const float4 c26 = float4(0.0, 1.0, -0.400000005, -0.000001); (void) c26;
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
	#define c13 uniforms.uniforms_float4[11]
	#define c14 uniforms.uniforms_float4[12]
	#define c15 uniforms.uniforms_float4[13]
	#define c16 uniforms.uniforms_float4[14]
	#define c17 uniforms.uniforms_float4[15]
	#define c18 uniforms.uniforms_float4[16]
	#define c19 uniforms.uniforms_float4[17]
	#define c20 uniforms.uniforms_float4[18]
	#define c21 uniforms.uniforms_float4[19]
	#define c22 uniforms.uniforms_float4[20]
	#define c23 uniforms.uniforms_float4[21]
	#define c28 uniforms.uniforms_float4[22]
	#define c29 uniforms.uniforms_float4[23]
	#define c30 uniforms.uniforms_float4[24]
	#define c101 uniforms.uniforms_float4[25]
	#define c102 uniforms.uniforms_float4[26]
	#define c103 uniforms.uniforms_float4[27]
	#define c104 uniforms.uniforms_float4[28]
	#define c105 uniforms.uniforms_float4[29]
	#define c106 uniforms.uniforms_float4[30]
	#define c107 uniforms.uniforms_float4[31]
	#define c109 uniforms.uniforms_float4[32]
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
	r1 = s1_texture.sample(s1, v0.xy);
	r1.xyz = (r1.xyz * c2.zzz) + c2.www;
	r2.x = dot(v2.xyz, r1.xyz);
	r2.y = dot(v3.xyz, r1.xyz);
	r2.z = dot(v4.xyz, r1.xyz);
	r1.xyz = normalize(r2.xyz);
	r2.x = ((r1.x >= 0.0) ? c26.x : c26.y);
	r2.y = ((r1.y >= 0.0) ? c26.x : c26.y);
	r2.z = ((r1.z >= 0.0) ? c26.x : c26.y);
	r3.xyz = r1.xyz * r1.xyz;
	r2.xyz = r2.xyz * r3.xyz;
	r4.xyz = r2.xxx * c5.xyz;
	r5.x = ((r1.x >= 0.0) ? c26.y : c26.x);
	r5.y = ((r1.y >= 0.0) ? c26.y : c26.x);
	r5.z = ((r1.z >= 0.0) ? c26.y : c26.x);
	r3.xyz = r3.xyz * r5.xyz;
	r4.xyz = (r3.xxx * c4.xyz) + r4.xyz;
	r3.xyw = (r3.yyy * c6.xyz) + r4.xyz;
	r2.xyw = (r2.yyy * c7.xyz) + r3.xyw;
	r2.xyw = (r3.zzz * c8.xyz) + r2.xyw;
	r2.xyz = (r2.zzz * c9.xyz) + r2.xyw;
	r3.xyz = c21.xyz + -v5.xyz;
	r4.xyz = normalize(r3.xyz);
	r0.w = clamp(dot(r1.xyz, r4.xyz), 0.0, 1.0);
	r2.w = (r0.w * r0.w) + r0.w;
	r2.w = r2.w * c0.y;
	r3.xyz = c20.xyz * v1.xxx;
	r2.xyz = (r3.xyz * r2.www) + r2.xyz;
	r5.xyz = c23.xyz + -v5.xyz;
	r6.xyz = normalize(r5.xyz);
	r2.w = clamp(dot(r1.xyz, r6.xyz), 0.0, 1.0);
	r3.w = (r2.w * r2.w) + r2.w;
	r3.w = r3.w * c0.y;
	r5.xyz = c22.xyz * v1.yyy;
	r2.xyz = (r5.xyz * r3.www) + r2.xyz;
	r7 = (v5.xyzx * c26.yyyx) + c26.xxxy;
	r3.w = dot(r7, c18);
	r4.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r8.x = dot(r7, c15);
	r8.y = dot(r7, c16);
	r8.z = dot(r7, c17);
	r7.xyz = r4.www * r8.xyz;
	r8 = s8_texture.sample(s8, r7.xy);
	r8.xyz = ((-r3.w >= 0.0) ? c26.xxx : r8.xyz);
	r9.xyz = r8.xyz * c28.xyz;
	r7.w = c2.y;
	r7 = float4(s11_texture.sample_compare(s11, (r7.xyz).xy, (r7.xyz).z));
	r3.w = clamp(r7.x, 0.0, 1.0);
	r4.w = -r3.w + c2.y;
	r3.w = (c109.y * r4.w) + r3.w;
	r10.x = c2.y;
	r7.yzw = c14.xyz + -v5.xyz;
	r4.w = dot(r7.yzw, r7.yzw);
	r10.z = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r10.y = ((r4.w == 0.0) ? FLT_MAX : rsqrt(abs(r4.w)));
	r4.w = clamp(dot(c13.xyz, r10.xyz), 0.0, 1.0);
	r5.w = clamp(mix(r3.w, r7.x, r4.w), 0.0, 1.0);
	r9.xyz = r5.www * r9.xyz;
	r7.yzw = r7.yzw * r10.yyy;
	r3.w = ((r10.y == 0.0) ? FLT_MAX : 1.0 / r10.y);
	r3.w = r3.w + -c13.w;
	r5.w = dot(r7.yzw, r1.xyz);
	r6.w = clamp(r5.w + c28.w, 0.0, 1.0);
	r5.w = clamp(r5.w, 0.0, 1.0);
	r5.w = ((r5.w == 0.0) ? FLT_MAX : rsqrt(abs(r5.w)));
	r5.w = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r6.w = r4.w * r6.w;
	r9.xyz = r9.xyz * r6.www;
	r10.z = c26.z;
	r6.w = r10.z * c13.w;
	r6.w = ((r6.w == 0.0) ? FLT_MAX : 1.0 / r6.w);
	r3.w = clamp(r3.w * r6.w, 0.0, 1.0);
	r2.xyz = (r9.xyz * r3.www) + r2.xyz;
	r3.w = r3.w * r4.w;
	r9.xyz = r3.www * c28.xyz;
	r8.xyz = r8.xyz * r9.xyz;
	r9.xyz = r2.xyz + v6.xyz;
	r10.xyz = r9.xyz + -c103.xxx;
	r10.xyz = clamp(r10.xyz * c103.yyy, float3(0.0), float3(1.0));
	r3.w = dot(r1.xyz, r1.xyz);
	r11.xyz = c3.xyz + -v5.xyz;
	r6.w = dot(r11.xyz, r11.xyz);
	r6.w = ((r6.w == 0.0) ? FLT_MAX : rsqrt(abs(r6.w)));
	r12.xyz = r6.www * r11.xyz;
	r13.xyz = r3.www * r12.xyz;
	r12.z = dot(r12.xyz, r1.xyz);
	r3.w = r12.z + r12.z;
	r12.z = clamp(r12.z, 0.0, 1.0);
	r13.xyz = (r3.www * r1.xyz) + -r13.xyz;
	r13 = s6_texture.sample(s6, r13.xyz);
	r14.xyz = r13.xyz * c30.zzz;
	r15.xyz = r14.xyz * r14.xyz;
	r15.xyz = r15.xyz * r15.xyz;
	r3.w = dot(r15.xyz, c24.xyz);
	r8.w = r3.w + c26.w;
	r3.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r3.w = ((r8.w >= 0.0) ? r3.w : c24.w);
	r8.w = dot(r14.xyz, c24.xyz);
	r15.xyz = r8.www * r15.xyz;
	r13.xyz = (c30.zzz * -r13.xyz) + r8.www;
	r13.xyz = (-c103.www * r13.xyz) + r14.xyz;
	r15.xyz = (r15.xyz * r3.www) + -r14.xyz;
	r15.xyz = (c103.www * r15.xyz) + r14.xyz;
	r13.xyz = ((c103.w >= 0.0) ? r15.xyz : r13.xyz);
	r3.w = abs(c103.w);
	r13.xyz = ((-r3.w >= 0.0) ? r14.xyz : r13.xyz);
	r10.xyz = (r13.xyz * r10.xyz) + -r13.xyz;
	r10.xyz = (c101.xxx * r10.xyz) + r13.xyz;
	r13.xyz = (r10.xyz * r10.xyz) + -r10.xyz;
	r10.xyz = (c103.zzz * r13.xyz) + r10.xyz;
	r13.xyz = r1.www * c104.xyz;
	r10.xyz = r10.xyz * r13.xyz;
	r3.w = -r7.x + c2.y;
	r3.w = (c109.y * r3.w) + r7.x;
	r8.w = clamp(mix(r3.w, r7.x, r4.w), 0.0, 1.0);
	r8.xyz = r8.www * r8.xyz;
	r3.w = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r3.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r6.xyz = (r11.xyz * r6.www) + r6.xyz;
	r13.xyz = normalize(r6.xyz);
	r6.x = clamp(dot(r1.xyz, r13.xyz), 0.0, 1.0);
	r13 = s10_texture.sample(s10, v0.xy);
	r12.w = r13.w;
	r6.y = r12.w;
	r14 = s7_texture.sample(s7, r6.xy);
	r2.w = r2.w * r6.x;
	r6.xyz = r3.www * r14.xyz;
	r6.xyz = r5.xyz * r6.xyz;
	r4.xyz = (r11.xyz * r6.www) + r4.xyz;
	r7.xyz = (r11.xyz * r6.www) + r7.yzw;
	r4.w = ((r6.w == 0.0) ? FLT_MAX : 1.0 / r6.w);
	r4.w = clamp((r4.w * c19.w) + c19.x, 0.0, 1.0);
	r6.w = min(r4.w, c19.z);
	r4.w = r6.w * r6.w;
	r11.xyz = normalize(r7.xyz);
	r12.y = clamp(dot(r1.xyz, r11.xyz), 0.0, 1.0);
	r7 = s7_texture.sample(s7, r12.yw);
	r7.xyz = r5.www * r7.xyz;
	r11.xyz = normalize(r4.xyz);
	r12.x = clamp(dot(r1.xyz, r11.xyz), 0.0, 1.0);
	r11 = s7_texture.sample(s7, r12.xw);
	r1.x = r0.w * r12.x;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r14 = s4_texture.sample(s4, r12.zw);
	r1.y = -r12.z + c2.y;
	r4.x = pow(abs(r1.y), c105.x);
	r11.xyz = r0.www * r11.xyz;
	r6.xyz = (r11.xyz * r3.xyz) + r6.xyz;
	r6.xyz = (r7.xyz * r8.xyz) + r6.xyz;
	r1.yzw = r1.www * r6.xyz;
	r4.y = mix(c10.x, c10.y, r13.y);
	r1.yzw = (r1.yzw * r4.yyy) + r10.xyz;
	r1.yzw = r14.yyy * r1.yzw;
	r6.xyz = r0.zxy * c2.xxx;
	r6.xyz = (r0.zxy * c2.xxx) + -r6.zxy;
	r7.xy = c0.xy;
	r4.y = (c12.w * r7.x) + r7.y;
	r4.y = fract(r4.y);
	r4.y = (r4.y * c0.z) + c0.w;
	r7.xy = float2(cos(r4.y), sin(r4.y));
	r6.xyz = r6.xyz * r7.yyy;
	r6.xyz = (r0.xyz * r7.xxx) + r6.xyz;
	r4.y = -r7.x + c2.y;
	r4.z = dot(c2.xxx, r0.xyz);
	r4.z = r4.z * c2.x;
	r6.xyz = (r4.zzz * r4.yyy) + r6.xyz;
	r4.y = abs(c12.w);
	r0.xyz = ((-r4.y >= 0.0) ? r0.xyz : r6.xyz);
	r6.xyz = r0.xyz + c2.www;
	r6.xyz = (r13.yyy * r6.xyz) + c2.yyy;
	r1.yzw = r1.yzw * r6.xyz;
	r6.xyz = c24.xyz;
	r4.y = dot(c102.xyz, r6.xyz);
	r4.z = r4.y + c26.w;
	r4.y = ((r4.y == 0.0) ? FLT_MAX : 1.0 / r4.y);
	r4.y = ((r4.z >= 0.0) ? r4.y : c24.w);
	r4.z = dot(r0.xyz, c24.xyz);
	r6.xyz = r4.zzz * c102.xyz;
	r6.xyz = (r6.xyz * r4.yyy) + -r0.xyz;
	r6.xyz = (c102.www * r6.xyz) + r0.xyz;
	r4.y = clamp(c107.w + v6.w, 0.0, 1.0);
	r6.xyz = (r6.xyz * r4.yyy) + -r0.xyz;
	r2.w = r2.w * r4.x;
	r1.x = r1.x * r4.x;
	r0.w = r0.w * r1.x;
	r1.x = r3.w * r2.w;
	r4.xyz = r5.xyz * r1.xxx;
	r3.xyz = (r0.www * r3.xyz) + r4.xyz;
	r4.y = c2.y;
	r0.w = (v6.w * c11.w) + r4.y;
	r1.x = r13.x * c105.y;
	r0.w = r0.w * r1.x;
	r3.xyz = r0.www * r3.xyz;
	r0.w = r13.y * c101.w;
	r4.xyz = (r0.xyz * r0.www) + -c106.xyz;
	r0.w = clamp(r0.w, 0.0, 1.0);
	r4.xyz = (r0.www * r4.xyz) + c106.xyz;
	r2.xyz = (r3.xyz * r4.xyz) + r2.xyz;
	r0.w = dot(r2.xyz, c24.xyz);
	r0.w = r0.w + c25.x;
	r0.w = clamp(r0.w * c25.y, 0.0, 1.0);
	r1.x = (r0.w * c25.z) + c25.w;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.x;
	r0.xyz = (r0.www * r6.xyz) + r0.xyz;
	r0.xyz = r13.zzz * r0.xyz;
	r0.xyz = (r0.xyz * r9.xyz) + r1.yzw;
	r0.xyz = (r3.xyz * r4.xyz) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	oC0.xyz = (r4.www * r0.xyz) + r1.xyz;
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
	#undef c28
	#undef c29
	#undef c30
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
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

