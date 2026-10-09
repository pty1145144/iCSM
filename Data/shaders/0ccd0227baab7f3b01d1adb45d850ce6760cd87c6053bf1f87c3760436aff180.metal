#include <metal_stdlib>
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
	float4 t0 [[user(texcoord0)]];
	float4 t1 [[user(texcoord1)]];
	float4 t2 [[user(texcoord2)]];
	float4 t3 [[user(texcoord3)]];
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
	const float4 c1 = float4(0.25, 0.114, 0.587000012, 0.298999992); (void) c1;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	#define c0 uniforms.uniforms_float4[0]
	#define t0 input.t0
	#define t1 input.t1
	#define t2 input.t2
	#define t3 input.t3
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, t0.xy);
	r1 = s0_texture.sample(s0, t1.xy);
	r2 = s0_texture.sample(s0, t2.xy);
	r3 = s0_texture.sample(s0, t3.xy);
	r0.xyz = r0.xyz + r1.xyz;
	r0.xyz = r2.xyz + r0.xyz;
	r0.xyz = r3.xyz + r0.xyz;
	r0.xyz = r0.xyz * c1.xxx;
	r1.x = log2(r0.x);
	r1.y = log2(r0.y);
	r1.z = log2(r0.z);
	r1.xyz = r1.xyz * c0.www;
	r2.x = exp2(r1.x);
	r2.y = exp2(r1.y);
	r2.z = exp2(r1.z);
	r0.w = dot(r0.xyz, c0.xyz);
	r1.w = dot(r0.xyz, c1.wzy);
	r1.xyz = r0.www * r2.xyz;
	oC0 = r1;
	#undef c0
	#undef t0
	#undef t1
	#undef t2
	#undef t3
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

