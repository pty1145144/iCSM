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
	const float4 c0 = float4(-11.251852036, -9.289172169, 0.003732999, 0.000533999); (void) c0;
	const float4 c1 = float4(-3.417910098, 0.137739999, -1.464557053, 0.218677); (void) c1;
	const float4 c2 = float4(0.122764997, 0.0, 0.0, 0.0); (void) c2;
	const float4 c3 = float4(-7.329586028, 0.018004, -5.372685912, 0.059928); (void) c3;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	float4 r7;
	float4 r8;
	float4 r9;
	float4 r10;
	float4 r11;
	float4 r12;
	#define c4 uniforms.uniforms_float4[0]
	#define c5 uniforms.uniforms_float4[1]
	#define t0 input.t0
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, t0.xy);
	r0.xy = c4.xy;
	r1.xy = (r0.xy * c0.yy) + t0.xy;
	r2.xy = (r0.xy * c0.xx) + t0.xy;
	r3.xy = (r0.xy * c3.xx) + t0.xy;
	r4.xy = (r0.xy * c3.zz) + t0.xy;
	r5.xy = (r0.xy * c1.xx) + t0.xy;
	r6.xy = (r0.xy * c1.zz) + t0.xy;
	r7.xy = (r0.xy * -c1.zz) + t0.xy;
	r8.xy = (r0.xy * -c1.xx) + t0.xy;
	r9.xy = (r0.xy * -c3.zz) + t0.xy;
	r10.xy = (r0.xy * -c3.xx) + t0.xy;
	r11.xy = (r0.xy * -c0.yy) + t0.xy;
	r0.xy = (r0.xy * -c0.xx) + t0.xy;
	r1 = s0_texture.sample(s0, r1.xy);
	r2 = s0_texture.sample(s0, r2.xy);
	r3 = s0_texture.sample(s0, r3.xy);
	r4 = s0_texture.sample(s0, r4.xy);
	r5 = s0_texture.sample(s0, r5.xy);
	r6 = s0_texture.sample(s0, r6.xy);
	r7 = s0_texture.sample(s0, r7.xy);
	r8 = s0_texture.sample(s0, r8.xy);
	r9 = s0_texture.sample(s0, r9.xy);
	r10 = s0_texture.sample(s0, r10.xy);
	r11 = s0_texture.sample(s0, r11.xy);
	r12 = s0_texture.sample(s0, r0.xy);
	r0.x = r1.w * c0.z;
	r0.x = (r2.w * c0.w) + r0.x;
	r0.x = (r3.w * c3.y) + r0.x;
	r0.x = (r4.w * c3.w) + r0.x;
	r0.x = (r5.w * c1.y) + r0.x;
	r0.x = (r6.w * c1.w) + r0.x;
	r0.x = (r0.w * c2.x) + r0.x;
	r0.x = (r7.w * c1.w) + r0.x;
	r0.x = (r8.w * c1.y) + r0.x;
	r0.x = (r9.w * c3.w) + r0.x;
	r0.x = (r10.w * c3.y) + r0.x;
	r0.x = (r11.w * c0.z) + r0.x;
	r0.w = (r12.w * c0.w) + r0.x;
	r0.xyz = c5.xyz;
	oC0 = r0;
	#undef c4
	#undef c5
	#undef t0
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

