#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[24];
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
	texture2d<float> s12_texture [[texture(12)]],
	sampler s12 [[sampler(12)]],
	texture2d<float> s13_texture [[texture(13)]],
	sampler s13 [[sampler(13)]],
	depth2d<float> s15_texture [[texture(15)]],
	sampler s15 [[sampler(15)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(0.81649661, 0.577350258, 0.0, 0.0); (void) c0;
	const float4 c2 = float4(-0.408248334, 0.707106768, 0.577350258, 0.0); (void) c2;
	const float4 c4 = float4(-0.408248215, -0.707106828, 0.577350258, 0.0); (void) c4;
	const float4 c5 = float4(2.0, -1.0, 1.0, 0.0); (void) c5;
	const float4 c6 = float4(-0.5, 0.000488281, 0.0, -0.000488281); (void) c6;
	const float4 c7 = float4(0.062499999, 0.125, 0.25, 0.0); (void) c7;
	const float4 c8 = float4(0.0, -1.0, -2.0, 0.0); (void) c8;
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
	#define c1 uniforms.uniforms_float4[0]
	#define c3 uniforms.uniforms_float4[1]
	#define c12 uniforms.uniforms_float4[2]
	#define c20 uniforms.uniforms_float4[3]
	#define c21 uniforms.uniforms_float4[4]
	#define c29 uniforms.uniforms_float4[5]
	#define c30 uniforms.uniforms_float4[6]
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
	#define c81 uniforms.uniforms_float4[17]
	#define c82 uniforms.uniforms_float4[18]
	#define c85 uniforms.uniforms_float4[19]
	#define c86 uniforms.uniforms_float4[20]
	#define c87 uniforms.uniforms_float4[21]
	#define c88 uniforms.uniforms_float4[22]
	#define c89 uniforms.uniforms_float4[23]
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
	r1.xyz = (r1.xyz * c5.xxx) + c5.yyy;
	if (b0) {
		r2 = (v2.xyzx * c5.zzzw) + c5.wwwz;
		r3.x = dot(r2, c69);
		r3.y = dot(r2, c70);
		r4.xy = clamp(r3.xy, float2(0.0), float2(1.0));
		r4.xy = -r3.xy + r4.xy;
		r1.w = dot(r4.xy, c5.zz) + c5.w;
		r4.x = dot(r2, c73);
		r4.y = dot(r2, c74);
		r5.xy = clamp(r4.xy, float2(0.0), float2(1.0));
		r5.xy = -r4.xy + r5.xy;
		r3.w = dot(r5.xy, c5.zz) + c5.w;
		r5.x = dot(r2, c77);
		r5.y = dot(r2, c78);
		r4.zw = c5.zw;
		r5.z = c5.x;
		r4.xyz = ((-abs(r3.w) >= 0.0) ? r4.xyz : r5.xyz);
		r3.zw = c5.ww;
		r3.xyz = ((-abs(r1.w) >= 0.0) ? r3.xyz : r4.xyz);
		r4.z = dot(r2, c71);
		r5.xy = r3.xy + c6.xx;
		r5.xy = abs(r5.xy) + -c67.zz;
		r5.xy = clamp(r5.xy * c67.ww, float2(0.0), float2(1.0));
		r5.xy = -r5.xy + c5.zz;
		r1.w = r5.y * r5.x;
		r3.xy = clamp(r3.xy, float2(0.0), float2(1.0));
		r5.xyz = r3.zzz + -c5.wzx;
		r6 = ((-abs(r5.x) >= 0.0) ? c85.zwxy : r3.wwww);
		r6 = ((-abs(r5.y) >= 0.0) ? c86.zwxy : r6);
		r5 = ((-abs(r5.z) >= 0.0) ? c87.zwxy : r6);
		r4.xy = (r3.xy * r5.xy) + r5.zw;
		r5 = r4 + c6.yyzz;
		r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
		r6 = r4 + c6.wyzz;
		r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
		r7 = r4 + c6.ywzz;
		r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
		r8 = r4 + c6.wwzz;
		r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r5.y = r6.x;
		r5.z = r7.x;
		r5.w = r8.x;
		r3.x = dot(r5, c7.xxxx);
		r5 = r4 + c6.yzzz;
		r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
		r6 = r4 + c6.wzzz;
		r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
		r7 = r4 + c6.zwzz;
		r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
		r8 = r4 + c6.zyzz;
		r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r5.y = r6.x;
		r5.z = r7.x;
		r5.w = r8.x;
		r3.y = dot(r5, c7.yyyy);
		r5 = float4(s15_texture.sample_compare(s15, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
		r3.x = r3.y + r3.x;
		r3.x = (r5.x * c7.z) + r3.x;
		if (r1.w < c5.z) {
			r5.xyz = r3.zzz + c8.xyz;
			r6 = ((-abs(r5.x) >= 0.0) ? c73 : r3.wwww);
			r7 = ((-abs(r5.x) >= 0.0) ? c74 : r3.wwww);
			r6 = ((-abs(r5.y) >= 0.0) ? c77 : r6);
			r7 = ((-abs(r5.y) >= 0.0) ? c78 : r7);
			r6 = ((-abs(r5.z) >= 0.0) ? c81 : r6);
			r7 = ((-abs(r5.z) >= 0.0) ? c82 : r7);
			r6.x = clamp(dot(r2, r6), 0.0, 1.0);
			r6.y = clamp(dot(r2, r7), 0.0, 1.0);
			r2 = ((-abs(r5.x) >= 0.0) ? c86.zwxy : r3.wwww);
			r2 = ((-abs(r5.y) >= 0.0) ? c87.zwxy : r2);
			r2 = ((-abs(r5.z) >= 0.0) ? c88.zwxy : r2);
			r4.xy = (r6.xy * r2.xy) + r2.zw;
			r2 = r4 + c6.yyzz;
			r2 = float4(s15_texture.sample_compare(s15, (r2.xyz).xy, (r2.xyz).z, level(r2.w)));
			r6 = r4 + c6.wyzz;
			r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
			r7 = r4 + c6.ywzz;
			r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
			r8 = r4 + c6.wwzz;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r2.y = r6.x;
			r2.z = r7.x;
			r2.w = r8.x;
			r2.x = dot(r2, c7.xxxx);
			r6 = r4 + c6.yzzz;
			r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
			r7 = r4 + c6.wzzz;
			r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
			r8 = r4 + c6.zwzz;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r9 = r4 + c6.zyzz;
			r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
			r6.y = r7.x;
			r6.z = r8.x;
			r6.w = r9.x;
			r2.y = dot(r6, c7.yyyy);
			r4 = float4(s15_texture.sample_compare(s15, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
			r2.x = r2.y + r2.x;
			r2.x = (r4.x * c7.z) + r2.x;
			r2.x = ((r5.z >= 0.0) ? c5.z : r2.x);
			r4.x = mix(r2.x, r3.x, r1.w);
			r3.x = r4.x;
		}
		r2.xyz = -c89.xyz + v2.xyz;
		r1.w = dot(r2.xyz, r2.xyz);
		r1.w = clamp((r1.w * c68.y) + c68.x, 0.0, 1.0);
		r2.x = mix(r3.x, c5.z, r1.w);
	} else {
		r2.x = c5.z;
	}
	r3.x = clamp(dot(r1.xz, c0.xy) + c0.z, 0.0, 1.0);
	r3.y = clamp(dot(r1.xyz, c2.xyz), 0.0, 1.0);
	r3.z = clamp(dot(r1.xyz, c4.xyz), 0.0, 1.0);
	r1.xyz = r3.xyz * r3.xyz;
	r2.yzw = r1.yyy * v4.xyz;
	r2.yzw = (r1.xxx * v3.xyz) + r2.yzw;
	r2.yzw = (r1.zzz * v5.xyz) + r2.yzw;
	r1.w = dot(r1.xyz, c5.zzz);
	if (b0) {
		r3.w = v3.w;
		r3.x = r3.w + v4.w;
		r3.x = r3.x + v5.w;
		r1.y = r1.y * v4.w;
		r1.x = (r1.x * v3.w) + r1.y;
		r1.x = (r1.z * v5.w) + r1.x;
		r1.xyz = r1.xxx * c64.xyz;
		r1.xyz = (r1.xyz * r2.xxx) + r2.yzw;
		r2.yzw = ((-r3.x >= 0.0) ? r2.yzw : r1.xyz);
	}
	r1.x = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.xyz = r1.xxx * r2.yzw;
	r0.w = r0.w + c5.y;
	r2.yz = c5.yz;
	r0.w = (c20.w * r0.w) + r2.z;
	r3 = s13_texture.sample(s13, v0.xy);
	r1.w = clamp(r3.y + c12.x, 0.0, 1.0);
	r2.xyz = r2.yyy + c1.xyz;
	r2.xyz = (r1.www * r2.xyz) + c5.zzz;
	r1.xyz = r1.xyz * r2.xyz;
	r0.w = r0.w * c1.w;
	r0.xyz = r0.xyz * r1.xyz;
	r1 = s12_texture.sample(s12, v0.zw);
	r1.xyz = r1.xyz * c3.www;
	r0.xyz = r0.xyz * r1.xyz;
	r1.xyz = c20.xyz + -v2.xyz;
	r1.x = dot(r1.xyz, r1.xyz);
	r1.x = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.x = clamp((r1.x * c21.w) + c21.x, 0.0, 1.0);
	r2.x = min(r1.x, c21.z);
	r1.x = abs(c12.y);
	r1.yzw = r0.xyz * c30.xxx;
	r2.y = c29.w * v2.w;
	oC0.w = ((-r1.x >= 0.0) ? r0.w : r2.y);
	r0.w = r2.x * r2.x;
	r1.x = c30.x;
	r0.xyz = (r0.xyz * -r1.xxx) + c29.xyz;
	oC0.xyz = (r0.www * r0.xyz) + r1.yzw;
	#undef c1
	#undef c3
	#undef c12
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
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

