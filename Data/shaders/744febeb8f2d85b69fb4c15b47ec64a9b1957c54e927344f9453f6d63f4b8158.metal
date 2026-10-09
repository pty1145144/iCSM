#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[15];
	bool uniforms_bool[1];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord1)]];
	float4 v2 [[user(texcoord2), centroid_perspective]];
	float4 v3 [[user(texcoord4)]];
	float4 v4 [[user(color0)]];
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
	texture2d<float> s12_texture [[texture(12)]],
	sampler s12 [[sampler(12)]],
	depth2d<float> s15_texture [[texture(15)]],
	sampler s15 [[sampler(15)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(2.000000000e+00, -1.000000000e+00, 1.000000000e+00, 0.000000000e+00); (void) c0;
	const float4 c1 = float4(1.041666627e+00, -2.083333395e-02, 5.000000000e-01, 0.000000000e+00); (void) c1;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	#define c8 uniforms.uniforms_float4[0]
	#define c11 uniforms.uniforms_float4[1]
	#define c12 uniforms.uniforms_float4[2]
	#define c30 uniforms.uniforms_float4[3]
	#define c31 uniforms.uniforms_float4[4]
	#define c64 uniforms.uniforms_float4[5]
	#define c68 uniforms.uniforms_float4[6]
	#define c71 uniforms.uniforms_float4[7]
	#define c73 uniforms.uniforms_float4[8]
	#define c74 uniforms.uniforms_float4[9]
	#define c77 uniforms.uniforms_float4[10]
	#define c78 uniforms.uniforms_float4[11]
	#define c86 uniforms.uniforms_float4[12]
	#define c87 uniforms.uniforms_float4[13]
	#define c89 uniforms.uniforms_float4[14]
	#define b0 uniforms.uniforms_bool[0]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	r1 = s1_texture.sample(s1, v2.xy);
	r2 = s12_texture.sample(s12, v1.xy);
	r2.xyz = r2.xyz * c8.xyz;
	r2.xyz = (r2.xyz * c0.xxx) + c0.yyy;
	r3.z = c0.z;
	r2.xyz = (c8.www * r2.xyz) + r3.zzz;
	r0.xyz = r0.xyz * r2.xyz;
	r0.xyz = r0.xyz * v4.xyz;
	if (b0) {
		if (-r1.w < c0.w) {
			r2 = (v3.xyzx * c0.zzzw) + c0.wwwz;
			r3.z = dot(r2, c71);
			r4.x = dot(r2, c73);
			r4.y = dot(r2, c74);
			r4.zw = (r4.xy * c1.xx) + c1.yy;
			r5.xy = clamp(r4.zw, float2(0.0), float2(1.0));
			r4.zw = -r4.zw + r5.xy;
			r0.w = dot(r4.zw, c0.zz) + c0.w;
			r4.z = dot(r2, c77);
			r2.x = dot(r2, c78);
			r5.x = clamp(((-abs(r0.w) >= 0.0) ? r4.x : r4.z), 0.0, 1.0);
			r5.y = clamp(((-abs(r0.w) >= 0.0) ? r4.y : r2.x), 0.0, 1.0);
			r2.xy = c86.xy;
			r2.xy = ((-abs(r0.w) >= 0.0) ? r2.xy : c87.xy);
			r3.xy = (r5.xy * c1.zz) + r2.xy;
			r3.w = c0.w;
			r2 = float4(s15_texture.sample_compare(s15, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
			r2.yzw = -c89.xyz + v3.xyz;
			r0.w = dot(r2.yzw, r2.yzw);
			r0.w = clamp((r0.w * c68.y) + c68.x, 0.0, 1.0);
			r3.x = mix(r2.x, c0.z, r0.w);
			r2.xyz = r1.www * c64.xyz;
			r3.yzw = (r1.www * -c64.xyz) + r1.xyz;
			r1.xyz = (r2.xyz * r3.xxx) + r3.yzw;
		}
	}
	r2.xyz = c12.xyz;
	r1.xyz = (r1.xyz * r2.xyz) + c31.xyz;
	r0.xyz = r0.xyz * r1.xyz;
	r0.w = c11.y + -v3.z;
	r0.w = r0.w + -c0.x;
	oC0.w = clamp(r0.w * c11.w, 0.0, 1.0);
	oC0.xyz = r0.xyz * c30.xxx;
	#undef c8
	#undef c11
	#undef c12
	#undef c30
	#undef c31
	#undef c64
	#undef c68
	#undef c71
	#undef c73
	#undef c74
	#undef c77
	#undef c78
	#undef c86
	#undef c87
	#undef c89
	#undef b0
	#undef v0
	#undef v1
	#undef v2
	#undef v3
	#undef v4
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

