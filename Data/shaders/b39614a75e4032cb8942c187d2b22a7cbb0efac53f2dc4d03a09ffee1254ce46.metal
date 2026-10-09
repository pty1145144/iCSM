#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[33];
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
	const float4 c0 = float4(0.159154935, 0.5, 6.283185478, -3.141592739); (void) c0;
	const float4 c2 = float4(0.57735002, 1.0, 2.0, -1.0); (void) c2;
	const float4 c19 = float4(0.298999992, 0.587000012, 0.114, 1000000.0); (void) c19;
	const float4 c26 = float4(-0.300000011, -3.333333253, -2.0, 3.0); (void) c26;
	const float4 c27 = float4(0.0, 1.0, -0.400000005, -0.000001); (void) c27;
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
	float4 r19;
	float4 r20;
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
	#define c103 uniforms.uniforms_float4[27]
	#define c104 uniforms.uniforms_float4[28]
	#define c105 uniforms.uniforms_float4[29]
	#define c106 uniforms.uniforms_float4[30]
	#define c107 uniforms.uniforms_float4[31]
	#define c109 uniforms.uniforms_float4[32]
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
	r1.z = c27.z;
	r0.w = r1.z * c13.w;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r1.xyz = c14.xyz + -v5.xyz;
	r1.w = dot(r1.xyz, r1.xyz);
	r2.y = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r2.z = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r1.w = r1.w + -c13.w;
	r0.w = clamp(r0.w * r1.w, 0.0, 1.0);
	r3 = s1_texture.sample(s1, v0.xy);
	r3.xyz = (r3.xyz * c2.zzz) + c2.www;
	r4.x = dot(v2.xyz, r3.xyz);
	r4.y = dot(v3.xyz, r3.xyz);
	r4.z = dot(v4.xyz, r3.xyz);
	r3.xyz = normalize(r4.xyz);
	r4.x = ((r3.x >= 0.0) ? c27.x : c27.y);
	r4.y = ((r3.y >= 0.0) ? c27.x : c27.y);
	r4.z = ((r3.z >= 0.0) ? c27.x : c27.y);
	r5.xyz = r3.xyz * r3.xyz;
	r4.xyz = r4.xyz * r5.xyz;
	r6.xyz = r4.xxx * c5.xyz;
	r7.x = ((r3.x >= 0.0) ? c27.y : c27.x);
	r7.y = ((r3.y >= 0.0) ? c27.y : c27.x);
	r7.z = ((r3.z >= 0.0) ? c27.y : c27.x);
	r5.xyz = r5.xyz * r7.xyz;
	r6.xyz = (r5.xxx * c4.xyz) + r6.xyz;
	r5.xyw = (r5.yyy * c6.xyz) + r6.xyz;
	r4.xyw = (r4.yyy * c7.xyz) + r5.xyw;
	r4.xyw = (r5.zzz * c8.xyz) + r4.xyw;
	r4.xyz = (r4.zzz * c9.xyz) + r4.xyw;
	r5.xyz = c20.xyz * v1.xxx;
	r6.xyz = c21.xyz + -v5.xyz;
	r7.xyz = normalize(r6.xyz);
	r1.w = clamp(dot(r3.xyz, r7.xyz), 0.0, 1.0);
	r2.w = (r1.w * r1.w) + r1.w;
	r2.w = r2.w * c0.y;
	r4.xyz = (r5.xyz * r2.www) + r4.xyz;
	r6.xyz = c22.xyz * v1.yyy;
	r8.xyz = c23.xyz + -v5.xyz;
	r9.xyz = normalize(r8.xyz);
	r2.w = clamp(dot(r3.xyz, r9.xyz), 0.0, 1.0);
	r4.w = (r2.w * r2.w) + r2.w;
	r4.w = r4.w * c0.y;
	r4.xyz = (r6.xyz * r4.www) + r4.xyz;
	r8.xyz = c24.xyz * v1.zzz;
	r10.xyz = c25.xyz + -v5.xyz;
	r11.xyz = normalize(r10.xyz);
	r4.w = clamp(dot(r3.xyz, r11.xyz), 0.0, 1.0);
	r5.w = (r4.w * r4.w) + r4.w;
	r5.w = r5.w * c0.y;
	r4.xyz = (r8.xyz * r5.www) + r4.xyz;
	r10.x = c20.w * v1.w;
	r10.y = c21.w * v1.w;
	r10.z = c22.w * v1.w;
	r12.x = c23.w + -v5.x;
	r12.y = c24.w + -v5.y;
	r12.z = c25.w + -v5.z;
	r13.xyz = normalize(r12.xyz);
	r5.w = clamp(dot(r3.xyz, r13.xyz), 0.0, 1.0);
	r6.w = (r5.w * r5.w) + r5.w;
	r6.w = r6.w * c0.y;
	r4.xyz = (r10.xyz * r6.www) + r4.xyz;
	r12 = (v5.xyzx * c27.yyyx) + c27.xxxy;
	r6.w = dot(r12, c18);
	r7.w = ((r6.w == 0.0) ? FLT_MAX : 1.0 / r6.w);
	r14.x = dot(r12, c15);
	r14.y = dot(r12, c16);
	r14.z = dot(r12, c17);
	r12.xyz = r7.www * r14.xyz;
	r14 = s8_texture.sample(s8, r12.xy);
	r14.xyz = ((-r6.w >= 0.0) ? c27.xxx : r14.xyz);
	r15.xyz = r14.xyz * c28.xyz;
	r12.w = c2.y;
	r12 = float4(s11_texture.sample_compare(s11, (r12.xyz).xy, (r12.xyz).z));
	r6.w = clamp(r12.x, 0.0, 1.0);
	r7.w = -r6.w + c2.y;
	r6.w = (c109.y * r7.w) + r6.w;
	r2.x = c2.y;
	r2.x = clamp(dot(c13.xyz, r2.xyz), 0.0, 1.0);
	r1.xyz = r1.xyz * r2.yyy;
	r7.w = clamp(mix(r6.w, r12.x, r2.x), 0.0, 1.0);
	r12.yzw = r7.www * r15.xyz;
	r2.y = dot(r1.xyz, r3.xyz);
	r2.z = clamp(r2.y + c28.w, 0.0, 1.0);
	r2.y = clamp(r2.y, 0.0, 1.0);
	r2.y = ((r2.y == 0.0) ? FLT_MAX : rsqrt(abs(r2.y)));
	r2.y = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r2.z = r2.z * r2.x;
	r12.yzw = r12.yzw * r2.zzz;
	r4.xyz = (r12.yzw * r0.www) + r4.xyz;
	r0.w = r0.w * r2.x;
	r12.yzw = r0.www * c28.xyz;
	r12.yzw = r12.yzw * r14.xyz;
	r14.xyz = r4.xyz + v6.xyz;
	r15.xyz = r14.xyz + -c103.xxx;
	r15.xyz = clamp(r15.xyz * c103.yyy, float3(0.0), float3(1.0));
	r0.w = abs(c103.w);
	r2.z = dot(r3.xyz, r3.xyz);
	r16.xyz = c3.xyz + -v5.xyz;
	r6.w = dot(r16.xyz, r16.xyz);
	r6.w = ((r6.w == 0.0) ? FLT_MAX : rsqrt(abs(r6.w)));
	r17.xyz = r6.www * r16.xyz;
	r18.xyz = r2.zzz * r17.xyz;
	r17.z = dot(r17.xyz, r3.xyz);
	r2.z = r17.z + r17.z;
	r17.z = clamp(r17.z, 0.0, 1.0);
	r18.xyz = (r2.zzz * r3.xyz) + -r18.xyz;
	r18 = s6_texture.sample(s6, r18.xyz);
	r19.xyz = r18.xyz * c30.zzz;
	r20.xyz = r19.xyz * r19.xyz;
	r20.xyz = r20.xyz * r20.xyz;
	r2.z = dot(r20.xyz, c19.xyz);
	r7.w = r2.z + c27.w;
	r2.z = ((r2.z == 0.0) ? FLT_MAX : 1.0 / r2.z);
	r2.z = ((r7.w >= 0.0) ? r2.z : c19.w);
	r7.w = dot(r19.xyz, c19.xyz);
	r20.xyz = r7.www * r20.xyz;
	r18.xyz = (c30.zzz * -r18.xyz) + r7.www;
	r18.xyz = (-c103.www * r18.xyz) + r19.xyz;
	r20.xyz = (r20.xyz * r2.zzz) + -r19.xyz;
	r20.xyz = (c103.www * r20.xyz) + r19.xyz;
	r18.xyz = ((c103.w >= 0.0) ? r20.xyz : r18.xyz);
	r18.xyz = ((-r0.w >= 0.0) ? r19.xyz : r18.xyz);
	r15.xyz = (r18.xyz * r15.xyz) + -r18.xyz;
	r15.xyz = (c101.xxx * r15.xyz) + r18.xyz;
	r18.xyz = (r15.xyz * r15.xyz) + -r15.xyz;
	r15.xyz = (c103.zzz * r18.xyz) + r15.xyz;
	r18.xyz = r3.www * c104.xyz;
	r15.xyz = r15.xyz * r18.xyz;
	r0.w = -r12.x + c2.y;
	r0.w = (c109.y * r0.w) + r12.x;
	r7.w = clamp(mix(r0.w, r12.x, r2.x), 0.0, 1.0);
	r12.xyz = r7.www * r12.yzw;
	r0.w = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r9.xyz = (r16.xyz * r6.www) + r9.xyz;
	r18.xyz = normalize(r9.xyz);
	r9.z = clamp(dot(r3.xyz, r18.xyz), 0.0, 1.0);
	r18 = s10_texture.sample(s10, v0.xy);
	r17.w = r18.w;
	r9.w = r17.w;
	r19 = s7_texture.sample(s7, r9.zw);
	r2.x = r2.w * r9.z;
	r19.xyz = r0.www * r19.xyz;
	r19.xyz = r6.xyz * r19.xyz;
	r2.z = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r2.z = ((r2.z == 0.0) ? FLT_MAX : 1.0 / r2.z);
	r7.xyz = (r16.xyz * r6.www) + r7.xyz;
	r20.xyz = normalize(r7.xyz);
	r17.x = clamp(dot(r3.xyz, r20.xyz), 0.0, 1.0);
	r7 = s7_texture.sample(s7, r17.xw);
	r1.w = r1.w * r17.x;
	r7.xyz = r2.zzz * r7.xyz;
	r7.xyz = (r7.xyz * r5.xyz) + r19.xyz;
	r2.w = ((r4.w == 0.0) ? FLT_MAX : rsqrt(abs(r4.w)));
	r2.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r11.xyz = (r16.xyz * r6.www) + r11.xyz;
	r19.xyz = normalize(r11.xyz);
	r9.y = clamp(dot(r3.xyz, r19.xyz), 0.0, 1.0);
	r11 = s7_texture.sample(s7, r9.yw);
	r4.w = r4.w * r9.y;
	r11.xyz = r2.www * r11.xyz;
	r7.xyz = (r11.xyz * r8.xyz) + r7.xyz;
	r11.xyz = (r16.xyz * r6.www) + r13.xyz;
	r1.xyz = (r16.xyz * r6.www) + r1.xyz;
	r13.xyz = normalize(r1.xyz);
	r17.y = clamp(dot(r3.xyz, r13.xyz), 0.0, 1.0);
	r13 = s7_texture.sample(s7, r17.yw);
	r16 = s4_texture.sample(s4, r17.zw);
	r1.x = -r17.z + c2.y;
	r6.w = pow(abs(r1.x), c105.x);
	r1.xyz = r2.yyy * r13.xyz;
	r13.xyz = normalize(r11.xyz);
	r9.x = clamp(dot(r3.xyz, r13.xyz), 0.0, 1.0);
	r11 = s7_texture.sample(s7, r9.xw);
	r2.y = r5.w * r9.x;
	r3.x = ((r5.w == 0.0) ? FLT_MAX : rsqrt(abs(r5.w)));
	r3.x = ((r3.x == 0.0) ? FLT_MAX : 1.0 / r3.x);
	r2.xy = r2.xy * r6.ww;
	r2.y = r3.x * r2.y;
	r3.xyz = r3.xxx * r11.xyz;
	r3.xyz = (r3.xyz * r10.xyz) + r7.xyz;
	r1.xyz = (r1.xyz * r12.xyz) + r3.xyz;
	r1.xyz = r3.www * r1.xyz;
	r3.x = mix(c10.x, c10.y, r18.y);
	r1.xyz = (r1.xyz * r3.xxx) + r15.xyz;
	r1.xyz = r16.yyy * r1.xyz;
	r3.xyz = r0.zxy * c2.xxx;
	r3.xyz = (r0.zxy * c2.xxx) + -r3.zxy;
	r7.xy = c0.xy;
	r3.w = (c12.w * r7.x) + r7.y;
	r3.w = fract(r3.w);
	r3.w = (r3.w * c0.z) + c0.w;
	r7.xy = float2(cos(r3.w), sin(r3.w));
	r3.xyz = r3.xyz * r7.yyy;
	r3.xyz = (r0.xyz * r7.xxx) + r3.xyz;
	r3.w = -r7.x + c2.y;
	r5.w = dot(c2.xxx, r0.xyz);
	r5.w = r5.w * c2.x;
	r3.xyz = (r5.www * r3.www) + r3.xyz;
	r3.w = abs(c12.w);
	r0.xyz = ((-r3.w >= 0.0) ? r0.xyz : r3.xyz);
	r3.xyz = r0.xyz + c2.www;
	r3.xyz = (r18.yyy * r3.xyz) + c2.yyy;
	r1.xyz = r1.xyz * r3.xyz;
	r0.w = r0.w * r2.x;
	r3.xyz = r6.xyz * r0.www;
	r0.w = r1.w * r6.w;
	r1.w = r4.w * r6.w;
	r1.w = r2.w * r1.w;
	r0.w = r2.z * r0.w;
	r2.xzw = (r0.www * r5.xyz) + r3.xyz;
	r2.xzw = (r1.www * r8.xyz) + r2.xzw;
	r2.xyz = (r2.yyy * r10.xyz) + r2.xzw;
	r3.y = c2.y;
	r0.w = (v6.w * c11.w) + r3.y;
	r1.w = r18.x * c105.y;
	r0.w = r0.w * r1.w;
	r2.xyz = r0.www * r2.xyz;
	r0.w = r18.y * c101.w;
	r3.xyz = (r0.xyz * r0.www) + -c106.xyz;
	r0.w = clamp(r0.w, 0.0, 1.0);
	r3.xyz = (r0.www * r3.xyz) + c106.xyz;
	r4.xyz = (r2.xyz * r3.xyz) + r4.xyz;
	r0.w = dot(r4.xyz, c19.xyz);
	r0.w = r0.w + c26.x;
	r0.w = clamp(r0.w * c26.y, 0.0, 1.0);
	r1.w = (r0.w * c26.z) + c26.w;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.w;
	r4.xyz = c19.xyz;
	r1.w = dot(c102.xyz, r4.xyz);
	r2.w = r1.w + c27.w;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = ((r2.w >= 0.0) ? r1.w : c19.w);
	r2.w = dot(r0.xyz, c19.xyz);
	r4.xyz = r2.www * c102.xyz;
	r4.xyz = (r4.xyz * r1.www) + -r0.xyz;
	r4.xyz = (c102.www * r4.xyz) + r0.xyz;
	r1.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r4.xyz = (r4.xyz * r1.www) + -r0.xyz;
	r0.xyz = (r0.www * r4.xyz) + r0.xyz;
	r0.xyz = r18.zzz * r0.xyz;
	r0.xyz = (r0.xyz * r14.xyz) + r1.xyz;
	r0.xyz = (r2.xyz * r3.xyz) + r0.xyz;
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
	#undef c103
	#undef c104
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

