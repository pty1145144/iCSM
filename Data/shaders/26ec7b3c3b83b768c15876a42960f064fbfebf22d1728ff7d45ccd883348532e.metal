#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[34];
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
	const float4 c2 = float4(0.159154935, 0.5, 6.283185478, -3.141592739); (void) c2;
	const float4 c26 = float4(0.57735002, 1.0, 2.0, -1.0); (void) c26;
	const float4 c27 = float4(0.298999992, 0.587000012, 0.114, -3.333333253); (void) c27;
	const float4 c31 = float4(-2.0, 3.0, -0.000001, 1000000.0); (void) c31;
	const float4 c32 = float4(0.0, 1.0, -0.400000005, -0.300000011); (void) c32;
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
	#define c3 uniforms.uniforms_float4[2]
	#define c4 uniforms.uniforms_float4[3]
	#define c5 uniforms.uniforms_float4[4]
	#define c6 uniforms.uniforms_float4[5]
	#define c7 uniforms.uniforms_float4[6]
	#define c8 uniforms.uniforms_float4[7]
	#define c9 uniforms.uniforms_float4[8]
	#define c10 uniforms.uniforms_float4[9]
	#define c11 uniforms.uniforms_float4[10]
	#define c12 uniforms.uniforms_float4[11]
	#define c13 uniforms.uniforms_float4[12]
	#define c14 uniforms.uniforms_float4[13]
	#define c15 uniforms.uniforms_float4[14]
	#define c16 uniforms.uniforms_float4[15]
	#define c17 uniforms.uniforms_float4[16]
	#define c18 uniforms.uniforms_float4[17]
	#define c19 uniforms.uniforms_float4[18]
	#define c20 uniforms.uniforms_float4[19]
	#define c21 uniforms.uniforms_float4[20]
	#define c22 uniforms.uniforms_float4[21]
	#define c23 uniforms.uniforms_float4[22]
	#define c24 uniforms.uniforms_float4[23]
	#define c25 uniforms.uniforms_float4[24]
	#define c28 uniforms.uniforms_float4[25]
	#define c29 uniforms.uniforms_float4[26]
	#define c30 uniforms.uniforms_float4[27]
	#define c101 uniforms.uniforms_float4[28]
	#define c102 uniforms.uniforms_float4[29]
	#define c105 uniforms.uniforms_float4[30]
	#define c106 uniforms.uniforms_float4[31]
	#define c107 uniforms.uniforms_float4[32]
	#define c109 uniforms.uniforms_float4[33]
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
	r0 = s0_texture.sample(s0, v0.xy);
	oC0.w = r0.w * c1.w;
	r1.xyz = r0.zxy * c26.xxx;
	r1.xyz = (r0.zxy * c26.xxx) + -r1.zxy;
	r2.xy = c2.xy;
	r0.w = (c12.w * r2.x) + r2.y;
	r0.w = fract(r0.w);
	r0.w = (r0.w * c2.z) + c2.w;
	r2.xy = float2(cos(r0.w), sin(r0.w));
	r1.xyz = r1.xyz * r2.yyy;
	r1.xyz = (r0.xyz * r2.xxx) + r1.xyz;
	r0.w = -r2.x + c26.y;
	r1.w = dot(c26.xxx, r0.xyz);
	r1.w = r1.w * c26.x;
	r1.xyz = (r1.www * r0.www) + r1.xyz;
	r0.w = abs(c12.w);
	r0.xyz = ((-r0.w >= 0.0) ? r0.xyz : r1.xyz);
	r0.w = dot(r0.xyz, c27.xyz);
	r1.xyz = r0.www * c102.xyz;
	r2.xyz = c27.xyz;
	r0.w = dot(c102.xyz, r2.xyz);
	r1.w = r0.w + c31.z;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r1.w >= 0.0) ? r0.w : c31.w);
	r1.xyz = (r1.xyz * r0.www) + -r0.xyz;
	r1.xyz = (c102.www * r1.xyz) + r0.xyz;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r1.xyz = (r1.xyz * r0.www) + -r0.xyz;
	r2 = s10_texture.sample(s10, v0.xy);
	r0.w = r2.y * c101.w;
	r3.xyz = (r0.xyz * r0.www) + -c106.xyz;
	r0.w = clamp(r0.w, 0.0, 1.0);
	r3.xyz = (r0.www * r3.xyz) + c106.xyz;
	r4.z = c32.z;
	r0.w = r4.z * c13.w;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r4.xyz = c14.xyz + -v5.xyz;
	r1.w = dot(r4.xyz, r4.xyz);
	r5.y = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r5.z = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = ((r5.y == 0.0) ? FLT_MAX : 1.0 / r5.y);
	r1.w = r1.w + -c13.w;
	r0.w = clamp(r0.w * r1.w, 0.0, 1.0);
	r6 = (v5.xyzx * c32.yyyx) + c32.xxxy;
	r1.w = dot(r6, c18);
	r3.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r7.x = dot(r6, c15);
	r7.y = dot(r6, c16);
	r7.z = dot(r6, c17);
	r6.xyz = r3.www * r7.xyz;
	r7 = s8_texture.sample(s8, r6.xy);
	r7.xyz = ((-r1.w >= 0.0) ? c32.xxx : r7.xyz);
	r8.xyz = r7.xyz * c28.xyz;
	r6.w = c26.y;
	r6 = float4(s11_texture.sample_compare(s11, (r6.xyz).xy, (r6.xyz).z));
	r1.w = clamp(r6.x, 0.0, 1.0);
	r3.w = -r1.w + c26.y;
	r1.w = (c109.y * r3.w) + r1.w;
	r5.x = c26.y;
	r3.w = clamp(dot(c13.xyz, r5.xyz), 0.0, 1.0);
	r4.xyz = r4.xyz * r5.yyy;
	r4.w = clamp(mix(r1.w, r6.x, r3.w), 0.0, 1.0);
	r5.xyz = r4.www * r8.xyz;
	r8 = s1_texture.sample(s1, v0.xy);
	r6.yzw = (r8.xyz * c26.zzz) + c26.www;
	r8.x = dot(v2.xyz, r6.yzw);
	r8.y = dot(v3.xyz, r6.yzw);
	r8.z = dot(v4.xyz, r6.yzw);
	r9.xyz = normalize(r8.xyz);
	r1.w = dot(r4.xyz, r9.xyz);
	r4.w = clamp(r1.w + c28.w, 0.0, 1.0);
	r1.w = clamp(r1.w, 0.0, 1.0);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r4.w = r3.w * r4.w;
	r5.xyz = r5.xyz * r4.www;
	r6.y = ((r9.x >= 0.0) ? c32.x : c32.y);
	r6.z = ((r9.y >= 0.0) ? c32.x : c32.y);
	r6.w = ((r9.z >= 0.0) ? c32.x : c32.y);
	r8.xyz = r9.xyz * r9.xyz;
	r6.yzw = r6.yzw * r8.xyz;
	r10.xyz = r6.yyy * c5.xyz;
	r11.x = ((r9.x >= 0.0) ? c32.y : c32.x);
	r11.y = ((r9.y >= 0.0) ? c32.y : c32.x);
	r11.z = ((r9.z >= 0.0) ? c32.y : c32.x);
	r8.xyz = r8.xyz * r11.xyz;
	r10.xyz = (r8.xxx * c4.xyz) + r10.xyz;
	r10.xyz = (r8.yyy * c6.xyz) + r10.xyz;
	r10.xyz = (r6.zzz * c7.xyz) + r10.xyz;
	r8.xyz = (r8.zzz * c8.xyz) + r10.xyz;
	r6.yzw = (r6.www * c9.xyz) + r8.xyz;
	r8.xyz = c21.xyz + -v5.xyz;
	r10.xyz = normalize(r8.xyz);
	r4.w = clamp(dot(r9.xyz, r10.xyz), 0.0, 1.0);
	r5.w = (r4.w * r4.w) + r4.w;
	r5.w = r5.w * c2.y;
	r8.xyz = c20.xyz * v1.xxx;
	r6.yzw = (r8.xyz * r5.www) + r6.yzw;
	r11.xyz = c22.xyz * v1.yyy;
	r12.xyz = c23.xyz + -v5.xyz;
	r13.xyz = normalize(r12.xyz);
	r5.w = clamp(dot(r9.xyz, r13.xyz), 0.0, 1.0);
	r7.w = (r5.w * r5.w) + r5.w;
	r7.w = r7.w * c2.y;
	r6.yzw = (r11.xyz * r7.www) + r6.yzw;
	r12.xyz = c24.xyz * v1.zzz;
	r14.xyz = c25.xyz + -v5.xyz;
	r15.xyz = normalize(r14.xyz);
	r7.w = clamp(dot(r9.xyz, r15.xyz), 0.0, 1.0);
	r9.w = (r7.w * r7.w) + r7.w;
	r9.w = r9.w * c2.y;
	r6.yzw = (r12.xyz * r9.www) + r6.yzw;
	r14.x = c23.w + -v5.x;
	r14.y = c24.w + -v5.y;
	r14.z = c25.w + -v5.z;
	r16.xyz = normalize(r14.xyz);
	r9.w = clamp(dot(r9.xyz, r16.xyz), 0.0, 1.0);
	r10.w = (r9.w * r9.w) + r9.w;
	r10.w = r10.w * c2.y;
	r14.x = c20.w * v1.w;
	r14.y = c21.w * v1.w;
	r14.z = c22.w * v1.w;
	r6.yzw = (r14.xyz * r10.www) + r6.yzw;
	r5.xyz = (r5.xyz * r0.www) + r6.yzw;
	r0.w = r0.w * r3.w;
	r6.yzw = r0.www * c28.xyz;
	r6.yzw = r6.yzw * r7.xyz;
	r7.xyz = c3.xyz + -v5.xyz;
	r0.w = dot(r7.xyz, r7.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r13.xyz = (r7.xyz * r0.www) + r13.xyz;
	r17.xyz = normalize(r13.xyz);
	r13.z = clamp(dot(r9.xyz, r17.xyz), 0.0, 1.0);
	r10.w = r5.w * r13.z;
	r5.w = ((r5.w == 0.0) ? FLT_MAX : rsqrt(abs(r5.w)));
	r5.w = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r17.xyz = r0.www * r7.xyz;
	r11.w = dot(r17.xyz, r9.xyz);
	r18.z = clamp(r11.w, 0.0, 1.0);
	r11.w = r11.w + r11.w;
	r12.w = -r18.z + c26.y;
	r14.w = pow(abs(r12.w), c105.x);
	r10.w = r10.w * r14.w;
	r10.w = r5.w * r10.w;
	r19.xyz = r11.xyz * r10.www;
	r10.xyw = (r7.xyz * r0.www) + r10.xyz;
	r10.z = clamp(r10.z, 0.0, 1.0);
	r10.z = (r10.z * r10.z) + r10.z;
	r10.z = r10.z * c2.y;
	r20.xyz = r8.xyz * r10.zzz;
	r21.xyz = normalize(r10.xyw);
	r18.x = clamp(dot(r9.xyz, r21.xyz), 0.0, 1.0);
	r10.x = r4.w * r18.x;
	r4.w = ((r4.w == 0.0) ? FLT_MAX : rsqrt(abs(r4.w)));
	r4.w = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r10.x = r14.w * r10.x;
	r10.x = r4.w * r10.x;
	r10.xyz = (r10.xxx * r8.xyz) + r19.xyz;
	r15.xyz = (r7.xyz * r0.www) + r15.xyz;
	r19.xyz = normalize(r15.xyz);
	r13.y = clamp(dot(r9.xyz, r19.xyz), 0.0, 1.0);
	r10.w = r7.w * r13.y;
	r7.w = ((r7.w == 0.0) ? FLT_MAX : rsqrt(abs(r7.w)));
	r7.w = ((r7.w == 0.0) ? FLT_MAX : 1.0 / r7.w);
	r10.w = r14.w * r10.w;
	r10.w = r7.w * r10.w;
	r10.xyz = (r10.www * r12.xyz) + r10.xyz;
	r15.xyz = (r7.xyz * r0.www) + r16.xyz;
	r4.xyz = (r7.xyz * r0.www) + r4.xyz;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = clamp((r0.w * c19.w) + c19.x, 0.0, 1.0);
	r7.x = min(r0.w, c19.z);
	r0.w = r7.x * r7.x;
	r7.xyz = normalize(r4.xyz);
	r18.y = clamp(dot(r9.xyz, r7.xyz), 0.0, 1.0);
	r4.xyz = normalize(r15.xyz);
	r13.x = clamp(dot(r9.xyz, r4.xyz), 0.0, 1.0);
	r4.x = r9.w * r13.x;
	r4.y = ((r9.w == 0.0) ? FLT_MAX : rsqrt(abs(r9.w)));
	r4.y = ((r4.y == 0.0) ? FLT_MAX : 1.0 / r4.y);
	r4.x = r14.w * r4.x;
	r4.x = r4.y * r4.x;
	r7.xyz = (r4.xxx * r14.xyz) + r10.xyz;
	r10.y = c26.y;
	r4.x = (v6.w * c11.w) + r10.y;
	r4.z = r2.x * c105.y;
	r4.x = r4.x * r4.z;
	r7.xyz = r4.xxx * r7.xyz;
	r10.xyz = (r7.xyz * r3.xyz) + r5.xyz;
	r5.xyz = r5.xyz + v6.xyz;
	r4.x = dot(r10.xyz, c27.xyz);
	r4.x = r4.x + c32.w;
	r4.x = clamp(r4.x * c27.w, 0.0, 1.0);
	r4.z = (r4.x * c31.x) + c31.y;
	r4.x = r4.x * r4.x;
	r4.x = r4.x * r4.z;
	r1.xyz = (r4.xxx * r1.xyz) + r0.xyz;
	r0.xyz = r0.xyz + c26.www;
	r0.xyz = (r2.yyy * r0.xyz) + c26.yyy;
	r1.xyz = r2.zzz * r1.xyz;
	r2.z = -r6.x + c26.y;
	r2.z = (c109.y * r2.z) + r6.x;
	r4.x = clamp(mix(r2.z, r6.x, r3.w), 0.0, 1.0);
	r6.xyz = r4.xxx * r6.yzw;
	r18.w = r2.w;
	r10 = s7_texture.sample(s7, r18.xw);
	r4.xzw = r4.www * r10.xyz;
	r13.w = r18.w;
	r10 = s7_texture.sample(s7, r13.zw);
	r10.xyz = r5.www * r10.xyz;
	r10.xyz = r11.xyz * r10.xyz;
	r4.xzw = (r4.xzw * r8.xyz) + r10.xyz;
	r10 = s7_texture.sample(s7, r13.yw);
	r13 = s7_texture.sample(s7, r13.xw);
	r11.xyz = r4.yyy * r13.xyz;
	r10.xyz = r7.www * r10.xyz;
	r4.xyz = (r10.xyz * r12.xyz) + r4.xzw;
	r4.xyz = (r11.xyz * r14.xyz) + r4.xyz;
	r10 = s7_texture.sample(s7, r18.yw);
	r12 = s4_texture.sample(s4, r18.zw);
	r10.xyz = r1.www * r10.xyz;
	r4.xyz = (r10.xyz * r6.xyz) + r4.xyz;
	r4.xyz = r8.www * r4.xyz;
	r1.w = mix(c10.x, c10.y, r2.y);
	r2.x = r2.x * r12.z;
	r2.x = r2.x * c0.w;
	r2.yzw = r1.www * r4.xyz;
	r1.w = dot(r9.xyz, r9.xyz);
	r4.xyz = r17.xyz * r1.www;
	r4.xyz = (r11.www * r9.xyz) + -r4.xyz;
	r1.w = clamp(dot(r9.xyz, v9.xyz), 0.0, 1.0);
	r6.x = ((r4.x >= 0.0) ? c32.x : c32.y);
	r6.y = ((r4.y >= 0.0) ? c32.x : c32.y);
	r6.z = ((r4.z >= 0.0) ? c32.x : c32.y);
	r9.xyz = r4.xyz * r4.xyz;
	r4.x = ((r4.x >= 0.0) ? c32.y : c32.x);
	r4.y = ((r4.y >= 0.0) ? c32.y : c32.x);
	r4.z = ((r4.z >= 0.0) ? c32.y : c32.x);
	r4.xyz = r9.xyz * r4.xyz;
	r6.xyz = r6.xyz * r9.xyz;
	r9.xyz = r6.xxx * c5.xyz;
	r9.xyz = (r4.xxx * c4.xyz) + r9.xyz;
	r4.xyw = (r4.yyy * c6.xyz) + r9.xyz;
	r4.xyw = (r6.yyy * c7.xyz) + r4.xyw;
	r4.xyz = (r4.zzz * c8.xyz) + r4.xyw;
	r4.xyz = (r6.zzz * c9.xyz) + r4.xyz;
	r4.xyz = r20.xyz * r4.xyz;
	r6.x = v7.w;
	r6.y = v8.w;
	r6.z = v9.w;
	r6.xyz = -r6.xyz + c21.xyz;
	r9.xyz = normalize(r6.xyz);
	r3.w = clamp(dot(-v9.xyz, r9.xyz), 0.0, 1.0);
	r3.w = (r3.w * r3.w) + r3.w;
	r3.w = r3.w * c2.y;
	r6.xyz = r3.www * r8.xyz;
	r8.xyz = c0.xyz * v6.xyz;
	r6.xyz = (r8.xyz * r6.xyz) + -r4.xyz;
	r4.xyz = (r1.www * r6.xyz) + r4.xyz;
	r4.xyz = r2.xxx * r4.xyz;
	r2.xyz = (r2.yzw * r12.yyy) + r4.xyz;
	r0.xyz = r0.xyz * r2.xyz;
	r0.xyz = (r1.xyz * r5.xyz) + r0.xyz;
	r0.xyz = (r7.xyz * r3.xyz) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	oC0.xyz = (r0.www * r0.xyz) + r1.xyz;
	#undef c0
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
	#undef c24
	#undef c25
	#undef c28
	#undef c29
	#undef c30
	#undef c101
	#undef c102
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

