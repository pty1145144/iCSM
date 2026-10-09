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
	const float4 c2 = float4(1.591549367e-01, 5.000000000e-01, 6.283185482e+00, -3.141592741e+00); (void) c2;
	const float4 c13 = float4(5.773500204e-01, 1.000000000e+00, 2.000000000e+00, -1.000000000e+00); (void) c13;
	const float4 c14 = float4(1.000000000e+00, 0.000000000e+00, 1.041666627e+00, -2.083333395e-02); (void) c14;
	const float4 c15 = float4(4.882812500e-04, 0.000000000e+00, -4.882812500e-04, 6.250000000e-02); (void) c15;
	const float4 c16 = float4(1.250000000e-01, 2.500000000e-01, -3.000000119e-01, -3.333333254e+00); (void) c16;
	const float4 c17 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -9.999999975e-07); (void) c17;
	const float4 c18 = float4(-2.000000000e+00, 3.000000000e+00, 1.000000000e+06, 0.000000000e+00); (void) c18;
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
	#define c29 uniforms.uniforms_float4[15]
	#define c30 uniforms.uniforms_float4[16]
	#define c67 uniforms.uniforms_float4[17]
	#define c68 uniforms.uniforms_float4[18]
	#define c69 uniforms.uniforms_float4[19]
	#define c70 uniforms.uniforms_float4[20]
	#define c71 uniforms.uniforms_float4[21]
	#define c73 uniforms.uniforms_float4[22]
	#define c74 uniforms.uniforms_float4[23]
	#define c77 uniforms.uniforms_float4[24]
	#define c78 uniforms.uniforms_float4[25]
	#define c85 uniforms.uniforms_float4[26]
	#define c86 uniforms.uniforms_float4[27]
	#define c87 uniforms.uniforms_float4[28]
	#define c89 uniforms.uniforms_float4[29]
	#define c101 uniforms.uniforms_float4[30]
	#define c102 uniforms.uniforms_float4[31]
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
	#define v7 input.v7
	#define v8 input.v8
	#define v9 input.v9
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	oC0.w = r0.w * c1.w;
	r1 = (v5.xyzx * c14.xxxy) + c14.yyyx;
	r2.x = dot(r1, c73);
	r2.y = dot(r1, c74);
	r2.zw = (r2.xy * c14.zz) + c14.ww;
	r3.xy = clamp(r2.zw, float2(0.0), float2(1.0));
	r2.zw = -r2.zw + r3.xy;
	r0.w = dot(r2.zw, c14.xx) + c14.y;
	r2.z = dot(r1, c77);
	r3.x = ((-abs(r0.w) >= 0.0) ? r2.x : r2.z);
	r2.x = dot(r1, c78);
	r3.y = ((-abs(r0.w) >= 0.0) ? r2.y : r2.x);
	r2.x = dot(r1, c69);
	r2.y = dot(r1, c70);
	r1.z = dot(r1, c71);
	r2.zw = (r2.xy * c14.zz) + c14.ww;
	r3.zw = clamp(r2.zw, float2(0.0), float2(1.0));
	r2.zw = -r2.zw + r3.zw;
	r2.z = dot(r2.zw, c14.xx) + c14.y;
	r2.xy = ((-abs(r2.z) >= 0.0) ? r2.xy : r3.xy);
	r3.xy = clamp(r2.xy, float2(0.0), float2(1.0));
	r2.xy = r2.xy + -c2.yy;
	r2.xy = abs(r2.xy) + -c67.zz;
	r2.xy = clamp(r2.xy * c67.ww, float2(0.0), float2(1.0));
	r2.xy = -r2.xy + c13.yy;
	r4.xy = c86.xy;
	r3.zw = ((-abs(r0.w) >= 0.0) ? r4.xy : c87.xy);
	r0.w = ((-abs(r0.w) >= 0.0) ? c14.x : c14.y);
	r0.w = ((-abs(r2.z) >= 0.0) ? c13.y : r0.w);
	r2.zw = ((-abs(r2.z) >= 0.0) ? c85.xy : r3.zw);
	r1.xy = (r3.xy * c2.yy) + r2.zw;
	r0.w = clamp((r2.x * r2.y) + r0.w, 0.0, 1.0);
	r1.w = c14.y;
	r2 = r1 + c15.xxyy;
	r2 = float4(s8_texture.sample_compare(s8, (r2.xyz).xy, (r2.xyz).z, level(r2.w)));
	r3 = r1 + c15.zxyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r2.y = r3.x;
	r3 = r1 + c15.xzyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r2.z = r3.x;
	r3 = r1 + c15.zzyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r2.w = r3.x;
	r2.x = dot(r2, c15.wwww);
	r3 = r1 + c15.xyyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r4 = r1 + c15.zyyy;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
	r3.y = r4.x;
	r4 = r1 + c15.yzyy;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
	r3.z = r4.x;
	r4 = r1 + c15.yxyy;
	r1 = float4(s8_texture.sample_compare(s8, (r1.xyz).xy, (r1.xyz).z, level(r1.w)));
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
	r3.w = r4.x;
	r1.y = dot(r3, c16.xxxx);
	r1.y = r1.y + r2.x;
	r1.x = (r1.x * c16.y) + r1.y;
	r1.x = r1.x + c13.w;
	r0.w = (r0.w * r1.x) + c13.y;
	r1.xyz = -c89.xyz + v5.xyz;
	r1.x = dot(r1.xyz, r1.xyz);
	r1.x = clamp((r1.x * c68.y) + c68.x, 0.0, 1.0);
	r2.x = mix(r0.w, c13.y, r1.x);
	r1.xyz = c21.xyz + -v5.xyz;
	r3.xyz = normalize(r1.xyz);
	r1 = s1_texture.sample(s1, v0.xy);
	r1.xyz = (r1.xyz * c13.zzz) + c13.www;
	r4.x = dot(v2.xyz, r1.xyz);
	r4.y = dot(v3.xyz, r1.xyz);
	r4.z = dot(v4.xyz, r1.xyz);
	r1.xyz = normalize(r4.xyz);
	r0.w = clamp(dot(r1.xyz, r3.xyz), 0.0, 1.0);
	r2.y = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r2.y = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r4.xyz = c3.xyz + -v5.xyz;
	r2.z = dot(r4.xyz, r4.xyz);
	r2.z = ((r2.z == 0.0) ? FLT_MAX : rsqrt(abs(r2.z)));
	r3.xyw = (r4.xyz * r2.zzz) + r3.xyz;
	r2.w = clamp(r3.z, 0.0, 1.0);
	r2.w = (r2.w * r2.w) + r2.w;
	r2.w = r2.w * c2.y;
	r4.xyz = r2.zzz * r4.xyz;
	r2.z = ((r2.z == 0.0) ? FLT_MAX : 1.0 / r2.z);
	r2.z = clamp((r2.z * c19.w) + c19.x, 0.0, 1.0);
	r3.z = min(r2.z, c19.z);
	r2.z = r3.z * r3.z;
	r5.xyz = normalize(r3.xyw);
	r3.x = clamp(dot(r1.xyz, r5.xyz), 0.0, 1.0);
	r5 = s10_texture.sample(s10, v0.xy);
	r3.z = r5.w;
	r6 = s7_texture.sample(s7, r3.xz);
	r3.x = r0.w * r3.x;
	r0.w = (r0.w * r0.w) + r0.w;
	r0.w = r0.w * c2.y;
	r6.xyz = r2.yyy * r6.xyz;
	r7.xyz = c20.xyz * v1.xxx;
	r6.xyz = r6.xyz * r7.xyz;
	r6.xyz = r2.xxx * r6.xyz;
	r6.xyz = r1.www * r6.xyz;
	r1.w = mix(c10.x, c10.y, r5.y);
	r6.xyz = r1.www * r6.xyz;
	r1.w = dot(r1.xyz, r1.xyz);
	r8.xyz = r4.xyz * r1.www;
	r3.y = dot(r4.xyz, r1.xyz);
	r1.w = r3.y + r3.y;
	r3.y = clamp(r3.y, 0.0, 1.0);
	r4.xyz = (r1.www * r1.xyz) + -r8.xyz;
	r8.x = ((r4.x >= 0.0) ? c14.y : c14.x);
	r8.y = ((r4.y >= 0.0) ? c14.y : c14.x);
	r8.z = ((r4.z >= 0.0) ? c14.y : c14.x);
	r9.xyz = r4.xyz * r4.xyz;
	r4.x = ((r4.x >= 0.0) ? c14.x : c14.y);
	r4.y = ((r4.y >= 0.0) ? c14.x : c14.y);
	r4.z = ((r4.z >= 0.0) ? c14.x : c14.y);
	r4.xyz = r9.xyz * r4.xyz;
	r8.xyz = r8.xyz * r9.xyz;
	r9.xyz = r8.xxx * c5.xyz;
	r9.xyz = (r4.xxx * c4.xyz) + r9.xyz;
	r4.xyw = (r4.yyy * c6.xyz) + r9.xyz;
	r4.xyw = (r8.yyy * c7.xyz) + r4.xyw;
	r4.xyz = (r4.zzz * c8.xyz) + r4.xyw;
	r4.xyz = (r8.zzz * c9.xyz) + r4.xyz;
	r8.xyz = r2.www * r7.xyz;
	r4.xyz = r4.xyz * r8.xyz;
	r8.x = v7.w;
	r8.y = v8.w;
	r8.z = v9.w;
	r8.xyz = -r8.xyz + c21.xyz;
	r9.xyz = normalize(r8.xyz);
	r1.w = clamp(dot(-v9.xyz, r9.xyz), 0.0, 1.0);
	r1.w = (r1.w * r1.w) + r1.w;
	r1.w = r1.w * c2.y;
	r8.xyz = r1.www * r7.xyz;
	r9.xyz = c0.xyz * v6.xyz;
	r8.xyz = (r9.xyz * r8.xyz) + -r4.xyz;
	r1.w = clamp(dot(r1.xyz, v9.xyz), 0.0, 1.0);
	r4.xyz = (r1.www * r8.xyz) + r4.xyz;
	r8 = s4_texture.sample(s4, r3.yz);
	r1.w = -r3.y + c13.y;
	r2.w = pow(abs(r1.w), c105.x);
	r1.w = r2.w * r3.x;
	r1.w = r2.y * r1.w;
	r3.xyz = r7.xyz * r1.www;
	r7.xyz = r0.www * r7.xyz;
	r3.xyz = r2.xxx * r3.xyz;
	r0.w = r5.x * r8.z;
	r0.w = r0.w * c0.w;
	r4.xyz = r0.www * r4.xyz;
	r4.xyz = (r6.xyz * r8.yyy) + r4.xyz;
	r6.xyz = r0.zxy * c13.xxx;
	r6.xyz = (r0.zxy * c13.xxx) + -r6.zxy;
	r8.xy = c2.xy;
	r0.w = (c12.w * r8.x) + r8.y;
	r0.w = fract(r0.w);
	r0.w = (r0.w * c2.z) + c2.w;
	r8.xy = float2(cos(r0.w), sin(r0.w));
	r6.xyz = r6.xyz * r8.yyy;
	r6.xyz = (r0.xyz * r8.xxx) + r6.xyz;
	r0.w = -r8.x + c13.y;
	r1.w = dot(c13.xxx, r0.xyz);
	r1.w = r1.w * c13.x;
	r6.xyz = (r1.www * r0.www) + r6.xyz;
	r0.w = abs(c12.w);
	r0.xyz = ((-r0.w >= 0.0) ? r0.xyz : r6.xyz);
	r6.xyz = r0.xyz + c13.www;
	r6.xyz = (r5.yyy * r6.xyz) + c13.yyy;
	r4.xyz = r4.xyz * r6.xyz;
	r6.xyz = c17.xyz;
	r0.w = dot(c102.xyz, r6.xyz);
	r1.w = r0.w + c17.w;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r1.w >= 0.0) ? r0.w : c18.z);
	r1.w = dot(r0.xyz, c17.xyz);
	r6.xyz = r1.www * c102.xyz;
	r6.xyz = (r6.xyz * r0.www) + -r0.xyz;
	r6.xyz = (c102.www * r6.xyz) + r0.xyz;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r6.xyz = (r6.xyz * r0.www) + -r0.xyz;
	r8.x = ((r1.x >= 0.0) ? c14.y : c14.x);
	r8.y = ((r1.y >= 0.0) ? c14.y : c14.x);
	r8.z = ((r1.z >= 0.0) ? c14.y : c14.x);
	r9.xyz = r1.xyz * r1.xyz;
	r1.x = ((r1.x >= 0.0) ? c14.x : c14.y);
	r1.y = ((r1.y >= 0.0) ? c14.x : c14.y);
	r1.z = ((r1.z >= 0.0) ? c14.x : c14.y);
	r1.xyz = r9.xyz * r1.xyz;
	r8.xyz = r8.xyz * r9.xyz;
	r9.xyz = r8.xxx * c5.xyz;
	r9.xyz = (r1.xxx * c4.xyz) + r9.xyz;
	r1.xyw = (r1.yyy * c6.xyz) + r9.xyz;
	r1.xyw = (r8.yyy * c7.xyz) + r1.xyw;
	r1.xyz = (r1.zzz * c8.xyz) + r1.xyw;
	r1.xyz = (r8.zzz * c9.xyz) + r1.xyz;
	r1.xyz = (r7.xyz * r2.xxx) + r1.xyz;
	r2.y = c13.y;
	r0.w = (v6.w * c11.w) + r2.y;
	r1.w = r5.x * c105.y;
	r0.w = r0.w * r1.w;
	r2.xyw = r0.www * r3.xyz;
	r0.w = r5.y * c101.w;
	r3.xyz = (r0.xyz * r0.www) + -c106.xyz;
	r0.w = clamp(r0.w, 0.0, 1.0);
	r3.xyz = (r0.www * r3.xyz) + c106.xyz;
	r5.xyw = (r2.xyw * r3.xyz) + r1.xyz;
	r1.xyz = r1.xyz + v6.xyz;
	r0.w = dot(r5.xyw, c17.xyz);
	r0.w = r0.w + c16.z;
	r0.w = clamp(r0.w * c16.w, 0.0, 1.0);
	r1.w = (r0.w * c18.x) + c18.y;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.w;
	r0.xyz = (r0.www * r6.xyz) + r0.xyz;
	r0.xyz = r5.zzz * r0.xyz;
	r0.xyz = (r0.xyz * r1.xyz) + r4.xyz;
	r0.xyz = (r2.xyw * r3.xyz) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	oC0.xyz = (r2.zzz * r0.xyz) + r1.xyz;
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

