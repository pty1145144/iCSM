#include <metal_stdlib>
#include <metal_math>
#include <metal_texture>

using namespace metal;

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
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(-0.062499999, -0.5, 1.595800042, 1.164299963); (void) c0;
	const float4 c1 = float4(1.0, 0.0, 0.0, 0.0); (void) c1;
	const float4 c2 = float4(0.391730013, 2.01699996, 0.812900006, 2.200000047); (void) c2;
	float4 r0;
	float4 r1;
	float4 r2;
	#define v0 input.v0
	#define v1 input.v1
	#define oC0 output.oC0
	r0 = s1_texture.sample(s1, v0.xy);
	r0.x = r0.x + c0.y;
	r0.xy = r0.xx * c2.xy;
	r1 = s0_texture.sample(s0, v0.xy);
	r0.z = r1.x + c0.x;
	r0.x = (r0.z * c0.w) + -r0.x;
	r0.y = (r0.z * c0.w) + r0.y;
	r1.z = pow(abs(r0.y), c2.w);
	r2 = s2_texture.sample(s2, v0.xy);
	r0.y = r2.x + c0.y;
	r0.x = (r0.y * -c2.z) + r0.x;
	r0.y = r0.y * c0.z;
	r0.y = (r0.z * c0.w) + r0.y;
	r1.x = pow(abs(r0.y), c2.w);
	r1.y = pow(abs(r0.x), c2.w);
	r1.w = c1.x;
	oC0 = r1 * v1;
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

