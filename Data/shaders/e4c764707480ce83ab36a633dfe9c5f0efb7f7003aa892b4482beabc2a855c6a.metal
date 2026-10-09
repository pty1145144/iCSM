#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[35];
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
	texture2d<float> s4_texture [[texture(4)]],
	sampler s4 [[sampler(4)]],
	texturecube<float> s6_texture [[texture(6)]],
	sampler s6 [[sampler(6)]],
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
	const float4 c15 = float4(0.125, 0.25, -0.000001, 1000000.0); (void) c15;
	const float4 c16 = float4(0.298999992, 0.587000012, 0.114, -0.300000011); (void) c16;
	const float4 c17 = float4(-3.333333253, -2.0, 3.0, 0.0); (void) c17;
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
	#define c30 uniforms.uniforms_float4[14]
	#define c67 uniforms.uniforms_float4[15]
	#define c68 uniforms.uniforms_float4[16]
	#define c69 uniforms.uniforms_float4[17]
	#define c70 uniforms.uniforms_float4[18]
	#define c71 uniforms.uniforms_float4[19]
	#define c73 uniforms.uniforms_float4[20]
	#define c74 uniforms.uniforms_float4[21]
	#define c77 uniforms.uniforms_float4[22]
	#define c78 uniforms.uniforms_float4[23]
	#define c85 uniforms.uniforms_float4[24]
	#define c86 uniforms.uniforms_float4[25]
	#define c87 uniforms.uniforms_float4[26]
	#define c89 uniforms.uniforms_float4[27]
	#define c101 uniforms.uniforms_float4[28]
	#define c102 uniforms.uniforms_float4[29]
	#define c103 uniforms.uniforms_float4[30]
	#define c104 uniforms.uniforms_float4[31]
	#define c105 uniforms.uniforms_float4[32]
	#define c106 uniforms.uniforms_float4[33]
	#define c107 uniforms.uniforms_float4[34]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define oC0 output.oC0
	r0.x = c19.y + -v5.z;
	r0.x = r0.x + -c2.z;
	oC0.w = clamp(r0.x * c19.w, 0.0, 1.0);
	r0 = (v5.xyzx * c13.xxxy) + c13.yyyx;
	r1.x = dot(r0, c73);
	r1.y = dot(r0, c74);
	r1.zw = (r1.xy * c13.zz) + c13.ww;
	r2.xy = clamp(r1.zw, float2(0.0), float2(1.0));
	r1.zw = -r1.zw + r2.xy;
	r1.z = dot(r1.zw, c13.xx) + c13.y;
	r1.w = dot(r0, c77);
	r2.x = ((-abs(r1.z) >= 0.0) ? r1.x : r1.w);
	r1.x = dot(r0, c78);
	r2.y = ((-abs(r1.z) >= 0.0) ? r1.y : r1.x);
	r1.x = dot(r0, c69);
	r1.y = dot(r0, c70);
	r0.z = dot(r0, c71);
	r2.zw = (r1.xy * c13.zz) + c13.ww;
	r3.xy = clamp(r2.zw, float2(0.0), float2(1.0));
	r2.zw = -r2.zw + r3.xy;
	r1.w = dot(r2.zw, c13.xx) + c13.y;
	r1.xy = ((-abs(r1.w) >= 0.0) ? r1.xy : r2.xy);
	r2.xy = clamp(r1.xy, float2(0.0), float2(1.0));
	r1.xy = r1.xy + -c0.yy;
	r1.xy = abs(r1.xy) + -c67.zz;
	r1.xy = clamp(r1.xy * c67.ww, float2(0.0), float2(1.0));
	r1.xy = -r1.xy + c2.yy;
	r3.xy = c86.xy;
	r2.zw = ((-abs(r1.z) >= 0.0) ? r3.xy : c87.xy);
	r1.z = ((-abs(r1.z) >= 0.0) ? c13.x : c13.y);
	r1.z = ((-abs(r1.w) >= 0.0) ? c2.y : r1.z);
	r2.zw = ((-abs(r1.w) >= 0.0) ? c85.xy : r2.zw);
	r0.xy = (r2.xy * c0.yy) + r2.zw;
	r1.x = clamp((r1.x * r1.y) + r1.z, 0.0, 1.0);
	r0.w = c13.y;
	r2 = r0 + c14.xxyy;
	r2 = float4(s8_texture.sample_compare(s8, (r2.xyz).xy, (r2.xyz).z, level(r2.w)));
	r3 = r0 + c14.zxyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r2.y = r3.x;
	r3 = r0 + c14.xzyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r2.z = r3.x;
	r3 = r0 + c14.zzyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r2.w = r3.x;
	r1.y = dot(r2, c14.wwww);
	r2 = r0 + c14.xyyy;
	r2 = float4(s8_texture.sample_compare(s8, (r2.xyz).xy, (r2.xyz).z, level(r2.w)));
	r3 = r0 + c14.zyyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r2.y = r3.x;
	r3 = r0 + c14.yzyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r2.z = r3.x;
	r3 = r0 + c14.yxyy;
	r0 = float4(s8_texture.sample_compare(s8, (r0.xyz).xy, (r0.xyz).z, level(r0.w)));
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r2.w = r3.x;
	r0.y = dot(r2, c15.xxxx);
	r0.y = r0.y + r1.y;
	r0.x = (r0.x * c15.y) + r0.y;
	r0.x = r0.x + c2.w;
	r0.x = (r1.x * r0.x) + c2.y;
	r0.yzw = -c89.xyz + v5.xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.y = clamp((r0.y * c68.y) + c68.x, 0.0, 1.0);
	r1.x = mix(r0.x, c2.y, r0.y);
	r0 = s1_texture.sample(s1, v0.xy);
	r0.xyz = (r0.xyz * c2.zzz) + c2.www;
	r2.x = dot(v2.xyz, r0.xyz);
	r2.y = dot(v3.xyz, r0.xyz);
	r2.z = dot(v4.xyz, r0.xyz);
	r0.xyz = normalize(r2.xyz);
	r1.y = ((r0.x >= 0.0) ? c13.y : c13.x);
	r1.z = ((r0.y >= 0.0) ? c13.y : c13.x);
	r1.w = ((r0.z >= 0.0) ? c13.y : c13.x);
	r2.xyz = r0.xyz * r0.xyz;
	r1.yzw = r1.yzw * r2.xyz;
	r3.xyz = r1.yyy * c5.xyz;
	r4.x = ((r0.x >= 0.0) ? c13.x : c13.y);
	r4.y = ((r0.y >= 0.0) ? c13.x : c13.y);
	r4.z = ((r0.z >= 0.0) ? c13.x : c13.y);
	r2.xyz = r2.xyz * r4.xyz;
	r3.xyz = (r2.xxx * c4.xyz) + r3.xyz;
	r2.xyw = (r2.yyy * c6.xyz) + r3.xyz;
	r2.xyw = (r1.zzz * c7.xyz) + r2.xyw;
	r2.xyz = (r2.zzz * c8.xyz) + r2.xyw;
	r1.yzw = (r1.www * c9.xyz) + r2.xyz;
	r2.xyz = c21.xyz + -v5.xyz;
	r3.xyz = normalize(r2.xyz);
	r2.x = clamp(dot(r0.xyz, r3.xyz), 0.0, 1.0);
	r2.y = (r2.x * r2.x) + r2.x;
	r2.y = r2.y * c0.y;
	r4.xyz = c20.xyz * v1.xxx;
	r2.yzw = r2.yyy * r4.xyz;
	r1.yzw = (r2.yzw * r1.xxx) + r1.yzw;
	r2.yzw = r1.yzw + v6.xyz;
	r5.xyz = r2.yzw + -c103.xxx;
	r5.xyz = clamp(r5.xyz * c103.yyy, float3(0.0), float3(1.0));
	r3.w = dot(r0.xyz, r0.xyz);
	r6.xyz = c3.xyz + -v5.xyz;
	r4.w = dot(r6.xyz, r6.xyz);
	r4.w = ((r4.w == 0.0) ? FLT_MAX : rsqrt(abs(r4.w)));
	r7.xyz = r4.www * r6.xyz;
	r8.xyz = r3.www * r7.xyz;
	r7.y = dot(r7.xyz, r0.xyz);
	r3.w = r7.y + r7.y;
	r7.y = clamp(r7.y, 0.0, 1.0);
	r8.xyz = (r3.www * r0.xyz) + -r8.xyz;
	r8 = s6_texture.sample(s6, r8.xyz);
	r9.xyz = r8.xyz * c30.zzz;
	r10.xyz = r9.xyz * r9.xyz;
	r10.xyz = r10.xyz * r10.xyz;
	r3.w = dot(r10.xyz, c16.xyz);
	r5.w = r3.w + c15.z;
	r3.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r3.w = ((r5.w >= 0.0) ? r3.w : c15.w);
	r5.w = dot(r9.xyz, c16.xyz);
	r10.xyz = r5.www * r10.xyz;
	r8.xyz = (c30.zzz * -r8.xyz) + r5.www;
	r8.xyz = (-c103.www * r8.xyz) + r9.xyz;
	r10.xyz = (r10.xyz * r3.www) + -r9.xyz;
	r10.xyz = (c103.www * r10.xyz) + r9.xyz;
	r8.xyz = ((c103.w >= 0.0) ? r10.xyz : r8.xyz);
	r3.w = abs(c103.w);
	r8.xyz = ((-r3.w >= 0.0) ? r9.xyz : r8.xyz);
	r5.xyz = (r8.xyz * r5.xyz) + -r8.xyz;
	r5.xyz = (c101.xxx * r5.xyz) + r8.xyz;
	r8.xyz = (r5.xyz * r5.xyz) + -r5.xyz;
	r5.xyz = (c103.zzz * r8.xyz) + r5.xyz;
	r8.xyz = r0.www * c104.xyz;
	r5.xyz = r5.xyz * r8.xyz;
	r3.xyz = (r6.xyz * r4.www) + r3.xyz;
	r8.xyz = normalize(r3.xyz);
	r7.x = clamp(dot(r0.xyz, r8.xyz), 0.0, 1.0);
	r3 = s10_texture.sample(s10, v0.xy);
	r7.z = r3.w;
	r8 = s7_texture.sample(s7, r7.xz);
	r3.w = r2.x * r7.x;
	r2.x = ((r2.x == 0.0) ? FLT_MAX : rsqrt(abs(r2.x)));
	r2.x = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r9 = s4_texture.sample(s4, r7.yz);
	r5.w = -r7.y + c2.y;
	r6.w = pow(abs(r5.w), c105.x);
	r7.xyz = r2.xxx * r8.xyz;
	r7.xyz = r4.xyz * r7.xyz;
	r7.xyz = r1.xxx * r7.xyz;
	r7.xyz = r0.www * r7.xyz;
	r0.w = mix(c10.x, c10.y, r3.y);
	r5.xyz = (r7.xyz * r0.www) + r5.xyz;
	r5.xyz = r9.yyy * r5.xyz;
	r7.xy = c0.xy;
	r0.w = (c12.w * r7.x) + r7.y;
	r0.w = fract(r0.w);
	r0.w = (r0.w * c0.z) + c0.w;
	r7.xy = float2(cos(r0.w), sin(r0.w));
	r8 = s0_texture.sample(s0, v0.xy);
	r9.xyz = r8.zxy * c2.xxx;
	r9.xyz = (r8.zxy * c2.xxx) + -r9.zxy;
	r7.yzw = r7.yyy * r9.xyz;
	r7.yzw = (r8.xyz * r7.xxx) + r7.yzw;
	r0.w = -r7.x + c2.y;
	r5.w = dot(c2.xxx, r8.xyz);
	r5.w = r5.w * c2.x;
	r7.xyz = (r5.www * r0.www) + r7.yzw;
	r0.w = abs(c12.w);
	r7.xyz = ((-r0.w >= 0.0) ? r8.xyz : r7.xyz);
	r8.xyz = r7.xyz + c2.www;
	r8.xyz = (r3.yyy * r8.xyz) + c2.yyy;
	r5.xyz = r5.xyz * r8.xyz;
	r8.xyz = c16.xyz;
	r0.w = dot(c102.xyz, r8.xyz);
	r5.w = r0.w + c15.z;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r5.w >= 0.0) ? r0.w : c15.w);
	r5.w = dot(r7.xyz, c16.xyz);
	r8.xyz = r5.www * c102.xyz;
	r8.xyz = (r8.xyz * r0.www) + -r7.xyz;
	r8.xyz = (c102.www * r8.xyz) + r7.xyz;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r8.xyz = (r8.xyz * r0.www) + -r7.xyz;
	r0.w = r3.w * r6.w;
	r0.w = r2.x * r0.w;
	r4.xyz = r4.xyz * r0.www;
	r4.xyz = r1.xxx * r4.xyz;
	r9.y = c2.y;
	r0.w = (v6.w * c11.w) + r9.y;
	r1.x = r3.x * c105.y;
	r0.w = r0.w * r1.x;
	r4.xyz = r0.www * r4.xyz;
	r0.w = r3.y * c101.w;
	r9.xyz = (r7.xyz * r0.www) + -c106.xyz;
	r0.w = clamp(r0.w, 0.0, 1.0);
	r9.xyz = (r0.www * r9.xyz) + c106.xyz;
	r1.xyz = (r4.xyz * r9.xyz) + r1.yzw;
	r0.w = dot(r1.xyz, c16.xyz);
	r0.w = r0.w + c16.w;
	r0.w = clamp(r0.w * c17.x, 0.0, 1.0);
	r1.x = (r0.w * c17.y) + c17.z;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.x;
	r1.xyz = (r0.www * r8.xyz) + r7.xyz;
	r1.xyz = r3.zzz * r1.xyz;
	r1.xyz = (r1.xyz * r2.yzw) + r5.xyz;
	r1.xyz = (r4.xyz * r9.xyz) + r1.xyz;
	r2.x = v2.w;
	r2.y = v3.w;
	r2.z = v4.w;
	r3.yzw = (r6.xyz * r4.www) + r2.xyz;
	r0.w = clamp(dot(r0.xyz, r2.xyz), 0.0, 1.0);
	r2.xyz = normalize(r3.yzw);
	r0.x = clamp(dot(r0.xyz, r2.xyz), 0.0, 1.0);
	r0.x = r0.w * r0.x;
	r0.y = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r0.x = r6.w * r0.x;
	r0.x = r0.y * r0.x;
	r0.yzw = v6.www * v6.xyz;
	r0.yzw = r0.yzw * c107.xyz;
	r0.xyz = r0.yzw * r0.xxx;
	r0.xyz = (r0.xyz * r3.xxx) + r1.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	oC0.xyz = r0.xyz * c30.xxx;
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
	#undef c103
	#undef c104
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

