#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[27];
	bool uniforms_bool[1];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord2), centroid_perspective]];
	float4 v2 [[user(texcoord3), centroid_perspective]];
	float4 v3 [[user(texcoord4)]];
	float4 v4 [[user(texcoord5)]];
	float4 v5 [[user(texcoord6)]];
	float4 v6 [[user(texcoord7)]];
	float4 v7 [[user(texcoord8)]];
	float4 v8 [[user(color0)]];
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
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
	texture2d<float> s4_texture [[texture(4)]],
	sampler s4 [[sampler(4)]],
	texture2d<float> s5_texture [[texture(5)]],
	sampler s5 [[sampler(5)]],
	texture2d<float> s7_texture [[texture(7)]],
	sampler s7 [[sampler(7)]],
	depth2d<float> s15_texture [[texture(15)]],
	sampler s15 [[sampler(15)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(8.164966106e-01, 5.773502588e-01, 0.000000000e+00, 4.882812500e-04); (void) c0;
	const float4 c1 = float4(-4.082483351e-01, 7.071067691e-01, 5.773502588e-01, 1.250000000e-01); (void) c1;
	const float4 c2 = float4(-4.082482159e-01, -7.071068287e-01, 5.773502588e-01, 2.500000000e-01); (void) c2;
	const float4 c3 = float4(2.000000000e+00, -1.000000000e+00, 1.000000000e+00, -0.000000000e+00); (void) c3;
	const float4 c4 = float4(-2.000000000e+00, 3.000000000e+00, -5.000000000e-01, 6.250000000e-02); (void) c4;
	const float4 c5 = float4(-4.882812500e-04, 4.882812500e-04, 0.000000000e+00, 0.000000000e+00); (void) c5;
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
	float4 r12;
	#define c10 uniforms.uniforms_float4[0]
	#define c11 uniforms.uniforms_float4[1]
	#define c12 uniforms.uniforms_float4[2]
	#define c29 uniforms.uniforms_float4[3]
	#define c30 uniforms.uniforms_float4[4]
	#define c31 uniforms.uniforms_float4[5]
	#define c33 uniforms.uniforms_float4[6]
	#define c34 uniforms.uniforms_float4[7]
	#define c46 uniforms.uniforms_float4[8]
	#define c47 uniforms.uniforms_float4[9]
	#define c64 uniforms.uniforms_float4[10]
	#define c67 uniforms.uniforms_float4[11]
	#define c68 uniforms.uniforms_float4[12]
	#define c69 uniforms.uniforms_float4[13]
	#define c70 uniforms.uniforms_float4[14]
	#define c71 uniforms.uniforms_float4[15]
	#define c73 uniforms.uniforms_float4[16]
	#define c74 uniforms.uniforms_float4[17]
	#define c77 uniforms.uniforms_float4[18]
	#define c78 uniforms.uniforms_float4[19]
	#define c81 uniforms.uniforms_float4[20]
	#define c82 uniforms.uniforms_float4[21]
	#define c85 uniforms.uniforms_float4[22]
	#define c86 uniforms.uniforms_float4[23]
	#define c87 uniforms.uniforms_float4[24]
	#define c88 uniforms.uniforms_float4[25]
	#define c89 uniforms.uniforms_float4[26]
	#define b0 uniforms.uniforms_bool[0]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define v7 input.v7
	#define v8 input.v8
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	r1 = s7_texture.sample(s7, v7.xy);
	r2 = s4_texture.sample(s4, v2.zw);
	r2.xyz = (r2.xyz * c3.xxx) + c3.yyy;
	r3 = s1_texture.sample(s1, v1.xy);
	r4 = s1_texture.sample(s1, v1.wz);
	r5 = s1_texture.sample(s1, v2.xy);
	r0.xyz = r0.xyz * c33.xyz;
	r6 = s3_texture.sample(s3, v0.zw);
	r6.xz = r6.yy + -c46.xw;
	r6.yw = r6.yy + c46.xw;
	r7.xy = min(r6.yw, c3.zz);
	r6.x = ((r6.x >= 0.0) ? -r6.x : c3.w);
	r6.y = ((r6.z >= 0.0) ? -r6.z : c3.w);
	r6.zw = r6.xy + r7.xy;
	r1.w = r6.x + v4.w;
	r2.w = ((r6.z == 0.0) ? FLT_MAX : 1.0 / r6.z);
	r1.w = clamp(r1.w * r2.w, 0.0, 1.0);
	r2.w = (r1.w * c4.x) + c4.y;
	r1.w = r1.w * r1.w;
	r1.w = r1.w * r2.w;
	r2.w = clamp(-c46.z + v4.w, 0.0, 1.0);
	r2.w = r6.y + r2.w;
	r6.x = ((r6.w == 0.0) ? FLT_MAX : 1.0 / r6.w);
	r2.w = clamp(r2.w * r6.x, 0.0, 1.0);
	r6.x = (r2.w * c4.x) + c4.y;
	r2.w = r2.w * r2.w;
	r2.w = dot(r6.xx, r2.ww) + c3.y;
	r2.w = -abs(r2.w) + c3.z;
	r2.w = r2.w * c46.y;
	r6.yw = c3.yw;
	r6.xyz = r6.yyy + c47.xyz;
	r6.xyz = (r2.www * r6.xyz) + c3.zzz;
	r0.xyz = r0.xyz * r6.xyz;
	r1.xyz = (r1.xyz * c34.xyz) + -r0.xyz;
	r0.xyz = (r1.www * r1.xyz) + r0.xyz;
	r1.x = v5.w;
	r1.y = v6.w;
	r7 = s5_texture.sample(s5, r1.xy);
	r1.xyz = (r7.xyz * c3.xxx) + c3.yyy;
	r6.xyz = mix(r2.xyz, r1.xyz, r1.www);
	r0.xyz = r0.xyz * v8.xyz;
	oC0.w = r0.w * v8.w;
	r1.x = clamp(dot(r6.xz, c0.xy) + c0.z, 0.0, 1.0);
	r1.y = clamp(dot(r6.xyz, c1.xyz), 0.0, 1.0);
	r1.z = clamp(dot(r6.xyz, c2.xyz), 0.0, 1.0);
	r1.xyz = r1.xyz * r1.xyz;
	r2.xyz = r4.xyz * r1.yyy;
	r2.xyz = (r1.xxx * r3.xyz) + r2.xyz;
	r2.xyz = (r1.zzz * r5.xyz) + r2.xyz;
	r0.w = dot(r1.xyz, c3.zzz);
	if (b0) {
		r1.w = r3.w + r4.w;
		r1.w = r5.w + r1.w;
		if (-r1.w < -c3.w) {
			r7 = (v3.xyzx * -c3.yyyw) + -c3.wwwy;
			r3.x = dot(r7, c69);
			r3.y = dot(r7, c70);
			r4.xy = clamp(r3.xy, float2(0.0), float2(1.0));
			r4.xy = -r3.xy + r4.xy;
			r1.w = dot(r4.xy, -c3.yy) + -c3.w;
			r4.x = dot(r7, c73);
			r4.y = dot(r7, c74);
			r5.xy = clamp(r4.xy, float2(0.0), float2(1.0));
			r5.xy = -r4.xy + r5.xy;
			r2.w = dot(r5.xy, -c3.yy) + -c3.w;
			r5.x = dot(r7, c77);
			r5.y = dot(r7, c78);
			r4.z = c3.z;
			r5.z = c3.x;
			r4.xyz = ((-abs(r2.w) >= 0.0) ? r4.xyz : r5.xyz);
			r3.z = -c3.w;
			r3.xyz = ((-abs(r1.w) >= 0.0) ? r3.xyz : r4.xyz);
			r8.z = dot(r7, c71);
			r4.xy = r3.xy + c4.zz;
			r4.xy = abs(r4.xy) + -c67.zz;
			r4.xy = clamp(r4.xy * c67.ww, float2(0.0), float2(1.0));
			r4.xy = -r4.xy + c3.zz;
			r1.w = r4.y * r4.x;
			r3.xy = clamp(r3.xy, float2(0.0), float2(1.0));
			r4.xyz = r3.zzz + -abs(c3.wyx);
			r9 = ((-abs(r4.x) >= 0.0) ? c85.zwxy : -r6.wwww);
			r9 = ((-abs(r4.y) >= 0.0) ? c86.zwxy : r9);
			r9 = ((-abs(r4.z) >= 0.0) ? c87.zwxy : r9);
			r8.xy = (r3.xy * r9.xy) + r9.zw;
			r8.w = -c3.w;
			r9 = r8 + c0.wwzz;
			r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
			r10 = r8 + c5.xyzz;
			r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
			r11 = r8 + c5.yxzz;
			r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
			r12 = r8 + c5.xxzz;
			r12 = float4(s15_texture.sample_compare(s15, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
			r9.y = r10.x;
			r9.z = r11.x;
			r9.w = r12.x;
			r2.w = dot(r9, c4.wwww);
			r9 = r8 + c0.wzzz;
			r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
			r10 = r8 + c5.xzzz;
			r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
			r11 = r8 + c5.zxzz;
			r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
			r12 = r8 + c0.zwzz;
			r12 = float4(s15_texture.sample_compare(s15, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
			r9.y = r10.x;
			r9.z = r11.x;
			r9.w = r12.x;
			r3.x = dot(r9, c1.wwww);
			r9 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r2.w = r2.w + r3.x;
			r2.w = (r9.x * c2.w) + r2.w;
			if (r1.w < c3.z) {
				r3.xyz = r3.zzz + -c3.wzx;
				r9 = ((-abs(r3.x) >= 0.0) ? c73 : -r6.wwww);
				r10 = ((-abs(r3.x) >= 0.0) ? c74 : -r6.wwww);
				r9 = ((-abs(r3.y) >= 0.0) ? c77 : r9);
				r10 = ((-abs(r3.y) >= 0.0) ? c78 : r10);
				r9 = ((-abs(r3.z) >= 0.0) ? c81 : r9);
				r10 = ((-abs(r3.z) >= 0.0) ? c82 : r10);
				r4.x = clamp(dot(r7, r9), 0.0, 1.0);
				r4.y = clamp(dot(r7, r10), 0.0, 1.0);
				r6 = ((-abs(r3.x) >= 0.0) ? c86.zwxy : -r6.wwww);
				r6 = ((-abs(r3.y) >= 0.0) ? c87.zwxy : r6);
				r6 = ((-abs(r3.z) >= 0.0) ? c88.zwxy : r6);
				r8.xy = (r4.xy * r6.xy) + r6.zw;
				r6 = r8 + c0.wwzz;
				r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
				r7 = r8 + c5.xyzz;
				r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
				r9 = r8 + c5.yxzz;
				r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
				r10 = r8 + c5.xxzz;
				r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
				r6.y = r7.x;
				r6.z = r9.x;
				r6.w = r10.x;
				r3.x = dot(r6, c4.wwww);
				r6 = r8 + c0.wzzz;
				r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
				r7 = r8 + c5.xzzz;
				r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
				r9 = r8 + c5.zxzz;
				r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
				r10 = r8 + c0.zwzz;
				r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
				r6.y = r7.x;
				r6.z = r9.x;
				r6.w = r10.x;
				r3.y = dot(r6, c1.wwww);
				r6 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
				r3.x = r3.y + r3.x;
				r3.x = (r6.x * c2.w) + r3.x;
				r3.x = ((r3.z >= 0.0) ? c3.z : r3.x);
				r4.x = mix(r3.x, r2.w, r1.w);
				r2.w = r4.x;
			}
			r3.xyz = -c89.xyz + v3.xyz;
			r1.w = dot(r3.xyz, r3.xyz);
			r1.w = clamp((r1.w * c68.y) + c68.x, 0.0, 1.0);
			r3.x = mix(r2.w, c3.z, r1.w);
			r1.y = r4.w * r1.y;
			r1.x = (r1.x * r3.w) + r1.y;
			r1.x = (r1.z * r5.w) + r1.x;
			r1.xyz = r1.xxx * c64.xyz;
			r1.w = -r3.x + c3.z;
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
	#undef c33
	#undef c34
	#undef c46
	#undef c47
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
	#undef v6
	#undef v7
	#undef v8
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

