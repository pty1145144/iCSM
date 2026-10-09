#include <metal_stdlib>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[3];
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
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c3 = float4(0.0, 1.0, 0.0, 0.0); (void) c3;
	float4 r0;
	float4 r1;
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c2 uniforms.uniforms_float4[2]
	#define v0 input.v0
	#define oC0 output.oC0
	r0.xy = -c0.xy + v0.xy;
	r0.x = dot(r0.xy, r0.xy) + c3.x;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r1.xy = c3.xy;
	r0.x = (r0.x * -c0.z) + r1.y;
	r0.x = r0.x * c0.w;
	oC0.x = ((-c0.z >= 0.0) ? r1.x : r0.x);
	r0.xy = -c1.xy + v0.xy;
	r0.x = dot(r0.xy, r0.xy) + c3.x;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = (r0.x * -c1.z) + r1.y;
	r0.x = r0.x * c1.w;
	oC0.y = ((-c1.z >= 0.0) ? r1.x : r0.x);
	r0.xy = -c2.xy + v0.xy;
	r0.x = dot(r0.xy, r0.xy) + c3.x;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = (r0.x * -c2.z) + r1.y;
	r0.x = r0.x * c2.w;
	oC0.z = ((-c2.z >= 0.0) ? r1.x : r0.x);
	oC0.w = c3.y;
	#undef c0
	#undef c1
	#undef c2
	#undef v0
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

