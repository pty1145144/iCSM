#include <metal_stdlib>
#include <metal_common>
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
	texture2d<float> s2_texture [[texture(2)]],
	sampler s2 [[sampler(2)]],
	texture2d<float> s4_texture [[texture(4)]],
	sampler s4 [[sampler(4)]],
	texture2d<float> s8_texture [[texture(8)]],
	sampler s8 [[sampler(8)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(6.000000000e+00, 1.000000000e+00, -5.000000000e-01, -1.000000000e+00); (void) c0;
	const float4 c1 = float4(1.000000000e+01, -1.000000000e+01, -2.000000000e+00, 3.000000000e+00); (void) c1;
	const float4 c2 = float4(-5.799999833e-01, 9.959999919e-01, 0.000000000e+00, 1.000000000e+00); (void) c2;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	#define c3 uniforms.uniforms_float4[0]
	#define v0 input.v0
	#define v1 input.v1
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	r1 = s1_texture.sample(s1, v1.xy);
	r0.x = (r1.y * r0.x) + r0.w;
	r1 = s8_texture.sample(s8, v0.zw);
	r0.yz = r1.ww + c0.zw;
	r0.yz = clamp(r0.yz * c1.xy, float2(0.0), float2(1.0));
	r1.xy = (r0.yz * c1.zz) + c1.ww;
	r0.yz = r0.yz * r0.yz;
	r0.yz = r0.yz * r1.xy;
	r0.y = r0.z * r0.y;
	r1.xy = c0.xy;
	r0.z = (c3.w * r1.x) + r1.y;
	r0.x = (r0.x * r0.z) + r0.y;
	r0.y = clamp(r1.w + r1.w, 0.0, 1.0);
	r0.z = (r0.y * c1.z) + c1.w;
	r0.w = r0.y * r0.y;
	r0.z = r0.w * r0.z;
	r0.w = (r0.x * r0.z) + c2.x;
	r0.w = clamp(r0.w * c1.x, 0.0, 1.0);
	r1.x = (r0.w * c1.z) + c1.w;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.x;
	r1.x = (r0.x * r0.z) + -r0.w;
	r0.x = (r0.x * -r0.z) + c2.y;
	r0.x = ((r0.x >= 0.0) ? c2.z : c2.w);
	r2 = s4_texture.sample(s4, v0.xy);
	r0.z = (r2.x * r1.x) + r0.w;
	r1.x = mix(r0.z, r0.x, r2.x);
	r3.x = mix(r1.w, r0.y, r2.x);
	r0.x = mix(c3.y, r3.x, r2.x);
	r3 = s2_texture.sample(s2, v0.xy);
	r0.y = -r0.x + r3.x;
	oC0.x = (r1.x * r0.y) + r0.x;
	oC0.y = clamp((r1.x * r3.y) + r2.x, 0.0, 1.0);
	oC0.zw = (r3.zz * c2.wz) + c2.zw;
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

