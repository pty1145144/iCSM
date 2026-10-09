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
	texture2d<float> s13_texture [[texture(13)]],
	sampler s13 [[sampler(13)]],
	depth2d<float> s15_texture [[texture(15)]],
	sampler s15 [[sampler(15)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c3 = float4(0.81649661, 0.577350258, 0.0, 0.0); (void) c3;
	const float4 c4 = float4(-0.408248334, 0.707106768, 0.577350258, 0.0); (void) c4;
	const float4 c5 = float4(-0.408248215, -0.707106828, 0.577350258, 0.0); (void) c5;
	const float4 c6 = float4(0.300000011, 0.589999973, 0.11, 0.0); (void) c6;
	const float4 c7 = float4(2.0, -1.0, 1.0, 0.5); (void) c7;
	const float4 c8 = float4(-0.000488281, 0.000488281, 0.0, 0.062499999); (void) c8;
	const float4 c9 = float4(1.0, 0.0, 2.0, 0.000488281); (void) c9;
	const float4 c13 = float4(0.125, 0.25, 150.0, 0.0); (void) c13;
	const float4 c14 = float4(0.0, -1.0, -2.0, 0.0); (void) c14;
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
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c2 uniforms.uniforms_float4[2]
	#define c10 uniforms.uniforms_float4[3]
	#define c11 uniforms.uniforms_float4[4]
	#define c12 uniforms.uniforms_float4[5]
	#define c19 uniforms.uniforms_float4[6]
	#define c20 uniforms.uniforms_float4[7]
	#define c21 uniforms.uniforms_float4[8]
	#define c22 uniforms.uniforms_float4[9]
	#define c23 uniforms.uniforms_float4[10]
	#define c26 uniforms.uniforms_float4[11]
	#define c27 uniforms.uniforms_float4[12]
	#define c29 uniforms.uniforms_float4[13]
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
	r2 = s13_texture.sample(s13, v1.zw);
	r2.xyz = (r2.xyz * c7.xxx) + c7.yyy;
	r3.yz = c7.yz;
	r2.xyz = (c0.www * r2.xyz) + r3.zzz;
	r4.xyz = r1.xyz * r2.xyz;
	r0.w = dot(r4.xyz, c6.xyz);
	r5 = s3_texture.sample(s3, v1.xy);
	r5.xyz = (r5.xyz * c7.xxx) + c7.yyy;
	r2.w = mix(r5.w, r1.w, c27.x);
	r3.x = mix(r2.w, r0.w, c10.y);
	r0.xyz = r0.xyz * r5.yyy;
	r0.xyz = (r5.xxx * v3.xyz) + r0.xyz;
	r0.xyz = (r5.zzz * v2.xyz) + r0.xyz;
	r6.xyz = normalize(r0.xyz);
	r0.xyz = c11.xyz + -v4.xyz;
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r7.xyz = r0.www * r0.xyz;
	r2.w = dot(r6.xyz, r7.xyz);
	r3.w = clamp(r2.w, 0.0, 1.0);
	r3.w = -r3.w + c7.z;
	r4.w = r3.w * r3.w;
	r3.w = (r3.w * -r3.w) + c7.w;
	r5.w = r4.w + r4.w;
	r4.w = (r4.w * c7.x) + c7.y;
	r6.w = -c19.x + c19.y;
	r7.w = mix(c19.y, c19.z, r4.w);
	r4.w = (r5.w * r6.w) + c19.x;
	r3.w = ((r3.w >= 0.0) ? r4.w : r7.w);
	if (b0) {
		r8 = (v4.xyzx * c9.xxxy) + c9.yyyx;
		r9.x = dot(r8, c69);
		r9.y = dot(r8, c70);
		r10.xy = clamp(r9.xy, float2(0.0), float2(1.0));
		r10.xy = -r9.xy + r10.xy;
		r4.w = dot(r10.xy, c9.xx) + c9.y;
		r10.x = dot(r8, c73);
		r10.y = dot(r8, c74);
		r11.xy = clamp(r10.xy, float2(0.0), float2(1.0));
		r11.xy = -r10.xy + r11.xy;
		r5.w = dot(r11.xy, c9.xx) + c9.y;
		r11.x = dot(r8, c77);
		r11.y = dot(r8, c78);
		r10.z = c7.z;
		r11.z = c7.x;
		r10.xyz = ((-abs(r5.w) >= 0.0) ? r10.xyz : r11.xyz);
		r9.z = c6.w;
		r9.xyz = ((-abs(r4.w) >= 0.0) ? r9.xyz : r10.xyz);
		r10.z = dot(r8, c71);
		r11.xy = r9.xy + -c7.ww;
		r11.xy = abs(r11.xy) + -c67.zz;
		r11.xy = clamp(r11.xy * c67.ww, float2(0.0), float2(1.0));
		r11.xy = -r11.xy + c7.zz;
		r4.w = r11.y * r11.x;
		r9.xy = clamp(r9.xy, float2(0.0), float2(1.0));
		r11.xyz = r9.zzz + -c9.yxz;
		r5.w = c6.w;
		r12 = ((-abs(r11.x) >= 0.0) ? c85.zwxy : r5.wwww);
		r12 = ((-abs(r11.y) >= 0.0) ? c86.zwxy : r12);
		r11 = ((-abs(r11.z) >= 0.0) ? c87.zwxy : r12);
		r10.xy = (r9.xy * r11.xy) + r11.zw;
		r10.w = c6.w;
		r11 = r10 + c9.wwyy;
		r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
		r12 = r10 + c8.xyzz;
		r12 = float4(s15_texture.sample_compare(s15, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
		r13 = r10 + c8.yxzz;
		r13 = float4(s15_texture.sample_compare(s15, (r13.xyz).xy, (r13.xyz).z, level(r13.w)));
		r14 = r10 + c8.xxzz;
		r14 = float4(s15_texture.sample_compare(s15, (r14.xyz).xy, (r14.xyz).z, level(r14.w)));
		r11.y = r12.x;
		r11.z = r13.x;
		r11.w = r14.x;
		r6.w = dot(r11, c8.wwww);
		r11 = r10 + c9.wyyy;
		r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
		r12 = r10 + c8.xzzz;
		r12 = float4(s15_texture.sample_compare(s15, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
		r13 = r10 + c8.zxzz;
		r13 = float4(s15_texture.sample_compare(s15, (r13.xyz).xy, (r13.xyz).z, level(r13.w)));
		r14 = r10 + c9.ywyy;
		r14 = float4(s15_texture.sample_compare(s15, (r14.xyz).xy, (r14.xyz).z, level(r14.w)));
		r11.y = r12.x;
		r11.z = r13.x;
		r11.w = r14.x;
		r7.w = dot(r11, c13.xxxx);
		r11 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r6.w = r6.w + r7.w;
		r6.w = (r11.x * c13.y) + r6.w;
		if (r4.w < c7.z) {
			r9.xyz = r9.zzz + c14.xyz;
			r11 = ((-abs(r9.x) >= 0.0) ? c73 : r5.wwww);
			r12 = ((-abs(r9.x) >= 0.0) ? c74 : r5.wwww);
			r11 = ((-abs(r9.y) >= 0.0) ? c77 : r11);
			r12 = ((-abs(r9.y) >= 0.0) ? c78 : r12);
			r11 = ((-abs(r9.z) >= 0.0) ? c81 : r11);
			r12 = ((-abs(r9.z) >= 0.0) ? c82 : r12);
			r11.x = clamp(dot(r8, r11), 0.0, 1.0);
			r11.y = clamp(dot(r8, r12), 0.0, 1.0);
			r8 = ((-abs(r9.x) >= 0.0) ? c86.zwxy : r5.wwww);
			r8 = ((-abs(r9.y) >= 0.0) ? c87.zwxy : r8);
			r8 = ((-abs(r9.z) >= 0.0) ? c88.zwxy : r8);
			r10.xy = (r11.xy * r8.xy) + r8.zw;
			r8 = r10 + c9.wwyy;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r11 = r10 + c8.xyzz;
			r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
			r12 = r10 + c8.yxzz;
			r12 = float4(s15_texture.sample_compare(s15, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
			r13 = r10 + c8.xxzz;
			r13 = float4(s15_texture.sample_compare(s15, (r13.xyz).xy, (r13.xyz).z, level(r13.w)));
			r8.y = r11.x;
			r8.z = r12.x;
			r8.w = r13.x;
			r5.w = dot(r8, c8.wwww);
			r8 = r10 + c9.wyyy;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r11 = r10 + c8.xzzz;
			r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
			r12 = r10 + c8.zxzz;
			r12 = float4(s15_texture.sample_compare(s15, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
			r13 = r10 + c9.ywyy;
			r13 = float4(s15_texture.sample_compare(s15, (r13.xyz).xy, (r13.xyz).z, level(r13.w)));
			r8.y = r11.x;
			r8.z = r12.x;
			r8.w = r13.x;
			r7.w = dot(r8, c13.xxxx);
			r8 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
			r5.w = r5.w + r7.w;
			r5.w = (r8.x * c13.y) + r5.w;
			r5.w = ((r9.z >= 0.0) ? c7.z : r5.w);
			r7.w = mix(r5.w, r6.w, r4.w);
			r6.w = r7.w;
		}
		r8.xyz = -c89.xyz + v4.xyz;
		r4.w = dot(r8.xyz, r8.xyz);
		r4.w = clamp((r4.w * c68.y) + c68.x, 0.0, 1.0);
		r5.w = mix(r6.w, c7.z, r4.w);
	} else {
		r5.w = c7.z;
	}
	r8.x = clamp(dot(r5.xz, c3.xy) + c3.z, 0.0, 1.0);
	r8.y = clamp(dot(r5.xyz, c4.xyz), 0.0, 1.0);
	r8.z = clamp(dot(r5.xyz, c5.xyz), 0.0, 1.0);
	r5.xyz = r8.xyz * r8.xyz;
	r8.xyz = r5.yyy * v6.xyz;
	r8.xyz = (r5.xxx * v5.xyz) + r8.xyz;
	r8.xyz = (r5.zzz * v7.xyz) + r8.xyz;
	r4.w = dot(r5.xyz, c7.zzz);
	if (b0) {
		r6.w = v5.w;
		r6.w = r6.w + v6.w;
		r6.w = r6.w + v7.w;
		r5.y = r5.y * v6.w;
		r5.x = (r5.x * v5.w) + r5.y;
		r5.x = (r5.z * v7.w) + r5.x;
		r5.xyz = r5.xxx * c64.xyz;
		r5.xyz = (r5.xyz * r5.www) + r8.xyz;
		r8.xyz = ((-r6.w >= 0.0) ? r8.xyz : r5.xyz);
	} else {
		r6.w = c7.z;
	}
	r4.w = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r5.xyz = r4.www * r8.xyz;
	r8.xyz = c23.xyz + -v4.xyz;
	r9.xyz = normalize(r8.xyz);
	r8.xyz = c22.xyz * v8.yyy;
	r4.w = clamp(dot(r6.xyz, r9.xyz), 0.0, 1.0);
	r7.w = (r4.w * r4.w) + r4.w;
	r7.w = r7.w * c7.w;
	r5.w = r5.w * r6.w;
	r5.xyz = (r8.xyz * r7.www) + r5.xyz;
	r2.w = r2.w + r2.w;
	r6.w = dot(r6.xyz, r6.xyz);
	r10.xyz = r7.xyz * r6.www;
	r10.xyz = (r2.www * r6.xyz) + -r10.xyz;
	r10 = s8_texture.sample(s8, r10.xyz);
	r10.xyz = r10.xyz * c30.zzz;
	r10.xyz = r10.xyz * c2.xyz;
	r11.xyz = (r3.www * r10.xyz) + -r10.xyz;
	r10.xyz = (c10.xxx * r11.xyz) + r10.xyz;
	r2.w = mix(r1.w, r3.x, c2.w);
	r6.w = (r2.w * -c7.x) + -c7.y;
	r2.w = (c27.w * r6.w) + r2.w;
	r10.xyz = r2.www * r10.xyz;
	r11 = s7_texture.sample(s7, v0.xy);
	r2.w = abs(c10.z);
	r6.w = -r11.x + c7.z;
	r6.w = (r11.x * c13.z) + r6.w;
	r2.w = ((-r2.w >= 0.0) ? r6.w : c10.z);
	r1.xyz = (r1.xyz * r2.xyz) + c7.yyy;
	r1.xyz = (r11.yyy * r1.xyz) + c7.zzz;
	r1.xyz = r1.xyz * c19.www;
	r6.w = c19.w;
	r2.xyz = r6.www * c26.xyz;
	r1.xyz = ((c26.x >= 0.0) ? r2.xyz : r1.xyz);
	r2.xyz = c21.xyz + -v4.xyz;
	r6.w = dot(r2.xyz, r2.xyz);
	r6.w = ((r6.w == 0.0) ? FLT_MAX : rsqrt(abs(r6.w)));
	r11.xyz = c20.xyz * v8.xxx;
	r2.xyz = (r2.xyz * r6.www) + r7.xyz;
	r7.xyz = normalize(r2.xyz);
	r2.x = clamp(dot(r6.xyz, r7.xyz), 0.0, 1.0);
	r6.w = pow(abs(r2.x), r2.w);
	r2.xyz = r11.xyz * r6.www;
	r0.xyz = (r0.xyz * r0.www) + r9.xyz;
	r7.xyz = normalize(r0.xyz);
	r0.x = clamp(dot(r6.xyz, r7.xyz), 0.0, 1.0);
	r6.x = pow(abs(r0.x), r2.w);
	r0.x = ((r4.w == 0.0) ? FLT_MAX : rsqrt(abs(r4.w)));
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = r0.x * r6.x;
	r0.xyz = r8.xyz * r0.xxx;
	r0.xyz = (r2.xyz * r5.www) + r0.xyz;
	r1.xyz = r1.xyz * r3.xxx;
	r0.xyz = r0.xyz * r1.xyz;
	r1.x = clamp(r1.w + c27.z, 0.0, 1.0);
	r2.xyz = r3.yyy + c1.xyz;
	r1.xyz = (r1.xxx * r2.xyz) + c7.zzz;
	r1.xyz = r1.xyz * r5.xyz;
	r0.xyz = (r0.xyz * r3.www) + r10.xyz;
	r0.xyz = (r4.xyz * r1.xyz) + r0.xyz;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = clamp((r0.w * c12.w) + c12.x, 0.0, 1.0);
	r1.x = min(r0.w, c12.z);
	r1.yz = r3.zz + -c27.xy;
	r0.w = r1.y * c27.z;
	r0.w = r1.z * r0.w;
	r1.y = r1.w + c7.y;
	r0.w = (r0.w * r1.y) + c7.z;
	oC0.w = r0.w * c1.w;
	r1.yzw = r0.xyz * c30.xxx;
	r0.w = r1.x * r1.x;
	r1.x = c30.x;
	r0.xyz = (r0.xyz * -r1.xxx) + c29.xyz;
	oC0.xyz = (r0.www * r0.xyz) + r1.yzw;
	#undef c0
	#undef c1
	#undef c2
	#undef c10
	#undef c11
	#undef c12
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

