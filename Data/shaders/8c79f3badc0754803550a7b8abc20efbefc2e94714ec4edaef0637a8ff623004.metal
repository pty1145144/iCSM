#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[40];
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
	const float4 c18 = float4(0.0, -1.0, -2.0, 0.0); (void) c18;
	const float4 c24 = float4(0.000488281, 0.0, -0.000488281, 0.062499999); (void) c24;
	const float4 c25 = float4(0.125, 0.25, 150.0, 0.0); (void) c25;
	const float4 c28 = float4(2.0, -1.0, 0.5, 0.0); (void) c28;
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
	#define c20 uniforms.uniforms_float4[15]
	#define c21 uniforms.uniforms_float4[16]
	#define c22 uniforms.uniforms_float4[17]
	#define c23 uniforms.uniforms_float4[18]
	#define c26 uniforms.uniforms_float4[19]
	#define c27 uniforms.uniforms_float4[20]
	#define c29 uniforms.uniforms_float4[21]
	#define c30 uniforms.uniforms_float4[22]
	#define c64 uniforms.uniforms_float4[23]
	#define c67 uniforms.uniforms_float4[24]
	#define c68 uniforms.uniforms_float4[25]
	#define c69 uniforms.uniforms_float4[26]
	#define c70 uniforms.uniforms_float4[27]
	#define c71 uniforms.uniforms_float4[28]
	#define c73 uniforms.uniforms_float4[29]
	#define c74 uniforms.uniforms_float4[30]
	#define c77 uniforms.uniforms_float4[31]
	#define c78 uniforms.uniforms_float4[32]
	#define c81 uniforms.uniforms_float4[33]
	#define c82 uniforms.uniforms_float4[34]
	#define c85 uniforms.uniforms_float4[35]
	#define c86 uniforms.uniforms_float4[36]
	#define c87 uniforms.uniforms_float4[37]
	#define c88 uniforms.uniforms_float4[38]
	#define c89 uniforms.uniforms_float4[39]
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
	r0.w = dot(r1.xyz, c17.xyz);
	r2 = s3_texture.sample(s3, v1.xy);
	r2.xyz = (r2.xyz * c28.xxx) + c28.yyy;
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
	r4.w = -r4.w + c17.w;
	r5.x = r4.w * r4.w;
	r4.w = (r4.w * -r4.w) + c28.z;
	r5.y = r5.x + r5.x;
	r5.z = (r5.x * c28.x) + c28.y;
	r5.w = -c19.x + c19.y;
	r6.x = mix(c19.y, c19.z, r5.z);
	r5.y = (r5.y * r5.w) + c19.x;
	r4.w = ((r4.w >= 0.0) ? r5.y : r6.x);
	if (b0) {
		r6 = (v4.xyzx * -c28.yyyw) + -c28.wwwy;
		r7.x = dot(r6, c69);
		r7.y = dot(r6, c70);
		r5.yz = clamp(r7.xy, float2(0.0), float2(1.0));
		r5.yz = -r7.xy + r5.yz;
		r5.y = dot(r5.yz, -c28.yy) + -c28.w;
		r8.x = dot(r6, c73);
		r8.y = dot(r6, c74);
		r5.zw = clamp(r8.xy, float2(0.0), float2(1.0));
		r5.zw = -r8.xy + r5.zw;
		r5.z = dot(r5.zw, -c28.yy) + -c28.w;
		r9.x = dot(r6, c77);
		r9.y = dot(r6, c78);
		r8.z = c17.w;
		r9.zw = c28.xw;
		r8.xyz = ((-abs(r5.z) >= 0.0) ? r8.xyz : r9.xyz);
		r7.zw = -c28.ww;
		r5.yzw = ((-abs(r5.y) >= 0.0) ? r7.xyz : r8.xyz);
		r7.z = dot(r6, c71);
		r8.xy = r5.yz + -c28.zz;
		r8.xy = abs(r8.xy) + -c67.zz;
		r8.xy = clamp(r8.xy * c67.ww, float2(0.0), float2(1.0));
		r8.xy = -r8.xy + c17.ww;
		r8.x = r8.y * r8.x;
		r5.yz = clamp(r5.yz, float2(0.0), float2(1.0));
		r8.yzw = r5.www + -abs(c28.wyx);
		r10 = ((-abs(r8.y) >= 0.0) ? c85.zwxy : -r9.wwww);
		r10 = ((-abs(r8.z) >= 0.0) ? c86.zwxy : r10);
		r10 = ((-abs(r8.w) >= 0.0) ? c87.zwxy : r10);
		r7.xy = (r5.yz * r10.xy) + r10.zw;
		r10 = r7 + c24.xxyy;
		r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r11 = r7 + c24.zxyy;
		r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
		r12 = r7 + c24.xzyy;
		r12 = float4(s15_texture.sample_compare(s15, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
		r13 = r7 + c24.zzyy;
		r13 = float4(s15_texture.sample_compare(s15, (r13.xyz).xy, (r13.xyz).z, level(r13.w)));
		r10.y = r11.x;
		r10.z = r12.x;
		r10.w = r13.x;
		r5.y = dot(r10, c24.wwww);
		r10 = r7 + c24.xyyy;
		r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r11 = r7 + c24.zyyy;
		r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
		r12 = r7 + c24.yzyy;
		r12 = float4(s15_texture.sample_compare(s15, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
		r13 = r7 + c24.yxyy;
		r13 = float4(s15_texture.sample_compare(s15, (r13.xyz).xy, (r13.xyz).z, level(r13.w)));
		r10.y = r11.x;
		r10.z = r12.x;
		r10.w = r13.x;
		r5.z = dot(r10, c25.xxxx);
		r10 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
		r5.y = r5.z + r5.y;
		r5.y = (r10.x * c25.y) + r5.y;
		if (r8.x < c17.w) {
			r8.yzw = r5.www + c18.xyz;
			r10 = ((-abs(r8.y) >= 0.0) ? c73 : -r9.wwww);
			r11 = ((-abs(r8.y) >= 0.0) ? c74 : -r9.wwww);
			r10 = ((-abs(r8.z) >= 0.0) ? c77 : r10);
			r11 = ((-abs(r8.z) >= 0.0) ? c78 : r11);
			r10 = ((-abs(r8.w) >= 0.0) ? c81 : r10);
			r11 = ((-abs(r8.w) >= 0.0) ? c82 : r11);
			r9.x = clamp(dot(r6, r10), 0.0, 1.0);
			r9.y = clamp(dot(r6, r11), 0.0, 1.0);
			r6 = ((-abs(r8.y) >= 0.0) ? c86.zwxy : -r9.wwww);
			r6 = ((-abs(r8.z) >= 0.0) ? c87.zwxy : r6);
			r6 = ((-abs(r8.w) >= 0.0) ? c88.zwxy : r6);
			r7.xy = (r9.xy * r6.xy) + r6.zw;
			r6 = r7 + c24.xxyy;
			r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
			r9 = r7 + c24.zxyy;
			r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
			r10 = r7 + c24.xzyy;
			r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
			r11 = r7 + c24.zzyy;
			r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
			r6.y = r9.x;
			r6.z = r10.x;
			r6.w = r11.x;
			r5.z = dot(r6, c24.wwww);
			r6 = r7 + c24.xyyy;
			r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
			r9 = r7 + c24.zyyy;
			r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
			r10 = r7 + c24.yzyy;
			r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
			r11 = r7 + c24.yxyy;
			r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
			r6.y = r9.x;
			r6.z = r10.x;
			r6.w = r11.x;
			r5.w = dot(r6, c25.xxxx);
			r6 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
			r5.z = r5.w + r5.z;
			r5.z = (r6.x * c25.y) + r5.z;
			r5.z = ((r8.w >= 0.0) ? c17.w : r5.z);
			r6.x = mix(r5.z, r5.y, r8.x);
			r5.y = r6.x;
		}
		r6.xyz = -c89.xyz + v4.xyz;
		r5.z = dot(r6.xyz, r6.xyz);
		r5.z = clamp((r5.z * c68.y) + c68.x, 0.0, 1.0);
		r6.x = mix(r5.y, c17.w, r5.z);
	} else {
		r6.x = c17.w;
	}
	r7.x = clamp(dot(r2.xz, c3.xy) + c3.z, 0.0, 1.0);
	r7.y = clamp(dot(r2.xyz, c15.xyz), 0.0, 1.0);
	r7.z = clamp(dot(r2.xyz, c16.xyz), 0.0, 1.0);
	r2.xyz = r7.xyz * r7.xyz;
	r5.yzw = r2.yyy * v6.xyz;
	r5.yzw = (r2.xxx * v5.xyz) + r5.yzw;
	r5.yzw = (r2.zzz * v7.xyz) + r5.yzw;
	r6.y = dot(r2.xyz, c17.www);
	if (b0) {
		r6.w = v5.w;
		r6.z = r6.w + v6.w;
		r6.z = r6.z + v7.w;
		r2.y = r2.y * v6.w;
		r2.x = (r2.x * v5.w) + r2.y;
		r2.x = (r2.z * v7.w) + r2.x;
		r2.xyz = r2.xxx * c64.xyz;
		r2.xyz = (r2.xyz * r6.xxx) + r5.yzw;
		r5.yzw = ((-r6.z >= 0.0) ? r5.yzw : r2.xyz);
	} else {
		r6.z = c17.w;
	}
	r2.x = ((r6.y == 0.0) ? FLT_MAX : 1.0 / r6.y);
	r2.xyz = r2.xxx * r5.yzw;
	r5.yzw = c23.xyz + -v4.xyz;
	r7.xyz = normalize(r5.yzw);
	r5.yzw = c22.xyz * v8.yyy;
	r6.y = clamp(dot(r3.xyz, r7.xyz), 0.0, 1.0);
	r6.w = (r6.y * r6.y) + r6.y;
	r6.w = r6.w * c28.z;
	r6.x = r6.z * r6.x;
	r2.xyz = (r5.yzw * r6.www) + r2.xyz;
	r3.w = r3.w + r3.w;
	r6.z = dot(r3.xyz, r3.xyz);
	r8.xyz = r4.xyz * r6.zzz;
	r8.xyz = (r3.www * r3.xyz) + -r8.xyz;
	r8 = s8_texture.sample(s8, r8.xyz);
	r8.xyz = r8.xyz * c30.zzz;
	r8.xyz = r8.xyz * c2.xyz;
	r9.xyz = (r4.www * r8.xyz) + -r8.xyz;
	r8.xyz = (c10.xxx * r9.xyz) + r8.xyz;
	r3.w = mix(r1.w, r2.w, c2.w);
	r6.z = (r3.w * -c28.x) + -c28.y;
	r3.w = (c27.w * r6.z) + r3.w;
	r8.xyz = r3.www * r8.xyz;
	r9 = s7_texture.sample(s7, v0.xy);
	r3.w = r9.w + -c17.w;
	r6.w = c17.w;
	r3.w = (c13.x * r3.w) + r6.w;
	r6.z = abs(c10.z);
	r7.w = -r9.x + c17.w;
	r7.w = (r9.x * c25.z) + r7.w;
	r6.z = ((-r6.z >= 0.0) ? r7.w : c10.z);
	r7.w = c19.w;
	r10.xyz = (c0.www * r1.xyz) + -r7.www;
	r10.xyz = (r9.yyy * r10.xyz) + c19.www;
	r11.xyz = r1.xyz * r8.xyz;
	r11.xyz = (r11.xyz * c0.www) + -r8.xyz;
	r9.yzw = (r9.yyy * r11.xyz) + r8.xyz;
	r9.xyz = r9.yzw * r9.xxx;
	r11.xyz = r7.www * c26.xyz;
	r8.xyz = ((c26.x >= 0.0) ? r8.xyz : r9.xyz);
	r9.xyz = ((c26.x >= 0.0) ? r11.xyz : r10.xyz);
	r10.xyz = c21.xyz + -v4.xyz;
	r7.w = dot(r10.xyz, r10.xyz);
	r7.w = ((r7.w == 0.0) ? FLT_MAX : rsqrt(abs(r7.w)));
	r11.xyz = c20.xyz * v8.xxx;
	r10.xyz = (r10.xyz * r7.www) + r4.xyz;
	r12.xyz = normalize(r10.xyz);
	r7.w = clamp(dot(r3.xyz, r12.xyz), 0.0, 1.0);
	r7.w = log2(r7.w);
	r8.w = r6.z * r7.w;
	r8.w = exp2(r8.w);
	r10.xyz = r11.xyz * r8.www;
	r7.w = r7.w * c26.w;
	r7.w = exp2(r7.w);
	r11.xyz = r11.xyz * r7.www;
	r0.xyz = (r0.xyz * r0.www) + r7.xyz;
	r7.xyz = normalize(r0.xyz);
	r0.x = clamp(dot(r3.xyz, r7.xyz), 0.0, 1.0);
	r0.x = log2(r0.x);
	r0.y = r0.x * r6.z;
	r0.y = exp2(r0.y);
	r0.z = ((r6.y == 0.0) ? FLT_MAX : rsqrt(abs(r6.y)));
	r0.z = ((r0.z == 0.0) ? FLT_MAX : 1.0 / r0.z);
	r0.y = r0.z * r0.y;
	r7.xyz = r5.yzw * r0.yyy;
	r0.x = r0.x * c26.w;
	r0.x = exp2(r0.x);
	r0.x = r6.y * r0.x;
	r0.xyz = r5.yzw * r0.xxx;
	r5.yzw = (r10.xyz * r6.xxx) + r7.xyz;
	r0.xyz = (r11.xyz * r6.xxx) + r0.xyz;
	r6.xyz = r2.www * r9.xyz;
	r5.yzw = r5.yzw * r6.xyz;
	r5.yzw = r4.www * r5.yzw;
	r2.w = clamp(r1.w + c27.z, 0.0, 1.0);
	r6.xyz = -r6.www + c1.xyz;
	r6.xyz = (r2.www * r6.xyz) + c17.www;
	r2.xyz = r2.xyz * r6.xyz;
	r2.xyz = r1.xyz * r2.xyz;
	r7 = s14_texture.sample(s14, v0.xy);
	r6.xyz = mix(r1.www, r7.xyz, c10.www);
	r1.xyz = (c0.xyz * r1.xyz) + -r2.xyz;
	r1.xyz = (r6.xyz * r1.xyz) + r2.xyz;
	r2.xyz = max(r1.xyz, -c28.www);
	r1.x = r5.x * r5.x;
	r1.x = r1.x * r3.w;
	r0.xyz = r0.xyz * r1.xxx;
	r3.xyw = max(r5.yzw, r0.xyz);
	r0.x = r1.x * c14.w;
	r1.xyz = r4.xyz * r4.xyz;
	r5.x = ((r4.x >= 0.0) ? -c28.w : -c28.y);
	r5.y = ((r4.y >= 0.0) ? -c28.w : -c28.y);
	r5.z = ((r4.z >= 0.0) ? -c28.w : -c28.y);
	r4.x = ((r4.x >= 0.0) ? -c28.y : -c28.w);
	r4.y = ((r4.y >= 0.0) ? -c28.y : -c28.w);
	r4.z = ((r4.z >= 0.0) ? -c28.y : -c28.w);
	r5.xyz = r1.xyz * r5.xyz;
	r1.xyz = r1.xyz * r4.xyz;
	r4.xyz = r5.xxx * c5.xyz;
	r4.xyz = (r1.xxx * c4.xyz) + r4.xyz;
	r4.xyz = (r1.yyy * c6.xyz) + r4.xyz;
	r4.xyz = (r5.yyy * c7.xyz) + r4.xyz;
	r1.xyz = (r1.zzz * c8.xyz) + r4.xyz;
	r1.xyz = (r5.zzz * c9.xyz) + r1.xyz;
	r0.xyz = r0.xxx * r1.xyz;
	r1.x = clamp(r3.z, 0.0, 1.0);
	r0.xyz = (r0.xyz * r1.xxx) + r3.xyw;
	r0.xyz = r8.xyz + r0.xyz;
	r0.xyz = r2.xyz + r0.xyz;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = clamp((r0.w * c12.w) + c12.x, 0.0, 1.0);
	r1.x = min(r0.w, c12.z);
	r1.yz = r6.ww + -c27.xy;
	r0.w = r1.y * c10.w;
	r0.w = r0.w * c27.z;
	r0.w = r1.z * r0.w;
	r2.x = mix(c17.w, r1.w, r0.w);
	oC0.w = r2.x * c1.w;
	r1.yzw = r0.xyz * c30.xxx;
	r0.w = r1.x * r1.x;
	r1.x = c30.x;
	r0.xyz = (r0.xyz * -r1.xxx) + c29.xyz;
	oC0.xyz = (r0.www * r0.xyz) + r1.yzw;
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
	#undef c20
	#undef c21
	#undef c22
	#undef c23
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

