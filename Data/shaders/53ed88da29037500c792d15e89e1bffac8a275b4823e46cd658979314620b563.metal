#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[28];
	bool uniforms_bool[1];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord1)]];
	float4 v2 [[user(texcoord2)]];
	float4 v3 [[user(texcoord3)]];
	float4 v4 [[user(texcoord4)]];
	float4 v5 [[user(texcoord6)]];
	float4 v6 [[user(texcoord7)]];
	float4 v7 [[user(texcoord8)]];
	float4 v8 [[user(texcoord9)]];
};

struct source_main_Output
{
	float4 oC0 [[color(0)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	texture2d<float> s0_texture [[texture(0)]],
	sampler s0 [[sampler(0)]],
	texture2d<float> s2_texture [[texture(2)]],
	sampler s2 [[sampler(2)]],
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
	depth2d<float> s15_texture [[texture(15)]],
	sampler s15 [[sampler(15)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(8.164966106e-01, 5.773502588e-01, 0.000000000e+00, 0.000000000e+00); (void) c0;
	const float4 c2 = float4(-4.082483351e-01, 7.071067691e-01, 5.773502588e-01, 0.000000000e+00); (void) c2;
	const float4 c3 = float4(-4.082482159e-01, -7.071068287e-01, 5.773502588e-01, 0.000000000e+00); (void) c3;
	const float4 c5 = float4(2.000000000e+00, -1.000000000e+00, 1.000000000e+00, 0.000000000e+00); (void) c5;
	const float4 c6 = float4(-5.000000000e-01, 4.882812500e-04, 0.000000000e+00, -4.882812500e-04); (void) c6;
	const float4 c7 = float4(6.250000000e-02, 1.250000000e-01, 2.500000000e-01, 0.000000000e+00); (void) c7;
	const float4 c8 = float4(0.000000000e+00, -1.000000000e+00, -2.000000000e+00, 0.000000000e+00); (void) c8;
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
	#define c1 uniforms.uniforms_float4[0]
	#define c4 uniforms.uniforms_float4[1]
	#define c12 uniforms.uniforms_float4[2]
	#define c15 uniforms.uniforms_float4[3]
	#define c16 uniforms.uniforms_float4[4]
	#define c17 uniforms.uniforms_float4[5]
	#define c18 uniforms.uniforms_float4[6]
	#define c20 uniforms.uniforms_float4[7]
	#define c21 uniforms.uniforms_float4[8]
	#define c29 uniforms.uniforms_float4[9]
	#define c30 uniforms.uniforms_float4[10]
	#define c64 uniforms.uniforms_float4[11]
	#define c67 uniforms.uniforms_float4[12]
	#define c68 uniforms.uniforms_float4[13]
	#define c69 uniforms.uniforms_float4[14]
	#define c70 uniforms.uniforms_float4[15]
	#define c71 uniforms.uniforms_float4[16]
	#define c73 uniforms.uniforms_float4[17]
	#define c74 uniforms.uniforms_float4[18]
	#define c77 uniforms.uniforms_float4[19]
	#define c78 uniforms.uniforms_float4[20]
	#define c81 uniforms.uniforms_float4[21]
	#define c82 uniforms.uniforms_float4[22]
	#define c85 uniforms.uniforms_float4[23]
	#define c86 uniforms.uniforms_float4[24]
	#define c87 uniforms.uniforms_float4[25]
	#define c88 uniforms.uniforms_float4[26]
	#define c89 uniforms.uniforms_float4[27]
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
	r0.xyz = v3.xyz;
	r1.xyz = r0.yzx * v2.zxy;
	r0.xyz = (v2.yzx * r0.zxy) + -r1.xyz;
	r0.xyz = r0.xyz * v3.www;
	r1 = s0_texture.sample(s0, v0.xy);
	r2 = s2_texture.sample(s2, v1.zw);
	r2.xyz = (r2.xyz * c5.xxx) + c5.yyy;
	r3.yzw = c5.yzw;
	r2.xyz = (c4.www * r2.xyz) + r3.zzz;
	r1.xyz = r1.xyz * r2.xyz;
	r2 = s3_texture.sample(s3, v1.xy);
	r2.xyz = (r2.xyz * c5.xxx) + c5.yyy;
	if (b0) {
		r4 = (v4.xyzx * c5.zzzw) + c5.wwwz;
		r5.x = dot(r4, c69);
		r5.y = dot(r4, c70);
		r6.xy = clamp(r5.xy, float2(0.0), float2(1.0));
		r6.xy = -r5.xy + r6.xy;
		r0.w = dot(r6.xy, c5.zz) + c5.w;
		r6.x = dot(r4, c73);
		r6.y = dot(r4, c74);
		r7.xy = clamp(r6.xy, float2(0.0), float2(1.0));
		r7.xy = -r6.xy + r7.xy;
		r2.w = dot(r7.xy, c5.zz) + c5.w;
		r7.x = dot(r4, c77);
		r7.y = dot(r4, c78);
		r6.zw = c5.zw;
		r7.z = c5.x;
		r6.xyz = ((-abs(r2.w) >= 0.0) ? r6.xyz : r7.xyz);
		r5.z = c5.w;
		r5.xyz = ((-abs(r0.w) >= 0.0) ? r5.xyz : r6.xyz);
		r6.z = dot(r4, c71);
		r7.xy = r5.xy + c6.xx;
		r7.xy = abs(r7.xy) + -c67.zz;
		r7.xy = clamp(r7.xy * c67.ww, float2(0.0), float2(1.0));
		r7.xy = -r7.xy + c5.zz;
		r0.w = r7.y * r7.x;
		r5.xy = clamp(r5.xy, float2(0.0), float2(1.0));
		r7.xyz = r5.zzz + -c5.wzx;
		r8 = ((-abs(r7.x) >= 0.0) ? c85.zwxy : r3.wwww);
		r8 = ((-abs(r7.y) >= 0.0) ? c86.zwxy : r8);
		r7 = ((-abs(r7.z) >= 0.0) ? c87.zwxy : r8);
		r6.xy = (r5.xy * r7.xy) + r7.zw;
		r7 = r6 + c6.yyzz;
		r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
		r8 = r6 + c6.wyzz;
		r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r9 = r6 + c6.ywzz;
		r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
		r10 = r6 + c6.wwzz;
		r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r7.y = r8.x;
		r7.z = r9.x;
		r7.w = r10.x;
		r2.w = dot(r7, c7.xxxx);
		r7 = r6 + c6.yzzz;
		r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
		r8 = r6 + c6.wzzz;
		r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r9 = r6 + c6.zwzz;
		r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
		r10 = r6 + c6.zyzz;
		r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r7.y = r8.x;
		r7.z = r9.x;
		r7.w = r10.x;
		r3.x = dot(r7, c7.yyyy);
		r7 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
		r2.w = r2.w + r3.x;
		r2.w = (r7.x * c7.z) + r2.w;
		if (r0.w < c5.z) {
			r5.xyz = r5.zzz + c8.xyz;
			r7 = ((-abs(r5.x) >= 0.0) ? c73 : r3.wwww);
			r8 = ((-abs(r5.x) >= 0.0) ? c74 : r3.wwww);
			r7 = ((-abs(r5.y) >= 0.0) ? c77 : r7);
			r8 = ((-abs(r5.y) >= 0.0) ? c78 : r8);
			r7 = ((-abs(r5.z) >= 0.0) ? c81 : r7);
			r8 = ((-abs(r5.z) >= 0.0) ? c82 : r8);
			r7.x = clamp(dot(r4, r7), 0.0, 1.0);
			r7.y = clamp(dot(r4, r8), 0.0, 1.0);
			r4 = ((-abs(r5.x) >= 0.0) ? c86.zwxy : r3.wwww);
			r4 = ((-abs(r5.y) >= 0.0) ? c87.zwxy : r4);
			r4 = ((-abs(r5.z) >= 0.0) ? c88.zwxy : r4);
			r6.xy = (r7.xy * r4.xy) + r4.zw;
			r4 = r6 + c6.yyzz;
			r4 = float4(s15_texture.sample_compare(s15, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
			r7 = r6 + c6.wyzz;
			r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
			r8 = r6 + c6.ywzz;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r9 = r6 + c6.wwzz;
			r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
			r4.y = r7.x;
			r4.z = r8.x;
			r4.w = r9.x;
			r3.x = dot(r4, c7.xxxx);
			r4 = r6 + c6.yzzz;
			r4 = float4(s15_texture.sample_compare(s15, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
			r7 = r6 + c6.wzzz;
			r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
			r8 = r6 + c6.zwzz;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r9 = r6 + c6.zyzz;
			r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
			r4.y = r7.x;
			r4.z = r8.x;
			r4.w = r9.x;
			r3.w = dot(r4, c7.yyyy);
			r4 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
			r3.x = r3.w + r3.x;
			r3.x = (r4.x * c7.z) + r3.x;
			r3.x = ((r5.z >= 0.0) ? c5.z : r3.x);
			r4.x = mix(r3.x, r2.w, r0.w);
			r2.w = r4.x;
		}
		r4.xyz = -c89.xyz + v4.xyz;
		r0.w = dot(r4.xyz, r4.xyz);
		r0.w = clamp((r0.w * c68.y) + c68.x, 0.0, 1.0);
		r3.x = mix(r2.w, c5.z, r0.w);
	} else {
		r3.x = c5.z;
	}
	r0.xyz = r0.xyz * r2.yyy;
	r0.xyz = (r2.xxx * v3.xyz) + r0.xyz;
	r0.xyz = (r2.zzz * v2.xyz) + r0.xyz;
	r4.xyz = normalize(r0.xyz);
	r0.x = clamp(dot(r2.xz, c0.xy) + c0.z, 0.0, 1.0);
	r0.y = clamp(dot(r2.xyz, c2.xyz), 0.0, 1.0);
	r0.z = clamp(dot(r2.xyz, c3.xyz), 0.0, 1.0);
	r0.xyz = r0.xyz * r0.xyz;
	r2.xyz = r0.yyy * v6.xyz;
	r2.xyz = (r0.xxx * v5.xyz) + r2.xyz;
	r2.xyz = (r0.zzz * v7.xyz) + r2.xyz;
	r0.w = dot(r0.xyz, c5.zzz);
	if (b0) {
		r2.w = v5.w;
		r2.w = r2.w + v6.w;
		r2.w = r2.w + v7.w;
		r0.y = r0.y * v6.w;
		r0.x = (r0.x * v5.w) + r0.y;
		r0.x = (r0.z * v7.w) + r0.x;
		r0.xyz = r0.xxx * c64.xyz;
		r0.xyz = (r0.xyz * r3.xxx) + r2.xyz;
		r2.xyz = ((-r2.w >= 0.0) ? r2.xyz : r0.xyz);
	}
	r0.x = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.yzw = c16.xyz + -v4.xyz;
	r5.xyz = normalize(r0.yzw);
	r0.yzw = c15.xyz * v8.yyy;
	r2.w = clamp(dot(r4.xyz, r5.xyz), 0.0, 1.0);
	r2.w = (r2.w * r2.w) + r2.w;
	r2.w = r2.w * -c6.x;
	r5.xyz = c18.xyz + -v4.xyz;
	r6.xyz = normalize(r5.xyz);
	r5.xyz = c17.xyz * v8.zzz;
	r3.x = clamp(dot(r4.xyz, r6.xyz), 0.0, 1.0);
	r3.x = (r3.x * r3.x) + r3.x;
	r3.x = r3.x * -c6.x;
	r4.xyz = r3.xxx * r5.xyz;
	r0.yzw = (r0.yzw * r2.www) + r4.xyz;
	r0.xyz = (r2.xyz * r0.xxx) + r0.yzw;
	r0.w = r1.w + c5.y;
	r0.w = (c20.w * r0.w) + r3.z;
	r1.w = clamp(r1.w + c12.x, 0.0, 1.0);
	r2.xyz = r3.yyy + c1.xyz;
	r2.xyz = (r1.www * r2.xyz) + c5.zzz;
	r0.xyz = r0.xyz * r2.xyz;
	r0.w = r0.w * c1.w;
	r0.xyz = r0.xyz * r1.xyz;
	r1.xyz = c20.xyz + -v4.xyz;
	r1.x = dot(r1.xyz, r1.xyz);
	r1.x = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.x = clamp((r1.x * c21.w) + c21.x, 0.0, 1.0);
	r2.x = min(r1.x, c21.z);
	r1.x = abs(c12.y);
	r1.yzw = r0.xyz * c30.xxx;
	r2.y = c29.w * v4.w;
	oC0.w = ((-r1.x >= 0.0) ? r0.w : r2.y);
	r0.w = r2.x * r2.x;
	r1.x = c30.x;
	r0.xyz = (r0.xyz * -r1.xxx) + c29.xyz;
	oC0.xyz = (r0.www * r0.xyz) + r1.yzw;
	#undef c1
	#undef c4
	#undef c12
	#undef c15
	#undef c16
	#undef c17
	#undef c18
	#undef c20
	#undef c21
	#undef c29
	#undef c30
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

