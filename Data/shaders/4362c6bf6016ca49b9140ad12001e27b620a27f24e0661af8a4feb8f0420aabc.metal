#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[21];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord2)]];
	float4 v2 [[user(texcoord3)]];
	float4 v3 [[user(texcoord4)]];
	float4 v4 [[user(texcoord5)]];
	float4 v5 [[user(texcoord6)]];
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
	texture2d<float> s8_texture [[texture(8)]],
	sampler s8 [[sampler(8)]],
	texture2d<float> s10_texture [[texture(10)]],
	sampler s10 [[sampler(10)]],
	depth2d<float> s11_texture [[texture(11)]],
	sampler s11 [[sampler(11)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(1.591549367e-01, 5.000000000e-01, 6.283185482e+00, -3.141592741e+00); (void) c0;
	const float4 c2 = float4(5.773500204e-01, 1.000000000e+00, 2.000000000e+00, -1.000000000e+00); (void) c2;
	const float4 c11 = float4(3.021148033e-03, 2.114803717e-02, 1.208459213e-02, 6.042296067e-02); (void) c11;
	const float4 c19 = float4(0.000000000e+00, 1.000000000e+00, -4.000000060e-01, 1.953125000e-03); (void) c19;
	const float4 c20 = float4(-9.765625000e-04, 1.953125000e-03, 0.000000000e+00, 1.000000000e+00); (void) c20;
	const float4 c21 = float4(-1.953125000e-03, 1.953125000e-03, 0.000000000e+00, 1.000000000e+00); (void) c21;
	const float4 c22 = float4(1.953125000e-03, 9.765625000e-04, 0.000000000e+00, 1.000000000e+00); (void) c22;
	const float4 c23 = float4(9.969788790e-02, 1.661631465e-01, 1.399999976e+00, -3.000000119e-01); (void) c23;
	const float4 c24 = float4(-2.000000000e+00, 3.000000000e+00, -9.999999975e-07, 1.000000000e+06); (void) c24;
	const float4 c25 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -3.333333254e+00); (void) c25;
	const float4 c26 = float4(-1.953125000e-03, 9.765625000e-04, 0.000000000e+00, 1.000000000e+00); (void) c26;
	const float4 c27 = float4(-1.953125000e-03, -9.765625000e-04, 0.000000000e+00, 1.000000000e+00); (void) c27;
	const float4 c29 = float4(-9.765625000e-04, 9.765625000e-04, 0.000000000e+00, 1.000000000e+00); (void) c29;
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
	#define c12 uniforms.uniforms_float4[9]
	#define c13 uniforms.uniforms_float4[10]
	#define c14 uniforms.uniforms_float4[11]
	#define c15 uniforms.uniforms_float4[12]
	#define c16 uniforms.uniforms_float4[13]
	#define c17 uniforms.uniforms_float4[14]
	#define c18 uniforms.uniforms_float4[15]
	#define c28 uniforms.uniforms_float4[16]
	#define c30 uniforms.uniforms_float4[17]
	#define c102 uniforms.uniforms_float4[18]
	#define c107 uniforms.uniforms_float4[19]
	#define c109 uniforms.uniforms_float4[20]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	oC0.w = r0.w * c1.w;
	r1 = (v4.xyzx * c19.yyyx) + c19.xxxy;
	r0.w = dot(r1, c18);
	r2.x = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r3.x = dot(r1, c15);
	r3.y = dot(r1, c16);
	r3.z = dot(r1, c17);
	r1.xyz = r2.xxx * r3.xyz;
	r2 = r1.xyzx * c19.yyyx;
	r3 = r2 + c19.wwxy;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c21;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c21.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c21.xxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r3.x = dot(r3, c11.xxxx);
	r4 = r2 + c19.wxxy;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r5 = r2 + c21.xzzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r2 + c19.xwxy;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r2 + c21.zxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r3.y = dot(r4, c11.yyyy);
	r3.x = r3.y + r3.x;
	r4 = r2 + c22;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r5 = r2 + c22.yxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r2 + c20;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r2 + c26;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r3.y = dot(r4, c11.zzzz);
	r3.x = r3.y + r3.x;
	r4 = r2 + c27;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r5 = r2 + c27.yxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r2 + c26.yxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r2 + c20.yxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r3.y = dot(r4, c11.zzzz);
	r3.x = r3.y + r3.x;
	r4 = r2 + c22.yyzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r5 = r2 + c29;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r2 + c29.yxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r2 + c20.xxzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r3.y = dot(r4, c11.wwww);
	r3.x = r3.y + r3.x;
	r4 = r2 + c22.yzzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r5 = r2 + c20.xzzw;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r2 + c20.zxzw;
	r2 = r2 + c22.zyzw;
	r2 = float4(s11_texture.sample_compare(s11, (r2.xyz).xy, (r2.xyz).z));
	r4.w = r2.x;
	r2 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r2.x;
	r2.x = dot(r4, c23.xxxx);
	r2.x = r2.x + r3.x;
	r1.w = c2.y;
	r3 = float4(s11_texture.sample_compare(s11, (r1.xyz).xy, (r1.xyz).z));
	r1 = s8_texture.sample(s8, r1.xy);
	r1.xyz = ((-r0.w >= 0.0) ? c19.xxx : r1.xyz);
	r0.w = (r3.x * c23.y) + r2.x;
	r1.w = pow(abs(r0.w), c23.z);
	r0.w = -r1.w + c2.y;
	r0.w = (c109.y * r0.w) + r1.w;
	r2.x = c2.y;
	r3.xyz = c14.xyz + -v4.xyz;
	r2.w = dot(r3.xyz, r3.xyz);
	r2.z = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r2.y = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r2.x = clamp(dot(c13.xyz, r2.xyz), 0.0, 1.0);
	r3.w = clamp(mix(r0.w, r1.w, r2.x), 0.0, 1.0);
	r0.w = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r2.yzw = r2.yyy * r3.xyz;
	r0.w = r0.w + -c13.w;
	r3.z = c19.z;
	r3.x = r3.z * c13.w;
	r3.x = ((r3.x == 0.0) ? FLT_MAX : 1.0 / r3.x);
	r0.w = clamp(r0.w * r3.x, 0.0, 1.0);
	r3.x = r0.w * r2.x;
	r3.xyz = r3.xxx * c28.xyz;
	r3.xyz = r1.xyz * r3.xyz;
	r1.xyz = r1.xyz * c28.xyz;
	r3.xyz = r3.www * r3.xyz;
	r4 = s1_texture.sample(s1, v0.xy);
	r4.xyz = (r4.xyz * c2.zzz) + c2.www;
	r5.x = dot(v1.xyz, r4.xyz);
	r5.y = dot(v2.xyz, r4.xyz);
	r5.z = dot(v3.xyz, r4.xyz);
	r4.xyz = normalize(r5.xyz);
	r3.w = dot(r2.yzw, r4.xyz);
	r5.x = clamp(r3.w, 0.0, 1.0);
	r3.w = clamp(r3.w + c28.w, 0.0, 1.0);
	r3.w = r2.x * r3.w;
	r5.x = ((r5.x == 0.0) ? FLT_MAX : rsqrt(abs(r5.x)));
	r5.x = ((r5.x == 0.0) ? FLT_MAX : 1.0 / r5.x);
	r5.yzw = c3.xyz + -v4.xyz;
	r6.x = dot(r5.yzw, r5.yzw);
	r6.x = ((r6.x == 0.0) ? FLT_MAX : rsqrt(abs(r6.x)));
	r2.yzw = (r5.yzw * r6.xxx) + r2.yzw;
	r5.yzw = r5.yzw * r6.xxx;
	r6.y = clamp(dot(r5.yzw, r4.xyz), 0.0, 1.0);
	r7.xyz = normalize(r2.yzw);
	r6.x = clamp(dot(r4.xyz, r7.xyz), 0.0, 1.0);
	r7 = s10_texture.sample(s10, v0.xy);
	r6.z = r7.w;
	r8 = s7_texture.sample(s7, r6.xz);
	r6 = s4_texture.sample(s4, r6.yz);
	r2.yzw = r5.xxx * r8.xyz;
	r2.yzw = r3.xyz * r2.yzw;
	r2.yzw = r4.www * r2.yzw;
	r3.x = mix(c10.x, c10.y, r7.y);
	r2.yzw = r2.yzw * r3.xxx;
	r2.yzw = r6.yyy * r2.yzw;
	r3.xyz = r0.zxy * c2.xxx;
	r3.xyz = (r0.zxy * c2.xxx) + -r3.zxy;
	r5.xy = c0.xy;
	r4.w = (c12.w * r5.x) + r5.y;
	r4.w = fract(r4.w);
	r4.w = (r4.w * c0.z) + c0.w;
	r5.xy = float2(cos(r4.w), sin(r4.w));
	r3.xyz = r3.xyz * r5.yyy;
	r3.xyz = (r0.xyz * r5.xxx) + r3.xyz;
	r4.w = -r5.x + c2.y;
	r5.x = dot(c2.xxx, r0.xyz);
	r5.x = r5.x * c2.x;
	r3.xyz = (r5.xxx * r4.www) + r3.xyz;
	r4.w = abs(c12.w);
	r0.xyz = ((-r4.w >= 0.0) ? r0.xyz : r3.xyz);
	r3.xyz = r0.xyz + c2.www;
	r3.xyz = (r7.yyy * r3.xyz) + c2.yyy;
	r2.yzw = r2.yzw * r3.xyz;
	r3.xyz = c25.xyz;
	r3.x = dot(c102.xyz, r3.xyz);
	r3.y = r3.x + c24.z;
	r3.x = ((r3.x == 0.0) ? FLT_MAX : 1.0 / r3.x);
	r3.x = ((r3.y >= 0.0) ? r3.x : c24.w);
	r3.y = dot(r0.xyz, c25.xyz);
	r5.xyz = r3.yyy * c102.xyz;
	r3.xyz = (r5.xyz * r3.xxx) + -r0.xyz;
	r3.xyz = (c102.www * r3.xyz) + r0.xyz;
	r4.w = clamp(c107.w + v5.w, 0.0, 1.0);
	r3.xyz = (r3.xyz * r4.www) + -r0.xyz;
	r5.x = ((r4.x >= 0.0) ? c19.x : c19.y);
	r5.y = ((r4.y >= 0.0) ? c19.x : c19.y);
	r5.z = ((r4.z >= 0.0) ? c19.x : c19.y);
	r6.xyz = r4.xyz * r4.xyz;
	r4.x = ((r4.x >= 0.0) ? c19.y : c19.x);
	r4.y = ((r4.y >= 0.0) ? c19.y : c19.x);
	r4.z = ((r4.z >= 0.0) ? c19.y : c19.x);
	r4.xyz = r6.xyz * r4.xyz;
	r5.xyz = r5.xyz * r6.xyz;
	r6.xyz = r5.xxx * c5.xyz;
	r6.xyz = (r4.xxx * c4.xyz) + r6.xyz;
	r4.xyw = (r4.yyy * c6.xyz) + r6.xyz;
	r4.xyw = (r5.yyy * c7.xyz) + r4.xyw;
	r4.xyz = (r4.zzz * c8.xyz) + r4.xyw;
	r4.xyz = (r5.zzz * c9.xyz) + r4.xyz;
	r4.w = clamp(r1.w, 0.0, 1.0);
	r5.x = -r4.w + c2.y;
	r4.w = (c109.y * r5.x) + r4.w;
	r5.x = clamp(mix(r4.w, r1.w, r2.x), 0.0, 1.0);
	r1.xyz = r1.xyz * r5.xxx;
	r1.xyz = r1.xyz * r3.www;
	r1.xyz = (r1.xyz * r0.www) + r4.xyz;
	r0.w = dot(r1.xyz, c25.xyz);
	r1.xyz = r1.xyz + v5.xyz;
	r0.w = r0.w + c23.w;
	r0.w = clamp(r0.w * c25.w, 0.0, 1.0);
	r1.w = (r0.w * c24.x) + c24.y;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.w;
	r0.xyz = (r0.www * r3.xyz) + r0.xyz;
	r0.xyz = r7.zzz * r0.xyz;
	r0.xyz = (r0.xyz * r1.xyz) + r2.yzw;
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
	#undef c12
	#undef c13
	#undef c14
	#undef c15
	#undef c16
	#undef c17
	#undef c18
	#undef c28
	#undef c30
	#undef c102
	#undef c107
	#undef c109
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

