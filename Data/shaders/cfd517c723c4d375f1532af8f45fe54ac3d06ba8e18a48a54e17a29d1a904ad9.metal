#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[29];
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
	texture2d<float> s7_texture [[texture(7)]],
	sampler s7 [[sampler(7)]],
	texture2d<float> s14_texture [[texture(14)]],
	sampler s14 [[sampler(14)]],
	depth2d<float> s15_texture [[texture(15)]],
	sampler s15 [[sampler(15)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c2 = float4(8.164966106e-01, 5.773502588e-01, 0.000000000e+00, 0.000000000e+00); (void) c2;
	const float4 c3 = float4(-4.082483351e-01, 7.071067691e-01, 5.773502588e-01, 0.000000000e+00); (void) c3;
	const float4 c4 = float4(-4.082482159e-01, -7.071068287e-01, 5.773502588e-01, 0.000000000e+00); (void) c4;
	const float4 c5 = float4(3.000000119e-01, 5.899999738e-01, 1.099999994e-01, 1.000000000e+00); (void) c5;
	const float4 c6 = float4(2.000000000e+00, -1.000000000e+00, 5.000000000e-01, -0.000000000e+00); (void) c6;
	const float4 c7 = float4(4.882812500e-04, 0.000000000e+00, -4.882812500e-04, 6.250000000e-02); (void) c7;
	const float4 c8 = float4(1.250000000e-01, 2.500000000e-01, 1.500000000e+02, 0.000000000e+00); (void) c8;
	const float4 c9 = float4(0.000000000e+00, -1.000000000e+00, -2.000000000e+00, 0.000000000e+00); (void) c9;
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
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c10 uniforms.uniforms_float4[2]
	#define c11 uniforms.uniforms_float4[3]
	#define c12 uniforms.uniforms_float4[4]
	#define c19 uniforms.uniforms_float4[5]
	#define c20 uniforms.uniforms_float4[6]
	#define c21 uniforms.uniforms_float4[7]
	#define c26 uniforms.uniforms_float4[8]
	#define c27 uniforms.uniforms_float4[9]
	#define c29 uniforms.uniforms_float4[10]
	#define c30 uniforms.uniforms_float4[11]
	#define c64 uniforms.uniforms_float4[12]
	#define c67 uniforms.uniforms_float4[13]
	#define c68 uniforms.uniforms_float4[14]
	#define c69 uniforms.uniforms_float4[15]
	#define c70 uniforms.uniforms_float4[16]
	#define c71 uniforms.uniforms_float4[17]
	#define c73 uniforms.uniforms_float4[18]
	#define c74 uniforms.uniforms_float4[19]
	#define c77 uniforms.uniforms_float4[20]
	#define c78 uniforms.uniforms_float4[21]
	#define c81 uniforms.uniforms_float4[22]
	#define c82 uniforms.uniforms_float4[23]
	#define c85 uniforms.uniforms_float4[24]
	#define c86 uniforms.uniforms_float4[25]
	#define c87 uniforms.uniforms_float4[26]
	#define c88 uniforms.uniforms_float4[27]
	#define c89 uniforms.uniforms_float4[28]
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
	r0.w = dot(r1.xyz, c5.xyz);
	r2 = s3_texture.sample(s3, v1.xy);
	r2.xyz = (r2.xyz * c6.xxx) + c6.yyy;
	r3.x = mix(r2.w, r1.w, c27.x);
	r2.w = mix(r3.x, r0.w, c10.y);
	r0.xyz = r0.xyz * r2.yyy;
	r0.xyz = (r2.xxx * v3.xyz) + r0.xyz;
	r0.xyz = (r2.zzz * v2.xyz) + r0.xyz;
	r3.xyz = normalize(r0.xyz);
	r0.xyz = c11.xyz + -v4.xyz;
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.xyz = r0.www * r0.xyz;
	r3.w = clamp(dot(r3.xyz, r0.xyz), 0.0, 1.0);
	r3.w = -r3.w + c5.w;
	r4.x = r3.w * r3.w;
	r3.w = (r3.w * -r3.w) + c6.z;
	r4.y = r4.x + r4.x;
	r4.x = (r4.x * c6.x) + c6.y;
	r4.z = -c19.x + c19.y;
	r5.x = mix(c19.y, c19.z, r4.x);
	r4.x = (r4.y * r4.z) + c19.x;
	r3.w = ((r3.w >= 0.0) ? r4.x : r5.x);
	if (b0) {
		r4 = (v4.xyzx * -c6.yyyw) + -c6.wwwy;
		r5.x = dot(r4, c69);
		r5.y = dot(r4, c70);
		r6.xy = clamp(r5.xy, float2(0.0), float2(1.0));
		r6.xy = -r5.xy + r6.xy;
		r5.w = dot(r6.xy, -c6.yy) + -c6.w;
		r6.x = dot(r4, c73);
		r6.y = dot(r4, c74);
		r7.xy = clamp(r6.xy, float2(0.0), float2(1.0));
		r7.xy = -r6.xy + r7.xy;
		r6.w = dot(r7.xy, -c6.yy) + -c6.w;
		r7.x = dot(r4, c77);
		r7.y = dot(r4, c78);
		r6.z = c5.w;
		r7.zw = c6.xw;
		r6.xyz = ((-abs(r6.w) >= 0.0) ? r6.xyz : r7.xyz);
		r5.z = -c6.w;
		r5.xyz = ((-abs(r5.w) >= 0.0) ? r5.xyz : r6.xyz);
		r6.z = dot(r4, c71);
		r7.xy = r5.xy + -c6.zz;
		r7.xy = abs(r7.xy) + -c67.zz;
		r7.xy = clamp(r7.xy * c67.ww, float2(0.0), float2(1.0));
		r7.xy = -r7.xy + c5.ww;
		r5.w = r7.y * r7.x;
		r5.xy = clamp(r5.xy, float2(0.0), float2(1.0));
		r7.xyz = r5.zzz + -abs(c6.wyx);
		r8 = ((-abs(r7.x) >= 0.0) ? c85.zwxy : -r7.wwww);
		r8 = ((-abs(r7.y) >= 0.0) ? c86.zwxy : r8);
		r8 = ((-abs(r7.z) >= 0.0) ? c87.zwxy : r8);
		r6.xy = (r5.xy * r8.xy) + r8.zw;
		r6.w = -c6.w;
		r8 = r6 + c7.xxyy;
		r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r9 = r6 + c7.zxyy;
		r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
		r10 = r6 + c7.xzyy;
		r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r11 = r6 + c7.zzyy;
		r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
		r8.y = r9.x;
		r8.z = r10.x;
		r8.w = r11.x;
		r5.x = dot(r8, c7.wwww);
		r8 = r6 + c7.xyyy;
		r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r9 = r6 + c7.zyyy;
		r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
		r10 = r6 + c7.yzyy;
		r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r11 = r6 + c7.yxyy;
		r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
		r8.y = r9.x;
		r8.z = r10.x;
		r8.w = r11.x;
		r5.y = dot(r8, c8.xxxx);
		r8 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
		r5.x = r5.y + r5.x;
		r5.x = (r8.x * c8.y) + r5.x;
		if (r5.w < c5.w) {
			r7.xyz = r5.zzz + c9.xyz;
			r8 = ((-abs(r7.x) >= 0.0) ? c73 : -r7.wwww);
			r9 = ((-abs(r7.x) >= 0.0) ? c74 : -r7.wwww);
			r8 = ((-abs(r7.y) >= 0.0) ? c77 : r8);
			r9 = ((-abs(r7.y) >= 0.0) ? c78 : r9);
			r8 = ((-abs(r7.z) >= 0.0) ? c81 : r8);
			r9 = ((-abs(r7.z) >= 0.0) ? c82 : r9);
			r8.x = clamp(dot(r4, r8), 0.0, 1.0);
			r8.y = clamp(dot(r4, r9), 0.0, 1.0);
			r4 = ((-abs(r7.x) >= 0.0) ? c86.zwxy : -r7.wwww);
			r4 = ((-abs(r7.y) >= 0.0) ? c87.zwxy : r4);
			r4 = ((-abs(r7.z) >= 0.0) ? c88.zwxy : r4);
			r6.xy = (r8.xy * r4.xy) + r4.zw;
			r4 = r6 + c7.xxyy;
			r4 = float4(s15_texture.sample_compare(s15, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
			r8 = r6 + c7.zxyy;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r9 = r6 + c7.xzyy;
			r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
			r10 = r6 + c7.zzyy;
			r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
			r4.y = r8.x;
			r4.z = r9.x;
			r4.w = r10.x;
			r4.x = dot(r4, c7.wwww);
			r8 = r6 + c7.xyyy;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r9 = r6 + c7.zyyy;
			r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
			r10 = r6 + c7.yzyy;
			r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
			r11 = r6 + c7.yxyy;
			r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
			r8.y = r9.x;
			r8.z = r10.x;
			r8.w = r11.x;
			r4.y = dot(r8, c8.xxxx);
			r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
			r4.x = r4.y + r4.x;
			r4.x = (r6.x * c8.y) + r4.x;
			r4.x = ((r7.z >= 0.0) ? c5.w : r4.x);
			r6.x = mix(r4.x, r5.x, r5.w);
			r5.x = r6.x;
		}
		r4.xyz = -c89.xyz + v4.xyz;
		r4.x = dot(r4.xyz, r4.xyz);
		r4.x = clamp((r4.x * c68.y) + c68.x, 0.0, 1.0);
		r6.x = mix(r5.x, c5.w, r4.x);
	} else {
		r6.x = c5.w;
	}
	r4.x = clamp(dot(r2.xz, c2.xy) + c2.z, 0.0, 1.0);
	r4.y = clamp(dot(r2.xyz, c3.xyz), 0.0, 1.0);
	r4.z = clamp(dot(r2.xyz, c4.xyz), 0.0, 1.0);
	r2.xyz = r4.xyz * r4.xyz;
	r4.xyz = r2.yyy * v6.xyz;
	r4.xyz = (r2.xxx * v5.xyz) + r4.xyz;
	r4.xyz = (r2.zzz * v7.xyz) + r4.xyz;
	r4.w = dot(r2.xyz, c5.www);
	if (b0) {
		r5.w = v5.w;
		r5.x = r5.w + v6.w;
		r5.x = r5.x + v7.w;
		r2.y = r2.y * v6.w;
		r2.x = (r2.x * v5.w) + r2.y;
		r2.x = (r2.z * v7.w) + r2.x;
		r2.xyz = r2.xxx * c64.xyz;
		r2.xyz = (r2.xyz * r6.xxx) + r4.xyz;
		r4.xyz = ((-r5.x >= 0.0) ? r4.xyz : r2.xyz);
	} else {
		r5.x = c5.w;
	}
	r2.x = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r2.xyz = r2.xxx * r4.xyz;
	r4.x = r5.x * r6.x;
	r5 = s7_texture.sample(s7, v0.xy);
	r4.y = abs(c10.z);
	r4.z = -r5.x + c5.w;
	r4.z = (r5.x * c8.z) + r4.z;
	r4.y = ((-r4.y >= 0.0) ? r4.z : c10.z);
	r4.w = c19.w;
	r5.xzw = (c0.www * r1.xyz) + -r4.www;
	r5.xyz = (r5.yyy * r5.xzw) + c19.www;
	r6.xyz = r4.www * c26.xyz;
	r5.xyz = ((c26.x >= 0.0) ? r6.xyz : r5.xyz);
	r6.xyz = c21.xyz + -v4.xyz;
	r4.z = dot(r6.xyz, r6.xyz);
	r4.z = ((r4.z == 0.0) ? FLT_MAX : rsqrt(abs(r4.z)));
	r7.xyz = c20.xyz * v8.xxx;
	r0.xyz = (r6.xyz * r4.zzz) + r0.xyz;
	r6.xyz = normalize(r0.xyz);
	r0.x = clamp(dot(r3.xyz, r6.xyz), 0.0, 1.0);
	r3.x = pow(abs(r0.x), r4.y);
	r0.xyz = r7.xyz * r3.xxx;
	r0.xyz = r4.xxx * r0.xyz;
	r3.xyz = r2.www * r5.xyz;
	r0.xyz = r0.xyz * r3.xyz;
	r2.w = clamp(r1.w + c27.z, 0.0, 1.0);
	r4.w = c5.w;
	r3.xyz = -r4.www + c1.xyz;
	r3.xyz = (r2.www * r3.xyz) + c5.www;
	r2.xyz = r2.xyz * r3.xyz;
	r2.xyz = r1.xyz * r2.xyz;
	r5 = s14_texture.sample(s14, v0.xy);
	r3.xyz = mix(r1.www, r5.xyz, c10.www);
	r1.xyz = (c0.xyz * r1.xyz) + -r2.xyz;
	r1.xyz = (r3.xyz * r1.xyz) + r2.xyz;
	r2.xyz = max(r1.xyz, -c6.www);
	r0.xyz = (r0.xyz * r3.www) + r2.xyz;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = clamp((r0.w * c12.w) + c12.x, 0.0, 1.0);
	r1.x = min(r0.w, c12.z);
	r1.yz = r4.ww + -c27.xy;
	r0.w = r1.y * c10.w;
	r0.w = r0.w * c27.z;
	r0.w = r1.z * r0.w;
	r2.x = mix(c5.w, r1.w, r0.w);
	oC0.w = r2.x * c1.w;
	r1.yzw = r0.xyz * c30.xxx;
	r0.w = r1.x * r1.x;
	r1.x = c30.x;
	r0.xyz = (r0.xyz * -r1.xxx) + c29.xyz;
	oC0.xyz = (r0.www * r0.xyz) + r1.yzw;
	#undef c0
	#undef c1
	#undef c10
	#undef c11
	#undef c12
	#undef c19
	#undef c20
	#undef c21
	#undef c26
	#undef c27
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

