#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[23];
	bool uniforms_bool[1];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord2), centroid_perspective]];
	float4 v2 [[user(texcoord3), centroid_perspective]];
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
	texture2d<float> s4_texture [[texture(4)]],
	sampler s4 [[sampler(4)]],
	depth2d<float> s15_texture [[texture(15)]],
	sampler s15 [[sampler(15)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(0.81649661, 0.577350258, 0.0, -0.5); (void) c0;
	const float4 c1 = float4(-0.408248334, 0.707106768, 0.577350258, 0.062499999); (void) c1;
	const float4 c2 = float4(-0.408248215, -0.707106828, 0.577350258, 0.125); (void) c2;
	const float4 c3 = float4(0.000488281, 0.0, -0.000488281, 0.25); (void) c3;
	const float4 c4 = float4(0.0, -1.0, -2.0, 0.0); (void) c4;
	const float4 c5 = float4(2.0, -1.0, 1.0, 0.0); (void) c5;
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
	float4 r10;
	float4 r11;
	#define c10 uniforms.uniforms_float4[0]
	#define c11 uniforms.uniforms_float4[1]
	#define c12 uniforms.uniforms_float4[2]
	#define c29 uniforms.uniforms_float4[3]
	#define c30 uniforms.uniforms_float4[4]
	#define c31 uniforms.uniforms_float4[5]
	#define c64 uniforms.uniforms_float4[6]
	#define c67 uniforms.uniforms_float4[7]
	#define c68 uniforms.uniforms_float4[8]
	#define c69 uniforms.uniforms_float4[9]
	#define c70 uniforms.uniforms_float4[10]
	#define c71 uniforms.uniforms_float4[11]
	#define c73 uniforms.uniforms_float4[12]
	#define c74 uniforms.uniforms_float4[13]
	#define c77 uniforms.uniforms_float4[14]
	#define c78 uniforms.uniforms_float4[15]
	#define c81 uniforms.uniforms_float4[16]
	#define c82 uniforms.uniforms_float4[17]
	#define c85 uniforms.uniforms_float4[18]
	#define c86 uniforms.uniforms_float4[19]
	#define c87 uniforms.uniforms_float4[20]
	#define c88 uniforms.uniforms_float4[21]
	#define c89 uniforms.uniforms_float4[22]
	#define b0 uniforms.uniforms_bool[0]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	r1 = s4_texture.sample(s4, v2.zw);
	r1.xyz = (r1.xyz * c5.xxx) + c5.yyy;
	r2 = s1_texture.sample(s1, v1.xy);
	r3 = s1_texture.sample(s1, v1.wz);
	r4 = s1_texture.sample(s1, v2.xy);
	r0.xyz = r0.xyz * v4.xyz;
	oC0.w = r0.w * v4.w;
	r5.x = clamp(dot(r1.xz, c0.xy) + c0.z, 0.0, 1.0);
	r5.y = clamp(dot(r1.xyz, c1.xyz), 0.0, 1.0);
	r5.z = clamp(dot(r1.xyz, c2.xyz), 0.0, 1.0);
	r1.xyz = r5.xyz * r5.xyz;
	r3.xyz = r3.xyz * r1.yyy;
	r2.xyz = (r1.xxx * r2.xyz) + r3.xyz;
	r2.xyz = (r1.zzz * r4.xyz) + r2.xyz;
	r0.w = dot(r1.xyz, c5.zzz);
	if (b0) {
		r1.w = r2.w + r3.w;
		r1.w = r4.w + r1.w;
		if (-r1.w < c5.w) {
			r5 = (v3.xyzx * c5.zzzw) + c5.wwwz;
			r3.x = dot(r5, c69);
			r3.y = dot(r5, c70);
			r4.xy = clamp(r3.xy, float2(0.0), float2(1.0));
			r4.xy = -r3.xy + r4.xy;
			r1.w = dot(r4.xy, c5.zz) + c5.w;
			r4.x = dot(r5, c73);
			r4.y = dot(r5, c74);
			r6.xy = clamp(r4.xy, float2(0.0), float2(1.0));
			r6.xy = -r4.xy + r6.xy;
			r6.x = dot(r6.xy, c5.zz) + c5.w;
			r7.x = dot(r5, c77);
			r7.y = dot(r5, c78);
			r4.z = c5.z;
			r7.zw = c5.xw;
			r4.xyz = ((-abs(r6.x) >= 0.0) ? r4.xyz : r7.xyz);
			r3.z = c5.w;
			r3.xyz = ((-abs(r1.w) >= 0.0) ? r3.xyz : r4.xyz);
			r6.z = dot(r5, c71);
			r4.xy = r3.xy + c0.ww;
			r4.xy = abs(r4.xy) + -c67.zz;
			r4.xy = clamp(r4.xy * c67.ww, float2(0.0), float2(1.0));
			r4.xy = -r4.xy + c5.zz;
			r1.w = r4.y * r4.x;
			r3.xy = clamp(r3.xy, float2(0.0), float2(1.0));
			r4.xyz = r3.zzz + -c5.wzx;
			r8 = ((-abs(r4.x) >= 0.0) ? c85.zwxy : r7.wwww);
			r8 = ((-abs(r4.y) >= 0.0) ? c86.zwxy : r8);
			r8 = ((-abs(r4.z) >= 0.0) ? c87.zwxy : r8);
			r6.xy = (r3.xy * r8.xy) + r8.zw;
			r6.w = c5.w;
			r8 = r6 + c3.xxyy;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r9 = r6 + c3.zxyy;
			r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
			r10 = r6 + c3.xzyy;
			r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
			r11 = r6 + c3.zzyy;
			r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
			r8.y = r9.x;
			r8.z = r10.x;
			r8.w = r11.x;
			r3.x = dot(r8, c1.wwww);
			r8 = r6 + c3.xyyy;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r9 = r6 + c3.zyyy;
			r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
			r10 = r6 + c3.yzyy;
			r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
			r11 = r6 + c3.yxyy;
			r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
			r8.y = r9.x;
			r8.z = r10.x;
			r8.w = r11.x;
			r3.y = dot(r8, c2.wwww);
			r8 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
			r3.x = r3.y + r3.x;
			r3.x = (r8.x * c3.w) + r3.x;
			if (r1.w < c5.z) {
				r4.xyz = r3.zzz + c4.xyz;
				r8 = ((-abs(r4.x) >= 0.0) ? c73 : r7.wwww);
				r9 = ((-abs(r4.x) >= 0.0) ? c74 : r7.wwww);
				r8 = ((-abs(r4.y) >= 0.0) ? c77 : r8);
				r9 = ((-abs(r4.y) >= 0.0) ? c78 : r9);
				r8 = ((-abs(r4.z) >= 0.0) ? c81 : r8);
				r9 = ((-abs(r4.z) >= 0.0) ? c82 : r9);
				r7.x = clamp(dot(r5, r8), 0.0, 1.0);
				r7.y = clamp(dot(r5, r9), 0.0, 1.0);
				r5 = ((-abs(r4.x) >= 0.0) ? c86.zwxy : r7.wwww);
				r5 = ((-abs(r4.y) >= 0.0) ? c87.zwxy : r5);
				r5 = ((-abs(r4.z) >= 0.0) ? c88.zwxy : r5);
				r6.xy = (r7.xy * r5.xy) + r5.zw;
				r5 = r6 + c3.xxyy;
				r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
				r7 = r6 + c3.zxyy;
				r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
				r8 = r6 + c3.xzyy;
				r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
				r9 = r6 + c3.zzyy;
				r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
				r5.y = r7.x;
				r5.z = r8.x;
				r5.w = r9.x;
				r3.y = dot(r5, c1.wwww);
				r5 = r6 + c3.xyyy;
				r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
				r7 = r6 + c3.zyyy;
				r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
				r8 = r6 + c3.yzyy;
				r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
				r9 = r6 + c3.yxyy;
				r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
				r5.y = r7.x;
				r5.z = r8.x;
				r5.w = r9.x;
				r3.z = dot(r5, c2.wwww);
				r5 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
				r3.y = r3.z + r3.y;
				r3.y = (r5.x * c3.w) + r3.y;
				r3.y = ((r4.z >= 0.0) ? c5.z : r3.y);
				r4.x = mix(r3.y, r3.x, r1.w);
				r3.x = r4.x;
			}
			r4.xyz = -c89.xyz + v3.xyz;
			r1.w = dot(r4.xyz, r4.xyz);
			r1.w = clamp((r1.w * c68.y) + c68.x, 0.0, 1.0);
			r4.x = mix(r3.x, c5.z, r1.w);
			r1.y = r3.w * r1.y;
			r1.x = (r1.x * r2.w) + r1.y;
			r1.x = (r1.z * r4.w) + r1.x;
			r1.xyz = r1.xxx * c64.xyz;
			r1.w = -r4.x + c5.z;
			r2.xyz = (r1.xyz * -r1.www) + r2.xyz;
		}
	}
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r1.xyz = r0.www * c12.xyz;
	r1.xyz = (r2.xyz * r1.xyz) + c31.xyz;
	r0.xyz = r0.xyz * r1.xyz;
	r1.xyz = c10.xyz + -v3.xyz;
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
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

