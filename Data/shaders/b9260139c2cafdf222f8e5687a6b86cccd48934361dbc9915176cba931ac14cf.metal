#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[18];
	bool uniforms_bool[1];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord1)]];
	float4 v2 [[user(texcoord2)]];
	float4 v3 [[user(texcoord3)]];
	float4 v4 [[user(texcoord4)]];
	float4 v5 [[user(texcoord9)]];
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
	const float4 c0 = float4(2.000000000e+00, -1.000000000e+00, 1.000000000e+00, 0.000000000e+00); (void) c0;
	const float4 c2 = float4(1.041666627e+00, -2.083333395e-02, 5.000000000e-01, 0.000000000e+00); (void) c2;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	#define c1 uniforms.uniforms_float4[0]
	#define c12 uniforms.uniforms_float4[1]
	#define c13 uniforms.uniforms_float4[2]
	#define c14 uniforms.uniforms_float4[3]
	#define c15 uniforms.uniforms_float4[4]
	#define c16 uniforms.uniforms_float4[5]
	#define c21 uniforms.uniforms_float4[6]
	#define c29 uniforms.uniforms_float4[7]
	#define c30 uniforms.uniforms_float4[8]
	#define c68 uniforms.uniforms_float4[9]
	#define c71 uniforms.uniforms_float4[10]
	#define c73 uniforms.uniforms_float4[11]
	#define c74 uniforms.uniforms_float4[12]
	#define c77 uniforms.uniforms_float4[13]
	#define c78 uniforms.uniforms_float4[14]
	#define c86 uniforms.uniforms_float4[15]
	#define c87 uniforms.uniforms_float4[16]
	#define c89 uniforms.uniforms_float4[17]
	#define b0 uniforms.uniforms_bool[0]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define oC0 output.oC0
	r0.xyz = v3.xyz;
	r1.xyz = r0.yzx * v2.zxy;
	r0.xyz = (v2.yzx * r0.zxy) + -r1.xyz;
	r0.xyz = r0.xyz * v3.www;
	r1 = s0_texture.sample(s0, v0.xy);
	r2 = s3_texture.sample(s3, v1.xy);
	r2.xyz = (r2.xyz * c0.xxx) + c0.yyy;
	if (b0) {
		r3 = (v4.xyzx * c0.zzzw) + c0.wwwz;
		r4.z = dot(r3, c71);
		r5.x = dot(r3, c73);
		r5.y = dot(r3, c74);
		r5.zw = (r5.xy * c2.xx) + c2.yy;
		r6.xy = clamp(r5.zw, float2(0.0), float2(1.0));
		r5.zw = -r5.zw + r6.xy;
		r0.w = dot(r5.zw, c0.zz) + c0.w;
		r2.w = dot(r3, c77);
		r3.x = dot(r3, c78);
		r6.x = clamp(((-abs(r0.w) >= 0.0) ? r5.x : r2.w), 0.0, 1.0);
		r6.y = clamp(((-abs(r0.w) >= 0.0) ? r5.y : r3.x), 0.0, 1.0);
		r3.xy = c86.xy;
		r3.xy = ((-abs(r0.w) >= 0.0) ? r3.xy : c87.xy);
		r4.xy = (r6.xy * c2.zz) + r3.xy;
		r4.w = c0.w;
		r3 = float4(s15_texture.sample_compare(s15, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
		r3.yzw = -c89.xyz + v4.xyz;
		r0.w = dot(r3.yzw, r3.yzw);
		r0.w = clamp((r0.w * c68.y) + c68.x, 0.0, 1.0);
		r2.w = mix(r3.x, c0.z, r0.w);
	} else {
		r2.w = c0.z;
	}
	r0.xyz = r0.xyz * r2.yyy;
	r0.xyz = (r2.xxx * v3.xyz) + r0.xyz;
	r0.xyz = (r2.zzz * v2.xyz) + r0.xyz;
	r2.xyz = normalize(r0.xyz);
	r0.xyz = c14.xyz + -v4.xyz;
	r3.xyz = normalize(r0.xyz);
	r0.xyz = c13.xyz * v5.xxx;
	r0.w = clamp(dot(r2.xyz, r3.xyz), 0.0, 1.0);
	r0.w = (r0.w * r0.w) + r0.w;
	r0.w = r0.w * c2.z;
	r3 = s9_texture.sample(s9, r0.ww);
	r0.xyz = r0.xyz * r3.xyz;
	r3.xyz = c16.xyz + -v4.xyz;
	r4.xyz = normalize(r3.xyz);
	r3.xyz = c15.xyz * v5.yyy;
	r0.w = clamp(dot(r2.xyz, r4.xyz), 0.0, 1.0);
	r0.w = (r0.w * r0.w) + r0.w;
	r0.w = r0.w * c2.z;
	r4 = s9_texture.sample(s9, r0.ww);
	r2.xyz = r3.xyz * r4.xyz;
	r0.xyz = (r0.xyz * r2.www) + r2.xyz;
	r0.w = clamp(r1.w + c12.x, 0.0, 1.0);
	r2.y = c0.y;
	r2.xyz = r2.yyy + c1.xyz;
	r2.xyz = (r0.www * r2.xyz) + c0.zzz;
	r0.xyz = r0.xyz * r2.xyz;
	r0.xyz = r0.xyz * r1.xyz;
	r0.w = c21.y + -v4.z;
	r0.w = r0.w + -c0.x;
	r0.w = clamp(r0.w * c21.w, 0.0, 1.0);
	r1.x = abs(c12.y);
	oC0.xyz = r0.xyz * c30.xxx;
	r0.x = c29.w * v4.w;
	oC0.w = ((-r1.x >= 0.0) ? r0.w : r0.x);
	#undef c1
	#undef c12
	#undef c13
	#undef c14
	#undef c15
	#undef c16
	#undef c21
	#undef c29
	#undef c30
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

