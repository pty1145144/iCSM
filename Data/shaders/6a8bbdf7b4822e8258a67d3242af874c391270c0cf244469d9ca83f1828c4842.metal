#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
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
	const float4 c0 = float4(0.000000000e+00, 1.000000000e+00, -5.000000000e-01, 5.000000000e-01); (void) c0;
	const float4 c1 = float4(-2.000000000e+00, 4.000000000e+00, 9.990234375e-01, 4.882812500e-04); (void) c1;
	float4 r0;
	float4 r1;
	float4 r2;
	#define c4 uniforms.uniforms_float4[0]
	#define c5 uniforms.uniforms_float4[1]
	#define v0 input.v0
	#define oC0 output.oC0
	r0 = c0;
	r0.x = dot(v0.zw, c4.xy) + r0.x;
	r0.x = r0.x * c1.x;
	r1.x = dot(v0.zw, v0.zw) + c0.x;
	r1.y = dot(c4.xy, c4.xy) + -r0.y;
	r1.x = r1.y * r1.x;
	r1.x = r1.x * c1.y;
	r1.x = (r0.x * r0.x) + -r1.x;
	r2.x = max(r1.x, c0.x);
	r1.x = ((r2.x == 0.0) ? FLT_MAX : rsqrt(abs(r2.x)));
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.z = ((-r1.y >= 0.0) ? c0.x : c0.y);
	r1.w = ((r1.y >= 0.0) ? -c0.x : -c0.y);
	r1.yz = r1.yw + r1.yz;
	r1.y = ((r1.y == 0.0) ? FLT_MAX : 1.0 / r1.y);
	r0.x = (r1.z * r1.x) + -r0.x;
	r0.x = clamp(r1.y * r0.x, 0.0, 1.0);
	r1.x = (r0.x * c1.z) + c1.w;
	r1.y = c0.x;
	r1 = s3_texture.sample(s3, r1.xy);
	r0.x = r0.y + -c5.w;
	r0.x = ((r0.x >= 0.0) ? c0.x : c0.y);
	r2 = s0_texture.sample(s0, v0.xy);
	r0.y = ((-r2.w >= 0.0) ? c0.x : c0.y);
	r0.x = r0.x + r0.y;
	r0.y = (r2.w * c5.z) + r0.z;
	r0.y = (c5.w * r0.y) + r0.w;
	r0.z = r2.w * c5.z;
	r2.xyz = ((-r0.x >= 0.0) ? r0.zzz : r0.yyy);
	oC0 = r1 * r2;
	#undef c4
	#undef c5
	#undef v0
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

