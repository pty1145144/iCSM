#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[34];
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
	const float4 c0 = float4(0.159154935, 0.5, 6.283185478, -3.141592739); (void) c0;
	const float4 c2 = float4(0.57735002, 1.0, 2.0, -1.0); (void) c2;
	const float4 c13 = float4(1.0, 0.0, 1.041666626, -0.020833333); (void) c13;
	const float4 c14 = float4(0.000488281, 0.0, -0.000488281, 0.062499999); (void) c14;
	const float4 c15 = float4(0.125, 0.25, -0.300000011, -3.333333253); (void) c15;
	const float4 c16 = float4(0.298999992, 0.587000012, 0.114, -0.000001); (void) c16;
	const float4 c17 = float4(-2.0, 3.0, 1000000.0, 0.0); (void) c17;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	float4 r7;
	float4 r8;
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
	#define c19 uniforms.uniforms_float4[11]
	#define c20 uniforms.uniforms_float4[12]
	#define c21 uniforms.uniforms_float4[13]
	#define c29 uniforms.uniforms_float4[14]
	#define c30 uniforms.uniforms_float4[15]
	#define c67 uniforms.uniforms_float4[16]
	#define c68 uniforms.uniforms_float4[17]
	#define c69 uniforms.uniforms_float4[18]
	#define c70 uniforms.uniforms_float4[19]
	#define c71 uniforms.uniforms_float4[20]
	#define c73 uniforms.uniforms_float4[21]
	#define c74 uniforms.uniforms_float4[22]
	#define c77 uniforms.uniforms_float4[23]
	#define c78 uniforms.uniforms_float4[24]
	#define c85 uniforms.uniforms_float4[25]
	#define c86 uniforms.uniforms_float4[26]
	#define c87 uniforms.uniforms_float4[27]
	#define c89 uniforms.uniforms_float4[28]
	#define c101 uniforms.uniforms_float4[29]
	#define c102 uniforms.uniforms_float4[30]
	#define c105 uniforms.uniforms_float4[31]
	#define c106 uniforms.uniforms_float4[32]
	#define c107 uniforms.uniforms_float4[33]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	oC0.w = r0.w * c1.w;
	r1.xyz = r0.zxy * c2.xxx;
	r1.xyz = (r0.zxy * c2.xxx) + -r1.zxy;
	r2.xy = c0.xy;
	r0.w = (c12.w * r2.x) + r2.y;
	r0.w = fract(r0.w);
	r0.w = (r0.w * c0.z) + c0.w;
	r2.xy = float2(cos(r0.w), sin(r0.w));
	r1.xyz = r1.xyz * r2.yyy;
	r1.xyz = (r0.xyz * r2.xxx) + r1.xyz;
	r0.w = -r2.x + c2.y;
	r1.w = dot(c2.xxx, r0.xyz);
	r1.w = r1.w * c2.x;
	r1.xyz = (r1.www * r0.www) + r1.xyz;
	r0.w = abs(c12.w);
	r0.xyz = ((-r0.w >= 0.0) ? r0.xyz : r1.xyz);
	r0.w = dot(r0.xyz, c16.xyz);
	r1.xyz = r0.www * c102.xyz;
	r2.xyz = c16.xyz;
	r0.w = dot(c102.xyz, r2.xyz);
	r1.w = r0.w + c16.w;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r1.w >= 0.0) ? r0.w : c17.z);
	r1.xyz = (r1.xyz * r0.www) + -r0.xyz;
	r1.xyz = (c102.www * r1.xyz) + r0.xyz;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r1.xyz = (r1.xyz * r0.www) + -r0.xyz;
	r2 = (v5.xyzx * c13.xxxy) + c13.yyyx;
	r3.x = dot(r2, c73);
	r3.y = dot(r2, c74);
	r3.zw = (r3.xy * c13.zz) + c13.ww;
	r4.xy = clamp(r3.zw, float2(0.0), float2(1.0));
	r3.zw = -r3.zw + r4.xy;
	r0.w = dot(r3.zw, c13.xx) + c13.y;
	r1.w = dot(r2, c77);
	r4.x = ((-abs(r0.w) >= 0.0) ? r3.x : r1.w);
	r1.w = dot(r2, c78);
	r4.y = ((-abs(r0.w) >= 0.0) ? r3.y : r1.w);
	r3.x = dot(r2, c69);
	r3.y = dot(r2, c70);
	r2.z = dot(r2, c71);
	r3.zw = (r3.xy * c13.zz) + c13.ww;
	r4.zw = clamp(r3.zw, float2(0.0), float2(1.0));
	r3.zw = -r3.zw + r4.zw;
	r1.w = dot(r3.zw, c13.xx) + c13.y;
	r3.xy = ((-abs(r1.w) >= 0.0) ? r3.xy : r4.xy);
	r3.zw = clamp(r3.xy, float2(0.0), float2(1.0));
	r3.xy = r3.xy + -c0.yy;
	r3.xy = abs(r3.xy) + -c67.zz;
	r3.xy = clamp(r3.xy * c67.ww, float2(0.0), float2(1.0));
	r3.xy = -r3.xy + c2.yy;
	r4.xy = c86.xy;
	r4.xy = ((-abs(r0.w) >= 0.0) ? r4.xy : c87.xy);
	r0.w = ((-abs(r0.w) >= 0.0) ? c13.x : c13.y);
	r0.w = ((-abs(r1.w) >= 0.0) ? c2.y : r0.w);
	r4.xy = ((-abs(r1.w) >= 0.0) ? c85.xy : r4.xy);
	r2.xy = (r3.zw * c0.yy) + r4.xy;
	r0.w = clamp((r3.x * r3.y) + r0.w, 0.0, 1.0);
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
	r1.w = r1.w + c2.w;
	r0.w = (r0.w * r1.w) + c2.y;
	r2.xyz = -c89.xyz + v5.xyz;
	r1.w = dot(r2.xyz, r2.xyz);
	r1.w = clamp((r1.w * c68.y) + c68.x, 0.0, 1.0);
	r2.x = mix(r0.w, c2.y, r1.w);
	r3 = s1_texture.sample(s1, v0.xy);
	r2.yzw = (r3.xyz * c2.zzz) + c2.www;
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
	r0.w = clamp(dot(r4.xyz, r5.xyz), 0.0, 1.0);
	r1.w = (r0.w * r0.w) + r0.w;
	r1.w = r1.w * c0.y;
	r3.xyz = c20.xyz * v1.xxx;
	r6.xyz = r1.www * r3.xyz;
	r2.yzw = (r6.xyz * r2.xxx) + r2.yzw;
	r6.xyz = c3.xyz + -v5.xyz;
	r1.w = dot(r6.xyz, r6.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r5.xyz = (r6.xyz * r1.www) + r5.xyz;
	r6.xyz = r1.www * r6.xyz;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = clamp((r1.w * c19.w) + c19.x, 0.0, 1.0);
	r4.w = min(r1.w, c19.z);
	r1.w = r4.w * r4.w;
	r4.w = clamp(dot(r4.xyz, r6.xyz), 0.0, 1.0);
	r4.w = -r4.w + c2.y;
	r6.xyz = normalize(r5.xyz);
	r4.x = clamp(dot(r4.xyz, r6.xyz), 0.0, 1.0);
	r4.z = r0.w * r4.x;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r5.x = pow(abs(r4.w), c105.x);
	r4.z = r4.z * r5.x;
	r4.z = r0.w * r4.z;
	r5.xyz = r3.xyz * r4.zzz;
	r5.xyz = r2.xxx * r5.xyz;
	r6.y = c2.y;
	r4.z = (v6.w * c11.w) + r6.y;
	r6 = s10_texture.sample(s10, v0.xy);
	r5.w = r6.x * c105.y;
	r4.z = r4.z * r5.w;
	r5.xyz = r4.zzz * r5.xyz;
	r4.z = r6.y * c101.w;
	r7.xyz = (r0.xyz * r4.zzz) + -c106.xyz;
	r4.z = clamp(r4.z, 0.0, 1.0);
	r7.xyz = (r4.zzz * r7.xyz) + c106.xyz;
	r8.xyz = (r5.xyz * r7.xyz) + r2.yzw;
	r2.yzw = r2.yzw + v6.xyz;
	r4.z = dot(r8.xyz, c16.xyz);
	r4.z = r4.z + c15.z;
	r4.z = clamp(r4.z * c15.w, 0.0, 1.0);
	r5.w = (r4.z * c17.x) + c17.y;
	r4.z = r4.z * r4.z;
	r4.z = r4.z * r5.w;
	r1.xyz = (r4.zzz * r1.xyz) + r0.xyz;
	r0.xyz = r0.xyz + c2.www;
	r0.xyz = (r6.yyy * r0.xyz) + c2.yyy;
	r1.xyz = r6.zzz * r1.xyz;
	r4.y = r6.w;
	r4.z = mix(c10.x, c10.y, r6.y);
	r6 = s7_texture.sample(s7, r4.xy);
	r6.xyz = r0.www * r6.xyz;
	r3.xyz = r3.xyz * r6.xyz;
	r3.xyz = r2.xxx * r3.xyz;
	r3.xyz = r3.www * r3.xyz;
	r3.xyz = r4.zzz * r3.xyz;
	r0.w = (r4.w * -r4.w) + c0.y;
	r2.x = r4.w * r4.w;
	r3.w = r2.x + r2.x;
	r2.x = (r2.x * c2.z) + c2.w;
	r4.x = mix(c12.y, c12.z, r2.x);
	r2.x = -c12.x + c12.y;
	r2.x = (r3.w * r2.x) + c12.x;
	r0.w = ((r0.w >= 0.0) ? r2.x : r4.x);
	r3.xyz = r0.www * r3.xyz;
	r0.xyz = r0.xyz * r3.xyz;
	r0.xyz = (r1.xyz * r2.yzw) + r0.xyz;
	r0.xyz = (r5.xyz * r7.xyz) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	oC0.xyz = (r1.www * r0.xyz) + r1.xyz;
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
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

