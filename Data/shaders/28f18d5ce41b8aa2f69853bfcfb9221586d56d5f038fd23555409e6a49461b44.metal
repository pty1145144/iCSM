#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_relational>
#include <metal_geometric>
#include <metal_graphics>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[1];
};

struct source_main_Input
{
	float4 t0 [[user(texcoord0)]];
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
	const float4 c1 = float4(2.000000030e-01, -5.000000000e-01, 2.000000000e+00, 9.990000129e-01); (void) c1;
	const float4 c2 = float4(-5.000000000e-01, 0.000000000e+00, 1.000000000e+00, 2.000000000e+00); (void) c2;
	const float4 c3 = float4(4.000000000e+00, 8.000000119e-01, 1.666666627e+00, 0.000000000e+00); (void) c3;
	const float4 c4 = float4(-2.000000000e+00, 3.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c4;
	const float4 c5 = float4(1.000000000e+00, -2.000000000e+00, 2.000000000e+00, -1.000000000e+00); (void) c5;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	#define c0 uniforms.uniforms_float4[0]
	#define t0 input.t0
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, t0.xy);
	r1.xy = t0.xy + c2.xx;
	r0.w = dot(r1.xy, r1.xy) + c2.y;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r1.x = (r0.w * -c0.w) + c0.w;
	r0.w = -r0.w + c3.y;
	r0.w = clamp(r0.w * c3.z, 0.0, 1.0);
	r2.xy = (r1.xx * c2.wz) + t0.xy;
	r3.xy = (r1.xx * c5.xy) + t0.xy;
	r4.xy = (r1.xx * -c2.wz) + t0.xy;
	r1.xy = (r1.xx * c5.wz) + t0.xy;
	r2 = s0_texture.sample(s0, r2.xy);
	r3 = s0_texture.sample(s0, r3.xy);
	r1 = s0_texture.sample(s0, r1.xy);
	r4 = s0_texture.sample(s0, r4.xy);
	r1.w = r2.y + r2.x;
	r1.w = r2.z + r1.w;
	r1.w = ((-r1.w >= 0.0) ? c2.z : c2.y);
	r2.w = r3.y + r3.x;
	r2.w = r3.z + r2.w;
	r2.xyz = r2.xyz + r3.xyz;
	r2.w = ((-r2.w >= 0.0) ? c2.z : c2.y);
	r1.w = r1.w + r2.w;
	r2.w = r4.y + r4.x;
	r2.w = r4.z + r2.w;
	r2.xyz = r4.xyz + r2.xyz;
	r2.xyz = r1.xyz + r2.xyz;
	r2.w = ((-r2.w >= 0.0) ? c2.z : c2.y);
	r1.w = r1.w + r2.w;
	r2.w = r1.y + r1.x;
	r2.w = r1.z + r2.w;
	r2.w = ((-r2.w >= 0.0) ? c2.z : c2.y);
	r2.w = r1.w + r2.w;
	r1.x = r0.y + r0.x;
	r1.x = r0.z + r1.x;
	r0.xyz = r0.xyz + r2.xyz;
	r0.xyz = r0.xyz * c1.xxx;
	r1.x = ((-r1.x >= 0.0) ? c2.z : c2.y);
	r1.x = r1.x + r2.w;
	r1.x = (r1.x * c1.x) + c1.y;
	r1.x = abs(r1.x);
	r2 = (r1.xxxx * -c1.zzzz) + c1.wwww;
	r1.x = (r1.x * -c2.w) + c2.z;
	r1.x = r1.x * c3.x;
	r0.xyz = r0.xyz * r1.xxx;
	r0.xyz = r0.xyz * c0.xyz;
	if (any(r2.xyz < float3(0.0))) discard_fragment();
	r1.x = (r0.w * c4.x) + c4.y;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.x;
	r0.xyz = r0.www * r0.xyz;
	r0.w = c2.z;
	oC0 = r0;
	#undef c0
	#undef t0
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

