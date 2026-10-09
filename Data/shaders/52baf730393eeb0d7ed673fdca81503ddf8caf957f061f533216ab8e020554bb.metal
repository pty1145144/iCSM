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
	texture2d<float> s9_texture [[texture(9)]],
	sampler s9 [[sampler(9)]],
	texture2d<float> s15_texture [[texture(15)]],
	sampler s15 [[sampler(15)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c2 = float4(1.041666626, -0.020833333, 0.700000011, 0.349999993); (void) c2;
	const float4 c3 = float4(1.0, -0.100000001, 0.0, 0.5); (void) c3;
	const float4 c11 = float4(-0.02, 25.0, -2.0, 3.0); (void) c11;
	const float4 c12 = float4(0.666666684, 1.5, -0.5, -0.200000002); (void) c12;
	const float4 c13 = float4(2.5, 4.0, 0.062499999, -0.5); (void) c13;
	const float4 c15 = float4(0.203999995, 0.265999999, 0.342999993, 0.499000014); (void) c15;
	const float4 c16 = float4(0.015, 0.0, 0.0138165, 0.005840999); (void) c16;
	const float4 c17 = float4(0.0104505, 0.010761, 0.005435999, 0.01398); (void) c17;
	const float4 c18 = float4(-0.000437999, 0.014994, -0.006241499, 0.0136395); (void) c18;
	const float4 c19 = float4(-0.011060999, 0.010132499, -0.014133, 0.005024999); (void) c19;
	const float4 c26 = float4(-0.0149745, -0.000875999, -0.013451999, -0.0066375); (void) c26;
	const float4 c27 = float4(-0.009804, -0.011351999, -0.0046095, -0.014274); (void) c27;
	const float4 c28 = float4(0.001312499, -0.014943, 0.007027499, -0.0132525); (void) c28;
	const float4 c29 = float4(0.011633999, -0.009469499, 0.014402999, -0.004191); (void) c29;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c4 uniforms.uniforms_float4[2]
	#define c5 uniforms.uniforms_float4[3]
	#define c6 uniforms.uniforms_float4[4]
	#define c7 uniforms.uniforms_float4[5]
	#define c8 uniforms.uniforms_float4[6]
	#define c9 uniforms.uniforms_float4[7]
	#define c10 uniforms.uniforms_float4[8]
	#define c14 uniforms.uniforms_float4[9]
	#define c20 uniforms.uniforms_float4[10]
	#define c21 uniforms.uniforms_float4[11]
	#define c22 uniforms.uniforms_float4[12]
	#define c23 uniforms.uniforms_float4[13]
	#define c24 uniforms.uniforms_float4[14]
	#define c25 uniforms.uniforms_float4[15]
	#define c30 uniforms.uniforms_float4[16]
	#define c68 uniforms.uniforms_float4[17]
	#define c71 uniforms.uniforms_float4[18]
	#define c73 uniforms.uniforms_float4[19]
	#define c74 uniforms.uniforms_float4[20]
	#define c77 uniforms.uniforms_float4[21]
	#define c78 uniforms.uniforms_float4[22]
	#define c86 uniforms.uniforms_float4[23]
	#define c87 uniforms.uniforms_float4[24]
	#define c89 uniforms.uniforms_float4[25]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define oC0 output.oC0
	r0 = clamp(c16 + v0.zwzw, float4(0.0), float4(1.0));
	r1 = s0_texture.sample(s0, r0.xy);
	r0 = s0_texture.sample(s0, r0.zw);
	r0.x = r0.w + c3.y;
	r0.y = r1.w + c3.y;
	r0.x = ((r0.x >= 0.0) ? c3.x : c3.z);
	r0.y = ((r0.y >= 0.0) ? c3.x : c3.z);
	r0.x = r0.x + r0.y;
	r1 = clamp(c17 + v0.zwzw, float4(0.0), float4(1.0));
	r2 = s0_texture.sample(s0, r1.xy);
	r1 = s0_texture.sample(s0, r1.zw);
	r0.y = r1.w + c3.y;
	r0.z = r2.w + c3.y;
	r0.y = ((r0.y >= 0.0) ? c3.x : c3.z);
	r0.z = ((r0.z >= 0.0) ? c3.x : c3.z);
	r0.x = r0.z + r0.x;
	r0.x = r0.y + r0.x;
	r1 = clamp(c18 + v0.zwzw, float4(0.0), float4(1.0));
	r2 = s0_texture.sample(s0, r1.xy);
	r1 = s0_texture.sample(s0, r1.zw);
	r0.y = r1.w + c3.y;
	r0.z = r2.w + c3.y;
	r0.y = ((r0.y >= 0.0) ? c3.x : c3.z);
	r0.z = ((r0.z >= 0.0) ? c3.x : c3.z);
	r0.x = r0.z + r0.x;
	r0.x = r0.y + r0.x;
	r1 = clamp(c19 + v0.zwzw, float4(0.0), float4(1.0));
	r2 = s0_texture.sample(s0, r1.xy);
	r1 = s0_texture.sample(s0, r1.zw);
	r0.y = r1.w + c3.y;
	r0.z = r2.w + c3.y;
	r0.y = ((r0.y >= 0.0) ? c3.x : c3.z);
	r0.z = ((r0.z >= 0.0) ? c3.x : c3.z);
	r0.x = r0.z + r0.x;
	r0.x = r0.y + r0.x;
	r1 = clamp(c26 + v0.zwzw, float4(0.0), float4(1.0));
	r2 = s0_texture.sample(s0, r1.xy);
	r1 = s0_texture.sample(s0, r1.zw);
	r0.y = r1.w + c3.y;
	r0.z = r2.w + c3.y;
	r0.y = ((r0.y >= 0.0) ? c3.x : c3.z);
	r0.z = ((r0.z >= 0.0) ? c3.x : c3.z);
	r0.x = r0.z + r0.x;
	r0.x = r0.y + r0.x;
	r1 = clamp(c27 + v0.zwzw, float4(0.0), float4(1.0));
	r2 = s0_texture.sample(s0, r1.xy);
	r1 = s0_texture.sample(s0, r1.zw);
	r0.y = r1.w + c3.y;
	r0.z = r2.w + c3.y;
	r0.y = ((r0.y >= 0.0) ? c3.x : c3.z);
	r0.z = ((r0.z >= 0.0) ? c3.x : c3.z);
	r0.x = r0.z + r0.x;
	r0.x = r0.y + r0.x;
	r1 = clamp(c28 + v0.zwzw, float4(0.0), float4(1.0));
	r2 = s0_texture.sample(s0, r1.xy);
	r1 = s0_texture.sample(s0, r1.zw);
	r0.y = r1.w + c3.y;
	r0.z = r2.w + c3.y;
	r0.y = ((r0.y >= 0.0) ? c3.x : c3.z);
	r0.z = ((r0.z >= 0.0) ? c3.x : c3.z);
	r0.x = r0.z + r0.x;
	r0.x = r0.y + r0.x;
	r1 = clamp(c29 + v0.zwzw, float4(0.0), float4(1.0));
	r2 = s0_texture.sample(s0, r1.xy);
	r1 = s0_texture.sample(s0, r1.zw);
	r0.y = r1.w + c3.y;
	r0.z = r2.w + c3.y;
	r0.y = ((r0.y >= 0.0) ? c3.x : c3.z);
	r0.z = ((r0.z >= 0.0) ? c3.x : c3.z);
	r0.x = r0.z + r0.x;
	r0.x = r0.y + r0.x;
	r0.x = (r0.x * c13.z) + c13.w;
	r0.x = -abs(r0.x) + c15.w;
	r0.z = c3.z;
	r0.x = ((r0.x >= 0.0) ? c14.x : r0.z);
	r1 = (v2.xyzx * c3.xxxz) + c3.zzzx;
	r2.x = dot(r1, c73);
	r2.y = dot(r1, c74);
	r0.yz = (r2.xy * c2.xx) + c2.yy;
	r2.zw = clamp(r0.yz, float2(0.0), float2(1.0));
	r0.yz = -r0.yz + r2.zw;
	r0.y = dot(r0.yz, c3.xx) + c3.z;
	r0.z = dot(r1, c77);
	r3.x = clamp(((-abs(r0.y) >= 0.0) ? r2.x : r0.z), 0.0, 1.0);
	r0.z = dot(r1, c78);
	r1.z = dot(r1, c71);
	r3.y = clamp(((-abs(r0.y) >= 0.0) ? r2.y : r0.z), 0.0, 1.0);
	r2.xy = c86.xy;
	r0.yz = ((-abs(r0.y) >= 0.0) ? r2.xy : c87.xy);
	r1.xy = (r3.xy * c3.ww) + r0.yz;
	r1.w = c3.z;
	r1 = s15_texture.sample(s15, r1.xy, level(r1.w));
	r0.yzw = -c89.xyz + v2.xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.y = clamp((r0.y * c68.y) + c68.x, 0.0, 1.0);
	r2.x = mix(r1.x, c3.x, r0.y);
	r1.xyz = normalize(v3.xyz);
	r0.y = ((r1.x >= 0.0) ? c3.z : c3.x);
	r0.z = ((r1.y >= 0.0) ? c3.z : c3.x);
	r0.w = ((r1.z >= 0.0) ? c3.z : c3.x);
	r2.yzw = r1.xyz * r1.xyz;
	r0.yzw = r0.yzw * r2.yzw;
	r3.xyz = r0.yyy * c5.xyz;
	r4.x = ((r1.x >= 0.0) ? c3.x : c3.z);
	r4.y = ((r1.y >= 0.0) ? c3.x : c3.z);
	r4.z = ((r1.z >= 0.0) ? c3.x : c3.z);
	r2.yzw = r2.yzw * r4.xyz;
	r3.xyz = (r2.yyy * c4.xyz) + r3.xyz;
	r3.xyz = (r2.zzz * c6.xyz) + r3.xyz;
	r3.xyz = (r0.zzz * c7.xyz) + r3.xyz;
	r2.yzw = (r2.www * c8.xyz) + r3.xyz;
	r0.yzw = (r0.www * c9.xyz) + r2.yzw;
	r2.yzw = c21.xyz + -v2.xyz;
	r3.xyz = normalize(r2.yzw);
	r1.w = clamp(dot(r1.xyz, r3.xyz), 0.0, 1.0);
	r1.w = (r1.w * r1.w) + r1.w;
	r1.w = r1.w * c3.w;
	r2.yzw = c20.xyz * v1.xxx;
	r2.yzw = r1.www * r2.yzw;
	r0.yzw = (r2.yzw * r2.xxx) + r0.yzw;
	r2.xyz = c22.xyz * v1.yyy;
	r3.xyz = c23.xyz + -v2.xyz;
	r4.xyz = normalize(r3.xyz);
	r1.w = clamp(dot(r1.xyz, r4.xyz), 0.0, 1.0);
	r1.w = (r1.w * r1.w) + r1.w;
	r1.w = r1.w * c3.w;
	r0.yzw = (r2.xyz * r1.www) + r0.yzw;
	r2.xyz = c24.xyz * v1.zzz;
	r3.xyz = c25.xyz + -v2.xyz;
	r4.xyz = normalize(r3.xyz);
	r1.x = clamp(dot(r1.xyz, r4.xyz), 0.0, 1.0);
	r1.x = (r1.x * r1.x) + r1.x;
	r1.x = r1.x * c3.w;
	r0.yzw = (r2.xyz * r1.xxx) + r0.yzw;
	r1.xy = clamp(v0.zw, float2(0.0), float2(1.0));
	r1 = s0_texture.sample(s0, r1.xy);
	r2.x = -r1.w + c3.x;
	r2.x = (c0.w * -r2.x) + c0.z;
	r2.y = r2.x + c11.x;
	r2.x = clamp(r2.x + -c0.y, 0.0, 1.0);
	r2.x = r2.x + c11.x;
	r2.zw = c3.ww * v0.xy;
	r3 = s4_texture.sample(s4, r2.zw);
	r4 = s1_texture.sample(s1, v0.xy);
	r2.z = r4.y * r4.x;
	r2.z = (r2.z * -r3.y) + c3.x;
	r2.xy = -r2.xy + r2.zz;
	r2.xy = clamp(r2.xy * c11.yy, float2(0.0), float2(1.0));
	r2.z = (r2.y * c11.z) + c11.w;
	r2.y = r2.y * r2.y;
	r2.y = r2.y * r2.z;
	r1.xyz = r1.xyz * c10.xyz;
	r1.w = r1.w + c3.y;
	r2.zw = c1.ww * v0.zw;
	r3 = s9_texture.sample(s9, r2.zw);
	r5.xyz = (r1.xyz * r3.xyz) + -r1.xyz;
	r2.zw = c2.zw;
	r2.zw = r2.zw * c0.xx;
	r1.xyz = (r2.zzz * r5.xyz) + r1.xyz;
	r5.xyz = mix(r3.xyz, r1.xyz, r2.yyy);
	r0.yzw = r0.yzw * r5.xyz;
	r1.x = mix(c3.x, r4.z, r2.w);
	r0.yzw = r0.yzw * r1.xxx;
	r1.xyz = r4.yyy * r0.yzw;
	r2.yzw = r1.xyz * c13.yyy;
	r3.xyz = max(r2.yzw, c15.xyz);
	r0.yzw = (r0.yzw * -r4.yyy) + r3.xyz;
	r2.y = (v0.x * c3.w) + v0.y;
	r2.y = r2.y + c14.y;
	r2.z = r2.y * c12.x;
	r2.z = fract(abs(r2.z));
	r2.y = ((r2.y >= 0.0) ? r2.z : -r2.z);
	r2.y = (r2.y * c12.y) + c12.z;
	r2.y = abs(r2.y) + c12.w;
	r2.y = clamp(r2.y * c13.x, 0.0, 1.0);
	r2.z = (r2.y * c11.z) + c11.w;
	r2.y = r2.y * r2.y;
	r2.y = r2.y * r2.z;
	r2.y = r2.y * c14.x;
	r4.xyz = (r2.yyy * r0.yzw) + r1.xyz;
	r0.y = (r2.x * c11.z) + c11.w;
	r0.z = r2.x * r2.x;
	r0.y = r0.z * r0.y;
	r4.w = ((r1.w >= 0.0) ? r0.y : c3.z);
	r3.w = c3.x;
	r1 = mix(r4, r3, r0.xxxx);
	oC0.xyz = r1.xyz * c30.xxx;
	oC0.w = r1.w;
	#undef c0
	#undef c1
	#undef c4
	#undef c5
	#undef c6
	#undef c7
	#undef c8
	#undef c9
	#undef c10
	#undef c14
	#undef c20
	#undef c21
	#undef c22
	#undef c23
	#undef c24
	#undef c25
	#undef c30
	#undef c68
	#undef c71
	#undef c73
	#undef c74
	#undef c77
	#undef c78
	#undef c86
	#undef c87
	#undef c89
	#undef v0
	#undef v1
	#undef v2
	#undef v3
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

