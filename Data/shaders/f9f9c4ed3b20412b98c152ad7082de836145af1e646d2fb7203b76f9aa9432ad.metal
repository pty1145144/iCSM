#include <metal_stdlib>
#include <metal_common>
#include <metal_relational>
#include <metal_geometric>
#include <metal_graphics>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[14];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord2)]];
	float4 v2 [[user(texcoord3)]];
	float4 v3 [[user(texcoord4)]];
};

struct source_main_Output
{
	float4 oC0 [[color(0)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	texture2d<float> s0_texture [[texture(0)]],
	sampler s0 [[sampler(0)]],
	texture2d<float> s1_texture [[texture(1)]],
	sampler s1 [[sampler(1)]],
	texture2d<float> s4_texture [[texture(4)]],
	sampler s4 [[sampler(4)]],
	texture2d<float> s9_texture [[texture(9)]],
	sampler s9 [[sampler(9)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c2 = float4(0.0, 1.0, 0.5, -0.02); (void) c2;
	const float4 c3 = float4(0.700000011, 0.349999993, 25.0, 0.0); (void) c3;
	const float4 c11 = float4(-2.0, 3.0, 0.0, 0.0); (void) c11;
	const float4 c12 = float4(1.0, -0.100000001, 0.999000014, -0.001); (void) c12;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c4 uniforms.uniforms_float4[2]
	#define c5 uniforms.uniforms_float4[3]
	#define c6 uniforms.uniforms_float4[4]
	#define c7 uniforms.uniforms_float4[5]
	#define c8 uniforms.uniforms_float4[6]
	#define c9 uniforms.uniforms_float4[7]
	#define c10 uniforms.uniforms_float4[8]
	#define c20 uniforms.uniforms_float4[9]
	#define c21 uniforms.uniforms_float4[10]
	#define c22 uniforms.uniforms_float4[11]
	#define c23 uniforms.uniforms_float4[12]
	#define c30 uniforms.uniforms_float4[13]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define oC0 output.oC0
	r0.xy = clamp(v0.zw, float2(0.0), float2(1.0));
	r0 = s0_texture.sample(s0, r0.xy);
	r1.x = r0.w + c12.y;
	r2 = ((r1.x >= 0.0) ? c12.zzzz : c12.wwww);
	if (any(r2.xyz < float3(0.0))) discard_fragment();
	r0.w = -r0.w + c12.x;
	r0.xyz = r0.xyz * c10.xyz;
	r0.w = (c0.w * -r0.w) + c0.z;
	r1.y = clamp(r0.w + -c0.y, 0.0, 1.0);
	r0.w = r0.w + c2.w;
	r1.y = r1.y + c2.w;
	r1.zw = c2.zz * v0.xy;
	r2 = s4_texture.sample(s4, r1.zw);
	r3 = s1_texture.sample(s1, v0.xy);
	r1.z = r3.y * r3.x;
	r1.z = (r1.z * -r2.y) + c12.x;
	r1.y = -r1.y + r1.z;
	r0.w = -r0.w + r1.z;
	r0.w = clamp(r0.w * c3.z, 0.0, 1.0);
	r1.y = clamp(r1.y * c3.z, 0.0, 1.0);
	r1.z = (r1.y * c11.x) + c11.y;
	r1.y = r1.y * r1.y;
	r1.y = r1.y * r1.z;
	oC0.w = ((r1.x >= 0.0) ? r1.y : c2.x);
	r1.x = (r0.w * c11.x) + c11.y;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.x;
	r1.xy = c1.ww * v0.zw;
	r1 = s9_texture.sample(s9, r1.xy);
	r2.xyz = (r0.xyz * r1.xyz) + -r0.xyz;
	r3.x = c0.x;
	r3.xw = r3.xx * c3.xy;
	r0.xyz = (r3.xxx * r2.xyz) + r0.xyz;
	r2.xyz = mix(r1.xyz, r0.xyz, r0.www);
	r0.xyz = normalize(v3.xyz);
	r1.x = ((r0.x >= 0.0) ? c2.x : c2.y);
	r1.y = ((r0.y >= 0.0) ? c2.x : c2.y);
	r1.z = ((r0.z >= 0.0) ? c2.x : c2.y);
	r4.xyz = r0.xyz * r0.xyz;
	r1.xyz = r1.xyz * r4.xyz;
	r5.xyz = r1.xxx * c5.xyz;
	r6.x = ((r0.x >= 0.0) ? c2.y : c2.x);
	r6.y = ((r0.y >= 0.0) ? c2.y : c2.x);
	r6.z = ((r0.z >= 0.0) ? c2.y : c2.x);
	r4.xyz = r4.xyz * r6.xyz;
	r5.xyz = (r4.xxx * c4.xyz) + r5.xyz;
	r4.xyw = (r4.yyy * c6.xyz) + r5.xyz;
	r1.xyw = (r1.yyy * c7.xyz) + r4.xyw;
	r1.xyw = (r4.zzz * c8.xyz) + r1.xyw;
	r1.xyz = (r1.zzz * c9.xyz) + r1.xyw;
	r4.xyz = c20.xyz * v1.xxx;
	r5.xyz = c21.xyz + -v2.xyz;
	r6.xyz = normalize(r5.xyz);
	r0.w = clamp(dot(r0.xyz, r6.xyz), 0.0, 1.0);
	r0.w = (r0.w * r0.w) + r0.w;
	r0.w = r0.w * c2.z;
	r1.xyz = (r4.xyz * r0.www) + r1.xyz;
	r4.xyz = c22.xyz * v1.yyy;
	r5.xyz = c23.xyz + -v2.xyz;
	r6.xyz = normalize(r5.xyz);
	r0.x = clamp(dot(r0.xyz, r6.xyz), 0.0, 1.0);
	r0.x = (r0.x * r0.x) + r0.x;
	r0.x = r0.x * c2.z;
	r0.xyz = (r4.xyz * r0.xxx) + r1.xyz;
	r0.xyz = r0.xyz * r2.xyz;
	r0.w = mix(c12.x, r3.z, r3.w);
	r0.xyz = r0.www * r0.xyz;
	r0.xyz = r3.yyy * r0.xyz;
	oC0.xyz = r0.xyz * c30.xxx;
	#undef c0
	#undef c1
	#undef c4
	#undef c5
	#undef c6
	#undef c7
	#undef c8
	#undef c9
	#undef c10
	#undef c20
	#undef c21
	#undef c22
	#undef c23
	#undef c30
	#undef v0
	#undef v1
	#undef v2
	#undef v3
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

