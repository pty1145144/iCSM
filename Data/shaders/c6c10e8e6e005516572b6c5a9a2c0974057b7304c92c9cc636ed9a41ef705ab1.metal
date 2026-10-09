#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[36];
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
	texture2d<float> s2_texture [[texture(2)]],
	sampler s2 [[sampler(2)]],
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
	texture2d<float> s7_texture [[texture(7)]],
	sampler s7 [[sampler(7)]],
	depth2d<float> s15_texture [[texture(15)]],
	sampler s15 [[sampler(15)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c2 = float4(0.300000011, 0.589999973, 0.11, 1.0); (void) c2;
	const float4 c3 = float4(0.000488281, 0.0, -0.000488281, 0.062499999); (void) c3;
	const float4 c15 = float4(0.125, 0.25, 150.0, 0.0); (void) c15;
	const float4 c16 = float4(0.0, -1.0, -2.0, 0.0); (void) c16;
	const float4 c17 = float4(2.0, -1.0, 0.5, 0.0); (void) c17;
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
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c4 uniforms.uniforms_float4[2]
	#define c5 uniforms.uniforms_float4[3]
	#define c6 uniforms.uniforms_float4[4]
	#define c7 uniforms.uniforms_float4[5]
	#define c8 uniforms.uniforms_float4[6]
	#define c9 uniforms.uniforms_float4[7]
	#define c10 uniforms.uniforms_float4[8]
	#define c11 uniforms.uniforms_float4[9]
	#define c12 uniforms.uniforms_float4[10]
	#define c13 uniforms.uniforms_float4[11]
	#define c14 uniforms.uniforms_float4[12]
	#define c19 uniforms.uniforms_float4[13]
	#define c20 uniforms.uniforms_float4[14]
	#define c21 uniforms.uniforms_float4[15]
	#define c26 uniforms.uniforms_float4[16]
	#define c27 uniforms.uniforms_float4[17]
	#define c29 uniforms.uniforms_float4[18]
	#define c30 uniforms.uniforms_float4[19]
	#define c67 uniforms.uniforms_float4[20]
	#define c68 uniforms.uniforms_float4[21]
	#define c69 uniforms.uniforms_float4[22]
	#define c70 uniforms.uniforms_float4[23]
	#define c71 uniforms.uniforms_float4[24]
	#define c73 uniforms.uniforms_float4[25]
	#define c74 uniforms.uniforms_float4[26]
	#define c77 uniforms.uniforms_float4[27]
	#define c78 uniforms.uniforms_float4[28]
	#define c81 uniforms.uniforms_float4[29]
	#define c82 uniforms.uniforms_float4[30]
	#define c85 uniforms.uniforms_float4[31]
	#define c86 uniforms.uniforms_float4[32]
	#define c87 uniforms.uniforms_float4[33]
	#define c88 uniforms.uniforms_float4[34]
	#define c89 uniforms.uniforms_float4[35]
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
	r0.w = dot(r1.xyz, c2.xyz);
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
	r3.w = clamp(dot(r2.xyz, r3.xyz), 0.0, 1.0);
	r3.w = -r3.w + c2.w;
	r4.x = r3.w * r3.w;
	r3.w = (r3.w * -r3.w) + c17.z;
	r4.y = r4.x + r4.x;
	r4.z = (r4.x * c17.x) + c17.y;
	r4.w = -c19.x + c19.y;
	r5.x = mix(c19.y, c19.z, r4.z);
	r4.y = (r4.y * r4.w) + c19.x;
	r3.w = ((r3.w >= 0.0) ? r4.y : r5.x);
	if (b0) {
		r5 = (v4.xyzx * -c17.yyyw) + -c17.wwwy;
		r6.x = dot(r5, c69);
		r6.y = dot(r5, c70);
		r4.yz = clamp(r6.xy, float2(0.0), float2(1.0));
		r4.yz = -r6.xy + r4.yz;
		r4.y = dot(r4.yz, -c17.yy) + -c17.w;
		r7.x = dot(r5, c73);
		r7.y = dot(r5, c74);
		r4.zw = clamp(r7.xy, float2(0.0), float2(1.0));
		r4.zw = -r7.xy + r4.zw;
		r4.z = dot(r4.zw, -c17.yy) + -c17.w;
		r8.x = dot(r5, c77);
		r8.y = dot(r5, c78);
		r7.z = c2.w;
		r8.zw = c17.xw;
		r7.xyz = ((-abs(r4.z) >= 0.0) ? r7.xyz : r8.xyz);
		r6.zw = -c17.ww;
		r4.yzw = ((-abs(r4.y) >= 0.0) ? r6.xyz : r7.xyz);
		r6.z = dot(r5, c71);
		r7.xy = r4.yz + -c17.zz;
		r7.xy = abs(r7.xy) + -c67.zz;
		r7.xy = clamp(r7.xy * c67.ww, float2(0.0), float2(1.0));
		r7.xy = -r7.xy + c2.ww;
		r7.x = r7.y * r7.x;
		r4.yz = clamp(r4.yz, float2(0.0), float2(1.0));
		r7.yzw = r4.www + -abs(c17.wyx);
		r9 = ((-abs(r7.y) >= 0.0) ? c85.zwxy : -r8.wwww);
		r9 = ((-abs(r7.z) >= 0.0) ? c86.zwxy : r9);
		r9 = ((-abs(r7.w) >= 0.0) ? c87.zwxy : r9);
		r6.xy = (r4.yz * r9.xy) + r9.zw;
		r9 = r6 + c3.xxyy;
		r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
		r10 = r6 + c3.zxyy;
		r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r11 = r6 + c3.xzyy;
		r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
		r12 = r6 + c3.zzyy;
		r12 = float4(s15_texture.sample_compare(s15, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
		r9.y = r10.x;
		r9.z = r11.x;
		r9.w = r12.x;
		r4.y = dot(r9, c3.wwww);
		r9 = r6 + c3.xyyy;
		r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
		r10 = r6 + c3.zyyy;
		r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r11 = r6 + c3.yzyy;
		r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
		r12 = r6 + c3.yxyy;
		r12 = float4(s15_texture.sample_compare(s15, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
		r9.y = r10.x;
		r9.z = r11.x;
		r9.w = r12.x;
		r4.z = dot(r9, c15.xxxx);
		r9 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
		r4.y = r4.z + r4.y;
		r4.y = (r9.x * c15.y) + r4.y;
		if (r7.x < c2.w) {
			r7.yzw = r4.www + c16.xyz;
			r9 = ((-abs(r7.y) >= 0.0) ? c73 : -r8.wwww);
			r10 = ((-abs(r7.y) >= 0.0) ? c74 : -r8.wwww);
			r9 = ((-abs(r7.z) >= 0.0) ? c77 : r9);
			r10 = ((-abs(r7.z) >= 0.0) ? c78 : r10);
			r9 = ((-abs(r7.w) >= 0.0) ? c81 : r9);
			r10 = ((-abs(r7.w) >= 0.0) ? c82 : r10);
			r8.x = clamp(dot(r5, r9), 0.0, 1.0);
			r8.y = clamp(dot(r5, r10), 0.0, 1.0);
			r5 = ((-abs(r7.y) >= 0.0) ? c86.zwxy : -r8.wwww);
			r5 = ((-abs(r7.z) >= 0.0) ? c87.zwxy : r5);
			r5 = ((-abs(r7.w) >= 0.0) ? c88.zwxy : r5);
			r6.xy = (r8.xy * r5.xy) + r5.zw;
			r5 = r6 + c3.xxyy;
			r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
			r8 = r6 + c3.zxyy;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r9 = r6 + c3.xzyy;
			r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
			r10 = r6 + c3.zzyy;
			r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
			r5.y = r8.x;
			r5.z = r9.x;
			r5.w = r10.x;
			r4.z = dot(r5, c3.wwww);
			r5 = r6 + c3.xyyy;
			r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
			r8 = r6 + c3.zyyy;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r9 = r6 + c3.yzyy;
			r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
			r10 = r6 + c3.yxyy;
			r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
			r5.y = r8.x;
			r5.z = r9.x;
			r5.w = r10.x;
			r4.w = dot(r5, c15.xxxx);
			r5 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
			r4.z = r4.w + r4.z;
			r4.z = (r5.x * c15.y) + r4.z;
			r4.z = ((r7.w >= 0.0) ? c2.w : r4.z);
			r5.x = mix(r4.z, r4.y, r7.x);
			r4.y = r5.x;
		}
		r5.xyz = -c89.xyz + v4.xyz;
		r4.z = dot(r5.xyz, r5.xyz);
		r4.z = clamp((r4.z * c68.y) + c68.x, 0.0, 1.0);
		r5.x = mix(r4.y, c2.w, r4.z);
	} else {
		r5.x = c2.w;
	}
	r4.yzw = r2.xyz * r2.xyz;
	r5.y = ((r2.x >= 0.0) ? -c17.w : -c17.y);
	r5.z = ((r2.y >= 0.0) ? -c17.w : -c17.y);
	r5.w = ((r2.z >= 0.0) ? -c17.w : -c17.y);
	r6.x = ((r2.x >= 0.0) ? -c17.y : -c17.w);
	r6.y = ((r2.y >= 0.0) ? -c17.y : -c17.w);
	r6.z = ((r2.z >= 0.0) ? -c17.y : -c17.w);
	r5.yzw = r4.yzw * r5.yzw;
	r4.yzw = r4.yzw * r6.xyz;
	r6.xyz = r5.yyy * c5.xyz;
	r6.xyz = (r4.yyy * c4.xyz) + r6.xyz;
	r6.xyz = (r4.zzz * c6.xyz) + r6.xyz;
	r6.xyz = (r5.zzz * c7.xyz) + r6.xyz;
	r4.yzw = (r4.www * c8.xyz) + r6.xyz;
	r4.yzw = (r5.www * c9.xyz) + r4.yzw;
	r5.yzw = c21.xyz + -v4.xyz;
	r6.xyz = normalize(r5.yzw);
	r5.yzw = c20.xyz * v5.xxx;
	r6.w = clamp(dot(r2.xyz, r6.xyz), 0.0, 1.0);
	r7.x = (r6.w * r6.w) + r6.w;
	r7.x = r7.x * c17.z;
	r7 = s2_texture.sample(s2, r7.xx);
	r7.xyz = r5.yzw * r7.xyz;
	r4.yzw = (r7.xyz * r5.xxx) + r4.yzw;
	r7 = s7_texture.sample(s7, v0.xy);
	r7.z = r7.w + -c2.w;
	r7.w = c2.w;
	r7.z = (c13.x * r7.z) + r7.w;
	r8.x = abs(c10.z);
	r8.y = -r7.x + c2.w;
	r7.x = (r7.x * c15.z) + r8.y;
	r7.x = ((-r8.x >= 0.0) ? r7.x : c10.z);
	r8.w = c19.w;
	r8.xyz = (c0.www * r1.xyz) + -r8.www;
	r8.xyz = (r7.yyy * r8.xyz) + c19.www;
	r9.xyz = r8.www * c26.xyz;
	r8.xyz = ((c26.x >= 0.0) ? r9.xyz : r8.xyz);
	r0.xyz = (r0.xyz * r0.www) + r6.xyz;
	r6.xyz = normalize(r0.xyz);
	r0.x = clamp(dot(r2.xyz, r6.xyz), 0.0, 1.0);
	r0.x = log2(r0.x);
	r0.y = r0.x * r7.x;
	r0.y = exp2(r0.y);
	r0.z = ((r6.w == 0.0) ? FLT_MAX : rsqrt(abs(r6.w)));
	r0.z = ((r0.z == 0.0) ? FLT_MAX : 1.0 / r0.z);
	r0.y = r0.z * r0.y;
	r6.xyz = r5.yzw * r0.yyy;
	r0.x = r0.x * c26.w;
	r0.x = exp2(r0.x);
	r0.x = r6.w * r0.x;
	r0.xyz = r5.yzw * r0.xxx;
	r5.yzw = r5.xxx * r6.xyz;
	r0.xyz = r5.xxx * r0.xyz;
	r2.xyw = r2.www * r8.xyz;
	r2.xyw = r2.xyw * r5.yzw;
	r2.xyw = r3.www * r2.xyw;
	r3.w = clamp(r1.w + c27.z, 0.0, 1.0);
	r5.xyz = -r7.www + c1.xyz;
	r5.xyz = (r3.www * r5.xyz) + c2.www;
	r4.yzw = r4.yzw * r5.xyz;
	r3.w = r4.x * r4.x;
	r3.w = r3.w * r7.z;
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
	r0.xyz = (r1.xyz * r4.yzw) + r0.xyz;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = clamp((r0.w * c12.w) + c12.x, 0.0, 1.0);
	r1.x = min(r0.w, c12.z);
	r1.yz = r7.ww + -c27.xy;
	r0.w = r1.y * c27.z;
	r0.w = r1.z * r0.w;
	r2.x = mix(c2.w, r1.w, r0.w);
	oC0.w = r2.x * c1.w;
	r1.yzw = r0.xyz * c30.xxx;
	r0.w = r1.x * r1.x;
	r1.x = c30.x;
	r0.xyz = (r0.xyz * -r1.xxx) + c29.xyz;
	oC0.xyz = (r0.www * r0.xyz) + r1.yzw;
	#undef c0
	#undef c1
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

