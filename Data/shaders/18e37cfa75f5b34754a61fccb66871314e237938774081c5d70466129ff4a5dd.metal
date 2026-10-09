#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[34];
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
	texture2d<float> s2_texture [[texture(2)]],
	sampler s2 [[sampler(2)]],
	texture2d<float> s4_texture [[texture(4)]],
	sampler s4 [[sampler(4)]],
	texture2d<float> s13_texture [[texture(13)]],
	sampler s13 [[sampler(13)]],
	depth2d<float> s15_texture [[texture(15)]],
	sampler s15 [[sampler(15)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c2 = float4(-5.000000000e-01, 4.882812500e-04, 0.000000000e+00, -4.882812500e-04); (void) c2;
	const float4 c5 = float4(6.250000000e-02, 1.250000000e-01, 2.500000000e-01, 2.500000000e+01); (void) c5;
	const float4 c7 = float4(0.000000000e+00, -1.000000000e+00, -2.000000000e+00, 3.000000000e+00); (void) c7;
	const float4 c8 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, 0.000000000e+00); (void) c8;
	const float4 c9 = float4(7.999999798e-04, -7.999999821e-02, 0.000000000e+00, 0.000000000e+00); (void) c9;
	const float4 c11 = float4(2.000000000e+00, -1.000000000e+00, 1.000000000e+00, 0.000000000e+00); (void) c11;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	float4 r7;
	float4 r8;
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c3 uniforms.uniforms_float4[2]
	#define c4 uniforms.uniforms_float4[3]
	#define c6 uniforms.uniforms_float4[4]
	#define c10 uniforms.uniforms_float4[5]
	#define c12 uniforms.uniforms_float4[6]
	#define c13 uniforms.uniforms_float4[7]
	#define c19 uniforms.uniforms_float4[8]
	#define c20 uniforms.uniforms_float4[9]
	#define c21 uniforms.uniforms_float4[10]
	#define c29 uniforms.uniforms_float4[11]
	#define c30 uniforms.uniforms_float4[12]
	#define c43 uniforms.uniforms_float4[13]
	#define c44 uniforms.uniforms_float4[14]
	#define c45 uniforms.uniforms_float4[15]
	#define c46 uniforms.uniforms_float4[16]
	#define c64 uniforms.uniforms_float4[17]
	#define c67 uniforms.uniforms_float4[18]
	#define c68 uniforms.uniforms_float4[19]
	#define c69 uniforms.uniforms_float4[20]
	#define c70 uniforms.uniforms_float4[21]
	#define c71 uniforms.uniforms_float4[22]
	#define c73 uniforms.uniforms_float4[23]
	#define c74 uniforms.uniforms_float4[24]
	#define c77 uniforms.uniforms_float4[25]
	#define c78 uniforms.uniforms_float4[26]
	#define c81 uniforms.uniforms_float4[27]
	#define c82 uniforms.uniforms_float4[28]
	#define c85 uniforms.uniforms_float4[29]
	#define c86 uniforms.uniforms_float4[30]
	#define c87 uniforms.uniforms_float4[31]
	#define c88 uniforms.uniforms_float4[32]
	#define c89 uniforms.uniforms_float4[33]
	#define b0 uniforms.uniforms_bool[0]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	r1 = s2_texture.sample(s2, v1.xy);
	r1.xyz = r1.xyz * c10.xyz;
	r1.xyz = (r1.xyz * c11.xxx) + c11.yyy;
	r2.zw = c11.zw;
	r1.xyz = (c4.www * r1.xyz) + r2.zzz;
	r0.xyz = r0.xyz * r1.xyz;
	r1 = s4_texture.sample(s4, v0.xy);
	if (b0) {
		r3 = (v3.xyzx * c11.zzzw) + c11.wwwz;
		r4.x = dot(r3, c69);
		r4.y = dot(r3, c70);
		r1.yz = clamp(r4.xy, float2(0.0), float2(1.0));
		r1.yz = -r4.xy + r1.yz;
		r1.y = dot(r1.yz, c11.zz) + c11.w;
		r5.x = dot(r3, c73);
		r5.y = dot(r3, c74);
		r1.zw = clamp(r5.xy, float2(0.0), float2(1.0));
		r1.zw = -r5.xy + r1.zw;
		r1.z = dot(r1.zw, c11.zz) + c11.w;
		r6.x = dot(r3, c77);
		r6.y = dot(r3, c78);
		r5.z = c11.z;
		r6.z = c11.x;
		r5.xyz = ((-abs(r1.z) >= 0.0) ? r5.xyz : r6.xyz);
		r4.zw = c11.ww;
		r1.yzw = ((-abs(r1.y) >= 0.0) ? r4.xyz : r5.xyz);
		r4.z = dot(r3, c71);
		r2.xy = r1.yz + c2.xx;
		r2.xy = abs(r2.xy) + -c67.zz;
		r2.xy = clamp(r2.xy * c67.ww, float2(0.0), float2(1.0));
		r2.xy = -r2.xy + c11.zz;
		r2.x = r2.y * r2.x;
		r1.yz = clamp(r1.yz, float2(0.0), float2(1.0));
		r5.xyz = r1.www + -c11.wzx;
		r6 = ((-abs(r5.x) >= 0.0) ? c85.zwxy : r2.wwww);
		r6 = ((-abs(r5.y) >= 0.0) ? c86.zwxy : r6);
		r5 = ((-abs(r5.z) >= 0.0) ? c87.zwxy : r6);
		r4.xy = (r1.yz * r5.xy) + r5.zw;
		r5 = r4 + c2.yyzz;
		r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
		r6 = r4 + c2.wyzz;
		r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
		r7 = r4 + c2.ywzz;
		r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
		r8 = r4 + c2.wwzz;
		r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r5.y = r6.x;
		r5.z = r7.x;
		r5.w = r8.x;
		r1.y = dot(r5, c5.xxxx);
		r5 = r4 + c2.yzzz;
		r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
		r6 = r4 + c2.wzzz;
		r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
		r7 = r4 + c2.zwzz;
		r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
		r8 = r4 + c2.zyzz;
		r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r5.y = r6.x;
		r5.z = r7.x;
		r5.w = r8.x;
		r1.z = dot(r5, c5.yyyy);
		r5 = float4(s15_texture.sample_compare(s15, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
		r1.y = r1.z + r1.y;
		r1.y = (r5.x * c5.z) + r1.y;
		if (r2.x < c11.z) {
			r5.xyz = r1.www + c7.xyz;
			r6 = ((-abs(r5.x) >= 0.0) ? c73 : r2.wwww);
			r7 = ((-abs(r5.x) >= 0.0) ? c74 : r2.wwww);
			r6 = ((-abs(r5.y) >= 0.0) ? c77 : r6);
			r7 = ((-abs(r5.y) >= 0.0) ? c78 : r7);
			r6 = ((-abs(r5.z) >= 0.0) ? c81 : r6);
			r7 = ((-abs(r5.z) >= 0.0) ? c82 : r7);
			r6.x = clamp(dot(r3, r6), 0.0, 1.0);
			r6.y = clamp(dot(r3, r7), 0.0, 1.0);
			r3 = ((-abs(r5.x) >= 0.0) ? c86.zwxy : r2.wwww);
			r3 = ((-abs(r5.y) >= 0.0) ? c87.zwxy : r3);
			r3 = ((-abs(r5.z) >= 0.0) ? c88.zwxy : r3);
			r4.xy = (r6.xy * r3.xy) + r3.zw;
			r3 = r4 + c2.yyzz;
			r3 = float4(s15_texture.sample_compare(s15, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
			r6 = r4 + c2.wyzz;
			r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
			r7 = r4 + c2.ywzz;
			r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
			r8 = r4 + c2.wwzz;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r3.y = r6.x;
			r3.z = r7.x;
			r3.w = r8.x;
			r1.z = dot(r3, c5.xxxx);
			r3 = r4 + c2.yzzz;
			r3 = float4(s15_texture.sample_compare(s15, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
			r6 = r4 + c2.wzzz;
			r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
			r7 = r4 + c2.zwzz;
			r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
			r8 = r4 + c2.zyzz;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r3.y = r6.x;
			r3.z = r7.x;
			r3.w = r8.x;
			r1.w = dot(r3, c5.yyyy);
			r3 = float4(s15_texture.sample_compare(s15, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
			r1.z = r1.w + r1.z;
			r1.z = (r3.x * c5.z) + r1.z;
			r1.z = ((r5.z >= 0.0) ? c11.z : r1.z);
			r3.x = mix(r1.z, r1.y, r2.x);
			r1.y = r3.x;
		}
		r2.xyw = -c89.xyz + v3.xyz;
		r1.z = dot(r2.xyw, r2.xyw);
		r1.z = clamp((r1.z * c68.y) + c68.x, 0.0, 1.0);
		r2.x = mix(r1.y, c11.z, r1.z);
	} else {
		r2.x = c11.z;
	}
	r3.xyz = v4.xyz;
	r1.yzw = (r3.xyz * r2.xxx) + v5.xyz;
	if (b0) {
		r3.xyz = c64.xyz * v4.www;
		r2.xyw = (r3.xyz * r2.xxx) + v5.xyz;
		r2.xyw = ((-v4.w >= 0.0) ? r1.yzw : r2.xyw);
		r3.x = log2(r2.x);
		r3.y = log2(r2.y);
		r3.z = log2(r2.w);
		r3.xyz = r3.xyz * c13.xxx;
		r4.x = exp2(r3.x);
		r4.y = exp2(r3.y);
		r4.z = exp2(r3.z);
		r1.yzw = ((-c13.x >= 0.0) ? r2.xyw : r4.xyz);
	}
	r0.w = r0.w + c11.y;
	r0.w = (c20.w * r0.w) + r2.z;
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
	r3 = s13_texture.sample(s13, v0.xy);
	r2.w = clamp(r3.y + c12.x, 0.0, 1.0);
	r2.xyz = r2.xyz + c11.yyy;
	r2.xyz = (r2.www * r2.xyz) + c11.zzz;
	r3.yzw = r1.yzw * r2.xyz;
	r4.xy = abs(c12.zy);
	r1.x = ((-r4.x >= 0.0) ? r1.x : r3.x);
	r0.w = r0.w * c1.w;
	r2.w = (r0.w * v5.w) + -r0.w;
	r0.w = (c12.w * r2.w) + r0.w;
	r4.xzw = c20.xyz + -v3.xyz;
	r2.w = dot(v2.xyz, r4.xzw);
	r2.w = r2.w + r2.w;
	r3.x = dot(v2.xyz, v2.xyz);
	r5.xyz = r4.xzw * r3.xxx;
	r5.xyz = (r2.www * v2.xyz) + -r5.xyz;
	r5 = s1_texture.sample(s1, r5.xyz);
	r5.xyz = r5.xyz * c30.zzz;
	r5.xyz = r1.xxx * r5.xyz;
	r5.xyz = r5.xyz * c0.xyz;
	r1.xyz = (r1.yzw * r2.xyz) + -c19.zzz;
	r1.xyz = r1.xyz * c19.www;
	r1.xyz = (r5.xyz * r1.xyz) + -r5.xyz;
	r1.xyz = (c19.yyy * r1.xyz) + r5.xyz;
	r2.xyz = (r1.xyz * r1.xyz) + -r1.xyz;
	r1.xyz = (c19.xxx * r2.xyz) + r1.xyz;
	r1.w = dot(r1.xyz, c8.xyz);
	r2.xyz = mix(r1.www, r1.xyz, c3.xyz);
	r0.xyz = (r0.xyz * r3.yzw) + r2.xyz;
	r1.xyz = -c6.xyz + v3.xyz;
	r1.x = dot(r1.xyz, r1.xyz);
	r1.x = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.x = (r1.x * c9.x) + c9.y;
	r1.x = clamp(r1.x * c5.w, 0.0, 1.0);
	r1.y = (r1.x * c7.z) + c7.w;
	r1.x = r1.x * r1.x;
	r1.x = r1.x * r1.y;
	r0.w = r0.w * r1.x;
	r1.x = dot(r4.xzw, r4.xzw);
	r1.x = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.x = clamp((r1.x * c21.w) + c21.x, 0.0, 1.0);
	r2.x = min(r1.x, c21.z);
	r1.xyz = r0.xyz * c30.xxx;
	r1.w = c29.w * v6.z;
	oC0.w = ((-r4.y >= 0.0) ? r0.w : r1.w);
	r0.w = r2.x * r2.x;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	oC0.xyz = (r0.www * r0.xyz) + r1.xyz;
	#undef c0
	#undef c1
	#undef c3
	#undef c4
	#undef c6
	#undef c10
	#undef c12
	#undef c13
	#undef c19
	#undef c20
	#undef c21
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
	#undef v6
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

