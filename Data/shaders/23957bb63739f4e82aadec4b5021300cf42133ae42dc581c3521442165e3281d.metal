#include <metal_stdlib>
#include <metal_common>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[2];
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
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c1 = float4(7.500000000e-01, 6.000000000e+00, 1.000000000e+00, -5.799999833e-01); (void) c1;
	const float4 c2 = float4(1.000000000e+01, -2.000000000e+00, 3.000000000e+00, 1.000000000e+02); (void) c2;
	const float4 c4 = float4(2.500000000e-01, 5.000000075e-02, -7.999999821e-02, 1.428571415e+01); (void) c4;
	const float4 c5 = float4(3.000000119e-01, 5.899999738e-01, 1.099999994e-01, 4.999999888e-03); (void) c5;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	#define c0 uniforms.uniforms_float4[0]
	#define c3 uniforms.uniforms_float4[1]
	#define v0 input.v0
	#define v1 input.v1
	#define oC0 output.oC0
	r0 = s5_texture.sample(s5, v1.zw);
	r1.xyz = c1.xyz;
	r1.x = r1.x * c3.w;
	r2 = s0_texture.sample(s0, v0.xy);
	r1.w = -r2.x + c1.z;
	r1.w = r1.w * r1.w;
	r1.w = r1.w * r1.w;
	r1.x = (r1.w * c4.x) + r1.x;
	r3 = mix(c1.zzzz, r0, r1.xxxx);
	r0.x = (c3.w * r1.y) + r1.z;
	r4 = s1_texture.sample(s1, v1.xy);
	r0.y = (r4.y * r2.x) + r2.w;
	r0.x = (r0.y * r0.x) + c1.w;
	r0.x = clamp(r0.x * c2.x, 0.0, 1.0);
	r0.y = (r0.x * c2.y) + c2.z;
	r0.x = r0.x * r0.x;
	r0.z = r0.x * r0.y;
	r0.x = (r0.y * r0.x) + c1.z;
	r0.y = clamp(r0.z * c2.w, 0.0, 1.0);
	r0.z = (r0.y * c2.y) + c2.z;
	r0.y = r0.y * r0.y;
	r0.y = r0.y * r0.z;
	r1.xyw = mix(r3.xyz, c1.zzz, r0.yyy);
	r3.y = c4.y;
	r4.xyz = mix(c0.xyz, r3.yyy, r0.yyy);
	r1.xyw = r1.xyw * r4.xyz;
	r0.z = dot(r1.xyw, c5.xyz);
	r0.z = r0.z + c4.z;
	r0.z = clamp(r0.z * c4.w, 0.0, 1.0);
	r0.w = (r0.z * c2.y) + c2.z;
	r0.z = r0.z * r0.z;
	r0.z = (r0.w * -r0.z) + c1.z;
	r3.xyz = (r0.zzz * c5.www) + r1.xyw;
	r2.xzw = r2.zzz * r3.xyz;
	r1.xyw = clamp((r2.xzw * -c2.yyy) + r1.xyw, float3(0.0), float3(1.0));
	r2.xzw = r2.yyy * r1.xyw;
	r4 = s3_texture.sample(s3, v0.xy);
	r1.xyw = (r1.xyw * -r2.yyy) + r4.xyz;
	r0.z = r2.y * c3.z;
	r0.z = r3.w * r0.z;
	r3 = s4_texture.sample(s4, v0.xy);
	r0.x = clamp(r0.x + -r3.x, 0.0, 1.0);
	oC0.xyz = (r0.xxx * r1.xyw) + r2.xzw;
	r2.x = mix(c3.z, r1.z, r0.y);
	r0.y = r0.z * r2.x;
	r2 = s2_texture.sample(s2, v0.xy);
	r0.z = r0.x * r2.y;
	r0.w = -r1.z + c3.x;
	r0.z = (r0.z * r0.w) + c1.z;
	r0.z = (r4.w * r0.z) + -r0.y;
	oC0.w = (r0.x * r0.z) + r0.y;
	#undef c0
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

