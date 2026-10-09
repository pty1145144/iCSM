#include <metal_stdlib>
#include <metal_math>
#include <metal_texture>

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
	texture2d<float> s0_texture [[texture(0)]],
	sampler s0 [[sampler(0)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(2.506628274, -0.721347511, 0.0, 1.0); (void) c0;
	const float4 c1 = float4(2.0, 0.0, 0.0, 0.0); (void) c1;
	const int4 i0 = int4(4, 0, 0, 0);
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	#define c9 uniforms.uniforms_float4[0]
	#define c10 uniforms.uniforms_float4[1]
	#define c12 uniforms.uniforms_float4[2]
	#define v0 input.v0
	#define oC0 output.oC0
	r0.x = c0.x;
	r0.x = r0.x * c10.x;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.w = c10.x * c10.x;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = r0.w * c0.y;
	r0.y = exp2(r0.w);
	r0.z = r0.y * r0.y;
	r1 = s0_texture.sample(s0, v0.xy);
	r1 = r0.xxxx * r1;
	r0.yw = r0.yz * r0.xy;
	r2.z = r0.z;
	r3 = r1;
	r2.xy = r0.yw;
	r0.z = r0.x;
	r2.w = c0.w;
	for (int rep1 = 0; rep1 < i0.x; rep1++) {
		r4.xy = (r2.ww * -c9.xy) + v0.xy;
		r5.xy = min(c12.xy, r4.xy);
		r4 = s0_texture.sample(s0, r5.xy);
		r4 = (r4 * r2.xxxx) + r3;
		r5.xy = (r2.ww * c9.xy) + v0.xy;
		r6.xy = min(c12.xy, r5.xy);
		r5 = s0_texture.sample(s0, r6.xy);
		r3 = (r5 * r2.xxxx) + r4;
		r0.z = (r2.x * c1.x) + r0.z;
		r2.xy = r2.yz * r2.xy;
		r2.w = r2.w + c0.w;
	}
	r0.x = ((r0.z == 0.0) ? FLT_MAX : 1.0 / r0.z);
	oC0 = r0.xxxx * r3;
	#undef c9
	#undef c10
	#undef c12
	#undef v0
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

