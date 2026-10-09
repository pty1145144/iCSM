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
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c1 = float4(-1.0, -1.111111164, -2.0, 3.0); (void) c1;
	const float4 c2 = float4(-0.0001, 0.0001, 0.001, 0.999000014); (void) c2;
	const float4 c3 = float4(-0.5, 0.0, 0.001, -0.001); (void) c3;
	const float4 c4 = float4(1000.0, 500.0, 0.002, 333.333343505); (void) c4;
	const float4 c5 = float4(0.003, 143.239456177, 0.5, 0.300000011); (void) c5;
	const float4 c6 = float4(6.283185478, -3.141592739, 1.299999949, 1.200000047); (void) c6;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	#define c0 uniforms.uniforms_float4[0]
	#define v0 input.v0
	#define oC0 output.oC0
	r0.x = c1.x;
	r0.x = r0.x + c0.z;
	r0.x = clamp(r0.x * c1.y, 0.0, 1.0);
	r0.y = (r0.x * c1.z) + c1.w;
	r0.x = r0.x * r0.x;
	r0.z = r0.x * r0.y;
	r0.x = (r0.y * r0.x) + c2.x;
	r0.z = clamp(r0.z, 0.0, 1.0);
	r0.x = ((r0.x >= 0.0) ? r0.z : c2.y);
	r0.x = r0.x * c0.x;
	r0.y = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.yz = r0.yy * v0.xy;
	r1.xy = fract(abs(r0.yz));
	r0.y = ((r0.y >= 0.0) ? r1.x : -r1.x);
	r0.z = ((r0.z >= 0.0) ? r1.y : -r1.y);
	r0.xy = (r0.yz * -r0.xx) + v0.xy;
	r1.xy = max(r0.xy, c2.zz);
	r0.xy = min(r1.xy, c2.ww);
	r0.zw = r0.xy + c3.xx;
	r0.z = dot(r0.zw, r0.zw) + c3.y;
	r0.z = ((r0.z == 0.0) ? FLT_MAX : rsqrt(abs(r0.z)));
	r0.z = ((r0.z == 0.0) ? FLT_MAX : 1.0 / r0.z);
	r1.xy = (r0.zz * c3.zw) + r0.xy;
	r2 = (r0.zzzz * c3.zzwz) + r0.xyxy;
	r0.x = (r0.y * c5.y) + c5.z;
	r0.x = fract(r0.x);
	r0.x = (r0.x * c6.x) + c6.y;
	r3.y = sin(r0.x);
	r0.x = r3.y * c5.w;
	r0.x = abs(r0.x) + c6.z;
	r1 = s0_texture.sample(s0, r1.xy);
	r0.y = r1.z * c4.w;
	r0.y = fract(abs(r0.y));
	r0.y = ((r1.z >= 0.0) ? r0.y : -r0.y);
	r1.z = (r0.y * -c5.x) + r1.z;
	r3 = s0_texture.sample(s0, r2.xy);
	r2 = s0_texture.sample(s0, r2.zw);
	r0.y = r3.x * c4.x;
	r0.y = fract(abs(r0.y));
	r0.y = ((r3.x >= 0.0) ? r0.y : -r0.y);
	r1.x = (r0.y * -c2.z) + r3.x;
	r0.y = r2.y * c4.y;
	r0.y = fract(abs(r0.y));
	r0.y = ((r2.y >= 0.0) ? r0.y : -r0.y);
	r1.y = (r0.y * -c4.z) + r2.y;
	r1.w = -c1.x;
	r0 = r0.xxxx * r1;
	r1.x = c0.z * c0.z;
	r1.x = r1.x * c6.w;
	oC0 = r0 * r1.xxxx;
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

