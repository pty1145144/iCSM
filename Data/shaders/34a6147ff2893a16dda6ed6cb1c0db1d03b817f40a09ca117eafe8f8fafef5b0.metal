#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[1];
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
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
	texture2d<float> s5_texture [[texture(5)]],
	sampler s5 [[sampler(5)]],
	texture2d<float> s8_texture [[texture(8)]],
	sampler s8 [[sampler(8)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(7.500000000e-01, 6.000000000e+00, 1.000000000e+00, 5.000000000e-01); (void) c0;
	const float4 c1 = float4(1.000000000e+01, -1.000000000e+01, -2.000000000e+00, 3.000000000e+00); (void) c1;
	const float4 c2 = float4(0.000000000e+00, 0.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c2;
	const float4 c4 = float4(-5.799999833e-01, 2.500000000e-01, -7.999999821e-02, 1.428571415e+01); (void) c4;
	const float4 c5 = float4(3.000000119e-01, 5.899999738e-01, 1.099999994e-01, 2.999999933e-02); (void) c5;
	const float4 c6 = float4(-8.999999762e-01, -9.999999776e-03, 1.000000000e+01, -1.000000000e+02); (void) c6;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	#define c3 uniforms.uniforms_float4[0]
	#define v0 input.v0
	#define v1 input.v1
	#define oC0 output.oC0
	r0 = s5_texture.sample(s5, v1.zw);
	r1.xyz = c0.xyz;
	r1.x = r1.x * c3.w;
	r2 = s0_texture.sample(s0, v0.xy);
	r1.w = -r2.x + c0.z;
	r1.w = r1.w * r1.w;
	r1.w = r1.w * r1.w;
	r1.x = (r1.w * c4.y) + r1.x;
	r3 = mix(c0.zzzz, r0, r1.xxxx);
	r0 = s8_texture.sample(s8, v0.zw);
	r0.xyz = r3.xyz * r0.xyz;
	r1.x = dot(r0.xyz, c5.xyz);
	r1.x = r1.x + c4.z;
	r1.x = clamp(r1.x * c4.w, 0.0, 1.0);
	r1.w = (r1.x * c1.z) + c1.w;
	r1.x = r1.x * r1.x;
	r1.x = (r1.w * -r1.x) + c0.z;
	r3.xyz = (r1.xxx * c5.www) + r0.xyz;
	r3.xyz = r2.zzz * r3.xyz;
	r0.xyz = clamp((r3.xyz * c0.www) + r0.xyz, float3(0.0), float3(1.0));
	r3.xyz = r2.yyy * r0.xyz;
	r4 = s3_texture.sample(s3, v0.xy);
	r0.xyz = (r0.xyz * -r2.yyy) + r4.xyz;
	r1.xw = r0.ww + -c0.wz;
	r0.w = clamp(r0.w + r0.w, 0.0, 1.0);
	r1.xw = clamp(r1.xw * c1.xy, float2(0.0), float2(1.0));
	r4.xy = (r1.xw * c1.zz) + c1.ww;
	r1.xw = r1.xw * r1.xw;
	r1.xw = r1.xw * r4.xy;
	r1.x = r1.w * r1.x;
	r5 = s1_texture.sample(s1, v1.xy);
	r1.w = (r5.y * r2.x) + r2.w;
	r2.x = r2.y * c3.z;
	r2.x = r3.w * r2.x;
	r1.y = (c3.w * r1.y) + r1.z;
	r1.x = (r1.w * r1.y) + r1.x;
	r1.y = (r0.w * c1.z) + c1.w;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.y;
	r0.w = (r1.x * r0.w) + c4.x;
	r0.w = clamp(r0.w * c1.x, 0.0, 1.0);
	r1.x = (r0.w * c1.z) + c1.w;
	r0.w = r0.w * r0.w;
	r1.y = r0.w * r1.x;
	r1.xz = (r1.xx * r0.ww) + c6.xy;
	r1.xz = r1.xz * c6.zw;
	oC0.xyz = (r1.yyy * r0.xyz) + r3.xyz;
	r0.x = max(r1.z, c2.x);
	r1.x = clamp(r1.x, 0.0, 1.0);
	r0.y = (r0.x * c1.z) + c1.w;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r0.y;
	r0.y = (r2.x * -r0.x) + r4.w;
	r0.x = r0.x * r2.x;
	r0.z = (r1.x * c1.z) + c1.w;
	r0.w = r1.x * r1.x;
	r0.z = r0.w * r0.z;
	oC0.w = (r0.z * r0.y) + r0.x;
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

