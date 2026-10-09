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
	const float4 c13 = float4(1.0, 0.0, 1.041666626, -0.020833333); (void) c13;
	const float4 c14 = float4(0.000488281, 0.0, -0.000488281, 0.062499999); (void) c14;
	const float4 c15 = float4(0.125, 0.25, -0.000001, 1000000.0); (void) c15;
	const float4 c16 = float4(0.57735002, 1.0, 2.0, -1.0); (void) c16;
	const float4 c17 = float4(0.298999992, 0.587000012, 0.114, -0.300000011); (void) c17;
	const float4 c18 = float4(-3.333333253, -2.0, 3.0, 0.0); (void) c18;
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
	#define c2 uniforms.uniforms_float4[1]
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
	#define c20 uniforms.uniforms_float4[12]
	#define c21 uniforms.uniforms_float4[13]
	#define c30 uniforms.uniforms_float4[14]
	#define c33 uniforms.uniforms_float4[15]
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
	#define c103 uniforms.uniforms_float4[31]
	#define c104 uniforms.uniforms_float4[32]
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
	#define oC0 output.oC0
	r0.xy = c0.xy;
	r0.x = (c12.w * r0.x) + r0.y;
	r0.x = fract(r0.x);
	r0.x = (r0.x * c0.z) + c0.w;
	r1.xy = float2(cos(r0.x), sin(r0.x));
	r0 = s0_texture.sample(s0, v0.xy);
	r2.xyz = r0.zxy * c16.xxx;
	r2.xyz = (r0.zxy * c16.xxx) + -r2.zxy;
	r1.yzw = r1.yyy * r2.xyz;
	r1.yzw = (r0.xyz * r1.xxx) + r1.yzw;
	r1.x = -r1.x + c16.y;
	r2.x = dot(c16.xxx, r0.xyz);
	r2.x = r2.x * c16.x;
	r1.xyz = (r2.xxx * r1.xxx) + r1.yzw;
	r1.w = abs(c12.w);
	r0.xyz = ((-r1.w >= 0.0) ? r0.xyz : r1.xyz);
	r1.xyz = r0.www * c104.xyz;
	r2.xyz = r0.xyz * r0.xyz;
	r2.xyz = r2.xyz * r2.xyz;
	r0.w = dot(r2.xyz, c17.xyz);
	r1.w = r0.w + c15.z;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r1.w >= 0.0) ? r0.w : c15.w);
	r1.w = dot(r0.xyz, c17.xyz);
	r2.xyz = r1.www * r2.xyz;
	r3.xyz = mix(r0.xyz, r1.www, -c101.yyy);
	r2.xyz = (r2.xyz * r0.www) + -r0.xyz;
	r2.xyz = (c101.yyy * r2.xyz) + r0.xyz;
	r2.xyz = ((c101.y >= 0.0) ? r2.xyz : r3.xyz);
	r0.w = abs(c101.y);
	r2.xyz = ((-r0.w >= 0.0) ? r0.xyz : r2.xyz);
	r3 = (v5.xyzx * c13.xxxy) + c13.yyyx;
	r4.x = dot(r3, c73);
	r4.y = dot(r3, c74);
	r4.zw = (r4.xy * c13.zz) + c13.ww;
	r5.xy = clamp(r4.zw, float2(0.0), float2(1.0));
	r4.zw = -r4.zw + r5.xy;
	r0.w = dot(r4.zw, c13.xx) + c13.y;
	r1.w = dot(r3, c77);
	r5.x = ((-abs(r0.w) >= 0.0) ? r4.x : r1.w);
	r1.w = dot(r3, c78);
	r5.y = ((-abs(r0.w) >= 0.0) ? r4.y : r1.w);
	r4.x = dot(r3, c69);
	r4.y = dot(r3, c70);
	r3.z = dot(r3, c71);
	r4.zw = (r4.xy * c13.zz) + c13.ww;
	r5.zw = clamp(r4.zw, float2(0.0), float2(1.0));
	r4.zw = -r4.zw + r5.zw;
	r1.w = dot(r4.zw, c13.xx) + c13.y;
	r4.xy = ((-abs(r1.w) >= 0.0) ? r4.xy : r5.xy);
	r4.zw = clamp(r4.xy, float2(0.0), float2(1.0));
	r4.xy = r4.xy + -c0.yy;
	r4.xy = abs(r4.xy) + -c67.zz;
	r4.xy = clamp(r4.xy * c67.ww, float2(0.0), float2(1.0));
	r4.xy = -r4.xy + c16.yy;
	r5.xy = c86.xy;
	r5.xy = ((-abs(r0.w) >= 0.0) ? r5.xy : c87.xy);
	r0.w = ((-abs(r0.w) >= 0.0) ? c13.x : c13.y);
	r0.w = ((-abs(r1.w) >= 0.0) ? c16.y : r0.w);
	r5.xy = ((-abs(r1.w) >= 0.0) ? c85.xy : r5.xy);
	r3.xy = (r4.zw * c0.yy) + r5.xy;
	r0.w = clamp((r4.x * r4.y) + r0.w, 0.0, 1.0);
	r3.w = c13.y;
	r4 = r3 + c14.xxyy;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
	r5 = r3 + c14.zxyy;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
	r4.y = r5.x;
	r5 = r3 + c14.xzyy;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
	r4.z = r5.x;
	r5 = r3 + c14.zzyy;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
	r4.w = r5.x;
	r1.w = dot(r4, c14.wwww);
	r4 = r3 + c14.xyyy;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
	r5 = r3 + c14.zyyy;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
	r4.y = r5.x;
	r5 = r3 + c14.yzyy;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
	r4.z = r5.x;
	r5 = r3 + c14.yxyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
	r4.w = r5.x;
	r2.w = dot(r4, c15.xxxx);
	r1.w = r1.w + r2.w;
	r1.w = (r3.x * c15.y) + r1.w;
	r1.w = r1.w + c16.w;
	r0.w = (r0.w * r1.w) + c16.y;
	r3.xyz = -c89.xyz + v5.xyz;
	r1.w = dot(r3.xyz, r3.xyz);
	r1.w = clamp((r1.w * c68.y) + c68.x, 0.0, 1.0);
	r2.w = mix(r0.w, c16.y, r1.w);
	r3 = s1_texture.sample(s1, v0.xy);
	r3.xyz = (r3.xyz * c16.zzz) + c16.www;
	r4.x = dot(v2.xyz, r3.xyz);
	r4.y = dot(v3.xyz, r3.xyz);
	r4.z = dot(v4.xyz, r3.xyz);
	r3.xyz = normalize(r4.xyz);
	r4.x = ((r3.x >= 0.0) ? c13.y : c13.x);
	r4.y = ((r3.y >= 0.0) ? c13.y : c13.x);
	r4.z = ((r3.z >= 0.0) ? c13.y : c13.x);
	r5.xyz = r3.xyz * r3.xyz;
	r4.xyz = r4.xyz * r5.xyz;
	r6.xyz = r4.xxx * c5.xyz;
	r7.x = ((r3.x >= 0.0) ? c13.x : c13.y);
	r7.y = ((r3.y >= 0.0) ? c13.x : c13.y);
	r7.z = ((r3.z >= 0.0) ? c13.x : c13.y);
	r5.xyz = r5.xyz * r7.xyz;
	r6.xyz = (r5.xxx * c4.xyz) + r6.xyz;
	r5.xyw = (r5.yyy * c6.xyz) + r6.xyz;
	r4.xyw = (r4.yyy * c7.xyz) + r5.xyw;
	r4.xyw = (r5.zzz * c8.xyz) + r4.xyw;
	r4.xyz = (r4.zzz * c9.xyz) + r4.xyw;
	r5.xyz = c21.xyz + -v5.xyz;
	r6.xyz = normalize(r5.xyz);
	r0.w = clamp(dot(r3.xyz, r6.xyz), 0.0, 1.0);
	r1.w = (r0.w * r0.w) + r0.w;
	r1.w = r1.w * c0.y;
	r5.xyz = c20.xyz * v1.xxx;
	r7.xyz = r1.www * r5.xyz;
	r4.xyz = (r7.xyz * r2.www) + r4.xyz;
	r1.w = dot(r4.xyz, c17.xyz);
	r7.xy = r1.ww + -c2.xw;
	r7.zw = -c2.xw + c2.yz;
	r1.w = ((r7.w == 0.0) ? FLT_MAX : 1.0 / r7.w);
	r4.w = ((r7.z == 0.0) ? FLT_MAX : 1.0 / r7.z);
	r4.w = clamp(r4.w * r7.x, 0.0, 1.0);
	r1.w = clamp(r1.w * r7.y, 0.0, 1.0);
	r5.w = (r1.w * c18.y) + c18.z;
	r1.w = r1.w * r1.w;
	r7.xyz = c3.xyz + -v5.xyz;
	r6.w = dot(r7.xyz, r7.xyz);
	r6.w = ((r6.w == 0.0) ? FLT_MAX : rsqrt(abs(r6.w)));
	r6.xyz = (r7.xyz * r6.www) + r6.xyz;
	r7.xyz = r6.www * r7.xyz;
	r8.xyz = normalize(r6.xyz);
	r6.x = clamp(dot(r3.xyz, r8.xyz), 0.0, 1.0);
	r6.w = r0.w * r6.x;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r7.w = dot(r7.xyz, r3.xyz);
	r6.y = clamp(r7.w, 0.0, 1.0);
	r7.w = r7.w + r7.w;
	r8.x = -r6.y + c16.y;
	r9.x = pow(abs(r8.x), c105.x);
	r6.w = r6.w * r9.x;
	r8.x = r0.w * r6.w;
	r8.yz = (r6.ww * r0.ww) + -c33.xw;
	r9.xyz = r5.xyz * r8.xxx;
	r9.xyz = r2.www * r9.xyz;
	r10.y = c16.y;
	r6.w = (v6.w * c11.w) + r10.y;
	r10 = s10_texture.sample(s10, v0.xy);
	r8.x = r10.x * c105.y;
	r6.w = r6.w * r8.x;
	r9.xyz = r6.www * r9.xyz;
	r6.w = r10.y * c101.w;
	r11.xyz = (r0.xyz * r6.www) + -c106.xyz;
	r6.w = clamp(r6.w, 0.0, 1.0);
	r11.xyz = (r6.www * r11.xyz) + c106.xyz;
	r12.xyz = r9.xyz * r11.xyz;
	r6.w = dot(r12.xyz, c17.xyz);
	r8.xw = -c33.xw + c33.yz;
	r8.x = ((r8.x == 0.0) ? FLT_MAX : 1.0 / r8.x);
	r8.w = ((r8.w == 0.0) ? FLT_MAX : 1.0 / r8.w);
	r8.xz = clamp(r8.xw * r8.yz, float2(0.0), float2(1.0));
	r8.y = (r8.x * c18.y) + c18.z;
	r8.x = r8.x * r8.x;
	r8.x = r8.x * r8.y;
	r8.y = (r8.z * c18.y) + c18.z;
	r8.z = r8.z * r8.z;
	r8.y = r8.z * r8.y;
	r8.x = r8.y * r8.x;
	r6.w = r6.w * r8.x;
	r6.w = r6.w * c106.w;
	r1.w = (r5.w * r1.w) + r6.w;
	r5.w = (r4.w * c18.y) + c18.z;
	r4.w = r4.w * r4.w;
	r4.w = r4.w * r5.w;
	r1.w = r1.w * r4.w;
	r8.xyz = mix(r0.xyz, r2.xyz, r1.www);
	r0.xyz = r0.xyz + c16.www;
	r0.xyz = (r10.yyy * r0.xyz) + c16.yyy;
	r1.w = dot(r8.xyz, c17.xyz);
	r2.xyz = r1.www * c102.xyz;
	r12.xyz = c17.xyz;
	r1.w = dot(c102.xyz, r12.xyz);
	r4.w = r1.w + c15.z;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = ((r4.w >= 0.0) ? r1.w : c15.w);
	r2.xyz = (r2.xyz * r1.www) + -r8.xyz;
	r2.xyz = (c102.www * r2.xyz) + r8.xyz;
	r1.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r2.xyz = (r2.xyz * r1.www) + -r8.xyz;
	r12.xyz = (r9.xyz * r11.xyz) + r4.xyz;
	r4.xyz = r4.xyz + v6.xyz;
	r1.w = dot(r12.xyz, c17.xyz);
	r1.w = r1.w + c17.w;
	r1.w = clamp(r1.w * c18.x, 0.0, 1.0);
	r4.w = (r1.w * c18.y) + c18.z;
	r1.w = r1.w * r1.w;
	r1.w = r1.w * r4.w;
	r2.xyz = (r1.www * r2.xyz) + r8.xyz;
	r2.xyz = r10.zzz * r2.xyz;
	r6.z = r10.w;
	r1.w = mix(c10.x, c10.y, r10.y);
	r8 = s7_texture.sample(s7, r6.xz);
	r6 = s4_texture.sample(s4, r6.yz);
	r6.xzw = r0.www * r8.xyz;
	r5.xyz = r5.xyz * r6.xzw;
	r5.xyz = r2.www * r5.xyz;
	r5.xyz = r3.www * r5.xyz;
	r0.w = dot(r3.xyz, r3.xyz);
	r6.xzw = r7.xyz * r0.www;
	r3.xyz = (r7.www * r3.xyz) + -r6.xzw;
	r3 = s6_texture.sample(s6, r3.xyz);
	r6.xzw = r3.xyz * c30.zzz;
	r7.xyz = r6.xzw * r6.xzw;
	r7.xyz = r7.xyz * r7.xyz;
	r0.w = dot(r7.xyz, c17.xyz);
	r2.w = r0.w + c15.z;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r2.w >= 0.0) ? r0.w : c15.w);
	r2.w = dot(r6.xzw, c17.xyz);
	r7.xyz = r2.www * r7.xyz;
	r3.xyz = (c30.zzz * -r3.xyz) + r2.www;
	r3.xyz = (-c103.www * r3.xyz) + r6.xzw;
	r7.xyz = (r7.xyz * r0.www) + -r6.xzw;
	r7.xyz = (c103.www * r7.xyz) + r6.xzw;
	r3.xyz = ((c103.w >= 0.0) ? r7.xyz : r3.xyz);
	r0.w = abs(c103.w);
	r3.xyz = ((-r0.w >= 0.0) ? r6.xzw : r3.xyz);
	r6.xzw = r4.xyz + -c103.xxx;
	r6.xzw = clamp(r6.xzw * c103.yyy, float3(0.0), float3(1.0));
	r6.xzw = (r3.xyz * r6.xzw) + -r3.xyz;
	r3.xyz = (c101.xxx * r6.xzw) + r3.xyz;
	r6.xzw = (r3.xyz * r3.xyz) + -r3.xyz;
	r3.xyz = (c103.zzz * r6.xzw) + r3.xyz;
	r1.xyz = r1.xyz * r3.xyz;
	r1.xyz = (r5.xyz * r1.www) + r1.xyz;
	r1.xyz = r6.yyy * r1.xyz;
	r0.xyz = r0.xyz * r1.xyz;
	r0.xyz = (r2.xyz * r4.xyz) + r0.xyz;
	r0.xyz = (r9.xyz * r11.xyz) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	oC0.xyz = r0.xyz * c30.xxx;
	oC0.w = c1.w;
	#undef c1
	#undef c2
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
	#undef c30
	#undef c33
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

