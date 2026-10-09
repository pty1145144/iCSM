#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[24];
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
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
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
	const float4 c0 = float4(2.000000000e+00, -1.000000000e+00, 0.000000000e+00, 1.000000000e+00); (void) c0;
	const float4 c11 = float4(1.591549367e-01, 5.000000000e-01, 6.283185482e+00, -3.141592741e+00); (void) c11;
	const float4 c20 = float4(5.773500204e-01, -4.000000060e-01, 3.021148033e-03, 2.114803717e-02); (void) c20;
	const float4 c21 = float4(1.953125000e-03, 0.000000000e+00, 1.000000000e+00, -1.953125000e-03); (void) c21;
	const float4 c22 = float4(-9.765625000e-04, 1.953125000e-03, 0.000000000e+00, 1.000000000e+00); (void) c22;
	const float4 c23 = float4(1.208459213e-02, 6.042296067e-02, 9.969788790e-02, 1.661631465e-01); (void) c23;
	const float4 c24 = float4(1.953125000e-03, 9.765625000e-04, 0.000000000e+00, 1.000000000e+00); (void) c24;
	const float4 c25 = float4(1.399999976e+00, 5.000000000e+00, -3.000000119e-01, -3.333333254e+00); (void) c25;
	const float4 c26 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -9.999999975e-07); (void) c26;
	const float4 c27 = float4(-2.000000000e+00, 3.000000000e+00, 1.000000000e+06, 0.000000000e+00); (void) c27;
	const float4 c29 = float4(-1.953125000e-03, 9.765625000e-04, 0.000000000e+00, 1.000000000e+00); (void) c29;
	const float4 c31 = float4(-1.953125000e-03, -9.765625000e-04, 0.000000000e+00, 1.000000000e+00); (void) c31;
	const float4 c32 = float4(-9.765625000e-04, 9.765625000e-04, 0.000000000e+00, 1.000000000e+00); (void) c32;
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
	#define c12 uniforms.uniforms_float4[10]
	#define c13 uniforms.uniforms_float4[11]
	#define c14 uniforms.uniforms_float4[12]
	#define c15 uniforms.uniforms_float4[13]
	#define c16 uniforms.uniforms_float4[14]
	#define c17 uniforms.uniforms_float4[15]
	#define c18 uniforms.uniforms_float4[16]
	#define c19 uniforms.uniforms_float4[17]
	#define c28 uniforms.uniforms_float4[18]
	#define c30 uniforms.uniforms_float4[19]
	#define c101 uniforms.uniforms_float4[20]
	#define c102 uniforms.uniforms_float4[21]
	#define c107 uniforms.uniforms_float4[22]
	#define c109 uniforms.uniforms_float4[23]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define oC0 output.oC0
	r0.x = c19.y + -v4.z;
	r0.x = r0.x + -c0.x;
	oC0.w = clamp(r0.x * c19.w, 0.0, 1.0);
	r0 = (v4.xyzx * c0.wwwz) + c0.zzzw;
	r1.x = dot(r0, c18);
	r1.y = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r2.x = dot(r0, c15);
	r2.y = dot(r0, c16);
	r2.z = dot(r0, c17);
	r0.xyz = r1.yyy * r2.xyz;
	r2 = r0.xyzx * c0.wwwz;
	r3 = r2 + c21.xxyz;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c21.wxyz;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c21.xwyz;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c21.wwyz;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.y = dot(r3, c20.zzzz);
	r3 = r2 + c21.xyyz;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c21.wyyz;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c21.yxyz;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c21.ywyz;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c20.wwww);
	r1.y = r1.z + r1.y;
	r3 = r2 + c24;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c24.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c22;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c29;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c23.xxxx);
	r1.y = r1.z + r1.y;
	r3 = r2 + c31;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c31.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c29.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c22.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c23.xxxx);
	r1.y = r1.z + r1.y;
	r3 = r2 + c24.yyzw;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c32;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c32.yxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r4.x;
	r4 = r2 + c22.xxzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.w = r4.x;
	r1.z = dot(r3, c23.yyyy);
	r1.y = r1.z + r1.y;
	r3 = r2 + c24.yzzw;
	r3 = float4(s11_texture.sample_compare(s11, (r3.xyz).xy, (r3.xyz).z));
	r4 = r2 + c22.xzzw;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.y = r4.x;
	r4 = r2 + c22.zxzw;
	r2 = r2 + c24.zyzw;
	r2 = float4(s11_texture.sample_compare(s11, (r2.xyz).xy, (r2.xyz).z));
	r3.w = r2.x;
	r2 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r3.z = r2.x;
	r1.z = dot(r3, c23.zzzz);
	r1.y = r1.z + r1.y;
	r0.w = c0.w;
	r2 = float4(s11_texture.sample_compare(s11, (r0.xyz).xy, (r0.xyz).z));
	r0 = s8_texture.sample(s8, r0.xy);
	r0.xyz = ((-r1.x >= 0.0) ? c0.zzz : r0.xyz);
	r0.w = (r2.x * c23.w) + r1.y;
	r1.x = pow(abs(r0.w), c25.x);
	r0.w = clamp(r1.x, 0.0, 1.0);
	r1.y = -r0.w + c0.w;
	r0.w = (c109.y * r1.y) + r0.w;
	r2.x = c0.w;
	r1.yzw = c14.xyz + -v4.xyz;
	r2.w = dot(r1.yzw, r1.yzw);
	r2.z = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r2.y = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r2.x = clamp(dot(c13.xyz, r2.xyz), 0.0, 1.0);
	r3.x = clamp(mix(r0.w, r1.x, r2.x), 0.0, 1.0);
	r3.yzw = r0.xyz * c28.xyz;
	r3.xyz = r3.xxx * r3.yzw;
	r1.yzw = r1.yzw * r2.yyy;
	r0.w = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r0.w = r0.w + -c13.w;
	r4 = s1_texture.sample(s1, v0.xy);
	r2.yzw = (r4.xyz * c0.xxx) + c0.yyy;
	r4.x = dot(v1.xyz, r2.yzw);
	r4.y = dot(v2.xyz, r2.yzw);
	r4.z = dot(v3.xyz, r2.yzw);
	r5.xyz = normalize(r4.xyz);
	r2.y = dot(r1.yzw, r5.xyz);
	r2.z = clamp(r2.y + c28.w, 0.0, 1.0);
	r2.y = clamp(r2.y, 0.0, 1.0);
	r2.y = ((r2.y == 0.0) ? FLT_MAX : rsqrt(abs(r2.y)));
	r2.y = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r2.z = r2.z * r2.x;
	r3.xyz = r3.xyz * r2.zzz;
	r4.x = ((r5.x >= 0.0) ? c0.z : c0.w);
	r4.y = ((r5.y >= 0.0) ? c0.z : c0.w);
	r4.z = ((r5.z >= 0.0) ? c0.z : c0.w);
	r6.xyz = r5.xyz * r5.xyz;
	r4.xyz = r4.xyz * r6.xyz;
	r7.xyz = r4.xxx * c5.xyz;
	r8.x = ((r5.x >= 0.0) ? c0.w : c0.z);
	r8.y = ((r5.y >= 0.0) ? c0.w : c0.z);
	r8.z = ((r5.z >= 0.0) ? c0.w : c0.z);
	r6.xyz = r6.xyz * r8.xyz;
	r7.xyz = (r6.xxx * c4.xyz) + r7.xyz;
	r6.xyw = (r6.yyy * c6.xyz) + r7.xyz;
	r6.xyw = (r4.yyy * c7.xyz) + r6.xyw;
	r6.xyz = (r6.zzz * c8.xyz) + r6.xyw;
	r4.xyz = (r4.zzz * c9.xyz) + r6.xyz;
	r6.y = c20.y;
	r2.z = r6.y * c13.w;
	r2.z = ((r2.z == 0.0) ? FLT_MAX : 1.0 / r2.z);
	r0.w = clamp(r0.w * r2.z, 0.0, 1.0);
	r3.xyz = (r3.xyz * r0.www) + r4.xyz;
	r0.w = r0.w * r2.x;
	r4.xyz = r0.www * c28.xyz;
	r0.xyz = r0.xyz * r4.xyz;
	r0.w = dot(r3.xyz, c26.xyz);
	r3.xyz = r3.xyz + v5.xyz;
	r2.zw = r0.ww + -c2.xw;
	r0.w = r0.w + c25.z;
	r0.w = clamp(r0.w * c25.w, 0.0, 1.0);
	r4.xy = -c2.xw + c2.yz;
	r3.w = ((r4.x == 0.0) ? FLT_MAX : 1.0 / r4.x);
	r4.x = ((r4.y == 0.0) ? FLT_MAX : 1.0 / r4.y);
	r2.w = clamp(r2.w * r4.x, 0.0, 1.0);
	r2.z = clamp(r2.z * r3.w, 0.0, 1.0);
	r3.w = (r2.z * c27.x) + c27.y;
	r2.z = r2.z * r2.z;
	r2.z = r2.z * r3.w;
	r3.w = (r2.w * c27.x) + c27.y;
	r2.w = r2.w * r2.w;
	r2.w = r2.w * r3.w;
	r2.z = r2.w * r2.z;
	r6 = s3_texture.sample(s3, v0.xy);
	r2.w = r6.x * c12.w;
	r2.w = (r2.w * c11.x) + c11.y;
	r2.w = fract(r2.w);
	r2.w = (r2.w * c11.z) + c11.w;
	r7.xy = float2(cos(r2.w), sin(r2.w));
	r8 = s0_texture.sample(s0, v0.xy);
	r4.xyz = r8.zxy * c20.xxx;
	r4.xyz = (r8.zxy * c20.xxx) + -r4.zxy;
	r4.xyz = r7.yyy * r4.xyz;
	r4.xyz = (r8.xyz * r7.xxx) + r4.xyz;
	r2.w = -r7.x + c0.w;
	r3.w = dot(c20.xxx, r8.xyz);
	r3.w = r3.w * c20.x;
	r7.xyz = (r3.www * r2.www) + r4.xyz;
	r2.w = abs(c12.w);
	r7.w = c0.w;
	r8.w = r6.x;
	r3.w = -r6.w + c0.w;
	r6 = ((-r2.w >= 0.0) ? r8 : r7);
	r2.z = r2.z * r6.w;
	r4.xyz = r6.xyz * r6.xyz;
	r4.xyz = r4.xyz * r4.xyz;
	r2.w = dot(r6.xyz, c26.xyz);
	r7.xyz = r2.www * r4.xyz;
	r4.x = dot(r4.xyz, c26.xyz);
	r8.xyz = mix(r6.xyz, r2.www, -c101.yyy);
	r2.w = r4.x + c26.w;
	r4.x = ((r4.x == 0.0) ? FLT_MAX : 1.0 / r4.x);
	r2.w = ((r2.w >= 0.0) ? r4.x : c27.z);
	r4.xyz = (r7.xyz * r2.www) + -r6.xyz;
	r4.xyz = (c101.yyy * r4.xyz) + r6.xyz;
	r4.xyz = ((c101.y >= 0.0) ? r4.xyz : r8.xyz);
	r2.w = abs(c101.y);
	r4.xyz = ((-r2.w >= 0.0) ? r6.xyz : r4.xyz);
	r7.xyz = mix(r6.xyz, r4.xyz, r2.zzz);
	r4.xyz = r6.xyz + c0.yyy;
	r2.z = dot(r7.xyz, c26.xyz);
	r6.xyz = r2.zzz * c102.xyz;
	r8.xyz = c26.xyz;
	r2.z = dot(c102.xyz, r8.xyz);
	r2.w = r2.z + c26.w;
	r2.z = ((r2.z == 0.0) ? FLT_MAX : 1.0 / r2.z);
	r2.z = ((r2.w >= 0.0) ? r2.z : c27.z);
	r6.xyz = (r6.xyz * r2.zzz) + -r7.xyz;
	r6.xyz = (c102.www * r6.xyz) + r7.xyz;
	r2.z = clamp(c107.w + v5.w, 0.0, 1.0);
	r6.xyz = (r6.xyz * r2.zzz) + -r7.xyz;
	r2.z = (r0.w * c27.x) + c27.y;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r2.z;
	r6.xyz = (r0.www * r6.xyz) + r7.xyz;
	r7 = s10_texture.sample(s10, v0.xy);
	r6.xyz = r6.xyz * r7.zzz;
	r0.w = -r1.x + c0.w;
	r0.w = (c109.y * r0.w) + r1.x;
	r5.w = clamp(mix(r0.w, r1.x, r2.x), 0.0, 1.0);
	r0.xyz = r0.xyz * r5.www;
	r2.xzw = c3.xyz + -v4.xyz;
	r0.w = dot(r2.xzw, r2.xzw);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r1.xyz = (r2.xzw * r0.www) + r1.yzw;
	r2.xzw = r0.www * r2.xzw;
	r8.y = clamp(dot(r2.xzw, r5.xyz), 0.0, 1.0);
	r9.xyz = normalize(r1.xyz);
	r8.x = clamp(dot(r5.xyz, r9.xyz), 0.0, 1.0);
	r8.z = r7.w;
	r1 = s7_texture.sample(s7, r8.xz);
	r5 = s4_texture.sample(s4, r8.yz);
	r0.w = r8.y * r8.y;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r3.w;
	r2.xzw = r0.www * v5.xyz;
	r2.xzw = r2.xzw * c25.yyy;
	r2.xzw = ((-r3.w >= 0.0) ? c0.zzz : r2.xzw);
	r0.w = mix(r5.y, c0.w, r3.w);
	r1.xyz = r2.yyy * r1.xyz;
	r0.xyz = (r1.xyz * r0.xyz) + r2.xzw;
	r0.xyz = r4.www * r0.xyz;
	r1.x = mix(c10.x, c10.y, r7.y);
	r1.yzw = (r7.yyy * r4.xyz) + c0.www;
	r0.xyz = r0.xyz * r1.xxx;
	r0.xyz = r0.www * r0.xyz;
	r0.xyz = r1.yzw * r0.xyz;
	r0.xyz = (r6.xyz * r3.xyz) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	oC0.xyz = r0.xyz * c30.xxx;
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
	#undef c12
	#undef c13
	#undef c14
	#undef c15
	#undef c16
	#undef c17
	#undef c18
	#undef c19
	#undef c28
	#undef c30
	#undef c101
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

