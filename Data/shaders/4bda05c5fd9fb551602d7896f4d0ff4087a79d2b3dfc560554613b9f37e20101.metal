#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[28];
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
	const float4 c19 = float4(0.57735002, 1.0, 2.0, -1.0); (void) c19;
	const float4 c22 = float4(0.298999992, 0.587000012, 0.114, -3.333333253); (void) c22;
	const float4 c23 = float4(-2.0, 3.0, -0.000001, 1000000.0); (void) c23;
	const float4 c24 = float4(0.0, 1.0, -0.400000005, -0.300000011); (void) c24;
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
	#define c20 uniforms.uniforms_float4[18]
	#define c21 uniforms.uniforms_float4[19]
	#define c28 uniforms.uniforms_float4[20]
	#define c30 uniforms.uniforms_float4[21]
	#define c101 uniforms.uniforms_float4[22]
	#define c102 uniforms.uniforms_float4[23]
	#define c105 uniforms.uniforms_float4[24]
	#define c106 uniforms.uniforms_float4[25]
	#define c107 uniforms.uniforms_float4[26]
	#define c109 uniforms.uniforms_float4[27]
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
	r1 = (v5.xyzx * c24.yyyx) + c24.xxxy;
	r0.w = dot(r1, c18);
	r2.x = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r3.x = dot(r1, c15);
	r3.y = dot(r1, c16);
	r3.z = dot(r1, c17);
	r1.xyz = r2.xxx * r3.xyz;
	r2 = s8_texture.sample(s8, r1.xy);
	r2.xyz = ((-r0.w >= 0.0) ? c24.xxx : r2.xyz);
	r3.z = c24.z;
	r0.w = r3.z * c13.w;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r3.xyz = c14.xyz + -v5.xyz;
	r2.w = dot(r3.xyz, r3.xyz);
	r4.y = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r4.z = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r2.w = ((r4.y == 0.0) ? FLT_MAX : 1.0 / r4.y);
	r2.w = r2.w + -c13.w;
	r0.w = clamp(r0.w * r2.w, 0.0, 1.0);
	r4.x = c19.y;
	r2.w = clamp(dot(c13.xyz, r4.xyz), 0.0, 1.0);
	r3.xyz = r3.xyz * r4.yyy;
	r3.w = r0.w * r2.w;
	r4.xyz = r3.www * c28.xyz;
	r4.xyz = r2.xyz * r4.xyz;
	r2.xyz = r2.xyz * c28.xyz;
	r1.w = c19.y;
	r1 = float4(s11_texture.sample_compare(s11, (r1.xyz).xy, (r1.xyz).z));
	r1.y = -r1.x + c19.y;
	r1.y = (c109.y * r1.y) + r1.x;
	r3.w = clamp(mix(r1.y, r1.x, r2.w), 0.0, 1.0);
	r1.yzw = r3.www * r4.xyz;
	r4 = s1_texture.sample(s1, v0.xy);
	r4.xyz = (r4.xyz * c19.zzz) + c19.www;
	r5.x = dot(v2.xyz, r4.xyz);
	r5.y = dot(v3.xyz, r4.xyz);
	r5.z = dot(v4.xyz, r4.xyz);
	r4.xyz = normalize(r5.xyz);
	r3.w = dot(r3.xyz, r4.xyz);
	r5.x = clamp(r3.w, 0.0, 1.0);
	r3.w = clamp(r3.w + c28.w, 0.0, 1.0);
	r3.w = r2.w * r3.w;
	r5.x = ((r5.x == 0.0) ? FLT_MAX : rsqrt(abs(r5.x)));
	r5.x = ((r5.x == 0.0) ? FLT_MAX : 1.0 / r5.x);
	r5.yzw = c3.xyz + -v5.xyz;
	r6.x = dot(r5.yzw, r5.yzw);
	r6.x = ((r6.x == 0.0) ? FLT_MAX : rsqrt(abs(r6.x)));
	r3.xyz = (r5.yzw * r6.xxx) + r3.xyz;
	r7.xyz = normalize(r3.xyz);
	r7.y = clamp(dot(r4.xyz, r7.xyz), 0.0, 1.0);
	r8 = s10_texture.sample(s10, v0.xy);
	r7.w = r8.w;
	r9 = s7_texture.sample(s7, r7.yw);
	r3.xyz = r5.xxx * r9.xyz;
	r1.yzw = r1.yzw * r3.xyz;
	r3.xyz = c21.xyz + -v5.xyz;
	r9.xyz = normalize(r3.xyz);
	r3.xyz = (r5.yzw * r6.xxx) + r9.xyz;
	r5.xyz = r5.yzw * r6.xxx;
	r6.xyz = normalize(r3.xyz);
	r7.x = clamp(dot(r4.xyz, r6.xyz), 0.0, 1.0);
	r6 = s7_texture.sample(s7, r7.xw);
	r3.x = clamp(dot(r4.xyz, r9.xyz), 0.0, 1.0);
	r3.y = clamp(r9.z, 0.0, 1.0);
	r3.y = (r3.y * r3.y) + r3.y;
	r3.y = r3.y * c2.y;
	r3.z = ((r3.x == 0.0) ? FLT_MAX : rsqrt(abs(r3.x)));
	r3.z = ((r3.z == 0.0) ? FLT_MAX : 1.0 / r3.z);
	r6.xyz = r3.zzz * r6.xyz;
	r9.xyz = c20.xyz * v1.xxx;
	r1.yzw = (r6.xyz * r9.xyz) + r1.yzw;
	r1.yzw = r4.www * r1.yzw;
	r4.w = mix(c10.x, c10.y, r8.y);
	r1.yzw = r1.yzw * r4.www;
	r4.w = dot(r4.xyz, r4.xyz);
	r6.xyz = r5.xyz * r4.www;
	r7.z = dot(r5.xyz, r4.xyz);
	r4.w = r7.z + r7.z;
	r7.z = clamp(r7.z, 0.0, 1.0);
	r5.xyz = (r4.www * r4.xyz) + -r6.xyz;
	r6.x = ((r5.x >= 0.0) ? c24.x : c24.y);
	r6.y = ((r5.y >= 0.0) ? c24.x : c24.y);
	r6.z = ((r5.z >= 0.0) ? c24.x : c24.y);
	r10.xyz = r5.xyz * r5.xyz;
	r5.x = ((r5.x >= 0.0) ? c24.y : c24.x);
	r5.y = ((r5.y >= 0.0) ? c24.y : c24.x);
	r5.z = ((r5.z >= 0.0) ? c24.y : c24.x);
	r5.xyz = r10.xyz * r5.xyz;
	r6.xyz = r6.xyz * r10.xyz;
	r10.xyz = r6.xxx * c5.xyz;
	r10.xyz = (r5.xxx * c4.xyz) + r10.xyz;
	r5.xyw = (r5.yyy * c6.xyz) + r10.xyz;
	r5.xyw = (r6.yyy * c7.xyz) + r5.xyw;
	r5.xyz = (r5.zzz * c8.xyz) + r5.xyw;
	r5.xyz = (r6.zzz * c9.xyz) + r5.xyz;
	r6.xyz = r3.yyy * r9.xyz;
	r5.xyz = r5.xyz * r6.xyz;
	r6.x = v7.w;
	r6.y = v8.w;
	r6.z = v9.w;
	r6.xyz = -r6.xyz + c21.xyz;
	r10.xyz = normalize(r6.xyz);
	r3.y = clamp(dot(-v9.xyz, r10.xyz), 0.0, 1.0);
	r3.y = (r3.y * r3.y) + r3.y;
	r3.y = r3.y * c2.y;
	r6.xyz = r3.yyy * r9.xyz;
	r10.xyz = c0.xyz * v6.xyz;
	r6.xyz = (r10.xyz * r6.xyz) + -r5.xyz;
	r3.y = clamp(dot(r4.xyz, v9.xyz), 0.0, 1.0);
	r5.xyz = (r3.yyy * r6.xyz) + r5.xyz;
	r6 = s4_texture.sample(s4, r7.zw);
	r3.y = -r7.z + c19.y;
	r4.w = pow(abs(r3.y), c105.x);
	r3.y = r8.x * r6.z;
	r3.y = r3.y * c0.w;
	r5.xyz = r3.yyy * r5.xyz;
	r1.yzw = (r1.yzw * r6.yyy) + r5.xyz;
	r5.xyz = r0.zxy * c19.xxx;
	r5.xyz = (r0.zxy * c19.xxx) + -r5.zxy;
	r6.xy = c2.xy;
	r3.y = (c12.w * r6.x) + r6.y;
	r3.y = fract(r3.y);
	r3.y = (r3.y * c2.z) + c2.w;
	r6.xy = float2(cos(r3.y), sin(r3.y));
	r5.xyz = r5.xyz * r6.yyy;
	r5.xyz = (r0.xyz * r6.xxx) + r5.xyz;
	r3.y = -r6.x + c19.y;
	r5.w = dot(c19.xxx, r0.xyz);
	r5.w = r5.w * c19.x;
	r5.xyz = (r5.www * r3.yyy) + r5.xyz;
	r3.y = abs(c12.w);
	r0.xyz = ((-r3.y >= 0.0) ? r0.xyz : r5.xyz);
	r5.xyz = r0.xyz + c19.www;
	r5.xyz = (r8.yyy * r5.xyz) + c19.yyy;
	r1.yzw = r1.yzw * r5.xyz;
	r5.x = ((r4.x >= 0.0) ? c24.x : c24.y);
	r5.y = ((r4.y >= 0.0) ? c24.x : c24.y);
	r5.z = ((r4.z >= 0.0) ? c24.x : c24.y);
	r6.xyz = r4.xyz * r4.xyz;
	r4.x = ((r4.x >= 0.0) ? c24.y : c24.x);
	r4.y = ((r4.y >= 0.0) ? c24.y : c24.x);
	r4.z = ((r4.z >= 0.0) ? c24.y : c24.x);
	r4.xyz = r6.xyz * r4.xyz;
	r5.xyz = r5.xyz * r6.xyz;
	r6.xyz = r5.xxx * c5.xyz;
	r6.xyz = (r4.xxx * c4.xyz) + r6.xyz;
	r6.xyz = (r4.yyy * c6.xyz) + r6.xyz;
	r5.xyw = (r5.yyy * c7.xyz) + r6.xyz;
	r4.xyz = (r4.zzz * c8.xyz) + r5.xyw;
	r4.xyz = (r5.zzz * c9.xyz) + r4.xyz;
	r3.y = (r3.x * r3.x) + r3.x;
	r3.x = r3.x * r7.x;
	r3.x = r4.w * r3.x;
	r3.x = r3.z * r3.x;
	r5.xyz = r9.xyz * r3.xxx;
	r3.x = r3.y * c2.y;
	r3.xyz = (r9.xyz * r3.xxx) + r4.xyz;
	r4.x = clamp(r1.x, 0.0, 1.0);
	r4.y = -r4.x + c19.y;
	r4.x = (c109.y * r4.y) + r4.x;
	r5.w = clamp(mix(r4.x, r1.x, r2.w), 0.0, 1.0);
	r2.xyz = r2.xyz * r5.www;
	r2.xyz = r2.xyz * r3.www;
	r2.xyz = (r2.xyz * r0.www) + r3.xyz;
	r3.y = c19.y;
	r0.w = (v6.w * c11.w) + r3.y;
	r1.x = r8.x * c105.y;
	r0.w = r0.w * r1.x;
	r3.xyz = r0.www * r5.xyz;
	r0.w = r8.y * c101.w;
	r4.xyz = (r0.xyz * r0.www) + -c106.xyz;
	r0.w = clamp(r0.w, 0.0, 1.0);
	r4.xyz = (r0.www * r4.xyz) + c106.xyz;
	r5.xyz = (r3.xyz * r4.xyz) + r2.xyz;
	r2.xyz = r2.xyz + v6.xyz;
	r0.w = dot(r5.xyz, c22.xyz);
	r0.w = r0.w + c24.w;
	r0.w = clamp(r0.w * c22.w, 0.0, 1.0);
	r1.x = (r0.w * c23.x) + c23.y;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.x;
	r5.xyz = c22.xyz;
	r1.x = dot(c102.xyz, r5.xyz);
	r2.w = r1.x + c23.z;
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.x = ((r2.w >= 0.0) ? r1.x : c23.w);
	r2.w = dot(r0.xyz, c22.xyz);
	r5.xyz = r2.www * c102.xyz;
	r5.xyz = (r5.xyz * r1.xxx) + -r0.xyz;
	r5.xyz = (c102.www * r5.xyz) + r0.xyz;
	r1.x = clamp(c107.w + v6.w, 0.0, 1.0);
	r5.xyz = (r5.xyz * r1.xxx) + -r0.xyz;
	r0.xyz = (r0.www * r5.xyz) + r0.xyz;
	r0.xyz = r8.zzz * r0.xyz;
	r0.xyz = (r0.xyz * r2.xyz) + r1.yzw;
	r0.xyz = (r3.xyz * r4.xyz) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	oC0.xyz = r0.xyz * c30.xxx;
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
	#undef c20
	#undef c21
	#undef c28
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

