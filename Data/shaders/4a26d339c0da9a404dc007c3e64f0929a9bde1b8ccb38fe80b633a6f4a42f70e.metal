#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[37];
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
	texture2d<float> s14_texture [[texture(14)]],
	sampler s14 [[sampler(14)]],
	depth2d<float> s15_texture [[texture(15)]],
	sampler s15 [[sampler(15)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c2 = float4(3.000000119e-01, 5.899999738e-01, 1.099999994e-01, 1.000000000e+00); (void) c2;
	const float4 c3 = float4(4.882812500e-04, 0.000000000e+00, -4.882812500e-04, 6.250000000e-02); (void) c3;
	const float4 c13 = float4(1.250000000e-01, 2.500000000e-01, 1.500000000e+02, 0.000000000e+00); (void) c13;
	const float4 c14 = float4(2.000000000e+00, -1.000000000e+00, 5.000000000e-01, -0.000000000e+00); (void) c14;
	const float4 c15 = float4(0.000000000e+00, -1.000000000e+00, -2.000000000e+00, 0.000000000e+00); (void) c15;
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
	#define c4 uniforms.uniforms_float4[2]
	#define c5 uniforms.uniforms_float4[3]
	#define c6 uniforms.uniforms_float4[4]
	#define c7 uniforms.uniforms_float4[5]
	#define c8 uniforms.uniforms_float4[6]
	#define c9 uniforms.uniforms_float4[7]
	#define c10 uniforms.uniforms_float4[8]
	#define c11 uniforms.uniforms_float4[9]
	#define c12 uniforms.uniforms_float4[10]
	#define c19 uniforms.uniforms_float4[11]
	#define c20 uniforms.uniforms_float4[12]
	#define c21 uniforms.uniforms_float4[13]
	#define c22 uniforms.uniforms_float4[14]
	#define c23 uniforms.uniforms_float4[15]
	#define c24 uniforms.uniforms_float4[16]
	#define c25 uniforms.uniforms_float4[17]
	#define c26 uniforms.uniforms_float4[18]
	#define c27 uniforms.uniforms_float4[19]
	#define c30 uniforms.uniforms_float4[20]
	#define c67 uniforms.uniforms_float4[21]
	#define c68 uniforms.uniforms_float4[22]
	#define c69 uniforms.uniforms_float4[23]
	#define c70 uniforms.uniforms_float4[24]
	#define c71 uniforms.uniforms_float4[25]
	#define c73 uniforms.uniforms_float4[26]
	#define c74 uniforms.uniforms_float4[27]
	#define c77 uniforms.uniforms_float4[28]
	#define c78 uniforms.uniforms_float4[29]
	#define c81 uniforms.uniforms_float4[30]
	#define c82 uniforms.uniforms_float4[31]
	#define c85 uniforms.uniforms_float4[32]
	#define c86 uniforms.uniforms_float4[33]
	#define c87 uniforms.uniforms_float4[34]
	#define c88 uniforms.uniforms_float4[35]
	#define c89 uniforms.uniforms_float4[36]
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
	r2.xyz = (r2.xyz * c14.xxx) + c14.yyy;
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
	r3.x = clamp(dot(r2.xyz, r3.xyz), 0.0, 1.0);
	r3.x = -r3.x + c2.w;
	r3.y = r3.x * r3.x;
	r3.x = (r3.x * -r3.x) + c14.z;
	r3.z = r3.y + r3.y;
	r3.y = (r3.y * c14.x) + c14.y;
	r3.w = -c19.x + c19.y;
	r4.x = mix(c19.y, c19.z, r3.y);
	r3.y = (r3.z * r3.w) + c19.x;
	r3.x = ((r3.x >= 0.0) ? r3.y : r4.x);
	if (b0) {
		r4 = (v4.xyzx * -c14.yyyw) + -c14.wwwy;
		r5.x = dot(r4, c69);
		r5.y = dot(r4, c70);
		r3.yz = clamp(r5.xy, float2(0.0), float2(1.0));
		r3.yz = -r5.xy + r3.yz;
		r3.y = dot(r3.yz, -c14.yy) + -c14.w;
		r6.x = dot(r4, c73);
		r6.y = dot(r4, c74);
		r3.zw = clamp(r6.xy, float2(0.0), float2(1.0));
		r3.zw = -r6.xy + r3.zw;
		r3.z = dot(r3.zw, -c14.yy) + -c14.w;
		r7.x = dot(r4, c77);
		r7.y = dot(r4, c78);
		r6.z = c2.w;
		r7.zw = c14.xw;
		r6.xyz = ((-abs(r3.z) >= 0.0) ? r6.xyz : r7.xyz);
		r5.zw = -c14.ww;
		r3.yzw = ((-abs(r3.y) >= 0.0) ? r5.xyz : r6.xyz);
		r5.z = dot(r4, c71);
		r6.xy = r3.yz + -c14.zz;
		r6.xy = abs(r6.xy) + -c67.zz;
		r6.xy = clamp(r6.xy * c67.ww, float2(0.0), float2(1.0));
		r6.xy = -r6.xy + c2.ww;
		r6.x = r6.y * r6.x;
		r3.yz = clamp(r3.yz, float2(0.0), float2(1.0));
		r6.yzw = r3.www + -abs(c14.wyx);
		r8 = ((-abs(r6.y) >= 0.0) ? c85.zwxy : -r7.wwww);
		r8 = ((-abs(r6.z) >= 0.0) ? c86.zwxy : r8);
		r8 = ((-abs(r6.w) >= 0.0) ? c87.zwxy : r8);
		r5.xy = (r3.yz * r8.xy) + r8.zw;
		r8 = r5 + c3.xxyy;
		r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r9 = r5 + c3.zxyy;
		r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
		r10 = r5 + c3.xzyy;
		r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r11 = r5 + c3.zzyy;
		r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
		r8.y = r9.x;
		r8.z = r10.x;
		r8.w = r11.x;
		r3.y = dot(r8, c3.wwww);
		r8 = r5 + c3.xyyy;
		r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r9 = r5 + c3.zyyy;
		r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
		r10 = r5 + c3.yzyy;
		r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r11 = r5 + c3.yxyy;
		r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
		r8.y = r9.x;
		r8.z = r10.x;
		r8.w = r11.x;
		r3.z = dot(r8, c13.xxxx);
		r8 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
		r3.y = r3.z + r3.y;
		r3.y = (r8.x * c13.y) + r3.y;
		if (r6.x < c2.w) {
			r6.yzw = r3.www + c15.xyz;
			r8 = ((-abs(r6.y) >= 0.0) ? c73 : -r7.wwww);
			r9 = ((-abs(r6.y) >= 0.0) ? c74 : -r7.wwww);
			r8 = ((-abs(r6.z) >= 0.0) ? c77 : r8);
			r9 = ((-abs(r6.z) >= 0.0) ? c78 : r9);
			r8 = ((-abs(r6.w) >= 0.0) ? c81 : r8);
			r9 = ((-abs(r6.w) >= 0.0) ? c82 : r9);
			r7.x = clamp(dot(r4, r8), 0.0, 1.0);
			r7.y = clamp(dot(r4, r9), 0.0, 1.0);
			r4 = ((-abs(r6.y) >= 0.0) ? c86.zwxy : -r7.wwww);
			r4 = ((-abs(r6.z) >= 0.0) ? c87.zwxy : r4);
			r4 = ((-abs(r6.w) >= 0.0) ? c88.zwxy : r4);
			r5.xy = (r7.xy * r4.xy) + r4.zw;
			r4 = r5 + c3.xxyy;
			r4 = float4(s15_texture.sample_compare(s15, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
			r7 = r5 + c3.zxyy;
			r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
			r8 = r5 + c3.xzyy;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r9 = r5 + c3.zzyy;
			r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
			r4.y = r7.x;
			r4.z = r8.x;
			r4.w = r9.x;
			r3.z = dot(r4, c3.wwww);
			r4 = r5 + c3.xyyy;
			r4 = float4(s15_texture.sample_compare(s15, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
			r7 = r5 + c3.zyyy;
			r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
			r8 = r5 + c3.yzyy;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r9 = r5 + c3.yxyy;
			r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
			r4.y = r7.x;
			r4.z = r8.x;
			r4.w = r9.x;
			r3.w = dot(r4, c13.xxxx);
			r4 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
			r3.z = r3.w + r3.z;
			r3.z = (r4.x * c13.y) + r3.z;
			r3.z = ((r6.w >= 0.0) ? c2.w : r3.z);
			r4.x = mix(r3.z, r3.y, r6.x);
			r3.y = r4.x;
		}
		r4.xyz = -c89.xyz + v4.xyz;
		r3.z = dot(r4.xyz, r4.xyz);
		r3.z = clamp((r3.z * c68.y) + c68.x, 0.0, 1.0);
		r4.x = mix(r3.y, c2.w, r3.z);
	} else {
		r4.x = c2.w;
	}
	r3.yzw = r2.xyz * r2.xyz;
	r4.y = ((r2.x >= 0.0) ? -c14.w : -c14.y);
	r4.z = ((r2.y >= 0.0) ? -c14.w : -c14.y);
	r4.w = ((r2.z >= 0.0) ? -c14.w : -c14.y);
	r5.x = ((r2.x >= 0.0) ? -c14.y : -c14.w);
	r5.y = ((r2.y >= 0.0) ? -c14.y : -c14.w);
	r5.z = ((r2.z >= 0.0) ? -c14.y : -c14.w);
	r4.yzw = r3.yzw * r4.yzw;
	r3.yzw = r3.yzw * r5.xyz;
	r5.xyz = r4.yyy * c5.xyz;
	r5.xyz = (r3.yyy * c4.xyz) + r5.xyz;
	r5.xyz = (r3.zzz * c6.xyz) + r5.xyz;
	r5.xyz = (r4.zzz * c7.xyz) + r5.xyz;
	r3.yzw = (r3.www * c8.xyz) + r5.xyz;
	r3.yzw = (r4.www * c9.xyz) + r3.yzw;
	r4.yzw = c21.xyz + -v4.xyz;
	r5.xyz = normalize(r4.yzw);
	r4.yzw = c20.xyz * v5.xxx;
	r5.w = clamp(dot(r2.xyz, r5.xyz), 0.0, 1.0);
	r6.x = (r5.w * r5.w) + r5.w;
	r6.x = r6.x * c14.z;
	r6.xyz = r4.yzw * r6.xxx;
	r3.yzw = (r6.xyz * r4.xxx) + r3.yzw;
	r6.xyz = c23.xyz + -v4.xyz;
	r7.xyz = normalize(r6.xyz);
	r6.xyz = c22.xyz * v5.yyy;
	r6.w = clamp(dot(r2.xyz, r7.xyz), 0.0, 1.0);
	r7.w = (r6.w * r6.w) + r6.w;
	r7.w = r7.w * c14.z;
	r3.yzw = (r6.xyz * r7.www) + r3.yzw;
	r8.xyz = c25.xyz + -v4.xyz;
	r9.xyz = normalize(r8.xyz);
	r8.xyz = c24.xyz * v5.zzz;
	r7.w = clamp(dot(r2.xyz, r9.xyz), 0.0, 1.0);
	r8.w = (r7.w * r7.w) + r7.w;
	r8.w = r8.w * c14.z;
	r3.yzw = (r8.xyz * r8.www) + r3.yzw;
	r10 = s7_texture.sample(s7, v0.xy);
	r8.w = abs(c10.z);
	r9.w = -r10.x + c2.w;
	r9.w = (r10.x * c13.z) + r9.w;
	r8.w = ((-r8.w >= 0.0) ? r9.w : c10.z);
	r9.w = c19.w;
	r10.xzw = (c0.www * r1.xyz) + -r9.www;
	r10.xyz = (r10.yyy * r10.xzw) + c19.www;
	r11.xyz = r9.www * c26.xyz;
	r10.xyz = ((c26.x >= 0.0) ? r11.xyz : r10.xyz);
	r5.xyz = (r0.xyz * r0.www) + r5.xyz;
	r11.xyz = normalize(r5.xyz);
	r5.x = clamp(dot(r2.xyz, r11.xyz), 0.0, 1.0);
	r9.w = pow(abs(r5.x), r8.w);
	r5.x = ((r5.w == 0.0) ? FLT_MAX : rsqrt(abs(r5.w)));
	r5.x = ((r5.x == 0.0) ? FLT_MAX : 1.0 / r5.x);
	r5.x = r5.x * r9.w;
	r4.yzw = r4.yzw * r5.xxx;
	r5.xyz = (r0.xyz * r0.www) + r7.xyz;
	r7.xyz = normalize(r5.xyz);
	r5.x = clamp(dot(r2.xyz, r7.xyz), 0.0, 1.0);
	r7.x = pow(abs(r5.x), r8.w);
	r5.x = ((r6.w == 0.0) ? FLT_MAX : rsqrt(abs(r6.w)));
	r5.x = ((r5.x == 0.0) ? FLT_MAX : 1.0 / r5.x);
	r5.x = r5.x * r7.x;
	r5.xyz = r6.xyz * r5.xxx;
	r4.xyz = (r4.yzw * r4.xxx) + r5.xyz;
	r0.xyz = (r0.xyz * r0.www) + r9.xyz;
	r5.xyz = normalize(r0.xyz);
	r0.x = clamp(dot(r2.xyz, r5.xyz), 0.0, 1.0);
	r2.x = pow(abs(r0.x), r8.w);
	r0.x = ((r7.w == 0.0) ? FLT_MAX : rsqrt(abs(r7.w)));
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = r0.x * r2.x;
	r0.xyz = (r0.xxx * r8.xyz) + r4.xyz;
	r2.xyz = r2.www * r10.xyz;
	r0.xyz = r0.xyz * r2.xyz;
	r0.w = clamp(r1.w + c27.z, 0.0, 1.0);
	r2.w = c2.w;
	r2.xyz = -r2.www + c1.xyz;
	r2.xyz = (r0.www * r2.xyz) + c2.www;
	r2.xyz = r2.xyz * r3.yzw;
	r2.xyz = r1.xyz * r2.xyz;
	r4 = s14_texture.sample(s14, v0.xy);
	r3.yzw = mix(r1.www, r4.xyz, c10.www);
	r1.xyz = (c0.xyz * r1.xyz) + -r2.xyz;
	r1.xyz = (r3.yzw * r1.xyz) + r2.xyz;
	r2.xyz = max(r1.xyz, -c14.www);
	r0.xyz = (r0.xyz * r3.xxx) + r2.xyz;
	r0.w = c12.y + -v4.z;
	r0.w = r0.w + -c14.x;
	oC0.w = clamp(r0.w * c12.w, 0.0, 1.0);
	oC0.xyz = r0.xyz * c30.xxx;
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

