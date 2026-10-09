#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[21];
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
	texture2d<float> s2_texture [[texture(2)]],
	sampler s2 [[sampler(2)]],
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
	texture2d<float> s7_texture [[texture(7)]],
	sampler s7 [[sampler(7)]],
	depth2d<float> s8_texture [[texture(8)]],
	sampler s8 [[sampler(8)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(-1.953125000e-03, 1.953125000e-03, 0.000000000e+00, 1.000000000e+00); (void) c0;
	const float4 c3 = float4(3.021148033e-03, 2.114803717e-02, 1.208459213e-02, 6.042296067e-02); (void) c3;
	const float4 c11 = float4(-4.000000060e-01, 1.953125000e-03, 0.000000000e+00, 1.000000000e+00); (void) c11;
	const float4 c13 = float4(-9.765625000e-04, 1.953125000e-03, 0.000000000e+00, 1.000000000e+00); (void) c13;
	const float4 c14 = float4(1.953125000e-03, 9.765625000e-04, 0.000000000e+00, 1.000000000e+00); (void) c14;
	const float4 c15 = float4(9.969788790e-02, 1.661631465e-01, 1.399999976e+00, 0.000000000e+00); (void) c15;
	const float4 c16 = float4(2.000000000e+00, -1.000000000e+00, 1.000000000e+00, 0.000000000e+00); (void) c16;
	const float4 c17 = float4(-1.953125000e-03, 9.765625000e-04, 0.000000000e+00, 1.000000000e+00); (void) c17;
	const float4 c18 = float4(-1.953125000e-03, -9.765625000e-04, 0.000000000e+00, 1.000000000e+00); (void) c18;
	const float4 c19 = float4(-9.765625000e-04, 9.765625000e-04, 0.000000000e+00, 1.000000000e+00); (void) c19;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	#define c1 uniforms.uniforms_float4[0]
	#define c2 uniforms.uniforms_float4[1]
	#define c4 uniforms.uniforms_float4[2]
	#define c5 uniforms.uniforms_float4[3]
	#define c6 uniforms.uniforms_float4[4]
	#define c7 uniforms.uniforms_float4[5]
	#define c8 uniforms.uniforms_float4[6]
	#define c9 uniforms.uniforms_float4[7]
	#define c10 uniforms.uniforms_float4[8]
	#define c12 uniforms.uniforms_float4[9]
	#define c20 uniforms.uniforms_float4[10]
	#define c21 uniforms.uniforms_float4[11]
	#define c22 uniforms.uniforms_float4[12]
	#define c23 uniforms.uniforms_float4[13]
	#define c24 uniforms.uniforms_float4[14]
	#define c25 uniforms.uniforms_float4[15]
	#define c26 uniforms.uniforms_float4[16]
	#define c27 uniforms.uniforms_float4[17]
	#define c28 uniforms.uniforms_float4[18]
	#define c29 uniforms.uniforms_float4[19]
	#define c30 uniforms.uniforms_float4[20]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define oC0 output.oC0
	r0.x = abs(c12.y);
	r0.y = c29.w * v4.w;
	r1 = s0_texture.sample(s0, v0.xy);
	r0.z = r1.w + c16.y;
	r2.yz = c16.yz;
	r0.z = (c20.w * r0.z) + r2.z;
	r0.z = r0.z * c1.w;
	oC0.w = ((-r0.x >= 0.0) ? r0.z : r0.y);
	r0 = (v4.xyzx * c16.zzzw) + c16.wwwz;
	r2.x = dot(r0, c27);
	r2.w = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r3.x = dot(r0, c24);
	r3.y = dot(r0, c25);
	r3.z = dot(r0, c26);
	r0.xyz = r2.www * r3.xyz;
	r3 = r0.xyzx * c16.zzzw;
	r4 = r3 + c11.yyzw;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c0;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c0.yxzw;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c0.xxzw;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r2.w = dot(r4, c3.xxxx);
	r4 = r3 + c11.yzzw;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c0.xzzw;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c11.zyzw;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c0.zxzw;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r4.x = dot(r4, c3.yyyy);
	r2.w = r2.w + r4.x;
	r4 = r3 + c14;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c14.yxzw;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c13;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c17;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r4.x = dot(r4, c3.zzzz);
	r2.w = r2.w + r4.x;
	r4 = r3 + c18;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c18.yxzw;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c17.yxzw;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c13.yxzw;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r4.x = dot(r4, c3.zzzz);
	r2.w = r2.w + r4.x;
	r4 = r3 + c14.yyzw;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c19;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c19.yxzw;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c13.xxzw;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r4.x = dot(r4, c3.wwww);
	r2.w = r2.w + r4.x;
	r4 = r3 + c14.yzzw;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c13.xzzw;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c13.zxzw;
	r3 = r3 + c14.zyzw;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z));
	r4.w = r3.x;
	r3 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r3.x;
	r3.x = dot(r4, c15.xxxx);
	r2.w = r2.w + r3.x;
	r0.w = c16.z;
	r3 = float4(s8_texture.sample_compare(s8, (r0.xyz).xy, (r0.xyz).z));
	r0 = s7_texture.sample(s7, r0.xy);
	r0.xyz = r0.xyz * c28.xyz;
	r0.w = (r3.x * c15.y) + r2.w;
	r2.w = pow(abs(r0.w), c15.z);
	r0.w = clamp(r2.w, 0.0, 1.0);
	r3.x = -r0.w + c16.z;
	r0.w = (c2.y * r3.x) + r0.w;
	r3.x = c16.z;
	r4.xyz = c23.xyz + -v4.xyz;
	r3.w = dot(r4.xyz, r4.xyz);
	r3.z = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r3.y = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r3.x = clamp(dot(c22.xyz, r3.xyz), 0.0, 1.0);
	r4.w = clamp(mix(r0.w, r2.w, r3.x), 0.0, 1.0);
	r0.xyz = r0.xyz * r4.www;
	r4.xyz = r3.yyy * r4.xyz;
	r0.w = ((r3.y == 0.0) ? FLT_MAX : 1.0 / r3.y);
	r0.w = r0.w + -c22.w;
	r5.xyz = v3.xyz;
	r3.yzw = r5.yzx * v2.zxy;
	r3.yzw = (v2.yzx * r5.zxy) + -r3.yzw;
	r3.yzw = r3.yzw * v3.www;
	r5 = s3_texture.sample(s3, v1.xy);
	r5.xyz = (r5.xyz * c16.xxx) + c16.yyy;
	r3.yzw = r3.yzw * r5.yyy;
	r3.yzw = (r5.xxx * v3.xyz) + r3.yzw;
	r3.yzw = (r5.zzz * v2.xyz) + r3.yzw;
	r5.xyz = normalize(r3.yzw);
	r2.w = dot(r4.xyz, r5.xyz);
	r2.w = clamp(r2.w + c28.w, 0.0, 1.0);
	r2.w = r2.w * r3.x;
	r0.xyz = r0.xyz * r2.www;
	r3.x = c11.x;
	r2.w = r3.x * c22.w;
	r2.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r0.w = clamp(r0.w * r2.w, 0.0, 1.0);
	r0.xyz = r0.www * r0.xyz;
	r0.xyz = ((-r2.x >= 0.0) ? c16.www : r0.xyz);
	r3.x = ((r5.x >= 0.0) ? c16.w : c16.z);
	r3.y = ((r5.y >= 0.0) ? c16.w : c16.z);
	r3.z = ((r5.z >= 0.0) ? c16.w : c16.z);
	r4.xyz = r5.xyz * r5.xyz;
	r5.x = ((r5.x >= 0.0) ? c16.z : c16.w);
	r5.y = ((r5.y >= 0.0) ? c16.z : c16.w);
	r5.z = ((r5.z >= 0.0) ? c16.z : c16.w);
	r5.xyz = r4.xyz * r5.xyz;
	r3.xyz = r3.xyz * r4.xyz;
	r4.xyz = r3.xxx * c6.xyz;
	r4.xyz = (r5.xxx * c5.xyz) + r4.xyz;
	r4.xyz = (r5.yyy * c7.xyz) + r4.xyz;
	r3.xyw = (r3.yyy * c8.xyz) + r4.xyz;
	r3.xyw = (r5.zzz * c9.xyz) + r3.xyw;
	r3.xyz = (r3.zzz * c10.xyz) + r3.xyw;
	r0.xyz = r0.xyz + r3.xyz;
	r0.w = clamp(r1.w + c12.x, 0.0, 1.0);
	r2.xyw = r2.yyy + c1.xyz;
	r2.xyw = (r0.www * r2.xyw) + c16.zzz;
	r0.xyz = r0.xyz * r2.xyw;
	r3 = s2_texture.sample(s2, v1.zw);
	r2.xyw = (r3.xyz * c16.xxx) + c16.yyy;
	r2.xyz = (c4.www * r2.xyw) + r2.zzz;
	r1.xyz = r1.xyz * r2.xyz;
	r0.xyz = r0.xyz * r1.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	r2.xyz = c20.xyz + -v4.xyz;
	r0.w = dot(r2.xyz, r2.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = clamp((r0.w * c21.w) + c21.x, 0.0, 1.0);
	r1.w = min(r0.w, c21.z);
	r0.w = r1.w * r1.w;
	oC0.xyz = (r0.www * r0.xyz) + r1.xyz;
	#undef c1
	#undef c2
	#undef c4
	#undef c5
	#undef c6
	#undef c7
	#undef c8
	#undef c9
	#undef c10
	#undef c12
	#undef c20
	#undef c21
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

