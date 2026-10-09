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
	float4 v5 [[user(texcoord6)]];
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
	texture2d<float> s4_texture [[texture(4)]],
	sampler s4 [[sampler(4)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(1.000000000e+00, -4.000000060e-01, 2.000000000e+00, -1.000000000e+00); (void) c0;
	const float4 c2 = float4(0.000000000e+00, 0.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c2;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	#define c1 uniforms.uniforms_float4[0]
	#define c13 uniforms.uniforms_float4[1]
	#define c14 uniforms.uniforms_float4[2]
	#define c28 uniforms.uniforms_float4[3]
	#define c29 uniforms.uniforms_float4[4]
	#define c30 uniforms.uniforms_float4[5]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define oC0 output.oC0
	r0.xyz = c14.xyz + -v4.xyz;
	r0.x = dot(r0.xyz, r0.xyz);
	r1.z = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r1.y = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r1.x = c0.x;
	r0.x = dot(c13.xyz, r1.xyz);
	r0.y = ((r1.y == 0.0) ? FLT_MAX : 1.0 / r1.y);
	r0.y = r0.y + -c13.w;
	r1.y = c0.y;
	r0.z = r1.y * c13.w;
	r0.z = ((r0.z == 0.0) ? FLT_MAX : 1.0 / r0.z);
	r0.y = clamp(r0.z * r0.y, 0.0, 1.0);
	r0.x = clamp(r0.x * r0.y, 0.0, 1.0);
	r0.y = ((v0.w == 0.0) ? FLT_MAX : 1.0 / v0.w);
	r0.yz = r0.yy * v0.xy;
	r1 = s0_texture.sample(s0, r0.yz);
	r0.yzw = r1.xyz * c28.xyz;
	r0.yzw = r0.yzw * c1.xyz;
	r1.x = c0.x + -v4.w;
	r2 = s1_texture.sample(s1, v1.xy);
	r3 = s4_texture.sample(s4, v1.xy);
	r1.yzw = r2.xyz + -r3.xyz;
	oC0.w = r2.w;
	r1.xyz = (r1.xxx * r1.yzw) + r3.xyz;
	r0.yzw = r0.yzw * r1.xyz;
	r1 = s2_texture.sample(s2, v2.xyz);
	r1.xyz = (r1.xyz * c0.zzz) + c0.www;
	r2.xyz = normalize(v3.xyz);
	r1.x = clamp(dot(r1.xyz, r2.xyz), 0.0, 1.0);
	r0.yzw = r0.yzw * r1.xxx;
	r0.xyz = r0.xxx * r0.yzw;
	r0.xyz = r0.xyz * c30.xxx;
	r0.xyz = ((-v0.w >= 0.0) ? c2.xxx : r0.xyz);
	r1.xyz = -r0.xyz + c29.xyz;
	r0.w = v5.w * v5.w;
	oC0.xyz = (r0.www * r1.xyz) + r0.xyz;
	#undef c1
	#undef c13
	#undef c14
	#undef c28
	#undef c29
	#undef c30
	#undef v0
	#undef v1
	#undef v2
	#undef v3
	#undef v4
	#undef v5
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

