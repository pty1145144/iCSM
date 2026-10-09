#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[26];
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
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
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
	const float4 c11 = float4(5.0, 0.298999992, 0.587000012, 0.114); (void) c11;
	const float4 c20 = float4(2.0, -1.0, 0.0, 1.0); (void) c20;
	const float4 c21 = float4(-0.000001, 1000000.0, -0.300000011, -3.333333253); (void) c21;
	const float4 c22 = float4(-2.0, 3.0, 0.0, 0.0); (void) c22;
	const float4 c23 = float4(0.57735002, -0.400000005, 0.499999584, 0.5); (void) c23;
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
	#define c19 uniforms.uniforms_float4[17]
	#define c28 uniforms.uniforms_float4[18]
	#define c30 uniforms.uniforms_float4[19]
	#define c101 uniforms.uniforms_float4[20]
	#define c102 uniforms.uniforms_float4[21]
	#define c103 uniforms.uniforms_float4[22]
	#define c104 uniforms.uniforms_float4[23]
	#define c107 uniforms.uniforms_float4[24]
	#define c109 uniforms.uniforms_float4[25]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define oC0 output.oC0
	r0.x = c19.y + -v4.z;
	r0.x = r0.x + -c20.x;
	oC0.w = clamp(r0.x * c19.w, 0.0, 1.0);
	r0 = s1_texture.sample(s1, v0.xy);
	r0.xyz = (r0.xyz * c20.xxx) + c20.yyy;
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
	r1.w = dot(r2.xyz, r2.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r2.xyz = r1.www * r2.xyz;
	r3 = s3_texture.sample(s3, v0.xy);
	r1.w = (r3.y * c23.z) + c23.w;
	r1.w = fract(r1.w);
	r1.w = (r1.w * c0.z) + c0.w;
	r4.xy = float2(cos(r1.w), sin(r1.w));
	r1.xyz = r1.xyz * r4.xxx;
	r1.xyz = (r4.yyy * r2.xyz) + r1.xyz;
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.xyz = r1.www * r1.xyz;
	r2.xyz = r0.xyz * r1.xyz;
	r2.xyz = (r1.zxy * r0.yzx) + -r2.xyz;
	r4.xyz = r1.xyz * r2.xyz;
	r1.xyz = (r2.zxy * r1.yzx) + -r4.xyz;
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r2.xyz = c3.xyz + -v4.xyz;
	r2.w = dot(r2.xyz, r2.xyz);
	r2.w = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r4.xyz = r2.www * r2.xyz;
	r1.xyz = (r1.xyz * r1.www) + -r4.xyz;
	r5.z = c20.z;
	r1.w = ((-r3.y >= 0.0) ? r5.z : c10.w);
	r1.xyz = (r1.www * r1.xyz) + r4.xyz;
	r4.y = clamp(dot(r4.xyz, r0.xyz), 0.0, 1.0);
	r3.y = dot(r0.xyz, r1.xyz);
	r3.y = r3.y + r3.y;
	r4.w = dot(r0.xyz, r0.xyz);
	r1.xyz = r1.xyz * r4.www;
	r1.xyz = (r3.yyy * r0.xyz) + -r1.xyz;
	r5 = s6_texture.sample(s6, r1.xyz);
	r1.xyz = r5.xyz * c30.zzz;
	r6.xyz = r1.xyz * r1.xyz;
	r6.xyz = r6.xyz * r6.xyz;
	r3.y = dot(r6.xyz, c11.yzw);
	r4.w = r3.y + c21.x;
	r3.y = ((r3.y == 0.0) ? FLT_MAX : 1.0 / r3.y);
	r3.y = ((r4.w >= 0.0) ? r3.y : c21.y);
	r4.w = dot(r1.xyz, c11.yzw);
	r6.xyz = r4.www * r6.xyz;
	r5.xyz = (c30.zzz * -r5.xyz) + r4.www;
	r5.xyz = (-c103.www * r5.xyz) + r1.xyz;
	r6.xyz = (r6.xyz * r3.yyy) + -r1.xyz;
	r6.xyz = (c103.www * r6.xyz) + r1.xyz;
	r5.xyz = ((c103.w >= 0.0) ? r6.xyz : r5.xyz);
	r3.y = abs(c103.w);
	r1.xyz = ((-r3.y >= 0.0) ? r1.xyz : r5.xyz);
	r5.x = ((r0.x >= 0.0) ? c20.z : c20.w);
	r5.y = ((r0.y >= 0.0) ? c20.z : c20.w);
	r5.z = ((r0.z >= 0.0) ? c20.z : c20.w);
	r6.xyz = r0.xyz * r0.xyz;
	r5.xyz = r5.xyz * r6.xyz;
	r7.xyz = r5.xxx * c5.xyz;
	r8.x = ((r0.x >= 0.0) ? c20.w : c20.z);
	r8.y = ((r0.y >= 0.0) ? c20.w : c20.z);
	r8.z = ((r0.z >= 0.0) ? c20.w : c20.z);
	r6.xyz = r6.xyz * r8.xyz;
	r7.xyz = (r6.xxx * c4.xyz) + r7.xyz;
	r6.xyw = (r6.yyy * c6.xyz) + r7.xyz;
	r5.xyw = (r5.yyy * c7.xyz) + r6.xyw;
	r5.xyw = (r6.zzz * c8.xyz) + r5.xyw;
	r5.xyz = (r5.zzz * c9.xyz) + r5.xyw;
	r6 = (v4.xyzx * c20.wwwz) + c20.zzzw;
	r3.y = dot(r6, c18);
	r4.w = ((r3.y == 0.0) ? FLT_MAX : 1.0 / r3.y);
	r7.x = dot(r6, c15);
	r7.y = dot(r6, c16);
	r7.z = dot(r6, c17);
	r6.xyz = r4.www * r7.xyz;
	r7 = s8_texture.sample(s8, r6.xy);
	r7.xyz = ((-r3.y >= 0.0) ? c20.zzz : r7.xyz);
	r8.xyz = r7.xyz * c28.xyz;
	r6.w = c20.w;
	r6 = float4(s11_texture.sample_compare(s11, (r6.xyz).xy, (r6.xyz).z));
	r3.y = clamp(r6.x, 0.0, 1.0);
	r4.w = -r3.y + c20.w;
	r3.y = (c109.y * r4.w) + r3.y;
	r9.x = c20.w;
	r6.yzw = c14.xyz + -v4.xyz;
	r4.w = dot(r6.yzw, r6.yzw);
	r9.z = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r9.y = ((r4.w == 0.0) ? FLT_MAX : rsqrt(abs(r4.w)));
	r4.w = clamp(dot(c13.xyz, r9.xyz), 0.0, 1.0);
	r5.w = clamp(mix(r3.y, r6.x, r4.w), 0.0, 1.0);
	r8.xyz = r5.www * r8.xyz;
	r6.yzw = r6.yzw * r9.yyy;
	r3.y = ((r9.y == 0.0) ? FLT_MAX : 1.0 / r9.y);
	r3.y = r3.y + -c13.w;
	r5.w = dot(r6.yzw, r0.xyz);
	r2.xyz = (r2.xyz * r2.www) + r6.yzw;
	r9.xyz = normalize(r2.xyz);
	r0.x = clamp(dot(r0.xyz, r9.xyz), 0.0, 1.0);
	r4.x = mix(r0.x, c20.w, r1.w);
	r0.x = clamp(r5.w + c28.w, 0.0, 1.0);
	r5.w = clamp(r5.w, 0.0, 1.0);
	r0.y = ((r5.w == 0.0) ? FLT_MAX : rsqrt(abs(r5.w)));
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r0.x = r0.x * r4.w;
	r2.xyz = r8.xyz * r0.xxx;
	r6.y = c23.y;
	r0.x = r6.y * c13.w;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = clamp(r0.x * r3.y, 0.0, 1.0);
	r2.xyz = (r2.xyz * r0.xxx) + r5.xyz;
	r0.x = r0.x * r4.w;
	r5.xyz = r0.xxx * c28.xyz;
	r5.xyz = r5.xyz * r7.xyz;
	r6.yzw = r2.xyz + v5.xyz;
	r0.x = dot(r2.xyz, c11.yzw);
	r2.xyz = r6.yzw + -c103.xxx;
	r2.xyz = clamp(r2.xyz * c103.yyy, float3(0.0), float3(1.0));
	r2.xyz = (r1.xyz * r2.xyz) + -r1.xyz;
	r0.z = r3.z * c101.x;
	r1.xyz = (r0.zzz * r2.xyz) + r1.xyz;
	r2.xyz = (r1.xyz * r1.xyz) + -r1.xyz;
	r1.xyz = (c103.zzz * r2.xyz) + r1.xyz;
	r2 = s0_texture.sample(s0, v0.xy);
	r7.xyz = r2.www * c104.xyz;
	r1.xyz = r1.xyz * r7.xyz;
	r0.z = -r6.x + c20.w;
	r0.z = (c109.y * r0.z) + r6.x;
	r1.w = clamp(mix(r0.z, r6.x, r4.w), 0.0, 1.0);
	r5.xyz = r1.www * r5.xyz;
	r0.z = r4.y * r4.y;
	r0.z = r0.z * r0.z;
	r1.w = -r3.w + c20.w;
	r0.z = r0.z * r1.w;
	r3.yzw = r0.zzz * v5.xyz;
	r3.yzw = r3.yzw * c11.xxx;
	r3.yzw = ((-r1.w >= 0.0) ? c20.zzz : r3.yzw);
	r7 = s10_texture.sample(s10, v0.xy);
	r4.z = r7.w;
	r8 = s7_texture.sample(s7, r4.xz);
	r4 = s4_texture.sample(s4, r4.yz);
	r0.z = mix(r4.y, c20.w, r1.w);
	r4.xyz = r0.yyy * r8.xyz;
	r3.yzw = (r4.xyz * r5.xyz) + r3.yzw;
	r3.yzw = r0.www * r3.yzw;
	r0.y = mix(c10.x, c10.y, r7.y);
	r1.xyz = (r3.yzw * r0.yyy) + r1.xyz;
	r0.yzw = r0.zzz * r1.xyz;
	r1.x = r3.x * c12.w;
	r2.w = r3.x;
	r1.x = (r1.x * c0.x) + c0.y;
	r1.x = fract(r1.x);
	r1.x = (r1.x * c0.z) + c0.w;
	r3.xy = float2(cos(r1.x), sin(r1.x));
	r1.xyz = r2.zxy * c23.xxx;
	r1.xyz = (r2.zxy * c23.xxx) + -r1.zxy;
	r1.xyz = r3.yyy * r1.xyz;
	r1.xyz = (r2.xyz * r3.xxx) + r1.xyz;
	r1.w = -r3.x + c20.w;
	r3.x = dot(c23.xxx, r2.xyz);
	r3.x = r3.x * c23.x;
	r1.xyz = (r3.xxx * r1.www) + r1.xyz;
	r3.x = abs(c12.w);
	r1.w = c20.w;
	r1 = ((-r3.x >= 0.0) ? r2 : r1);
	r2.xyz = r1.xyz + c20.yyy;
	r2.xyz = (r7.yyy * r2.xyz) + c20.www;
	r0.yzw = r0.yzw * r2.xyz;
	r2.xyz = r1.xyz * r1.xyz;
	r2.xyz = r2.xyz * r2.xyz;
	r2.w = dot(r1.xyz, c11.yzw);
	r3.xyz = r2.www * r2.xyz;
	r2.x = dot(r2.xyz, c11.yzw);
	r4.xyz = mix(r1.xyz, r2.www, -c101.yyy);
	r2.y = r2.x + c21.x;
	r2.x = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r2.x = ((r2.y >= 0.0) ? r2.x : c21.y);
	r2.xyz = (r3.xyz * r2.xxx) + -r1.xyz;
	r2.xyz = (c101.yyy * r2.xyz) + r1.xyz;
	r2.xyz = ((c101.y >= 0.0) ? r2.xyz : r4.xyz);
	r2.w = abs(c101.y);
	r2.xyz = ((-r2.w >= 0.0) ? r1.xyz : r2.xyz);
	r3.xy = r0.xx + -c2.xw;
	r0.x = r0.x + c21.z;
	r0.x = clamp(r0.x * c21.w, 0.0, 1.0);
	r3.zw = -c2.xw + c2.yz;
	r2.w = ((r3.z == 0.0) ? FLT_MAX : 1.0 / r3.z);
	r3.z = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r3.y = clamp(r3.z * r3.y, 0.0, 1.0);
	r2.w = clamp(r2.w * r3.x, 0.0, 1.0);
	r3.x = (r2.w * c22.x) + c22.y;
	r2.w = r2.w * r2.w;
	r2.w = r2.w * r3.x;
	r3.x = (r3.y * c22.x) + c22.y;
	r3.y = r3.y * r3.y;
	r3.x = r3.y * r3.x;
	r2.w = r2.w * r3.x;
	r1.w = r1.w * r2.w;
	r3.xyz = mix(r1.xyz, r2.xyz, r1.www);
	r1.x = dot(r3.xyz, c11.yzw);
	r1.xyz = r1.xxx * c102.xyz;
	r2.yzw = c11.yzw;
	r1.w = dot(c102.xyz, r2.yzw);
	r2.x = r1.w + c21.x;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = ((r2.x >= 0.0) ? r1.w : c21.y);
	r1.xyz = (r1.xyz * r1.www) + -r3.xyz;
	r1.xyz = (c102.www * r1.xyz) + r3.xyz;
	r1.w = clamp(c107.w + v5.w, 0.0, 1.0);
	r1.xyz = (r1.xyz * r1.www) + -r3.xyz;
	r1.w = (r0.x * c22.x) + c22.y;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r1.w;
	r1.xyz = (r0.xxx * r1.xyz) + r3.xyz;
	r1.xyz = r7.zzz * r1.xyz;
	r0.xyz = (r1.xyz * r6.yzw) + r0.yzw;
	r0.xyz = r0.xyz * c1.xyz;
	oC0.xyz = r0.xyz * c30.xxx;
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
	#undef c19
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

