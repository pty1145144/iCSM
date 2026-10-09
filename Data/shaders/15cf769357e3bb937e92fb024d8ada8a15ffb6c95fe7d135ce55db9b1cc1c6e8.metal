#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[1];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord2)]];
};

struct source_main_Output
{
	float4 oC0 [[color(0)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(-5.000000000e-01, 0.000000000e+00, -9.800000191e-01, 5.000000000e-01); (void) c0;
	const float4 c1 = float4(-4.900000095e-01, 1.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c1;
	float4 r0;
	float4 r1;
	#define c11 uniforms.uniforms_float4[0]
	#define v0 input.v0
	#define v1 input.v1
	#define oC0 output.oC0
	r0.y = c0.y;
	r1.x = max(c11.x, r0.y);
	r0.x = r1.x + c0.z;
	r0.y = r1.x * c0.w;
	r0.x = ((r0.x >= 0.0) ? c1.x : -r0.y);
	r0.y = r0.x + c0.w;
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r0.zw = c0.xx + v0.xy;
	r0.z = dot(r0.zw, r0.zw) + c0.y;
	r0.z = ((r0.z == 0.0) ? FLT_MAX : rsqrt(abs(r0.z)));
	r0.z = ((r0.z == 0.0) ? FLT_MAX : 1.0 / r0.z);
	r0.x = r0.x + r0.z;
	r0.y = clamp((r0.x * -r0.y) + c1.y, 0.0, 1.0);
	r0.x = ((r0.x >= 0.0) ? r0.y : c1.y);
	r0.yzw = v1.www * v1.xyz;
	oC0.xyz = r0.xxx * r0.yzw;
	oC0.w = r0.x * v1.w;
	#undef c11
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

