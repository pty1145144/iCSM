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
	float4 v2 [[user(texcoord4)]];
	float4 v3 [[user(texcoord6)]];
	float4 v4 [[user(texcoord7)]];
	float4 v5 [[user(texcoord8)]];
};

struct source_main_Output
{
	float4 oC0 [[color(0)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	texture2d<float> s0_texture [[texture(0)]],
	sampler s0 [[sampler(0)]],
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
	texture2d<float> s9_texture [[texture(9)]],
	sampler s9 [[sampler(9)]],
	depth2d<float> s15_texture [[texture(15)]],
	sampler s15 [[sampler(15)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(8.164966106e-01, 5.773502588e-01, 0.000000000e+00, 0.000000000e+00); (void) c0;
	const float4 c2 = float4(-4.082483351e-01, 7.071067691e-01, 5.773502588e-01, 0.000000000e+00); (void) c2;
	const float4 c3 = float4(-4.082482159e-01, -7.071068287e-01, 5.773502588e-01, 0.000000000e+00); (void) c3;
	const float4 c4 = float4(2.000000000e+00, -1.000000000e+00, 1.000000000e+00, 0.000000000e+00); (void) c4;
	const float4 c5 = float4(1.041666627e+00, -2.083333395e-02, 5.000000000e-01, 0.000000000e+00); (void) c5;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	#define c1 uniforms.uniforms_float4[0]
	#define c12 uniforms.uniforms_float4[1]
	#define c20 uniforms.uniforms_float4[2]
	#define c29 uniforms.uniforms_float4[3]
	#define c30 uniforms.uniforms_float4[4]
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
	#define v5 input.v5
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	r1 = s3_texture.sample(s3, v1.xy);
	r1.xyz = (r1.xyz * c4.xxx) + c4.yyy;
	if (b0) {
		r2 = (v2.xyzx * c4.zzzw) + c4.wwwz;
		r3.z = dot(r2, c71);
		r4.x = dot(r2, c73);
		r4.y = dot(r2, c74);
		r4.zw = (r4.xy * c5.xx) + c5.yy;
		r5.xy = clamp(r4.zw, float2(0.0), float2(1.0));
		r4.zw = -r4.zw + r5.xy;
		r1.w = dot(r4.zw, c4.zz) + c4.w;
		r4.z = dot(r2, c77);
		r2.x = dot(r2, c78);
		r5.x = clamp(((-abs(r1.w) >= 0.0) ? r4.x : r4.z), 0.0, 1.0);
		r5.y = clamp(((-abs(r1.w) >= 0.0) ? r4.y : r2.x), 0.0, 1.0);
		r2.xy = c86.xy;
		r2.xy = ((-abs(r1.w) >= 0.0) ? r2.xy : c87.xy);
		r3.xy = (r5.xy * c5.zz) + r2.xy;
		r3.w = c4.w;
		r2 = float4(s15_texture.sample_compare(s15, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
		r2.yzw = -c89.xyz + v2.xyz;
		r1.w = dot(r2.yzw, r2.yzw);
		r1.w = clamp((r1.w * c68.y) + c68.x, 0.0, 1.0);
		r3.x = mix(r2.x, c4.z, r1.w);
	} else {
		r3.x = c4.z;
	}
	r2.x = clamp(dot(r1.xz, c0.xy) + c0.z, 0.0, 1.0);
	r2.y = clamp(dot(r1.xyz, c2.xyz), 0.0, 1.0);
	r2.z = clamp(dot(r1.xyz, c3.xyz), 0.0, 1.0);
	r1.xyz = r2.xyz * r2.xyz;
	r2.xyz = r1.yyy * v4.xyz;
	r2.xyz = (r1.xxx * v3.xyz) + r2.xyz;
	r2.xyz = (r1.zzz * v5.xyz) + r2.xyz;
	r1.w = dot(r1.xyz, c4.zzz);
	if (b0) {
		r2.w = v3.w;
		r2.w = r2.w + v4.w;
		r2.w = r2.w + v5.w;
		r1.y = r1.y * v4.w;
		r1.x = (r1.x * v3.w) + r1.y;
		r1.x = (r1.z * v5.w) + r1.x;
		r1.xyz = r1.xxx * c64.xyz;
		r1.xyz = (r1.xyz * r3.xxx) + r2.xyz;
		r2.xyz = ((-r2.w >= 0.0) ? r2.xyz : r1.xyz);
	}
	r1.x = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.xyz = r1.xxx * r2.xyz;
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r2.x = r1.w * c5.z;
	r2.y = c4.w;
	r2 = s9_texture.sample(s9, r2.xy);
	r1.xyz = r1.xyz * r2.xyz;
	r1.xyz = r1.xyz + r1.xyz;
	r1.w = r0.w + c4.y;
	r2.yz = c4.yz;
	r1.w = (c20.w * r1.w) + r2.z;
	r0.w = clamp(r0.w + c12.x, 0.0, 1.0);
	r2.xyz = r2.yyy + c1.xyz;
	r2.xyz = (r0.www * r2.xyz) + c4.zzz;
	r1.xyz = r1.xyz * r2.xyz;
	r0.w = r1.w * c1.w;
	r0.xyz = r0.xyz * r1.xyz;
	r1.x = abs(c12.y);
	oC0.xyz = r0.xyz * c30.xxx;
	r0.x = c29.w * v2.w;
	oC0.w = ((-r1.x >= 0.0) ? r0.w : r0.x);
	#undef c1
	#undef c12
	#undef c20
	#undef c29
	#undef c30
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
	#undef v5
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

