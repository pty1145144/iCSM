#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[27];
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
	texture2d<float> s10_texture [[texture(10)]],
	sampler s10 [[sampler(10)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(1.591549367e-01, 5.000000000e-01, 6.283185482e+00, -3.141592741e+00); (void) c0;
	const float4 c2 = float4(5.773500204e-01, 1.000000000e+00, 2.000000000e+00, -1.000000000e+00); (void) c2;
	const float4 c13 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -3.000000119e-01); (void) c13;
	const float4 c14 = float4(-3.333333254e+00, -2.000000000e+00, 3.000000000e+00, 0.000000000e+00); (void) c14;
	const float4 c15 = float4(0.000000000e+00, 1.000000000e+00, -9.999999975e-07, 1.000000000e+06); (void) c15;
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
	#define c22 uniforms.uniforms_float4[14]
	#define c23 uniforms.uniforms_float4[15]
	#define c24 uniforms.uniforms_float4[16]
	#define c25 uniforms.uniforms_float4[17]
	#define c29 uniforms.uniforms_float4[18]
	#define c30 uniforms.uniforms_float4[19]
	#define c101 uniforms.uniforms_float4[20]
	#define c102 uniforms.uniforms_float4[21]
	#define c103 uniforms.uniforms_float4[22]
	#define c104 uniforms.uniforms_float4[23]
	#define c105 uniforms.uniforms_float4[24]
	#define c106 uniforms.uniforms_float4[25]
	#define c107 uniforms.uniforms_float4[26]
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
	r1 = s1_texture.sample(s1, v0.xy);
	r1.xyz = (r1.xyz * c2.zzz) + c2.www;
	r2.x = dot(v2.xyz, r1.xyz);
	r2.y = dot(v3.xyz, r1.xyz);
	r2.z = dot(v4.xyz, r1.xyz);
	r1.xyz = normalize(r2.xyz);
	r2.x = ((r1.x >= 0.0) ? c15.x : c15.y);
	r2.y = ((r1.y >= 0.0) ? c15.x : c15.y);
	r2.z = ((r1.z >= 0.0) ? c15.x : c15.y);
	r3.xyz = r1.xyz * r1.xyz;
	r2.xyz = r2.xyz * r3.xyz;
	r4.xyz = r2.xxx * c5.xyz;
	r5.x = ((r1.x >= 0.0) ? c15.y : c15.x);
	r5.y = ((r1.y >= 0.0) ? c15.y : c15.x);
	r5.z = ((r1.z >= 0.0) ? c15.y : c15.x);
	r3.xyz = r3.xyz * r5.xyz;
	r4.xyz = (r3.xxx * c4.xyz) + r4.xyz;
	r3.xyw = (r3.yyy * c6.xyz) + r4.xyz;
	r2.xyw = (r2.yyy * c7.xyz) + r3.xyw;
	r2.xyw = (r3.zzz * c8.xyz) + r2.xyw;
	r2.xyz = (r2.zzz * c9.xyz) + r2.xyw;
	r3.xyz = c20.xyz * v1.xxx;
	r4.xyz = c21.xyz + -v5.xyz;
	r5.xyz = normalize(r4.xyz);
	r0.w = clamp(dot(r1.xyz, r5.xyz), 0.0, 1.0);
	r2.w = (r0.w * r0.w) + r0.w;
	r2.w = r2.w * c0.y;
	r2.xyz = (r3.xyz * r2.www) + r2.xyz;
	r4.xyz = c22.xyz * v1.yyy;
	r6.xyz = c23.xyz + -v5.xyz;
	r7.xyz = normalize(r6.xyz);
	r2.w = clamp(dot(r1.xyz, r7.xyz), 0.0, 1.0);
	r3.w = (r2.w * r2.w) + r2.w;
	r3.w = r3.w * c0.y;
	r2.xyz = (r4.xyz * r3.www) + r2.xyz;
	r6.xyz = c24.xyz * v1.zzz;
	r8.xyz = c25.xyz + -v5.xyz;
	r9.xyz = normalize(r8.xyz);
	r3.w = clamp(dot(r1.xyz, r9.xyz), 0.0, 1.0);
	r4.w = (r3.w * r3.w) + r3.w;
	r4.w = r4.w * c0.y;
	r2.xyz = (r6.xyz * r4.www) + r2.xyz;
	r8.xyz = r2.xyz + v6.xyz;
	r10.xyz = r8.xyz + -c103.xxx;
	r10.xyz = clamp(r10.xyz * c103.yyy, float3(0.0), float3(1.0));
	r4.w = abs(c103.w);
	r5.w = dot(r1.xyz, r1.xyz);
	r11.xyz = c3.xyz + -v5.xyz;
	r6.w = dot(r11.xyz, r11.xyz);
	r6.w = ((r6.w == 0.0) ? FLT_MAX : rsqrt(abs(r6.w)));
	r12.xyz = r6.www * r11.xyz;
	r13.xyz = r5.www * r12.xyz;
	r12.z = dot(r12.xyz, r1.xyz);
	r5.w = r12.z + r12.z;
	r12.z = clamp(r12.z, 0.0, 1.0);
	r13.xyz = (r5.www * r1.xyz) + -r13.xyz;
	r13 = s6_texture.sample(s6, r13.xyz);
	r14.xyz = r13.xyz * c30.zzz;
	r15.xyz = r14.xyz * r14.xyz;
	r15.xyz = r15.xyz * r15.xyz;
	r5.w = dot(r15.xyz, c13.xyz);
	r7.w = r5.w + c15.z;
	r5.w = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r5.w = ((r7.w >= 0.0) ? r5.w : c15.w);
	r7.w = dot(r14.xyz, c13.xyz);
	r15.xyz = r7.www * r15.xyz;
	r13.xyz = (c30.zzz * -r13.xyz) + r7.www;
	r13.xyz = (-c103.www * r13.xyz) + r14.xyz;
	r15.xyz = (r15.xyz * r5.www) + -r14.xyz;
	r15.xyz = (c103.www * r15.xyz) + r14.xyz;
	r13.xyz = ((c103.w >= 0.0) ? r15.xyz : r13.xyz);
	r13.xyz = ((-r4.w >= 0.0) ? r14.xyz : r13.xyz);
	r10.xyz = (r13.xyz * r10.xyz) + -r13.xyz;
	r10.xyz = (c101.xxx * r10.xyz) + r13.xyz;
	r13.xyz = (r10.xyz * r10.xyz) + -r10.xyz;
	r10.xyz = (c103.zzz * r13.xyz) + r10.xyz;
	r13.xyz = r1.www * c104.xyz;
	r10.xyz = r10.xyz * r13.xyz;
	r4.w = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r4.w = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r7.xyz = (r11.xyz * r6.www) + r7.xyz;
	r13.xyz = normalize(r7.xyz);
	r12.x = clamp(dot(r1.xyz, r13.xyz), 0.0, 1.0);
	r7 = s10_texture.sample(s10, v0.xy);
	r12.w = r7.w;
	r13 = s7_texture.sample(s7, r12.xw);
	r2.w = r2.w * r12.x;
	r13.xyz = r4.www * r13.xyz;
	r13.xyz = r4.xyz * r13.xyz;
	r5.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r5.w = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r5.xyz = (r11.xyz * r6.www) + r5.xyz;
	r14.xyz = normalize(r5.xyz);
	r12.y = clamp(dot(r1.xyz, r14.xyz), 0.0, 1.0);
	r14 = s7_texture.sample(s7, r12.yw);
	r0.w = r0.w * r12.y;
	r5.xyz = r5.www * r14.xyz;
	r5.xyz = (r5.xyz * r3.xyz) + r13.xyz;
	r9.xyz = (r11.xyz * r6.www) + r9.xyz;
	r13.xyz = normalize(r9.xyz);
	r9.x = clamp(dot(r1.xyz, r13.xyz), 0.0, 1.0);
	r9.y = r12.w;
	r13 = s4_texture.sample(s4, r12.zw);
	r7.w = -r12.z + c2.y;
	r8.w = pow(abs(r7.w), c105.x);
	r12 = s7_texture.sample(s7, r9.xy);
	r7.w = r3.w * r9.x;
	r3.w = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r3.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r7.w = r8.w * r7.w;
	r7.w = r3.w * r7.w;
	r9.xyz = r3.www * r12.xyz;
	r5.xyz = (r9.xyz * r6.xyz) + r5.xyz;
	r5.xyz = r1.www * r5.xyz;
	r1.w = mix(c10.x, c10.y, r7.y);
	r5.xyz = (r5.xyz * r1.www) + r10.xyz;
	r5.xyz = r13.yyy * r5.xyz;
	r9.xyz = r0.zxy * c2.xxx;
	r9.xyz = (r0.zxy * c2.xxx) + -r9.zxy;
	r10.xy = c0.xy;
	r1.w = (c12.w * r10.x) + r10.y;
	r1.w = fract(r1.w);
	r1.w = (r1.w * c0.z) + c0.w;
	r10.xy = float2(cos(r1.w), sin(r1.w));
	r9.xyz = r9.xyz * r10.yyy;
	r9.xyz = (r0.xyz * r10.xxx) + r9.xyz;
	r1.w = -r10.x + c2.y;
	r3.w = dot(c2.xxx, r0.xyz);
	r3.w = r3.w * c2.x;
	r9.xyz = (r3.www * r1.www) + r9.xyz;
	r1.w = abs(c12.w);
	r0.xyz = ((-r1.w >= 0.0) ? r0.xyz : r9.xyz);
	r9.xyz = r0.xyz + c2.www;
	r9.xyz = (r7.yyy * r9.xyz) + c2.yyy;
	r5.xyz = r5.xyz * r9.xyz;
	r9.xyz = c13.xyz;
	r1.w = dot(c102.xyz, r9.xyz);
	r3.w = r1.w + c15.z;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = ((r3.w >= 0.0) ? r1.w : c15.w);
	r3.w = dot(r0.xyz, c13.xyz);
	r9.xyz = r3.www * c102.xyz;
	r9.xyz = (r9.xyz * r1.www) + -r0.xyz;
	r9.xyz = (c102.www * r9.xyz) + r0.xyz;
	r1.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r9.xyz = (r9.xyz * r1.www) + -r0.xyz;
	r1.w = r2.w * r8.w;
	r1.w = r4.w * r1.w;
	r4.xyz = r4.xyz * r1.www;
	r0.w = r0.w * r8.w;
	r0.w = r5.w * r0.w;
	r3.xyz = (r0.www * r3.xyz) + r4.xyz;
	r3.xyz = (r7.www * r6.xyz) + r3.xyz;
	r4.y = c2.y;
	r0.w = (v6.w * c11.w) + r4.y;
	r1.w = r7.x * c105.y;
	r0.w = r0.w * r1.w;
	r3.xyz = r0.www * r3.xyz;
	r0.w = r7.y * c101.w;
	r4.xyz = (r0.xyz * r0.www) + -c106.xyz;
	r0.w = clamp(r0.w, 0.0, 1.0);
	r4.xyz = (r0.www * r4.xyz) + c106.xyz;
	r2.xyz = (r3.xyz * r4.xyz) + r2.xyz;
	r0.w = dot(r2.xyz, c13.xyz);
	r0.w = r0.w + c13.w;
	r0.w = clamp(r0.w * c14.x, 0.0, 1.0);
	r1.w = (r0.w * c14.y) + c14.z;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.w;
	r0.xyz = (r0.www * r9.xyz) + r0.xyz;
	r0.xyz = r7.zzz * r0.xyz;
	r0.xyz = (r0.xyz * r8.xyz) + r5.xyz;
	r0.xyz = (r3.xyz * r4.xyz) + r0.xyz;
	r2.x = v2.w;
	r2.y = v3.w;
	r2.z = v4.w;
	r3.xyz = (r11.xyz * r6.www) + r2.xyz;
	r0.w = ((r6.w == 0.0) ? FLT_MAX : 1.0 / r6.w);
	r0.w = clamp((r0.w * c19.w) + c19.x, 0.0, 1.0);
	r1.w = min(r0.w, c19.z);
	r0.w = r1.w * r1.w;
	r1.w = clamp(dot(r1.xyz, r2.xyz), 0.0, 1.0);
	r2.xyz = normalize(r3.xyz);
	r1.x = clamp(dot(r1.xyz, r2.xyz), 0.0, 1.0);
	r1.x = r1.w * r1.x;
	r1.y = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.y = ((r1.y == 0.0) ? FLT_MAX : 1.0 / r1.y);
	r1.x = r8.w * r1.x;
	r1.x = r1.y * r1.x;
	r1.yzw = v6.www * v6.xyz;
	r1.yzw = r1.yzw * c107.xyz;
	r1.xyz = r1.yzw * r1.xxx;
	r0.xyz = (r1.xyz * r7.xxx) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	oC0.xyz = (r0.www * r0.xyz) + r1.xyz;
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
	#undef c24
	#undef c25
	#undef c29
	#undef c30
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

