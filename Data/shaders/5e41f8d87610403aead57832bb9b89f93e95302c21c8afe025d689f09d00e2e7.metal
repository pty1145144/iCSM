#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[6];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord1)]];
	float4 v2 [[user(texcoord2)]];
	float4 v3 [[user(texcoord3)]];
	float4 v4 [[user(texcoord5)]];
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
	texturecube<float> s2_texture [[texture(2)]],
	sampler s2 [[sampler(2)]],
	depth2d<float> s7_texture [[texture(7)]],
	sampler s7 [[sampler(7)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(-0.001953125, 0.001953125, 0.0, 1.0); (void) c0;
	const float4 c3 = float4(0.003021148, 0.021148037, 0.012084592, 0.06042296); (void) c3;
	const float4 c4 = float4(-0.400000005, 1.0, 0.0, 0.001953125); (void) c4;
	const float4 c5 = float4(-0.000976562, 0.001953125, 0.0, 1.0); (void) c5;
	const float4 c6 = float4(0.001953125, 0.000976562, 0.0, 1.0); (void) c6;
	const float4 c7 = float4(0.099697888, 0.166163144, 1.399999979, 0.0); (void) c7;
	const float4 c8 = float4(2.0, -1.0, 0.0, 0.0); (void) c8;
	const float4 c9 = float4(-0.001953125, 0.000976562, 0.0, 1.0); (void) c9;
	const float4 c10 = float4(-0.001953125, -0.000976562, 0.0, 1.0); (void) c10;
	const float4 c11 = float4(-0.000976562, 0.000976562, 0.0, 1.0); (void) c11;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	#define c1 uniforms.uniforms_float4[0]
	#define c2 uniforms.uniforms_float4[1]
	#define c13 uniforms.uniforms_float4[2]
	#define c14 uniforms.uniforms_float4[3]
	#define c28 uniforms.uniforms_float4[4]
	#define c30 uniforms.uniforms_float4[5]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define oC0 output.oC0
	r0.x = ((v0.w == 0.0) ? FLT_MAX : 1.0 / v0.w);
	r0.xyz = r0.xxx * v0.xyz;
	r1 = r0.xyzx * c4.yyyz;
	r2 = r1 + c4.wwzy;
	r2 = float4(s7_texture.sample_compare(s7, (r2.xyz).xy, (r2.xyz).z));
	r3 = r1 + c0;
	r3 = float4(s7_texture.sample_compare(s7, (r3.xyz).xy, (r3.xyz).z));
	r2.y = r3.x;
	r3 = r1 + c0.yxzw;
	r3 = float4(s7_texture.sample_compare(s7, (r3.xyz).xy, (r3.xyz).z));
	r2.z = r3.x;
	r3 = r1 + c0.xxzw;
	r3 = float4(s7_texture.sample_compare(s7, (r3.xyz).xy, (r3.xyz).z));
	r2.w = r3.x;
	r2.x = dot(r2, c3.xxxx);
	r3 = r1 + c4.wzzy;
	r3 = float4(s7_texture.sample_compare(s7, (r3.xyz).xy, (r3.xyz).z));
	r4 = r1 + c0.xzzw;
	r4 = float4(s7_texture.sample_compare(s7, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r1 + c4.zwzy;
	r4 = float4(s7_texture.sample_compare(s7, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r1 + c0.zxzw;
	r4 = float4(s7_texture.sample_compare(s7, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r2.y = dot(r3, c3.yyyy);
	r2.x = r2.y + r2.x;
	r3 = r1 + c6;
	r3 = float4(s7_texture.sample_compare(s7, (r3.xyz).xy, (r3.xyz).z));
	r4 = r1 + c6.yxzw;
	r4 = float4(s7_texture.sample_compare(s7, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r1 + c5;
	r4 = float4(s7_texture.sample_compare(s7, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r1 + c9;
	r4 = float4(s7_texture.sample_compare(s7, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r2.y = dot(r3, c3.zzzz);
	r2.x = r2.y + r2.x;
	r3 = r1 + c10;
	r3 = float4(s7_texture.sample_compare(s7, (r3.xyz).xy, (r3.xyz).z));
	r4 = r1 + c10.yxzw;
	r4 = float4(s7_texture.sample_compare(s7, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r1 + c9.yxzw;
	r4 = float4(s7_texture.sample_compare(s7, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r1 + c5.yxzw;
	r4 = float4(s7_texture.sample_compare(s7, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r2.y = dot(r3, c3.zzzz);
	r2.x = r2.y + r2.x;
	r3 = r1 + c6.yyzw;
	r3 = float4(s7_texture.sample_compare(s7, (r3.xyz).xy, (r3.xyz).z));
	r4 = r1 + c11;
	r4 = float4(s7_texture.sample_compare(s7, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r1 + c11.yxzw;
	r4 = float4(s7_texture.sample_compare(s7, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r1 + c5.xxzw;
	r4 = float4(s7_texture.sample_compare(s7, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r2.y = dot(r3, c3.wwww);
	r2.x = r2.y + r2.x;
	r3 = r1 + c6.yzzw;
	r3 = float4(s7_texture.sample_compare(s7, (r3.xyz).xy, (r3.xyz).z));
	r4 = r1 + c5.xzzw;
	r4 = float4(s7_texture.sample_compare(s7, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r1 + c5.zxzw;
	r1 = r1 + c6.zyzw;
	r1 = float4(s7_texture.sample_compare(s7, (r1.xyz).xy, (r1.xyz).z));
	r3.w = r1.x;
	r1 = float4(s7_texture.sample_compare(s7, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r1.x;
	r1.x = dot(r3, c7.xxxx);
	r1.x = r1.x + r2.x;
	r0.w = c4.y;
	r2 = float4(s7_texture.sample_compare(s7, (r0.xyz).xy, (r0.xyz).z));
	r0 = s0_texture.sample(s0, r0.xy);
	r0.xyz = r0.xyz * c28.xyz;
	r0.w = (r2.x * c7.y) + r1.x;
	r1.x = pow(abs(r0.w), c7.z);
	r0.w = -r1.x + c4.y;
	r0.w = (c2.y * r0.w) + r1.x;
	r1.yzw = c14.xyz + -v4.xyz;
	r1.y = dot(r1.yzw, r1.yzw);
	r2.z = ((r1.y == 0.0) ? FLT_MAX : 1.0 / r1.y);
	r2.y = ((r1.y == 0.0) ? FLT_MAX : rsqrt(abs(r1.y)));
	r2.x = c4.y;
	r1.y = dot(c13.xyz, r2.xyz);
	r1.z = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r1.z = r1.z + -c13.w;
	r2.x = c4.x;
	r1.w = r2.x * c13.w;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.z = clamp(r1.w * r1.z, 0.0, 1.0);
	r1.y = clamp(r1.y * r1.z, 0.0, 1.0);
	r2.x = clamp(mix(r0.w, r1.x, r1.y), 0.0, 1.0);
	r0.xyz = r0.xyz * r2.xxx;
	r0.xyz = r0.xyz * c1.xyz;
	r2 = s1_texture.sample(s1, v1.xy);
	r0.xyz = r0.xyz * r2.xyz;
	oC0.w = r2.w;
	r2 = s2_texture.sample(s2, v2.xyz);
	r1.xzw = (r2.xyz * c8.xxx) + c8.yyy;
	r2.xyz = normalize(v3.xyz);
	r0.w = clamp(dot(r1.xzw, r2.xyz), 0.0, 1.0);
	r0.xyz = r0.www * r0.xyz;
	r0.xyz = r1.yyy * r0.xyz;
	r0.xyz = r0.xyz * c30.xxx;
	oC0.xyz = ((-v0.w >= 0.0) ? c4.zzz : r0.xyz);
	#undef c1
	#undef c2
	#undef c13
	#undef c14
	#undef c28
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

