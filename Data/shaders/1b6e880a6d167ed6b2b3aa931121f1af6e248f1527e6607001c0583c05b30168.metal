#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[25];
	bool uniforms_bool[1];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord3)]];
	float4 v2 [[user(texcoord4)]];
	float4 v3 [[user(texcoord6)]];
	float4 v4 [[user(texcoord7)]];
};

struct source_main_Output
{
	float4 oC0 [[color(0)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	texture2d<float> s0_texture [[texture(0)]],
	sampler s0 [[sampler(0)]],
	depth2d<float> s15_texture [[texture(15)]],
	sampler s15 [[sampler(15)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(1.000000000e+00, 0.000000000e+00, 2.000000000e+00, -5.000000000e-01); (void) c0;
	const float4 c2 = float4(4.882812500e-04, 0.000000000e+00, -4.882812500e-04, 6.250000000e-02); (void) c2;
	const float4 c3 = float4(1.250000000e-01, 2.500000000e-01, -2.000000000e+00, 3.000000000e+00); (void) c3;
	const float4 c4 = float4(2.125000060e-01, 7.153999805e-01, 7.209999859e-02, 0.000000000e+00); (void) c4;
	const float4 c5 = float4(0.000000000e+00, -1.000000000e+00, -2.000000000e+00, 0.000000000e+00); (void) c5;
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
	#define c20 uniforms.uniforms_float4[2]
	#define c29 uniforms.uniforms_float4[3]
	#define c30 uniforms.uniforms_float4[4]
	#define c43 uniforms.uniforms_float4[5]
	#define c44 uniforms.uniforms_float4[6]
	#define c45 uniforms.uniforms_float4[7]
	#define c46 uniforms.uniforms_float4[8]
	#define c67 uniforms.uniforms_float4[9]
	#define c68 uniforms.uniforms_float4[10]
	#define c69 uniforms.uniforms_float4[11]
	#define c70 uniforms.uniforms_float4[12]
	#define c71 uniforms.uniforms_float4[13]
	#define c73 uniforms.uniforms_float4[14]
	#define c74 uniforms.uniforms_float4[15]
	#define c77 uniforms.uniforms_float4[16]
	#define c78 uniforms.uniforms_float4[17]
	#define c81 uniforms.uniforms_float4[18]
	#define c82 uniforms.uniforms_float4[19]
	#define c85 uniforms.uniforms_float4[20]
	#define c86 uniforms.uniforms_float4[21]
	#define c87 uniforms.uniforms_float4[22]
	#define c88 uniforms.uniforms_float4[23]
	#define c89 uniforms.uniforms_float4[24]
	#define b0 uniforms.uniforms_bool[0]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	if (b0) {
		r1 = (v1.xyzx * c0.xxxy) + c0.yyyx;
		r2.x = dot(r1, c69);
		r2.y = dot(r1, c70);
		r3.xy = clamp(r2.xy, float2(0.0), float2(1.0));
		r3.xy = -r2.xy + r3.xy;
		r2.w = dot(r3.xy, c0.xx) + c0.y;
		r3.x = dot(r1, c73);
		r3.y = dot(r1, c74);
		r4.xy = clamp(r3.xy, float2(0.0), float2(1.0));
		r4.xy = -r3.xy + r4.xy;
		r3.w = dot(r4.xy, c0.xx) + c0.y;
		r4.x = dot(r1, c77);
		r4.y = dot(r1, c78);
		r3.z = c0.x;
		r4.z = c0.z;
		r3.xyz = ((-abs(r3.w) >= 0.0) ? r3.xyz : r4.xyz);
		r2.z = c0.y;
		r2.xyz = ((-abs(r2.w) >= 0.0) ? r2.xyz : r3.xyz);
		r3.z = dot(r1, c71);
		r4.xy = r2.xy + c0.ww;
		r4.xy = abs(r4.xy) + -c67.zz;
		r4.xy = clamp(r4.xy * c67.ww, float2(0.0), float2(1.0));
		r4.xy = -r4.xy + c0.xx;
		r2.w = r4.y * r4.x;
		r2.xy = clamp(r2.xy, float2(0.0), float2(1.0));
		r4.xyz = r2.zzz + -c0.yxz;
		r5.y = c0.y;
		r6 = ((-abs(r4.x) >= 0.0) ? c85.zwxy : r5.yyyy);
		r6 = ((-abs(r4.y) >= 0.0) ? c86.zwxy : r6);
		r4 = ((-abs(r4.z) >= 0.0) ? c87.zwxy : r6);
		r3.xy = (r2.xy * r4.xy) + r4.zw;
		r3.w = c0.y;
		r4 = r3 + c2.xxyy;
		r4 = float4(s15_texture.sample_compare(s15, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
		r6 = r3 + c2.zxyy;
		r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
		r7 = r3 + c2.xzyy;
		r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
		r8 = r3 + c2.zzyy;
		r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r4.y = r6.x;
		r4.z = r7.x;
		r4.w = r8.x;
		r2.x = dot(r4, c2.wwww);
		r4 = r3 + c2.xyyy;
		r4 = float4(s15_texture.sample_compare(s15, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
		r6 = r3 + c2.zyyy;
		r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
		r7 = r3 + c2.yzyy;
		r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
		r8 = r3 + c2.yxyy;
		r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r4.y = r6.x;
		r4.z = r7.x;
		r4.w = r8.x;
		r2.y = dot(r4, c3.xxxx);
		r4 = float4(s15_texture.sample_compare(s15, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
		r2.x = r2.y + r2.x;
		r2.x = (r4.x * c3.y) + r2.x;
		if (r2.w < c0.x) {
			r4.xyz = r2.zzz + c5.xyz;
			r6 = ((-abs(r4.x) >= 0.0) ? c73 : r5.yyyy);
			r7 = ((-abs(r4.x) >= 0.0) ? c74 : r5.yyyy);
			r6 = ((-abs(r4.y) >= 0.0) ? c77 : r6);
			r7 = ((-abs(r4.y) >= 0.0) ? c78 : r7);
			r6 = ((-abs(r4.z) >= 0.0) ? c81 : r6);
			r7 = ((-abs(r4.z) >= 0.0) ? c82 : r7);
			r6.x = clamp(dot(r1, r6), 0.0, 1.0);
			r6.y = clamp(dot(r1, r7), 0.0, 1.0);
			r1 = ((-abs(r4.x) >= 0.0) ? c86.zwxy : r5.yyyy);
			r1 = ((-abs(r4.y) >= 0.0) ? c87.zwxy : r1);
			r1 = ((-abs(r4.z) >= 0.0) ? c88.zwxy : r1);
			r3.xy = (r6.xy * r1.xy) + r1.zw;
			r1 = r3 + c2.xxyy;
			r1 = float4(s15_texture.sample_compare(s15, (r1.xyz).xy, (r1.xyz).z, level(r1.w)));
			r5 = r3 + c2.zxyy;
			r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
			r6 = r3 + c2.xzyy;
			r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
			r7 = r3 + c2.zzyy;
			r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
			r1.y = r5.x;
			r1.z = r6.x;
			r1.w = r7.x;
			r1.x = dot(r1, c2.wwww);
			r5 = r3 + c2.xyyy;
			r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
			r6 = r3 + c2.zyyy;
			r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
			r7 = r3 + c2.yzyy;
			r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
			r8 = r3 + c2.yxyy;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r5.y = r6.x;
			r5.z = r7.x;
			r5.w = r8.x;
			r1.y = dot(r5, c3.xxxx);
			r3 = float4(s15_texture.sample_compare(s15, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
			r1.x = r1.y + r1.x;
			r1.x = (r3.x * c3.y) + r1.x;
			r1.x = ((r4.z >= 0.0) ? c0.x : r1.x);
			r3.x = mix(r1.x, r2.x, r2.w);
			r2.x = r3.x;
		}
		r1.xyz = -c89.xyz + v1.xyz;
		r1.x = dot(r1.xyz, r1.xyz);
		r1.x = clamp((r1.x * c68.y) + c68.x, 0.0, 1.0);
		r3.x = mix(r2.x, c0.x, r1.x);
	} else {
		r3.x = c0.x;
	}
	r1.xyz = v2.xyz;
	r1.xyz = (r1.xyz * r3.xxx) + v3.xyz;
	if (b0) {
		r1.w = dot(r1.xyz, c4.xyz);
		r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
		r1.w = r1.w * v2.w;
		r2.x = -r3.x + c0.x;
		r1.w = (r1.w * -r2.x) + c0.x;
		r2.xyz = r1.www * r1.zyx;
		r2.w = (r1.w * -c0.w) + -c0.w;
		r1.xyz = mix(r2.xyz, r2.zyx, r2.www);
	}
	r1.w = r0.w + -c0.x;
	r2.x = c0.x;
	r1.w = (c20.w * r1.w) + r2.x;
	r2.x = clamp(v0.y, 0.0, 1.0);
	r2.yz = -c46.yz + c46.zw;
	r2.xw = r2.xx + -c46.yz;
	r2.y = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r2.x = clamp(r2.y * r2.x, 0.0, 1.0);
	r2.y = (r2.x * c3.z) + c3.w;
	r2.x = r2.x * r2.x;
	r2.x = r2.x * r2.y;
	r3.xyz = c43.xyz;
	r3.xyz = -r3.xyz + c44.xyz;
	r3.xyz = (r2.xxx * r3.xyz) + c43.xyz;
	r2.x = ((r2.z == 0.0) ? FLT_MAX : 1.0 / r2.z);
	r2.x = clamp(r2.x * r2.w, 0.0, 1.0);
	r2.y = (r2.x * c3.z) + c3.w;
	r2.x = r2.x * r2.x;
	r2.x = r2.x * r2.y;
	r2.x = r2.x * r2.x;
	r4.xyz = mix(r3.xyz, c45.xyz, r2.xxx);
	r2.xyz = r4.xyz * c1.xyz;
	r3.x = c46.x;
	r2.xyz = ((-r3.x >= 0.0) ? c1.xyz : r2.xyz);
	r0.w = clamp(r0.w + c12.x, 0.0, 1.0);
	r3.xyz = mix(c0.xxx, r2.xyz, r0.www);
	r1.xyz = r1.xyz * r3.xyz;
	r0.w = r1.w * c1.w;
	r1.w = (r0.w * v3.w) + -r0.w;
	r0.w = (c12.w * r1.w) + r0.w;
	r0.xyz = r0.xyz * r1.xyz;
	r1.x = abs(c12.y);
	oC0.xyz = r0.xyz * c30.xxx;
	r0.x = c29.w * v4.z;
	oC0.w = ((-r1.x >= 0.0) ? r0.w : r0.x);
	#undef c1
	#undef c12
	#undef c20
	#undef c29
	#undef c30
	#undef c43
	#undef c44
	#undef c45
	#undef c46
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

