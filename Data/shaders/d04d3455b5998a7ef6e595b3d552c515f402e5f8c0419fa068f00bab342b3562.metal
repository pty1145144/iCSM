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
	texturecube<float> s1_texture [[texture(1)]],
	sampler s1 [[sampler(1)]],
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
	texture2d<float> s13_texture [[texture(13)]],
	sampler s13 [[sampler(13)]],
	depth2d<float> s15_texture [[texture(15)]],
	sampler s15 [[sampler(15)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c2 = float4(-0.5, 0.000488281, 0.0, -0.000488281); (void) c2;
	const float4 c4 = float4(0.0, -1.0, -2.0, 0.0); (void) c4;
	const float4 c11 = float4(0.062499999, 0.125, 0.25, 0.0); (void) c11;
	const float4 c17 = float4(2.0, -1.0, 1.0, 0.0); (void) c17;
	const float4 c18 = float4(0.298999992, 0.587000012, 0.114, 0.0); (void) c18;
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
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c3 uniforms.uniforms_float4[2]
	#define c5 uniforms.uniforms_float4[3]
	#define c6 uniforms.uniforms_float4[4]
	#define c7 uniforms.uniforms_float4[5]
	#define c8 uniforms.uniforms_float4[6]
	#define c9 uniforms.uniforms_float4[7]
	#define c10 uniforms.uniforms_float4[8]
	#define c12 uniforms.uniforms_float4[9]
	#define c13 uniforms.uniforms_float4[10]
	#define c14 uniforms.uniforms_float4[11]
	#define c15 uniforms.uniforms_float4[12]
	#define c16 uniforms.uniforms_float4[13]
	#define c19 uniforms.uniforms_float4[14]
	#define c20 uniforms.uniforms_float4[15]
	#define c21 uniforms.uniforms_float4[16]
	#define c29 uniforms.uniforms_float4[17]
	#define c30 uniforms.uniforms_float4[18]
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
	#define oC0 output.oC0
	r0.xyz = v3.xyz;
	r1.xyz = r0.yzx * v2.zxy;
	r0.xyz = (v2.yzx * r0.zxy) + -r1.xyz;
	r0.xyz = r0.xyz * v3.www;
	r1 = s0_texture.sample(s0, v0.xy);
	r2 = s3_texture.sample(s3, v1.xy);
	r2.xyz = (r2.xyz * c17.xxx) + c17.yyy;
	if (b0) {
		r3 = (v4.xyzx * c17.zzzw) + c17.wwwz;
		r4.x = dot(r3, c69);
		r4.y = dot(r3, c70);
		r5.xy = clamp(r4.xy, float2(0.0), float2(1.0));
		r5.xy = -r4.xy + r5.xy;
		r0.w = dot(r5.xy, c17.zz) + c17.w;
		r5.x = dot(r3, c73);
		r5.y = dot(r3, c74);
		r6.xy = clamp(r5.xy, float2(0.0), float2(1.0));
		r6.xy = -r5.xy + r6.xy;
		r1.w = dot(r6.xy, c17.zz) + c17.w;
		r6.x = dot(r3, c77);
		r6.y = dot(r3, c78);
		r5.zw = c17.zw;
		r6.z = c17.x;
		r5.xyz = ((-abs(r1.w) >= 0.0) ? r5.xyz : r6.xyz);
		r4.z = c17.w;
		r4.xyz = ((-abs(r0.w) >= 0.0) ? r4.xyz : r5.xyz);
		r5.z = dot(r3, c71);
		r6.xy = r4.xy + c2.xx;
		r6.xy = abs(r6.xy) + -c67.zz;
		r6.xy = clamp(r6.xy * c67.ww, float2(0.0), float2(1.0));
		r6.xy = -r6.xy + c17.zz;
		r0.w = r6.y * r6.x;
		r4.xy = clamp(r4.xy, float2(0.0), float2(1.0));
		r6.xyz = r4.zzz + -c17.wzx;
		r1.w = c17.w;
		r7 = ((-abs(r6.x) >= 0.0) ? c85.zwxy : r1.wwww);
		r7 = ((-abs(r6.y) >= 0.0) ? c86.zwxy : r7);
		r6 = ((-abs(r6.z) >= 0.0) ? c87.zwxy : r7);
		r5.xy = (r4.xy * r6.xy) + r6.zw;
		r6 = r5 + c2.yyzz;
		r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
		r7 = r5 + c2.wyzz;
		r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
		r8 = r5 + c2.ywzz;
		r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r9 = r5 + c2.wwzz;
		r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
		r6.y = r7.x;
		r6.z = r8.x;
		r6.w = r9.x;
		r2.w = dot(r6, c11.xxxx);
		r6 = r5 + c2.yzzz;
		r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
		r7 = r5 + c2.wzzz;
		r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
		r8 = r5 + c2.zwzz;
		r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r9 = r5 + c2.zyzz;
		r9 = float4(s15_texture.sample_compare(s15, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
		r6.y = r7.x;
		r6.z = r8.x;
		r6.w = r9.x;
		r4.x = dot(r6, c11.yyyy);
		r6 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
		r2.w = r2.w + r4.x;
		r2.w = (r6.x * c11.z) + r2.w;
		if (r0.w < c17.z) {
			r4.xyz = r4.zzz + c4.xyz;
			r6 = ((-abs(r4.x) >= 0.0) ? c73 : r1.wwww);
			r7 = ((-abs(r4.x) >= 0.0) ? c74 : r1.wwww);
			r6 = ((-abs(r4.y) >= 0.0) ? c77 : r6);
			r7 = ((-abs(r4.y) >= 0.0) ? c78 : r7);
			r6 = ((-abs(r4.z) >= 0.0) ? c81 : r6);
			r7 = ((-abs(r4.z) >= 0.0) ? c82 : r7);
			r6.x = clamp(dot(r3, r6), 0.0, 1.0);
			r6.y = clamp(dot(r3, r7), 0.0, 1.0);
			r3 = ((-abs(r4.x) >= 0.0) ? c86.zwxy : r1.wwww);
			r3 = ((-abs(r4.y) >= 0.0) ? c87.zwxy : r3);
			r3 = ((-abs(r4.z) >= 0.0) ? c88.zwxy : r3);
			r5.xy = (r6.xy * r3.xy) + r3.zw;
			r3 = r5 + c2.yyzz;
			r3 = float4(s15_texture.sample_compare(s15, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
			r6 = r5 + c2.wyzz;
			r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
			r7 = r5 + c2.ywzz;
			r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
			r8 = r5 + c2.wwzz;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r3.y = r6.x;
			r3.z = r7.x;
			r3.w = r8.x;
			r1.w = dot(r3, c11.xxxx);
			r3 = r5 + c2.yzzz;
			r3 = float4(s15_texture.sample_compare(s15, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
			r6 = r5 + c2.wzzz;
			r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
			r7 = r5 + c2.zwzz;
			r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
			r8 = r5 + c2.zyzz;
			r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
			r3.y = r6.x;
			r3.z = r7.x;
			r3.w = r8.x;
			r3.x = dot(r3, c11.yyyy);
			r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
			r1.w = r1.w + r3.x;
			r1.w = (r5.x * c11.z) + r1.w;
			r1.w = ((r4.z >= 0.0) ? c17.z : r1.w);
			r3.x = mix(r1.w, r2.w, r0.w);
			r2.w = r3.x;
		}
		r3.xyz = -c89.xyz + v4.xyz;
		r0.w = dot(r3.xyz, r3.xyz);
		r0.w = clamp((r0.w * c68.y) + c68.x, 0.0, 1.0);
		r1.w = mix(r2.w, c17.z, r0.w);
	} else {
		r1.w = c17.z;
	}
	r0.xyz = r0.xyz * r2.yyy;
	r0.xyz = (r2.xxx * v3.xyz) + r0.xyz;
	r0.xyz = (r2.zzz * v2.xyz) + r0.xyz;
	r0.w = dot(r0.xyz, r0.xyz);
	r2.x = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r2.xyz = r0.xyz * r2.xxx;
	r3.xyz = r2.xyz * r2.xyz;
	r4.x = ((r2.x >= 0.0) ? c17.w : c17.z);
	r4.y = ((r2.y >= 0.0) ? c17.w : c17.z);
	r4.z = ((r2.z >= 0.0) ? c17.w : c17.z);
	r5.x = ((r2.x >= 0.0) ? c17.z : c17.w);
	r5.y = ((r2.y >= 0.0) ? c17.z : c17.w);
	r5.z = ((r2.z >= 0.0) ? c17.z : c17.w);
	r4.xyz = r3.xyz * r4.xyz;
	r3.xyz = r3.xyz * r5.xyz;
	r5.xyz = r4.xxx * c6.xyz;
	r5.xyz = (r3.xxx * c5.xyz) + r5.xyz;
	r3.xyw = (r3.yyy * c7.xyz) + r5.xyz;
	r3.xyw = (r4.yyy * c8.xyz) + r3.xyw;
	r3.xyz = (r3.zzz * c9.xyz) + r3.xyw;
	r3.xyz = (r4.zzz * c10.xyz) + r3.xyz;
	r4.xyz = c14.xyz + -v4.xyz;
	r5.xyz = normalize(r4.xyz);
	r4.xyz = c13.xyz * v5.xxx;
	r2.w = clamp(dot(r2.xyz, r5.xyz), 0.0, 1.0);
	r2.w = (r2.w * r2.w) + r2.w;
	r2.w = r2.w * -c2.x;
	r4.xyz = r2.www * r4.xyz;
	r3.xyz = (r4.xyz * r1.www) + r3.xyz;
	r4.xyz = c16.xyz + -v4.xyz;
	r5.xyz = normalize(r4.xyz);
	r4.xyz = c15.xyz * v5.yyy;
	r1.w = clamp(dot(r2.xyz, r5.xyz), 0.0, 1.0);
	r1.w = (r1.w * r1.w) + r1.w;
	r1.w = r1.w * -c2.x;
	r2.xyz = (r4.xyz * r1.www) + r3.xyz;
	r3 = s13_texture.sample(s13, v0.xy);
	r1.w = clamp(r3.y + c12.x, 0.0, 1.0);
	r3.y = c17.y;
	r3.yzw = r3.yyy + c1.xyz;
	r3.yzw = (r1.www * r3.yzw) + c17.zzz;
	r2.xyz = r2.xyz * r3.yzw;
	r3.yz = abs(c12.wy);
	r1.w = ((-r3.y >= 0.0) ? c17.z : r3.x);
	r3.xyw = c20.xyz + -v4.xyz;
	r2.w = dot(r0.xyz, r3.xyw);
	r2.w = r2.w + r2.w;
	r3.xyw = r0.www * r3.xyw;
	r0.xyz = (r2.www * r0.xyz) + -r3.xyw;
	r0 = s1_texture.sample(s1, r0.xyz);
	r0.xyz = r0.xyz * c30.zzz;
	r0.xyz = r1.www * r0.xyz;
	r0.xyz = r0.xyz * c0.xyz;
	r3.xyw = (r0.xyz * r0.xyz) + -r0.xyz;
	r0.xyz = (c19.xxx * r3.xyw) + r0.xyz;
	r0.w = dot(r0.xyz, c18.xyz);
	r3.xyw = mix(r0.www, r0.xyz, c3.xyz);
	r0.xyz = (r1.xyz * r2.xyz) + r3.xyw;
	r0.w = c21.y + -v4.z;
	r0.w = r0.w + -c17.x;
	r0.w = clamp(r0.w * c21.w, 0.0, 1.0);
	oC0.xyz = r0.xyz * c30.xxx;
	r0.x = c29.w * v4.w;
	oC0.w = ((-r3.z >= 0.0) ? r0.w : r0.x);
	#undef c0
	#undef c1
	#undef c3
	#undef c5
	#undef c6
	#undef c7
	#undef c8
	#undef c9
	#undef c10
	#undef c12
	#undef c13
	#undef c14
	#undef c15
	#undef c16
	#undef c19
	#undef c20
	#undef c21
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

