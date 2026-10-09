#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[31];
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
	const float4 c19 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -3.333333254e+00); (void) c19;
	const float4 c26 = float4(-2.000000000e+00, 3.000000000e+00, -9.999999975e-07, 1.000000000e+06); (void) c26;
	const float4 c27 = float4(0.000000000e+00, 1.000000000e+00, -4.000000060e-01, -3.000000119e-01); (void) c27;
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
	float4 r13;
	float4 r14;
	float4 r15;
	float4 r16;
	float4 r17;
	float4 r18;
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
	#define c13 uniforms.uniforms_float4[11]
	#define c14 uniforms.uniforms_float4[12]
	#define c15 uniforms.uniforms_float4[13]
	#define c16 uniforms.uniforms_float4[14]
	#define c17 uniforms.uniforms_float4[15]
	#define c18 uniforms.uniforms_float4[16]
	#define c20 uniforms.uniforms_float4[17]
	#define c21 uniforms.uniforms_float4[18]
	#define c22 uniforms.uniforms_float4[19]
	#define c23 uniforms.uniforms_float4[20]
	#define c24 uniforms.uniforms_float4[21]
	#define c25 uniforms.uniforms_float4[22]
	#define c28 uniforms.uniforms_float4[23]
	#define c30 uniforms.uniforms_float4[24]
	#define c101 uniforms.uniforms_float4[25]
	#define c102 uniforms.uniforms_float4[26]
	#define c105 uniforms.uniforms_float4[27]
	#define c106 uniforms.uniforms_float4[28]
	#define c107 uniforms.uniforms_float4[29]
	#define c109 uniforms.uniforms_float4[30]
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
	r0.w = dot(r0.xyz, c19.xyz);
	r1.xyz = r0.www * c102.xyz;
	r2.xyz = c19.xyz;
	r0.w = dot(c102.xyz, r2.xyz);
	r1.w = r0.w + c26.z;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r1.w >= 0.0) ? r0.w : c26.w);
	r1.xyz = (r1.xyz * r0.www) + -r0.xyz;
	r1.xyz = (c102.www * r1.xyz) + r0.xyz;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r1.xyz = (r1.xyz * r0.www) + -r0.xyz;
	r2 = s10_texture.sample(s10, v0.xy);
	r0.w = r2.y * c101.w;
	r3.xyz = (r0.xyz * r0.www) + -c106.xyz;
	r0.w = clamp(r0.w, 0.0, 1.0);
	r3.xyz = (r0.www * r3.xyz) + c106.xyz;
	r4 = s1_texture.sample(s1, v0.xy);
	r4.xyz = (r4.xyz * c2.zzz) + c2.www;
	r5.x = dot(v2.xyz, r4.xyz);
	r5.y = dot(v3.xyz, r4.xyz);
	r5.z = dot(v4.xyz, r4.xyz);
	r4.xyz = normalize(r5.xyz);
	r5.x = ((r4.x >= 0.0) ? c27.x : c27.y);
	r5.y = ((r4.y >= 0.0) ? c27.x : c27.y);
	r5.z = ((r4.z >= 0.0) ? c27.x : c27.y);
	r6.xyz = r4.xyz * r4.xyz;
	r5.xyz = r5.xyz * r6.xyz;
	r7.xyz = r5.xxx * c5.xyz;
	r8.x = ((r4.x >= 0.0) ? c27.y : c27.x);
	r8.y = ((r4.y >= 0.0) ? c27.y : c27.x);
	r8.z = ((r4.z >= 0.0) ? c27.y : c27.x);
	r6.xyz = r6.xyz * r8.xyz;
	r7.xyz = (r6.xxx * c4.xyz) + r7.xyz;
	r6.xyw = (r6.yyy * c6.xyz) + r7.xyz;
	r5.xyw = (r5.yyy * c7.xyz) + r6.xyw;
	r5.xyw = (r6.zzz * c8.xyz) + r5.xyw;
	r5.xyz = (r5.zzz * c9.xyz) + r5.xyw;
	r6.xyz = c20.xyz * v1.xxx;
	r7.xyz = c21.xyz + -v5.xyz;
	r8.xyz = normalize(r7.xyz);
	r0.w = clamp(dot(r4.xyz, r8.xyz), 0.0, 1.0);
	r1.w = (r0.w * r0.w) + r0.w;
	r1.w = r1.w * c0.y;
	r5.xyz = (r6.xyz * r1.www) + r5.xyz;
	r7.xyz = c22.xyz * v1.yyy;
	r9.xyz = c23.xyz + -v5.xyz;
	r10.xyz = normalize(r9.xyz);
	r1.w = clamp(dot(r4.xyz, r10.xyz), 0.0, 1.0);
	r3.w = (r1.w * r1.w) + r1.w;
	r3.w = r3.w * c0.y;
	r5.xyz = (r7.xyz * r3.www) + r5.xyz;
	r9.xyz = c24.xyz * v1.zzz;
	r11.xyz = c25.xyz + -v5.xyz;
	r12.xyz = normalize(r11.xyz);
	r3.w = clamp(dot(r4.xyz, r12.xyz), 0.0, 1.0);
	r5.w = (r3.w * r3.w) + r3.w;
	r5.w = r5.w * c0.y;
	r5.xyz = (r9.xyz * r5.www) + r5.xyz;
	r11.x = c23.w + -v5.x;
	r11.y = c24.w + -v5.y;
	r11.z = c25.w + -v5.z;
	r13.xyz = normalize(r11.xyz);
	r5.w = clamp(dot(r4.xyz, r13.xyz), 0.0, 1.0);
	r6.w = (r5.w * r5.w) + r5.w;
	r6.w = r6.w * c0.y;
	r11.x = c20.w * v1.w;
	r11.y = c21.w * v1.w;
	r11.z = c22.w * v1.w;
	r5.xyz = (r11.xyz * r6.www) + r5.xyz;
	r14.z = c27.z;
	r6.w = r14.z * c13.w;
	r6.w = ((r6.w == 0.0) ? FLT_MAX : 1.0 / r6.w);
	r14.xyz = c14.xyz + -v5.xyz;
	r7.w = dot(r14.xyz, r14.xyz);
	r15.y = ((r7.w == 0.0) ? FLT_MAX : rsqrt(abs(r7.w)));
	r15.z = ((r7.w == 0.0) ? FLT_MAX : 1.0 / r7.w);
	r7.w = ((r15.y == 0.0) ? FLT_MAX : 1.0 / r15.y);
	r7.w = r7.w + -c13.w;
	r6.w = clamp(r6.w * r7.w, 0.0, 1.0);
	r16 = (v5.xyzx * c27.yyyx) + c27.xxxy;
	r7.w = dot(r16, c18);
	r8.w = ((r7.w == 0.0) ? FLT_MAX : 1.0 / r7.w);
	r17.x = dot(r16, c15);
	r17.y = dot(r16, c16);
	r17.z = dot(r16, c17);
	r16.xyz = r8.www * r17.xyz;
	r17 = s8_texture.sample(s8, r16.xy);
	r17.xyz = ((-r7.w >= 0.0) ? c27.xxx : r17.xyz);
	r18.xyz = r17.xyz * c28.xyz;
	r16.w = c2.y;
	r16 = float4(s11_texture.sample_compare(s11, (r16.xyz).xy, (r16.xyz).z));
	r7.w = clamp(r16.x, 0.0, 1.0);
	r8.w = -r7.w + c2.y;
	r7.w = (c109.y * r8.w) + r7.w;
	r15.x = c2.y;
	r8.w = clamp(dot(c13.xyz, r15.xyz), 0.0, 1.0);
	r14.xyz = r14.xyz * r15.yyy;
	r9.w = clamp(mix(r7.w, r16.x, r8.w), 0.0, 1.0);
	r15.xyz = r9.www * r18.xyz;
	r7.w = dot(r14.xyz, r4.xyz);
	r9.w = clamp(r7.w + c28.w, 0.0, 1.0);
	r7.w = clamp(r7.w, 0.0, 1.0);
	r7.w = ((r7.w == 0.0) ? FLT_MAX : rsqrt(abs(r7.w)));
	r7.w = ((r7.w == 0.0) ? FLT_MAX : 1.0 / r7.w);
	r9.w = r8.w * r9.w;
	r15.xyz = r15.xyz * r9.www;
	r5.xyz = (r15.xyz * r6.www) + r5.xyz;
	r6.w = r6.w * r8.w;
	r15.xyz = r6.www * c28.xyz;
	r15.xyz = r15.xyz * r17.xyz;
	r16.yzw = c3.xyz + -v5.xyz;
	r6.w = dot(r16.yzw, r16.yzw);
	r6.w = ((r6.w == 0.0) ? FLT_MAX : rsqrt(abs(r6.w)));
	r10.xyz = (r16.yzw * r6.www) + r10.xyz;
	r17.xyz = normalize(r10.xyz);
	r10.x = clamp(dot(r4.xyz, r17.xyz), 0.0, 1.0);
	r9.w = r1.w * r10.x;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r17.xyz = r6.www * r16.yzw;
	r11.w = clamp(dot(r4.xyz, r17.xyz), 0.0, 1.0);
	r11.w = -r11.w + c2.y;
	r12.w = pow(abs(r11.w), c105.x);
	r9.w = r9.w * r12.w;
	r9.w = r1.w * r9.w;
	r17.xyz = r7.xyz * r9.www;
	r8.xyz = (r16.yzw * r6.www) + r8.xyz;
	r18.xyz = normalize(r8.xyz);
	r10.y = clamp(dot(r4.xyz, r18.xyz), 0.0, 1.0);
	r8.x = r0.w * r10.y;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r8.x = r12.w * r8.x;
	r8.x = r0.w * r8.x;
	r8.xyz = (r8.xxx * r6.xyz) + r17.xyz;
	r12.xyz = (r16.yzw * r6.www) + r12.xyz;
	r17.xyz = normalize(r12.xyz);
	r12.y = clamp(dot(r4.xyz, r17.xyz), 0.0, 1.0);
	r9.w = r3.w * r12.y;
	r3.w = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r3.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r9.w = r12.w * r9.w;
	r9.w = r3.w * r9.w;
	r8.xyz = (r9.www * r9.xyz) + r8.xyz;
	r13.xyz = (r16.yzw * r6.www) + r13.xyz;
	r14.xyz = (r16.yzw * r6.www) + r14.xyz;
	r17.xyz = normalize(r14.xyz);
	r10.z = clamp(dot(r4.xyz, r17.xyz), 0.0, 1.0);
	r14.xyz = normalize(r13.xyz);
	r12.x = clamp(dot(r4.xyz, r14.xyz), 0.0, 1.0);
	r4.x = r5.w * r12.x;
	r4.y = ((r5.w == 0.0) ? FLT_MAX : rsqrt(abs(r5.w)));
	r4.y = ((r4.y == 0.0) ? FLT_MAX : 1.0 / r4.y);
	r4.x = r12.w * r4.x;
	r4.x = r4.y * r4.x;
	r8.xyz = (r4.xxx * r11.xyz) + r8.xyz;
	r13.y = c2.y;
	r4.x = (v6.w * c11.w) + r13.y;
	r2.x = r2.x * c105.y;
	r2.x = r4.x * r2.x;
	r8.xyz = r2.xxx * r8.xyz;
	r13.xyz = (r8.xyz * r3.xyz) + r5.xyz;
	r5.xyz = r5.xyz + v6.xyz;
	r2.x = dot(r13.xyz, c19.xyz);
	r2.x = r2.x + c27.w;
	r2.x = clamp(r2.x * c19.w, 0.0, 1.0);
	r4.x = (r2.x * c26.x) + c26.y;
	r2.x = r2.x * r2.x;
	r2.x = r2.x * r4.x;
	r1.xyz = (r2.xxx * r1.xyz) + r0.xyz;
	r0.xyz = r0.xyz + c2.www;
	r0.xyz = (r2.yyy * r0.xyz) + c2.yyy;
	r1.xyz = r2.zzz * r1.xyz;
	r10.w = r2.w;
	r4.x = mix(c10.x, c10.y, r2.y);
	r2 = s7_texture.sample(s7, r10.xw);
	r2.xyz = r1.www * r2.xyz;
	r2.xyz = r7.xyz * r2.xyz;
	r13 = s7_texture.sample(s7, r10.yw);
	r7.xyz = r0.www * r13.xyz;
	r2.xyz = (r7.xyz * r6.xyz) + r2.xyz;
	r12.z = r10.w;
	r6 = s7_texture.sample(s7, r10.zw);
	r6.xyz = r7.www * r6.xyz;
	r7 = s7_texture.sample(s7, r12.yz);
	r10 = s7_texture.sample(s7, r12.xz);
	r10.xyz = r4.yyy * r10.xyz;
	r7.xyz = r3.www * r7.xyz;
	r2.xyz = (r7.xyz * r9.xyz) + r2.xyz;
	r2.xyz = (r10.xyz * r11.xyz) + r2.xyz;
	r0.w = -r16.x + c2.y;
	r0.w = (c109.y * r0.w) + r16.x;
	r1.w = clamp(mix(r0.w, r16.x, r8.w), 0.0, 1.0);
	r7.xyz = r1.www * r15.xyz;
	r2.xyz = (r6.xyz * r7.xyz) + r2.xyz;
	r2.xyz = r4.www * r2.xyz;
	r2.xyz = r4.xxx * r2.xyz;
	r0.w = (r11.w * -r11.w) + c0.y;
	r1.w = r11.w * r11.w;
	r2.w = r1.w + r1.w;
	r1.w = (r1.w * c2.z) + c2.w;
	r3.w = mix(c12.y, c12.z, r1.w);
	r1.w = -c12.x + c12.y;
	r1.w = (r2.w * r1.w) + c12.x;
	r0.w = ((r0.w >= 0.0) ? r1.w : r3.w);
	r2.xyz = r0.www * r2.xyz;
	r0.xyz = r0.xyz * r2.xyz;
	r0.xyz = (r1.xyz * r5.xyz) + r0.xyz;
	r0.xyz = (r8.xyz * r3.xyz) + r0.xyz;
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
	#undef c13
	#undef c14
	#undef c15
	#undef c16
	#undef c17
	#undef c18
	#undef c20
	#undef c21
	#undef c22
	#undef c23
	#undef c24
	#undef c25
	#undef c28
	#undef c30
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
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

