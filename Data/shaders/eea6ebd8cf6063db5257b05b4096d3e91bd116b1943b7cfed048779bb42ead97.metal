#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[15];
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
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c2 = float4(1.000000000e+00, -1.000000015e-01, 0.000000000e+00, 5.000000000e-01); (void) c2;
	const float4 c3 = float4(6.999999881e-01, 3.499999940e-01, -1.999999955e-02, 2.500000000e+01); (void) c3;
	const float4 c11 = float4(-2.000000000e+00, 3.000000000e+00, 6.666666865e-01, -2.000000030e-01); (void) c11;
	const float4 c12 = float4(1.500000000e+00, -5.000000000e-01, 2.500000000e+00, 4.000000000e+00); (void) c12;
	const float4 c13 = float4(2.039999962e-01, 2.660000026e-01, 3.429999948e-01, 4.990000129e-01); (void) c13;
	const float4 c15 = float4(1.499999966e-02, 0.000000000e+00, 1.381650008e-02, 5.841000006e-03); (void) c15;
	const float4 c16 = float4(1.045050006e-02, 1.076100022e-02, 5.435999949e-03, 1.398000028e-02); (void) c16;
	const float4 c17 = float4(-4.379999882e-04, 1.499400008e-02, -6.241499912e-03, 1.363950036e-02); (void) c17;
	const float4 c18 = float4(-1.106099971e-02, 1.013249997e-02, -1.413299982e-02, 5.024999846e-03); (void) c18;
	const float4 c19 = float4(-1.497450005e-02, -8.759999764e-04, -1.345199998e-02, -6.637500133e-03); (void) c19;
	const float4 c24 = float4(-9.804000147e-03, -1.135199983e-02, -4.609500058e-03, -1.427400019e-02); (void) c24;
	const float4 c25 = float4(1.312499982e-03, -1.494299993e-02, 7.027499843e-03, -1.325250044e-02); (void) c25;
	const float4 c26 = float4(1.163399965e-02, -9.469499812e-03, 1.440299954e-02, -4.191000015e-03); (void) c26;
	const float4 c27 = float4(6.250000000e-02, -5.000000000e-01, 0.000000000e+00, 0.000000000e+00); (void) c27;
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
	#define c20 uniforms.uniforms_float4[10]
	#define c21 uniforms.uniforms_float4[11]
	#define c22 uniforms.uniforms_float4[12]
	#define c23 uniforms.uniforms_float4[13]
	#define c30 uniforms.uniforms_float4[14]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define oC0 output.oC0
	r0 = clamp(c15 + v0.zwzw, float4(0.0), float4(1.0));
	r1 = s0_texture.sample(s0, r0.xy);
	r0 = s0_texture.sample(s0, r0.zw);
	r0.x = r0.w + c2.y;
	r0.y = r1.w + c2.y;
	r0.x = ((r0.x >= 0.0) ? c2.x : c2.z);
	r0.y = ((r0.y >= 0.0) ? c2.x : c2.z);
	r0.x = r0.x + r0.y;
	r1 = clamp(c16 + v0.zwzw, float4(0.0), float4(1.0));
	r2 = s0_texture.sample(s0, r1.xy);
	r1 = s0_texture.sample(s0, r1.zw);
	r0.y = r1.w + c2.y;
	r0.z = r2.w + c2.y;
	r0.y = ((r0.y >= 0.0) ? c2.x : c2.z);
	r0.z = ((r0.z >= 0.0) ? c2.x : c2.z);
	r0.x = r0.z + r0.x;
	r0.x = r0.y + r0.x;
	r1 = clamp(c17 + v0.zwzw, float4(0.0), float4(1.0));
	r2 = s0_texture.sample(s0, r1.xy);
	r1 = s0_texture.sample(s0, r1.zw);
	r0.y = r1.w + c2.y;
	r0.z = r2.w + c2.y;
	r0.y = ((r0.y >= 0.0) ? c2.x : c2.z);
	r0.z = ((r0.z >= 0.0) ? c2.x : c2.z);
	r0.x = r0.z + r0.x;
	r0.x = r0.y + r0.x;
	r1 = clamp(c18 + v0.zwzw, float4(0.0), float4(1.0));
	r2 = s0_texture.sample(s0, r1.xy);
	r1 = s0_texture.sample(s0, r1.zw);
	r0.y = r1.w + c2.y;
	r0.z = r2.w + c2.y;
	r0.y = ((r0.y >= 0.0) ? c2.x : c2.z);
	r0.z = ((r0.z >= 0.0) ? c2.x : c2.z);
	r0.x = r0.z + r0.x;
	r0.x = r0.y + r0.x;
	r1 = clamp(c19 + v0.zwzw, float4(0.0), float4(1.0));
	r2 = s0_texture.sample(s0, r1.xy);
	r1 = s0_texture.sample(s0, r1.zw);
	r0.y = r1.w + c2.y;
	r0.z = r2.w + c2.y;
	r0.y = ((r0.y >= 0.0) ? c2.x : c2.z);
	r0.z = ((r0.z >= 0.0) ? c2.x : c2.z);
	r0.x = r0.z + r0.x;
	r0.x = r0.y + r0.x;
	r1 = clamp(c24 + v0.zwzw, float4(0.0), float4(1.0));
	r2 = s0_texture.sample(s0, r1.xy);
	r1 = s0_texture.sample(s0, r1.zw);
	r0.y = r1.w + c2.y;
	r0.z = r2.w + c2.y;
	r0.y = ((r0.y >= 0.0) ? c2.x : c2.z);
	r0.z = ((r0.z >= 0.0) ? c2.x : c2.z);
	r0.x = r0.z + r0.x;
	r0.x = r0.y + r0.x;
	r1 = clamp(c25 + v0.zwzw, float4(0.0), float4(1.0));
	r2 = s0_texture.sample(s0, r1.xy);
	r1 = s0_texture.sample(s0, r1.zw);
	r0.y = r1.w + c2.y;
	r0.z = r2.w + c2.y;
	r0.y = ((r0.y >= 0.0) ? c2.x : c2.z);
	r0.z = ((r0.z >= 0.0) ? c2.x : c2.z);
	r0.x = r0.z + r0.x;
	r0.x = r0.y + r0.x;
	r1 = clamp(c26 + v0.zwzw, float4(0.0), float4(1.0));
	r2 = s0_texture.sample(s0, r1.xy);
	r1 = s0_texture.sample(s0, r1.zw);
	r0.y = r1.w + c2.y;
	r0.z = r2.w + c2.y;
	r0.y = ((r0.y >= 0.0) ? c2.x : c2.z);
	r0.z = ((r0.z >= 0.0) ? c2.x : c2.z);
	r0.x = r0.z + r0.x;
	r0.x = r0.y + r0.x;
	r0.x = (r0.x * c27.x) + c27.y;
	r0.x = -abs(r0.x) + c13.w;
	r0.z = c2.z;
	r0.x = ((r0.x >= 0.0) ? c14.x : r0.z);
	r0.y = (v0.x * c2.w) + v0.y;
	r0.y = r0.y + c14.y;
	r0.z = r0.y * c11.z;
	r0.z = fract(abs(r0.z));
	r0.y = ((r0.y >= 0.0) ? r0.z : -r0.z);
	r0.y = (r0.y * c12.x) + c12.y;
	r0.y = abs(r0.y) + c11.w;
	r0.y = clamp(r0.y * c12.z, 0.0, 1.0);
	r0.z = (r0.y * c11.x) + c11.y;
	r0.y = r0.y * r0.y;
	r0.y = r0.y * r0.z;
	r0.y = r0.y * c14.x;
	r1.xyz = normalize(v3.xyz);
	r2.x = ((r1.x >= 0.0) ? c2.z : c2.x);
	r2.y = ((r1.y >= 0.0) ? c2.z : c2.x);
	r2.z = ((r1.z >= 0.0) ? c2.z : c2.x);
	r3.xyz = r1.xyz * r1.xyz;
	r2.xyz = r2.xyz * r3.xyz;
	r4.xyz = r2.xxx * c5.xyz;
	r5.x = ((r1.x >= 0.0) ? c2.x : c2.z);
	r5.y = ((r1.y >= 0.0) ? c2.x : c2.z);
	r5.z = ((r1.z >= 0.0) ? c2.x : c2.z);
	r3.xyz = r3.xyz * r5.xyz;
	r4.xyz = (r3.xxx * c4.xyz) + r4.xyz;
	r3.xyw = (r3.yyy * c6.xyz) + r4.xyz;
	r2.xyw = (r2.yyy * c7.xyz) + r3.xyw;
	r2.xyw = (r3.zzz * c8.xyz) + r2.xyw;
	r2.xyz = (r2.zzz * c9.xyz) + r2.xyw;
	r3.xyz = c20.xyz * v1.xxx;
	r4.xyz = c21.xyz + -v2.xyz;
	r5.xyz = normalize(r4.xyz);
	r0.z = clamp(dot(r1.xyz, r5.xyz), 0.0, 1.0);
	r0.z = (r0.z * r0.z) + r0.z;
	r0.z = r0.z * c2.w;
	r2.xyz = (r3.xyz * r0.zzz) + r2.xyz;
	r3.xyz = c22.xyz * v1.yyy;
	r4.xyz = c23.xyz + -v2.xyz;
	r5.xyz = normalize(r4.xyz);
	r0.z = clamp(dot(r1.xyz, r5.xyz), 0.0, 1.0);
	r0.z = (r0.z * r0.z) + r0.z;
	r0.z = r0.z * c2.w;
	r1.xyz = (r3.xyz * r0.zzz) + r2.xyz;
	r0.zw = clamp(v0.zw, float2(0.0), float2(1.0));
	r2 = s0_texture.sample(s0, r0.zw);
	r0.z = -r2.w + c2.x;
	r0.z = (c0.w * -r0.z) + c0.z;
	r0.w = r0.z + c3.z;
	r0.z = clamp(r0.z + -c0.y, 0.0, 1.0);
	r0.z = r0.z + c3.z;
	r3.xy = c2.ww * v0.xy;
	r3 = s4_texture.sample(s4, r3.xy);
	r4 = s1_texture.sample(s1, v0.xy);
	r1.w = r4.y * r4.x;
	r1.w = (r1.w * -r3.y) + c2.x;
	r0.zw = -r0.zw + r1.ww;
	r0.zw = clamp(r0.zw * c3.ww, float2(0.0), float2(1.0));
	r1.w = (r0.w * c11.x) + c11.y;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.w;
	r2.xyz = r2.xyz * c10.xyz;
	r1.w = r2.w + c2.y;
	r3.xy = c1.ww * v0.zw;
	r3 = s9_texture.sample(s9, r3.xy);
	r5.xyz = (r2.xyz * r3.xyz) + -r2.xyz;
	r6.xy = c3.xy;
	r4.xw = r6.xy * c0.xx;
	r2.xyz = (r4.xxx * r5.xyz) + r2.xyz;
	r5.xyz = mix(r3.xyz, r2.xyz, r0.www);
	r1.xyz = r1.xyz * r5.xyz;
	r0.w = mix(c2.x, r4.z, r4.w);
	r1.xyz = r0.www * r1.xyz;
	r2.xyz = r4.yyy * r1.xyz;
	r3.xyz = r2.xyz * c12.www;
	r5.xyz = max(r3.xyz, c13.xyz);
	r1.xyz = (r1.xyz * -r4.yyy) + r5.xyz;
	r2.xyz = (r0.yyy * r1.xyz) + r2.xyz;
	r0.y = (r0.z * c11.x) + c11.y;
	r0.z = r0.z * r0.z;
	r0.y = r0.z * r0.y;
	r2.w = ((r1.w >= 0.0) ? r0.y : c2.z);
	r5.w = c2.x;
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
	#undef c20
	#undef c21
	#undef c22
	#undef c23
	#undef c30
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

