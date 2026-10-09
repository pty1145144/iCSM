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
	float4 v1 [[user(texcoord1)]];
	float4 v2 [[user(texcoord2), centroid_perspective]];
	float4 v3 [[user(texcoord4)]];
	float4 v4 [[user(color0)]];
	float4 v5 [[user(color1)]];
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
	texture2d<float> s8_texture [[texture(8)]],
	sampler s8 [[sampler(8)]],
	texture2d<float> s11_texture [[texture(11)]],
	sampler s11 [[sampler(11)]],
	texture2d<float> s12_texture [[texture(12)]],
	sampler s12 [[sampler(12)]],
	texture2d<float> s15_texture [[texture(15)]],
	sampler s15 [[sampler(15)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(0.212500005, 0.71539998, 0.072099998, 1.0); (void) c0;
	const float4 c1 = float4(-2.0, 3.0, 2.0, -1.0); (void) c1;
	const float4 c2 = float4(0.0, 1.0, 1.041666626, -0.020833333); (void) c2;
	const float4 c3 = float4(0.5, 0.000488281, 0.0, -0.000488281); (void) c3;
	const float4 c4 = float4(0.062499999, 0.125, 0.25, 0.0); (void) c4;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	float4 r7;
	float4 r8;
	#define c5 uniforms.uniforms_float4[0]
	#define c8 uniforms.uniforms_float4[1]
	#define c9 uniforms.uniforms_float4[2]
	#define c12 uniforms.uniforms_float4[3]
	#define c15 uniforms.uniforms_float4[4]
	#define c16 uniforms.uniforms_float4[5]
	#define c17 uniforms.uniforms_float4[6]
	#define c18 uniforms.uniforms_float4[7]
	#define c28 uniforms.uniforms_float4[8]
	#define c29 uniforms.uniforms_float4[9]
	#define c30 uniforms.uniforms_float4[10]
	#define c31 uniforms.uniforms_float4[11]
	#define c64 uniforms.uniforms_float4[12]
	#define c67 uniforms.uniforms_float4[13]
	#define c68 uniforms.uniforms_float4[14]
	#define c71 uniforms.uniforms_float4[15]
	#define c73 uniforms.uniforms_float4[16]
	#define c74 uniforms.uniforms_float4[17]
	#define c77 uniforms.uniforms_float4[18]
	#define c78 uniforms.uniforms_float4[19]
	#define c86 uniforms.uniforms_float4[20]
	#define c87 uniforms.uniforms_float4[21]
	#define c89 uniforms.uniforms_float4[22]
	#define b0 uniforms.uniforms_bool[0]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	r1 = c16 * v0.xyxy;
	r2 = s7_texture.sample(s7, r1.xy);
	r1 = s8_texture.sample(s8, r1.zw);
	r3.xy = c17.zw * v0.xy;
	r3 = s11_texture.sample(s11, r3.xy);
	r4 = s1_texture.sample(s1, v2.xy);
	r5 = s12_texture.sample(s12, v1.xy);
	r5.xyz = r5.xyz * c8.xyz;
	r5.w = dot(r0.xyz, c0.xyz);
	r6.xy = -c5.xz + c5.yw;
	r5.w = r5.w + -c5.x;
	r6.x = ((r6.x == 0.0) ? FLT_MAX : 1.0 / r6.x);
	r5.w = clamp(r5.w * r6.x, 0.0, 1.0);
	r6.x = (r5.w * c1.x) + c1.y;
	r5.w = r5.w * r5.w;
	r6.z = r5.w * r6.x;
	r6.w = dot(r2.xyz, c0.xyz);
	r6.w = r6.w + -c5.z;
	r6.y = ((r6.y == 0.0) ? FLT_MAX : 1.0 / r6.y);
	r6.y = clamp(r6.y * r6.w, 0.0, 1.0);
	r6.w = (r6.y * c1.x) + c1.y;
	r6.y = r6.y * r6.y;
	r7.x = dot(r1.xyz, c0.xyz);
	r7.yz = -c28.xz + c28.yw;
	r7.x = r7.x + -c28.x;
	r7.y = ((r7.y == 0.0) ? FLT_MAX : 1.0 / r7.y);
	r7.x = clamp(r7.y * r7.x, 0.0, 1.0);
	r7.y = (r7.x * c1.x) + c1.y;
	r7.w = dot(r3.xyz, c0.xyz);
	r7.w = r7.w + -c28.z;
	r7.z = ((r7.z == 0.0) ? FLT_MAX : 1.0 / r7.z);
	r7.z = clamp(r7.z * r7.w, 0.0, 1.0);
	r7.w = (r7.z * c1.x) + c1.y;
	r7.xz = r7.xz * r7.xz;
	r5.w = (r6.x * -r5.w) + c0.w;
	r6.x = (r6.w * r6.y) + -r5.w;
	r5.w = (c18.x * r6.x) + r5.w;
	r5.w = (v5.y * r5.w) + v5.y;
	r8.xy = -c15.xz + c15.yw;
	r5.w = r5.w + -c15.x;
	r6.x = ((r8.x == 0.0) ? FLT_MAX : 1.0 / r8.x);
	r5.w = clamp(r5.w * r6.x, 0.0, 1.0);
	r6.x = (r5.w * c1.x) + c1.y;
	r5.w = r5.w * r5.w;
	r5.w = r5.w * r6.x;
	r6.x = (r6.w * r6.y) + -r6.z;
	r6.x = (r5.w * r6.x) + r6.z;
	r6.y = -r6.x + c0.w;
	r6.z = (r7.y * r7.x) + -r6.y;
	r6.y = (c18.y * r6.z) + r6.y;
	r6.y = (v5.z * r6.y) + v5.z;
	r6.y = r6.y + -c15.z;
	r6.z = ((r8.y == 0.0) ? FLT_MAX : 1.0 / r8.y);
	r6.y = clamp(r6.z * r6.y, 0.0, 1.0);
	r6.z = (r6.y * c1.x) + c1.y;
	r6.y = r6.y * r6.y;
	r6.y = r6.y * r6.z;
	r6.z = (r7.y * r7.x) + -r6.x;
	r6.x = (r6.y * r6.z) + r6.x;
	r6.x = -r6.x + c0.w;
	r6.z = (r7.w * r7.z) + -r6.x;
	r6.x = (c18.z * r6.z) + r6.x;
	r6.x = (v5.w * r6.x) + v5.w;
	r6.z = -c17.x + c17.y;
	r6.x = r6.x + -c17.x;
	r6.z = ((r6.z == 0.0) ? FLT_MAX : 1.0 / r6.z);
	r6.x = clamp(r6.z * r6.x, 0.0, 1.0);
	r6.z = (r6.x * c1.x) + c1.y;
	r6.x = r6.x * r6.x;
	r6.x = r6.x * r6.z;
	r7 = mix(r0, r2, r5.wwww);
	r0 = mix(r7, r1, r6.yyyy);
	r1 = mix(r0, r3, r6.xxxx);
	r0.x = mix(c9.x, c9.y, r5.w);
	r2.x = mix(r0.x, c9.z, r6.y);
	r0.x = mix(r2.x, c9.w, r6.x);
	r0.yzw = (r5.xyz * c1.zzz) + c1.www;
	r0.xyz = (r0.xxx * r0.yzw) + c0.www;
	r0.xyz = r0.xyz * r1.xyz;
	r0.xyz = r0.xyz * v4.xyz;
	oC0.w = r1.w * v4.w;
	if (b0) {
		if (-r4.w < c2.x) {
			r1 = (v3.xyzx * c2.yyyx) + c2.xxxy;
			r2.z = dot(r1, c71);
			r3.x = dot(r1, c73);
			r3.y = dot(r1, c74);
			r3.zw = (r3.xy * c2.zz) + c2.ww;
			r5.xy = clamp(r3.zw, float2(0.0), float2(1.0));
			r3.zw = -r3.zw + r5.xy;
			r0.w = dot(r3.zw, c2.yy) + c2.x;
			r3.z = ((-abs(r0.w) >= 0.0) ? c2.y : c2.x);
			r3.w = dot(r1, c77);
			r1.x = dot(r1, c78);
			r5.x = ((-abs(r0.w) >= 0.0) ? r3.x : r3.w);
			r5.y = ((-abs(r0.w) >= 0.0) ? r3.y : r1.x);
			r1.xy = c86.xy;
			r1.xy = ((-abs(r0.w) >= 0.0) ? r1.xy : c87.xy);
			r1.zw = clamp(r5.xy, float2(0.0), float2(1.0));
			r2.xy = (r1.zw * c3.xx) + r1.xy;
			r2.w = c2.x;
			r1 = r2 + c3.yyzz;
			r1 = s15_texture.sample(s15, r1.xy, level(r1.w));
			r6 = r2 + c3.wyzz;
			r6 = s15_texture.sample(s15, r6.xy, level(r6.w));
			r7 = r2 + c3.ywzz;
			r7 = s15_texture.sample(s15, r7.xy, level(r7.w));
			r8 = r2 + c3.wwzz;
			r8 = s15_texture.sample(s15, r8.xy, level(r8.w));
			r1.y = r6.x;
			r1.z = r7.x;
			r1.w = r8.x;
			r0.w = dot(r1, c4.xxxx);
			r1 = r2 + c3.yzzz;
			r1 = s15_texture.sample(s15, r1.xy, level(r1.w));
			r6 = r2 + c3.wzzz;
			r6 = s15_texture.sample(s15, r6.xy, level(r6.w));
			r7 = r2 + c3.zwzz;
			r7 = s15_texture.sample(s15, r7.xy, level(r7.w));
			r8 = r2 + c3.zyzz;
			r8 = s15_texture.sample(s15, r8.xy, level(r8.w));
			r1.y = r6.x;
			r1.z = r7.x;
			r1.w = r8.x;
			r1.x = dot(r1, c4.yyyy);
			r2 = s15_texture.sample(s15, r2.xy, level(r2.w));
			r0.w = r0.w + r1.x;
			r0.w = (r2.x * c4.z) + r0.w;
			r1.xy = r5.xy + -c3.xx;
			r1.xy = abs(r1.xy) + -c67.zz;
			r1.xy = clamp(r1.xy * c67.ww, float2(0.0), float2(1.0));
			r1.xy = -r1.xy + c0.ww;
			r1.x = clamp((r1.x * r1.y) + r3.z, 0.0, 1.0);
			r2.x = mix(c0.w, r0.w, r1.x);
			r1.xyz = -c89.xyz + v3.xyz;
			r0.w = dot(r1.xyz, r1.xyz);
			r0.w = clamp((r0.w * c68.y) + c68.x, 0.0, 1.0);
			r1.x = mix(r2.x, c0.w, r0.w);
			r1.yzw = r4.www * c64.xyz;
			r2.xyz = (r4.www * -c64.xyz) + r4.xyz;
			r4.xyz = (r1.yzw * r1.xxx) + r2.xyz;
		}
	}
	r1.xyz = c12.xyz;
	r1.xyz = (r4.xyz * r1.xyz) + c31.xyz;
	r0.xyz = r0.xyz * r1.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r0.w = v0.z * v0.z;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	oC0.xyz = (r0.www * r0.xyz) + r1.xyz;
	#undef c5
	#undef c8
	#undef c9
	#undef c12
	#undef c15
	#undef c16
	#undef c17
	#undef c18
	#undef c28
	#undef c29
	#undef c30
	#undef c31
	#undef c64
	#undef c67
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

