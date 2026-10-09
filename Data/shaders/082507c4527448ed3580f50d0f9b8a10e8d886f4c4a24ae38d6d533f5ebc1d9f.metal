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
	float4 v1 [[user(texcoord2)]];
	float4 v2 [[user(texcoord3)]];
	float4 v3 [[user(texcoord4)]];
	float4 v4 [[user(texcoord5)]];
	float4 v5 [[user(texcoord6)]];
	float4 v6 [[user(texcoord8)]];
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
	const float4 c11 = float4(0.57735002, 1.0, 2.0, -1.0); (void) c11;
	const float4 c19 = float4(-2.0, 3.0, 0.0, 0.0); (void) c19;
	const float4 c20 = float4(-0.000001, 1000000.0, -0.300000011, -3.333333253); (void) c20;
	const float4 c21 = float4(0.999999703, 0.298999992, 0.587000012, 0.114); (void) c21;
	const float4 c22 = float4(0.0, 1.0, -0.400000005, 0.000796326); (void) c22;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	float4 r7;
	float4 r8;
	#define c1 uniforms.uniforms_float4[0]
	#define c2 uniforms.uniforms_float4[1]
	#define c3 uniforms.uniforms_float4[2]
	#define c4 uniforms.uniforms_float4[3]
	#define c5 uniforms.uniforms_float4[4]
	#define c6 uniforms.uniforms_float4[5]
	#define c7 uniforms.uniforms_float4[6]
	#define c8 uniforms.uniforms_float4[7]
	#define c9 uniforms.uniforms_float4[8]
	#define c10 uniforms.uniforms_float4[9]
	#define c12 uniforms.uniforms_float4[10]
	#define c13 uniforms.uniforms_float4[11]
	#define c14 uniforms.uniforms_float4[12]
	#define c15 uniforms.uniforms_float4[13]
	#define c16 uniforms.uniforms_float4[14]
	#define c17 uniforms.uniforms_float4[15]
	#define c18 uniforms.uniforms_float4[16]
	#define c28 uniforms.uniforms_float4[17]
	#define c30 uniforms.uniforms_float4[18]
	#define c101 uniforms.uniforms_float4[19]
	#define c102 uniforms.uniforms_float4[20]
	#define c103 uniforms.uniforms_float4[21]
	#define c104 uniforms.uniforms_float4[22]
	#define c107 uniforms.uniforms_float4[23]
	#define c109 uniforms.uniforms_float4[24]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define oC0 output.oC0
	r0 = s1_texture.sample(s1, v0.xy);
	r0.xyz = (r0.xyz * c11.zzz) + c11.www;
	r1.x = dot(v1.xyz, r0.xyz);
	r1.y = dot(v2.xyz, r0.xyz);
	r1.z = dot(v3.xyz, r0.xyz);
	r0.xyz = normalize(r1.xyz);
	r1.xyz = r0.xyz * v6.zxy;
	r1.xyz = (r0.zxy * v6.xyz) + -r1.xyz;
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.xyz = r1.www * r1.xyz;
	r2.xyz = r0.xyz * r1.yzx;
	r2.xyz = (r0.zxy * r1.zxy) + -r2.xyz;
	r1.xyz = r1.xyz * c22.www;
	r1.w = dot(r2.xyz, r2.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r2.xyz = r1.www * r2.xyz;
	r1.xyz = (r2.xyz * c21.xxx) + r1.xyz;
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.xyz = r1.www * r1.xyz;
	r2.xyz = r0.xyz * r1.xyz;
	r2.xyz = (r1.zxy * r0.yzx) + -r2.xyz;
	r3.xyz = r1.xyz * r2.xyz;
	r1.xyz = (r2.zxy * r1.yzx) + -r3.xyz;
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r2.xyz = c3.xyz + -v4.xyz;
	r2.w = dot(r2.xyz, r2.xyz);
	r2.w = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r3.xyz = r2.www * r2.xyz;
	r1.xyz = (r1.xyz * r1.www) + -r3.xyz;
	r1.xyz = (c10.www * r1.xyz) + r3.xyz;
	r3.y = clamp(dot(r3.xyz, r0.xyz), 0.0, 1.0);
	r1.w = dot(r0.xyz, r1.xyz);
	r1.w = r1.w + r1.w;
	r3.w = dot(r0.xyz, r0.xyz);
	r1.xyz = r1.xyz * r3.www;
	r1.xyz = (r1.www * r0.xyz) + -r1.xyz;
	r1 = s6_texture.sample(s6, r1.xyz);
	r4.xyz = r1.xyz * c30.zzz;
	r5.xyz = r4.xyz * r4.xyz;
	r5.xyz = r5.xyz * r5.xyz;
	r1.w = dot(r5.xyz, c21.yzw);
	r3.w = r1.w + c20.x;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = ((r3.w >= 0.0) ? r1.w : c20.y);
	r3.w = dot(r4.xyz, c21.yzw);
	r5.xyz = r3.www * r5.xyz;
	r1.xyz = (c30.zzz * -r1.xyz) + r3.www;
	r1.xyz = (-c103.www * r1.xyz) + r4.xyz;
	r5.xyz = (r5.xyz * r1.www) + -r4.xyz;
	r5.xyz = (c103.www * r5.xyz) + r4.xyz;
	r1.xyz = ((c103.w >= 0.0) ? r5.xyz : r1.xyz);
	r1.w = abs(c103.w);
	r1.xyz = ((-r1.w >= 0.0) ? r4.xyz : r1.xyz);
	r4.x = ((r0.x >= 0.0) ? c22.x : c22.y);
	r4.y = ((r0.y >= 0.0) ? c22.x : c22.y);
	r4.z = ((r0.z >= 0.0) ? c22.x : c22.y);
	r5.xyz = r0.xyz * r0.xyz;
	r4.xyz = r4.xyz * r5.xyz;
	r6.xyz = r4.xxx * c5.xyz;
	r7.x = ((r0.x >= 0.0) ? c22.y : c22.x);
	r7.y = ((r0.y >= 0.0) ? c22.y : c22.x);
	r7.z = ((r0.z >= 0.0) ? c22.y : c22.x);
	r5.xyz = r5.xyz * r7.xyz;
	r6.xyz = (r5.xxx * c4.xyz) + r6.xyz;
	r5.xyw = (r5.yyy * c6.xyz) + r6.xyz;
	r4.xyw = (r4.yyy * c7.xyz) + r5.xyw;
	r4.xyw = (r5.zzz * c8.xyz) + r4.xyw;
	r4.xyz = (r4.zzz * c9.xyz) + r4.xyw;
	r5 = (v4.xyzx * c22.yyyx) + c22.xxxy;
	r1.w = dot(r5, c18);
	r3.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r6.x = dot(r5, c15);
	r6.y = dot(r5, c16);
	r6.z = dot(r5, c17);
	r5.xyz = r3.www * r6.xyz;
	r6 = s8_texture.sample(s8, r5.xy);
	r6.xyz = ((-r1.w >= 0.0) ? c22.xxx : r6.xyz);
	r7.xyz = r6.xyz * c28.xyz;
	r5.w = c11.y;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r1.w = clamp(r5.x, 0.0, 1.0);
	r3.w = -r1.w + c11.y;
	r1.w = (c109.y * r3.w) + r1.w;
	r8.x = c11.y;
	r5.yzw = c14.xyz + -v4.xyz;
	r3.w = dot(r5.yzw, r5.yzw);
	r8.z = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r8.y = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r3.w = clamp(dot(c13.xyz, r8.xyz), 0.0, 1.0);
	r4.w = clamp(mix(r1.w, r5.x, r3.w), 0.0, 1.0);
	r7.xyz = r4.www * r7.xyz;
	r5.yzw = r5.yzw * r8.yyy;
	r1.w = ((r8.y == 0.0) ? FLT_MAX : 1.0 / r8.y);
	r1.w = r1.w + -c13.w;
	r4.w = dot(r5.yzw, r0.xyz);
	r2.xyz = (r2.xyz * r2.www) + r5.yzw;
	r8.xyz = normalize(r2.xyz);
	r0.x = clamp(dot(r0.xyz, r8.xyz), 0.0, 1.0);
	r0.y = clamp(r4.w + c28.w, 0.0, 1.0);
	r4.w = clamp(r4.w, 0.0, 1.0);
	r0.z = ((r4.w == 0.0) ? FLT_MAX : rsqrt(abs(r4.w)));
	r0.z = ((r0.z == 0.0) ? FLT_MAX : 1.0 / r0.z);
	r0.y = r0.y * r3.w;
	r2.xyz = r7.xyz * r0.yyy;
	r5.z = c22.z;
	r0.y = r5.z * c13.w;
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r0.y = clamp(r0.y * r1.w, 0.0, 1.0);
	r2.xyz = (r2.xyz * r0.yyy) + r4.xyz;
	r0.y = r0.y * r3.w;
	r4.xyz = r0.yyy * c28.xyz;
	r4.xyz = r4.xyz * r6.xyz;
	r5.yzw = r2.xyz + v5.xyz;
	r0.y = dot(r2.xyz, c21.yzw);
	r2.xyz = r5.yzw + -c103.xxx;
	r2.xyz = clamp(r2.xyz * c103.yyy, float3(0.0), float3(1.0));
	r2.xyz = (r1.xyz * r2.xyz) + -r1.xyz;
	r1.xyz = (c101.xxx * r2.xyz) + r1.xyz;
	r2.xyz = (r1.xyz * r1.xyz) + -r1.xyz;
	r1.xyz = (c103.zzz * r2.xyz) + r1.xyz;
	r2 = s0_texture.sample(s0, v0.xy);
	r6.xyz = r2.www * c104.xyz;
	r1.xyz = r1.xyz * r6.xyz;
	r1.w = -r5.x + c11.y;
	r1.w = (c109.y * r1.w) + r5.x;
	r2.w = clamp(mix(r1.w, r5.x, r3.w), 0.0, 1.0);
	r4.xyz = r2.www * r4.xyz;
	r1.w = -r0.x + c11.y;
	r3.x = (c10.w * r1.w) + r0.x;
	r6 = s10_texture.sample(s10, v0.xy);
	r3.z = r6.w;
	r7 = s7_texture.sample(s7, r3.xz);
	r3 = s4_texture.sample(s4, r3.yz);
	r3.xzw = r0.zzz * r7.xyz;
	r3.xzw = r4.xyz * r3.xzw;
	r0.xzw = r0.www * r3.xzw;
	r1.w = mix(c10.x, c10.y, r6.y);
	r0.xzw = (r0.xzw * r1.www) + r1.xyz;
	r0.xzw = r3.yyy * r0.xzw;
	r1.xyz = r2.zxy * c11.xxx;
	r1.xyz = (r2.zxy * c11.xxx) + -r1.zxy;
	r3.xy = c0.xy;
	r1.w = (c12.w * r3.x) + r3.y;
	r1.w = fract(r1.w);
	r1.w = (r1.w * c0.z) + c0.w;
	r3.xy = float2(cos(r1.w), sin(r1.w));
	r1.xyz = r1.xyz * r3.yyy;
	r1.xyz = (r2.xyz * r3.xxx) + r1.xyz;
	r1.w = -r3.x + c11.y;
	r2.w = dot(c11.xxx, r2.xyz);
	r2.w = r2.w * c11.x;
	r1.xyz = (r2.www * r1.www) + r1.xyz;
	r1.w = abs(c12.w);
	r1.xyz = ((-r1.w >= 0.0) ? r2.xyz : r1.xyz);
	r2.xyz = r1.xyz + c11.www;
	r2.xyz = (r6.yyy * r2.xyz) + c11.yyy;
	r0.xzw = r0.xzw * r2.xyz;
	r2.xyz = r1.xyz * r1.xyz;
	r2.xyz = r2.xyz * r2.xyz;
	r1.w = dot(r1.xyz, c21.yzw);
	r3.xyz = r1.www * r2.xyz;
	r2.x = dot(r2.xyz, c21.yzw);
	r2.yzw = mix(r1.xyz, r1.www, -c101.yyy);
	r1.w = r2.x + c20.x;
	r2.x = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r1.w = ((r1.w >= 0.0) ? r2.x : c20.y);
	r3.xyz = (r3.xyz * r1.www) + -r1.xyz;
	r3.xyz = (c101.yyy * r3.xyz) + r1.xyz;
	r2.xyz = ((c101.y >= 0.0) ? r3.xyz : r2.yzw);
	r1.w = abs(c101.y);
	r2.xyz = ((-r1.w >= 0.0) ? r1.xyz : r2.xyz);
	r3.xy = r0.yy + -c2.xw;
	r0.y = r0.y + c20.z;
	r0.y = clamp(r0.y * c20.w, 0.0, 1.0);
	r3.zw = -c2.xw + c2.yz;
	r1.w = ((r3.z == 0.0) ? FLT_MAX : 1.0 / r3.z);
	r2.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r2.w = clamp(r2.w * r3.y, 0.0, 1.0);
	r1.w = clamp(r1.w * r3.x, 0.0, 1.0);
	r3.x = (r1.w * c19.x) + c19.y;
	r1.w = r1.w * r1.w;
	r1.w = r1.w * r3.x;
	r3.x = (r2.w * c19.x) + c19.y;
	r2.w = r2.w * r2.w;
	r2.w = r2.w * r3.x;
	r1.w = r1.w * r2.w;
	r3.xyz = mix(r1.xyz, r2.xyz, r1.www);
	r1.x = dot(r3.xyz, c21.yzw);
	r1.xyz = r1.xxx * c102.xyz;
	r2.yzw = c21.yzw;
	r1.w = dot(c102.xyz, r2.yzw);
	r2.x = r1.w + c20.x;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = ((r2.x >= 0.0) ? r1.w : c20.y);
	r1.xyz = (r1.xyz * r1.www) + -r3.xyz;
	r1.xyz = (c102.www * r1.xyz) + r3.xyz;
	r1.w = clamp(c107.w + v5.w, 0.0, 1.0);
	r1.xyz = (r1.xyz * r1.www) + -r3.xyz;
	r1.w = (r0.y * c19.x) + c19.y;
	r0.y = r0.y * r0.y;
	r0.y = r0.y * r1.w;
	r1.xyz = (r0.yyy * r1.xyz) + r3.xyz;
	r1.xyz = r6.zzz * r1.xyz;
	r0.xyz = (r1.xyz * r5.yzw) + r0.xzw;
	r0.xyz = r0.xyz * c1.xyz;
	oC0.xyz = r0.xyz * c30.xxx;
	oC0.w = c1.w;
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
	#undef c12
	#undef c13
	#undef c14
	#undef c15
	#undef c16
	#undef c17
	#undef c18
	#undef c28
	#undef c30
	#undef c101
	#undef c102
	#undef c103
	#undef c104
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

