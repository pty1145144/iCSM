#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[21];
	bool uniforms_bool[1];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord2), centroid_perspective]];
	float4 v2 [[user(texcoord4)]];
	float4 v3 [[user(color0)]];
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
	depth2d<float> s15_texture [[texture(15)]],
	sampler s15 [[sampler(15)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(0.000000000e+00, 1.000000000e+00, 1.041666627e+00, -2.083333395e-02); (void) c0;
	const float4 c1 = float4(5.000000000e-01, 4.882812500e-04, 0.000000000e+00, -4.882812500e-04); (void) c1;
	const float4 c2 = float4(6.250000000e-02, 1.250000000e-01, 2.500000000e-01, 0.000000000e+00); (void) c2;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	float4 r7;
	float4 r8;
	#define c7 uniforms.uniforms_float4[0]
	#define c10 uniforms.uniforms_float4[1]
	#define c11 uniforms.uniforms_float4[2]
	#define c12 uniforms.uniforms_float4[3]
	#define c29 uniforms.uniforms_float4[4]
	#define c30 uniforms.uniforms_float4[5]
	#define c31 uniforms.uniforms_float4[6]
	#define c64 uniforms.uniforms_float4[7]
	#define c67 uniforms.uniforms_float4[8]
	#define c68 uniforms.uniforms_float4[9]
	#define c69 uniforms.uniforms_float4[10]
	#define c70 uniforms.uniforms_float4[11]
	#define c71 uniforms.uniforms_float4[12]
	#define c73 uniforms.uniforms_float4[13]
	#define c74 uniforms.uniforms_float4[14]
	#define c77 uniforms.uniforms_float4[15]
	#define c78 uniforms.uniforms_float4[16]
	#define c85 uniforms.uniforms_float4[17]
	#define c86 uniforms.uniforms_float4[18]
	#define c87 uniforms.uniforms_float4[19]
	#define c89 uniforms.uniforms_float4[20]
	#define b0 uniforms.uniforms_bool[0]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	r1 = s1_texture.sample(s1, v1.xy);
	r0.xyz = r0.xyz * v3.xyz;
	if (b0) {
		if (-r1.w < c0.x) {
			r2 = (v2.xyzx * c0.yyyx) + c0.xxxy;
			r3.z = dot(r2, c71);
			r4.x = dot(r2, c69);
			r4.y = dot(r2, c70);
			r4.zw = (r4.xy * c0.zz) + c0.ww;
			r5.xy = clamp(r4.zw, float2(0.0), float2(1.0));
			r4.zw = -r4.zw + r5.xy;
			r4.z = dot(r4.zw, c0.yy) + c0.x;
			r5.x = dot(r2, c73);
			r5.y = dot(r2, c74);
			r5.zw = (r5.xy * c0.zz) + c0.ww;
			r6.xy = clamp(r5.zw, float2(0.0), float2(1.0));
			r5.zw = -r5.zw + r6.xy;
			r4.w = dot(r5.zw, c0.yy) + c0.x;
			r5.z = ((-abs(r4.w) >= 0.0) ? c0.y : c0.x);
			r5.w = dot(r2, c77);
			r2.x = dot(r2, c78);
			r6.x = ((-abs(r4.w) >= 0.0) ? r5.x : r5.w);
			r6.y = ((-abs(r4.w) >= 0.0) ? r5.y : r2.x);
			r2.xy = c86.xy;
			r2.xy = ((-abs(r4.w) >= 0.0) ? r2.xy : c87.xy);
			r2.zw = ((-abs(r4.z) >= 0.0) ? r4.xy : r6.xy);
			r2.xy = ((-abs(r4.z) >= 0.0) ? c85.xy : r2.xy);
			r4.x = ((-abs(r4.z) >= 0.0) ? c0.y : r5.z);
			r4.yz = clamp(r2.zw, float2(0.0), float2(1.0));
			r3.xy = (r4.yz * c1.xx) + r2.xy;
			r3.w = c0.x;
			r5 = r3 + c1.yyzz;
			r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
			r6 = r3 + c1.wyzz;
			r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
			r7 = r3 + c1.ywzz;
			r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
			r8 = r3 + c1.wwzz;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r5.y = r6.x;
			r5.z = r7.x;
			r5.w = r8.x;
			r2.x = dot(r5, c2.xxxx);
			r5 = r3 + c1.yzzz;
			r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
			r6 = r3 + c1.wzzz;
			r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
			r7 = r3 + c1.zwzz;
			r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
			r8 = r3 + c1.zyzz;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r5.y = r6.x;
			r5.z = r7.x;
			r5.w = r8.x;
			r2.y = dot(r5, c2.yyyy);
			r3 = float4(s15_texture.sample_compare(s15, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
			r2.x = r2.y + r2.x;
			r2.x = (r3.x * c2.z) + r2.x;
			r2.yz = r2.zw + -c1.xx;
			r2.yz = abs(r2.yz) + -c67.zz;
			r2.yz = clamp(r2.yz * c67.ww, float2(0.0), float2(1.0));
			r2.yz = -r2.yz + c0.yy;
			r2.y = clamp((r2.y * r2.z) + r4.x, 0.0, 1.0);
			r3.x = mix(c0.y, r2.x, r2.y);
			r2.xyz = -c89.xyz + v2.xyz;
			r2.x = dot(r2.xyz, r2.xyz);
			r2.x = clamp((r2.x * c68.y) + c68.x, 0.0, 1.0);
			r4.x = mix(r3.x, c0.y, r2.x);
			r2.xyz = r1.www * c64.xyz;
			r3.xyz = (r1.www * -c64.xyz) + r1.xyz;
			r1.xyz = (r2.xyz * r4.xxx) + r3.xyz;
		}
	}
	r2.xyz = c12.xyz;
	r1.xyz = (r1.xyz * r2.xyz) + c31.xyz;
	r1.xyz = r0.xyz * r1.xyz;
	r0.xyz = (c7.xyz * r0.xyz) + -r1.xyz;
	r0.xyz = (r0.www * r0.xyz) + r1.xyz;
	r1.xyz = c10.xyz + -v2.xyz;
	r0.w = dot(r1.xyz, r1.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = clamp((r0.w * c11.w) + c11.x, 0.0, 1.0);
	r1.x = min(r0.w, c11.z);
	r1.yzw = r0.xyz * c30.xxx;
	r0.w = r1.x * r1.x;
	r1.x = c30.x;
	r0.xyz = (r0.xyz * -r1.xxx) + c29.xyz;
	oC0.xyz = (r0.www * r0.xyz) + r1.yzw;
	oC0.w = v3.w;
	#undef c7
	#undef c10
	#undef c11
	#undef c12
	#undef c29
	#undef c30
	#undef c31
	#undef c64
	#undef c67
	#undef c68
	#undef c69
	#undef c70
	#undef c71
	#undef c73
	#undef c74
	#undef c77
	#undef c78
	#undef c85
	#undef c86
	#undef c87
	#undef c89
	#undef b0
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

