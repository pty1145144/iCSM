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
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c1 = float4(1.299999949, 1.0, 1.200000047, 0.0); (void) c1;
	const float4 c2 = float4(10.0, 4.0, 2.0, -1.0); (void) c2;
	const float4 c3 = float4(0.5, 0.333333342, 2.0, 0.0); (void) c3;
	const float4 c4 = float4(0.05, 0.125, -0.5, -0.449999989); (void) c4;
	const float4 c5 = float4(-6.666666506, -3.333333253, -2.0, 3.0); (void) c5;
	const float4 c6 = float4(0.300000011, 0.589999973, 0.11, 0.0); (void) c6;
	float4 r0;
	float4 r1;
	#define c0 uniforms.uniforms_float4[0]
	#define v0 input.v0
	#define oC0 output.oC0
	r0.xy = c2.xy * v0.xy;
	r1 = s1_texture.sample(s1, r0.xy);
	r0.zw = (r1.xy * c2.zz) + c2.ww;
	r1.x = -r1.w + -c2.w;
	r0.xy = (r0.zw * c3.xy) + r0.xy;
	r0.xy = (r0.xy * c3.zz) + c3.xx;
	r0.zw = fract(r0.xy);
	r0.xy = -r0.zw + r0.xy;
	r0.xy = (r0.xy * c4.xy) + c4.zw;
	r0.x = dot(r0.xy, r0.xy) + c3.w;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = (r0.x * -c1.x) + c1.y;
	r0.z = c1.z;
	r0.x = (c0.w * -r0.z) + r0.x;
	r0.xy = clamp(r0.xx * c5.xy, float2(0.0), float2(1.0));
	r0.zw = (r0.xy * c5.zz) + c5.ww;
	r0.xy = r0.xy * r0.xy;
	r1.y = (r0.z * r0.x) + -c3.x;
	r1.y = abs(r1.y) + abs(r1.y);
	r0.x = (r0.z * r0.x) + -r1.x;
	oC0.w = (r1.y * r0.x) + r1.x;
	r0.x = (r0.w * -r0.y) + -c2.w;
	r1 = s0_texture.sample(s0, v0.xy);
	r0.y = dot(c6.xyz, r1.xyz);
	r0.y = r0.y + -c3.x;
	oC0.xyz = r0.xxx * r0.yyy;
	#undef c0
	#undef v0
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

