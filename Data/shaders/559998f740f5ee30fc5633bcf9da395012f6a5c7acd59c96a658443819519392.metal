#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[6];
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
	texture2d<float> s1_texture [[texture(1)]],
	sampler s1 [[sampler(1)]],
	texture3d<float> s2_texture [[texture(2)]],
	sampler s2 [[sampler(2)]],
	texture3d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
	texture3d<float> s4_texture [[texture(4)]],
	sampler s4 [[sampler(4)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(0.298999992, 0.587000012, 0.114, 0.0); (void) c0;
	const float4 c1 = float4(2.0, -1.0, -2.0, 3.0); (void) c1;
	const float4 c2 = float4(0.5, 0.968750001, 0.015625, 0.0); (void) c2;
	const float4 c6 = float4(0.0, 0.0, -1.0, 1.0); (void) c6;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	#define c3 uniforms.uniforms_float4[0]
	#define c4 uniforms.uniforms_float4[1]
	#define c5 uniforms.uniforms_float4[2]
	#define c8 uniforms.uniforms_float4[3]
	#define c9 uniforms.uniforms_float4[4]
	#define c10 uniforms.uniforms_float4[5]
	#define v0 input.v0
	#define oC0 output.oC0
	r0.xy = (v0.zw * c1.xx) + c1.yy;
	r0.x = dot(r0.xy, r0.xy) + c0.w;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = r0.x + -c9.x;
	r0.y = -c9.x + c9.y;
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r0.x = clamp(r0.y * r0.x, 0.0, 1.0);
	r0.y = (r0.x * c1.z) + c1.w;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r0.y;
	r0.y = r0.x * c8.z;
	r0.z = c9.z;
	r1.x = mix(c8.x, r0.z, r0.x);
	r0.xz = ((r1.x >= 0.0) ? c6.xy : c6.zw);
	r2 = s1_texture.sample(s1, v0.xy);
	r0.w = dot(r2.xyz, c0.xyz);
	r3 = s0_texture.sample(s0, v0.zw);
	r0.w = r0.w + -r3.w;
	r0.z = (r1.x * r0.w) + r0.z;
	r0.w = r0.w * r1.x;
	r0.x = ((r0.z >= 0.0) ? r0.w : r0.x);
	r0.xzw = r0.xxx + r2.xyz;
	r1.xyz = mix(r0.xzw, r3.www, r0.yyy);
	r0.xyz = r3.xyz * c5.xxx;
	r0.xyz = (r0.xyz * c2.xxx) + r1.xyz;
	r1.xyz = (r0.xyz * c2.yyy) + c2.zzz;
	r2 = s2_texture.sample(s2, r1.xyz);
	r2.xyz = r2.xyz * c4.xxx;
	r0.xyz = (r0.xyz * c3.xxx) + r2.xyz;
	r2 = s3_texture.sample(s3, r1.xyz);
	r1 = s4_texture.sample(s4, r1.xyz);
	r0.xyz = (r2.xyz * c4.yyy) + r0.xyz;
	r0.xyz = (r1.xyz * c4.zzz) + r0.xyz;
	oC0.xyz = (c10.xxx * -r0.xyz) + r0.xyz;
	oC0.w = -c1.y;
	#undef c3
	#undef c4
	#undef c5
	#undef c8
	#undef c9
	#undef c10
	#undef v0
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

