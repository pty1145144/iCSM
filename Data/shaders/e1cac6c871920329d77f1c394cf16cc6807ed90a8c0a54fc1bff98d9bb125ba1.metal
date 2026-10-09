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
	const float4 c1 = float4(-5.000000000e-01, 0.000000000e+00, 3.500000000e+00, 1.000000015e-01); (void) c1;
	const float4 c2 = float4(-5.000000075e-02, 1.052631617e+00, -2.000000000e+00, 3.000000000e+00); (void) c2;
	const float4 c3 = float4(4.000000060e-01, 1.000000000e+00, 5.000000075e-02, 5.000000000e-01); (void) c3;
	const float4 c4 = float4(3.000000119e-01, 5.899999738e-01, 1.099999994e-01, 1.000000000e+00); (void) c4;
	const float4 c5 = float4(4.000000190e-03, 6.000000052e-03, 8.000000380e-03, 1.500000000e+00); (void) c5;
	const float4 c6 = float4(1.000000000e+00, 0.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c6;
	float4 r0;
	float4 r1;
	float4 r2;
	#define c0 uniforms.uniforms_float4[0]
	#define v0 input.v0
	#define oC0 output.oC0
	r0.xy = c1.xx + v0.xy;
	r0.z = dot(r0.xy, r0.xy) + c1.y;
	r0.z = ((r0.z == 0.0) ? FLT_MAX : rsqrt(abs(r0.z)));
	r0.w = ((r0.z == 0.0) ? FLT_MAX : 1.0 / r0.z);
	r0.xy = r0.zz * r0.xy;
	r0.z = r0.w + c2.x;
	r1.x = pow(abs(r0.w), c1.z);
	r1.xy = r0.xy * r1.xx;
	r1.xy = r1.xy * c0.xx;
	r1.xy = (r1.xy * -c1.ww) + v0.xy;
	r0.z = clamp(r0.z * c2.y, 0.0, 1.0);
	r0.w = (r0.z * c2.z) + c2.w;
	r0.z = r0.z * r0.z;
	r0.z = r0.z * r0.w;
	r0.z = ((r0.z == 0.0) ? FLT_MAX : rsqrt(abs(r0.z)));
	r0.z = ((r0.z == 0.0) ? FLT_MAX : 1.0 / r0.z);
	r0.xy = r0.zz * r0.xy;
	r0.xy = r0.xy * c0.xx;
	r0.zw = (r0.xy * -c5.zz) + r1.xy;
	r1 = (r0.xyxy * -c5.xxyy) + r1.xyxy;
	r0 = s0_texture.sample(s0, r0.zw);
	r2 = s0_texture.sample(s0, r1.xy);
	r1 = s0_texture.sample(s0, r1.zw);
	r0.y = r1.y;
	r0.x = r2.x;
	r0.w = dot(r0.xyz, c4.xyz);
	r1.x = pow(abs(r0.w), c5.w);
	r2.x = c0.x;
	r0.w = r2.x * c4.x;
	r2.yzw = mix(r0.xyz, r1.xxx, r0.www);
	r0.x = (r2.x * c3.x) + c3.y;
	r0.xyz = r0.xxx * r2.yzw;
	r0.w = -c1.x + -v0.y;
	r1.x = (r2.x * -c3.z) + c3.w;
	r0.w = -abs(r0.w) + r1.x;
	r0.w = ((r0.w >= 0.0) ? c6.x : c6.y);
	oC0.xyz = r0.www * r0.xyz;
	oC0.w = c4.w;
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

