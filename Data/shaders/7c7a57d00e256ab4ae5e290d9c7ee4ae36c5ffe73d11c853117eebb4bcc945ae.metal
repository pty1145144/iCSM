#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[13];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord1)]];
	float4 v2 [[user(texcoord2)]];
	float4 v3 [[user(texcoord3)]];
	float4 v4 [[user(texcoord4)]];
	float4 v5 [[user(texcoord6)]];
	float4 v6 [[user(texcoord7)]];
	float4 v7 [[user(texcoord8)]];
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
	texture2d<float> s12_texture [[texture(12)]],
	sampler s12 [[sampler(12)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(8.164966106e-01, 5.773502588e-01, 0.000000000e+00, -4.000000060e-01); (void) c0;
	const float4 c2 = float4(-4.082483351e-01, 7.071067691e-01, 5.773502588e-01, 0.000000000e+00); (void) c2;
	const float4 c4 = float4(-4.082482159e-01, -7.071068287e-01, 5.773502588e-01, 0.000000000e+00); (void) c4;
	const float4 c5 = float4(2.000000000e+00, -1.000000000e+00, 1.000000000e+00, 0.000000000e+00); (void) c5;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	#define c1 uniforms.uniforms_float4[0]
	#define c3 uniforms.uniforms_float4[1]
	#define c12 uniforms.uniforms_float4[2]
	#define c20 uniforms.uniforms_float4[3]
	#define c21 uniforms.uniforms_float4[4]
	#define c22 uniforms.uniforms_float4[5]
	#define c23 uniforms.uniforms_float4[6]
	#define c24 uniforms.uniforms_float4[7]
	#define c25 uniforms.uniforms_float4[8]
	#define c27 uniforms.uniforms_float4[9]
	#define c28 uniforms.uniforms_float4[10]
	#define c29 uniforms.uniforms_float4[11]
	#define c30 uniforms.uniforms_float4[12]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define v7 input.v7
	#define oC0 output.oC0
	r0.x = abs(c12.y);
	r0.y = c29.w * v4.w;
	r1 = s0_texture.sample(s0, v0.xy);
	r0.z = r1.w + c5.y;
	r2.yz = c5.yz;
	r0.z = (c20.w * r0.z) + r2.z;
	r0.z = r0.z * c1.w;
	oC0.w = ((-r0.x >= 0.0) ? r0.z : r0.y);
	r0 = (v4.xyzx * c5.zzzw) + c5.wwwz;
	r3.x = dot(r0, c24);
	r3.y = dot(r0, c25);
	r0.x = dot(r0, c27);
	r0.y = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.yz = r0.yy * r3.xy;
	r3 = s7_texture.sample(s7, r0.yz);
	r0.yzw = r3.xyz * c28.xyz;
	r3.xyz = v3.xyz;
	r2.xzw = r3.yzx * v2.zxy;
	r2.xzw = (v2.yzx * r3.zxy) + -r2.xzw;
	r2.xzw = r2.xzw * v3.www;
	r3 = s3_texture.sample(s3, v1.xy);
	r3.xyz = (r3.xyz * c5.xxx) + c5.yyy;
	r2.xzw = r2.xzw * r3.yyy;
	r2.xzw = (r3.xxx * v3.xyz) + r2.xzw;
	r2.xzw = (r3.zzz * v2.xyz) + r2.xzw;
	r4.xyz = normalize(r2.xzw);
	r2.xzw = c23.xyz + -v4.xyz;
	r3.w = dot(r2.xzw, r2.xzw);
	r5.y = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r5.z = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r2.xzw = r2.xzw * r5.yyy;
	r2.x = dot(r2.xzw, r4.xyz);
	r2.x = clamp(r2.x + c28.w, 0.0, 1.0);
	r5.x = c5.z;
	r2.z = clamp(dot(c22.xyz, r5.xyz), 0.0, 1.0);
	r2.w = ((r5.y == 0.0) ? FLT_MAX : 1.0 / r5.y);
	r2.w = r2.w + -c22.w;
	r2.x = r2.x * r2.z;
	r0.yzw = r0.yzw * r2.xxx;
	r3.w = c22.w;
	r2.x = r3.w * c0.w;
	r2.x = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r2.x = clamp(r2.x * r2.w, 0.0, 1.0);
	r0.yzw = r0.yzw * r2.xxx;
	r0.xyz = ((-r0.x >= 0.0) ? c5.www : r0.yzw);
	r4.x = clamp(dot(r3.xz, c0.xy) + c0.z, 0.0, 1.0);
	r4.y = clamp(dot(r3.xyz, c2.xyz), 0.0, 1.0);
	r4.z = clamp(dot(r3.xyz, c4.xyz), 0.0, 1.0);
	r2.xzw = r4.xyz * r4.xyz;
	r3.xyz = r2.zzz * v6.xyz;
	r3.xyz = (r2.xxx * v5.xyz) + r3.xyz;
	r3.xyz = (r2.www * v7.xyz) + r3.xyz;
	r0.w = dot(r2.xzw, c5.zzz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.xyz = (r3.xyz * r0.www) + r0.xyz;
	r0.w = clamp(r1.w + c12.x, 0.0, 1.0);
	r2.xyz = r2.yyy + c1.xyz;
	r2.xyz = (r0.www * r2.xyz) + c5.zzz;
	r0.xyz = r0.xyz * r2.xyz;
	r0.xyz = r0.xyz * r1.xyz;
	r1 = s12_texture.sample(s12, v0.zw);
	r1.xyz = r1.xyz * c3.www;
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
	#undef c3
	#undef c12
	#undef c20
	#undef c21
	#undef c22
	#undef c23
	#undef c24
	#undef c25
	#undef c27
	#undef c28
	#undef c29
	#undef c30
	#undef v0
	#undef v1
	#undef v2
	#undef v3
	#undef v4
	#undef v5
	#undef v6
	#undef v7
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

