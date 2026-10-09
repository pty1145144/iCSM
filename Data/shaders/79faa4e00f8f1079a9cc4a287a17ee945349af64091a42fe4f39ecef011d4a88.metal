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
	const float4 c1 = float4(12.920000075, 0.416666656, 1.054999947, -0.055); (void) c1;
	const float4 c2 = float4(0.0031308, 0.25, 0.0, 0.0); (void) c2;
	const float4 c3 = float4(0.298999992, 0.587000012, 0.114, 0.0); (void) c3;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
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
	r0.xyz = clamp(r0.xyz, float3(0.0), float3(1.0));
	r4.x = log2(r0.x);
	r4.y = log2(r0.y);
	r4.z = log2(r0.z);
	r4.xyz = r4.xyz * c1.yyy;
	r5.x = exp2(r4.x);
	r5.y = exp2(r4.y);
	r5.z = exp2(r4.z);
	r4.xyz = (r5.xyz * c1.zzz) + c1.www;
	r0.w = -r0.x + c2.x;
	r5.xyz = r0.xyz * c1.xxx;
	r6.x = ((r0.w >= 0.0) ? r5.x : r4.x);
	r1.w = -r0.y + c2.x;
	r2.w = -r0.z + c2.x;
	r6.z = ((r2.w >= 0.0) ? r5.z : r4.z);
	r6.y = ((r1.w >= 0.0) ? r5.y : r4.y);
	r1.xyz = clamp(r1.xyz, float3(0.0), float3(1.0));
	r0.x = log2(r1.x);
	r0.y = log2(r1.y);
	r0.z = log2(r1.z);
	r0.xyz = r0.xyz * c1.yyy;
	r4.x = exp2(r0.x);
	r4.y = exp2(r0.y);
	r4.z = exp2(r0.z);
	r0.xyz = (r4.xyz * c1.zzz) + c1.www;
	r0.w = -r1.x + c2.x;
	r4.xyz = r1.xyz * c1.xxx;
	r5.x = ((r0.w >= 0.0) ? r4.x : r0.x);
	r2.w = -r1.y + c2.x;
	r3.w = -r1.z + c2.x;
	r5.z = ((r3.w >= 0.0) ? r4.z : r0.z);
	r5.y = ((r2.w >= 0.0) ? r4.y : r0.y);
	r0.xyz = r5.xyz + r6.xyz;
	r2.xyz = clamp(r2.xyz, float3(0.0), float3(1.0));
	r1.x = log2(r2.x);
	r1.y = log2(r2.y);
	r1.z = log2(r2.z);
	r1.xyz = r1.xyz * c1.yyy;
	r4.x = exp2(r1.x);
	r4.y = exp2(r1.y);
	r4.z = exp2(r1.z);
	r1.xyz = (r4.xyz * c1.zzz) + c1.www;
	r0.w = -r2.x + c2.x;
	r4.xyz = r2.xyz * c1.xxx;
	r5.x = ((r0.w >= 0.0) ? r4.x : r1.x);
	r0.w = -r2.y + c2.x;
	r3.w = -r2.z + c2.x;
	r5.z = ((r3.w >= 0.0) ? r4.z : r1.z);
	r5.y = ((r0.w >= 0.0) ? r4.y : r1.y);
	r0.xyz = r0.xyz + r5.xyz;
	r3.xyz = clamp(r3.xyz, float3(0.0), float3(1.0));
	r1.x = log2(r3.x);
	r1.y = log2(r3.y);
	r1.z = log2(r3.z);
	r1.xyz = r1.xyz * c1.yyy;
	r2.x = exp2(r1.x);
	r2.y = exp2(r1.y);
	r2.z = exp2(r1.z);
	r1.xyz = (r2.xyz * c1.zzz) + c1.www;
	r0.w = -r3.x + c2.x;
	r2.xyz = r3.xyz * c1.xxx;
	r4.x = ((r0.w >= 0.0) ? r2.x : r1.x);
	r0.w = -r3.y + c2.x;
	r4.w = -r3.z + c2.x;
	r4.z = ((r4.w >= 0.0) ? r2.z : r1.z);
	r4.y = ((r0.w >= 0.0) ? r2.y : r1.y);
	r0.xyz = r0.xyz + r4.xyz;
	r0.xyz = r0.xyz * c2.yyy;
	r1.x = log2(r0.x);
	r1.y = log2(r0.y);
	r1.z = log2(r0.z);
	r1.xyz = r1.xyz * c0.www;
	r2.x = exp2(r1.x);
	r2.y = exp2(r1.y);
	r2.z = exp2(r1.z);
	r0.w = dot(r0.xyz, c0.xyz);
	r1.w = dot(r0.xyz, c3.xyz);
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

