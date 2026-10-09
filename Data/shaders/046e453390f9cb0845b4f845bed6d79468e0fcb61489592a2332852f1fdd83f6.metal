#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[17];
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
	const float4 c0 = float4(0.0, 0.212500005, 0.71539998, 0.072099998); (void) c0;
	const float4 c1 = float4(1.0, 0.0, 1.041666626, -0.020833333); (void) c1;
	const float4 c2 = float4(0.5, 0.000488281, 0.0, -0.000488281); (void) c2;
	const float4 c3 = float4(0.062499999, 0.125, 0.25, -2.0); (void) c3;
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
	#define c11 uniforms.uniforms_float4[0]
	#define c12 uniforms.uniforms_float4[1]
	#define c30 uniforms.uniforms_float4[2]
	#define c31 uniforms.uniforms_float4[3]
	#define c67 uniforms.uniforms_float4[4]
	#define c68 uniforms.uniforms_float4[5]
	#define c69 uniforms.uniforms_float4[6]
	#define c70 uniforms.uniforms_float4[7]
	#define c71 uniforms.uniforms_float4[8]
	#define c73 uniforms.uniforms_float4[9]
	#define c74 uniforms.uniforms_float4[10]
	#define c77 uniforms.uniforms_float4[11]
	#define c78 uniforms.uniforms_float4[12]
	#define c85 uniforms.uniforms_float4[13]
	#define c86 uniforms.uniforms_float4[14]
	#define c87 uniforms.uniforms_float4[15]
	#define c89 uniforms.uniforms_float4[16]
	#define b0 uniforms.uniforms_bool[0]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	r1 = s1_texture.sample(s1, v1.xy);
	r2.xyz = r0.xyz * v3.xyz;
	r3.xyz = r1.xyz * c12.xyz;
	if (b0) {
		if (-r1.w < c0.x) {
			r1.x = dot(r1.xyz, c0.yzw);
			r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
			r1.x = r1.x * r1.w;
			r4 = (v2.xyzx * c1.xxxy) + c1.yyyx;
			r5.z = dot(r4, c71);
			r6.x = dot(r4, c69);
			r6.y = dot(r4, c70);
			r1.yz = (r6.xy * c1.zz) + c1.ww;
			r6.zw = clamp(r1.yz, float2(0.0), float2(1.0));
			r1.yz = -r1.yz + r6.zw;
			r1.y = dot(r1.yz, c1.xx) + c1.y;
			r7.x = dot(r4, c73);
			r7.y = dot(r4, c74);
			r1.zw = (r7.xy * c1.zz) + c1.ww;
			r6.zw = clamp(r1.zw, float2(0.0), float2(1.0));
			r1.zw = -r1.zw + r6.zw;
			r1.z = dot(r1.zw, c1.xx) + c1.y;
			r1.w = ((-abs(r1.z) >= 0.0) ? c1.x : c1.y);
			r2.w = dot(r4, c77);
			r3.w = dot(r4, c78);
			r4.x = ((-abs(r1.z) >= 0.0) ? r7.x : r2.w);
			r4.y = ((-abs(r1.z) >= 0.0) ? r7.y : r3.w);
			r7.xy = c86.xy;
			r4.zw = ((-abs(r1.z) >= 0.0) ? r7.xy : c87.xy);
			r4.xy = ((-abs(r1.y) >= 0.0) ? r6.xy : r4.xy);
			r4.zw = ((-abs(r1.y) >= 0.0) ? c85.xy : r4.zw);
			r1.y = ((-abs(r1.y) >= 0.0) ? c1.x : r1.w);
			r1.zw = clamp(r4.xy, float2(0.0), float2(1.0));
			r5.xy = (r1.zw * c2.xx) + r4.zw;
			r5.w = c0.x;
			r6 = r5 + c2.yyzz;
			r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
			r7 = r5 + c2.wyzz;
			r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
			r8 = r5 + c2.ywzz;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r9 = r5 + c2.wwzz;
			r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
			r6.y = r7.x;
			r6.z = r8.x;
			r6.w = r9.x;
			r1.z = dot(r6, c3.xxxx);
			r6 = r5 + c2.yzzz;
			r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
			r7 = r5 + c2.wzzz;
			r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
			r8 = r5 + c2.zwzz;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r9 = r5 + c2.zyzz;
			r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
			r6.y = r7.x;
			r6.z = r8.x;
			r6.w = r9.x;
			r1.w = dot(r6, c3.yyyy);
			r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
			r1.z = r1.w + r1.z;
			r1.z = (r5.x * c3.z) + r1.z;
			r4.xy = r4.xy + -c2.xx;
			r4.xy = abs(r4.xy) + -c67.zz;
			r4.xy = clamp(r4.xy * c67.ww, float2(0.0), float2(1.0));
			r4.xy = -r4.xy + c1.xx;
			r1.y = clamp((r4.x * r4.y) + r1.y, 0.0, 1.0);
			r2.w = mix(c1.x, r1.z, r1.y);
			r1.yzw = -c89.xyz + v2.xyz;
			r1.y = dot(r1.yzw, r1.yzw);
			r1.y = clamp((r1.y * c68.y) + c68.x, 0.0, 1.0);
			r3.w = mix(r2.w, c1.x, r1.y);
			r1.y = -r3.w + c1.x;
			r1.x = (r1.x * -r1.y) + c1.x;
			r1.yzw = r1.xxx * r3.zyx;
			r1.x = (r1.x * c2.x) + c2.x;
			r3.xyz = mix(r1.yzw, r1.wzy, r1.xxx);
		}
	}
	r1.xyz = r3.xyz + c31.xyz;
	r1.xyz = r1.xyz * r2.xyz;
	r0.xyz = (r0.xyz * v3.xyz) + -r1.xyz;
	r0.xyz = (r0.www * r0.xyz) + r1.xyz;
	r0.w = c11.y + -v2.z;
	r0.w = r0.w + c3.w;
	oC0.w = clamp(r0.w * c11.w, 0.0, 1.0);
	oC0.xyz = r0.xyz * c30.xxx;
	#undef c11
	#undef c12
	#undef c30
	#undef c31
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

