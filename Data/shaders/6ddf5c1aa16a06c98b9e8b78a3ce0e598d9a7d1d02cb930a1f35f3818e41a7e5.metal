#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[5];
};

struct source_main_Input
{
	float4 v0 [[user(color0)]];
	float4 t0 [[user(texcoord0)]];
	float4 t1 [[user(texcoord1)]];
	float4 t4 [[user(texcoord4)]];
};

struct source_main_Output
{
	float4 oC0 [[color(0)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	texture2d<float> s0_texture [[texture(0)]],
	sampler s0 [[sampler(0)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c1 = float4(-2.000000000e+00, 3.000000000e+00, -1.000000000e+00, -0.000000000e+00); (void) c1;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	#define c0 uniforms.uniforms_float4[0]
	#define c7 uniforms.uniforms_float4[1]
	#define c8 uniforms.uniforms_float4[2]
	#define c9 uniforms.uniforms_float4[3]
	#define c30 uniforms.uniforms_float4[4]
	#define v0 input.v0
	#define t0 input.t0
	#define t1 input.t1
	#define t4 input.t4
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, t0.xy);
	r1.w = -c8.w + c8.z;
	r1.x = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r2.xy = t0.wz;
	r2 = s0_texture.sample(s0, r2.xy);
	r3 = mix(r0, r2, t1.xxxx);
	r0.x = r3.w + -c8.w;
	r0.x = clamp(r1.x * r0.x, 0.0, 1.0);
	r0.y = (r0.x * c1.x) + c1.y;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r0.y;
	r0.y = -c8.x + c8.y;
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r0.z = r3.w + -c8.x;
	r0.y = clamp(r0.y * r0.z, 0.0, 1.0);
	r0.w = (r0.y * c1.x) + c1.y;
	r0.y = r0.y * r0.y;
	r0.y = r0.y * r0.w;
	r0.w = -r3.w + c8.y;
	r0.x = ((r0.w >= 0.0) ? r0.y : r0.x);
	r0.y = r3.w + -c9.y;
	r0.w = -c9.y + c9.x;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.y = clamp(r0.w * r0.y, 0.0, 1.0);
	r0.w = (r0.y * c1.x) + c1.y;
	r0.y = r0.y * r0.y;
	r1.w = r0.y * r0.w;
	r1.xyz = r3.xyz * v0.xyz;
	r0.y = -r3.w + c8.w;
	r0.y = ((r0.y >= 0.0) ? c1.z : c1.w);
	r0.y = ((r0.z >= 0.0) ? r0.y : c1.w);
	r2 = (c7 * t4) + -r1;
	r2 = (r0.xxxx * r2) + r1;
	r0 = ((r0.y >= 0.0) ? r1 : r2);
	r0.xyz = r0.xyz * c0.yyy;
	r1.w = clamp(r0.w * v0.w, 0.0, 1.0);
	r0.xyz = clamp(r0.xyz * c30.xxx, float3(0.0), float3(1.0));
	r1.xyz = r0.xyz * c0.www;
	oC0 = r1;
	#undef c0
	#undef c7
	#undef c8
	#undef c9
	#undef c30
	#undef v0
	#undef t0
	#undef t1
	#undef t4
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

