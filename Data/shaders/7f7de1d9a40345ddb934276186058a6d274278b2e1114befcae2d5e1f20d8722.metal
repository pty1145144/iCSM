#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[11];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord4)]];
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
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c2 = float4(0.700000011, 0.349999993, -0.02, 25.0); (void) c2;
	const float4 c3 = float4(-2.0, 3.0, 0.666666684, -0.200000002); (void) c3;
	const float4 c11 = float4(1.0, -0.100000001, 0.0, 0.5); (void) c11;
	const float4 c12 = float4(1.5, -0.5, 2.5, 4.0); (void) c12;
	const float4 c13 = float4(0.203999995, 0.265999999, 0.342999993, 0.499000014); (void) c13;
	const float4 c15 = float4(0.015, 0.0, 0.0138165, 0.005840999); (void) c15;
	const float4 c16 = float4(0.0104505, 0.010761, 0.005435999, 0.01398); (void) c16;
	const float4 c17 = float4(-0.000437999, 0.014994, -0.006241499, 0.0136395); (void) c17;
	const float4 c18 = float4(-0.011060999, 0.010132499, -0.014133, 0.005024999); (void) c18;
	const float4 c19 = float4(-0.0149745, -0.000875999, -0.013451999, -0.0066375); (void) c19;
	const float4 c20 = float4(-0.009804, -0.011351999, -0.0046095, -0.014274); (void) c20;
	const float4 c21 = float4(0.001312499, -0.014943, 0.007027499, -0.0132525); (void) c21;
	const float4 c22 = float4(0.011633999, -0.009469499, 0.014402999, -0.004191); (void) c22;
	const float4 c23 = float4(0.062499999, -0.5, 0.0, 0.0); (void) c23;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
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
	#define c30 uniforms.uniforms_float4[10]
	#define v0 input.v0
	#define v1 input.v1
	#define oC0 output.oC0
	r0 = clamp(c15 + v0.zwzw, float4(0.0), float4(1.0));
	r1 = s0_texture.sample(s0, r0.xy);
	r0 = s0_texture.sample(s0, r0.zw);
	r0.x = r0.w + c11.y;
	r0.y = r1.w + c11.y;
	r0.x = ((r0.x >= 0.0) ? c11.x : c11.z);
	r0.y = ((r0.y >= 0.0) ? c11.x : c11.z);
	r0.x = r0.x + r0.y;
	r1 = clamp(c16 + v0.zwzw, float4(0.0), float4(1.0));
	r2 = s0_texture.sample(s0, r1.xy);
	r1 = s0_texture.sample(s0, r1.zw);
	r0.y = r1.w + c11.y;
	r0.z = r2.w + c11.y;
	r0.y = ((r0.y >= 0.0) ? c11.x : c11.z);
	r0.z = ((r0.z >= 0.0) ? c11.x : c11.z);
	r0.x = r0.z + r0.x;
	r0.x = r0.y + r0.x;
	r1 = clamp(c17 + v0.zwzw, float4(0.0), float4(1.0));
	r2 = s0_texture.sample(s0, r1.xy);
	r1 = s0_texture.sample(s0, r1.zw);
	r0.y = r1.w + c11.y;
	r0.z = r2.w + c11.y;
	r0.y = ((r0.y >= 0.0) ? c11.x : c11.z);
	r0.z = ((r0.z >= 0.0) ? c11.x : c11.z);
	r0.x = r0.z + r0.x;
	r0.x = r0.y + r0.x;
	r1 = clamp(c18 + v0.zwzw, float4(0.0), float4(1.0));
	r2 = s0_texture.sample(s0, r1.xy);
	r1 = s0_texture.sample(s0, r1.zw);
	r0.y = r1.w + c11.y;
	r0.z = r2.w + c11.y;
	r0.y = ((r0.y >= 0.0) ? c11.x : c11.z);
	r0.z = ((r0.z >= 0.0) ? c11.x : c11.z);
	r0.x = r0.z + r0.x;
	r0.x = r0.y + r0.x;
	r1 = clamp(c19 + v0.zwzw, float4(0.0), float4(1.0));
	r2 = s0_texture.sample(s0, r1.xy);
	r1 = s0_texture.sample(s0, r1.zw);
	r0.y = r1.w + c11.y;
	r0.z = r2.w + c11.y;
	r0.y = ((r0.y >= 0.0) ? c11.x : c11.z);
	r0.z = ((r0.z >= 0.0) ? c11.x : c11.z);
	r0.x = r0.z + r0.x;
	r0.x = r0.y + r0.x;
	r1 = clamp(c20 + v0.zwzw, float4(0.0), float4(1.0));
	r2 = s0_texture.sample(s0, r1.xy);
	r1 = s0_texture.sample(s0, r1.zw);
	r0.y = r1.w + c11.y;
	r0.z = r2.w + c11.y;
	r0.y = ((r0.y >= 0.0) ? c11.x : c11.z);
	r0.z = ((r0.z >= 0.0) ? c11.x : c11.z);
	r0.x = r0.z + r0.x;
	r0.x = r0.y + r0.x;
	r1 = clamp(c21 + v0.zwzw, float4(0.0), float4(1.0));
	r2 = s0_texture.sample(s0, r1.xy);
	r1 = s0_texture.sample(s0, r1.zw);
	r0.y = r1.w + c11.y;
	r0.z = r2.w + c11.y;
	r0.y = ((r0.y >= 0.0) ? c11.x : c11.z);
	r0.z = ((r0.z >= 0.0) ? c11.x : c11.z);
	r0.x = r0.z + r0.x;
	r0.x = r0.y + r0.x;
	r1 = clamp(c22 + v0.zwzw, float4(0.0), float4(1.0));
	r2 = s0_texture.sample(s0, r1.xy);
	r1 = s0_texture.sample(s0, r1.zw);
	r0.y = r1.w + c11.y;
	r0.z = r2.w + c11.y;
	r0.y = ((r0.y >= 0.0) ? c11.x : c11.z);
	r0.z = ((r0.z >= 0.0) ? c11.x : c11.z);
	r0.x = r0.z + r0.x;
	r0.x = r0.y + r0.x;
	r0.x = (r0.x * c23.x) + c23.y;
	r0.x = -abs(r0.x) + c13.w;
	r0.z = c11.z;
	r0.x = ((r0.x >= 0.0) ? c14.x : r0.z);
	r0.y = (v0.x * c11.w) + v0.y;
	r0.y = r0.y + c14.y;
	r0.z = r0.y * c3.z;
	r0.z = fract(abs(r0.z));
	r0.y = ((r0.y >= 0.0) ? r0.z : -r0.z);
	r0.y = (r0.y * c12.x) + c12.y;
	r0.y = abs(r0.y) + c3.w;
	r0.y = clamp(r0.y * c12.z, 0.0, 1.0);
	r0.z = (r0.y * c3.x) + c3.y;
	r0.y = r0.y * r0.y;
	r0.y = r0.y * r0.z;
	r0.y = r0.y * c14.x;
	r1.xyz = normalize(v1.xyz);
	r2.x = ((r1.x >= 0.0) ? c11.z : c11.x);
	r2.y = ((r1.y >= 0.0) ? c11.z : c11.x);
	r2.z = ((r1.z >= 0.0) ? c11.z : c11.x);
	r3.xyz = r1.xyz * r1.xyz;
	r1.x = ((r1.x >= 0.0) ? c11.x : c11.z);
	r1.y = ((r1.y >= 0.0) ? c11.x : c11.z);
	r1.z = ((r1.z >= 0.0) ? c11.x : c11.z);
	r1.xyz = r3.xyz * r1.xyz;
	r2.xyz = r2.xyz * r3.xyz;
	r3.xyz = r2.xxx * c5.xyz;
	r3.xyz = (r1.xxx * c4.xyz) + r3.xyz;
	r1.xyw = (r1.yyy * c6.xyz) + r3.xyz;
	r1.xyw = (r2.yyy * c7.xyz) + r1.xyw;
	r1.xyz = (r1.zzz * c8.xyz) + r1.xyw;
	r1.xyz = (r2.zzz * c9.xyz) + r1.xyz;
	r0.zw = clamp(v0.zw, float2(0.0), float2(1.0));
	r2 = s0_texture.sample(s0, r0.zw);
	r0.z = -r2.w + c11.x;
	r0.z = (c0.w * -r0.z) + c0.z;
	r0.w = r0.z + c2.z;
	r0.z = clamp(r0.z + -c0.y, 0.0, 1.0);
	r0.z = r0.z + c2.z;
	r3.xy = c11.ww * v0.xy;
	r3 = s4_texture.sample(s4, r3.xy);
	r4 = s1_texture.sample(s1, v0.xy);
	r1.w = r4.y * r4.x;
	r1.w = (r1.w * -r3.y) + c11.x;
	r0.zw = -r0.zw + r1.ww;
	r0.zw = clamp(r0.zw * c2.ww, float2(0.0), float2(1.0));
	r1.w = (r0.w * c3.x) + c3.y;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.w;
	r2.xyz = r2.xyz * c10.xyz;
	r1.w = r2.w + c11.y;
	r3.xy = c1.ww * v0.zw;
	r3 = s9_texture.sample(s9, r3.xy);
	r5.xyz = (r2.xyz * r3.xyz) + -r2.xyz;
	r6.xy = c2.xy;
	r4.xw = r6.xy * c0.xx;
	r2.xyz = (r4.xxx * r5.xyz) + r2.xyz;
	r5.xyz = mix(r3.xyz, r2.xyz, r0.www);
	r1.xyz = r1.xyz * r5.xyz;
	r0.w = mix(c11.x, r4.z, r4.w);
	r1.xyz = r0.www * r1.xyz;
	r2.xyz = r4.yyy * r1.xyz;
	r3.xyz = r2.xyz * c12.www;
	r5.xyz = max(r3.xyz, c13.xyz);
	r1.xyz = (r1.xyz * -r4.yyy) + r5.xyz;
	r2.xyz = (r0.yyy * r1.xyz) + r2.xyz;
	r0.y = (r0.z * c3.x) + c3.y;
	r0.z = r0.z * r0.z;
	r0.y = r0.z * r0.y;
	r2.w = ((r1.w >= 0.0) ? r0.y : c11.z);
	r5.w = c11.x;
	r1 = mix(r2, r5, r0.xxxx);
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
	#undef c30
	#undef v0
	#undef v1
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

