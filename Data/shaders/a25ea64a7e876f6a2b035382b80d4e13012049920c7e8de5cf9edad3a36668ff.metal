#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[19];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord1)]];
	float4 v2 [[user(texcoord2)]];
	float4 v3 [[user(texcoord3)]];
	float4 v4 [[user(texcoord4)]];
};

struct source_main_Output
{
	float4 oC0 [[color(0)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	texture2d<float> s0_texture [[texture(0)]],
	sampler s0 [[sampler(0)]],
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
	texture2d<float> s7_texture [[texture(7)]],
	sampler s7 [[sampler(7)]],
	depth2d<float> s8_texture [[texture(8)]],
	sampler s8 [[sampler(8)]],
	texture2d<float> s13_texture [[texture(13)]],
	sampler s13 [[sampler(13)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(2.0, -1.0, 0.0, 1.0); (void) c0;
	const float4 c3 = float4(-0.400000005, 0.001953125, 0.0, 1.0); (void) c3;
	const float4 c4 = float4(-0.001953125, 0.001953125, 0.0, 1.0); (void) c4;
	const float4 c11 = float4(0.003021148, 0.021148037, 0.012084592, 0.06042296); (void) c11;
	const float4 c13 = float4(0.001953125, 0.000976562, 0.0, 1.0); (void) c13;
	const float4 c14 = float4(-0.000976562, 0.001953125, 0.0, 1.0); (void) c14;
	const float4 c15 = float4(0.099697888, 0.166163144, 1.399999979, 0.0); (void) c15;
	const float4 c16 = float4(-0.001953125, 0.000976562, 0.0, 1.0); (void) c16;
	const float4 c17 = float4(-0.001953125, -0.000976562, 0.0, 1.0); (void) c17;
	const float4 c18 = float4(-0.000976562, 0.000976562, 0.0, 1.0); (void) c18;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	#define c1 uniforms.uniforms_float4[0]
	#define c2 uniforms.uniforms_float4[1]
	#define c5 uniforms.uniforms_float4[2]
	#define c6 uniforms.uniforms_float4[3]
	#define c7 uniforms.uniforms_float4[4]
	#define c8 uniforms.uniforms_float4[5]
	#define c9 uniforms.uniforms_float4[6]
	#define c10 uniforms.uniforms_float4[7]
	#define c12 uniforms.uniforms_float4[8]
	#define c20 uniforms.uniforms_float4[9]
	#define c22 uniforms.uniforms_float4[10]
	#define c23 uniforms.uniforms_float4[11]
	#define c24 uniforms.uniforms_float4[12]
	#define c25 uniforms.uniforms_float4[13]
	#define c26 uniforms.uniforms_float4[14]
	#define c27 uniforms.uniforms_float4[15]
	#define c28 uniforms.uniforms_float4[16]
	#define c29 uniforms.uniforms_float4[17]
	#define c30 uniforms.uniforms_float4[18]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define oC0 output.oC0
	r0 = (v4.xyzx * c0.wwwz) + c0.zzzw;
	r1.x = dot(r0, c27);
	r1.y = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r2.x = dot(r0, c24);
	r2.y = dot(r0, c25);
	r2.z = dot(r0, c26);
	r0.xyz = r1.yyy * r2.xyz;
	r2 = r0.xyzx * c0.wwwz;
	r3 = r2 + c3.yyzw;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c4;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c4.yxzw;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c4.xxzw;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.y = dot(r3, c11.xxxx);
	r3 = r2 + c3.yzzw;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c4.xzzw;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c3.zyzw;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c4.zxzw;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c11.yyyy);
	r1.y = r1.z + r1.y;
	r3 = r2 + c13;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c13.yxzw;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c14;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c16;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c11.zzzz);
	r1.y = r1.z + r1.y;
	r3 = r2 + c17;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c17.yxzw;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c16.yxzw;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c14.yxzw;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c11.zzzz);
	r1.y = r1.z + r1.y;
	r3 = r2 + c13.yyzw;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c18;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c18.yxzw;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c14.xxzw;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c11.wwww);
	r1.y = r1.z + r1.y;
	r3 = r2 + c13.yzzw;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c14.xzzw;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c14.zxzw;
	r2 = r2 + c13.zyzw;
	r2 = float4(s8_texture.sample_compare(s8, (r2.xyz).xy, (r2.xyz).z));
	r3.w = r2.x;
	r2 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r2.x;
	r1.z = dot(r3, c15.xxxx);
	r1.y = r1.z + r1.y;
	r0.w = c0.w;
	r2 = float4(s8_texture.sample_compare(s8, (r0.xyz).xy, (r0.xyz).z));
	r0 = s7_texture.sample(s7, r0.xy);
	r0.xyz = r0.xyz * c28.xyz;
	r0.w = (r2.x * c15.y) + r1.y;
	r1.y = pow(abs(r0.w), c15.z);
	r0.w = clamp(r1.y, 0.0, 1.0);
	r1.z = -r0.w + c0.w;
	r0.w = (c2.y * r1.z) + r0.w;
	r2.x = c0.w;
	r3.xyz = c23.xyz + -v4.xyz;
	r1.z = dot(r3.xyz, r3.xyz);
	r2.z = ((r1.z == 0.0) ? FLT_MAX : 1.0 / r1.z);
	r2.y = ((r1.z == 0.0) ? FLT_MAX : rsqrt(abs(r1.z)));
	r1.z = clamp(dot(c22.xyz, r2.xyz), 0.0, 1.0);
	r2.x = clamp(mix(r0.w, r1.y, r1.z), 0.0, 1.0);
	r0.xyz = r0.xyz * r2.xxx;
	r2.xzw = r2.yyy * r3.xyz;
	r0.w = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r0.w = r0.w + -c22.w;
	r3.xyz = v3.xyz;
	r4.xyz = r3.yzx * v2.zxy;
	r3.xyz = (v2.yzx * r3.zxy) + -r4.xyz;
	r3.xyz = r3.xyz * v3.www;
	r4 = s3_texture.sample(s3, v1.xy);
	r4.xyz = (r4.xyz * c0.xxx) + c0.yyy;
	r3.xyz = r3.xyz * r4.yyy;
	r3.xyz = (r4.xxx * v3.xyz) + r3.xyz;
	r3.xyz = (r4.zzz * v2.xyz) + r3.xyz;
	r4.xyz = normalize(r3.xyz);
	r1.y = dot(r2.xzw, r4.xyz);
	r1.y = clamp(r1.y + c28.w, 0.0, 1.0);
	r1.y = r1.y * r1.z;
	r0.xyz = r0.xyz * r1.yyy;
	r2.x = c3.x;
	r1.y = r2.x * c22.w;
	r1.y = ((r1.y == 0.0) ? FLT_MAX : 1.0 / r1.y);
	r0.w = clamp(r0.w * r1.y, 0.0, 1.0);
	r0.xyz = r0.www * r0.xyz;
	r0.xyz = ((-r1.x >= 0.0) ? c0.zzz : r0.xyz);
	r1.x = ((r4.x >= 0.0) ? c0.z : c0.w);
	r1.y = ((r4.y >= 0.0) ? c0.z : c0.w);
	r1.z = ((r4.z >= 0.0) ? c0.z : c0.w);
	r2.xyz = r4.xyz * r4.xyz;
	r3.x = ((r4.x >= 0.0) ? c0.w : c0.z);
	r3.y = ((r4.y >= 0.0) ? c0.w : c0.z);
	r3.z = ((r4.z >= 0.0) ? c0.w : c0.z);
	r3.xyz = r2.xyz * r3.xyz;
	r1.xyz = r1.xyz * r2.xyz;
	r2.xyz = r1.xxx * c6.xyz;
	r2.xyz = (r3.xxx * c5.xyz) + r2.xyz;
	r2.xyz = (r3.yyy * c7.xyz) + r2.xyz;
	r1.xyw = (r1.yyy * c8.xyz) + r2.xyz;
	r1.xyw = (r3.zzz * c9.xyz) + r1.xyw;
	r1.xyz = (r1.zzz * c10.xyz) + r1.xyw;
	r0.xyz = r0.xyz + r1.xyz;
	r1 = s13_texture.sample(s13, v0.xy);
	r0.w = clamp(r1.y + c12.x, 0.0, 1.0);
	r1.yw = c0.yw;
	r1.xyz = r1.yyy + c1.xyz;
	r1.xyz = (r0.www * r1.xyz) + c0.www;
	r0.xyz = r0.xyz * r1.xyz;
	r2 = s0_texture.sample(s0, v0.xy);
	r0.xyz = r0.xyz * r2.xyz;
	r0.w = r2.w + c0.y;
	r0.w = (c20.w * r0.w) + r1.w;
	r0.w = r0.w * c1.w;
	oC0.xyz = r0.xyz * c30.xxx;
	r0.x = abs(c12.y);
	r0.y = c29.w * v4.w;
	oC0.w = ((-r0.x >= 0.0) ? r0.w : r0.y);
	#undef c1
	#undef c2
	#undef c5
	#undef c6
	#undef c7
	#undef c8
	#undef c9
	#undef c10
	#undef c12
	#undef c20
	#undef c22
	#undef c23
	#undef c24
	#undef c25
	#undef c26
	#undef c27
	#undef c28
	#undef c29
	#undef c30
	#undef v0
	#undef v1
	#undef v2
	#undef v3
	#undef v4
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

