#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[30];
	bool uniforms_bool[1];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord1)]];
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
	texture2d<float> s2_texture [[texture(2)]],
	sampler s2 [[sampler(2)]],
	depth2d<float> s15_texture [[texture(15)]],
	sampler s15 [[sampler(15)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(-0.5, 0.000488281, 0.0, -0.000488281); (void) c0;
	const float4 c2 = float4(0.062499999, 0.125, 0.25, 25.0); (void) c2;
	const float4 c3 = float4(2.0, -1.0, 1.0, 0.0); (void) c3;
	const float4 c5 = float4(0.0008, -0.080000001, 0.0, 0.0); (void) c5;
	const float4 c7 = float4(0.0, -1.0, -2.0, 3.0); (void) c7;
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
	#define c4 uniforms.uniforms_float4[1]
	#define c6 uniforms.uniforms_float4[2]
	#define c10 uniforms.uniforms_float4[3]
	#define c12 uniforms.uniforms_float4[4]
	#define c13 uniforms.uniforms_float4[5]
	#define c20 uniforms.uniforms_float4[6]
	#define c29 uniforms.uniforms_float4[7]
	#define c30 uniforms.uniforms_float4[8]
	#define c43 uniforms.uniforms_float4[9]
	#define c44 uniforms.uniforms_float4[10]
	#define c45 uniforms.uniforms_float4[11]
	#define c46 uniforms.uniforms_float4[12]
	#define c64 uniforms.uniforms_float4[13]
	#define c67 uniforms.uniforms_float4[14]
	#define c68 uniforms.uniforms_float4[15]
	#define c69 uniforms.uniforms_float4[16]
	#define c70 uniforms.uniforms_float4[17]
	#define c71 uniforms.uniforms_float4[18]
	#define c73 uniforms.uniforms_float4[19]
	#define c74 uniforms.uniforms_float4[20]
	#define c77 uniforms.uniforms_float4[21]
	#define c78 uniforms.uniforms_float4[22]
	#define c81 uniforms.uniforms_float4[23]
	#define c82 uniforms.uniforms_float4[24]
	#define c85 uniforms.uniforms_float4[25]
	#define c86 uniforms.uniforms_float4[26]
	#define c87 uniforms.uniforms_float4[27]
	#define c88 uniforms.uniforms_float4[28]
	#define c89 uniforms.uniforms_float4[29]
	#define b0 uniforms.uniforms_bool[0]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	r1 = s2_texture.sample(s2, v1.xy);
	r1.xyz = r1.xyz * c10.xyz;
	r1.xyz = (r1.xyz * c3.xxx) + c3.yyy;
	r2.zw = c3.zw;
	r1.xyz = (c4.www * r1.xyz) + r2.zzz;
	r0.xyz = r0.xyz * r1.xyz;
	if (b0) {
		r1 = (v2.xyzx * c3.zzzw) + c3.wwwz;
		r3.x = dot(r1, c69);
		r3.y = dot(r1, c70);
		r2.xy = clamp(r3.xy, float2(0.0), float2(1.0));
		r2.xy = -r3.xy + r2.xy;
		r2.x = dot(r2.xy, c3.zz) + c3.w;
		r4.x = dot(r1, c73);
		r4.y = dot(r1, c74);
		r5.xy = clamp(r4.xy, float2(0.0), float2(1.0));
		r5.xy = -r4.xy + r5.xy;
		r2.y = dot(r5.xy, c3.zz) + c3.w;
		r5.x = dot(r1, c77);
		r5.y = dot(r1, c78);
		r4.zw = c3.zw;
		r5.z = c3.x;
		r4.xyz = ((-abs(r2.y) >= 0.0) ? r4.xyz : r5.xyz);
		r3.z = c3.w;
		r3.xyz = ((-abs(r2.x) >= 0.0) ? r3.xyz : r4.xyz);
		r4.z = dot(r1, c71);
		r2.xy = r3.xy + c0.xx;
		r2.xy = abs(r2.xy) + -c67.zz;
		r2.xy = clamp(r2.xy * c67.ww, float2(0.0), float2(1.0));
		r2.xy = -r2.xy + c3.zz;
		r2.x = r2.y * r2.x;
		r3.xy = clamp(r3.xy, float2(0.0), float2(1.0));
		r5.xyz = r3.zzz + -c3.wzx;
		r6 = ((-abs(r5.x) >= 0.0) ? c85.zwxy : r2.wwww);
		r6 = ((-abs(r5.y) >= 0.0) ? c86.zwxy : r6);
		r5 = ((-abs(r5.z) >= 0.0) ? c87.zwxy : r6);
		r4.xy = (r3.xy * r5.xy) + r5.zw;
		r5 = r4 + c0.yyzz;
		r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
		r6 = r4 + c0.wyzz;
		r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
		r7 = r4 + c0.ywzz;
		r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
		r8 = r4 + c0.wwzz;
		r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r5.y = r6.x;
		r5.z = r7.x;
		r5.w = r8.x;
		r2.y = dot(r5, c2.xxxx);
		r5 = r4 + c0.yzzz;
		r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
		r6 = r4 + c0.wzzz;
		r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
		r7 = r4 + c0.zwzz;
		r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
		r8 = r4 + c0.zyzz;
		r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r5.y = r6.x;
		r5.z = r7.x;
		r5.w = r8.x;
		r3.x = dot(r5, c2.yyyy);
		r5 = float4(s15_texture.sample_compare(s15, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
		r2.y = r2.y + r3.x;
		r2.y = (r5.x * c2.z) + r2.y;
		if (r2.x < c3.z) {
			r3.xyz = r3.zzz + c7.xyz;
			r5 = ((-abs(r3.x) >= 0.0) ? c73 : r2.wwww);
			r6 = ((-abs(r3.x) >= 0.0) ? c74 : r2.wwww);
			r5 = ((-abs(r3.y) >= 0.0) ? c77 : r5);
			r6 = ((-abs(r3.y) >= 0.0) ? c78 : r6);
			r5 = ((-abs(r3.z) >= 0.0) ? c81 : r5);
			r6 = ((-abs(r3.z) >= 0.0) ? c82 : r6);
			r5.x = clamp(dot(r1, r5), 0.0, 1.0);
			r5.y = clamp(dot(r1, r6), 0.0, 1.0);
			r1 = ((-abs(r3.x) >= 0.0) ? c86.zwxy : r2.wwww);
			r1 = ((-abs(r3.y) >= 0.0) ? c87.zwxy : r1);
			r1 = ((-abs(r3.z) >= 0.0) ? c88.zwxy : r1);
			r4.xy = (r5.xy * r1.xy) + r1.zw;
			r1 = r4 + c0.yyzz;
			r1 = float4(s15_texture.sample_compare(s15, (r1.xyz).xy, (r1.xyz).z, level(r1.w)));
			r5 = r4 + c0.wyzz;
			r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
			r6 = r4 + c0.ywzz;
			r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
			r7 = r4 + c0.wwzz;
			r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
			r1.y = r5.x;
			r1.z = r6.x;
			r1.w = r7.x;
			r1.x = dot(r1, c2.xxxx);
			r5 = r4 + c0.yzzz;
			r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
			r6 = r4 + c0.wzzz;
			r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
			r7 = r4 + c0.zwzz;
			r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
			r8 = r4 + c0.zyzz;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r5.y = r6.x;
			r5.z = r7.x;
			r5.w = r8.x;
			r1.y = dot(r5, c2.yyyy);
			r4 = float4(s15_texture.sample_compare(s15, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
			r1.x = r1.y + r1.x;
			r1.x = (r4.x * c2.z) + r1.x;
			r1.x = ((r3.z >= 0.0) ? c3.z : r1.x);
			r3.x = mix(r1.x, r2.y, r2.x);
			r2.y = r3.x;
		}
		r1.xyz = -c89.xyz + v2.xyz;
		r1.x = dot(r1.xyz, r1.xyz);
		r1.x = clamp((r1.x * c68.y) + c68.x, 0.0, 1.0);
		r3.x = mix(r2.y, c3.z, r1.x);
	} else {
		r3.x = c3.z;
	}
	r1.xyz = v3.xyz;
	r1.xyz = (r1.xyz * r3.xxx) + v4.xyz;
	if (b0) {
		r2.xyw = c64.xyz * v3.www;
		r2.xyw = (r2.xyw * r3.xxx) + v4.xyz;
		r2.xyw = ((-v3.w >= 0.0) ? r1.xyz : r2.xyw);
		r3.x = log2(r2.x);
		r3.y = log2(r2.y);
		r3.z = log2(r2.w);
		r3.xyz = r3.xyz * c13.xxx;
		r4.x = exp2(r3.x);
		r4.y = exp2(r3.y);
		r4.z = exp2(r3.z);
		r1.xyz = ((-c13.x >= 0.0) ? r2.xyw : r4.xyz);
	}
	r1.w = r0.w + c3.y;
	r1.w = (c20.w * r1.w) + r2.z;
	r2.x = clamp(v0.y, 0.0, 1.0);
	r2.yz = -c46.yz + c46.zw;
	r2.xw = r2.xx + -c46.yz;
	r2.y = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r2.x = clamp(r2.y * r2.x, 0.0, 1.0);
	r2.y = (r2.x * c7.z) + c7.w;
	r2.x = r2.x * r2.x;
	r2.x = r2.x * r2.y;
	r3.xyz = c43.xyz;
	r3.xyz = -r3.xyz + c44.xyz;
	r3.xyz = (r2.xxx * r3.xyz) + c43.xyz;
	r2.x = ((r2.z == 0.0) ? FLT_MAX : 1.0 / r2.z);
	r2.x = clamp(r2.x * r2.w, 0.0, 1.0);
	r2.y = (r2.x * c7.z) + c7.w;
	r2.x = r2.x * r2.x;
	r2.x = r2.x * r2.y;
	r2.x = r2.x * r2.x;
	r4.xyz = mix(r3.xyz, c45.xyz, r2.xxx);
	r2.xyz = r4.xyz * c1.xyz;
	r3.x = c46.x;
	r2.xyz = ((-r3.x >= 0.0) ? c1.xyz : r2.xyz);
	r0.w = clamp(r0.w + c12.x, 0.0, 1.0);
	r2.xyz = r2.xyz + c3.yyy;
	r2.xyz = (r0.www * r2.xyz) + c3.zzz;
	r1.xyz = r1.xyz * r2.xyz;
	r0.w = r1.w * c1.w;
	r1.w = (r0.w * v4.w) + -r0.w;
	r0.w = (c12.w * r1.w) + r0.w;
	r0.xyz = r0.xyz * r1.xyz;
	r1.xyz = -c6.xyz + v2.xyz;
	r1.x = dot(r1.xyz, r1.xyz);
	r1.x = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.x = (r1.x * c5.x) + c5.y;
	r1.x = clamp(r1.x * c2.w, 0.0, 1.0);
	r1.y = (r1.x * c7.z) + c7.w;
	r1.x = r1.x * r1.x;
	r1.x = r1.x * r1.y;
	r0.w = r0.w * r1.x;
	r1.x = abs(c12.y);
	oC0.xyz = r0.xyz * c30.xxx;
	r0.x = c29.w * v5.z;
	oC0.w = ((-r1.x >= 0.0) ? r0.w : r0.x);
	#undef c1
	#undef c4
	#undef c6
	#undef c10
	#undef c12
	#undef c13
	#undef c20
	#undef c29
	#undef c30
	#undef c43
	#undef c44
	#undef c45
	#undef c46
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

