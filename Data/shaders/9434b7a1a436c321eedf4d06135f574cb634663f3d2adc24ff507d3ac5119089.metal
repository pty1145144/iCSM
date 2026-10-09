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
	#define c20 uniforms.uniforms_float4[11]
	#define c21 uniforms.uniforms_float4[12]
	#define c30 uniforms.uniforms_float4[13]
	#define c101 uniforms.uniforms_float4[14]
	#define c102 uniforms.uniforms_float4[15]
	#define c103 uniforms.uniforms_float4[16]
	#define c104 uniforms.uniforms_float4[17]
	#define c105 uniforms.uniforms_float4[18]
	#define c106 uniforms.uniforms_float4[19]
	#define c107 uniforms.uniforms_float4[20]
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
	r0.w = abs(c103.w);
	r1.xyz = c3.xyz + -v5.xyz;
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r2.xyz = r1.www * r1.xyz;
	r3 = s1_texture.sample(s1, v0.xy);
	r3.xyz = (r3.xyz * c2.zzz) + c2.www;
	r4.x = dot(v2.xyz, r3.xyz);
	r4.y = dot(v3.xyz, r3.xyz);
	r4.z = dot(v4.xyz, r3.xyz);
	r3.xyz = normalize(r4.xyz);
	r2.w = dot(r3.xyz, r3.xyz);
	r4.xyz = r2.xyz * r2.www;
	r2.y = dot(r2.xyz, r3.xyz);
	r2.w = r2.y + r2.y;
	r2.y = clamp(r2.y, 0.0, 1.0);
	r4.xyz = (r2.www * r3.xyz) + -r4.xyz;
	r4 = s6_texture.sample(s6, r4.xyz);
	r5.xyz = r4.xyz * c30.zzz;
	r6.xyz = r5.xyz * r5.xyz;
	r6.xyz = r6.xyz * r6.xyz;
	r2.w = dot(r6.xyz, c13.xyz);
	r4.w = r2.w + c15.z;
	r2.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r2.w = ((r4.w >= 0.0) ? r2.w : c15.w);
	r4.w = dot(r5.xyz, c13.xyz);
	r6.xyz = r4.www * r6.xyz;
	r4.xyz = (c30.zzz * -r4.xyz) + r4.www;
	r4.xyz = (-c103.www * r4.xyz) + r5.xyz;
	r6.xyz = (r6.xyz * r2.www) + -r5.xyz;
	r6.xyz = (c103.www * r6.xyz) + r5.xyz;
	r4.xyz = ((c103.w >= 0.0) ? r6.xyz : r4.xyz);
	r4.xyz = ((-r0.w >= 0.0) ? r5.xyz : r4.xyz);
	r5.x = ((r3.x >= 0.0) ? c15.x : c15.y);
	r5.y = ((r3.y >= 0.0) ? c15.x : c15.y);
	r5.z = ((r3.z >= 0.0) ? c15.x : c15.y);
	r6.xyz = r3.xyz * r3.xyz;
	r5.xyz = r5.xyz * r6.xyz;
	r7.xyz = r5.xxx * c5.xyz;
	r8.x = ((r3.x >= 0.0) ? c15.y : c15.x);
	r8.y = ((r3.y >= 0.0) ? c15.y : c15.x);
	r8.z = ((r3.z >= 0.0) ? c15.y : c15.x);
	r6.xyz = r6.xyz * r8.xyz;
	r7.xyz = (r6.xxx * c4.xyz) + r7.xyz;
	r6.xyw = (r6.yyy * c6.xyz) + r7.xyz;
	r5.xyw = (r5.yyy * c7.xyz) + r6.xyw;
	r5.xyw = (r6.zzz * c8.xyz) + r5.xyw;
	r5.xyz = (r5.zzz * c9.xyz) + r5.xyw;
	r6.xyz = c21.xyz + -v5.xyz;
	r7.xyz = normalize(r6.xyz);
	r0.w = clamp(dot(r3.xyz, r7.xyz), 0.0, 1.0);
	r6.xyz = (r1.xyz * r1.www) + r7.xyz;
	r7.xyz = normalize(r6.xyz);
	r2.x = clamp(dot(r3.xyz, r7.xyz), 0.0, 1.0);
	r2.w = (r0.w * r0.w) + r0.w;
	r2.w = r2.w * c0.y;
	r6.xyz = c20.xyz * v1.xxx;
	r5.xyz = (r6.xyz * r2.www) + r5.xyz;
	r7.xyz = r5.xyz + v6.xyz;
	r8.xyz = r7.xyz + -c103.xxx;
	r8.xyz = clamp(r8.xyz * c103.yyy, float3(0.0), float3(1.0));
	r8.xyz = (r4.xyz * r8.xyz) + -r4.xyz;
	r4.xyz = (c101.xxx * r8.xyz) + r4.xyz;
	r8.xyz = (r4.xyz * r4.xyz) + -r4.xyz;
	r4.xyz = (c103.zzz * r8.xyz) + r4.xyz;
	r8.xyz = r3.www * c104.xyz;
	r4.xyz = r4.xyz * r8.xyz;
	r2.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = r0.w * r2.x;
	r2.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r8 = s10_texture.sample(s10, v0.xy);
	r2.z = r8.w;
	r9 = s7_texture.sample(s7, r2.xz);
	r10 = s4_texture.sample(s4, r2.yz);
	r2.x = -r2.y + c2.y;
	r4.w = pow(abs(r2.x), c105.x);
	r2.xyz = r2.www * r9.xyz;
	r2.xyz = r6.xyz * r2.xyz;
	r2.xyz = r3.www * r2.xyz;
	r3.w = mix(c10.x, c10.y, r8.y);
	r2.xyz = (r2.xyz * r3.www) + r4.xyz;
	r2.xyz = r10.yyy * r2.xyz;
	r4.xyz = r0.zxy * c2.xxx;
	r4.xyz = (r0.zxy * c2.xxx) + -r4.zxy;
	r9.xy = c0.xy;
	r3.w = (c12.w * r9.x) + r9.y;
	r3.w = fract(r3.w);
	r3.w = (r3.w * c0.z) + c0.w;
	r9.xy = float2(cos(r3.w), sin(r3.w));
	r4.xyz = r4.xyz * r9.yyy;
	r4.xyz = (r0.xyz * r9.xxx) + r4.xyz;
	r3.w = -r9.x + c2.y;
	r5.w = dot(c2.xxx, r0.xyz);
	r5.w = r5.w * c2.x;
	r4.xyz = (r5.www * r3.www) + r4.xyz;
	r3.w = abs(c12.w);
	r0.xyz = ((-r3.w >= 0.0) ? r0.xyz : r4.xyz);
	r4.xyz = r0.xyz + c2.www;
	r4.xyz = (r8.yyy * r4.xyz) + c2.yyy;
	r2.xyz = r2.xyz * r4.xyz;
	r4.xyz = c13.xyz;
	r3.w = dot(c102.xyz, r4.xyz);
	r4.x = r3.w + c15.z;
	r3.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r3.w = ((r4.x >= 0.0) ? r3.w : c15.w);
	r4.x = dot(r0.xyz, c13.xyz);
	r4.xyz = r4.xxx * c102.xyz;
	r4.xyz = (r4.xyz * r3.www) + -r0.xyz;
	r4.xyz = (c102.www * r4.xyz) + r0.xyz;
	r3.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r4.xyz = (r4.xyz * r3.www) + -r0.xyz;
	r0.w = r0.w * r4.w;
	r0.w = r2.w * r0.w;
	r6.xyz = r6.xyz * r0.www;
	r9.y = c2.y;
	r0.w = (v6.w * c11.w) + r9.y;
	r2.w = r8.x * c105.y;
	r0.w = r0.w * r2.w;
	r6.xyz = r0.www * r6.xyz;
	r0.w = r8.y * c101.w;
	r9.xyz = (r0.xyz * r0.www) + -c106.xyz;
	r0.w = clamp(r0.w, 0.0, 1.0);
	r9.xyz = (r0.www * r9.xyz) + c106.xyz;
	r5.xyz = (r6.xyz * r9.xyz) + r5.xyz;
	r0.w = dot(r5.xyz, c13.xyz);
	r0.w = r0.w + c13.w;
	r0.w = clamp(r0.w * c14.x, 0.0, 1.0);
	r2.w = (r0.w * c14.y) + c14.z;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r2.w;
	r0.xyz = (r0.www * r4.xyz) + r0.xyz;
	r0.xyz = r8.zzz * r0.xyz;
	r0.xyz = (r0.xyz * r7.xyz) + r2.xyz;
	r0.xyz = (r6.xyz * r9.xyz) + r0.xyz;
	r2.x = v2.w;
	r2.y = v3.w;
	r2.z = v4.w;
	r1.xyz = (r1.xyz * r1.www) + r2.xyz;
	r0.w = clamp(dot(r3.xyz, r2.xyz), 0.0, 1.0);
	r2.xyz = normalize(r1.xyz);
	r1.x = clamp(dot(r3.xyz, r2.xyz), 0.0, 1.0);
	r1.x = r0.w * r1.x;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r1.x = r4.w * r1.x;
	r0.w = r0.w * r1.x;
	r1.xyz = v6.www * v6.xyz;
	r1.xyz = r1.xyz * c107.xyz;
	r1.xyz = r0.www * r1.xyz;
	r0.xyz = (r1.xyz * r8.xxx) + r0.xyz;
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
	#undef c20
	#undef c21
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

