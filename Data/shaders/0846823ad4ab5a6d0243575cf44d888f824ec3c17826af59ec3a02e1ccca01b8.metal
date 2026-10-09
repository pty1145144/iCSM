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
	texturecube<float> s6_texture [[texture(6)]],
	sampler s6 [[sampler(6)]],
	texture2d<float> s8_texture [[texture(8)]],
	sampler s8 [[sampler(8)]],
	depth2d<float> s11_texture [[texture(11)]],
	sampler s11 [[sampler(11)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(0.159154935, 0.5, 6.283185478, -3.141592739); (void) c0;
	const float4 c2 = float4(0.57735002, 1.0, 2.0, -1.0); (void) c2;
	const float4 c11 = float4(-0.300000011, -3.333333253, -2.0, 3.0); (void) c11;
	const float4 c20 = float4(0.298999992, 0.587000012, 0.114, 1000000.0); (void) c20;
	const float4 c21 = float4(0.0, 1.0, -0.400000005, -0.000001); (void) c21;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	float4 r7;
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
	#define c19 uniforms.uniforms_float4[16]
	#define c28 uniforms.uniforms_float4[17]
	#define c30 uniforms.uniforms_float4[18]
	#define c101 uniforms.uniforms_float4[19]
	#define c102 uniforms.uniforms_float4[20]
	#define c103 uniforms.uniforms_float4[21]
	#define c104 uniforms.uniforms_float4[22]
	#define c107 uniforms.uniforms_float4[23]
	#define c109 uniforms.uniforms_float4[24]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define oC0 output.oC0
	r0.x = c19.y + -v4.z;
	r0.x = r0.x + -c2.z;
	oC0.w = clamp(r0.x * c19.w, 0.0, 1.0);
	r0 = s1_texture.sample(s1, v0.xy);
	r0.xyz = (r0.xyz * c2.zzz) + c2.www;
	r1.x = dot(v1.xyz, r0.xyz);
	r1.y = dot(v2.xyz, r0.xyz);
	r1.z = dot(v3.xyz, r0.xyz);
	r0.xyz = normalize(r1.xyz);
	r1.x = ((r0.x >= 0.0) ? c21.x : c21.y);
	r1.y = ((r0.y >= 0.0) ? c21.x : c21.y);
	r1.z = ((r0.z >= 0.0) ? c21.x : c21.y);
	r2.xyz = r0.xyz * r0.xyz;
	r1.xyz = r1.xyz * r2.xyz;
	r3.xyz = r1.xxx * c5.xyz;
	r4.x = ((r0.x >= 0.0) ? c21.y : c21.x);
	r4.y = ((r0.y >= 0.0) ? c21.y : c21.x);
	r4.z = ((r0.z >= 0.0) ? c21.y : c21.x);
	r2.xyz = r2.xyz * r4.xyz;
	r3.xyz = (r2.xxx * c4.xyz) + r3.xyz;
	r2.xyw = (r2.yyy * c6.xyz) + r3.xyz;
	r1.xyw = (r1.yyy * c7.xyz) + r2.xyw;
	r1.xyw = (r2.zzz * c8.xyz) + r1.xyw;
	r1.xyz = (r1.zzz * c9.xyz) + r1.xyw;
	r2 = (v4.xyzx * c21.yyyx) + c21.xxxy;
	r1.w = dot(r2, c18);
	r3.x = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r4.x = dot(r2, c15);
	r4.y = dot(r2, c16);
	r4.z = dot(r2, c17);
	r2.xyz = r3.xxx * r4.xyz;
	r3 = s8_texture.sample(s8, r2.xy);
	r3.xyz = ((-r1.w >= 0.0) ? c21.xxx : r3.xyz);
	r4.xyz = r3.xyz * c28.xyz;
	r2.w = c2.y;
	r2 = float4(s11_texture.sample_compare(s11, (r2.xyz).xy, (r2.xyz).z));
	r1.w = clamp(r2.x, 0.0, 1.0);
	r2.y = -r1.w + c2.y;
	r1.w = (c109.y * r2.y) + r1.w;
	r5.x = c2.y;
	r2.yzw = c14.xyz + -v4.xyz;
	r3.w = dot(r2.yzw, r2.yzw);
	r5.z = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r5.y = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r3.w = clamp(dot(c13.xyz, r5.xyz), 0.0, 1.0);
	r4.w = clamp(mix(r1.w, r2.x, r3.w), 0.0, 1.0);
	r4.xyz = r4.www * r4.xyz;
	r2.yzw = r2.yzw * r5.yyy;
	r1.w = ((r5.y == 0.0) ? FLT_MAX : 1.0 / r5.y);
	r1.w = r1.w + -c13.w;
	r4.w = dot(r2.yzw, r0.xyz);
	r5.x = clamp(r4.w + c28.w, 0.0, 1.0);
	r4.w = clamp(r4.w, 0.0, 1.0);
	r4.w = ((r4.w == 0.0) ? FLT_MAX : rsqrt(abs(r4.w)));
	r4.w = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r5.x = r3.w * r5.x;
	r4.xyz = r4.xyz * r5.xxx;
	r5.z = c21.z;
	r5.x = r5.z * c13.w;
	r5.x = ((r5.x == 0.0) ? FLT_MAX : 1.0 / r5.x);
	r1.w = clamp(r1.w * r5.x, 0.0, 1.0);
	r1.xyz = (r4.xyz * r1.www) + r1.xyz;
	r1.w = r1.w * r3.w;
	r4.xyz = r1.www * c28.xyz;
	r3.xyz = r3.xyz * r4.xyz;
	r4.xyz = r1.xyz + v5.xyz;
	r1.x = dot(r1.xyz, c20.xyz);
	r1.x = r1.x + c11.x;
	r1.x = clamp(r1.x * c11.y, 0.0, 1.0);
	r1.yzw = r4.xyz + -c103.xxx;
	r1.yzw = clamp(r1.yzw * c103.yyy, float3(0.0), float3(1.0));
	r5.x = dot(r0.xyz, r0.xyz);
	r5.yzw = c3.xyz + -v4.xyz;
	r6.x = dot(r5.yzw, r5.yzw);
	r6.x = ((r6.x == 0.0) ? FLT_MAX : rsqrt(abs(r6.x)));
	r6.yzw = r5.yzw * r6.xxx;
	r2.yzw = (r5.yzw * r6.xxx) + r2.yzw;
	r7.xyz = normalize(r2.yzw);
	r2.y = clamp(dot(r0.xyz, r7.xyz), 0.0, 1.0);
	r5.y = pow(abs(r2.y), c10.z);
	r2.y = r4.w * r5.y;
	r5.xyz = r5.xxx * r6.yzw;
	r2.z = dot(r0.xyz, r6.yzw);
	r2.w = r2.z + r2.z;
	r2.z = clamp(r2.z, 0.0, 1.0);
	r2.z = -r2.z + c2.y;
	r0.xyz = (r2.www * r0.xyz) + -r5.xyz;
	r5 = s6_texture.sample(s6, r0.xyz);
	r0.xyz = r5.xyz * c30.zzz;
	r6.xyz = r0.xyz * r0.xyz;
	r6.xyz = r6.xyz * r6.xyz;
	r2.w = dot(r6.xyz, c20.xyz);
	r4.w = r2.w + c21.w;
	r2.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r2.w = ((r4.w >= 0.0) ? r2.w : c20.w);
	r4.w = dot(r0.xyz, c20.xyz);
	r6.xyz = r4.www * r6.xyz;
	r5.xyz = (c30.zzz * -r5.xyz) + r4.www;
	r5.xyz = (-c103.www * r5.xyz) + r0.xyz;
	r6.xyz = (r6.xyz * r2.www) + -r0.xyz;
	r6.xyz = (c103.www * r6.xyz) + r0.xyz;
	r5.xyz = ((c103.w >= 0.0) ? r6.xyz : r5.xyz);
	r2.w = abs(c103.w);
	r0.xyz = ((-r2.w >= 0.0) ? r0.xyz : r5.xyz);
	r1.yzw = (r0.xyz * r1.yzw) + -r0.xyz;
	r0.xyz = (c101.xxx * r1.yzw) + r0.xyz;
	r1.yzw = (r0.xyz * r0.xyz) + -r0.xyz;
	r0.xyz = (c103.zzz * r1.yzw) + r0.xyz;
	r5 = s0_texture.sample(s0, v0.xy);
	r1.yzw = r5.www * c104.xyz;
	r0.xyz = r0.xyz * r1.yzw;
	r1.y = -r2.x + c2.y;
	r1.y = (c109.y * r1.y) + r2.x;
	r4.w = clamp(mix(r1.y, r2.x, r3.w), 0.0, 1.0);
	r1.yzw = r3.xyz * r4.www;
	r1.yzw = r1.yzw * r2.yyy;
	r1.yzw = r0.www * r1.yzw;
	r0.xyz = (r1.yzw * c10.xxx) + r0.xyz;
	r0.w = (r2.z * -r2.z) + c0.y;
	r1.y = r2.z * r2.z;
	r1.z = r1.y + r1.y;
	r1.y = (r1.y * c2.z) + c2.w;
	r2.x = mix(c12.y, c12.z, r1.y);
	r1.y = -c12.x + c12.y;
	r1.y = (r1.z * r1.y) + c12.x;
	r0.w = ((r0.w >= 0.0) ? r1.y : r2.x);
	r0.xyz = r0.www * r0.xyz;
	r1.yzw = r5.zxy * c2.xxx;
	r1.yzw = (r5.zxy * c2.xxx) + -r1.wyz;
	r0.w = c12.w;
	r0.w = (r0.w * c0.x) + c0.y;
	r0.w = fract(r0.w);
	r0.w = (r0.w * c0.z) + c0.w;
	r2.xy = float2(cos(r0.w), sin(r0.w));
	r1.yzw = r1.yzw * r2.yyy;
	r1.yzw = (r5.xyz * r2.xxx) + r1.yzw;
	r0.w = -r2.x + c2.y;
	r2.x = dot(c2.xxx, r5.xyz);
	r2.x = r2.x * c2.x;
	r1.yzw = (r2.xxx * r0.www) + r1.yzw;
	r0.w = abs(c12.w);
	r1.yzw = ((-r0.w >= 0.0) ? r5.xyz : r1.yzw);
	r0.w = dot(r1.yzw, c20.xyz);
	r2.xyz = r0.www * c102.xyz;
	r3.xyz = c20.xyz;
	r0.w = dot(c102.xyz, r3.xyz);
	r2.w = r0.w + c21.w;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r2.w >= 0.0) ? r0.w : c20.w);
	r2.xyz = (r2.xyz * r0.www) + -r1.yzw;
	r2.xyz = (c102.www * r2.xyz) + r1.yzw;
	r0.w = clamp(c107.w + v5.w, 0.0, 1.0);
	r2.xyz = (r2.xyz * r0.www) + -r1.yzw;
	r0.w = (r1.x * c11.z) + c11.w;
	r1.x = r1.x * r1.x;
	r0.w = r0.w * r1.x;
	r1.xyz = (r0.www * r2.xyz) + r1.yzw;
	r1.xyz = r1.xyz * c101.zzz;
	r0.xyz = (r1.xyz * r4.xyz) + r0.xyz;
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
	#undef c19
	#undef c28
	#undef c30
	#undef c101
	#undef c102
	#undef c103
	#undef c104
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

