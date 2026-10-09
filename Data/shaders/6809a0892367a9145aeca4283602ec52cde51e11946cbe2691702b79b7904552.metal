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
	texturecube<float> s1_texture [[texture(1)]],
	sampler s1 [[sampler(1)]],
	depth2d<float> s15_texture [[texture(15)]],
	sampler s15 [[sampler(15)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c2 = float4(1.0, 0.0, 2.0, -0.5); (void) c2;
	const float4 c4 = float4(0.0, -1.0, -2.0, 0.0); (void) c4;
	const float4 c5 = float4(0.000488281, 0.0, -0.000488281, 0.062499999); (void) c5;
	const float4 c6 = float4(0.125, 0.25, -2.0, 3.0); (void) c6;
	const float4 c7 = float4(0.298999992, 0.587000012, 0.114, 0.0); (void) c7;
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
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c3 uniforms.uniforms_float4[2]
	#define c12 uniforms.uniforms_float4[3]
	#define c13 uniforms.uniforms_float4[4]
	#define c19 uniforms.uniforms_float4[5]
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
	r1.xyz = c20.xyz + -v2.xyz;
	r2.xyz = normalize(r1.xyz);
	r1.w = dot(v1.xyz, v1.xyz);
	r2.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r3.xyz = r2.www * v1.xyz;
	r2.x = clamp(dot(r3.xyz, r2.xyz), 0.0, 1.0);
	r2.x = -r2.x + c2.x;
	r3.x = pow(abs(r2.x), c13.z);
	r2.x = (c13.y * r3.x) + c13.x;
	if (b0) {
		r3 = (v2.xyzx * c2.xxxy) + c2.yyyx;
		r4.x = dot(r3, c69);
		r4.y = dot(r3, c70);
		r2.yz = clamp(r4.xy, float2(0.0), float2(1.0));
		r2.yz = -r4.xy + r2.yz;
		r2.y = dot(r2.yz, c2.xx) + c2.y;
		r5.x = dot(r3, c73);
		r5.y = dot(r3, c74);
		r2.zw = clamp(r5.xy, float2(0.0), float2(1.0));
		r2.zw = -r5.xy + r2.zw;
		r2.z = dot(r2.zw, c2.xx) + c2.y;
		r6.x = dot(r3, c77);
		r6.y = dot(r3, c78);
		r5.z = c2.x;
		r6.z = c2.z;
		r5.xyz = ((-abs(r2.z) >= 0.0) ? r5.xyz : r6.xyz);
		r4.zw = c2.yy;
		r2.yzw = ((-abs(r2.y) >= 0.0) ? r4.xyz : r5.xyz);
		r4.z = dot(r3, c71);
		r5.xy = r2.yz + c2.ww;
		r5.xy = abs(r5.xy) + -c67.zz;
		r5.xy = clamp(r5.xy * c67.ww, float2(0.0), float2(1.0));
		r5.xy = -r5.xy + c2.xx;
		r5.x = r5.y * r5.x;
		r2.yz = clamp(r2.yz, float2(0.0), float2(1.0));
		r5.yzw = r2.www + -c2.yxz;
		r6.y = c2.y;
		r7 = ((-abs(r5.y) >= 0.0) ? c85.zwxy : r6.yyyy);
		r7 = ((-abs(r5.z) >= 0.0) ? c86.zwxy : r7);
		r7 = ((-abs(r5.w) >= 0.0) ? c87.zwxy : r7);
		r4.xy = (r2.yz * r7.xy) + r7.zw;
		r7 = r4 + c5.xxyy;
		r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
		r8 = r4 + c5.zxyy;
		r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r9 = r4 + c5.xzyy;
		r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
		r10 = r4 + c5.zzyy;
		r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r7.y = r8.x;
		r7.z = r9.x;
		r7.w = r10.x;
		r2.y = dot(r7, c5.wwww);
		r7 = r4 + c5.xyyy;
		r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
		r8 = r4 + c5.zyyy;
		r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r9 = r4 + c5.yzyy;
		r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
		r10 = r4 + c5.yxyy;
		r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r7.y = r8.x;
		r7.z = r9.x;
		r7.w = r10.x;
		r2.z = dot(r7, c6.xxxx);
		r7 = float4(s15_texture.sample_compare(s15, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
		r2.y = r2.z + r2.y;
		r2.y = (r7.x * c6.y) + r2.y;
		if (r5.x < c2.x) {
			r5.yzw = r2.www + c4.xyz;
			r7 = ((-abs(r5.y) >= 0.0) ? c73 : r6.yyyy);
			r8 = ((-abs(r5.y) >= 0.0) ? c74 : r6.yyyy);
			r7 = ((-abs(r5.z) >= 0.0) ? c77 : r7);
			r8 = ((-abs(r5.z) >= 0.0) ? c78 : r8);
			r7 = ((-abs(r5.w) >= 0.0) ? c81 : r7);
			r8 = ((-abs(r5.w) >= 0.0) ? c82 : r8);
			r7.x = clamp(dot(r3, r7), 0.0, 1.0);
			r7.y = clamp(dot(r3, r8), 0.0, 1.0);
			r3 = ((-abs(r5.y) >= 0.0) ? c86.zwxy : r6.yyyy);
			r3 = ((-abs(r5.z) >= 0.0) ? c87.zwxy : r3);
			r3 = ((-abs(r5.w) >= 0.0) ? c88.zwxy : r3);
			r4.xy = (r7.xy * r3.xy) + r3.zw;
			r3 = r4 + c5.xxyy;
			r3 = float4(s15_texture.sample_compare(s15, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
			r6 = r4 + c5.zxyy;
			r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
			r7 = r4 + c5.xzyy;
			r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
			r8 = r4 + c5.zzyy;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r3.y = r6.x;
			r3.z = r7.x;
			r3.w = r8.x;
			r2.z = dot(r3, c5.wwww);
			r3 = r4 + c5.xyyy;
			r3 = float4(s15_texture.sample_compare(s15, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
			r6 = r4 + c5.zyyy;
			r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
			r7 = r4 + c5.yzyy;
			r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
			r8 = r4 + c5.yxyy;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r3.y = r6.x;
			r3.z = r7.x;
			r3.w = r8.x;
			r2.w = dot(r3, c6.xxxx);
			r3 = float4(s15_texture.sample_compare(s15, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
			r2.z = r2.w + r2.z;
			r2.z = (r3.x * c6.y) + r2.z;
			r2.z = ((r5.w >= 0.0) ? c2.x : r2.z);
			r3.x = mix(r2.z, r2.y, r5.x);
			r2.y = r3.x;
		}
		r3.xyz = -c89.xyz + v2.xyz;
		r2.z = dot(r3.xyz, r3.xyz);
		r2.z = clamp((r2.z * c68.y) + c68.x, 0.0, 1.0);
		r3.x = mix(r2.y, c2.x, r2.z);
	} else {
		r3.x = c2.x;
	}
	r4.xyz = v3.xyz;
	r2.yzw = (r4.xyz * r3.xxx) + v4.xyz;
	if (b0) {
		r3.yzw = c64.xyz * v3.www;
		r3.xyz = (r3.yzw * r3.xxx) + v4.xyz;
		r2.yzw = ((-v3.w >= 0.0) ? r2.yzw : r3.xyz);
	}
	r3.x = r0.w + -c2.x;
	r4.x = c2.x;
	r3.x = (c20.w * r3.x) + r4.x;
	r3.y = clamp(v0.y, 0.0, 1.0);
	r3.zw = -c46.yz + c46.zw;
	r4.xy = r3.yy + -c46.yz;
	r3.y = ((r3.z == 0.0) ? FLT_MAX : 1.0 / r3.z);
	r3.y = clamp(r3.y * r4.x, 0.0, 1.0);
	r3.z = (r3.y * c6.z) + c6.w;
	r3.y = r3.y * r3.y;
	r3.y = r3.y * r3.z;
	r5.xyz = c43.xyz;
	r4.xzw = -r5.xyz + c44.xyz;
	r4.xzw = (r3.yyy * r4.xzw) + c43.xyz;
	r3.y = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r3.y = clamp(r3.y * r4.y, 0.0, 1.0);
	r3.z = (r3.y * c6.z) + c6.w;
	r3.y = r3.y * r3.y;
	r3.y = r3.y * r3.z;
	r3.y = r3.y * r3.y;
	r5.xyz = mix(r4.xzw, c45.xyz, r3.yyy);
	r3.yzw = r5.xyz * c1.xyz;
	r4.x = c46.x;
	r3.yzw = ((-r4.x >= 0.0) ? c1.xyz : r3.yzw);
	r0.w = clamp(r0.w + c12.x, 0.0, 1.0);
	r4.xyz = mix(c2.xxx, r3.yzw, r0.www);
	r3.yzw = r2.yzw * r4.xyz;
	r0.w = r3.x * c1.w;
	r3.x = (r0.w * v4.w) + -r0.w;
	r0.w = (c12.w * r3.x) + r0.w;
	r3.x = dot(v1.xyz, r1.xyz);
	r3.x = r3.x + r3.x;
	r1.xyz = r1.xyz * r1.www;
	r1.xyz = (r3.xxx * v1.xyz) + -r1.xyz;
	r1 = s1_texture.sample(s1, r1.xyz);
	r1.xyz = r1.xyz * c30.zzz;
	r1.xyz = r2.xxx * r1.xyz;
	r1.xyz = r1.xyz * c0.xyz;
	r2.xyz = (r2.yzw * r4.xyz) + -c19.zzz;
	r2.xyz = r2.xyz * c19.www;
	r2.xyz = (r1.xyz * r2.xyz) + -r1.xyz;
	r1.xyz = (c19.yyy * r2.xyz) + r1.xyz;
	r2.xyz = (r1.xyz * r1.xyz) + -r1.xyz;
	r1.xyz = (c19.xxx * r2.xyz) + r1.xyz;
	r1.w = dot(r1.xyz, c7.xyz);
	r2.xyz = mix(r1.www, r1.xyz, c3.xyz);
	r0.xyz = (r0.xyz * r3.yzw) + r2.xyz;
	r1.x = abs(c12.y);
	oC0.xyz = r0.xyz * c30.xxx;
	r0.x = c29.w * v5.z;
	oC0.w = ((-r1.x >= 0.0) ? r0.w : r0.x);
	#undef c0
	#undef c1
	#undef c3
	#undef c12
	#undef c13
	#undef c19
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

