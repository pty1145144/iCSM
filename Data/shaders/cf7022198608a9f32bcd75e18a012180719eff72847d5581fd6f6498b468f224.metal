#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[25];
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
	const float4 c13 = float4(5.773500204e-01, 1.000000000e+00, 2.000000000e+00, -1.000000000e+00); (void) c13;
	const float4 c14 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -3.000000119e-01); (void) c14;
	const float4 c15 = float4(-3.333333254e+00, -2.000000000e+00, 3.000000000e+00, 0.000000000e+00); (void) c15;
	const float4 c16 = float4(0.000000000e+00, 1.000000000e+00, -9.999999975e-07, 1.000000000e+06); (void) c16;
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
	#define c22 uniforms.uniforms_float4[14]
	#define c23 uniforms.uniforms_float4[15]
	#define c30 uniforms.uniforms_float4[16]
	#define c33 uniforms.uniforms_float4[17]
	#define c101 uniforms.uniforms_float4[18]
	#define c102 uniforms.uniforms_float4[19]
	#define c103 uniforms.uniforms_float4[20]
	#define c104 uniforms.uniforms_float4[21]
	#define c105 uniforms.uniforms_float4[22]
	#define c106 uniforms.uniforms_float4[23]
	#define c107 uniforms.uniforms_float4[24]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define oC0 output.oC0
	r0.xyz = c14.xyz;
	r0.x = dot(c102.xyz, r0.xyz);
	r0.y = r0.x + c16.z;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = ((r0.y >= 0.0) ? r0.x : c16.w);
	r1.xy = c0.xy;
	r0.y = (c12.w * r1.x) + r1.y;
	r0.y = fract(r0.y);
	r0.y = (r0.y * c0.z) + c0.w;
	r1.xy = float2(cos(r0.y), sin(r0.y));
	r2 = s0_texture.sample(s0, v0.xy);
	r0.yzw = r2.zxy * c13.xxx;
	r0.yzw = (r2.zxy * c13.xxx) + -r0.wyz;
	r0.yzw = r1.yyy * r0.yzw;
	r0.yzw = (r2.xyz * r1.xxx) + r0.yzw;
	r1.x = -r1.x + c13.y;
	r1.y = dot(c13.xxx, r2.xyz);
	r1.y = r1.y * c13.x;
	r0.yzw = (r1.yyy * r1.xxx) + r0.yzw;
	r1.x = abs(c12.w);
	r0.yzw = ((-r1.x >= 0.0) ? r2.xyz : r0.yzw);
	r1.xyz = r2.www * c104.xyz;
	r2.xyz = r0.yzw * r0.yzw;
	r2.xyz = r2.xyz * r2.xyz;
	r1.w = dot(r2.xyz, c14.xyz);
	r2.w = r1.w + c16.z;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = ((r2.w >= 0.0) ? r1.w : c16.w);
	r2.w = dot(r0.yzw, c14.xyz);
	r2.xyz = r2.www * r2.xyz;
	r3.xyz = mix(r0.yzw, r2.www, -c101.yyy);
	r2.xyz = (r2.xyz * r1.www) + -r0.yzw;
	r2.xyz = (c101.yyy * r2.xyz) + r0.yzw;
	r2.xyz = ((c101.y >= 0.0) ? r2.xyz : r3.xyz);
	r1.w = abs(c101.y);
	r2.xyz = ((-r1.w >= 0.0) ? r0.yzw : r2.xyz);
	r3.xyz = c23.xyz + -v5.xyz;
	r4.xyz = normalize(r3.xyz);
	r3.xyz = c3.xyz + -v5.xyz;
	r1.w = dot(r3.xyz, r3.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r5.xyz = (r3.xyz * r1.www) + r4.xyz;
	r6.xyz = normalize(r5.xyz);
	r5 = s1_texture.sample(s1, v0.xy);
	r5.xyz = (r5.xyz * c13.zzz) + c13.www;
	r7.x = dot(v2.xyz, r5.xyz);
	r7.y = dot(v3.xyz, r5.xyz);
	r7.z = dot(v4.xyz, r5.xyz);
	r5.xyz = normalize(r7.xyz);
	r6.x = clamp(dot(r5.xyz, r6.xyz), 0.0, 1.0);
	r2.w = clamp(dot(r5.xyz, r4.xyz), 0.0, 1.0);
	r3.w = r2.w * r6.x;
	r4.xyz = r1.www * r3.xyz;
	r4.w = dot(r4.xyz, r5.xyz);
	r6.z = clamp(r4.w, 0.0, 1.0);
	r4.w = r4.w + r4.w;
	r7.x = -r6.z + c13.y;
	r8.x = pow(abs(r7.x), c105.x);
	r3.w = r3.w * r8.x;
	r7.x = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r2.w = (r2.w * r2.w) + r2.w;
	r2.w = r2.w * c0.y;
	r7.x = ((r7.x == 0.0) ? FLT_MAX : 1.0 / r7.x);
	r3.w = r3.w * r7.x;
	r7.yzw = c21.xyz + -v5.xyz;
	r9.xyz = normalize(r7.yzw);
	r3.xyz = (r3.xyz * r1.www) + r9.xyz;
	r1.w = clamp(dot(r5.xyz, r9.xyz), 0.0, 1.0);
	r9.xyz = normalize(r3.xyz);
	r6.y = clamp(dot(r5.xyz, r9.xyz), 0.0, 1.0);
	r3.x = r1.w * r6.y;
	r3.x = r8.x * r3.x;
	r3.y = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.w = (r1.w * r1.w) + r1.w;
	r1.w = r1.w * c0.y;
	r3.y = ((r3.y == 0.0) ? FLT_MAX : 1.0 / r3.y);
	r3.z = (r3.x * r3.y) + r3.w;
	r3.x = r3.y * r3.x;
	r7.yz = r3.zz + -c33.xw;
	r8.xy = -c33.xw + c33.yz;
	r3.z = ((r8.x == 0.0) ? FLT_MAX : 1.0 / r8.x);
	r7.w = ((r8.y == 0.0) ? FLT_MAX : 1.0 / r8.y);
	r7.z = clamp(r7.w * r7.z, 0.0, 1.0);
	r3.z = clamp(r3.z * r7.y, 0.0, 1.0);
	r7.y = (r3.z * c15.y) + c15.z;
	r3.z = r3.z * r3.z;
	r3.z = r3.z * r7.y;
	r7.y = (r7.z * c15.y) + c15.z;
	r7.z = r7.z * r7.z;
	r7.y = r7.z * r7.y;
	r3.z = r3.z * r7.y;
	r8 = s10_texture.sample(s10, v0.xy);
	r7.y = r8.y * c101.w;
	r9.xyz = (r0.yzw * r7.yyy) + -c106.xyz;
	r7.y = clamp(r7.y, 0.0, 1.0);
	r7.yzw = (r7.yyy * r9.xyz) + c106.xyz;
	r9.xyz = c22.xyz * v1.yyy;
	r10.xyz = r3.www * r9.xyz;
	r11.xyz = c20.xyz * v1.xxx;
	r10.xyz = (r3.xxx * r11.xyz) + r10.xyz;
	r12.y = c13.y;
	r3.x = (v6.w * c11.w) + r12.y;
	r3.w = r8.x * c105.y;
	r3.x = r3.x * r3.w;
	r10.xyz = r3.xxx * r10.xyz;
	r12.xyz = r7.yzw * r10.xyz;
	r3.x = dot(r12.xyz, c14.xyz);
	r3.x = r3.x * r3.z;
	r3.x = r3.x * c106.w;
	r12.x = ((r5.x >= 0.0) ? c16.x : c16.y);
	r12.y = ((r5.y >= 0.0) ? c16.x : c16.y);
	r12.z = ((r5.z >= 0.0) ? c16.x : c16.y);
	r13.xyz = r5.xyz * r5.xyz;
	r12.xyz = r12.xyz * r13.xyz;
	r14.xyz = r12.xxx * c5.xyz;
	r15.x = ((r5.x >= 0.0) ? c16.y : c16.x);
	r15.y = ((r5.y >= 0.0) ? c16.y : c16.x);
	r15.z = ((r5.z >= 0.0) ? c16.y : c16.x);
	r13.xyz = r13.xyz * r15.xyz;
	r14.xyz = (r13.xxx * c4.xyz) + r14.xyz;
	r13.xyw = (r13.yyy * c6.xyz) + r14.xyz;
	r12.xyw = (r12.yyy * c7.xyz) + r13.xyw;
	r12.xyw = (r13.zzz * c8.xyz) + r12.xyw;
	r12.xyz = (r12.zzz * c9.xyz) + r12.xyw;
	r12.xyz = (r11.xyz * r1.www) + r12.xyz;
	r12.xyz = (r9.xyz * r2.www) + r12.xyz;
	r1.w = dot(r12.xyz, c14.xyz);
	r3.zw = r1.ww + -c2.xw;
	r13.xy = -c2.xw + c2.yz;
	r1.w = ((r13.y == 0.0) ? FLT_MAX : 1.0 / r13.y);
	r2.w = ((r13.x == 0.0) ? FLT_MAX : 1.0 / r13.x);
	r2.w = clamp(r2.w * r3.z, 0.0, 1.0);
	r1.w = clamp(r1.w * r3.w, 0.0, 1.0);
	r3.z = (r1.w * c15.y) + c15.z;
	r1.w = r1.w * r1.w;
	r1.w = (r3.z * r1.w) + r3.x;
	r3.x = (r2.w * c15.y) + c15.z;
	r2.w = r2.w * r2.w;
	r2.w = r2.w * r3.x;
	r1.w = r1.w * r2.w;
	r3.xzw = mix(r0.yzw, r2.xyz, r1.www);
	r0.yzw = r0.yzw + c13.www;
	r0.yzw = (r8.yyy * r0.yzw) + c13.yyy;
	r1.w = dot(r3.xzw, c14.xyz);
	r2.xyz = r1.www * c102.xyz;
	r2.xyz = (r2.xyz * r0.xxx) + -r3.xzw;
	r2.xyz = (c102.www * r2.xyz) + r3.xzw;
	r0.x = clamp(c107.w + v6.w, 0.0, 1.0);
	r2.xyz = (r2.xyz * r0.xxx) + -r3.xzw;
	r13.xyz = (r10.xyz * r7.yzw) + r12.xyz;
	r12.xyz = r12.xyz + v6.xyz;
	r0.x = dot(r13.xyz, c14.xyz);
	r0.x = r0.x + c14.w;
	r0.x = clamp(r0.x * c15.x, 0.0, 1.0);
	r1.w = (r0.x * c15.y) + c15.z;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r1.w;
	r2.xyz = (r0.xxx * r2.xyz) + r3.xzw;
	r2.xyz = r8.zzz * r2.xyz;
	r6.w = r8.w;
	r0.x = mix(c10.x, c10.y, r8.y);
	r8 = s7_texture.sample(s7, r6.xw);
	r3.xzw = r7.xxx * r8.xyz;
	r3.xzw = r9.xyz * r3.xzw;
	r8 = s7_texture.sample(s7, r6.yw);
	r6 = s4_texture.sample(s4, r6.zw);
	r6.xzw = r3.yyy * r8.xyz;
	r3.xyz = (r6.xzw * r11.xyz) + r3.xzw;
	r3.xyz = r5.www * r3.xyz;
	r1.w = dot(r5.xyz, r5.xyz);
	r4.xyz = r4.xyz * r1.www;
	r4.xyz = (r4.www * r5.xyz) + -r4.xyz;
	r4 = s6_texture.sample(s6, r4.xyz);
	r5.xyz = r4.xyz * c30.zzz;
	r6.xzw = r5.xyz * r5.xyz;
	r6.xzw = r6.xzw * r6.xzw;
	r1.w = dot(r6.xzw, c14.xyz);
	r2.w = r1.w + c16.z;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = ((r2.w >= 0.0) ? r1.w : c16.w);
	r2.w = dot(r5.xyz, c14.xyz);
	r6.xzw = r2.www * r6.xzw;
	r4.xyz = (c30.zzz * -r4.xyz) + r2.www;
	r4.xyz = (-c103.www * r4.xyz) + r5.xyz;
	r6.xzw = (r6.xzw * r1.www) + -r5.xyz;
	r6.xzw = (c103.www * r6.xzw) + r5.xyz;
	r4.xyz = ((c103.w >= 0.0) ? r6.xzw : r4.xyz);
	r1.w = abs(c103.w);
	r4.xyz = ((-r1.w >= 0.0) ? r5.xyz : r4.xyz);
	r5.xyz = r12.xyz + -c103.xxx;
	r5.xyz = clamp(r5.xyz * c103.yyy, float3(0.0), float3(1.0));
	r5.xyz = (r4.xyz * r5.xyz) + -r4.xyz;
	r4.xyz = (c101.xxx * r5.xyz) + r4.xyz;
	r5.xyz = (r4.xyz * r4.xyz) + -r4.xyz;
	r4.xyz = (c103.zzz * r5.xyz) + r4.xyz;
	r1.xyz = r1.xyz * r4.xyz;
	r1.xyz = (r3.xyz * r0.xxx) + r1.xyz;
	r1.xyz = r6.yyy * r1.xyz;
	r0.xyz = r0.yzw * r1.xyz;
	r0.xyz = (r2.xyz * r12.xyz) + r0.xyz;
	r0.xyz = (r10.xyz * r7.yzw) + r0.xyz;
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
	#undef c22
	#undef c23
	#undef c30
	#undef c33
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

