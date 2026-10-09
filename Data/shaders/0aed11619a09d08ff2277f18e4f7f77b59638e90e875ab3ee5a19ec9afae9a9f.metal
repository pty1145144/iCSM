#include <metal_stdlib>
#include <metal_common>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[4];
};

struct source_main_Input
{
	float4 t0 [[user(texcoord0)]];
	float4 t1 [[user(texcoord1)]];
	float4 t2 [[user(texcoord2)]];
	float4 t3 [[user(texcoord3)]];
	float4 t4 [[user(texcoord4)]];
	float4 t5 [[user(texcoord5)]];
	float4 t6 [[user(texcoord6)]];
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
	const float4 c4 = float4(0.218500004, 0.201299995, 0.082099996, 0.046100001); (void) c4;
	const float4 c5 = float4(0.0262, 0.0162, 0.0102, 0.0); (void) c5;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c2 uniforms.uniforms_float4[2]
	#define c3 uniforms.uniforms_float4[3]
	#define t0 input.t0
	#define t1 input.t1
	#define t2 input.t2
	#define t3 input.t3
	#define t4 input.t4
	#define t5 input.t5
	#define t6 input.t6
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, t1.xy);
	r1 = s0_texture.sample(s0, t4.xy);
	r2 = s0_texture.sample(s0, t0.xy);
	r3 = s0_texture.sample(s0, t2.xy);
	r4 = s0_texture.sample(s0, t5.xy);
	r5 = s0_texture.sample(s0, t3.xy);
	r6 = s0_texture.sample(s0, t6.xy);
	r0 = clamp(r0, float4(0.0), float4(1.0));
	r1 = clamp(r1, float4(0.0), float4(1.0));
	r0 = r0 + r1;
	r0 = r0 * c4.xxxx;
	r2 = clamp(r2, float4(0.0), float4(1.0));
	r0 = (r2 * c4.yyyy) + r0;
	r3 = clamp(r3, float4(0.0), float4(1.0));
	r4 = clamp(r4, float4(0.0), float4(1.0));
	r1 = r3 + r4;
	r0 = (r1 * c4.zzzz) + r0;
	r5 = clamp(r5, float4(0.0), float4(1.0));
	r6 = clamp(r6, float4(0.0), float4(1.0));
	r1 = r5 + r6;
	r0 = (r1 * c4.wwww) + r0;
	r1.xy = t0.xy + c0.xy;
	r2.xy = t0.xy + -c0.xy;
	r3.xy = t0.xy + c1.xy;
	r4.xy = t0.xy + -c1.xy;
	r5.xy = t0.xy + c2.xy;
	r6.xy = t0.xy + -c2.xy;
	r1 = s0_texture.sample(s0, r1.xy);
	r2 = s0_texture.sample(s0, r2.xy);
	r3 = s0_texture.sample(s0, r3.xy);
	r4 = s0_texture.sample(s0, r4.xy);
	r5 = s0_texture.sample(s0, r5.xy);
	r6 = s0_texture.sample(s0, r6.xy);
	r1 = clamp(r1, float4(0.0), float4(1.0));
	r2 = clamp(r2, float4(0.0), float4(1.0));
	r1 = r1 + r2;
	r0 = (r1 * c5.xxxx) + r0;
	r3 = clamp(r3, float4(0.0), float4(1.0));
	r4 = clamp(r4, float4(0.0), float4(1.0));
	r1 = r3 + r4;
	r0 = (r1 * c5.yyyy) + r0;
	r5 = clamp(r5, float4(0.0), float4(1.0));
	r6 = clamp(r6, float4(0.0), float4(1.0));
	r1 = r5 + r6;
	r0 = (r1 * c5.zzzz) + r0;
	r0.xyz = r0.xyz * c3.xyz;
	oC0 = r0;
	#undef c0
	#undef c1
	#undef c2
	#undef c3
	#undef t0
	#undef t1
	#undef t2
	#undef t3
	#undef t4
	#undef t5
	#undef t6
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

