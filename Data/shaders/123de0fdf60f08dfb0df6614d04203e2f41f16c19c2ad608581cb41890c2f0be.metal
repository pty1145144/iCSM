#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[22];
	bool uniforms_bool[1];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord2), centroid_perspective]];
	float4 v2 [[user(texcoord4)]];
	float4 v3 [[user(texcoord5)]];
	float4 v4 [[user(texcoord8)]];
	float4 v5 [[user(color0)]];
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
	texture2d<float> s7_texture [[texture(7)]],
	sampler s7 [[sampler(7)]],
	depth2d<float> s15_texture [[texture(15)]],
	sampler s15 [[sampler(15)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(0.000000000e+00, 1.000000000e+00, 2.000000000e+00, -5.000000000e-01); (void) c0;
	const float4 c1 = float4(0.000000000e+00, -1.000000000e+00, -2.000000000e+00, 0.000000000e+00); (void) c1;
	const float4 c2 = float4(4.882812500e-04, 0.000000000e+00, -4.882812500e-04, 6.250000000e-02); (void) c2;
	const float4 c3 = float4(1.250000000e-01, 2.500000000e-01, 0.000000000e+00, 0.000000000e+00); (void) c3;
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
	#define c12 uniforms.uniforms_float4[0]
	#define c30 uniforms.uniforms_float4[1]
	#define c31 uniforms.uniforms_float4[2]
	#define c33 uniforms.uniforms_float4[3]
	#define c34 uniforms.uniforms_float4[4]
	#define c64 uniforms.uniforms_float4[5]
	#define c67 uniforms.uniforms_float4[6]
	#define c68 uniforms.uniforms_float4[7]
	#define c69 uniforms.uniforms_float4[8]
	#define c70 uniforms.uniforms_float4[9]
	#define c71 uniforms.uniforms_float4[10]
	#define c73 uniforms.uniforms_float4[11]
	#define c74 uniforms.uniforms_float4[12]
	#define c77 uniforms.uniforms_float4[13]
	#define c78 uniforms.uniforms_float4[14]
	#define c81 uniforms.uniforms_float4[15]
	#define c82 uniforms.uniforms_float4[16]
	#define c85 uniforms.uniforms_float4[17]
	#define c86 uniforms.uniforms_float4[18]
	#define c87 uniforms.uniforms_float4[19]
	#define c88 uniforms.uniforms_float4[20]
	#define c89 uniforms.uniforms_float4[21]
	#define b0 uniforms.uniforms_bool[0]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	r1 = s7_texture.sample(s7, v4.xy);
	r2 = s1_texture.sample(s1, v1.xy);
	r0.xyz = r0.xyz * c33.xyz;
	r1.xyz = (r1.xyz * c34.xyz) + -r0.xyz;
	r0.xyz = (v3.www * r1.xyz) + r0.xyz;
	r0.xyz = r0.xyz * v5.xyz;
	oC0.w = r0.w * v5.w;
	if (b0) {
		if (-r2.w < c0.x) {
			r1 = (v2.xyzx * c0.yyyx) + c0.xxxy;
			r3.x = dot(r1, c69);
			r3.y = dot(r1, c70);
			r4.xy = clamp(r3.xy, float2(0.0), float2(1.0));
			r4.xy = -r3.xy + r4.xy;
			r0.w = dot(r4.xy, c0.yy) + c0.x;
			r4.x = dot(r1, c73);
			r4.y = dot(r1, c74);
			r5.xy = clamp(r4.xy, float2(0.0), float2(1.0));
			r5.xy = -r4.xy + r5.xy;
			r3.w = dot(r5.xy, c0.yy) + c0.x;
			r5.x = dot(r1, c77);
			r5.y = dot(r1, c78);
			r4.zw = c0.yx;
			r5.z = c0.z;
			r4.xyz = ((-abs(r3.w) >= 0.0) ? r4.xyz : r5.xyz);
			r3.z = c0.x;
			r3.xyz = ((-abs(r0.w) >= 0.0) ? r3.xyz : r4.xyz);
			r4.z = dot(r1, c71);
			r5.xy = r3.xy + c0.ww;
			r5.xy = abs(r5.xy) + -c67.zz;
			r5.xy = clamp(r5.xy * c67.ww, float2(0.0), float2(1.0));
			r5.xy = -r5.xy + c0.yy;
			r0.w = r5.y * r5.x;
			r3.xy = clamp(r3.xy, float2(0.0), float2(1.0));
			r5.xyz = r3.zzz + -c0.xyz;
			r6.x = c0.x;
			r7 = ((-abs(r5.x) >= 0.0) ? c85.zwxy : r6.xxxx);
			r7 = ((-abs(r5.y) >= 0.0) ? c86.zwxy : r7);
			r5 = ((-abs(r5.z) >= 0.0) ? c87.zwxy : r7);
			r4.xy = (r3.xy * r5.xy) + r5.zw;
			r5 = r4 + c2.xxyy;
			r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
			r7 = r4 + c2.zxyy;
			r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
			r8 = r4 + c2.xzyy;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r9 = r4 + c2.zzyy;
			r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
			r5.y = r7.x;
			r5.z = r8.x;
			r5.w = r9.x;
			r3.x = dot(r5, c2.wwww);
			r5 = r4 + c2.xyyy;
			r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
			r7 = r4 + c2.zyyy;
			r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
			r8 = r4 + c2.yzyy;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r9 = r4 + c2.yxyy;
			r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
			r5.y = r7.x;
			r5.z = r8.x;
			r5.w = r9.x;
			r3.y = dot(r5, c3.xxxx);
			r5 = float4(s15_texture.sample_compare(s15, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
			r3.x = r3.y + r3.x;
			r3.x = (r5.x * c3.y) + r3.x;
			if (r0.w < c0.y) {
				r3.yzw = r3.zzz + c1.xyz;
				r5 = ((-abs(r3.y) >= 0.0) ? c73 : r6.xxxx);
				r7 = ((-abs(r3.y) >= 0.0) ? c74 : r6.xxxx);
				r5 = ((-abs(r3.z) >= 0.0) ? c77 : r5);
				r7 = ((-abs(r3.z) >= 0.0) ? c78 : r7);
				r5 = ((-abs(r3.w) >= 0.0) ? c81 : r5);
				r7 = ((-abs(r3.w) >= 0.0) ? c82 : r7);
				r5.x = clamp(dot(r1, r5), 0.0, 1.0);
				r5.y = clamp(dot(r1, r7), 0.0, 1.0);
				r1 = ((-abs(r3.y) >= 0.0) ? c86.zwxy : r6.xxxx);
				r1 = ((-abs(r3.z) >= 0.0) ? c87.zwxy : r1);
				r1 = ((-abs(r3.w) >= 0.0) ? c88.zwxy : r1);
				r4.xy = (r5.xy * r1.xy) + r1.zw;
				r1 = r4 + c2.xxyy;
				r1 = float4(s15_texture.sample_compare(s15, (r1.xyz).xy, (r1.xyz).z, level(r1.w)));
				r5 = r4 + c2.zxyy;
				r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
				r6 = r4 + c2.xzyy;
				r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
				r7 = r4 + c2.zzyy;
				r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
				r1.y = r5.x;
				r1.z = r6.x;
				r1.w = r7.x;
				r1.x = dot(r1, c2.wwww);
				r5 = r4 + c2.xyyy;
				r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
				r6 = r4 + c2.zyyy;
				r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
				r7 = r4 + c2.yzyy;
				r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
				r8 = r4 + c2.yxyy;
				r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
				r5.y = r6.x;
				r5.z = r7.x;
				r5.w = r8.x;
				r1.y = dot(r5, c3.xxxx);
				r4 = float4(s15_texture.sample_compare(s15, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
				r1.x = r1.y + r1.x;
				r1.x = (r4.x * c3.y) + r1.x;
				r1.x = ((r3.w >= 0.0) ? c0.y : r1.x);
				r4.x = mix(r1.x, r3.x, r0.w);
				r3.x = r4.x;
			}
			r1.xyz = -c89.xyz + v2.xyz;
			r0.w = dot(r1.xyz, r1.xyz);
			r0.w = clamp((r0.w * c68.y) + c68.x, 0.0, 1.0);
			r1.x = mix(r3.x, c0.y, r0.w);
			r1.yzw = r2.www * c64.xyz;
			r3.xyz = (r2.www * -c64.xyz) + r2.xyz;
			r2.xyz = (r1.yzw * r1.xxx) + r3.xyz;
		}
	}
	r1.xyz = c12.xyz;
	r1.xyz = (r2.xyz * r1.xyz) + c31.xyz;
	r0.xyz = r0.xyz * r1.xyz;
	oC0.xyz = r0.xyz * c30.xxx;
	#undef c12
	#undef c30
	#undef c31
	#undef c33
	#undef c34
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
	#undef c81
	#undef c82
	#undef c85
	#undef c86
	#undef c87
	#undef c88
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

