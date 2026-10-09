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
	float4 v1 [[user(texcoord2)]];
	float4 v2 [[user(texcoord3)]];
	float4 v3 [[user(texcoord4)]];
	float4 v4 [[user(texcoord6)]];
	float4 v5 [[user(texcoord7)]];
};

struct source_main_Output
{
	float4 oC0 [[color(0)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	texture2d<float> s0_texture [[texture(0)]],
	sampler s0 [[sampler(0)]],
	texture2d<float> s11_texture [[texture(11)]],
	sampler s11 [[sampler(11)]],
	texture2d<float> s13_texture [[texture(13)]],
	sampler s13 [[sampler(13)]],
	depth2d<float> s15_texture [[texture(15)]],
	sampler s15 [[sampler(15)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(1.000000000e+00, 0.000000000e+00, 1.041666627e+00, -2.083333395e-02); (void) c0;
	const float4 c2 = float4(5.000000000e-01, -2.000000000e+00, 3.000000000e+00, 2.500000000e+01); (void) c2;
	const float4 c5 = float4(7.999999798e-04, -7.999999821e-02, 0.000000000e+00, 0.000000000e+00); (void) c5;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	#define c1 uniforms.uniforms_float4[0]
	#define c3 uniforms.uniforms_float4[1]
	#define c4 uniforms.uniforms_float4[2]
	#define c6 uniforms.uniforms_float4[3]
	#define c11 uniforms.uniforms_float4[4]
	#define c12 uniforms.uniforms_float4[5]
	#define c13 uniforms.uniforms_float4[6]
	#define c29 uniforms.uniforms_float4[7]
	#define c30 uniforms.uniforms_float4[8]
	#define c43 uniforms.uniforms_float4[9]
	#define c44 uniforms.uniforms_float4[10]
	#define c45 uniforms.uniforms_float4[11]
	#define c46 uniforms.uniforms_float4[12]
	#define c64 uniforms.uniforms_float4[13]
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
	if (b0) {
		r1 = (v2.xyzx * c0.xxxy) + c0.yyyx;
		r2.z = dot(r1, c71);
		r3.x = dot(r1, c73);
		r3.y = dot(r1, c74);
		r3.zw = (r3.xy * c0.zz) + c0.ww;
		r4.xy = clamp(r3.zw, float2(0.0), float2(1.0));
		r3.zw = -r3.zw + r4.xy;
		r3.z = dot(r3.zw, c0.xx) + c0.y;
		r3.w = dot(r1, c77);
		r1.x = dot(r1, c78);
		r4.x = clamp(((-abs(r3.z) >= 0.0) ? r3.x : r3.w), 0.0, 1.0);
		r4.y = clamp(((-abs(r3.z) >= 0.0) ? r3.y : r1.x), 0.0, 1.0);
		r1.xy = c86.xy;
		r1.xy = ((-abs(r3.z) >= 0.0) ? r1.xy : c87.xy);
		r2.xy = (r4.xy * c2.xx) + r1.xy;
		r2.w = c0.y;
		r1 = float4(s15_texture.sample_compare(s15, (r2.xyz).xy, (r2.xyz).z, level(r2.w)));
		r1.yzw = -c89.xyz + v2.xyz;
		r1.y = dot(r1.yzw, r1.yzw);
		r1.y = clamp((r1.y * c68.y) + c68.x, 0.0, 1.0);
		r2.x = mix(r1.x, c0.x, r1.y);
	} else {
		r2.x = c0.x;
	}
	r1.xyz = v3.xyz;
	r1.xyz = (r1.xyz * r2.xxx) + v4.xyz;
	if (b0) {
		r2.yzw = c64.xyz * v3.www;
		r2.xyz = (r2.yzw * r2.xxx) + v4.xyz;
		r2.xyz = ((-v3.w >= 0.0) ? r1.xyz : r2.xyz);
		r3.x = log2(r2.x);
		r3.y = log2(r2.y);
		r3.z = log2(r2.z);
		r3.xyz = r3.xyz * c13.xxx;
		r4.x = exp2(r3.x);
		r4.y = exp2(r3.y);
		r4.z = exp2(r3.z);
		r1.xyz = ((-c13.x >= 0.0) ? r2.xyz : r4.xyz);
	}
	r1.w = clamp(v0.y, 0.0, 1.0);
	r2.xy = -c46.yz + c46.zw;
	r2.zw = r1.ww + -c46.yz;
	r1.w = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r1.w = clamp(r1.w * r2.z, 0.0, 1.0);
	r2.x = (r1.w * c2.y) + c2.z;
	r1.w = r1.w * r1.w;
	r1.w = r1.w * r2.x;
	r3.xyz = c43.xyz;
	r3.xyz = -r3.xyz + c44.xyz;
	r3.xyz = (r1.www * r3.xyz) + c43.xyz;
	r1.w = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r1.w = clamp(r1.w * r2.w, 0.0, 1.0);
	r2.x = (r1.w * c2.y) + c2.z;
	r1.w = r1.w * r1.w;
	r1.w = r1.w * r2.x;
	r1.w = r1.w * r1.w;
	r2.xyz = mix(r3.xyz, c45.xyz, r1.www);
	r2.xyz = r2.xyz * c1.xyz;
	r3.x = c46.x;
	r2.xyz = ((-r3.x >= 0.0) ? c1.xyz : r2.xyz);
	r3 = s13_texture.sample(s13, v0.xy);
	r1.w = clamp(r3.y + c12.x, 0.0, 1.0);
	r3.xyz = mix(c0.xxx, r2.xyz, r1.www);
	r1.xyz = r1.xyz * r3.xyz;
	r1.w = (c1.w * v4.w) + -c1.w;
	r2.w = c1.w;
	r1.w = (c12.w * r1.w) + r2.w;
	r1.xyz = r0.xyz * r1.xyz;
	r2 = s11_texture.sample(s11, v0.xy);
	r3.xyz = mix(r0.www, r2.xyz, c3.www);
	r2.xyz = r3.xyz * c11.xxx;
	r0.xyz = (c4.xyz * r0.xyz) + -r1.xyz;
	r0.xyz = (r2.xyz * r0.xyz) + r1.xyz;
	r1.xyz = -c6.xyz + v2.xyz;
	r0.w = dot(r1.xyz, r1.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = (r0.w * c5.x) + c5.y;
	r0.w = clamp(r0.w * c2.w, 0.0, 1.0);
	r1.x = (r0.w * c2.y) + c2.z;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.x;
	r0.w = r0.w * r1.w;
	r1.x = abs(c12.y);
	r1.yzw = r0.xyz * c30.xxx;
	r2.x = c29.w * v5.z;
	oC0.w = ((-r1.x >= 0.0) ? r0.w : r2.x);
	r0.w = v1.w * v1.w;
	r1.x = c30.x;
	r0.xyz = (r0.xyz * -r1.xxx) + c29.xyz;
	oC0.xyz = (r0.www * r0.xyz) + r1.yzw;
	#undef c1
	#undef c3
	#undef c4
	#undef c6
	#undef c11
	#undef c12
	#undef c13
	#undef c29
	#undef c30
	#undef c43
	#undef c44
	#undef c45
	#undef c46
	#undef c64
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

