#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[36];
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
	float4 v7 [[user(texcoord7)]];
	float4 v8 [[user(texcoord8)]];
	float4 v9 [[user(texcoord9)]];
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
	texture2d<float> s4_texture [[texture(4)]],
	sampler s4 [[sampler(4)]],
	texture2d<float> s7_texture [[texture(7)]],
	sampler s7 [[sampler(7)]],
	depth2d<float> s8_texture [[texture(8)]],
	sampler s8 [[sampler(8)]],
	texture2d<float> s10_texture [[texture(10)]],
	sampler s10 [[sampler(10)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c2 = float4(0.159154935, 0.5, 6.283185478, -3.141592739); (void) c2;
	const float4 c13 = float4(1.0, 0.0, 1.041666626, -0.020833333); (void) c13;
	const float4 c14 = float4(0.000488281, 0.0, -0.000488281, 0.062499999); (void) c14;
	const float4 c15 = float4(0.125, 0.25, -0.300000011, -3.333333253); (void) c15;
	const float4 c16 = float4(0.57735002, 1.0, 2.0, -1.0); (void) c16;
	const float4 c17 = float4(0.298999992, 0.587000012, 0.114, -0.000001); (void) c17;
	const float4 c18 = float4(-2.0, 3.0, 1000000.0, 0.0); (void) c18;
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
	#define c3 uniforms.uniforms_float4[2]
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
	#define c85 uniforms.uniforms_float4[27]
	#define c86 uniforms.uniforms_float4[28]
	#define c87 uniforms.uniforms_float4[29]
	#define c89 uniforms.uniforms_float4[30]
	#define c101 uniforms.uniforms_float4[31]
	#define c102 uniforms.uniforms_float4[32]
	#define c105 uniforms.uniforms_float4[33]
	#define c106 uniforms.uniforms_float4[34]
	#define c107 uniforms.uniforms_float4[35]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define v7 input.v7
	#define v8 input.v8
	#define v9 input.v9
	#define oC0 output.oC0
	r0.x = c19.y + -v5.z;
	r0.x = r0.x + -c16.z;
	oC0.w = clamp(r0.x * c19.w, 0.0, 1.0);
	r0.xyz = c17.xyz;
	r0.x = dot(c102.xyz, r0.xyz);
	r0.y = r0.x + c17.w;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = ((r0.y >= 0.0) ? r0.x : c18.z);
	r1.xy = c2.xy;
	r0.y = (c12.w * r1.x) + r1.y;
	r0.y = fract(r0.y);
	r0.y = (r0.y * c2.z) + c2.w;
	r1.xy = float2(cos(r0.y), sin(r0.y));
	r2 = s0_texture.sample(s0, v0.xy);
	r0.yzw = r2.zxy * c16.xxx;
	r0.yzw = (r2.zxy * c16.xxx) + -r0.wyz;
	r0.yzw = r1.yyy * r0.yzw;
	r0.yzw = (r2.xyz * r1.xxx) + r0.yzw;
	r1.x = -r1.x + c16.y;
	r1.y = dot(c16.xxx, r2.xyz);
	r1.y = r1.y * c16.x;
	r0.yzw = (r1.yyy * r1.xxx) + r0.yzw;
	r1.x = abs(c12.w);
	r0.yzw = ((-r1.x >= 0.0) ? r2.xyz : r0.yzw);
	r1.x = dot(r0.yzw, c17.xyz);
	r1.xyz = r1.xxx * c102.xyz;
	r1.xyz = (r1.xyz * r0.xxx) + -r0.yzw;
	r1.xyz = (c102.www * r1.xyz) + r0.yzw;
	r0.x = clamp(c107.w + v6.w, 0.0, 1.0);
	r1.xyz = (r1.xyz * r0.xxx) + -r0.yzw;
	r2 = (v5.xyzx * c13.xxxy) + c13.yyyx;
	r3.x = dot(r2, c73);
	r3.y = dot(r2, c74);
	r3.zw = (r3.xy * c13.zz) + c13.ww;
	r4.xy = clamp(r3.zw, float2(0.0), float2(1.0));
	r3.zw = -r3.zw + r4.xy;
	r0.x = dot(r3.zw, c13.xx) + c13.y;
	r1.w = dot(r2, c77);
	r4.x = ((-abs(r0.x) >= 0.0) ? r3.x : r1.w);
	r1.w = dot(r2, c78);
	r4.y = ((-abs(r0.x) >= 0.0) ? r3.y : r1.w);
	r3.x = dot(r2, c69);
	r3.y = dot(r2, c70);
	r2.z = dot(r2, c71);
	r3.zw = (r3.xy * c13.zz) + c13.ww;
	r4.zw = clamp(r3.zw, float2(0.0), float2(1.0));
	r3.zw = -r3.zw + r4.zw;
	r1.w = dot(r3.zw, c13.xx) + c13.y;
	r3.xy = ((-abs(r1.w) >= 0.0) ? r3.xy : r4.xy);
	r3.zw = clamp(r3.xy, float2(0.0), float2(1.0));
	r3.xy = r3.xy + -c2.yy;
	r3.xy = abs(r3.xy) + -c67.zz;
	r3.xy = clamp(r3.xy * c67.ww, float2(0.0), float2(1.0));
	r3.xy = -r3.xy + c16.yy;
	r4.xy = c86.xy;
	r4.xy = ((-abs(r0.x) >= 0.0) ? r4.xy : c87.xy);
	r0.x = ((-abs(r0.x) >= 0.0) ? c13.x : c13.y);
	r0.x = ((-abs(r1.w) >= 0.0) ? c16.y : r0.x);
	r4.xy = ((-abs(r1.w) >= 0.0) ? c85.xy : r4.xy);
	r2.xy = (r3.zw * c2.yy) + r4.xy;
	r0.x = clamp((r3.x * r3.y) + r0.x, 0.0, 1.0);
	r2.w = c13.y;
	r3 = r2 + c14.xxyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r4 = r2 + c14.zxyy;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
	r3.y = r4.x;
	r4 = r2 + c14.xzyy;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
	r3.z = r4.x;
	r4 = r2 + c14.zzyy;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
	r3.w = r4.x;
	r1.w = dot(r3, c14.wwww);
	r3 = r2 + c14.xyyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r4 = r2 + c14.zyyy;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
	r3.y = r4.x;
	r4 = r2 + c14.yzyy;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
	r3.z = r4.x;
	r4 = r2 + c14.yxyy;
	r2 = float4(s8_texture.sample_compare(s8, (r2.xyz).xy, (r2.xyz).z, level(r2.w)));
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
	r3.w = r4.x;
	r2.y = dot(r3, c15.xxxx);
	r1.w = r1.w + r2.y;
	r1.w = (r2.x * c15.y) + r1.w;
	r1.w = r1.w + c16.w;
	r0.x = (r0.x * r1.w) + c16.y;
	r2.xyz = -c89.xyz + v5.xyz;
	r1.w = dot(r2.xyz, r2.xyz);
	r1.w = clamp((r1.w * c68.y) + c68.x, 0.0, 1.0);
	r2.x = mix(r0.x, c16.y, r1.w);
	r3 = s1_texture.sample(s1, v0.xy);
	r2.yzw = (r3.xyz * c16.zzz) + c16.www;
	r3.x = dot(v2.xyz, r2.yzw);
	r3.y = dot(v3.xyz, r2.yzw);
	r3.z = dot(v4.xyz, r2.yzw);
	r4.xyz = normalize(r3.xyz);
	r2.y = ((r4.x >= 0.0) ? c13.y : c13.x);
	r2.z = ((r4.y >= 0.0) ? c13.y : c13.x);
	r2.w = ((r4.z >= 0.0) ? c13.y : c13.x);
	r3.xyz = r4.xyz * r4.xyz;
	r2.yzw = r2.yzw * r3.xyz;
	r5.xyz = r2.yyy * c5.xyz;
	r6.x = ((r4.x >= 0.0) ? c13.x : c13.y);
	r6.y = ((r4.y >= 0.0) ? c13.x : c13.y);
	r6.z = ((r4.z >= 0.0) ? c13.x : c13.y);
	r3.xyz = r3.xyz * r6.xyz;
	r5.xyz = (r3.xxx * c4.xyz) + r5.xyz;
	r5.xyz = (r3.yyy * c6.xyz) + r5.xyz;
	r5.xyz = (r2.zzz * c7.xyz) + r5.xyz;
	r3.xyz = (r3.zzz * c8.xyz) + r5.xyz;
	r2.yzw = (r2.www * c9.xyz) + r3.xyz;
	r3.xyz = c21.xyz + -v5.xyz;
	r5.xyz = normalize(r3.xyz);
	r0.x = clamp(dot(r4.xyz, r5.xyz), 0.0, 1.0);
	r1.w = (r0.x * r0.x) + r0.x;
	r1.w = r1.w * c2.y;
	r3.xyz = c20.xyz * v1.xxx;
	r6.xyz = r1.www * r3.xyz;
	r2.yzw = (r6.xyz * r2.xxx) + r2.yzw;
	r6.xyz = c23.xyz + -v5.xyz;
	r7.xyz = normalize(r6.xyz);
	r1.w = clamp(dot(r4.xyz, r7.xyz), 0.0, 1.0);
	r4.w = (r1.w * r1.w) + r1.w;
	r4.w = r4.w * c2.y;
	r6.xyz = c22.xyz * v1.yyy;
	r2.yzw = (r6.xyz * r4.www) + r2.yzw;
	r8.xyz = c3.xyz + -v5.xyz;
	r4.w = dot(r8.xyz, r8.xyz);
	r4.w = ((r4.w == 0.0) ? FLT_MAX : rsqrt(abs(r4.w)));
	r7.xyz = (r8.xyz * r4.www) + r7.xyz;
	r9.xyz = normalize(r7.xyz);
	r7.x = clamp(dot(r4.xyz, r9.xyz), 0.0, 1.0);
	r5.w = r1.w * r7.x;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r9.xyz = r4.www * r8.xyz;
	r8.xyz = (r8.xyz * r4.www) + r5.xyz;
	r4.w = clamp(r5.z, 0.0, 1.0);
	r4.w = (r4.w * r4.w) + r4.w;
	r4.w = r4.w * c2.y;
	r5.xyz = r3.xyz * r4.www;
	r10.xyz = normalize(r8.xyz);
	r7.y = clamp(dot(r4.xyz, r10.xyz), 0.0, 1.0);
	r4.w = dot(r9.xyz, r4.xyz);
	r7.z = clamp(r4.w, 0.0, 1.0);
	r4.w = r4.w + r4.w;
	r6.w = -r7.z + c16.y;
	r8.x = pow(abs(r6.w), c105.x);
	r5.w = r5.w * r8.x;
	r5.w = r1.w * r5.w;
	r8.yzw = r6.xyz * r5.www;
	r5.w = r0.x * r7.y;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r5.w = r8.x * r5.w;
	r5.w = r0.x * r5.w;
	r10.xyz = r3.xyz * r5.www;
	r8.xyz = (r10.xyz * r2.xxx) + r8.yzw;
	r10.y = c16.y;
	r5.w = (v6.w * c11.w) + r10.y;
	r10 = s10_texture.sample(s10, v0.xy);
	r6.w = r10.x * c105.y;
	r5.w = r5.w * r6.w;
	r8.xyz = r5.www * r8.xyz;
	r5.w = r10.y * c101.w;
	r11.xyz = (r0.yzw * r5.www) + -c106.xyz;
	r5.w = clamp(r5.w, 0.0, 1.0);
	r11.xyz = (r5.www * r11.xyz) + c106.xyz;
	r12.xyz = (r8.xyz * r11.xyz) + r2.yzw;
	r2.yzw = r2.yzw + v6.xyz;
	r5.w = dot(r12.xyz, c17.xyz);
	r5.w = r5.w + c15.z;
	r5.w = clamp(r5.w * c15.w, 0.0, 1.0);
	r6.w = (r5.w * c18.x) + c18.y;
	r5.w = r5.w * r5.w;
	r5.w = r5.w * r6.w;
	r1.xyz = (r5.www * r1.xyz) + r0.yzw;
	r0.yzw = r0.yzw + c16.www;
	r0.yzw = (r10.yyy * r0.yzw) + c16.yyy;
	r1.xyz = r10.zzz * r1.xyz;
	r5.w = dot(r4.xyz, r4.xyz);
	r9.xyz = r9.xyz * r5.www;
	r9.xyz = (r4.www * r4.xyz) + -r9.xyz;
	r4.x = clamp(dot(r4.xyz, v9.xyz), 0.0, 1.0);
	r4.y = ((r9.x >= 0.0) ? c13.y : c13.x);
	r4.z = ((r9.y >= 0.0) ? c13.y : c13.x);
	r4.w = ((r9.z >= 0.0) ? c13.y : c13.x);
	r12.xyz = r9.xyz * r9.xyz;
	r9.x = ((r9.x >= 0.0) ? c13.x : c13.y);
	r9.y = ((r9.y >= 0.0) ? c13.x : c13.y);
	r9.z = ((r9.z >= 0.0) ? c13.x : c13.y);
	r9.xyz = r12.xyz * r9.xyz;
	r4.yzw = r4.yzw * r12.xyz;
	r12.xyz = r4.yyy * c5.xyz;
	r12.xyz = (r9.xxx * c4.xyz) + r12.xyz;
	r9.xyw = (r9.yyy * c6.xyz) + r12.xyz;
	r9.xyw = (r4.zzz * c7.xyz) + r9.xyw;
	r9.xyz = (r9.zzz * c8.xyz) + r9.xyw;
	r4.yzw = (r4.www * c9.xyz) + r9.xyz;
	r4.yzw = r5.xyz * r4.yzw;
	r5.x = v7.w;
	r5.y = v8.w;
	r5.z = v9.w;
	r5.xyz = -r5.xyz + c21.xyz;
	r9.xyz = normalize(r5.xyz);
	r5.x = clamp(dot(-v9.xyz, r9.xyz), 0.0, 1.0);
	r5.x = (r5.x * r5.x) + r5.x;
	r5.x = r5.x * c2.y;
	r5.xyz = r3.xyz * r5.xxx;
	r9.xyz = c0.xyz * v6.xyz;
	r5.xyz = (r9.xyz * r5.xyz) + -r4.yzw;
	r4.xyz = (r4.xxx * r5.xyz) + r4.yzw;
	r7.w = r10.w;
	r5 = s4_texture.sample(s4, r7.zw);
	r4.w = r10.x * r5.z;
	r5.x = mix(c10.x, c10.y, r10.y);
	r4.w = r4.w * c0.w;
	r4.xyz = r4.www * r4.xyz;
	r9 = s7_texture.sample(s7, r7.yw);
	r7 = s7_texture.sample(s7, r7.xw);
	r7.xyz = r1.www * r7.xyz;
	r6.xyz = r6.xyz * r7.xyz;
	r7.xyz = r0.xxx * r9.xyz;
	r3.xyz = r3.xyz * r7.xyz;
	r3.xyz = (r3.xyz * r2.xxx) + r6.xyz;
	r3.xyz = r3.www * r3.xyz;
	r3.xyz = r5.xxx * r3.xyz;
	r3.xyz = (r3.xyz * r5.yyy) + r4.xyz;
	r0.xyz = r0.yzw * r3.xyz;
	r0.xyz = (r1.xyz * r2.yzw) + r0.xyz;
	r0.xyz = (r8.xyz * r11.xyz) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	oC0.xyz = r0.xyz * c30.xxx;
	#undef c0
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
	#undef c19
	#undef c20
	#undef c21
	#undef c22
	#undef c23
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
	#undef c85
	#undef c86
	#undef c87
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
	#undef v7
	#undef v8
	#undef v9
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

