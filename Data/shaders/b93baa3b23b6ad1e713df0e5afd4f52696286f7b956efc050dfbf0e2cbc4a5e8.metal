#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[32];
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
	texturecube<float> s8_texture [[texture(8)]],
	sampler s8 [[sampler(8)]],
	depth2d<float> s15_texture [[texture(15)]],
	sampler s15 [[sampler(15)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c3 = float4(0.81649661, 0.577350258, 0.0, 0.0); (void) c3;
	const float4 c4 = float4(-0.408248334, 0.707106768, 0.577350258, 0.0); (void) c4;
	const float4 c5 = float4(-0.408248215, -0.707106828, 0.577350258, 0.0); (void) c5;
	const float4 c6 = float4(0.300000011, 0.589999973, 0.11, 1.0); (void) c6;
	const float4 c7 = float4(0.000488281, 0.0, -0.000488281, 0.062499999); (void) c7;
	const float4 c8 = float4(0.125, 0.25, 150.0, 0.0); (void) c8;
	const float4 c9 = float4(0.0, -1.0, -2.0, 0.0); (void) c9;
	const float4 c12 = float4(2.0, -1.0, 0.5, 0.0); (void) c12;
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
	float4 r12;
	float4 r13;
	float4 r14;
	float4 r15;
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c2 uniforms.uniforms_float4[2]
	#define c10 uniforms.uniforms_float4[3]
	#define c11 uniforms.uniforms_float4[4]
	#define c19 uniforms.uniforms_float4[5]
	#define c20 uniforms.uniforms_float4[6]
	#define c21 uniforms.uniforms_float4[7]
	#define c22 uniforms.uniforms_float4[8]
	#define c23 uniforms.uniforms_float4[9]
	#define c24 uniforms.uniforms_float4[10]
	#define c25 uniforms.uniforms_float4[11]
	#define c26 uniforms.uniforms_float4[12]
	#define c27 uniforms.uniforms_float4[13]
	#define c30 uniforms.uniforms_float4[14]
	#define c64 uniforms.uniforms_float4[15]
	#define c67 uniforms.uniforms_float4[16]
	#define c68 uniforms.uniforms_float4[17]
	#define c69 uniforms.uniforms_float4[18]
	#define c70 uniforms.uniforms_float4[19]
	#define c71 uniforms.uniforms_float4[20]
	#define c73 uniforms.uniforms_float4[21]
	#define c74 uniforms.uniforms_float4[22]
	#define c77 uniforms.uniforms_float4[23]
	#define c78 uniforms.uniforms_float4[24]
	#define c81 uniforms.uniforms_float4[25]
	#define c82 uniforms.uniforms_float4[26]
	#define c85 uniforms.uniforms_float4[27]
	#define c86 uniforms.uniforms_float4[28]
	#define c87 uniforms.uniforms_float4[29]
	#define c88 uniforms.uniforms_float4[30]
	#define c89 uniforms.uniforms_float4[31]
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
	r0.w = dot(r1.xyz, c6.xyz);
	r2 = s3_texture.sample(s3, v1.xy);
	r2.xyz = (r2.xyz * c12.xxx) + c12.yyy;
	r3.x = mix(r2.w, r1.w, c27.x);
	r2.w = mix(r3.x, r0.w, c10.y);
	r0.xyz = r0.xyz * r2.yyy;
	r0.xyz = (r2.xxx * v3.xyz) + r0.xyz;
	r0.xyz = (r2.zzz * v2.xyz) + r0.xyz;
	r3.xyz = normalize(r0.xyz);
	r0.xyz = c11.xyz + -v4.xyz;
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r4.xyz = r0.www * r0.xyz;
	r3.w = dot(r3.xyz, r4.xyz);
	r4.w = clamp(r3.w, 0.0, 1.0);
	r4.w = -r4.w + c6.w;
	r5.x = r4.w * r4.w;
	r4.w = (r4.w * -r4.w) + c12.z;
	r5.y = r5.x + r5.x;
	r5.x = (r5.x * c12.x) + c12.y;
	r5.z = -c19.x + c19.y;
	r6.x = mix(c19.y, c19.z, r5.x);
	r5.x = (r5.y * r5.z) + c19.x;
	r4.w = ((r4.w >= 0.0) ? r5.x : r6.x);
	if (b0) {
		r5 = (v4.xyzx * -c12.yyyw) + -c12.wwwy;
		r6.x = dot(r5, c69);
		r6.y = dot(r5, c70);
		r7.xy = clamp(r6.xy, float2(0.0), float2(1.0));
		r7.xy = -r6.xy + r7.xy;
		r6.w = dot(r7.xy, -c12.yy) + -c12.w;
		r7.x = dot(r5, c73);
		r7.y = dot(r5, c74);
		r8.xy = clamp(r7.xy, float2(0.0), float2(1.0));
		r8.xy = -r7.xy + r8.xy;
		r7.w = dot(r8.xy, -c12.yy) + -c12.w;
		r8.x = dot(r5, c77);
		r8.y = dot(r5, c78);
		r7.z = c6.w;
		r8.zw = c12.xw;
		r7.xyz = ((-abs(r7.w) >= 0.0) ? r7.xyz : r8.xyz);
		r6.z = -c12.w;
		r6.xyz = ((-abs(r6.w) >= 0.0) ? r6.xyz : r7.xyz);
		r7.z = dot(r5, c71);
		r8.xy = r6.xy + -c12.zz;
		r8.xy = abs(r8.xy) + -c67.zz;
		r8.xy = clamp(r8.xy * c67.ww, float2(0.0), float2(1.0));
		r8.xy = -r8.xy + c6.ww;
		r6.w = r8.y * r8.x;
		r6.xy = clamp(r6.xy, float2(0.0), float2(1.0));
		r8.xyz = r6.zzz + -abs(c12.wyx);
		r9 = ((-abs(r8.x) >= 0.0) ? c85.zwxy : -r8.wwww);
		r9 = ((-abs(r8.y) >= 0.0) ? c86.zwxy : r9);
		r9 = ((-abs(r8.z) >= 0.0) ? c87.zwxy : r9);
		r7.xy = (r6.xy * r9.xy) + r9.zw;
		r7.w = -c12.w;
		r9 = r7 + c7.xxyy;
		r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
		r10 = r7 + c7.zxyy;
		r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r11 = r7 + c7.xzyy;
		r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
		r12 = r7 + c7.zzyy;
		r12 = float4(s15_texture.sample_compare(s15, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
		r9.y = r10.x;
		r9.z = r11.x;
		r9.w = r12.x;
		r6.x = dot(r9, c7.wwww);
		r9 = r7 + c7.xyyy;
		r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
		r10 = r7 + c7.zyyy;
		r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r11 = r7 + c7.yzyy;
		r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
		r12 = r7 + c7.yxyy;
		r12 = float4(s15_texture.sample_compare(s15, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
		r9.y = r10.x;
		r9.z = r11.x;
		r9.w = r12.x;
		r6.y = dot(r9, c8.xxxx);
		r9 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
		r6.x = r6.y + r6.x;
		r6.x = (r9.x * c8.y) + r6.x;
		if (r6.w < c6.w) {
			r8.xyz = r6.zzz + c9.xyz;
			r9 = ((-abs(r8.x) >= 0.0) ? c73 : -r8.wwww);
			r10 = ((-abs(r8.x) >= 0.0) ? c74 : -r8.wwww);
			r9 = ((-abs(r8.y) >= 0.0) ? c77 : r9);
			r10 = ((-abs(r8.y) >= 0.0) ? c78 : r10);
			r9 = ((-abs(r8.z) >= 0.0) ? c81 : r9);
			r10 = ((-abs(r8.z) >= 0.0) ? c82 : r10);
			r9.x = clamp(dot(r5, r9), 0.0, 1.0);
			r9.y = clamp(dot(r5, r10), 0.0, 1.0);
			r5 = ((-abs(r8.x) >= 0.0) ? c86.zwxy : -r8.wwww);
			r5 = ((-abs(r8.y) >= 0.0) ? c87.zwxy : r5);
			r5 = ((-abs(r8.z) >= 0.0) ? c88.zwxy : r5);
			r7.xy = (r9.xy * r5.xy) + r5.zw;
			r5 = r7 + c7.xxyy;
			r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
			r9 = r7 + c7.zxyy;
			r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
			r10 = r7 + c7.xzyy;
			r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
			r11 = r7 + c7.zzyy;
			r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
			r5.y = r9.x;
			r5.z = r10.x;
			r5.w = r11.x;
			r5.x = dot(r5, c7.wwww);
			r9 = r7 + c7.xyyy;
			r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
			r10 = r7 + c7.zyyy;
			r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
			r11 = r7 + c7.yzyy;
			r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
			r12 = r7 + c7.yxyy;
			r12 = float4(s15_texture.sample_compare(s15, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
			r9.y = r10.x;
			r9.z = r11.x;
			r9.w = r12.x;
			r5.y = dot(r9, c8.xxxx);
			r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
			r5.x = r5.y + r5.x;
			r5.x = (r7.x * c8.y) + r5.x;
			r5.x = ((r8.z >= 0.0) ? c6.w : r5.x);
			r7.x = mix(r5.x, r6.x, r6.w);
			r6.x = r7.x;
		}
		r5.xyz = -c89.xyz + v4.xyz;
		r5.x = dot(r5.xyz, r5.xyz);
		r5.x = clamp((r5.x * c68.y) + c68.x, 0.0, 1.0);
		r7.x = mix(r6.x, c6.w, r5.x);
	} else {
		r7.x = c6.w;
	}
	r5.x = clamp(dot(r2.xz, c3.xy) + c3.z, 0.0, 1.0);
	r5.y = clamp(dot(r2.xyz, c4.xyz), 0.0, 1.0);
	r5.z = clamp(dot(r2.xyz, c5.xyz), 0.0, 1.0);
	r2.xyz = r5.xyz * r5.xyz;
	r5.xyz = r2.yyy * v6.xyz;
	r5.xyz = (r2.xxx * v5.xyz) + r5.xyz;
	r5.xyz = (r2.zzz * v7.xyz) + r5.xyz;
	r5.w = dot(r2.xyz, c6.www);
	if (b0) {
		r6.w = v5.w;
		r6.x = r6.w + v6.w;
		r6.x = r6.x + v7.w;
		r2.y = r2.y * v6.w;
		r2.x = (r2.x * v5.w) + r2.y;
		r2.x = (r2.z * v7.w) + r2.x;
		r2.xyz = r2.xxx * c64.xyz;
		r2.xyz = (r2.xyz * r7.xxx) + r5.xyz;
		r5.xyz = ((-r6.x >= 0.0) ? r5.xyz : r2.xyz);
	} else {
		r6.x = c6.w;
	}
	r2.x = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r6.yzw = c23.xyz + -v4.xyz;
	r8.xyz = normalize(r6.yzw);
	r6.yzw = c22.xyz * v8.yyy;
	r2.y = clamp(dot(r3.xyz, r8.xyz), 0.0, 1.0);
	r2.z = (r2.y * r2.y) + r2.y;
	r2.z = r2.z * c12.z;
	r7.yzw = c25.xyz + -v4.xyz;
	r9.xyz = normalize(r7.yzw);
	r7.yzw = c24.xyz * v8.zzz;
	r5.w = clamp(dot(r3.xyz, r9.xyz), 0.0, 1.0);
	r8.w = (r5.w * r5.w) + r5.w;
	r8.w = r8.w * c12.z;
	r10.xyz = r7.yzw * r8.www;
	r10.xyz = (r6.yzw * r2.zzz) + r10.xyz;
	r11.x = c23.w + -v4.x;
	r11.y = c24.w + -v4.y;
	r11.z = c25.w + -v4.z;
	r12.xyz = normalize(r11.xyz);
	r11.x = c20.w * v8.w;
	r11.y = c21.w * v8.w;
	r11.z = c22.w * v8.w;
	r2.z = clamp(dot(r3.xyz, r12.xyz), 0.0, 1.0);
	r8.w = (r2.z * r2.z) + r2.z;
	r8.w = r8.w * c12.z;
	r10.xyz = (r11.xyz * r8.www) + r10.xyz;
	r6.x = r6.x * r7.x;
	r5.xyz = (r5.xyz * r2.xxx) + r10.xyz;
	r2.x = r3.w + r3.w;
	r3.w = dot(r3.xyz, r3.xyz);
	r10.xyz = r4.xyz * r3.www;
	r10.xyz = (r2.xxx * r3.xyz) + -r10.xyz;
	r10 = s8_texture.sample(s8, r10.xyz);
	r10.xyz = r10.xyz * c30.zzz;
	r10.xyz = r10.xyz * c2.xyz;
	r13.xyz = (r4.www * r10.xyz) + -r10.xyz;
	r10.xyz = (c10.xxx * r13.xyz) + r10.xyz;
	r3.w = mix(r1.w, r2.w, c2.w);
	r2.x = (r3.w * -c12.x) + -c12.y;
	r2.x = (c27.w * r2.x) + r3.w;
	r10.xyz = r2.xxx * r10.xyz;
	r13 = s7_texture.sample(s7, v0.xy);
	r2.x = abs(c10.z);
	r3.w = -r13.x + c6.w;
	r3.w = (r13.x * c8.z) + r3.w;
	r2.x = ((-r2.x >= 0.0) ? r3.w : c10.z);
	r3.w = c19.w;
	r14.xyz = (c0.www * r1.xyz) + -r3.www;
	r14.xyz = (r13.yyy * r14.xyz) + c19.www;
	r15.xyz = r1.xyz * r10.xyz;
	r15.xyz = (r15.xyz * c0.www) + -r10.xyz;
	r13.yzw = (r13.yyy * r15.xyz) + r10.xyz;
	r13.xyz = r13.yzw * r13.xxx;
	r15.xyz = r3.www * c26.xyz;
	r10.xyz = ((c26.x >= 0.0) ? r10.xyz : r13.xyz);
	r13.xyz = ((c26.x >= 0.0) ? r15.xyz : r14.xyz);
	r14.xyz = c21.xyz + -v4.xyz;
	r3.w = dot(r14.xyz, r14.xyz);
	r3.w = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r15.xyz = c20.xyz * v8.xxx;
	r4.xyz = (r14.xyz * r3.www) + r4.xyz;
	r14.xyz = normalize(r4.xyz);
	r3.w = clamp(dot(r3.xyz, r14.xyz), 0.0, 1.0);
	r4.x = pow(abs(r3.w), r2.x);
	r4.xyz = r15.xyz * r4.xxx;
	r8.xyz = (r0.xyz * r0.www) + r8.xyz;
	r14.xyz = normalize(r8.xyz);
	r3.w = clamp(dot(r3.xyz, r14.xyz), 0.0, 1.0);
	r7.x = pow(abs(r3.w), r2.x);
	r2.y = ((r2.y == 0.0) ? FLT_MAX : rsqrt(abs(r2.y)));
	r2.y = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r2.y = r2.y * r7.x;
	r6.yzw = r6.yzw * r2.yyy;
	r4.xyz = (r4.xyz * r6.xxx) + r6.yzw;
	r6.xyz = (r0.xyz * r0.www) + r9.xyz;
	r8.xyz = normalize(r6.xyz);
	r2.y = clamp(dot(r3.xyz, r8.xyz), 0.0, 1.0);
	r3.w = pow(abs(r2.y), r2.x);
	r2.y = ((r5.w == 0.0) ? FLT_MAX : rsqrt(abs(r5.w)));
	r2.y = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r2.y = r2.y * r3.w;
	r4.xyz = (r2.yyy * r7.yzw) + r4.xyz;
	r0.xyz = (r0.xyz * r0.www) + r12.xyz;
	r6.xyz = normalize(r0.xyz);
	r0.x = clamp(dot(r3.xyz, r6.xyz), 0.0, 1.0);
	r3.x = pow(abs(r0.x), r2.x);
	r0.x = ((r2.z == 0.0) ? FLT_MAX : rsqrt(abs(r2.z)));
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = r0.x * r3.x;
	r0.xyz = (r0.xxx * r11.xyz) + r4.xyz;
	r2.xyz = r2.www * r13.xyz;
	r0.xyz = r0.xyz * r2.xyz;
	r0.w = clamp(r1.w + c27.z, 0.0, 1.0);
	r2.w = c6.w;
	r2.xyz = -r2.www + c1.xyz;
	r2.xyz = (r0.www * r2.xyz) + c6.www;
	r2.xyz = r2.xyz * r5.xyz;
	r0.xyz = (r0.xyz * r4.www) + r10.xyz;
	r0.xyz = (r1.xyz * r2.xyz) + r0.xyz;
	r1.xy = r2.ww + -c27.xy;
	r0.w = r1.x * c27.z;
	r0.w = r1.y * r0.w;
	r2.x = mix(c6.w, r1.w, r0.w);
	oC0.w = r2.x * c1.w;
	oC0.xyz = r0.xyz * c30.xxx;
	#undef c0
	#undef c1
	#undef c2
	#undef c10
	#undef c11
	#undef c19
	#undef c20
	#undef c21
	#undef c22
	#undef c23
	#undef c24
	#undef c25
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
	#undef v8
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

