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
	texture2d<float> s10_texture [[texture(10)]],
	sampler s10 [[sampler(10)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(0.159154935, 0.5, 6.283185478, -3.141592739); (void) c0;
	const float4 c2 = float4(0.57735002, 1.0, 2.0, -1.0); (void) c2;
	const float4 c13 = float4(0.298999992, 0.587000012, 0.114, -0.000001); (void) c13;
	const float4 c14 = float4(-2.0, 3.0, 1000000.0, 0.0); (void) c14;
	const float4 c15 = float4(0.0, 1.0, -0.300000011, -3.333333253); (void) c15;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	float4 r7;
	float4 r8;
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
	#define c29 uniforms.uniforms_float4[14]
	#define c30 uniforms.uniforms_float4[15]
	#define c101 uniforms.uniforms_float4[16]
	#define c102 uniforms.uniforms_float4[17]
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
	r0.xyz = c13.xyz;
	r0.x = dot(c102.xyz, r0.xyz);
	r0.y = r0.x + c13.w;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = ((r0.y >= 0.0) ? r0.x : c14.z);
	r0.w = c12.w;
	r0.y = (r0.w * c0.x) + c0.y;
	r0.y = fract(r0.y);
	r0.y = (r0.y * c0.z) + c0.w;
	r1.xy = float2(cos(r0.y), sin(r0.y));
	r2 = s0_texture.sample(s0, v0.xy);
	r0.yzw = r2.zxy * c2.xxx;
	r0.yzw = (r2.zxy * c2.xxx) + -r0.wyz;
	r0.yzw = r1.yyy * r0.yzw;
	r0.yzw = (r2.xyz * r1.xxx) + r0.yzw;
	r1.x = -r1.x + c2.y;
	r1.y = dot(c2.xxx, r2.xyz);
	r1.y = r1.y * c2.x;
	r0.yzw = (r1.yyy * r1.xxx) + r0.yzw;
	r1.x = abs(c12.w);
	r0.yzw = ((-r1.x >= 0.0) ? r2.xyz : r0.yzw);
	r1.x = dot(r0.yzw, c13.xyz);
	r1.xyz = r1.xxx * c102.xyz;
	r1.xyz = (r1.xyz * r0.xxx) + -r0.yzw;
	r1.xyz = (c102.www * r1.xyz) + r0.yzw;
	r0.x = clamp(c107.w + v6.w, 0.0, 1.0);
	r1.xyz = (r1.xyz * r0.xxx) + -r0.yzw;
	r3 = s1_texture.sample(s1, v0.xy);
	r2.xyz = (r3.xyz * c2.zzz) + c2.www;
	r3.x = dot(v2.xyz, r2.xyz);
	r3.y = dot(v3.xyz, r2.xyz);
	r3.z = dot(v4.xyz, r2.xyz);
	r2.xyz = normalize(r3.xyz);
	r3.x = ((r2.x >= 0.0) ? c15.x : c15.y);
	r3.y = ((r2.y >= 0.0) ? c15.x : c15.y);
	r3.z = ((r2.z >= 0.0) ? c15.x : c15.y);
	r4.xyz = r2.xyz * r2.xyz;
	r3.xyz = r3.xyz * r4.xyz;
	r5.xyz = r3.xxx * c5.xyz;
	r6.x = ((r2.x >= 0.0) ? c15.y : c15.x);
	r6.y = ((r2.y >= 0.0) ? c15.y : c15.x);
	r6.z = ((r2.z >= 0.0) ? c15.y : c15.x);
	r4.xyz = r4.xyz * r6.xyz;
	r5.xyz = (r4.xxx * c4.xyz) + r5.xyz;
	r4.xyw = (r4.yyy * c6.xyz) + r5.xyz;
	r3.xyw = (r3.yyy * c7.xyz) + r4.xyw;
	r3.xyw = (r4.zzz * c8.xyz) + r3.xyw;
	r3.xyz = (r3.zzz * c9.xyz) + r3.xyw;
	r4.xyz = c21.xyz + -v5.xyz;
	r5.xyz = normalize(r4.xyz);
	r0.x = clamp(dot(r2.xyz, r5.xyz), 0.0, 1.0);
	r1.w = (r0.x * r0.x) + r0.x;
	r1.w = r1.w * c0.y;
	r4.xyz = c20.xyz * v1.xxx;
	r3.xyz = (r4.xyz * r1.www) + r3.xyz;
	r6 = s10_texture.sample(s10, v0.xy);
	r1.w = r6.y * c101.w;
	r7.xyz = (r0.yzw * r1.www) + -c106.xyz;
	r1.w = clamp(r1.w, 0.0, 1.0);
	r7.xyz = (r1.www * r7.xyz) + c106.xyz;
	r8.xyz = c3.xyz + -v5.xyz;
	r1.w = dot(r8.xyz, r8.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r5.xyz = (r8.xyz * r1.www) + r5.xyz;
	r8.xyz = r1.www * r8.xyz;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = clamp((r1.w * c19.w) + c19.x, 0.0, 1.0);
	r3.w = min(r1.w, c19.z);
	r1.w = r3.w * r3.w;
	r3.w = clamp(dot(r2.xyz, r8.xyz), 0.0, 1.0);
	r3.w = -r3.w + c2.y;
	r8.xyz = normalize(r5.xyz);
	r2.x = clamp(dot(r2.xyz, r8.xyz), 0.0, 1.0);
	r2.y = r0.x * r2.x;
	r4.w = pow(abs(r2.x), c10.z);
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r2.x = pow(abs(r3.w), c105.x);
	r2.x = r2.x * r2.y;
	r2.x = r0.x * r2.x;
	r0.x = r0.x * r4.w;
	r5.xyz = r4.xyz * r0.xxx;
	r2.xyz = r4.xyz * r2.xxx;
	r4.xyz = r2.www * r5.xyz;
	r5.y = c2.y;
	r0.x = (v6.w * c11.w) + r5.y;
	r2.w = r6.x * c105.y;
	r0.x = r0.x * r2.w;
	r2.xyz = r0.xxx * r2.xyz;
	r5.xyz = (r2.xyz * r7.xyz) + r3.xyz;
	r3.xyz = r3.xyz + v6.xyz;
	r0.x = dot(r5.xyz, c13.xyz);
	r0.x = r0.x + c15.z;
	r0.x = clamp(r0.x * c15.w, 0.0, 1.0);
	r2.w = (r0.x * c14.x) + c14.y;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r2.w;
	r1.xyz = (r0.xxx * r1.xyz) + r0.yzw;
	r0.xyz = r0.yzw + c2.www;
	r0.xyz = (r6.yyy * r0.xyz) + c2.yyy;
	r1.xyz = r6.zzz * r1.xyz;
	r0.w = mix(c10.x, c10.y, r6.y);
	r4.xyz = r0.www * r4.xyz;
	r0.w = (r3.w * -r3.w) + c0.y;
	r2.w = r3.w * r3.w;
	r3.w = r2.w + r2.w;
	r2.w = (r2.w * c2.z) + c2.w;
	r4.w = mix(c12.y, c12.z, r2.w);
	r2.w = -c12.x + c12.y;
	r2.w = (r3.w * r2.w) + c12.x;
	r0.w = ((r0.w >= 0.0) ? r2.w : r4.w);
	r4.xyz = r0.www * r4.xyz;
	r0.xyz = r0.xyz * r4.xyz;
	r0.xyz = (r1.xyz * r3.xyz) + r0.xyz;
	r0.xyz = (r2.xyz * r7.xyz) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	oC0.xyz = (r1.www * r0.xyz) + r1.xyz;
	oC0.w = c1.w;
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
	#undef c29
	#undef c30
	#undef c101
	#undef c102
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

