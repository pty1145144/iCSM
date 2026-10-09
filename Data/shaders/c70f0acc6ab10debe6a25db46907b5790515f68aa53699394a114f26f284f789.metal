#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[31];
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
	#define c30 uniforms.uniforms_float4[13]
	#define c64 uniforms.uniforms_float4[14]
	#define c67 uniforms.uniforms_float4[15]
	#define c68 uniforms.uniforms_float4[16]
	#define c69 uniforms.uniforms_float4[17]
	#define c70 uniforms.uniforms_float4[18]
	#define c71 uniforms.uniforms_float4[19]
	#define c73 uniforms.uniforms_float4[20]
	#define c74 uniforms.uniforms_float4[21]
	#define c77 uniforms.uniforms_float4[22]
	#define c78 uniforms.uniforms_float4[23]
	#define c81 uniforms.uniforms_float4[24]
	#define c82 uniforms.uniforms_float4[25]
	#define c85 uniforms.uniforms_float4[26]
	#define c86 uniforms.uniforms_float4[27]
	#define c87 uniforms.uniforms_float4[28]
	#define c88 uniforms.uniforms_float4[29]
	#define c89 uniforms.uniforms_float4[30]
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
	r3.xzw = r1.xyz * r2.xyz;
	r0.w = dot(r3.xzw, c6.xyz);
	r4 = s3_texture.sample(s3, v1.xy);
	r4.xyz = (r4.xyz * c7.xxx) + c7.yyy;
	r2.w = mix(r4.w, r1.w, c27.x);
	r4.w = mix(r2.w, r0.w, c10.y);
	r0.xyz = r0.xyz * r4.yyy;
	r0.xyz = (r4.xxx * v3.xyz) + r0.xyz;
	r0.xyz = (r4.zzz * v2.xyz) + r0.xyz;
	r5.xyz = normalize(r0.xyz);
	r0.xyz = c11.xyz + -v4.xyz;
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r6.xyz = r0.www * r0.xyz;
	r2.w = dot(r5.xyz, r6.xyz);
	r5.w = clamp(r2.w, 0.0, 1.0);
	r5.w = -r5.w + c7.z;
	r6.w = r5.w * r5.w;
	r5.w = (r5.w * -r5.w) + c7.w;
	r7.x = r6.w + r6.w;
	r6.w = (r6.w * c7.x) + c7.y;
	r7.y = -c19.x + c19.y;
	r7.z = mix(c19.y, c19.z, r6.w);
	r6.w = (r7.x * r7.y) + c19.x;
	r5.w = ((r5.w >= 0.0) ? r6.w : r7.z);
	if (b0) {
		r7 = (v4.xyzx * c9.xxxy) + c9.yyyx;
		r8.x = dot(r7, c69);
		r8.y = dot(r7, c70);
		r9.xy = clamp(r8.xy, float2(0.0), float2(1.0));
		r9.xy = -r8.xy + r9.xy;
		r6.w = dot(r9.xy, c9.xx) + c9.y;
		r9.x = dot(r7, c73);
		r9.y = dot(r7, c74);
		r10.xy = clamp(r9.xy, float2(0.0), float2(1.0));
		r10.xy = -r9.xy + r10.xy;
		r8.w = dot(r10.xy, c9.xx) + c9.y;
		r10.x = dot(r7, c77);
		r10.y = dot(r7, c78);
		r9.z = c7.z;
		r10.z = c7.x;
		r9.xyz = ((-abs(r8.w) >= 0.0) ? r9.xyz : r10.xyz);
		r8.zw = c6.ww;
		r8.xyz = ((-abs(r6.w) >= 0.0) ? r8.xyz : r9.xyz);
		r9.z = dot(r7, c71);
		r10.xy = r8.xy + -c7.ww;
		r10.xy = abs(r10.xy) + -c67.zz;
		r10.xy = clamp(r10.xy * c67.ww, float2(0.0), float2(1.0));
		r10.xy = -r10.xy + c7.zz;
		r6.w = r10.y * r10.x;
		r8.xy = clamp(r8.xy, float2(0.0), float2(1.0));
		r10.xyz = r8.zzz + -c9.yxz;
		r11 = ((-abs(r10.x) >= 0.0) ? c85.zwxy : r8.wwww);
		r11 = ((-abs(r10.y) >= 0.0) ? c86.zwxy : r11);
		r10 = ((-abs(r10.z) >= 0.0) ? c87.zwxy : r11);
		r9.xy = (r8.xy * r10.xy) + r10.zw;
		r9.w = c6.w;
		r10 = r9 + c9.wwyy;
		r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r11 = r9 + c8.xyzz;
		r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
		r12 = r9 + c8.yxzz;
		r12 = float4(s15_texture.sample_compare(s15, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
		r13 = r9 + c8.xxzz;
		r13 = float4(s15_texture.sample_compare(s15, (r13.xyz).xy, (r13.xyz).z, level(r13.w)));
		r10.y = r11.x;
		r10.z = r12.x;
		r10.w = r13.x;
		r8.x = dot(r10, c8.wwww);
		r10 = r9 + c9.wyyy;
		r10 = float4(s15_texture.sample_compare(s15, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r11 = r9 + c8.xzzz;
		r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
		r12 = r9 + c8.zxzz;
		r12 = float4(s15_texture.sample_compare(s15, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
		r13 = r9 + c9.ywyy;
		r13 = float4(s15_texture.sample_compare(s15, (r13.xyz).xy, (r13.xyz).z, level(r13.w)));
		r10.y = r11.x;
		r10.z = r12.x;
		r10.w = r13.x;
		r8.y = dot(r10, c13.xxxx);
		r10 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
		r8.x = r8.y + r8.x;
		r8.x = (r10.x * c13.y) + r8.x;
		if (r6.w < c7.z) {
			r10.xyz = r8.zzz + c14.xyz;
			r11 = ((-abs(r10.x) >= 0.0) ? c73 : r8.wwww);
			r12 = ((-abs(r10.x) >= 0.0) ? c74 : r8.wwww);
			r11 = ((-abs(r10.y) >= 0.0) ? c77 : r11);
			r12 = ((-abs(r10.y) >= 0.0) ? c78 : r12);
			r11 = ((-abs(r10.z) >= 0.0) ? c81 : r11);
			r12 = ((-abs(r10.z) >= 0.0) ? c82 : r12);
			r11.x = clamp(dot(r7, r11), 0.0, 1.0);
			r11.y = clamp(dot(r7, r12), 0.0, 1.0);
			r7 = ((-abs(r10.x) >= 0.0) ? c86.zwxy : r8.wwww);
			r7 = ((-abs(r10.y) >= 0.0) ? c87.zwxy : r7);
			r7 = ((-abs(r10.z) >= 0.0) ? c88.zwxy : r7);
			r9.xy = (r11.xy * r7.xy) + r7.zw;
			r7 = r9 + c9.wwyy;
			r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
			r11 = r9 + c8.xyzz;
			r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
			r12 = r9 + c8.yxzz;
			r12 = float4(s15_texture.sample_compare(s15, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
			r13 = r9 + c8.xxzz;
			r13 = float4(s15_texture.sample_compare(s15, (r13.xyz).xy, (r13.xyz).z, level(r13.w)));
			r7.y = r11.x;
			r7.z = r12.x;
			r7.w = r13.x;
			r7.x = dot(r7, c8.wwww);
			r11 = r9 + c9.wyyy;
			r11 = float4(s15_texture.sample_compare(s15, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
			r12 = r9 + c8.xzzz;
			r12 = float4(s15_texture.sample_compare(s15, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
			r13 = r9 + c8.zxzz;
			r13 = float4(s15_texture.sample_compare(s15, (r13.xyz).xy, (r13.xyz).z, level(r13.w)));
			r14 = r9 + c9.ywyy;
			r14 = float4(s15_texture.sample_compare(s15, (r14.xyz).xy, (r14.xyz).z, level(r14.w)));
			r11.y = r12.x;
			r11.z = r13.x;
			r11.w = r14.x;
			r7.y = dot(r11, c13.xxxx);
			r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
			r7.x = r7.y + r7.x;
			r7.x = (r9.x * c13.y) + r7.x;
			r7.x = ((r10.z >= 0.0) ? c7.z : r7.x);
			r9.x = mix(r7.x, r8.x, r6.w);
			r8.x = r9.x;
		}
		r7.xyz = -c89.xyz + v4.xyz;
		r6.w = dot(r7.xyz, r7.xyz);
		r6.w = clamp((r6.w * c68.y) + c68.x, 0.0, 1.0);
		r7.x = mix(r8.x, c7.z, r6.w);
	} else {
		r7.x = c7.z;
	}
	r8.x = clamp(dot(r4.xz, c3.xy) + c3.z, 0.0, 1.0);
	r8.y = clamp(dot(r4.xyz, c4.xyz), 0.0, 1.0);
	r8.z = clamp(dot(r4.xyz, c5.xyz), 0.0, 1.0);
	r4.xyz = r8.xyz * r8.xyz;
	r7.yzw = r4.yyy * v6.xyz;
	r7.yzw = (r4.xxx * v5.xyz) + r7.yzw;
	r7.yzw = (r4.zzz * v7.xyz) + r7.yzw;
	r6.w = dot(r4.xyz, c7.zzz);
	if (b0) {
		r8.w = v5.w;
		r8.x = r8.w + v6.w;
		r8.x = r8.x + v7.w;
		r4.y = r4.y * v6.w;
		r4.x = (r4.x * v5.w) + r4.y;
		r4.x = (r4.z * v7.w) + r4.x;
		r4.xyz = r4.xxx * c64.xyz;
		r4.xyz = (r4.xyz * r7.xxx) + r7.yzw;
		r7.yzw = ((-r8.x >= 0.0) ? r7.yzw : r4.xyz);
	} else {
		r8.x = c7.z;
	}
	r4.x = ((r6.w == 0.0) ? FLT_MAX : 1.0 / r6.w);
	r4.xyz = r4.xxx * r7.yzw;
	r7.yzw = c23.xyz + -v4.xyz;
	r9.xyz = normalize(r7.yzw);
	r7.yzw = c22.xyz * v8.yyy;
	r6.w = clamp(dot(r5.xyz, r9.xyz), 0.0, 1.0);
	r8.y = (r6.w * r6.w) + r6.w;
	r8.y = r8.y * c7.w;
	r7.x = r7.x * r8.x;
	r4.xyz = (r7.yzw * r8.yyy) + r4.xyz;
	r2.w = r2.w + r2.w;
	r8.x = dot(r5.xyz, r5.xyz);
	r8.xyz = r6.xyz * r8.xxx;
	r8.xyz = (r2.www * r5.xyz) + -r8.xyz;
	r8 = s8_texture.sample(s8, r8.xyz);
	r8.xyz = r8.xyz * c30.zzz;
	r8.xyz = r8.xyz * c2.xyz;
	r10.xyz = (r5.www * r8.xyz) + -r8.xyz;
	r8.xyz = (c10.xxx * r10.xyz) + r8.xyz;
	r2.w = mix(r1.w, r4.w, c2.w);
	r8.w = (r2.w * -c7.x) + -c7.y;
	r2.w = (c27.w * r8.w) + r2.w;
	r8.xyz = r2.www * r8.xyz;
	r10 = s7_texture.sample(s7, v0.xy);
	r2.w = abs(c10.z);
	r8.w = -r10.x + c7.z;
	r8.w = (r10.x * c13.z) + r8.w;
	r2.w = ((-r2.w >= 0.0) ? r8.w : c10.z);
	r1.xyz = (r1.xyz * r2.xyz) + c7.yyy;
	r1.xyz = (r10.yyy * r1.xyz) + c7.zzz;
	r1.xyz = r1.xyz * c19.www;
	r8.w = c19.w;
	r2.xyz = r8.www * c26.xyz;
	r1.xyz = ((c26.x >= 0.0) ? r2.xyz : r1.xyz);
	r2.xyz = c21.xyz + -v4.xyz;
	r8.w = dot(r2.xyz, r2.xyz);
	r8.w = ((r8.w == 0.0) ? FLT_MAX : rsqrt(abs(r8.w)));
	r10.xyz = c20.xyz * v8.xxx;
	r2.xyz = (r2.xyz * r8.www) + r6.xyz;
	r6.xyz = normalize(r2.xyz);
	r2.x = clamp(dot(r5.xyz, r6.xyz), 0.0, 1.0);
	r6.x = pow(abs(r2.x), r2.w);
	r2.xyz = r10.xyz * r6.xxx;
	r0.xyz = (r0.xyz * r0.www) + r9.xyz;
	r6.xyz = normalize(r0.xyz);
	r0.x = clamp(dot(r5.xyz, r6.xyz), 0.0, 1.0);
	r5.x = pow(abs(r0.x), r2.w);
	r0.x = ((r6.w == 0.0) ? FLT_MAX : rsqrt(abs(r6.w)));
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = r0.x * r5.x;
	r0.xyz = r7.yzw * r0.xxx;
	r0.xyz = (r2.xyz * r7.xxx) + r0.xyz;
	r1.xyz = r1.xyz * r4.www;
	r0.xyz = r0.xyz * r1.xyz;
	r0.w = clamp(r1.w + c27.z, 0.0, 1.0);
	r1.xyz = r3.yyy + c1.xyz;
	r1.xyz = (r0.www * r1.xyz) + c7.zzz;
	r1.xyz = r1.xyz * r4.xyz;
	r0.xyz = (r0.xyz * r5.www) + r8.xyz;
	r0.xyz = (r3.xzw * r1.xyz) + r0.xyz;
	r0.w = c12.y + -v4.z;
	r0.w = r0.w + -c7.x;
	oC0.w = clamp(r0.w * c12.w, 0.0, 1.0);
	oC0.xyz = r0.xyz * c30.xxx;
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

