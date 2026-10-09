#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[35];
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
	texturecube<float> s8_texture [[texture(8)]],
	sampler s8 [[sampler(8)]],
	texture2d<float> s14_texture [[texture(14)]],
	sampler s14 [[sampler(14)]],
	depth2d<float> s15_texture [[texture(15)]],
	sampler s15 [[sampler(15)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c3 = float4(0.81649661, 0.577350258, 0.0, 0.0); (void) c3;
	const float4 c15 = float4(-0.408248334, 0.707106768, 0.577350258, 0.0); (void) c15;
	const float4 c16 = float4(-0.408248215, -0.707106828, 0.577350258, 0.0); (void) c16;
	const float4 c17 = float4(0.300000011, 0.589999973, 0.11, 1.0); (void) c17;
	const float4 c18 = float4(2.0, -1.0, 0.5, 0.0); (void) c18;
	const float4 c20 = float4(0.000488281, 0.0, -0.000488281, 0.062499999); (void) c20;
	const float4 c21 = float4(0.125, 0.25, 0.0, 0.0); (void) c21;
	const float4 c22 = float4(0.0, -1.0, -2.0, 0.0); (void) c22;
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
	#define c2 uniforms.uniforms_float4[2]
	#define c4 uniforms.uniforms_float4[3]
	#define c5 uniforms.uniforms_float4[4]
	#define c6 uniforms.uniforms_float4[5]
	#define c7 uniforms.uniforms_float4[6]
	#define c8 uniforms.uniforms_float4[7]
	#define c9 uniforms.uniforms_float4[8]
	#define c10 uniforms.uniforms_float4[9]
	#define c11 uniforms.uniforms_float4[10]
	#define c12 uniforms.uniforms_float4[11]
	#define c13 uniforms.uniforms_float4[12]
	#define c14 uniforms.uniforms_float4[13]
	#define c19 uniforms.uniforms_float4[14]
	#define c26 uniforms.uniforms_float4[15]
	#define c27 uniforms.uniforms_float4[16]
	#define c30 uniforms.uniforms_float4[17]
	#define c64 uniforms.uniforms_float4[18]
	#define c67 uniforms.uniforms_float4[19]
	#define c68 uniforms.uniforms_float4[20]
	#define c69 uniforms.uniforms_float4[21]
	#define c70 uniforms.uniforms_float4[22]
	#define c71 uniforms.uniforms_float4[23]
	#define c73 uniforms.uniforms_float4[24]
	#define c74 uniforms.uniforms_float4[25]
	#define c77 uniforms.uniforms_float4[26]
	#define c78 uniforms.uniforms_float4[27]
	#define c81 uniforms.uniforms_float4[28]
	#define c82 uniforms.uniforms_float4[29]
	#define c85 uniforms.uniforms_float4[30]
	#define c86 uniforms.uniforms_float4[31]
	#define c87 uniforms.uniforms_float4[32]
	#define c88 uniforms.uniforms_float4[33]
	#define c89 uniforms.uniforms_float4[34]
	#define b0 uniforms.uniforms_bool[0]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define v7 input.v7
	#define oC0 output.oC0
	r0.xyz = v3.xyz;
	r1.xyz = r0.yzx * v2.zxy;
	r0.xyz = (v2.yzx * r0.zxy) + -r1.xyz;
	r0.xyz = r0.xyz * v3.www;
	r1 = s0_texture.sample(s0, v0.xy);
	r0.w = dot(r1.xyz, c17.xyz);
	r2 = s3_texture.sample(s3, v1.xy);
	r2.xyz = (r2.xyz * c18.xxx) + c18.yyy;
	r3.x = mix(r2.w, r1.w, c27.x);
	r2.w = mix(r3.x, r0.w, c10.y);
	r0.xyz = r0.xyz * r2.yyy;
	r0.xyz = (r2.xxx * v3.xyz) + r0.xyz;
	r0.xyz = (r2.zzz * v2.xyz) + r0.xyz;
	r3.xyz = normalize(r0.xyz);
	r0.xyz = c11.xyz + -v4.xyz;
	r4.xyz = normalize(r0.xyz);
	r0.x = dot(r3.xyz, r4.xyz);
	r0.y = clamp(r0.x, 0.0, 1.0);
	r0.y = -r0.y + c17.w;
	r0.z = r0.y * r0.y;
	r0.y = (r0.y * -r0.y) + c18.z;
	r0.xw = r0.xz + r0.xz;
	r3.w = (r0.z * c18.x) + c18.y;
	r4.w = -c19.x + c19.y;
	r5.x = mix(c19.y, c19.z, r3.w);
	r0.w = (r0.w * r4.w) + c19.x;
	r0.y = ((r0.y >= 0.0) ? r0.w : r5.x);
	if (b0) {
		r5 = (v4.xyzx * -c18.yyyw) + -c18.wwwy;
		r6.x = dot(r5, c69);
		r6.y = dot(r5, c70);
		r7.xy = clamp(r6.xy, float2(0.0), float2(1.0));
		r7.xy = -r6.xy + r7.xy;
		r0.w = dot(r7.xy, -c18.yy) + -c18.w;
		r7.x = dot(r5, c73);
		r7.y = dot(r5, c74);
		r8.xy = clamp(r7.xy, float2(0.0), float2(1.0));
		r8.xy = -r7.xy + r8.xy;
		r3.w = dot(r8.xy, -c18.yy) + -c18.w;
		r8.x = dot(r5, c77);
		r8.y = dot(r5, c78);
		r7.z = c17.w;
		r8.z = c18.x;
		r7.xyz = ((-abs(r3.w) >= 0.0) ? r7.xyz : r8.xyz);
		r6.z = -c18.w;
		r6.xyz = ((-abs(r0.w) >= 0.0) ? r6.xyz : r7.xyz);
		r7.z = dot(r5, c71);
		r8.xy = r6.xy + -c18.zz;
		r8.xy = abs(r8.xy) + -c67.zz;
		r8.xy = clamp(r8.xy * c67.ww, float2(0.0), float2(1.0));
		r8.xy = -r8.xy + c17.ww;
		r0.w = r8.y * r8.x;
		r6.xy = clamp(r6.xy, float2(0.0), float2(1.0));
		r8.xyz = r6.zzz + -abs(c18.wyx);
		r3.w = c18.w;
		r9 = ((-abs(r8.x) >= 0.0) ? c85.zwxy : -r3.wwww);
		r9 = ((-abs(r8.y) >= 0.0) ? c86.zwxy : r9);
		r8 = ((-abs(r8.z) >= 0.0) ? c87.zwxy : r9);
		r7.xy = (r6.xy * r8.xy) + r8.zw;
		r7.w = -c18.w;
		r8 = r7 + c20.xxyy;
		r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r9 = r7 + c20.zxyy;
		r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
		r10 = r7 + c20.xzyy;
		r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r11 = r7 + c20.zzyy;
		r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
		r8.y = r9.x;
		r8.z = r10.x;
		r8.w = r11.x;
		r4.w = dot(r8, c20.wwww);
		r8 = r7 + c20.xyyy;
		r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r9 = r7 + c20.zyyy;
		r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
		r10 = r7 + c20.yzyy;
		r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r11 = r7 + c20.yxyy;
		r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
		r8.y = r9.x;
		r8.z = r10.x;
		r8.w = r11.x;
		r6.x = dot(r8, c21.xxxx);
		r8 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
		r4.w = r4.w + r6.x;
		r4.w = (r8.x * c21.y) + r4.w;
		if (r0.w < c17.w) {
			r6.xyz = r6.zzz + c22.xyz;
			r8 = ((-abs(r6.x) >= 0.0) ? c73 : -r3.wwww);
			r9 = ((-abs(r6.x) >= 0.0) ? c74 : -r3.wwww);
			r8 = ((-abs(r6.y) >= 0.0) ? c77 : r8);
			r9 = ((-abs(r6.y) >= 0.0) ? c78 : r9);
			r8 = ((-abs(r6.z) >= 0.0) ? c81 : r8);
			r9 = ((-abs(r6.z) >= 0.0) ? c82 : r9);
			r8.x = clamp(dot(r5, r8), 0.0, 1.0);
			r8.y = clamp(dot(r5, r9), 0.0, 1.0);
			r5 = ((-abs(r6.x) >= 0.0) ? c86.zwxy : -r3.wwww);
			r5 = ((-abs(r6.y) >= 0.0) ? c87.zwxy : r5);
			r5 = ((-abs(r6.z) >= 0.0) ? c88.zwxy : r5);
			r7.xy = (r8.xy * r5.xy) + r5.zw;
			r5 = r7 + c20.xxyy;
			r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
			r8 = r7 + c20.zxyy;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r9 = r7 + c20.xzyy;
			r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
			r10 = r7 + c20.zzyy;
			r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
			r5.y = r8.x;
			r5.z = r9.x;
			r5.w = r10.x;
			r3.w = dot(r5, c20.wwww);
			r5 = r7 + c20.xyyy;
			r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
			r8 = r7 + c20.zyyy;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r9 = r7 + c20.yzyy;
			r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
			r10 = r7 + c20.yxyy;
			r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
			r5.y = r8.x;
			r5.z = r9.x;
			r5.w = r10.x;
			r5.x = dot(r5, c21.xxxx);
			r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
			r3.w = r3.w + r5.x;
			r3.w = (r7.x * c21.y) + r3.w;
			r3.w = ((r6.z >= 0.0) ? c17.w : r3.w);
			r5.x = mix(r3.w, r4.w, r0.w);
			r4.w = r5.x;
		}
		r5.xyz = -c89.xyz + v4.xyz;
		r0.w = dot(r5.xyz, r5.xyz);
		r0.w = clamp((r0.w * c68.y) + c68.x, 0.0, 1.0);
		r3.w = mix(r4.w, c17.w, r0.w);
	} else {
		r3.w = c17.w;
	}
	r5.x = clamp(dot(r2.xz, c3.xy) + c3.z, 0.0, 1.0);
	r5.y = clamp(dot(r2.xyz, c15.xyz), 0.0, 1.0);
	r5.z = clamp(dot(r2.xyz, c16.xyz), 0.0, 1.0);
	r2.xyz = r5.xyz * r5.xyz;
	r5.xyz = r2.yyy * v6.xyz;
	r5.xyz = (r2.xxx * v5.xyz) + r5.xyz;
	r5.xyz = (r2.zzz * v7.xyz) + r5.xyz;
	r0.w = dot(r2.xyz, c17.www);
	if (b0) {
		r4.w = v5.w;
		r4.w = r4.w + v6.w;
		r4.w = r4.w + v7.w;
		r2.y = r2.y * v6.w;
		r2.x = (r2.x * v5.w) + r2.y;
		r2.x = (r2.z * v7.w) + r2.x;
		r2.xyz = r2.xxx * c64.xyz;
		r2.xyz = (r2.xyz * r3.www) + r5.xyz;
		r5.xyz = ((-r4.w >= 0.0) ? r5.xyz : r2.xyz);
	}
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r2.xyz = r0.www * r5.xyz;
	r0.w = dot(r3.xyz, r3.xyz);
	r5.xyz = r4.xyz * r0.www;
	r3.xyw = (r0.xxx * r3.xyz) + -r5.xyz;
	r5 = s8_texture.sample(s8, r3.xyw);
	r3.xyw = r5.xyz * c30.zzz;
	r3.xyw = r3.xyw * c2.xyz;
	r0.xyw = (r0.yyy * r3.xyw) + -r3.xyw;
	r0.xyw = (c10.xxx * r0.xyw) + r3.xyw;
	r3.x = mix(r1.w, r2.w, c2.w);
	r2.w = (r3.x * -c18.x) + -c18.y;
	r2.w = (c27.w * r2.w) + r3.x;
	r0.xyw = r0.xyw * r2.www;
	r5 = s7_texture.sample(s7, v0.xy);
	r2.w = r5.w + -c17.w;
	r3.w = c17.w;
	r2.w = (c13.x * r2.w) + r3.w;
	r6.xyz = r1.xyz * r0.xyw;
	r6.xyz = (r6.xyz * c0.www) + -r0.xyw;
	r5.yzw = (r5.yyy * r6.xyz) + r0.xyw;
	r5.xyz = r5.yzw * r5.xxx;
	r0.xyw = ((c26.x >= 0.0) ? r0.xyw : r5.xyz);
	r3.x = clamp(r1.w + c27.z, 0.0, 1.0);
	r5.xyz = -r3.www + c1.xyz;
	r3.xyw = (r3.xxx * r5.xyz) + c17.www;
	r2.xyz = r2.xyz * r3.xyw;
	r2.xyz = r1.xyz * r2.xyz;
	r5 = s14_texture.sample(s14, v0.xy);
	r3.xyw = mix(r1.www, r5.xyz, c10.www);
	r1.xyz = (c0.xyz * r1.xyz) + -r2.xyz;
	r1.xyz = (r3.xyw * r1.xyz) + r2.xyz;
	r2.xyz = max(r1.xyz, -c18.www);
	r0.z = r0.z * r0.z;
	r0.z = r2.w * r0.z;
	r0.z = r0.z * c14.w;
	r1.xyz = r4.xyz * r4.xyz;
	r3.x = ((r4.x >= 0.0) ? -c18.w : -c18.y);
	r3.y = ((r4.y >= 0.0) ? -c18.w : -c18.y);
	r3.w = ((r4.z >= 0.0) ? -c18.w : -c18.y);
	r4.x = ((r4.x >= 0.0) ? -c18.y : -c18.w);
	r4.y = ((r4.y >= 0.0) ? -c18.y : -c18.w);
	r4.z = ((r4.z >= 0.0) ? -c18.y : -c18.w);
	r3.xyw = r1.xyz * r3.xyw;
	r1.xyz = r1.xyz * r4.xyz;
	r4.xyz = r3.xxx * c5.xyz;
	r4.xyz = (r1.xxx * c4.xyz) + r4.xyz;
	r1.xyw = (r1.yyy * c6.xyz) + r4.xyz;
	r1.xyw = (r3.yyy * c7.xyz) + r1.xyw;
	r1.xyz = (r1.zzz * c8.xyz) + r1.xyw;
	r1.xyz = (r3.www * c9.xyz) + r1.xyz;
	r1.xyz = r0.zzz * r1.xyz;
	r0.z = clamp(r3.z, 0.0, 1.0);
	r0.xyz = (r1.xyz * r0.zzz) + r0.xyw;
	r0.xyz = r2.xyz + r0.xyz;
	r0.w = c12.y + -v4.z;
	r0.w = r0.w + -c18.x;
	oC0.w = clamp(r0.w * c12.w, 0.0, 1.0);
	oC0.xyz = r0.xyz * c30.xxx;
	#undef c0
	#undef c1
	#undef c2
	#undef c4
	#undef c5
	#undef c6
	#undef c7
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c12
	#undef c13
	#undef c14
	#undef c19
	#undef c26
	#undef c27
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
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

