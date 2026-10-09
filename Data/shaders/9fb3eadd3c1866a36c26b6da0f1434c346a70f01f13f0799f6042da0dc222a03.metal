#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[32];
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
	const float4 c22 = float4(2.000000000e+00, -1.000000000e+00, 0.000000000e+00, 1.000000000e+00); (void) c22;
	const float4 c23 = float4(5.000000000e-01, 1.591549367e-01, 6.283185482e+00, -3.141592741e+00); (void) c23;
	const float4 c24 = float4(5.773500204e-01, -4.000000060e-01, 5.000000000e+00, -3.000000119e-01); (void) c24;
	const float4 c25 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -3.333333254e+00); (void) c25;
	const float4 c26 = float4(-2.000000000e+00, 3.000000000e+00, -9.999999975e-07, 1.000000000e+06); (void) c26;
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
	#define c2 uniforms.uniforms_float4[2]
	#define c3 uniforms.uniforms_float4[3]
	#define c4 uniforms.uniforms_float4[4]
	#define c5 uniforms.uniforms_float4[5]
	#define c6 uniforms.uniforms_float4[6]
	#define c7 uniforms.uniforms_float4[7]
	#define c8 uniforms.uniforms_float4[8]
	#define c9 uniforms.uniforms_float4[9]
	#define c10 uniforms.uniforms_float4[10]
	#define c11 uniforms.uniforms_float4[11]
	#define c12 uniforms.uniforms_float4[12]
	#define c13 uniforms.uniforms_float4[13]
	#define c14 uniforms.uniforms_float4[14]
	#define c15 uniforms.uniforms_float4[15]
	#define c16 uniforms.uniforms_float4[16]
	#define c17 uniforms.uniforms_float4[17]
	#define c18 uniforms.uniforms_float4[18]
	#define c19 uniforms.uniforms_float4[19]
	#define c20 uniforms.uniforms_float4[20]
	#define c21 uniforms.uniforms_float4[21]
	#define c28 uniforms.uniforms_float4[22]
	#define c29 uniforms.uniforms_float4[23]
	#define c30 uniforms.uniforms_float4[24]
	#define c33 uniforms.uniforms_float4[25]
	#define c101 uniforms.uniforms_float4[26]
	#define c102 uniforms.uniforms_float4[27]
	#define c105 uniforms.uniforms_float4[28]
	#define c106 uniforms.uniforms_float4[29]
	#define c107 uniforms.uniforms_float4[30]
	#define c109 uniforms.uniforms_float4[31]
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
	r1 = (v5.xyzx * c22.wwwz) + c22.zzzw;
	r2.x = dot(r1, c18);
	r2.y = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r3.x = dot(r1, c15);
	r3.y = dot(r1, c16);
	r3.z = dot(r1, c17);
	r1.xyz = r2.yyy * r3.xyz;
	r3 = s8_texture.sample(s8, r1.xy);
	r2.xyz = ((-r2.x >= 0.0) ? c22.zzz : r3.xyz);
	r3.y = c24.y;
	r2.w = r3.y * c13.w;
	r2.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r3.xyz = c14.xyz + -v5.xyz;
	r3.w = dot(r3.xyz, r3.xyz);
	r4.y = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r4.z = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r3.w = ((r4.y == 0.0) ? FLT_MAX : 1.0 / r4.y);
	r3.w = r3.w + -c13.w;
	r2.w = clamp(r2.w * r3.w, 0.0, 1.0);
	r4.x = c22.w;
	r3.w = clamp(dot(c13.xyz, r4.xyz), 0.0, 1.0);
	r3.xyz = r3.xyz * r4.yyy;
	r4.x = r2.w * r3.w;
	r4.xyz = r4.xxx * c28.xyz;
	r4.xyz = r2.xyz * r4.xyz;
	r2.xyz = r2.xyz * c28.xyz;
	r1.w = c22.w;
	r1 = float4(s11_texture.sample_compare(s11, (r1.xyz).xy, (r1.xyz).z));
	r1.y = -r1.x + c22.w;
	r1.y = (c109.y * r1.y) + r1.x;
	r4.w = clamp(mix(r1.y, r1.x, r3.w), 0.0, 1.0);
	r1.yzw = r4.www * r4.xyz;
	r4.xyz = c3.xyz + -v5.xyz;
	r4.w = dot(r4.xyz, r4.xyz);
	r4.w = ((r4.w == 0.0) ? FLT_MAX : rsqrt(abs(r4.w)));
	r5.xyz = r4.www * r4.xyz;
	r6 = s1_texture.sample(s1, v0.xy);
	r6.xyz = (r6.xyz * c22.xxx) + c22.yyy;
	r7.x = dot(v2.xyz, r6.xyz);
	r7.y = dot(v3.xyz, r6.xyz);
	r7.z = dot(v4.xyz, r6.xyz);
	r6.xyz = normalize(r7.xyz);
	r5.w = dot(r5.xyz, r6.xyz);
	r7.z = clamp(r5.w, 0.0, 1.0);
	r5.w = r5.w + r5.w;
	r8.x = r7.z * r7.z;
	r8.w = r8.x * r8.x;
	r9 = s3_texture.sample(s3, v0.xy);
	r9.y = -r9.w + c22.w;
	r9.z = r8.w * r9.y;
	r10.xyz = r9.zzz * v6.xyz;
	r8.xyz = r10.xyz * c24.zzz;
	r8 = ((-r9.y >= 0.0) ? c22.zzzz : r8);
	r10.xyz = c21.xyz + -v5.xyz;
	r11.xyz = normalize(r10.xyz);
	r9.z = clamp(dot(r5.xyz, r11.xyz), 0.0, 1.0);
	r8.w = r8.w * r9.z;
	r10.xyz = (r4.xyz * r4.www) + r11.xyz;
	r4.xyz = (r4.xyz * r4.www) + r3.xyz;
	r3.x = dot(r3.xyz, r6.xyz);
	r3.y = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r3.y = clamp((r3.y * c19.w) + c19.x, 0.0, 1.0);
	r4.w = min(r3.y, c19.z);
	r3.y = r4.w * r4.w;
	r12.xyz = normalize(r4.xyz);
	r7.y = clamp(dot(r6.xyz, r12.xyz), 0.0, 1.0);
	r4.xyz = normalize(r10.xyz);
	r7.x = clamp(dot(r6.xyz, r4.xyz), 0.0, 1.0);
	r4 = s10_texture.sample(s10, v0.xy);
	r7.w = r4.w;
	r10 = s7_texture.sample(s7, r7.xw);
	r12.xyz = (r8.www * c24.zzz) + -r10.xyz;
	r12.xyz = (r9.yyy * r12.xyz) + r10.xyz;
	r10.xyz = ((-r9.y >= 0.0) ? r10.xyz : r12.xyz);
	r3.z = clamp(dot(r6.xyz, r11.xyz), 0.0, 1.0);
	r4.w = clamp(r11.z, 0.0, 1.0);
	r4.w = (r4.w * r4.w) + r4.w;
	r4.w = r4.w * c23.x;
	r8.w = ((r3.z == 0.0) ? FLT_MAX : rsqrt(abs(r3.z)));
	r8.w = ((r8.w == 0.0) ? FLT_MAX : 1.0 / r8.w);
	r10.xyz = r8.www * r10.xyz;
	r11.xyz = c20.xyz * v1.xxx;
	r8.xyz = (r10.xyz * r11.xyz) + r8.xyz;
	r9.z = clamp(r3.x, 0.0, 1.0);
	r3.x = clamp(r3.x + c28.w, 0.0, 1.0);
	r3.x = r3.x * r3.w;
	r9.z = ((r9.z == 0.0) ? FLT_MAX : rsqrt(abs(r9.z)));
	r9.z = ((r9.z == 0.0) ? FLT_MAX : 1.0 / r9.z);
	r10 = s7_texture.sample(s7, r7.yw);
	r12 = s4_texture.sample(s4, r7.zw);
	r7.y = -r7.z + c22.w;
	r9.w = pow(abs(r7.y), c105.x);
	r7.yzw = r9.zzz * r10.xyz;
	r1.yzw = (r7.yzw * r1.yzw) + r8.xyz;
	r1.yzw = r6.www * r1.yzw;
	r6.w = mix(c10.x, c10.y, r4.y);
	r1.yzw = r1.yzw * r6.www;
	r6.w = dot(r6.xyz, r6.xyz);
	r5.xyz = r5.xyz * r6.www;
	r5.xyz = (r5.www * r6.xyz) + -r5.xyz;
	r7.y = ((r5.x >= 0.0) ? c22.z : c22.w);
	r7.z = ((r5.y >= 0.0) ? c22.z : c22.w);
	r7.w = ((r5.z >= 0.0) ? c22.z : c22.w);
	r8.xyz = r5.xyz * r5.xyz;
	r5.x = ((r5.x >= 0.0) ? c22.w : c22.z);
	r5.y = ((r5.y >= 0.0) ? c22.w : c22.z);
	r5.z = ((r5.z >= 0.0) ? c22.w : c22.z);
	r5.xyz = r8.xyz * r5.xyz;
	r7.yzw = r7.yzw * r8.xyz;
	r8.xyz = r7.yyy * c5.xyz;
	r8.xyz = (r5.xxx * c4.xyz) + r8.xyz;
	r5.xyw = (r5.yyy * c6.xyz) + r8.xyz;
	r5.xyw = (r7.zzz * c7.xyz) + r5.xyw;
	r5.xyz = (r5.zzz * c8.xyz) + r5.xyw;
	r5.xyz = (r7.www * c9.xyz) + r5.xyz;
	r7.yzw = r4.www * r11.xyz;
	r5.xyz = r5.xyz * r7.yzw;
	r8.x = v7.w;
	r8.y = v8.w;
	r8.z = v9.w;
	r7.yzw = -r8.xyz + c21.xyz;
	r8.xyz = normalize(r7.yzw);
	r4.w = clamp(dot(-v9.xyz, r8.xyz), 0.0, 1.0);
	r4.w = (r4.w * r4.w) + r4.w;
	r4.w = r4.w * c23.x;
	r7.yzw = r4.www * r11.xyz;
	r8.xyz = c0.xyz * v6.xyz;
	r7.yzw = (r8.xyz * r7.yzw) + -r5.xyz;
	r4.w = clamp(dot(r6.xyz, v9.xyz), 0.0, 1.0);
	r5.xyz = (r4.www * r7.yzw) + r5.xyz;
	r4.w = r4.x * r12.z;
	r5.w = mix(r12.y, c22.w, r9.y);
	r4.w = r4.w * c0.w;
	r5.xyz = r4.www * r5.xyz;
	r1.yzw = (r1.yzw * r5.www) + r5.xyz;
	r4.w = r9.x * c12.w;
	r0.w = r9.x;
	r4.w = (r4.w * c23.y) + c23.x;
	r4.w = fract(r4.w);
	r4.w = (r4.w * c23.z) + c23.w;
	r5.xy = float2(cos(r4.w), sin(r4.w));
	r7.yzw = r0.zxy * c24.xxx;
	r7.yzw = (r0.zxy * c24.xxx) + -r7.wyz;
	r5.yzw = r5.yyy * r7.yzw;
	r5.yzw = (r0.xyz * r5.xxx) + r5.yzw;
	r4.w = -r5.x + c22.w;
	r5.x = dot(c24.xxx, r0.xyz);
	r5.x = r5.x * c24.x;
	r5.xyz = (r5.xxx * r4.www) + r5.yzw;
	r4.w = abs(c12.w);
	r5.w = c22.w;
	r0 = ((-r4.w >= 0.0) ? r0 : r5);
	r5.xyz = r0.xyz + c22.yyy;
	r5.xyz = (r4.yyy * r5.xyz) + c22.www;
	r1.yzw = r1.yzw * r5.xyz;
	r5.xyz = r0.xyz * r0.xyz;
	r5.xyz = r5.xyz * r5.xyz;
	r4.w = dot(r0.xyz, c25.xyz);
	r7.yzw = r4.www * r5.xyz;
	r5.x = dot(r5.xyz, c25.xyz);
	r5.yzw = mix(r0.xyz, r4.www, -c101.yyy);
	r4.w = r5.x + c26.z;
	r5.x = ((r5.x == 0.0) ? FLT_MAX : 1.0 / r5.x);
	r4.w = ((r4.w >= 0.0) ? r5.x : c26.w);
	r7.yzw = (r7.yzw * r4.www) + -r0.xyz;
	r7.yzw = (c101.yyy * r7.yzw) + r0.xyz;
	r5.xyz = ((c101.y >= 0.0) ? r7.yzw : r5.yzw);
	r4.w = abs(c101.y);
	r5.xyz = ((-r4.w >= 0.0) ? r0.xyz : r5.xyz);
	r7.y = ((r6.x >= 0.0) ? c22.z : c22.w);
	r7.z = ((r6.y >= 0.0) ? c22.z : c22.w);
	r7.w = ((r6.z >= 0.0) ? c22.z : c22.w);
	r8.xyz = r6.xyz * r6.xyz;
	r6.x = ((r6.x >= 0.0) ? c22.w : c22.z);
	r6.y = ((r6.y >= 0.0) ? c22.w : c22.z);
	r6.z = ((r6.z >= 0.0) ? c22.w : c22.z);
	r6.xyz = r8.xyz * r6.xyz;
	r7.yzw = r7.yzw * r8.xyz;
	r8.xyz = r7.yyy * c5.xyz;
	r8.xyz = (r6.xxx * c4.xyz) + r8.xyz;
	r6.xyw = (r6.yyy * c6.xyz) + r8.xyz;
	r6.xyw = (r7.zzz * c7.xyz) + r6.xyw;
	r6.xyz = (r6.zzz * c8.xyz) + r6.xyw;
	r6.xyz = (r7.www * c9.xyz) + r6.xyz;
	r4.w = (r3.z * r3.z) + r3.z;
	r3.z = r3.z * r7.x;
	r3.z = r9.w * r3.z;
	r4.w = r4.w * c23.x;
	r6.xyz = (r11.xyz * r4.www) + r6.xyz;
	r4.w = clamp(r1.x, 0.0, 1.0);
	r5.w = -r4.w + c22.w;
	r4.w = (c109.y * r5.w) + r4.w;
	r5.w = clamp(mix(r4.w, r1.x, r3.w), 0.0, 1.0);
	r2.xyz = r2.xyz * r5.www;
	r2.xyz = r2.xyz * r3.xxx;
	r2.xyz = (r2.xyz * r2.www) + r6.xyz;
	r1.x = dot(r2.xyz, c25.xyz);
	r3.xw = r1.xx + -c2.xw;
	r6.xy = -c2.xw + c2.yz;
	r1.x = ((r6.y == 0.0) ? FLT_MAX : 1.0 / r6.y);
	r2.w = ((r6.x == 0.0) ? FLT_MAX : 1.0 / r6.x);
	r2.w = clamp(r2.w * r3.x, 0.0, 1.0);
	r1.x = clamp(r1.x * r3.w, 0.0, 1.0);
	r3.x = (r1.x * c26.x) + c26.y;
	r1.x = r1.x * r1.x;
	r6.xy = (r3.zz * r8.ww) + -c33.xw;
	r3.z = r8.w * r3.z;
	r7.xyz = r11.xyz * r3.zzz;
	r3.zw = -c33.xw + c33.yz;
	r3.z = ((r3.z == 0.0) ? FLT_MAX : 1.0 / r3.z);
	r3.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r3.zw = clamp(r3.zw * r6.xy, float2(0.0), float2(1.0));
	r4.w = (r3.z * c26.x) + c26.y;
	r3.z = r3.z * r3.z;
	r3.z = r3.z * r4.w;
	r4.w = (r3.w * c26.x) + c26.y;
	r3.w = r3.w * r3.w;
	r3.w = r3.w * r4.w;
	r3.z = r3.w * r3.z;
	r3.w = c22.w;
	r3.w = (v6.w * c11.w) + r3.w;
	r4.x = r4.x * c105.y;
	r3.w = r3.w * r4.x;
	r6.xyz = r3.www * r7.xyz;
	r3.w = r4.y * c101.w;
	r4.xyw = (r0.xyz * r3.www) + -c106.xyz;
	r3.w = clamp(r3.w, 0.0, 1.0);
	r4.xyw = (r3.www * r4.xyw) + c106.xyz;
	r7.xyz = r4.xyw * r6.xyz;
	r3.w = dot(r7.xyz, c25.xyz);
	r3.z = r3.w * r3.z;
	r3.z = r3.z * c106.w;
	r1.x = (r3.x * r1.x) + r3.z;
	r3.x = (r2.w * c26.x) + c26.y;
	r2.w = r2.w * r2.w;
	r2.w = r2.w * r3.x;
	r1.x = r1.x * r2.w;
	r0.w = r0.w * r1.x;
	r3.xzw = mix(r0.xyz, r5.xyz, r0.www);
	r0.x = dot(r3.xzw, c25.xyz);
	r0.xyz = r0.xxx * c102.xyz;
	r5.xyz = c25.xyz;
	r0.w = dot(c102.xyz, r5.xyz);
	r1.x = r0.w + c26.z;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r1.x >= 0.0) ? r0.w : c26.w);
	r0.xyz = (r0.xyz * r0.www) + -r3.xzw;
	r0.xyz = (c102.www * r0.xyz) + r3.xzw;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r0.xyz = (r0.xyz * r0.www) + -r3.xzw;
	r5.xyz = (r6.xyz * r4.xyw) + r2.xyz;
	r2.xyz = r2.xyz + v6.xyz;
	r0.w = dot(r5.xyz, c25.xyz);
	r0.w = r0.w + c24.w;
	r0.w = clamp(r0.w * c25.w, 0.0, 1.0);
	r1.x = (r0.w * c26.x) + c26.y;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.x;
	r0.xyz = (r0.www * r0.xyz) + r3.xzw;
	r0.xyz = r4.zzz * r0.xyz;
	r0.xyz = (r0.xyz * r2.xyz) + r1.yzw;
	r0.xyz = (r6.xyz * r4.xyw) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	oC0.xyz = (r3.yyy * r0.xyz) + r1.xyz;
	#undef c0
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
	#undef c13
	#undef c14
	#undef c15
	#undef c16
	#undef c17
	#undef c18
	#undef c19
	#undef c20
	#undef c21
	#undef c28
	#undef c29
	#undef c30
	#undef c33
	#undef c101
	#undef c102
	#undef c105
	#undef c106
	#undef c107
	#undef c109
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

