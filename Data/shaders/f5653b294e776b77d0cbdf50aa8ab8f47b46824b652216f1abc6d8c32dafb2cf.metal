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
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
	texture2d<float> s4_texture [[texture(4)]],
	sampler s4 [[sampler(4)]],
	texture2d<float> s5_texture [[texture(5)]],
	sampler s5 [[sampler(5)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c4 = float4(7.500000000e-01, 6.000000000e+00, 1.000000000e+00, -5.799999833e-01); (void) c4;
	const float4 c5 = float4(1.428571415e+01, 2.999999933e-02, 5.000000000e-01, 0.000000000e+00); (void) c5;
	const float4 c6 = float4(1.000000000e+01, -2.000000000e+00, 3.000000000e+00, 2.500000000e-01); (void) c6;
	const float4 c7 = float4(3.000000119e-01, 5.899999738e-01, 1.099999994e-01, -7.999999821e-02); (void) c7;
	const float4 c8 = float4(-8.999999762e-01, -9.999999776e-03, 1.000000000e+01, -1.000000000e+02); (void) c8;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c2 uniforms.uniforms_float4[2]
	#define c3 uniforms.uniforms_float4[3]
	#define v0 input.v0
	#define v1 input.v1
	#define oC0 output.oC0
	r0.xyz = c0.xyz;
	r0.xyz = -r0.xyz + c1.xyz;
	r1 = s4_texture.sample(s4, v0.xy);
	r0.xyz = (r1.xxx * r0.xyz) + c0.xyz;
	r2.xyz = mix(r0.xyz, c2.xyz, r1.yyy);
	r0.x = -r2.x + c0.w;
	r0.y = -r2.y + c1.w;
	r0.z = -r2.z + c2.w;
	r0.xyz = (r1.zzz * r0.xyz) + r2.xyz;
	r1 = s5_texture.sample(s5, v1.zw);
	r2.xyz = c4.xyz;
	r0.w = r2.x * c3.w;
	r3 = s0_texture.sample(s0, v0.xy);
	r2.x = -r3.x + c4.z;
	r2.x = r2.x * r2.x;
	r2.x = r2.x * r2.x;
	r0.w = (r2.x * c6.w) + r0.w;
	r4 = mix(c4.zzzz, r1, r0.wwww);
	r0.xyz = r0.xyz * r4.xyz;
	r0.w = dot(r0.xyz, c7.xyz);
	r0.w = r0.w + c7.w;
	r0.w = clamp(r0.w * c5.x, 0.0, 1.0);
	r1.x = (r0.w * c6.y) + c6.z;
	r0.w = r0.w * r0.w;
	r0.w = (r1.x * -r0.w) + c4.z;
	r1.xyz = (r0.www * c5.yyy) + r0.xyz;
	r1.xyz = r1.xyz * r3.zzz;
	r0.xyz = clamp((r1.xyz * c5.zzz) + r0.xyz, float3(0.0), float3(1.0));
	r1.xyz = r3.yyy * r0.xyz;
	r5 = s3_texture.sample(s3, v0.xy);
	r0.xyz = (r0.xyz * -r3.yyy) + r5.xyz;
	r6 = s1_texture.sample(s1, v1.xy);
	r0.w = (r6.y * r3.x) + r3.w;
	r1.w = r3.y * c3.z;
	r1.w = r4.w * r1.w;
	r2.x = (c3.w * r2.y) + r2.z;
	r0.w = (r0.w * r2.x) + c4.w;
	r0.w = clamp(r0.w * c6.x, 0.0, 1.0);
	r2.x = (r0.w * c6.y) + c6.z;
	r0.w = r0.w * r0.w;
	r2.y = r0.w * r2.x;
	r2.xz = (r2.xx * r0.ww) + c8.xy;
	r2.xz = r2.xz * c8.zw;
	oC0.xyz = (r2.yyy * r0.xyz) + r1.xyz;
	r0.x = max(r2.z, c5.w);
	r2.x = clamp(r2.x, 0.0, 1.0);
	r0.y = (r0.x * c6.y) + c6.z;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r0.y;
	r0.y = (r1.w * -r0.x) + r5.w;
	r0.x = r0.x * r1.w;
	r0.z = (r2.x * c6.y) + c6.z;
	r0.w = r2.x * r2.x;
	r0.z = r0.w * r0.z;
	oC0.w = (r0.z * r0.y) + r0.x;
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

