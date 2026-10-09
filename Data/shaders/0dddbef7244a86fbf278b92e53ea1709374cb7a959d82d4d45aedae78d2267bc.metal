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
	texture2d<float> s7_texture [[texture(7)]],
	sampler s7 [[sampler(7)]],
	depth2d<float> s8_texture [[texture(8)]],
	sampler s8 [[sampler(8)]],
	texture2d<float> s12_texture [[texture(12)]],
	sampler s12 [[sampler(12)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c3 = float4(-1.0, 1.0, -0.400000005, 0.0); (void) c3;
	const float4 c4 = float4(-2.0, 3.0, 0.0008, -0.080000001); (void) c4;
	const float4 c5 = float4(25.0, 0.0, 0.0, 0.0); (void) c5;
	float4 r0;
	float4 r1;
	float4 r2;
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c2 uniforms.uniforms_float4[2]
	#define c6 uniforms.uniforms_float4[3]
	#define c12 uniforms.uniforms_float4[4]
	#define c20 uniforms.uniforms_float4[5]
	#define c22 uniforms.uniforms_float4[6]
	#define c23 uniforms.uniforms_float4[7]
	#define c28 uniforms.uniforms_float4[8]
	#define c29 uniforms.uniforms_float4[9]
	#define c30 uniforms.uniforms_float4[10]
	#define c43 uniforms.uniforms_float4[11]
	#define c44 uniforms.uniforms_float4[12]
	#define c45 uniforms.uniforms_float4[13]
	#define c46 uniforms.uniforms_float4[14]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define v7 input.v7
	#define oC0 output.oC0
	r0.xyz = c23.xyz + -v3.xyz;
	r0.w = dot(r0.xyz, r0.xyz);
	r1.y = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r1.z = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.xyz = r0.xyz * r1.yyy;
	r0.x = dot(r0.xyz, v2.xyz);
	r0.x = clamp(r0.x + c28.w, 0.0, 1.0);
	r1.xw = c3.yy;
	r0.y = clamp(dot(c22.xyz, r1.xyz), 0.0, 1.0);
	r0.z = ((r1.y == 0.0) ? FLT_MAX : 1.0 / r1.y);
	r0.z = r0.z + -c22.w;
	r0.x = r0.x * r0.y;
	r0.w = ((v7.w == 0.0) ? FLT_MAX : 1.0 / v7.w);
	r1.xyz = r0.www * v7.xyz;
	r2 = float4(s8_texture.sample_compare(s8, (r1.xyz).xy, (r1.xyz).z));
	r1 = s7_texture.sample(s7, r1.xy);
	r1.xyz = r1.xyz * c28.xyz;
	r0.w = clamp(r2.x, 0.0, 1.0);
	r1.w = -r0.w + c3.y;
	r0.w = (c2.y * r1.w) + r0.w;
	r1.w = clamp(mix(r0.w, r2.x, r0.y), 0.0, 1.0);
	r1.xyz = r1.www * r1.xyz;
	r0.xyw = r0.xxx * r1.xyz;
	r1.yz = c3.yz;
	r1.x = r1.z * c22.w;
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r0.z = clamp(r0.z * r1.x, 0.0, 1.0);
	r0.xyz = r0.zzz * r0.xyw;
	r0.xyz = ((-v7.w >= 0.0) ? c3.www : r0.xyz);
	r2.xyz = v5.xyz;
	r1.xzw = r2.xyz + v4.xyz;
	r0.xyz = (r1.xzw * c0.www) + r0.xyz;
	r0.w = clamp(v0.y, 0.0, 1.0);
	r1.xz = r0.ww + -c46.yz;
	r2.xy = -c46.yz + c46.zw;
	r0.w = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r1.w = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r1.z = clamp(r1.w * r1.z, 0.0, 1.0);
	r0.w = clamp(r0.w * r1.x, 0.0, 1.0);
	r1.x = (r0.w * c4.x) + c4.y;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.x;
	r2.xyz = c43.xyz;
	r2.xyz = -r2.xyz + c44.xyz;
	r2.xyz = (r0.www * r2.xyz) + c43.xyz;
	r0.w = (r1.z * c4.x) + c4.y;
	r1.x = r1.z * r1.z;
	r0.w = r0.w * r1.x;
	r0.w = r0.w * r0.w;
	r1.xzw = mix(r2.xyz, c45.xyz, r0.www);
	r1.xzw = r1.xzw * c1.xyz;
	r2.x = c46.x;
	r1.xzw = ((-r2.x >= 0.0) ? c1.xyz : r1.xzw);
	r1.xzw = r1.xzw + c3.xxx;
	r2 = s0_texture.sample(s0, v0.xy);
	r0.w = clamp(r2.w + c12.x, 0.0, 1.0);
	r1.xzw = (r0.www * r1.xzw) + c3.yyy;
	r0.xyz = r0.xyz * r1.xzw;
	r0.xyz = r0.xyz * r2.xyz;
	r0.w = r2.w + c3.x;
	r0.w = (c20.w * r0.w) + r1.y;
	r0.w = r0.w * c1.w;
	r1.x = v0.w;
	r1.y = v1.w;
	r1 = s12_texture.sample(s12, r1.xy);
	r0.xyz = r0.xyz * r1.xyz;
	oC0.xyz = r0.xyz * c30.xxx;
	r0.x = (r0.w * v5.w) + -r0.w;
	r0.x = (c12.w * r0.x) + r0.w;
	r0.yzw = -c6.xyz + v3.xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.y = ((r0.y == 0.0) ? FLT_MAX : rsqrt(abs(r0.y)));
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r0.y = (r0.y * c4.z) + c4.w;
	r0.y = clamp(r0.y * c5.x, 0.0, 1.0);
	r0.z = (r0.y * c4.x) + c4.y;
	r0.y = r0.y * r0.y;
	r0.y = r0.y * r0.z;
	r0.x = r0.y * r0.x;
	r0.y = abs(c12.y);
	r0.z = c29.w * v6.z;
	oC0.w = ((-r0.y >= 0.0) ? r0.x : r0.z);
	#undef c0
	#undef c1
	#undef c2
	#undef c6
	#undef c12
	#undef c20
	#undef c22
	#undef c23
	#undef c28
	#undef c29
	#undef c30
	#undef c43
	#undef c44
	#undef c45
	#undef c46
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

