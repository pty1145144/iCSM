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
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(0.81649661, 0.577350258, 0.0, -0.400000005); (void) c0;
	const float4 c2 = float4(-0.408248334, 0.707106768, 0.577350258, 0.0); (void) c2;
	const float4 c3 = float4(-0.408248215, -0.707106828, 0.577350258, 0.0); (void) c3;
	const float4 c4 = float4(2.0, -1.0, 1.0, 0.0); (void) c4;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	#define c1 uniforms.uniforms_float4[0]
	#define c12 uniforms.uniforms_float4[1]
	#define c21 uniforms.uniforms_float4[2]
	#define c22 uniforms.uniforms_float4[3]
	#define c23 uniforms.uniforms_float4[4]
	#define c24 uniforms.uniforms_float4[5]
	#define c25 uniforms.uniforms_float4[6]
	#define c27 uniforms.uniforms_float4[7]
	#define c28 uniforms.uniforms_float4[8]
	#define c29 uniforms.uniforms_float4[9]
	#define c30 uniforms.uniforms_float4[10]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define v7 input.v7
	#define oC0 output.oC0
	r0 = (v4.xyzx * c4.zzzw) + c4.wwwz;
	r1.x = dot(r0, c24);
	r1.y = dot(r0, c25);
	r0.x = dot(r0, c27);
	r0.y = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.yz = r0.yy * r1.xy;
	r1 = s7_texture.sample(s7, r0.yz);
	r0.yzw = r1.xyz * c28.xyz;
	r1.xyz = v3.xyz;
	r2.xyz = r1.yzx * v2.zxy;
	r1.xyz = (v2.yzx * r1.zxy) + -r2.xyz;
	r1.xyz = r1.xyz * v3.www;
	r2 = s3_texture.sample(s3, v1.xy);
	r2.xyz = (r2.xyz * c4.xxx) + c4.yyy;
	r1.xyz = r1.xyz * r2.yyy;
	r1.xyz = (r2.xxx * v3.xyz) + r1.xyz;
	r1.xyz = (r2.zzz * v2.xyz) + r1.xyz;
	r3.xyz = normalize(r1.xyz);
	r1.xyz = c23.xyz + -v4.xyz;
	r1.w = dot(r1.xyz, r1.xyz);
	r4.y = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r4.z = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.xyz = r1.xyz * r4.yyy;
	r1.x = dot(r1.xyz, r3.xyz);
	r1.x = clamp(r1.x + c28.w, 0.0, 1.0);
	r4.x = c4.z;
	r1.y = clamp(dot(c22.xyz, r4.xyz), 0.0, 1.0);
	r1.z = ((r4.y == 0.0) ? FLT_MAX : 1.0 / r4.y);
	r1.z = r1.z + -c22.w;
	r1.x = r1.x * r1.y;
	r0.yzw = r0.yzw * r1.xxx;
	r1.w = c22.w;
	r1.x = r1.w * c0.w;
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.x = clamp(r1.x * r1.z, 0.0, 1.0);
	r0.yzw = r0.yzw * r1.xxx;
	r0.xyz = ((-r0.x >= 0.0) ? c4.www : r0.yzw);
	r1.x = clamp(dot(r2.xz, c0.xy) + c0.z, 0.0, 1.0);
	r1.y = clamp(dot(r2.xyz, c2.xyz), 0.0, 1.0);
	r1.z = clamp(dot(r2.xyz, c3.xyz), 0.0, 1.0);
	r1.xyz = r1.xyz * r1.xyz;
	r2.xyz = r1.yyy * v6.xyz;
	r2.xyz = (r1.xxx * v5.xyz) + r2.xyz;
	r2.xyz = (r1.zzz * v7.xyz) + r2.xyz;
	r0.w = dot(r1.xyz, c4.zzz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.xyz = (r2.xyz * r0.www) + r0.xyz;
	r1.y = c4.y;
	r1.xyz = r1.yyy + c1.xyz;
	r2 = s0_texture.sample(s0, v0.xy);
	r0.w = clamp(r2.w + c12.x, 0.0, 1.0);
	r1.xyz = (r0.www * r1.xyz) + c4.zzz;
	r0.xyz = r0.xyz * r1.xyz;
	r0.xyz = r0.xyz * r2.xyz;
	oC0.xyz = r0.xyz * c30.xxx;
	r0.x = c21.y + -v4.z;
	r0.x = r0.x + -c4.x;
	r0.x = clamp(r0.x * c21.w, 0.0, 1.0);
	r0.y = abs(c12.y);
	r0.z = c29.w * v4.w;
	oC0.w = ((-r0.y >= 0.0) ? r0.x : r0.z);
	#undef c1
	#undef c12
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

