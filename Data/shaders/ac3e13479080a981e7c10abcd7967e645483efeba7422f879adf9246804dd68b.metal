#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[41];
	bool uniforms_bool[1];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord1)]];
	float4 v2 [[user(texcoord2)]];
	float4 v3 [[user(texcoord3)]];
	float4 v4 [[user(texcoord4)]];
	float4 v5 [[user(texcoord9)]];
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
	const float4 c3 = float4(0.300000011, 0.589999973, 0.11, 1.0); (void) c3;
	const float4 c15 = float4(0.000488281, 0.0, -0.000488281, 0.062499999); (void) c15;
	const float4 c16 = float4(0.125, 0.25, 150.0, 0.0); (void) c16;
	const float4 c17 = float4(2.0, -1.0, 0.5, 0.0); (void) c17;
	const float4 c18 = float4(0.0, -1.0, -2.0, 0.0); (void) c18;
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
	float4 r16;
	float4 r17;
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
	#define c24 uniforms.uniforms_float4[19]
	#define c25 uniforms.uniforms_float4[20]
	#define c26 uniforms.uniforms_float4[21]
	#define c27 uniforms.uniforms_float4[22]
	#define c29 uniforms.uniforms_float4[23]
	#define c30 uniforms.uniforms_float4[24]
	#define c67 uniforms.uniforms_float4[25]
	#define c68 uniforms.uniforms_float4[26]
	#define c69 uniforms.uniforms_float4[27]
	#define c70 uniforms.uniforms_float4[28]
	#define c71 uniforms.uniforms_float4[29]
	#define c73 uniforms.uniforms_float4[30]
	#define c74 uniforms.uniforms_float4[31]
	#define c77 uniforms.uniforms_float4[32]
	#define c78 uniforms.uniforms_float4[33]
	#define c81 uniforms.uniforms_float4[34]
	#define c82 uniforms.uniforms_float4[35]
	#define c85 uniforms.uniforms_float4[36]
	#define c86 uniforms.uniforms_float4[37]
	#define c87 uniforms.uniforms_float4[38]
	#define c88 uniforms.uniforms_float4[39]
	#define c89 uniforms.uniforms_float4[40]
	#define b0 uniforms.uniforms_bool[0]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define oC0 output.oC0
	r0.xyz = v3.xyz;
	r1.xyz = r0.yzx * v2.zxy;
	r0.xyz = (v2.yzx * r0.zxy) + -r1.xyz;
	r0.xyz = r0.xyz * v3.www;
	r1 = s0_texture.sample(s0, v0.xy);
	r0.w = dot(r1.xyz, c3.xyz);
	r2 = s3_texture.sample(s3, v1.xy);
	r2.xyz = (r2.xyz * c17.xxx) + c17.yyy;
	r3.x = mix(r2.w, r1.w, c27.x);
	r2.w = mix(r3.x, r0.w, c10.y);
	r0.xyz = r0.xyz * r2.yyy;
	r0.xyz = (r2.xxx * v3.xyz) + r0.xyz;
	r0.xyz = (r2.zzz * v2.xyz) + r0.xyz;
	r2.xyz = normalize(r0.xyz);
	r0.xyz = c11.xyz + -v4.xyz;
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r3.xyz = r0.www * r0.xyz;
	r3.w = dot(r2.xyz, r3.xyz);
	r4.x = clamp(r3.w, 0.0, 1.0);
	r4.x = -r4.x + c3.w;
	r4.y = r4.x * r4.x;
	r4.x = (r4.x * -r4.x) + c17.z;
	r4.z = r4.y + r4.y;
	r4.w = (r4.y * c17.x) + c17.y;
	r5.x = -c19.x + c19.y;
	r5.y = mix(c19.y, c19.z, r4.w);
	r4.z = (r4.z * r5.x) + c19.x;
	r4.x = ((r4.x >= 0.0) ? r4.z : r5.y);
	if (b0) {
		r5 = (v4.xyzx * -c17.yyyw) + -c17.wwwy;
		r6.x = dot(r5, c69);
		r6.y = dot(r5, c70);
		r4.zw = clamp(r6.xy, float2(0.0), float2(1.0));
		r4.zw = -r6.xy + r4.zw;
		r4.z = dot(r4.zw, -c17.yy) + -c17.w;
		r7.x = dot(r5, c73);
		r7.y = dot(r5, c74);
		r8.xy = clamp(r7.xy, float2(0.0), float2(1.0));
		r8.xy = -r7.xy + r8.xy;
		r4.w = dot(r8.xy, -c17.yy) + -c17.w;
		r8.x = dot(r5, c77);
		r8.y = dot(r5, c78);
		r7.z = c3.w;
		r8.z = c17.x;
		r7.xyz = ((-abs(r4.w) >= 0.0) ? r7.xyz : r8.xyz);
		r6.z = -c17.w;
		r6.xyz = ((-abs(r4.z) >= 0.0) ? r6.xyz : r7.xyz);
		r7.z = dot(r5, c71);
		r4.zw = r6.xy + -c17.zz;
		r4.zw = abs(r4.zw) + -c67.zz;
		r4.zw = clamp(r4.zw * c67.ww, float2(0.0), float2(1.0));
		r4.zw = -r4.zw + c3.ww;
		r4.z = r4.w * r4.z;
		r6.xy = clamp(r6.xy, float2(0.0), float2(1.0));
		r8.xyz = r6.zzz + -abs(c17.wyx);
		r4.w = c17.w;
		r9 = ((-abs(r8.x) >= 0.0) ? c85.zwxy : -r4.wwww);
		r9 = ((-abs(r8.y) >= 0.0) ? c86.zwxy : r9);
		r8 = ((-abs(r8.z) >= 0.0) ? c87.zwxy : r9);
		r7.xy = (r6.xy * r8.xy) + r8.zw;
		r7.w = -c17.w;
		r8 = r7 + c15.xxyy;
		r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r9 = r7 + c15.zxyy;
		r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
		r10 = r7 + c15.xzyy;
		r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r11 = r7 + c15.zzyy;
		r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
		r8.y = r9.x;
		r8.z = r10.x;
		r8.w = r11.x;
		r6.x = dot(r8, c15.wwww);
		r8 = r7 + c15.xyyy;
		r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r9 = r7 + c15.zyyy;
		r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
		r10 = r7 + c15.yzyy;
		r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r11 = r7 + c15.yxyy;
		r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
		r8.y = r9.x;
		r8.z = r10.x;
		r8.w = r11.x;
		r6.y = dot(r8, c16.xxxx);
		r8 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
		r6.x = r6.y + r6.x;
		r6.x = (r8.x * c16.y) + r6.x;
		if (r4.z < c3.w) {
			r6.yzw = r6.zzz + c18.xyz;
			r8 = ((-abs(r6.y) >= 0.0) ? c73 : -r4.wwww);
			r9 = ((-abs(r6.y) >= 0.0) ? c74 : -r4.wwww);
			r8 = ((-abs(r6.z) >= 0.0) ? c77 : r8);
			r9 = ((-abs(r6.z) >= 0.0) ? c78 : r9);
			r8 = ((-abs(r6.w) >= 0.0) ? c81 : r8);
			r9 = ((-abs(r6.w) >= 0.0) ? c82 : r9);
			r8.x = clamp(dot(r5, r8), 0.0, 1.0);
			r8.y = clamp(dot(r5, r9), 0.0, 1.0);
			r5 = ((-abs(r6.y) >= 0.0) ? c86.zwxy : -r4.wwww);
			r5 = ((-abs(r6.z) >= 0.0) ? c87.zwxy : r5);
			r5 = ((-abs(r6.w) >= 0.0) ? c88.zwxy : r5);
			r7.xy = (r8.xy * r5.xy) + r5.zw;
			r5 = r7 + c15.xxyy;
			r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
			r8 = r7 + c15.zxyy;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r9 = r7 + c15.xzyy;
			r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
			r10 = r7 + c15.zzyy;
			r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
			r5.y = r8.x;
			r5.z = r9.x;
			r5.w = r10.x;
			r4.w = dot(r5, c15.wwww);
			r5 = r7 + c15.xyyy;
			r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
			r8 = r7 + c15.zyyy;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r9 = r7 + c15.yzyy;
			r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
			r10 = r7 + c15.yxyy;
			r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
			r5.y = r8.x;
			r5.z = r9.x;
			r5.w = r10.x;
			r5.x = dot(r5, c16.xxxx);
			r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
			r4.w = r4.w + r5.x;
			r4.w = (r7.x * c16.y) + r4.w;
			r4.w = ((r6.w >= 0.0) ? c3.w : r4.w);
			r5.x = mix(r4.w, r6.x, r4.z);
			r6.x = r5.x;
		}
		r5.xyz = -c89.xyz + v4.xyz;
		r4.z = dot(r5.xyz, r5.xyz);
		r4.z = clamp((r4.z * c68.y) + c68.x, 0.0, 1.0);
		r5.x = mix(r6.x, c3.w, r4.z);
	} else {
		r5.x = c3.w;
	}
	r5.yzw = r2.xyz * r2.xyz;
	r6.x = ((r2.x >= 0.0) ? -c17.w : -c17.y);
	r6.y = ((r2.y >= 0.0) ? -c17.w : -c17.y);
	r6.z = ((r2.z >= 0.0) ? -c17.w : -c17.y);
	r7.x = ((r2.x >= 0.0) ? -c17.y : -c17.w);
	r7.y = ((r2.y >= 0.0) ? -c17.y : -c17.w);
	r7.z = ((r2.z >= 0.0) ? -c17.y : -c17.w);
	r6.xyz = r5.yzw * r6.xyz;
	r5.yzw = r5.yzw * r7.xyz;
	r7.xyz = r6.xxx * c5.xyz;
	r7.xyz = (r5.yyy * c4.xyz) + r7.xyz;
	r7.xyz = (r5.zzz * c6.xyz) + r7.xyz;
	r6.xyw = (r6.yyy * c7.xyz) + r7.xyz;
	r5.yzw = (r5.www * c8.xyz) + r6.xyw;
	r5.yzw = (r6.zzz * c9.xyz) + r5.yzw;
	r6.xyz = c21.xyz + -v4.xyz;
	r7.xyz = normalize(r6.xyz);
	r6.xyz = c20.xyz * v5.xxx;
	r4.z = clamp(dot(r2.xyz, r7.xyz), 0.0, 1.0);
	r4.w = (r4.z * r4.z) + r4.z;
	r4.w = r4.w * c17.z;
	r8.xyz = r4.www * r6.xyz;
	r5.yzw = (r8.xyz * r5.xxx) + r5.yzw;
	r8.xyz = c23.xyz + -v4.xyz;
	r9.xyz = normalize(r8.xyz);
	r8.xyz = c22.xyz * v5.yyy;
	r4.w = clamp(dot(r2.xyz, r9.xyz), 0.0, 1.0);
	r6.w = (r4.w * r4.w) + r4.w;
	r6.w = r6.w * c17.z;
	r5.yzw = (r8.xyz * r6.www) + r5.yzw;
	r10.xyz = c25.xyz + -v4.xyz;
	r11.xyz = normalize(r10.xyz);
	r10.xyz = c24.xyz * v5.zzz;
	r6.w = clamp(dot(r2.xyz, r11.xyz), 0.0, 1.0);
	r7.w = (r6.w * r6.w) + r6.w;
	r7.w = r7.w * c17.z;
	r5.yzw = (r10.xyz * r7.www) + r5.yzw;
	r12.x = c23.w + -v4.x;
	r12.y = c24.w + -v4.y;
	r12.z = c25.w + -v4.z;
	r13.xyz = normalize(r12.xyz);
	r12.x = c20.w * v5.w;
	r12.y = c21.w * v5.w;
	r12.z = c22.w * v5.w;
	r7.w = clamp(dot(r2.xyz, r13.xyz), 0.0, 1.0);
	r8.w = (r7.w * r7.w) + r7.w;
	r8.w = r8.w * c17.z;
	r5.yzw = (r12.xyz * r8.www) + r5.yzw;
	r3.w = r3.w + r3.w;
	r8.w = dot(r2.xyz, r2.xyz);
	r14.xyz = r3.xyz * r8.www;
	r14.xyz = (r3.www * r2.xyz) + -r14.xyz;
	r14 = s8_texture.sample(s8, r14.xyz);
	r14.xyz = r14.xyz * c30.zzz;
	r14.xyz = r14.xyz * c2.xyz;
	r15.xyz = (r4.xxx * r14.xyz) + -r14.xyz;
	r14.xyz = (c10.xxx * r15.xyz) + r14.xyz;
	r3.w = mix(r1.w, r2.w, c2.w);
	r8.w = (r3.w * -c17.x) + -c17.y;
	r3.w = (c27.w * r8.w) + r3.w;
	r14.xyz = r3.www * r14.xyz;
	r15 = s7_texture.sample(s7, v0.xy);
	r3.w = r15.w + -c3.w;
	r8.w = c3.w;
	r3.w = (c13.x * r3.w) + r8.w;
	r9.w = abs(c10.z);
	r10.w = -r15.x + c3.w;
	r10.w = (r15.x * c16.z) + r10.w;
	r9.w = ((-r9.w >= 0.0) ? r10.w : c10.z);
	r10.w = c19.w;
	r16.xyz = (c0.www * r1.xyz) + -r10.www;
	r16.xyz = (r15.yyy * r16.xyz) + c19.www;
	r17.xyz = r1.xyz * r14.xyz;
	r17.xyz = (r17.xyz * c0.www) + -r14.xyz;
	r15.yzw = (r15.yyy * r17.xyz) + r14.xyz;
	r15.xyz = r15.yzw * r15.xxx;
	r17.xyz = r10.www * c26.xyz;
	r14.xyz = ((c26.x >= 0.0) ? r14.xyz : r15.xyz);
	r15.xyz = ((c26.x >= 0.0) ? r17.xyz : r16.xyz);
	r7.xyz = (r0.xyz * r0.www) + r7.xyz;
	r16.xyz = normalize(r7.xyz);
	r7.x = clamp(dot(r2.xyz, r16.xyz), 0.0, 1.0);
	r7.x = log2(r7.x);
	r7.y = r7.x * r9.w;
	r7.y = exp2(r7.y);
	r7.z = ((r4.z == 0.0) ? FLT_MAX : rsqrt(abs(r4.z)));
	r7.z = ((r7.z == 0.0) ? FLT_MAX : 1.0 / r7.z);
	r7.y = r7.z * r7.y;
	r16.xyz = r6.xyz * r7.yyy;
	r7.x = r7.x * c26.w;
	r7.x = exp2(r7.x);
	r4.z = r4.z * r7.x;
	r6.xyz = r6.xyz * r4.zzz;
	r7.xyz = (r0.xyz * r0.www) + r9.xyz;
	r9.xyz = normalize(r7.xyz);
	r4.z = clamp(dot(r2.xyz, r9.xyz), 0.0, 1.0);
	r4.z = log2(r4.z);
	r7.x = r4.z * r9.w;
	r7.x = exp2(r7.x);
	r7.y = ((r4.w == 0.0) ? FLT_MAX : rsqrt(abs(r4.w)));
	r7.y = ((r7.y == 0.0) ? FLT_MAX : 1.0 / r7.y);
	r7.x = r7.y * r7.x;
	r7.xyz = r8.xyz * r7.xxx;
	r4.z = r4.z * c26.w;
	r4.z = exp2(r4.z);
	r4.z = r4.w * r4.z;
	r8.xyz = r8.xyz * r4.zzz;
	r7.xyz = (r16.xyz * r5.xxx) + r7.xyz;
	r6.xyz = (r6.xyz * r5.xxx) + r8.xyz;
	r8.xyz = (r0.xyz * r0.www) + r11.xyz;
	r9.xyz = normalize(r8.xyz);
	r4.z = clamp(dot(r2.xyz, r9.xyz), 0.0, 1.0);
	r4.z = log2(r4.z);
	r4.w = r4.z * r9.w;
	r4.w = exp2(r4.w);
	r5.x = ((r6.w == 0.0) ? FLT_MAX : rsqrt(abs(r6.w)));
	r5.x = ((r5.x == 0.0) ? FLT_MAX : 1.0 / r5.x);
	r4.w = r4.w * r5.x;
	r4.z = r4.z * c26.w;
	r4.z = exp2(r4.z);
	r4.z = r6.w * r4.z;
	r7.xyz = (r4.www * r10.xyz) + r7.xyz;
	r6.xyz = (r4.zzz * r10.xyz) + r6.xyz;
	r0.xyz = (r0.xyz * r0.www) + r13.xyz;
	r8.xyz = normalize(r0.xyz);
	r0.x = clamp(dot(r2.xyz, r8.xyz), 0.0, 1.0);
	r0.x = log2(r0.x);
	r0.y = r0.x * r9.w;
	r0.y = exp2(r0.y);
	r0.z = ((r7.w == 0.0) ? FLT_MAX : rsqrt(abs(r7.w)));
	r0.z = ((r0.z == 0.0) ? FLT_MAX : 1.0 / r0.z);
	r0.y = r0.z * r0.y;
	r0.x = r0.x * c26.w;
	r0.x = exp2(r0.x);
	r0.x = r7.w * r0.x;
	r7.xyz = (r0.yyy * r12.xyz) + r7.xyz;
	r0.xyz = (r0.xxx * r12.xyz) + r6.xyz;
	r2.xyw = r2.www * r15.xyz;
	r2.xyw = r2.xyw * r7.xyz;
	r2.xyw = r4.xxx * r2.xyw;
	r4.x = clamp(r1.w + c27.z, 0.0, 1.0);
	r6.xyz = -r8.www + c1.xyz;
	r4.xzw = (r4.xxx * r6.xyz) + c3.www;
	r4.xzw = r4.xzw * r5.yzw;
	r4.y = r4.y * r4.y;
	r3.w = r3.w * r4.y;
	r0.xyz = r0.xyz * r3.www;
	r5.xyz = max(r2.xyw, r0.xyz);
	r0.x = r3.w * c14.w;
	r2.xyw = r3.xyz * r3.xyz;
	r6.x = ((r3.x >= 0.0) ? -c17.w : -c17.y);
	r6.y = ((r3.y >= 0.0) ? -c17.w : -c17.y);
	r6.z = ((r3.z >= 0.0) ? -c17.w : -c17.y);
	r3.x = ((r3.x >= 0.0) ? -c17.y : -c17.w);
	r3.y = ((r3.y >= 0.0) ? -c17.y : -c17.w);
	r3.z = ((r3.z >= 0.0) ? -c17.y : -c17.w);
	r6.xyz = r2.xyw * r6.xyz;
	r2.xyw = r2.xyw * r3.xyz;
	r3.xyz = r6.xxx * c5.xyz;
	r3.xyz = (r2.xxx * c4.xyz) + r3.xyz;
	r3.xyz = (r2.yyy * c6.xyz) + r3.xyz;
	r3.xyz = (r6.yyy * c7.xyz) + r3.xyz;
	r2.xyw = (r2.www * c8.xyz) + r3.xyz;
	r2.xyw = (r6.zzz * c9.xyz) + r2.xyw;
	r0.xyz = r0.xxx * r2.xyw;
	r2.x = clamp(r2.z, 0.0, 1.0);
	r0.xyz = (r0.xyz * r2.xxx) + r5.xyz;
	r0.xyz = r14.xyz + r0.xyz;
	r0.xyz = (r1.xyz * r4.xzw) + r0.xyz;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = clamp((r0.w * c12.w) + c12.x, 0.0, 1.0);
	r1.x = min(r0.w, c12.z);
	r1.yz = r8.ww + -c27.xy;
	r0.w = r1.y * c27.z;
	r0.w = r1.z * r0.w;
	r2.x = mix(c3.w, r1.w, r0.w);
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
	#undef c24
	#undef c25
	#undef c26
	#undef c27
	#undef c29
	#undef c30
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

