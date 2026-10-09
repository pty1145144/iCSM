#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[4];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord1)]];
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
	texture2d<float> s2_texture [[texture(2)]],
	sampler s2 [[sampler(2)]],
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
	texture2d<float> s4_texture [[texture(4)]],
	sampler s4 [[sampler(4)]],
	texture2d<float> s5_texture [[texture(5)]],
	sampler s5 [[sampler(5)]],
	texture2d<float> s8_texture [[texture(8)]],
	sampler s8 [[sampler(8)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c4 = float4(1.000000000e+00, 7.500000000e-01, 1.000000015e-01, 2.500000000e-01); (void) c4;
	const float4 c5 = float4(1.000000000e+01, -2.000000000e+00, 3.000000000e+00, 7.999999821e-02); (void) c5;
	const float4 c6 = float4(6.666666508e+00, 3.000000119e-01, 5.899999738e-01, 1.099999994e-01); (void) c6;
	const float4 c7 = float4(1.428571415e+01, 4.999999888e-03, 0.000000000e+00, 0.000000000e+00); (void) c7;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c2 uniforms.uniforms_float4[2]
	#define c3 uniforms.uniforms_float4[3]
	#define v0 input.v0
	#define v1 input.v1
	#define oC0 output.oC0
	r0.x = ((c3.w == 0.0) ? FLT_MAX : rsqrt(abs(c3.w)));
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r1.xyz = c1.xyz;
	r2.x = -r1.x + c0.w;
	r2.y = -c1.y + c1.w;
	r2.z = -r1.z + c2.w;
	r0.xyz = (r0.xxx * r2.xyz) + c1.xyz;
	r2.xyz = -r1.xyz + c2.xyz;
	r1.xyz = (c3.www * r2.xyz) + r1.xyz;
	r2 = s5_texture.sample(s5, v1.zw);
	r0.w = r2.y * r2.x;
	r3.xyz = c4.xyz;
	r3.yw = r3.yz * c3.ww;
	r4 = s0_texture.sample(s0, v0.xy);
	r1.w = clamp((r4.x * r4.y) + -r3.w, 0.0, 1.0);
	r0.w = (r0.w * -r2.z) + r1.w;
	r0.w = r0.w + c5.w;
	r0.w = clamp(r0.w * c6.x, 0.0, 1.0);
	r1.w = (r0.w * c5.y) + c5.z;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.w;
	r5.xyz = mix(r0.xyz, r1.xyz, r0.www);
	r1 = s8_texture.sample(s8, v0.zw);
	r0.xyz = r1.xyz * r5.xyz;
	r1.x = dot(r1.xyz, c6.yzw);
	r1.xyz = (c0.xyz * r1.xxx) + -r0.xyz;
	r5 = s1_texture.sample(s1, v1.xy);
	r1.w = r4.y * r5.y;
	r3.w = r4.x * r4.x;
	r1.w = r1.w * r3.w;
	r1.w = (r1.w * c3.w) + -r3.z;
	r1.w = clamp(r1.w * c5.x, 0.0, 1.0);
	r3.z = (r1.w * c5.y) + c5.z;
	r1.w = r1.w * r1.w;
	r1.w = r1.w * r3.z;
	r0.xyz = (r1.www * r1.xyz) + r0.xyz;
	r1.x = -r4.x + c4.x;
	r1.x = r1.x * r1.x;
	r1.x = r1.x * r1.x;
	r1.x = (r1.x * c4.w) + r3.y;
	r5 = mix(c4.xxxx, r2, r1.xxxx);
	r0.xyz = r0.xyz * r5.xyz;
	r1.x = dot(r0.xyz, c6.yzw);
	r1.x = r1.x + -c5.w;
	r1.x = clamp(r1.x * c7.x, 0.0, 1.0);
	r1.y = (r1.x * c5.y) + c5.z;
	r1.x = r1.x * r1.x;
	r1.x = (r1.y * -r1.x) + c4.x;
	r1.xyz = (r1.xxx * c7.yyy) + r0.xyz;
	r1.xyz = r1.xyz * r4.zzz;
	r0.xyz = clamp((r1.xyz * -c5.yyy) + r0.xyz, float3(0.0), float3(1.0));
	r1.xyz = r4.yyy * r0.xyz;
	r2 = s3_texture.sample(s3, v0.xy);
	r0.xyz = (r0.xyz * -r4.yyy) + r2.xyz;
	r2.x = r4.y * c3.z;
	r2.x = r5.w * r2.x;
	r4 = s4_texture.sample(s4, v0.xy);
	r2.y = -r4.x + c4.x;
	oC0.xyz = (r2.yyy * r0.xyz) + r1.xyz;
	r0.x = (r1.w * -c3.w) + r3.x;
	r0.y = r0.x * r0.w;
	r0.x = (r0.w * -r0.x) + c4.x;
	r0.x = (r1.w * r0.x) + r0.y;
	r0.x = r0.x * r2.x;
	r1 = s2_texture.sample(s2, v0.xy);
	r0.y = r2.y * r1.y;
	r0.z = -r3.x + c3.x;
	r0.y = (r0.y * r0.z) + c4.x;
	r0.y = (r2.w * r0.y) + -r0.x;
	oC0.w = (r2.y * r0.y) + r0.x;
	#undef c0
	#undef c1
	#undef c2
	#undef c3
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

