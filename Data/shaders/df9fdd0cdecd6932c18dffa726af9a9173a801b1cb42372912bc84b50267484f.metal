#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_texture>

using namespace metal;

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
	texture2d<float> s2_texture [[texture(2)]],
	sampler s2 [[sampler(2)]],
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(-0.062499999, -0.5, 1.595800042, 1.164299963); (void) c0;
	const float4 c1 = float4(0.999023439, 0.000488281, 0.0, 1.0); (void) c1;
	const float4 c2 = float4(0.391730013, 2.01699996, 0.812900006, 2.200000047); (void) c2;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	#define v0 input.v0
	#define oC0 output.oC0
	r0.x = clamp(v0.z, 0.0, 1.0);
	r0.x = (r0.x * c1.x) + c1.y;
	r0.y = c1.z;
	r0 = s3_texture.sample(s3, r0.xy);
	r1 = s1_texture.sample(s1, v0.xy);
	r1.x = r1.x + c0.y;
	r1.xy = r1.xx * c2.xy;
	r2 = s0_texture.sample(s0, v0.xy);
	r1.z = r2.x + c0.x;
	r1.x = (r1.z * c0.w) + -r1.x;
	r1.y = (r1.z * c0.w) + r1.y;
	r2.z = pow(abs(r1.y), c2.w);
	r3 = s2_texture.sample(s2, v0.xy);
	r1.y = r3.x + c0.y;
	r1.x = (r1.y * -c2.z) + r1.x;
	r1.y = r1.y * c0.z;
	r1.y = (r1.z * c0.w) + r1.y;
	r2.x = pow(abs(r1.y), c2.w);
	r2.y = pow(abs(r1.x), c2.w);
	r2.w = c1.w;
	oC0 = r0 * r2;
	#undef v0
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

