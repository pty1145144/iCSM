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
	const float4 c0 = float4(0.159154935, 0.5, 6.283185478, -3.141592739); (void) c0;
	const float4 c2 = float4(0.57735002, 1.0, 2.0, -1.0); (void) c2;
	const float4 c13 = float4(0.298999992, 0.587000012, 0.114, -0.300000011); (void) c13;
	const float4 c14 = float4(-3.333333253, -2.0, 3.0, 0.0); (void) c14;
	const float4 c15 = float4(0.0, 1.0, -0.000001, 1000000.0); (void) c15;
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
	#define c30 uniforms.uniforms_float4[16]
	#define c101 uniforms.uniforms_float4[17]
	#define c102 uniforms.uniforms_float4[18]
	#define c103 uniforms.uniforms_float4[19]
	#define c104 uniforms.uniforms_float4[20]
	#define c105 uniforms.uniforms_float4[21]
	#define c106 uniforms.uniforms_float4[22]
	#define c107 uniforms.uniforms_float4[23]
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
	r0.x = abs(c103.w);
	r0.yzw = c3.xyz + -v5.xyz;
	r1.x = dot(r0.yzw, r0.yzw);
	r1.x = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r1.yzw = r0.yzw * r1.xxx;
	r2 = s1_texture.sample(s1, v0.xy);
	r2.xyz = (r2.xyz * c2.zzz) + c2.www;
	r3.x = dot(v2.xyz, r2.xyz);
	r3.y = dot(v3.xyz, r2.xyz);
	r3.z = dot(v4.xyz, r2.xyz);
	r2.xyz = normalize(r3.xyz);
	r3.x = dot(r2.xyz, r2.xyz);
	r3.xyz = r1.yzw * r3.xxx;
	r4.z = dot(r1.yzw, r2.xyz);
	r1.y = r4.z + r4.z;
	r4.z = clamp(r4.z, 0.0, 1.0);
	r1.yzw = (r1.yyy * r2.xyz) + -r3.xyz;
	r3 = s6_texture.sample(s6, r1.yzw);
	r1.yzw = r3.xyz * c30.zzz;
	r5.xyz = r1.yzw * r1.yzw;
	r5.xyz = r5.xyz * r5.xyz;
	r3.w = dot(r5.xyz, c13.xyz);
	r5.w = r3.w + c15.z;
	r3.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r3.w = ((r5.w >= 0.0) ? r3.w : c15.w);
	r5.w = dot(r1.yzw, c13.xyz);
	r5.xyz = r5.www * r5.xyz;
	r3.xyz = (c30.zzz * -r3.xyz) + r5.www;
	r3.xyz = (-c103.www * r3.xyz) + r1.yzw;
	r5.xyz = (r5.xyz * r3.www) + -r1.yzw;
	r5.xyz = (c103.www * r5.xyz) + r1.yzw;
	r3.xyz = ((c103.w >= 0.0) ? r5.xyz : r3.xyz);
	r1.yzw = ((-r0.x >= 0.0) ? r1.yzw : r3.xyz);
	r3.x = ((r2.x >= 0.0) ? c15.x : c15.y);
	r3.y = ((r2.y >= 0.0) ? c15.x : c15.y);
	r3.z = ((r2.z >= 0.0) ? c15.x : c15.y);
	r5.xyz = r2.xyz * r2.xyz;
	r3.xyz = r3.xyz * r5.xyz;
	r6.xyz = r3.xxx * c5.xyz;
	r7.x = ((r2.x >= 0.0) ? c15.y : c15.x);
	r7.y = ((r2.y >= 0.0) ? c15.y : c15.x);
	r7.z = ((r2.z >= 0.0) ? c15.y : c15.x);
	r5.xyz = r5.xyz * r7.xyz;
	r6.xyz = (r5.xxx * c4.xyz) + r6.xyz;
	r5.xyw = (r5.yyy * c6.xyz) + r6.xyz;
	r3.xyw = (r3.yyy * c7.xyz) + r5.xyw;
	r3.xyw = (r5.zzz * c8.xyz) + r3.xyw;
	r3.xyz = (r3.zzz * c9.xyz) + r3.xyw;
	r5.xyz = c21.xyz + -v5.xyz;
	r6.xyz = normalize(r5.xyz);
	r0.x = clamp(dot(r2.xyz, r6.xyz), 0.0, 1.0);
	r5.xyz = (r0.yzw * r1.xxx) + r6.xyz;
	r6.xyz = normalize(r5.xyz);
	r4.y = clamp(dot(r2.xyz, r6.xyz), 0.0, 1.0);
	r3.w = (r0.x * r0.x) + r0.x;
	r3.w = r3.w * c0.y;
	r5.xyz = c20.xyz * v1.xxx;
	r3.xyz = (r5.xyz * r3.www) + r3.xyz;
	r6.xyz = c23.xyz + -v5.xyz;
	r7.xyz = normalize(r6.xyz);
	r3.w = clamp(dot(r2.xyz, r7.xyz), 0.0, 1.0);
	r6.xyz = (r0.yzw * r1.xxx) + r7.xyz;
	r7.xyz = normalize(r6.xyz);
	r4.x = clamp(dot(r2.xyz, r7.xyz), 0.0, 1.0);
	r5.w = (r3.w * r3.w) + r3.w;
	r5.w = r5.w * c0.y;
	r6.xyz = c22.xyz * v1.yyy;
	r3.xyz = (r6.xyz * r5.www) + r3.xyz;
	r7.xyz = r3.xyz + v6.xyz;
	r8.xyz = r7.xyz + -c103.xxx;
	r8.xyz = clamp(r8.xyz * c103.yyy, float3(0.0), float3(1.0));
	r8.xyz = (r1.yzw * r8.xyz) + -r1.yzw;
	r1.yzw = (c101.xxx * r8.xyz) + r1.yzw;
	r8.xyz = (r1.yzw * r1.yzw) + -r1.yzw;
	r1.yzw = (c103.zzz * r8.xyz) + r1.yzw;
	r8.xyz = r2.www * c104.xyz;
	r1.yzw = r1.yzw * r8.xyz;
	r5.w = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r3.w = r3.w * r4.x;
	r5.w = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r8 = s10_texture.sample(s10, v0.xy);
	r4.w = r8.w;
	r9 = s7_texture.sample(s7, r4.xw);
	r9.xyz = r5.www * r9.xyz;
	r9.xyz = r6.xyz * r9.xyz;
	r4.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r0.x = r0.x * r4.y;
	r10 = s7_texture.sample(s7, r4.yw);
	r11 = s4_texture.sample(s4, r4.zw);
	r4.y = -r4.z + c2.y;
	r6.w = pow(abs(r4.y), c105.x);
	r0.x = r0.x * r6.w;
	r4.x = ((r4.x == 0.0) ? FLT_MAX : 1.0 / r4.x);
	r4.yzw = r4.xxx * r10.xyz;
	r0.x = r0.x * r4.x;
	r4.xyz = (r4.yzw * r5.xyz) + r9.xyz;
	r4.xyz = r2.www * r4.xyz;
	r2.w = mix(c10.x, c10.y, r8.y);
	r1.yzw = (r4.xyz * r2.www) + r1.yzw;
	r1.yzw = r11.yyy * r1.yzw;
	r4.xy = c0.xy;
	r2.w = (c12.w * r4.x) + r4.y;
	r2.w = fract(r2.w);
	r2.w = (r2.w * c0.z) + c0.w;
	r4.xy = float2(cos(r2.w), sin(r2.w));
	r9 = s0_texture.sample(s0, v0.xy);
	r10.xyz = r9.zxy * c2.xxx;
	r10.xyz = (r9.zxy * c2.xxx) + -r10.zxy;
	r4.yzw = r4.yyy * r10.xyz;
	r4.yzw = (r9.xyz * r4.xxx) + r4.yzw;
	r2.w = -r4.x + c2.y;
	r4.x = dot(c2.xxx, r9.xyz);
	r4.x = r4.x * c2.x;
	r4.xyz = (r4.xxx * r2.www) + r4.yzw;
	r2.w = abs(c12.w);
	r4.xyz = ((-r2.w >= 0.0) ? r9.xyz : r4.xyz);
	r9.xyz = r4.xyz + c2.www;
	r9.xyz = (r8.yyy * r9.xyz) + c2.yyy;
	r1.yzw = r1.yzw * r9.xyz;
	r9.xyz = c13.xyz;
	r2.w = dot(c102.xyz, r9.xyz);
	r4.w = r2.w + c15.z;
	r2.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r2.w = ((r4.w >= 0.0) ? r2.w : c15.w);
	r4.w = dot(r4.xyz, c13.xyz);
	r9.xyz = r4.www * c102.xyz;
	r9.xyz = (r9.xyz * r2.www) + -r4.xyz;
	r9.xyz = (c102.www * r9.xyz) + r4.xyz;
	r2.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r9.xyz = (r9.xyz * r2.www) + -r4.xyz;
	r2.w = r3.w * r6.w;
	r2.w = r5.w * r2.w;
	r6.xyz = r6.xyz * r2.www;
	r5.xyz = (r0.xxx * r5.xyz) + r6.xyz;
	r6.y = c2.y;
	r0.x = (v6.w * c11.w) + r6.y;
	r2.w = r8.x * c105.y;
	r0.x = r0.x * r2.w;
	r5.xyz = r0.xxx * r5.xyz;
	r0.x = r8.y * c101.w;
	r6.xyz = (r4.xyz * r0.xxx) + -c106.xyz;
	r0.x = clamp(r0.x, 0.0, 1.0);
	r6.xyz = (r0.xxx * r6.xyz) + c106.xyz;
	r3.xyz = (r5.xyz * r6.xyz) + r3.xyz;
	r0.x = dot(r3.xyz, c13.xyz);
	r0.x = r0.x + c13.w;
	r0.x = clamp(r0.x * c14.x, 0.0, 1.0);
	r2.w = (r0.x * c14.y) + c14.z;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r2.w;
	r3.xyz = (r0.xxx * r9.xyz) + r4.xyz;
	r3.xyz = r8.zzz * r3.xyz;
	r1.yzw = (r3.xyz * r7.xyz) + r1.yzw;
	r1.yzw = (r5.xyz * r6.xyz) + r1.yzw;
	r3.x = v2.w;
	r3.y = v3.w;
	r3.z = v4.w;
	r0.xyz = (r0.yzw * r1.xxx) + r3.xyz;
	r0.w = clamp(dot(r2.xyz, r3.xyz), 0.0, 1.0);
	r3.xyz = normalize(r0.xyz);
	r0.x = clamp(dot(r2.xyz, r3.xyz), 0.0, 1.0);
	r0.x = r0.w * r0.x;
	r0.y = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r0.x = r6.w * r0.x;
	r0.x = r0.y * r0.x;
	r0.yzw = v6.www * v6.xyz;
	r0.yzw = r0.yzw * c107.xyz;
	r0.xyz = r0.yzw * r0.xxx;
	r0.xyz = (r0.xyz * r8.xxx) + r1.yzw;
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
	#undef c22
	#undef c23
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

