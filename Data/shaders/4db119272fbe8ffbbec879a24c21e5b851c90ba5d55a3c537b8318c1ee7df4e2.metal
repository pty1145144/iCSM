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
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(-1.0, 0.0, -2.0, 4.0); (void) c0;
	const float4 c1 = float4(0.999023439, 0.000488281, 0.0, 0.0); (void) c1;
	float4 r0;
	float4 r1;
	#define c4 uniforms.uniforms_float4[0]
	#define v0 input.v0
	#define oC0 output.oC0
	r0.xy = c0.xy;
	r0.y = dot(v0.zw, c4.xy) + r0.y;
	r0.z = dot(v0.zw, v0.zw) + c0.y;
	r0.x = dot(c4.xy, c4.xy) + r0.x;
	r0.z = r0.x * r0.z;
	r0.yz = r0.yz * c0.zw;
	r0.z = (r0.y * r0.y) + -r0.z;
	r1.x = max(r0.z, c0.y);
	r0.z = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r0.z = ((r0.z == 0.0) ? FLT_MAX : 1.0 / r0.z);
	r0.w = ((-r0.x >= 0.0) ? abs(c0.y) : abs(c0.x));
	r1.x = ((r0.x >= 0.0) ? -abs(c0.y) : -abs(c0.x));
	r0.x = r0.x + r0.x;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.w = r0.w + r1.x;
	r0.y = (r0.w * r0.z) + -r0.y;
	r0.x = clamp(r0.x * r0.y, 0.0, 1.0);
	r0.x = (r0.x * c1.x) + c1.y;
	r0.y = c0.y;
	r0 = s3_texture.sample(s3, r0.xy);
	r1 = s0_texture.sample(s0, v0.xy);
	r1.xyz = r1.www * r1.xyz;
	oC0 = r0 * r1;
	#undef c4
	#undef v0
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

