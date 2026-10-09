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
	texture2d<float> s6_texture [[texture(6)]],
	sampler s6 [[sampler(6)]],
	texture2d<float> s7_texture [[texture(7)]],
	sampler s7 [[sampler(7)]],
	texture2d<float> s13_texture [[texture(13)]],
	sampler s13 [[sampler(13)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c2 = float4(0.300000011, 0.589999973, 0.11, 150.0); (void) c2;
	const float4 c3 = float4(2.0, -1.0, 1.0, 0.5); (void) c3;
	const float4 c4 = float4(1.0, 0.0, -0.400000005, 0.0); (void) c4;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c10 uniforms.uniforms_float4[2]
	#define c11 uniforms.uniforms_float4[3]
	#define c12 uniforms.uniforms_float4[4]
	#define c13 uniforms.uniforms_float4[5]
	#define c14 uniforms.uniforms_float4[6]
	#define c15 uniforms.uniforms_float4[7]
	#define c16 uniforms.uniforms_float4[8]
	#define c18 uniforms.uniforms_float4[9]
	#define c19 uniforms.uniforms_float4[10]
	#define c26 uniforms.uniforms_float4[11]
	#define c27 uniforms.uniforms_float4[12]
	#define c28 uniforms.uniforms_float4[13]
	#define c30 uniforms.uniforms_float4[14]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define oC0 output.oC0
	r0.x = c12.y + -v4.z;
	r0.x = r0.x + -c3.x;
	oC0.w = clamp(r0.x * c12.w, 0.0, 1.0);
	r0 = (v4.xyzx * c4.xxxy) + c4.yyyx;
	r1.x = dot(r0, c15);
	r1.y = dot(r0, c16);
	r0.x = dot(r0, c18);
	r0.y = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.yz = r0.yy * r1.xy;
	r1 = s6_texture.sample(s6, r0.yz);
	r0.yzw = r1.xyz * c28.xyz;
	r1.xyz = v3.xyz;
	r2.xyz = r1.yzx * v2.zxy;
	r1.xyz = (v2.yzx * r1.zxy) + -r2.xyz;
	r1.xyz = r1.xyz * v3.www;
	r2 = s3_texture.sample(s3, v1.xy);
	r2.xyz = (r2.xyz * c3.xxx) + c3.yyy;
	r1.xyz = r1.xyz * r2.yyy;
	r1.xyz = (r2.xxx * v3.xyz) + r1.xyz;
	r1.xyz = (r2.zzz * v2.xyz) + r1.xyz;
	r2.xyz = normalize(r1.xyz);
	r1.xyz = c14.xyz + -v4.xyz;
	r1.w = dot(r1.xyz, r1.xyz);
	r3.y = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r3.z = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.xyz = r1.xyz * r3.yyy;
	r1.w = dot(r1.xyz, r2.xyz);
	r1.w = clamp(r1.w + c28.w, 0.0, 1.0);
	r3.x = c3.z;
	r3.x = clamp(dot(c13.xyz, r3.xyz), 0.0, 1.0);
	r3.y = ((r3.y == 0.0) ? FLT_MAX : 1.0 / r3.y);
	r3.y = r3.y + -c13.w;
	r1.w = r1.w * r3.x;
	r0.yzw = r0.yzw * r1.www;
	r3.z = c4.z;
	r1.w = r3.z * c13.w;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = clamp(r1.w * r3.y, 0.0, 1.0);
	r0.yzw = r0.yzw * r1.www;
	r0.xyz = ((-r0.x >= 0.0) ? c4.yyy : r0.yzw);
	r3.xyz = c11.xyz + -v4.xyz;
	r4.xyz = normalize(r3.xyz);
	r0.w = dot(-r4.xyz, r2.xyz);
	r0.w = r0.w + r0.w;
	r3.xyz = (r2.xyz * -r0.www) + -r4.xyz;
	r0.w = clamp(dot(r2.xyz, r4.xyz), 0.0, 1.0);
	r0.w = -r0.w + c3.z;
	r1.x = clamp(dot(r3.xyz, r1.xyz), 0.0, 1.0);
	r1.y = abs(c10.z);
	r3 = s7_texture.sample(s7, v0.xy);
	r1.z = -r3.x + c3.z;
	r1.z = (r3.x * c2.w) + r1.z;
	r1.y = ((-r1.y >= 0.0) ? r1.z : c10.z);
	r2.x = pow(abs(r1.x), r1.y);
	r1.xyz = r0.xyz * r2.xxx;
	r4 = s13_texture.sample(s13, v1.zw);
	r2.xyz = (r4.xyz * c3.xxx) + c3.yyy;
	r4.yz = c3.yz;
	r2.xyz = (c0.www * r2.xyz) + r4.zzz;
	r5 = s0_texture.sample(s0, v0.xy);
	r3.xzw = (r5.xyz * r2.xyz) + c3.yyy;
	r2.xyz = r2.xyz * r5.xyz;
	r3.xyz = (r3.yyy * r3.xzw) + c3.zzz;
	r3.xyz = r3.xyz * c19.www;
	r1.w = c19.w;
	r4.xzw = r1.www * c26.xyz;
	r3.xyz = ((c26.x >= 0.0) ? r4.xzw : r3.xyz);
	r1.w = mix(r2.w, r5.w, c27.x);
	r2.w = clamp(r5.w + c27.z, 0.0, 1.0);
	r3.w = dot(r2.xyz, c2.xyz);
	r4.x = mix(r1.w, r3.w, c10.y);
	r3.xyz = r3.xyz * r4.xxx;
	r1.xyz = r1.xyz * r3.xyz;
	r3.xyz = r4.yyy + c1.xyz;
	r3.xyz = (r2.www * r3.xyz) + c3.zzz;
	r0.xyz = r0.xyz * r3.xyz;
	r0.xyz = r0.xyz * r2.xyz;
	r1.w = (r0.w * -r0.w) + c3.w;
	r0.w = r0.w * r0.w;
	r2.x = r0.w + r0.w;
	r0.w = (r0.w * c3.x) + c3.y;
	r2.y = mix(c19.y, c19.z, r0.w);
	r0.w = -c19.x + c19.y;
	r0.w = (r2.x * r0.w) + c19.x;
	r0.w = ((r1.w >= 0.0) ? r0.w : r2.y);
	r0.xyz = (r1.xyz * r0.www) + r0.xyz;
	oC0.xyz = r0.xyz * c30.xxx;
	#undef c0
	#undef c1
	#undef c10
	#undef c11
	#undef c12
	#undef c13
	#undef c14
	#undef c15
	#undef c16
	#undef c18
	#undef c19
	#undef c26
	#undef c27
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

