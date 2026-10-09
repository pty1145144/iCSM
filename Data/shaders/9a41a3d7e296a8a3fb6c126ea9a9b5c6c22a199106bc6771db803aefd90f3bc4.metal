#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[39];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord1)]];
	float4 v2 [[user(texcoord2)]];
	float4 v3 [[user(texcoord3)]];
	float4 v4 [[user(texcoord4)]];
	float4 v5 [[user(texcoord5)]];
	float4 v6 [[user(texcoord6)]];
};

struct source_main_Output
{
	float4 oC0 [[color(0)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	texture2d<float> s0_texture [[texture(0)]],
	sampler s0 [[sampler(0)]],
	texture2d<float> s1_texture [[texture(1)]],
	sampler s1 [[sampler(1)]],
	depth2d<float> s8_texture [[texture(8)]],
	sampler s8 [[sampler(8)]],
	texture2d<float> s10_texture [[texture(10)]],
	sampler s10 [[sampler(10)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(0.159154935, 0.5, 6.283185478, -3.141592739); (void) c0;
	const float4 c2 = float4(1.0, 0.0, 2.0, 0.000488281); (void) c2;
	const float4 c13 = float4(-0.000488281, 0.000488281, 0.0, 0.062499999); (void) c13;
	const float4 c14 = float4(0.125, 0.25, -0.300000011, -3.333333253); (void) c14;
	const float4 c15 = float4(0.0, -1.0, -2.0, 3.0); (void) c15;
	const float4 c16 = float4(0.298999992, 0.587000012, 0.114, -0.000001); (void) c16;
	const float4 c17 = float4(0.57735002, 1.0, 2.0, -1.0); (void) c17;
	const float4 c18 = float4(1000000.0, 0.0, 0.0, 0.0); (void) c18;
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
	#define c1 uniforms.uniforms_float4[0]
	#define c3 uniforms.uniforms_float4[1]
	#define c4 uniforms.uniforms_float4[2]
	#define c5 uniforms.uniforms_float4[3]
	#define c6 uniforms.uniforms_float4[4]
	#define c7 uniforms.uniforms_float4[5]
	#define c8 uniforms.uniforms_float4[6]
	#define c9 uniforms.uniforms_float4[7]
	#define c10 uniforms.uniforms_float4[8]
	#define c11 uniforms.uniforms_float4[9]
	#define c12 uniforms.uniforms_float4[10]
	#define c20 uniforms.uniforms_float4[11]
	#define c21 uniforms.uniforms_float4[12]
	#define c22 uniforms.uniforms_float4[13]
	#define c23 uniforms.uniforms_float4[14]
	#define c24 uniforms.uniforms_float4[15]
	#define c25 uniforms.uniforms_float4[16]
	#define c30 uniforms.uniforms_float4[17]
	#define c67 uniforms.uniforms_float4[18]
	#define c68 uniforms.uniforms_float4[19]
	#define c69 uniforms.uniforms_float4[20]
	#define c70 uniforms.uniforms_float4[21]
	#define c71 uniforms.uniforms_float4[22]
	#define c73 uniforms.uniforms_float4[23]
	#define c74 uniforms.uniforms_float4[24]
	#define c77 uniforms.uniforms_float4[25]
	#define c78 uniforms.uniforms_float4[26]
	#define c81 uniforms.uniforms_float4[27]
	#define c82 uniforms.uniforms_float4[28]
	#define c85 uniforms.uniforms_float4[29]
	#define c86 uniforms.uniforms_float4[30]
	#define c87 uniforms.uniforms_float4[31]
	#define c88 uniforms.uniforms_float4[32]
	#define c89 uniforms.uniforms_float4[33]
	#define c101 uniforms.uniforms_float4[34]
	#define c102 uniforms.uniforms_float4[35]
	#define c105 uniforms.uniforms_float4[36]
	#define c106 uniforms.uniforms_float4[37]
	#define c107 uniforms.uniforms_float4[38]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	r1 = s10_texture.sample(s10, v0.xy);
	r2 = s1_texture.sample(s1, v0.xy);
	r1.w = abs(c12.w);
	r3.xy = c0.xy;
	r2.w = (c12.w * r3.x) + r3.y;
	r2.w = fract(r2.w);
	r2.w = (r2.w * c0.z) + c0.w;
	r3.xy = float2(cos(r2.w), sin(r2.w));
	r4.xyz = r0.zxy * c17.xxx;
	r4.xyz = (r0.zxy * c17.xxx) + -r4.zxy;
	r3.yzw = r3.yyy * r4.xyz;
	r3.yzw = (r0.xyz * r3.xxx) + r3.yzw;
	r2.w = dot(c17.xxx, r0.xyz);
	r2.w = r2.w * c17.x;
	r3.x = -r3.x + c17.y;
	r3.xyz = (r2.www * r3.xxx) + r3.yzw;
	r0.xyz = ((-r1.w >= 0.0) ? r0.xyz : r3.xyz);
	r2.xyz = (r2.xyz * c17.zzz) + c17.www;
	r3.x = dot(v2.xyz, r2.xyz);
	r3.y = dot(v3.xyz, r2.xyz);
	r3.z = dot(v4.xyz, r2.xyz);
	r2.xyz = normalize(r3.xyz);
	r3.xyz = c3.xyz + -v5.xyz;
	r1.w = dot(r3.xyz, r3.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r4.xyz = r1.www * r3.xyz;
	r2.w = clamp(dot(r2.xyz, r4.xyz), 0.0, 1.0);
	r2.w = -r2.w + c17.y;
	r3.w = r2.w * r2.w;
	r4.x = (r2.w * -r2.w) + c0.y;
	r4.y = r3.w + r3.w;
	r3.w = (r3.w * c17.z) + c17.w;
	r4.z = -c12.x + c12.y;
	r4.w = mix(c12.y, c12.z, r3.w);
	r3.w = (r4.y * r4.z) + c12.x;
	r3.w = ((r4.x >= 0.0) ? r3.w : r4.w);
	r4 = (v5.xyzx * c2.xxxy) + c2.yyyx;
	r5.x = dot(r4, c69);
	r5.y = dot(r4, c70);
	r6.xy = clamp(r5.xy, float2(0.0), float2(1.0));
	r6.xy = -r5.xy + r6.xy;
	r5.w = dot(r6.xy, c2.xx) + c2.y;
	r6.x = dot(r4, c73);
	r6.y = dot(r4, c74);
	r7.xy = clamp(r6.xy, float2(0.0), float2(1.0));
	r7.xy = -r6.xy + r7.xy;
	r6.w = dot(r7.xy, c2.xx) + c2.y;
	r7.x = dot(r4, c77);
	r7.y = dot(r4, c78);
	r6.z = c17.y;
	r7.z = c17.z;
	r6.xyz = ((-abs(r6.w) >= 0.0) ? r6.xyz : r7.xyz);
	r5.z = c2.y;
	r5.xyz = ((-abs(r5.w) >= 0.0) ? r5.xyz : r6.xyz);
	r6.z = dot(r4, c71);
	r7.xy = r5.xy + -c0.yy;
	r7.xy = abs(r7.xy) + -c67.zz;
	r7.xy = clamp(r7.xy * c67.ww, float2(0.0), float2(1.0));
	r7.xy = -r7.xy + c17.yy;
	r5.w = r7.y * r7.x;
	r5.xy = clamp(r5.xy, float2(0.0), float2(1.0));
	r7.xyz = r5.zzz + -c2.yxz;
	r8.y = c2.y;
	r9 = ((-abs(r7.x) >= 0.0) ? c85.zwxy : r8.yyyy);
	r9 = ((-abs(r7.y) >= 0.0) ? c86.zwxy : r9);
	r7 = ((-abs(r7.z) >= 0.0) ? c87.zwxy : r9);
	r6.xy = (r5.xy * r7.xy) + r7.zw;
	r6.w = c2.y;
	r7 = r6 + c2.wwyy;
	r7 = float4(s8_texture.sample_compare(s8, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
	r9 = r6 + c13.xyzz;
	r9 = float4(s8_texture.sample_compare(s8, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
	r10 = r6 + c13.yxzz;
	r10 = float4(s8_texture.sample_compare(s8, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
	r11 = r6 + c13.xxzz;
	r11 = float4(s8_texture.sample_compare(s8, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
	r7.y = r9.x;
	r7.z = r10.x;
	r7.w = r11.x;
	r5.x = dot(r7, c13.wwww);
	r7 = r6 + c2.wyyy;
	r7 = float4(s8_texture.sample_compare(s8, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
	r9 = r6 + c13.xzzz;
	r9 = float4(s8_texture.sample_compare(s8, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
	r10 = r6 + c13.zxzz;
	r10 = float4(s8_texture.sample_compare(s8, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
	r11 = r6 + c2.ywyy;
	r11 = float4(s8_texture.sample_compare(s8, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
	r7.y = r9.x;
	r7.z = r10.x;
	r7.w = r11.x;
	r5.y = dot(r7, c14.xxxx);
	r7 = float4(s8_texture.sample_compare(s8, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
	r5.x = r5.y + r5.x;
	r5.x = (r7.x * c14.y) + r5.x;
	if (r5.w < c17.y) {
		r7.xyz = r5.zzz + c15.xyz;
		r9 = ((-abs(r7.x) >= 0.0) ? c73 : r8.yyyy);
		r10 = ((-abs(r7.x) >= 0.0) ? c74 : r8.yyyy);
		r9 = ((-abs(r7.y) >= 0.0) ? c77 : r9);
		r10 = ((-abs(r7.y) >= 0.0) ? c78 : r10);
		r9 = ((-abs(r7.z) >= 0.0) ? c81 : r9);
		r10 = ((-abs(r7.z) >= 0.0) ? c82 : r10);
		r9.x = clamp(dot(r4, r9), 0.0, 1.0);
		r9.y = clamp(dot(r4, r10), 0.0, 1.0);
		r4 = ((-abs(r7.x) >= 0.0) ? c86.zwxy : r8.yyyy);
		r4 = ((-abs(r7.y) >= 0.0) ? c87.zwxy : r4);
		r4 = ((-abs(r7.z) >= 0.0) ? c88.zwxy : r4);
		r6.xy = (r9.xy * r4.xy) + r4.zw;
		r4 = r6 + c2.wwyy;
		r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
		r8 = r6 + c13.xyzz;
		r8 = float4(s8_texture.sample_compare(s8, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r9 = r6 + c13.yxzz;
		r9 = float4(s8_texture.sample_compare(s8, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
		r10 = r6 + c13.xxzz;
		r10 = float4(s8_texture.sample_compare(s8, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r4.y = r8.x;
		r4.z = r9.x;
		r4.w = r10.x;
		r4.x = dot(r4, c13.wwww);
		r8 = r6 + c2.wyyy;
		r8 = float4(s8_texture.sample_compare(s8, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r9 = r6 + c13.xzzz;
		r9 = float4(s8_texture.sample_compare(s8, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
		r10 = r6 + c13.zxzz;
		r10 = float4(s8_texture.sample_compare(s8, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r11 = r6 + c2.ywyy;
		r11 = float4(s8_texture.sample_compare(s8, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
		r8.y = r9.x;
		r8.z = r10.x;
		r8.w = r11.x;
		r4.y = dot(r8, c14.xxxx);
		r6 = float4(s8_texture.sample_compare(s8, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
		r4.x = r4.y + r4.x;
		r4.x = (r6.x * c14.y) + r4.x;
		r4.x = ((r7.z >= 0.0) ? c17.y : r4.x);
		r6.x = mix(r4.x, r5.x, r5.w);
		r5.x = r6.x;
	}
	r4.xyz = -c89.xyz + v5.xyz;
	r4.x = dot(r4.xyz, r4.xyz);
	r4.x = clamp((r4.x * c68.y) + c68.x, 0.0, 1.0);
	r6.x = mix(r5.x, c17.y, r4.x);
	r4.xyz = r2.xyz * r2.xyz;
	r5.x = ((r2.x >= 0.0) ? c2.y : c2.x);
	r5.y = ((r2.y >= 0.0) ? c2.y : c2.x);
	r5.z = ((r2.z >= 0.0) ? c2.y : c2.x);
	r6.y = ((r2.x >= 0.0) ? c2.x : c2.y);
	r6.z = ((r2.y >= 0.0) ? c2.x : c2.y);
	r6.w = ((r2.z >= 0.0) ? c2.x : c2.y);
	r5.xyz = r4.xyz * r5.xyz;
	r4.xyz = r4.xyz * r6.yzw;
	r6.yzw = r5.xxx * c5.xyz;
	r6.yzw = (r4.xxx * c4.xyz) + r6.yzw;
	r4.xyw = (r4.yyy * c6.xyz) + r6.yzw;
	r4.xyw = (r5.yyy * c7.xyz) + r4.xyw;
	r4.xyz = (r4.zzz * c8.xyz) + r4.xyw;
	r4.xyz = (r5.zzz * c9.xyz) + r4.xyz;
	r5.xyz = c21.xyz + -v5.xyz;
	r7.xyz = normalize(r5.xyz);
	r5.xyz = c20.xyz * v1.xxx;
	r4.w = clamp(dot(r2.xyz, r7.xyz), 0.0, 1.0);
	r5.w = (r4.w * r4.w) + r4.w;
	r5.w = r5.w * c0.y;
	r6.yzw = r5.www * r5.xyz;
	r4.xyz = (r6.yzw * r6.xxx) + r4.xyz;
	r6.yzw = c23.xyz + -v5.xyz;
	r8.xyz = normalize(r6.yzw);
	r6.yzw = c22.xyz * v1.yyy;
	r5.w = clamp(dot(r2.xyz, r8.xyz), 0.0, 1.0);
	r7.w = (r5.w * r5.w) + r5.w;
	r7.w = r7.w * c0.y;
	r4.xyz = (r6.yzw * r7.www) + r4.xyz;
	r9.xyz = c25.xyz + -v5.xyz;
	r10.xyz = normalize(r9.xyz);
	r9.xyz = c24.xyz * v1.zzz;
	r7.w = clamp(dot(r2.xyz, r10.xyz), 0.0, 1.0);
	r8.w = (r7.w * r7.w) + r7.w;
	r8.w = r8.w * c0.y;
	r4.xyz = (r9.xyz * r8.www) + r4.xyz;
	r7.xyz = (r3.xyz * r1.www) + r7.xyz;
	r11.xyz = normalize(r7.xyz);
	r7.x = clamp(dot(r2.xyz, r11.xyz), 0.0, 1.0);
	r8.w = pow(abs(r7.x), c10.z);
	r7.y = ((r4.w == 0.0) ? FLT_MAX : rsqrt(abs(r4.w)));
	r7.y = ((r7.y == 0.0) ? FLT_MAX : 1.0 / r7.y);
	r7.z = r7.y * r8.w;
	r11.xyz = r5.xyz * r7.zzz;
	r4.w = r4.w * r7.x;
	r7.x = pow(abs(r2.w), c105.x);
	r2.w = r4.w * r7.x;
	r2.w = r7.y * r2.w;
	r5.xyz = r5.xyz * r2.www;
	r8.xyz = (r3.xyz * r1.www) + r8.xyz;
	r12.xyz = normalize(r8.xyz);
	r2.w = clamp(dot(r2.xyz, r12.xyz), 0.0, 1.0);
	r4.w = pow(abs(r2.w), c10.z);
	r7.y = ((r5.w == 0.0) ? FLT_MAX : rsqrt(abs(r5.w)));
	r7.y = ((r7.y == 0.0) ? FLT_MAX : 1.0 / r7.y);
	r4.w = r4.w * r7.y;
	r8.xyz = r6.yzw * r4.www;
	r2.w = r5.w * r2.w;
	r2.w = r7.x * r2.w;
	r2.w = r7.y * r2.w;
	r6.yzw = r6.yzw * r2.www;
	r8.xyz = (r11.xyz * r6.xxx) + r8.xyz;
	r5.xyz = (r5.xyz * r6.xxx) + r6.yzw;
	r3.xyz = (r3.xyz * r1.www) + r10.xyz;
	r6.xyz = normalize(r3.xyz);
	r1.w = clamp(dot(r2.xyz, r6.xyz), 0.0, 1.0);
	r2.x = pow(abs(r1.w), c10.z);
	r2.y = ((r7.w == 0.0) ? FLT_MAX : rsqrt(abs(r7.w)));
	r2.y = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r2.x = r2.y * r2.x;
	r1.w = r7.w * r1.w;
	r1.w = r7.x * r1.w;
	r1.w = r2.y * r1.w;
	r2.xyz = (r2.xxx * r9.xyz) + r8.xyz;
	r3.xyz = (r1.www * r9.xyz) + r5.xyz;
	r1.x = r1.x * c105.y;
	r5.y = c17.y;
	r1.w = (v6.w * c11.w) + r5.y;
	r1.x = r1.w * r1.x;
	r3.xyz = r1.xxx * r3.xyz;
	r2.xyz = r0.www * r2.xyz;
	r0.w = mix(c10.x, c10.y, r1.y);
	r2.xyz = r0.www * r2.xyz;
	r2.xyz = r3.www * r2.xyz;
	r5.xyz = r0.xyz + c17.www;
	r5.xyz = (r1.yyy * r5.xyz) + c17.yyy;
	r2.xyz = r2.xyz * r5.xyz;
	r0.w = r1.y * c101.w;
	r1.x = clamp(r0.w, 0.0, 1.0);
	r5.xyz = (r0.xyz * r0.www) + -c106.xyz;
	r1.xyw = (r1.xxx * r5.xyz) + c106.xyz;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r5.xyz = (r3.xyz * r1.xyw) + r4.xyz;
	r2.w = dot(r5.xyz, c16.xyz);
	r2.w = r2.w + c14.z;
	r2.w = clamp(r2.w * c14.w, 0.0, 1.0);
	r3.w = (r2.w * c15.z) + c15.w;
	r2.w = r2.w * r2.w;
	r2.w = r2.w * r3.w;
	r3.w = dot(r0.xyz, c16.xyz);
	r5.xyz = c16.xyz;
	r4.w = dot(c102.xyz, r5.xyz);
	r5.x = r4.w + c16.w;
	r5.yzw = r3.www * c102.xyz;
	r3.w = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r3.w = ((r5.x >= 0.0) ? r3.w : c18.x);
	r5.xyz = (r5.yzw * r3.www) + -r0.xyz;
	r5.xyz = (c102.www * r5.xyz) + r0.xyz;
	r5.xyz = (r5.xyz * r0.www) + -r0.xyz;
	r0.xyz = (r2.www * r5.xyz) + r0.xyz;
	r4.xyz = r4.xyz + v6.xyz;
	r0.xyz = r1.zzz * r0.xyz;
	r0.xyz = (r0.xyz * r4.xyz) + r2.xyz;
	r0.xyz = (r3.xyz * r1.xyw) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	oC0.xyz = r0.xyz * c30.xxx;
	oC0.w = c1.w;
	#undef c1
	#undef c3
	#undef c4
	#undef c5
	#undef c6
	#undef c7
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c12
	#undef c20
	#undef c21
	#undef c22
	#undef c23
	#undef c24
	#undef c25
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
	#undef c101
	#undef c102
	#undef c105
	#undef c106
	#undef c107
	#undef v0
	#undef v1
	#undef v2
	#undef v3
	#undef v4
	#undef v5
	#undef v6
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

