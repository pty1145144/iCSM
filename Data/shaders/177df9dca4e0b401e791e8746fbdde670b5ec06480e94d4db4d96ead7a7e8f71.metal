#include <metal_stdlib>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[2];
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
	const float4 c0 = float4(-1.379942062, 0.312325, 0.228005008, 1.379942062); (void) c0;
	const float4 c1 = float4(-5.142348764, -3.241796017, 0.069185004, 0.004486999); (void) c1;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	#define c3 uniforms.uniforms_float4[0]
	#define c4 uniforms.uniforms_float4[1]
	#define t0 input.t0
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, t0.xy);
	r1.xy = c1.xy;
	r2.xy = (c4.xy * r1.yy) + t0.xy;
	r3.xy = (c4.xy * r1.xx) + t0.xy;
	r4.xw = c0.xw;
	r4.xy = (c4.xy * r4.xx) + t0.xy;
	r5.xy = (c4.xy * r4.ww) + t0.xy;
	r6.xy = (c4.xy * -r1.yy) + t0.xy;
	r1.xy = (c4.xy * -r1.xx) + t0.xy;
	r2 = s0_texture.sample(s0, r2.xy);
	r3 = s0_texture.sample(s0, r3.xy);
	r4 = s0_texture.sample(s0, r4.xy);
	r5 = s0_texture.sample(s0, r5.xy);
	r6 = s0_texture.sample(s0, r6.xy);
	r1 = s0_texture.sample(s0, r1.xy);
	r2 = r2 * c1.zzzz;
	r2 = (r3 * c1.wwww) + r2;
	r2 = (r4 * c0.yyyy) + r2;
	r0 = (r0 * c0.zzzz) + r2;
	r0 = (r5 * c0.yyyy) + r0;
	r0 = (r6 * c1.zzzz) + r0;
	r0 = (r1 * c1.wwww) + r0;
	r0.xyz = r0.xyz * c3.xyz;
	oC0 = r0;
	#undef c3
	#undef c4
	#undef t0
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

