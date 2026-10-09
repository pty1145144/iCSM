#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[25];
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
	texture2d<float> s7_texture [[texture(7)]],
	sampler s7 [[sampler(7)]],
	texture2d<float> s10_texture [[texture(10)]],
	sampler s10 [[sampler(10)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(0.159154935, 0.5, 6.283185478, -3.141592739); (void) c0;
	const float4 c2 = float4(0.57735002, 1.0, 2.0, -1.0); (void) c2;
	const float4 c13 = float4(0.298999992, 0.587000012, 0.114, -0.000001); (void) c13;
	const float4 c14 = float4(-2.0, 3.0, 1000000.0, 0.0); (void) c14;
	const float4 c15 = float4(0.0, 1.0, -0.300000011, -3.333333253); (void) c15;
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
	#define c19 uniforms.uniforms_float4[11]
	#define c20 uniforms.uniforms_float4[12]
	#define c21 uniforms.uniforms_float4[13]
	#define c22 uniforms.uniforms_float4[14]
	#define c23 uniforms.uniforms_float4[15]
	#define c24 uniforms.uniforms_float4[16]
	#define c25 uniforms.uniforms_float4[17]
	#define c29 uniforms.uniforms_float4[18]
	#define c30 uniforms.uniforms_float4[19]
	#define c101 uniforms.uniforms_float4[20]
	#define c102 uniforms.uniforms_float4[21]
	#define c105 uniforms.uniforms_float4[22]
	#define c106 uniforms.uniforms_float4[23]
	#define c107 uniforms.uniforms_float4[24]
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
	r1.xyz = r0.zxy * c2.xxx;
	r1.xyz = (r0.zxy * c2.xxx) + -r1.zxy;
	r2.xy = c0.xy;
	r0.w = (c12.w * r2.x) + r2.y;
	r0.w = fract(r0.w);
	r0.w = (r0.w * c0.z) + c0.w;
	r2.xy = float2(cos(r0.w), sin(r0.w));
	r1.xyz = r1.xyz * r2.yyy;
	r1.xyz = (r0.xyz * r2.xxx) + r1.xyz;
	r0.w = -r2.x + c2.y;
	r1.w = dot(c2.xxx, r0.xyz);
	r1.w = r1.w * c2.x;
	r1.xyz = (r1.www * r0.www) + r1.xyz;
	r0.w = abs(c12.w);
	r0.xyz = ((-r0.w >= 0.0) ? r0.xyz : r1.xyz);
	r0.w = dot(r0.xyz, c13.xyz);
	r1.xyz = r0.www * c102.xyz;
	r2.xyz = c13.xyz;
	r0.w = dot(c102.xyz, r2.xyz);
	r1.w = r0.w + c13.w;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r1.w >= 0.0) ? r0.w : c14.z);
	r1.xyz = (r1.xyz * r0.www) + -r0.xyz;
	r1.xyz = (c102.www * r1.xyz) + r0.xyz;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r1.xyz = (r1.xyz * r0.www) + -r0.xyz;
	r2 = s10_texture.sample(s10, v0.xy);
	r0.w = r2.y * c101.w;
	r3.xyz = (r0.xyz * r0.www) + -c106.xyz;
	r0.w = clamp(r0.w, 0.0, 1.0);
	r3.xyz = (r0.www * r3.xyz) + c106.xyz;
	r4.xyz = c23.xyz + -v5.xyz;
	r5.xyz = normalize(r4.xyz);
	r4 = s1_texture.sample(s1, v0.xy);
	r4.xyz = (r4.xyz * c2.zzz) + c2.www;
	r6.x = dot(v2.xyz, r4.xyz);
	r6.y = dot(v3.xyz, r4.xyz);
	r6.z = dot(v4.xyz, r4.xyz);
	r4.xyz = normalize(r6.xyz);
	r0.w = clamp(dot(r4.xyz, r5.xyz), 0.0, 1.0);
	r6.xyz = c3.xyz + -v5.xyz;
	r1.w = dot(r6.xyz, r6.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r5.xyz = (r6.xyz * r1.www) + r5.xyz;
	r7.xyz = normalize(r5.xyz);
	r5.y = clamp(dot(r4.xyz, r7.xyz), 0.0, 1.0);
	r3.w = r0.w * r5.y;
	r7.xyz = r1.www * r6.xyz;
	r6.w = clamp(dot(r4.xyz, r7.xyz), 0.0, 1.0);
	r6.w = -r6.w + c2.y;
	r7.x = pow(abs(r6.w), c105.x);
	r3.w = r3.w * r7.x;
	r7.y = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = (r0.w * r0.w) + r0.w;
	r0.w = r0.w * c0.y;
	r7.y = ((r7.y == 0.0) ? FLT_MAX : 1.0 / r7.y);
	r3.w = r3.w * r7.y;
	r8.xyz = c22.xyz * v1.yyy;
	r9.xyz = r3.www * r8.xyz;
	r10.xyz = c21.xyz + -v5.xyz;
	r11.xyz = normalize(r10.xyz);
	r10.xyz = (r6.xyz * r1.www) + r11.xyz;
	r3.w = clamp(dot(r4.xyz, r11.xyz), 0.0, 1.0);
	r11.xyz = normalize(r10.xyz);
	r5.z = clamp(dot(r4.xyz, r11.xyz), 0.0, 1.0);
	r7.z = r3.w * r5.z;
	r7.z = r7.x * r7.z;
	r7.w = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r3.w = (r3.w * r3.w) + r3.w;
	r3.w = r3.w * c0.y;
	r7.w = ((r7.w == 0.0) ? FLT_MAX : 1.0 / r7.w);
	r7.z = r7.w * r7.z;
	r10.xyz = c20.xyz * v1.xxx;
	r9.xyz = (r7.zzz * r10.xyz) + r9.xyz;
	r11.xyz = c25.xyz + -v5.xyz;
	r12.xyz = normalize(r11.xyz);
	r11.xyz = (r6.xyz * r1.www) + r12.xyz;
	r7.z = clamp(dot(r4.xyz, r12.xyz), 0.0, 1.0);
	r12.xyz = normalize(r11.xyz);
	r5.x = clamp(dot(r4.xyz, r12.xyz), 0.0, 1.0);
	r8.w = r7.z * r5.x;
	r8.w = r7.x * r8.w;
	r9.w = ((r7.z == 0.0) ? FLT_MAX : rsqrt(abs(r7.z)));
	r7.z = (r7.z * r7.z) + r7.z;
	r7.z = r7.z * c0.y;
	r9.w = ((r9.w == 0.0) ? FLT_MAX : 1.0 / r9.w);
	r8.w = r8.w * r9.w;
	r11.xyz = c24.xyz * v1.zzz;
	r9.xyz = (r8.www * r11.xyz) + r9.xyz;
	r12.x = c23.w + -v5.x;
	r12.y = c24.w + -v5.y;
	r12.z = c25.w + -v5.z;
	r13.xyz = normalize(r12.xyz);
	r6.xyz = (r6.xyz * r1.www) + r13.xyz;
	r8.w = clamp(dot(r4.xyz, r13.xyz), 0.0, 1.0);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = clamp((r1.w * c19.w) + c19.x, 0.0, 1.0);
	r10.w = min(r1.w, c19.z);
	r1.w = r10.w * r10.w;
	r12.xyz = normalize(r6.xyz);
	r6.x = clamp(dot(r4.xyz, r12.xyz), 0.0, 1.0);
	r6.z = r8.w * r6.x;
	r6.z = r7.x * r6.z;
	r7.x = ((r8.w == 0.0) ? FLT_MAX : rsqrt(abs(r8.w)));
	r8.w = (r8.w * r8.w) + r8.w;
	r8.w = r8.w * c0.y;
	r7.x = ((r7.x == 0.0) ? FLT_MAX : 1.0 / r7.x);
	r6.z = r6.z * r7.x;
	r12.x = c20.w * v1.w;
	r12.y = c21.w * v1.w;
	r12.z = c22.w * v1.w;
	r9.xyz = (r6.zzz * r12.xyz) + r9.xyz;
	r13.y = c2.y;
	r6.z = (v6.w * c11.w) + r13.y;
	r2.x = r2.x * c105.y;
	r2.x = r6.z * r2.x;
	r9.xyz = r2.xxx * r9.xyz;
	r13.x = ((r4.x >= 0.0) ? c15.x : c15.y);
	r13.y = ((r4.y >= 0.0) ? c15.x : c15.y);
	r13.z = ((r4.z >= 0.0) ? c15.x : c15.y);
	r14.xyz = r4.xyz * r4.xyz;
	r4.x = ((r4.x >= 0.0) ? c15.y : c15.x);
	r4.y = ((r4.y >= 0.0) ? c15.y : c15.x);
	r4.z = ((r4.z >= 0.0) ? c15.y : c15.x);
	r4.xyz = r14.xyz * r4.xyz;
	r13.xyz = r13.xyz * r14.xyz;
	r14.xyz = r13.xxx * c5.xyz;
	r14.xyz = (r4.xxx * c4.xyz) + r14.xyz;
	r14.xyz = (r4.yyy * c6.xyz) + r14.xyz;
	r13.xyw = (r13.yyy * c7.xyz) + r14.xyz;
	r4.xyz = (r4.zzz * c8.xyz) + r13.xyw;
	r4.xyz = (r13.zzz * c9.xyz) + r4.xyz;
	r4.xyz = (r10.xyz * r3.www) + r4.xyz;
	r4.xyz = (r8.xyz * r0.www) + r4.xyz;
	r4.xyz = (r11.xyz * r7.zzz) + r4.xyz;
	r4.xyz = (r12.xyz * r8.www) + r4.xyz;
	r13.xyz = (r9.xyz * r3.xyz) + r4.xyz;
	r4.xyz = r4.xyz + v6.xyz;
	r0.w = dot(r13.xyz, c13.xyz);
	r0.w = r0.w + c15.z;
	r0.w = clamp(r0.w * c15.w, 0.0, 1.0);
	r2.x = (r0.w * c14.x) + c14.y;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r2.x;
	r1.xyz = (r0.www * r1.xyz) + r0.xyz;
	r0.xyz = r0.xyz + c2.www;
	r0.xyz = (r2.yyy * r0.xyz) + c2.yyy;
	r1.xyz = r2.zzz * r1.xyz;
	r5.w = r2.w;
	r0.w = mix(c10.x, c10.y, r2.y);
	r2 = s7_texture.sample(s7, r5.yw);
	r2.xyz = r7.yyy * r2.xyz;
	r2.xyz = r8.xyz * r2.xyz;
	r8 = s7_texture.sample(s7, r5.zw);
	r7.yzw = r7.www * r8.xyz;
	r2.xyz = (r7.yzw * r10.xyz) + r2.xyz;
	r8 = s7_texture.sample(s7, r5.xw);
	r6.y = r5.w;
	r5 = s7_texture.sample(s7, r6.xy);
	r5.xyz = r7.xxx * r5.xyz;
	r6.xyz = r9.www * r8.xyz;
	r2.xyz = (r6.xyz * r11.xyz) + r2.xyz;
	r2.xyz = (r5.xyz * r12.xyz) + r2.xyz;
	r2.xyz = r4.www * r2.xyz;
	r2.xyz = r0.www * r2.xyz;
	r0.w = (r6.w * -r6.w) + c0.y;
	r2.w = r6.w * r6.w;
	r3.w = r2.w + r2.w;
	r2.w = (r2.w * c2.z) + c2.w;
	r4.w = mix(c12.y, c12.z, r2.w);
	r2.w = -c12.x + c12.y;
	r2.w = (r3.w * r2.w) + c12.x;
	r0.w = ((r0.w >= 0.0) ? r2.w : r4.w);
	r2.xyz = r0.www * r2.xyz;
	r0.xyz = r0.xyz * r2.xyz;
	r0.xyz = (r1.xyz * r4.xyz) + r0.xyz;
	r0.xyz = (r9.xyz * r3.xyz) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	oC0.xyz = (r1.www * r0.xyz) + r1.xyz;
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
	#undef c19
	#undef c20
	#undef c21
	#undef c22
	#undef c23
	#undef c24
	#undef c25
	#undef c29
	#undef c30
	#undef c101
	#undef c102
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

