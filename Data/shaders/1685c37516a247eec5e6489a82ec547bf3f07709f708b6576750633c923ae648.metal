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
	const float4 c0 = float4(2.0, -1.0, 0.0, 1.0); (void) c0;
	const float4 c11 = float4(0.159154935, 0.5, 6.283185478, -3.141592739); (void) c11;
	const float4 c20 = float4(0.57735002, -0.400000005, 5.0, -0.300000011); (void) c20;
	const float4 c21 = float4(0.298999992, 0.587000012, 0.114, -3.333333253); (void) c21;
	const float4 c22 = float4(-2.0, 3.0, -0.000001, 1000000.0); (void) c22;
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
	#define c29 uniforms.uniforms_float4[19]
	#define c30 uniforms.uniforms_float4[20]
	#define c101 uniforms.uniforms_float4[21]
	#define c102 uniforms.uniforms_float4[22]
	#define c107 uniforms.uniforms_float4[23]
	#define c109 uniforms.uniforms_float4[24]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	oC0.w = r0.w * c1.w;
	r1.xyz = r0.zxy * c20.xxx;
	r1.xyz = (r0.zxy * c20.xxx) + -r1.zxy;
	r2 = s3_texture.sample(s3, v0.xy);
	r1.w = r2.x * c12.w;
	r1.w = (r1.w * c11.x) + c11.y;
	r1.w = fract(r1.w);
	r1.w = (r1.w * c11.z) + c11.w;
	r3.xy = float2(cos(r1.w), sin(r1.w));
	r1.xyz = r1.xyz * r3.yyy;
	r1.xyz = (r0.xyz * r3.xxx) + r1.xyz;
	r1.w = -r3.x + c0.w;
	r2.z = dot(c20.xxx, r0.xyz);
	r2.z = r2.z * c20.x;
	r1.xyz = (r2.zzz * r1.www) + r1.xyz;
	r2.z = abs(c12.w);
	r1.w = c0.w;
	r0.w = r2.x;
	r0 = ((-r2.z >= 0.0) ? r0 : r1);
	r1.xyz = r0.xyz * r0.xyz;
	r1.xyz = r1.xyz * r1.xyz;
	r1.w = dot(r1.xyz, c21.xyz);
	r2.x = r1.w + c22.z;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = ((r2.x >= 0.0) ? r1.w : c22.w);
	r2.x = dot(r0.xyz, c21.xyz);
	r1.xyz = r1.xyz * r2.xxx;
	r3.xyz = mix(r0.xyz, r2.xxx, -c101.yyy);
	r1.xyz = (r1.xyz * r1.www) + -r0.xyz;
	r1.xyz = (c101.yyy * r1.xyz) + r0.xyz;
	r1.xyz = ((c101.y >= 0.0) ? r1.xyz : r3.xyz);
	r1.w = abs(c101.y);
	r1.xyz = ((-r1.w >= 0.0) ? r0.xyz : r1.xyz);
	r3 = s1_texture.sample(s1, v0.xy);
	r3.xyz = (r3.xyz * c0.xxx) + c0.yyy;
	r4.x = dot(v1.xyz, r3.xyz);
	r4.y = dot(v2.xyz, r3.xyz);
	r4.z = dot(v3.xyz, r3.xyz);
	r3.xyz = normalize(r4.xyz);
	r4.x = ((r3.x >= 0.0) ? c0.z : c0.w);
	r4.y = ((r3.y >= 0.0) ? c0.z : c0.w);
	r4.z = ((r3.z >= 0.0) ? c0.z : c0.w);
	r5.xyz = r3.xyz * r3.xyz;
	r4.xyz = r4.xyz * r5.xyz;
	r6.xyz = r4.xxx * c5.xyz;
	r7.x = ((r3.x >= 0.0) ? c0.w : c0.z);
	r7.y = ((r3.y >= 0.0) ? c0.w : c0.z);
	r7.z = ((r3.z >= 0.0) ? c0.w : c0.z);
	r5.xyz = r5.xyz * r7.xyz;
	r6.xyz = (r5.xxx * c4.xyz) + r6.xyz;
	r5.xyw = (r5.yyy * c6.xyz) + r6.xyz;
	r4.xyw = (r4.yyy * c7.xyz) + r5.xyw;
	r4.xyw = (r5.zzz * c8.xyz) + r4.xyw;
	r4.xyz = (r4.zzz * c9.xyz) + r4.xyw;
	r5 = (v4.xyzx * c0.wwwz) + c0.zzzw;
	r1.w = dot(r5, c18);
	r2.x = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r6.x = dot(r5, c15);
	r6.y = dot(r5, c16);
	r6.z = dot(r5, c17);
	r5.xyz = r2.xxx * r6.xyz;
	r6 = s8_texture.sample(s8, r5.xy);
	r6.xyz = ((-r1.w >= 0.0) ? c0.zzz : r6.xyz);
	r7.xyz = r6.xyz * c28.xyz;
	r5.w = c0.w;
	r5 = float4(s11_texture.sample_compare(s11, (r5.xyz).xy, (r5.xyz).z));
	r1.w = clamp(r5.x, 0.0, 1.0);
	r2.x = -r1.w + c0.w;
	r1.w = (c109.y * r2.x) + r1.w;
	r8.x = c0.w;
	r5.yzw = c14.xyz + -v4.xyz;
	r2.x = dot(r5.yzw, r5.yzw);
	r8.z = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r8.y = ((r2.x == 0.0) ? FLT_MAX : rsqrt(abs(r2.x)));
	r2.x = clamp(dot(c13.xyz, r8.xyz), 0.0, 1.0);
	r4.w = clamp(mix(r1.w, r5.x, r2.x), 0.0, 1.0);
	r7.xyz = r4.www * r7.xyz;
	r5.yzw = r5.yzw * r8.yyy;
	r1.w = ((r8.y == 0.0) ? FLT_MAX : 1.0 / r8.y);
	r1.w = r1.w + -c13.w;
	r2.z = dot(r5.yzw, r3.xyz);
	r4.w = clamp(r2.z + c28.w, 0.0, 1.0);
	r2.z = clamp(r2.z, 0.0, 1.0);
	r2.z = ((r2.z == 0.0) ? FLT_MAX : rsqrt(abs(r2.z)));
	r2.z = ((r2.z == 0.0) ? FLT_MAX : 1.0 / r2.z);
	r4.w = r2.x * r4.w;
	r7.xyz = r7.xyz * r4.www;
	r8.y = c20.y;
	r4.w = r8.y * c13.w;
	r4.w = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r1.w = clamp(r1.w * r4.w, 0.0, 1.0);
	r4.xyz = (r7.xyz * r1.www) + r4.xyz;
	r1.w = r1.w * r2.x;
	r7.xyz = r1.www * c28.xyz;
	r6.xyz = r6.xyz * r7.xyz;
	r1.w = dot(r4.xyz, c21.xyz);
	r4.xyz = r4.xyz + v5.xyz;
	r7.xy = r1.ww + -c2.xw;
	r1.w = r1.w + c20.w;
	r1.w = clamp(r1.w * c21.w, 0.0, 1.0);
	r7.zw = -c2.xw + c2.yz;
	r4.w = ((r7.z == 0.0) ? FLT_MAX : 1.0 / r7.z);
	r6.w = ((r7.w == 0.0) ? FLT_MAX : 1.0 / r7.w);
	r6.w = clamp(r6.w * r7.y, 0.0, 1.0);
	r4.w = clamp(r4.w * r7.x, 0.0, 1.0);
	r7.x = (r4.w * c22.x) + c22.y;
	r4.w = r4.w * r4.w;
	r4.w = r4.w * r7.x;
	r7.x = (r6.w * c22.x) + c22.y;
	r6.w = r6.w * r6.w;
	r6.w = r6.w * r7.x;
	r4.w = r4.w * r6.w;
	r0.w = r0.w * r4.w;
	r7.xyz = mix(r0.xyz, r1.xyz, r0.www);
	r0.xyz = r0.xyz + c0.yyy;
	r0.w = dot(r7.xyz, c21.xyz);
	r1.xyz = r0.www * c102.xyz;
	r8.xyz = c21.xyz;
	r0.w = dot(c102.xyz, r8.xyz);
	r4.w = r0.w + c22.z;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r4.w >= 0.0) ? r0.w : c22.w);
	r1.xyz = (r1.xyz * r0.www) + -r7.xyz;
	r1.xyz = (c102.www * r1.xyz) + r7.xyz;
	r0.w = clamp(c107.w + v5.w, 0.0, 1.0);
	r1.xyz = (r1.xyz * r0.www) + -r7.xyz;
	r0.w = (r1.w * c22.x) + c22.y;
	r1.w = r1.w * r1.w;
	r0.w = r0.w * r1.w;
	r1.xyz = (r0.www * r1.xyz) + r7.xyz;
	r7 = s10_texture.sample(s10, v0.xy);
	r1.xyz = r1.xyz * r7.zzz;
	r0.w = -r5.x + c0.w;
	r0.w = (c109.y * r0.w) + r5.x;
	r1.w = clamp(mix(r0.w, r5.x, r2.x), 0.0, 1.0);
	r6.xyz = r1.www * r6.xyz;
	r8.xyz = c3.xyz + -v4.xyz;
	r0.w = dot(r8.xyz, r8.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r5.xyz = (r8.xyz * r0.www) + r5.yzw;
	r8.xyz = r0.www * r8.xyz;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = clamp((r0.w * c19.w) + c19.x, 0.0, 1.0);
	r1.w = min(r0.w, c19.z);
	r0.w = r1.w * r1.w;
	r8.y = clamp(dot(r8.xyz, r3.xyz), 0.0, 1.0);
	r9.xyz = normalize(r5.xyz);
	r1.w = clamp(dot(r3.xyz, r9.xyz), 0.0, 1.0);
	r3.z = c0.z;
	r2.x = ((-r2.y >= 0.0) ? r3.z : c10.w);
	r2.y = -r2.w + c0.w;
	r8.x = mix(r1.w, c0.w, r2.x);
	r8.z = r7.w;
	r5 = s7_texture.sample(s7, r8.xz);
	r9 = s4_texture.sample(s4, r8.yz);
	r1.w = r8.y * r8.y;
	r1.w = r1.w * r1.w;
	r1.w = r1.w * r2.y;
	r3.xyz = r1.www * v5.xyz;
	r3.xyz = r3.xyz * c20.zzz;
	r3.xyz = ((-r2.y >= 0.0) ? c0.zzz : r3.xyz);
	r1.w = mix(r9.y, c0.w, r2.y);
	r2.xyz = r2.zzz * r5.xyz;
	r2.xyz = (r2.xyz * r6.xyz) + r3.xyz;
	r2.xyz = r3.www * r2.xyz;
	r2.w = mix(c10.x, c10.y, r7.y);
	r0.xyz = (r7.yyy * r0.xyz) + c0.www;
	r2.xyz = r2.www * r2.xyz;
	r2.xyz = r1.www * r2.xyz;
	r0.xyz = r0.xyz * r2.xyz;
	r0.xyz = (r1.xyz * r4.xyz) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	oC0.xyz = (r0.www * r0.xyz) + r1.xyz;
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
	#undef c29
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

