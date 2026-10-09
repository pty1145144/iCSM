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
	const float4 c0 = float4(-1.125185204e+01, -9.289172173e+00, 3.733000020e-03, 5.339999916e-04); (void) c0;
	const float4 c1 = float4(-3.417910099e+00, 1.377400011e-01, -1.464557052e+00, 2.186769992e-01); (void) c1;
	const float4 c2 = float4(1.227649972e-01, 0.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c2;
	const float4 c5 = float4(-7.329586029e+00, 1.800400019e-02, -5.372685909e+00, 5.992799997e-02); (void) c5;
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
	#define c3 uniforms.uniforms_float4[0]
	#define c4 uniforms.uniforms_float4[1]
	#define t0 input.t0
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, t0.xy);
	r1.xy = c4.xy;
	r2.xy = (r1.xy * c0.yy) + t0.xy;
	r3.xy = (r1.xy * c0.xx) + t0.xy;
	r4.xy = (r1.xy * c5.xx) + t0.xy;
	r5.xy = (r1.xy * c5.zz) + t0.xy;
	r6.xy = (r1.xy * c1.xx) + t0.xy;
	r7.xy = (r1.xy * c1.zz) + t0.xy;
	r8.xy = (r1.xy * -c1.zz) + t0.xy;
	r9.xy = (r1.xy * -c1.xx) + t0.xy;
	r10.xy = (r1.xy * -c5.zz) + t0.xy;
	r11.xy = (r1.xy * -c5.xx) + t0.xy;
	r12.xy = (r1.xy * -c0.yy) + t0.xy;
	r1.xy = (r1.xy * -c0.xx) + t0.xy;
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
	r12 = s0_texture.sample(s0, r12.xy);
	r1 = s0_texture.sample(s0, r1.xy);
	r2 = r2 * c0.zzzz;
	r2 = (r3 * c0.wwww) + r2;
	r2 = (r4 * c5.yyyy) + r2;
	r2 = (r5 * c5.wwww) + r2;
	r2 = (r6 * c1.yyyy) + r2;
	r2 = (r7 * c1.wwww) + r2;
	r0 = (r0 * c2.xxxx) + r2;
	r0 = (r8 * c1.wwww) + r0;
	r0 = (r9 * c1.yyyy) + r0;
	r0 = (r10 * c5.wwww) + r0;
	r0 = (r11 * c5.yyyy) + r0;
	r0 = (r12 * c0.zzzz) + r0;
	r0 = (r1 * c0.wwww) + r0;
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

