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
	const float4 c0 = float4(0.25, 0.81649661, 0.577350258, 0.0); (void) c0;
	const float4 c2 = float4(-0.408248334, 0.707106768, 0.577350258, 0.0); (void) c2;
	const float4 c3 = float4(-0.408248215, -0.707106828, 0.577350258, 0.0); (void) c3;
	const float4 c4 = float4(1.041666626, -0.020833333, 0.5, 0.062499999); (void) c4;
	const float4 c5 = float4(0.000488281, 0.0, -0.000488281, 0.125); (void) c5;
	const float4 c6 = float4(2.0, -1.0, 1.0, 0.0); (void) c6;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	float4 r7;
	float4 r8;
	#define c1 uniforms.uniforms_float4[0]
	#define c12 uniforms.uniforms_float4[1]
	#define c15 uniforms.uniforms_float4[2]
	#define c16 uniforms.uniforms_float4[3]
	#define c20 uniforms.uniforms_float4[4]
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
	#define c85 uniforms.uniforms_float4[17]
	#define c86 uniforms.uniforms_float4[18]
	#define c87 uniforms.uniforms_float4[19]
	#define c89 uniforms.uniforms_float4[20]
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
	r2 = s3_texture.sample(s3, v1.xy);
	r2.xyz = (r2.xyz * c6.xxx) + c6.yyy;
	if (b0) {
		r3 = (v4.xyzx * c6.zzzw) + c6.wwwz;
		r4.z = dot(r3, c71);
		r5.x = dot(r3, c69);
		r5.y = dot(r3, c70);
		r5.zw = (r5.xy * c4.xx) + c4.yy;
		r6.xy = clamp(r5.zw, float2(0.0), float2(1.0));
		r5.zw = -r5.zw + r6.xy;
		r0.w = dot(r5.zw, c6.zz) + c6.w;
		r6.x = dot(r3, c73);
		r6.y = dot(r3, c74);
		r5.zw = (r6.xy * c4.xx) + c4.yy;
		r6.zw = clamp(r5.zw, float2(0.0), float2(1.0));
		r5.zw = -r5.zw + r6.zw;
		r2.w = dot(r5.zw, c6.zz) + c6.w;
		r5.z = ((-abs(r2.w) >= 0.0) ? c6.z : c6.w);
		r5.w = dot(r3, c77);
		r3.x = dot(r3, c78);
		r7.x = ((-abs(r2.w) >= 0.0) ? r6.x : r5.w);
		r7.y = ((-abs(r2.w) >= 0.0) ? r6.y : r3.x);
		r3.xy = c86.xy;
		r3.xy = ((-abs(r2.w) >= 0.0) ? r3.xy : c87.xy);
		r3.zw = ((-abs(r0.w) >= 0.0) ? r5.xy : r7.xy);
		r3.xy = ((-abs(r0.w) >= 0.0) ? c85.xy : r3.xy);
		r0.w = ((-abs(r0.w) >= 0.0) ? c6.z : r5.z);
		r5.xy = clamp(r3.zw, float2(0.0), float2(1.0));
		r4.xy = (r5.xy * c4.zz) + r3.xy;
		r4.w = c6.w;
		r5 = r4 + c5.xxyy;
		r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
		r6 = r4 + c5.zxyy;
		r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
		r7 = r4 + c5.xzyy;
		r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
		r8 = r4 + c5.zzyy;
		r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r5.y = r6.x;
		r5.z = r7.x;
		r5.w = r8.x;
		r2.w = dot(r5, c4.wwww);
		r5 = r4 + c5.xyyy;
		r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
		r6 = r4 + c5.zyyy;
		r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
		r7 = r4 + c5.yzyy;
		r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
		r8 = r4 + c5.yxyy;
		r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r5.y = r6.x;
		r5.z = r7.x;
		r5.w = r8.x;
		r3.x = dot(r5, c5.wwww);
		r4 = float4(s15_texture.sample_compare(s15, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
		r2.w = r2.w + r3.x;
		r2.w = (r4.x * c0.x) + r2.w;
		r3.xy = r3.zw + -c4.zz;
		r3.xy = abs(r3.xy) + -c67.zz;
		r3.xy = clamp(r3.xy * c67.ww, float2(0.0), float2(1.0));
		r3.xy = -r3.xy + c6.zz;
		r0.w = clamp((r3.x * r3.y) + r0.w, 0.0, 1.0);
		r2.w = r2.w + c6.y;
		r0.w = (r0.w * r2.w) + c6.z;
		r3.xyz = -c89.xyz + v4.xyz;
		r2.w = dot(r3.xyz, r3.xyz);
		r2.w = clamp((r2.w * c68.y) + c68.x, 0.0, 1.0);
		r3.x = mix(r0.w, c6.z, r2.w);
	} else {
		r3.x = c6.z;
	}
	r0.xyz = r0.xyz * r2.yyy;
	r0.xyz = (r2.xxx * v3.xyz) + r0.xyz;
	r0.xyz = (r2.zzz * v2.xyz) + r0.xyz;
	r4.xyz = normalize(r0.xyz);
	r0.x = clamp(dot(r2.xz, c0.yz) + c0.w, 0.0, 1.0);
	r0.y = clamp(dot(r2.xyz, c2.xyz), 0.0, 1.0);
	r0.z = clamp(dot(r2.xyz, c3.xyz), 0.0, 1.0);
	r0.xyz = r0.xyz * r0.xyz;
	r2.xyz = r0.yyy * v6.xyz;
	r2.xyz = (r0.xxx * v5.xyz) + r2.xyz;
	r2.xyz = (r0.zzz * v7.xyz) + r2.xyz;
	r0.w = dot(r0.xyz, c6.zzz);
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
	r0.xyz = r0.xxx * r2.xyz;
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r2.x = r0.w * c4.z;
	r2.y = c6.w;
	r2 = s9_texture.sample(s9, r2.xy);
	r0.xyz = r0.xyz * r2.xyz;
	r0.xyz = r0.xyz + r0.xyz;
	r2.xyz = c16.xyz + -v4.xyz;
	r3.xyz = normalize(r2.xyz);
	r2.xyz = c15.xyz * v8.yyy;
	r0.w = clamp(dot(r4.xyz, r3.xyz), 0.0, 1.0);
	r0.w = (r0.w * r0.w) + r0.w;
	r0.w = r0.w * c4.z;
	r3 = s9_texture.sample(s9, r0.ww);
	r0.xyz = (r2.xyz * r3.xyz) + r0.xyz;
	r0.w = r1.w + c6.y;
	r2.yz = c6.yz;
	r0.w = (c20.w * r0.w) + r2.z;
	r1.w = clamp(r1.w + c12.x, 0.0, 1.0);
	r2.xyz = r2.yyy + c1.xyz;
	r2.xyz = (r1.www * r2.xyz) + c6.zzz;
	r0.xyz = r0.xyz * r2.xyz;
	r0.w = r0.w * c1.w;
	r0.xyz = r0.xyz * r1.xyz;
	r1.x = abs(c12.y);
	oC0.xyz = r0.xyz * c30.xxx;
	r0.x = c29.w * v4.w;
	oC0.w = ((-r1.x >= 0.0) ? r0.w : r0.x);
	#undef c1
	#undef c12
	#undef c15
	#undef c16
	#undef c20
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
	#undef c85
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

