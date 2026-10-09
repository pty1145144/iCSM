#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[38];
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
	texture2d<float> s14_texture [[texture(14)]],
	sampler s14 [[sampler(14)]],
	depth2d<float> s15_texture [[texture(15)]],
	sampler s15 [[sampler(15)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c3 = float4(3.000000119e-01, 5.899999738e-01, 1.099999994e-01, 1.000000000e+00); (void) c3;
	const float4 c13 = float4(4.882812500e-04, 0.000000000e+00, -4.882812500e-04, 6.250000000e-02); (void) c13;
	const float4 c14 = float4(1.250000000e-01, 2.500000000e-01, 1.500000000e+02, 0.000000000e+00); (void) c14;
	const float4 c15 = float4(2.000000000e+00, -1.000000000e+00, 5.000000000e-01, -0.000000000e+00); (void) c15;
	const float4 c16 = float4(0.000000000e+00, -1.000000000e+00, -2.000000000e+00, 0.000000000e+00); (void) c16;
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
	#define c19 uniforms.uniforms_float4[12]
	#define c20 uniforms.uniforms_float4[13]
	#define c21 uniforms.uniforms_float4[14]
	#define c22 uniforms.uniforms_float4[15]
	#define c23 uniforms.uniforms_float4[16]
	#define c24 uniforms.uniforms_float4[17]
	#define c25 uniforms.uniforms_float4[18]
	#define c26 uniforms.uniforms_float4[19]
	#define c27 uniforms.uniforms_float4[20]
	#define c30 uniforms.uniforms_float4[21]
	#define c67 uniforms.uniforms_float4[22]
	#define c68 uniforms.uniforms_float4[23]
	#define c69 uniforms.uniforms_float4[24]
	#define c70 uniforms.uniforms_float4[25]
	#define c71 uniforms.uniforms_float4[26]
	#define c73 uniforms.uniforms_float4[27]
	#define c74 uniforms.uniforms_float4[28]
	#define c77 uniforms.uniforms_float4[29]
	#define c78 uniforms.uniforms_float4[30]
	#define c81 uniforms.uniforms_float4[31]
	#define c82 uniforms.uniforms_float4[32]
	#define c85 uniforms.uniforms_float4[33]
	#define c86 uniforms.uniforms_float4[34]
	#define c87 uniforms.uniforms_float4[35]
	#define c88 uniforms.uniforms_float4[36]
	#define c89 uniforms.uniforms_float4[37]
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
	r2.xyz = (r2.xyz * c15.xxx) + c15.yyy;
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
	r4.x = (r4.x * -r4.x) + c15.z;
	r4.z = r4.y + r4.y;
	r4.y = (r4.y * c15.x) + c15.y;
	r4.w = -c19.x + c19.y;
	r5.x = mix(c19.y, c19.z, r4.y);
	r4.y = (r4.z * r4.w) + c19.x;
	r4.x = ((r4.x >= 0.0) ? r4.y : r5.x);
	if (b0) {
		r5 = (v4.xyzx * -c15.yyyw) + -c15.wwwy;
		r6.x = dot(r5, c69);
		r6.y = dot(r5, c70);
		r4.yz = clamp(r6.xy, float2(0.0), float2(1.0));
		r4.yz = -r6.xy + r4.yz;
		r4.y = dot(r4.yz, -c15.yy) + -c15.w;
		r7.x = dot(r5, c73);
		r7.y = dot(r5, c74);
		r4.zw = clamp(r7.xy, float2(0.0), float2(1.0));
		r4.zw = -r7.xy + r4.zw;
		r4.z = dot(r4.zw, -c15.yy) + -c15.w;
		r8.x = dot(r5, c77);
		r8.y = dot(r5, c78);
		r7.z = c3.w;
		r8.zw = c15.xw;
		r7.xyz = ((-abs(r4.z) >= 0.0) ? r7.xyz : r8.xyz);
		r6.zw = -c15.ww;
		r4.yzw = ((-abs(r4.y) >= 0.0) ? r6.xyz : r7.xyz);
		r6.z = dot(r5, c71);
		r7.xy = r4.yz + -c15.zz;
		r7.xy = abs(r7.xy) + -c67.zz;
		r7.xy = clamp(r7.xy * c67.ww, float2(0.0), float2(1.0));
		r7.xy = -r7.xy + c3.ww;
		r7.x = r7.y * r7.x;
		r4.yz = clamp(r4.yz, float2(0.0), float2(1.0));
		r7.yzw = r4.www + -abs(c15.wyx);
		r9 = ((-abs(r7.y) >= 0.0) ? c85.zwxy : -r8.wwww);
		r9 = ((-abs(r7.z) >= 0.0) ? c86.zwxy : r9);
		r9 = ((-abs(r7.w) >= 0.0) ? c87.zwxy : r9);
		r6.xy = (r4.yz * r9.xy) + r9.zw;
		r9 = r6 + c13.xxyy;
		r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
		r10 = r6 + c13.zxyy;
		r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r11 = r6 + c13.xzyy;
		r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
		r12 = r6 + c13.zzyy;
		r12 = float4(s15_texture.sample_compare(s15, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
		r9.y = r10.x;
		r9.z = r11.x;
		r9.w = r12.x;
		r4.y = dot(r9, c13.wwww);
		r9 = r6 + c13.xyyy;
		r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
		r10 = r6 + c13.zyyy;
		r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r11 = r6 + c13.yzyy;
		r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
		r12 = r6 + c13.yxyy;
		r12 = float4(s15_texture.sample_compare(s15, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
		r9.y = r10.x;
		r9.z = r11.x;
		r9.w = r12.x;
		r4.z = dot(r9, c14.xxxx);
		r9 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
		r4.y = r4.z + r4.y;
		r4.y = (r9.x * c14.y) + r4.y;
		if (r7.x < c3.w) {
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
			r5 = r6 + c13.xxyy;
			r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
			r8 = r6 + c13.zxyy;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r9 = r6 + c13.xzyy;
			r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
			r10 = r6 + c13.zzyy;
			r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
			r5.y = r8.x;
			r5.z = r9.x;
			r5.w = r10.x;
			r4.z = dot(r5, c13.wwww);
			r5 = r6 + c13.xyyy;
			r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
			r8 = r6 + c13.zyyy;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r9 = r6 + c13.yzyy;
			r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
			r10 = r6 + c13.yxyy;
			r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
			r5.y = r8.x;
			r5.z = r9.x;
			r5.w = r10.x;
			r4.w = dot(r5, c14.xxxx);
			r5 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
			r4.z = r4.w + r4.z;
			r4.z = (r5.x * c14.y) + r4.z;
			r4.z = ((r7.w >= 0.0) ? c3.w : r4.z);
			r5.x = mix(r4.z, r4.y, r7.x);
			r4.y = r5.x;
		}
		r5.xyz = -c89.xyz + v4.xyz;
		r4.z = dot(r5.xyz, r5.xyz);
		r4.z = clamp((r4.z * c68.y) + c68.x, 0.0, 1.0);
		r5.x = mix(r4.y, c3.w, r4.z);
	} else {
		r5.x = c3.w;
	}
	r4.yzw = r2.xyz * r2.xyz;
	r5.y = ((r2.x >= 0.0) ? -c15.w : -c15.y);
	r5.z = ((r2.y >= 0.0) ? -c15.w : -c15.y);
	r5.w = ((r2.z >= 0.0) ? -c15.w : -c15.y);
	r6.x = ((r2.x >= 0.0) ? -c15.y : -c15.w);
	r6.y = ((r2.y >= 0.0) ? -c15.y : -c15.w);
	r6.z = ((r2.z >= 0.0) ? -c15.y : -c15.w);
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
	r7.x = r7.x * c15.z;
	r7.xyz = r5.yzw * r7.xxx;
	r4.yzw = (r7.xyz * r5.xxx) + r4.yzw;
	r7.xyz = c23.xyz + -v4.xyz;
	r8.xyz = normalize(r7.xyz);
	r7.xyz = c22.xyz * v5.yyy;
	r7.w = clamp(dot(r2.xyz, r8.xyz), 0.0, 1.0);
	r8.w = (r7.w * r7.w) + r7.w;
	r8.w = r8.w * c15.z;
	r4.yzw = (r7.xyz * r8.www) + r4.yzw;
	r9.xyz = c25.xyz + -v4.xyz;
	r10.xyz = normalize(r9.xyz);
	r9.xyz = c24.xyz * v5.zzz;
	r8.w = clamp(dot(r2.xyz, r10.xyz), 0.0, 1.0);
	r9.w = (r8.w * r8.w) + r8.w;
	r9.w = r9.w * c15.z;
	r4.yzw = (r9.xyz * r9.www) + r4.yzw;
	r3.w = r3.w + r3.w;
	r9.w = dot(r2.xyz, r2.xyz);
	r3.xyz = r3.xyz * r9.www;
	r3.xyz = (r3.www * r2.xyz) + -r3.xyz;
	r3 = s8_texture.sample(s8, r3.xyz);
	r3.xyz = r3.xyz * c30.zzz;
	r3.xyz = r3.xyz * c2.xyz;
	r11.xyz = (r4.xxx * r3.xyz) + -r3.xyz;
	r3.xyz = (c10.xxx * r11.xyz) + r3.xyz;
	r3.w = mix(r1.w, r2.w, c2.w);
	r9.w = (r3.w * -c15.x) + -c15.y;
	r3.w = (c27.w * r9.w) + r3.w;
	r3.xyz = r3.www * r3.xyz;
	r11 = s7_texture.sample(s7, v0.xy);
	r3.w = abs(c10.z);
	r9.w = -r11.x + c3.w;
	r9.w = (r11.x * c14.z) + r9.w;
	r3.w = ((-r3.w >= 0.0) ? r9.w : c10.z);
	r9.w = c19.w;
	r12.xyz = (c0.www * r1.xyz) + -r9.www;
	r12.xyz = (r11.yyy * r12.xyz) + c19.www;
	r13.xyz = r1.xyz * r3.xyz;
	r13.xyz = (r13.xyz * c0.www) + -r3.xyz;
	r11.yzw = (r11.yyy * r13.xyz) + r3.xyz;
	r11.xyz = r11.yzw * r11.xxx;
	r13.xyz = r9.www * c26.xyz;
	r3.xyz = ((c26.x >= 0.0) ? r3.xyz : r11.xyz);
	r11.xyz = ((c26.x >= 0.0) ? r13.xyz : r12.xyz);
	r6.xyz = (r0.xyz * r0.www) + r6.xyz;
	r12.xyz = normalize(r6.xyz);
	r6.x = clamp(dot(r2.xyz, r12.xyz), 0.0, 1.0);
	r9.w = pow(abs(r6.x), r3.w);
	r6.x = ((r6.w == 0.0) ? FLT_MAX : rsqrt(abs(r6.w)));
	r6.x = ((r6.x == 0.0) ? FLT_MAX : 1.0 / r6.x);
	r6.x = r6.x * r9.w;
	r5.yzw = r5.yzw * r6.xxx;
	r6.xyz = (r0.xyz * r0.www) + r8.xyz;
	r8.xyz = normalize(r6.xyz);
	r6.x = clamp(dot(r2.xyz, r8.xyz), 0.0, 1.0);
	r8.x = pow(abs(r6.x), r3.w);
	r6.x = ((r7.w == 0.0) ? FLT_MAX : rsqrt(abs(r7.w)));
	r6.x = ((r6.x == 0.0) ? FLT_MAX : 1.0 / r6.x);
	r6.x = r6.x * r8.x;
	r6.xyz = r7.xyz * r6.xxx;
	r5.xyz = (r5.yzw * r5.xxx) + r6.xyz;
	r0.xyz = (r0.xyz * r0.www) + r10.xyz;
	r6.xyz = normalize(r0.xyz);
	r0.x = clamp(dot(r2.xyz, r6.xyz), 0.0, 1.0);
	r2.x = pow(abs(r0.x), r3.w);
	r0.x = ((r8.w == 0.0) ? FLT_MAX : rsqrt(abs(r8.w)));
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = r0.x * r2.x;
	r0.xyz = (r0.xxx * r9.xyz) + r5.xyz;
	r2.xyz = r2.www * r11.xyz;
	r0.xyz = r0.xyz * r2.xyz;
	r0.w = clamp(r1.w + c27.z, 0.0, 1.0);
	r2.w = c3.w;
	r2.xyz = -r2.www + c1.xyz;
	r2.xyz = (r0.www * r2.xyz) + c3.www;
	r2.xyz = r2.xyz * r4.yzw;
	r2.xyz = r1.xyz * r2.xyz;
	r5 = s14_texture.sample(s14, v0.xy);
	r4.yzw = mix(r1.www, r5.xyz, c10.www);
	r1.xyz = (c0.xyz * r1.xyz) + -r2.xyz;
	r1.xyz = (r4.yzw * r1.xyz) + r2.xyz;
	r2.xyz = max(r1.xyz, -c15.www);
	r0.xyz = (r0.xyz * r4.xxx) + r3.xyz;
	r0.xyz = r2.xyz + r0.xyz;
	r0.w = c12.y + -v4.z;
	r0.w = r0.w + -c15.x;
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

