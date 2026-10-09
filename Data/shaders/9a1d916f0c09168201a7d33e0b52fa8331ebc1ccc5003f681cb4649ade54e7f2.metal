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
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
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
	const float4 c0 = float4(0.5, 0.159154935, 6.283185478, -3.141592739); (void) c0;
	const float4 c2 = float4(0.57735002, 5.0, -0.000001, 1000000.0); (void) c2;
	const float4 c13 = float4(2.0, -1.0, 0.0, 1.0); (void) c13;
	const float4 c14 = float4(-3.333333253, -2.0, 3.0, 0.0); (void) c14;
	const float4 c15 = float4(0.298999992, 0.587000012, 0.114, -0.300000011); (void) c15;
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
	#define c22 uniforms.uniforms_float4[13]
	#define c23 uniforms.uniforms_float4[14]
	#define c24 uniforms.uniforms_float4[15]
	#define c25 uniforms.uniforms_float4[16]
	#define c30 uniforms.uniforms_float4[17]
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
	r0.xyz = c21.xyz + -v5.xyz;
	r1.xyz = normalize(r0.xyz);
	r0.xyz = c3.xyz + -v5.xyz;
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r2.xyz = r0.www * r0.xyz;
	r1.w = clamp(dot(r2.xyz, r1.xyz), 0.0, 1.0);
	r3 = s1_texture.sample(s1, v0.xy);
	r3.xyz = (r3.xyz * c13.xxx) + c13.yyy;
	r4.x = dot(v2.xyz, r3.xyz);
	r4.y = dot(v3.xyz, r3.xyz);
	r4.z = dot(v4.xyz, r3.xyz);
	r3.xyz = normalize(r4.xyz);
	r2.w = dot(r2.xyz, r3.xyz);
	r4.z = clamp(r2.w, 0.0, 1.0);
	r2.w = r2.w + r2.w;
	r5.x = r4.z * r4.z;
	r5.w = r5.x * r5.x;
	r6 = s3_texture.sample(s3, v0.xy);
	r6.y = -r6.w + c13.w;
	r6.w = r5.w * r6.y;
	r7.xyz = r6.www * v6.xyz;
	r5.xyz = r7.xyz * c2.yyy;
	r5 = ((-r6.y >= 0.0) ? c13.zzzz : r5);
	r1.w = r1.w * r5.w;
	r7.xyz = (r0.xyz * r0.www) + r1.xyz;
	r1.x = clamp(dot(r3.xyz, r1.xyz), 0.0, 1.0);
	r8.xyz = normalize(r7.xyz);
	r4.y = clamp(dot(r3.xyz, r8.xyz), 0.0, 1.0);
	r7 = s10_texture.sample(s10, v0.xy);
	r4.w = r7.w;
	r8 = s7_texture.sample(s7, r4.yw);
	r1.y = r1.x * r4.y;
	r9.xyz = (r1.www * c2.yyy) + -r8.xyz;
	r9.xyz = (r6.yyy * r9.xyz) + r8.xyz;
	r8.xyz = ((-r6.y >= 0.0) ? r8.xyz : r9.xyz);
	r1.z = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r1.x = (r1.x * r1.x) + r1.x;
	r1.x = r1.x * c0.x;
	r1.z = ((r1.z == 0.0) ? FLT_MAX : 1.0 / r1.z);
	r8.xyz = r1.zzz * r8.xyz;
	r9.xyz = c20.xyz * v1.xxx;
	r5.xyz = (r8.xyz * r9.xyz) + r5.xyz;
	r8.xyz = c23.xyz + -v5.xyz;
	r10.xyz = normalize(r8.xyz);
	r1.w = clamp(dot(r2.xyz, r10.xyz), 0.0, 1.0);
	r1.w = r1.w * r5.w;
	r8.xyz = (r0.xyz * r0.www) + r10.xyz;
	r4.y = clamp(dot(r3.xyz, r10.xyz), 0.0, 1.0);
	r10.xyz = normalize(r8.xyz);
	r4.x = clamp(dot(r3.xyz, r10.xyz), 0.0, 1.0);
	r8 = s7_texture.sample(s7, r4.xw);
	r4.x = r4.y * r4.x;
	r10.xyz = (r1.www * c2.yyy) + -r8.xyz;
	r10.xyz = (r6.yyy * r10.xyz) + r8.xyz;
	r8.xyz = ((-r6.y >= 0.0) ? r8.xyz : r10.xyz);
	r1.w = ((r4.y == 0.0) ? FLT_MAX : rsqrt(abs(r4.y)));
	r4.y = (r4.y * r4.y) + r4.y;
	r4.y = r4.y * c0.x;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r8.xyz = r1.www * r8.xyz;
	r10.xyz = c22.xyz * v1.yyy;
	r5.xyz = (r8.xyz * r10.xyz) + r5.xyz;
	r8.xyz = c25.xyz + -v5.xyz;
	r11.xyz = normalize(r8.xyz);
	r6.w = clamp(dot(r2.xyz, r11.xyz), 0.0, 1.0);
	r5.w = r5.w * r6.w;
	r0.xyz = (r0.xyz * r0.www) + r11.xyz;
	r0.w = clamp(dot(r3.xyz, r11.xyz), 0.0, 1.0);
	r8.xyz = normalize(r0.xyz);
	r0.x = clamp(dot(r3.xyz, r8.xyz), 0.0, 1.0);
	r0.y = r4.w;
	r8 = s4_texture.sample(s4, r4.zw);
	r0.z = -r4.z + c13.w;
	r4.z = pow(abs(r0.z), c105.x);
	r0.z = mix(r8.y, c13.w, r6.y);
	r8 = s7_texture.sample(s7, r0.xy);
	r0.x = r0.w * r0.x;
	r0.x = r4.z * r0.x;
	r11.xyz = (r5.www * c2.yyy) + -r8.xyz;
	r11.xyz = (r6.yyy * r11.xyz) + r8.xyz;
	r8.xyz = ((-r6.y >= 0.0) ? r8.xyz : r11.xyz);
	r0.y = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = (r0.w * r0.w) + r0.w;
	r0.w = r0.w * c0.x;
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r8.xyz = r0.yyy * r8.xyz;
	r0.x = r0.y * r0.x;
	r11.xyz = c24.xyz * v1.zzz;
	r5.xyz = (r8.xyz * r11.xyz) + r5.xyz;
	r5.xyz = r3.www * r5.xyz;
	r8.x = ((r3.x >= 0.0) ? c13.z : c13.w);
	r8.y = ((r3.y >= 0.0) ? c13.z : c13.w);
	r8.z = ((r3.z >= 0.0) ? c13.z : c13.w);
	r12.xyz = r3.xyz * r3.xyz;
	r8.xyz = r8.xyz * r12.xyz;
	r13.xyz = r8.xxx * c5.xyz;
	r14.x = ((r3.x >= 0.0) ? c13.w : c13.z);
	r14.y = ((r3.y >= 0.0) ? c13.w : c13.z);
	r14.z = ((r3.z >= 0.0) ? c13.w : c13.z);
	r12.xyz = r12.xyz * r14.xyz;
	r13.xyz = (r12.xxx * c4.xyz) + r13.xyz;
	r12.xyw = (r12.yyy * c6.xyz) + r13.xyz;
	r8.xyw = (r8.yyy * c7.xyz) + r12.xyw;
	r8.xyw = (r12.zzz * c8.xyz) + r8.xyw;
	r8.xyz = (r8.zzz * c9.xyz) + r8.xyw;
	r8.xyz = (r9.xyz * r1.xxx) + r8.xyz;
	r8.xyz = (r10.xyz * r4.yyy) + r8.xyz;
	r8.xyz = (r11.xyz * r0.www) + r8.xyz;
	r12.xyz = r8.xyz + v6.xyz;
	r13.xyz = r12.xyz + -c103.xxx;
	r13.xyz = clamp(r13.xyz * c103.yyy, float3(0.0), float3(1.0));
	r0.y = dot(r3.xyz, r3.xyz);
	r2.xyz = r2.xyz * r0.yyy;
	r2.xyz = (r2.www * r3.xyz) + -r2.xyz;
	r2 = s6_texture.sample(s6, r2.xyz);
	r3.xyz = r2.xyz * c30.zzz;
	r14.xyz = r3.xyz * r3.xyz;
	r14.xyz = r14.xyz * r14.xyz;
	r0.y = dot(r14.xyz, c15.xyz);
	r0.w = r0.y + c2.z;
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r0.y = ((r0.w >= 0.0) ? r0.y : c2.w);
	r0.w = dot(r3.xyz, c15.xyz);
	r14.xyz = r0.www * r14.xyz;
	r2.xyz = (c30.zzz * -r2.xyz) + r0.www;
	r2.xyz = (-c103.www * r2.xyz) + r3.xyz;
	r14.xyz = (r14.xyz * r0.yyy) + -r3.xyz;
	r14.xyz = (c103.www * r14.xyz) + r3.xyz;
	r2.xyz = ((c103.w >= 0.0) ? r14.xyz : r2.xyz);
	r0.y = abs(c103.w);
	r2.xyz = ((-r0.y >= 0.0) ? r3.xyz : r2.xyz);
	r3.xyz = (r2.xyz * r13.xyz) + -r2.xyz;
	r0.y = r6.z * c101.x;
	r0.w = r6.x * c12.w;
	r0.w = (r0.w * c0.y) + c0.x;
	r0.w = fract(r0.w);
	r0.w = (r0.w * c0.z) + c0.w;
	r6.xy = float2(cos(r0.w), sin(r0.w));
	r2.xyz = (r0.yyy * r3.xyz) + r2.xyz;
	r3.xyz = (r2.xyz * r2.xyz) + -r2.xyz;
	r2.xyz = (c103.zzz * r3.xyz) + r2.xyz;
	r3 = s0_texture.sample(s0, v0.xy);
	r13.xyz = r3.www * c104.xyz;
	r2.xyz = r2.xyz * r13.xyz;
	r0.y = mix(c10.x, c10.y, r7.y);
	r2.xyz = (r5.xyz * r0.yyy) + r2.xyz;
	r0.yzw = r0.zzz * r2.xyz;
	r2.xyz = r3.zxy * c2.xxx;
	r2.xyz = (r3.zxy * c2.xxx) + -r2.zxy;
	r2.xyz = r6.yyy * r2.xyz;
	r2.xyz = (r3.xyz * r6.xxx) + r2.xyz;
	r1.x = -r6.x + c13.w;
	r2.w = dot(c2.xxx, r3.xyz);
	r2.w = r2.w * c2.x;
	r2.xyz = (r2.www * r1.xxx) + r2.xyz;
	r1.x = abs(c12.w);
	r2.xyz = ((-r1.x >= 0.0) ? r3.xyz : r2.xyz);
	r3.xyz = r2.xyz + c13.yyy;
	r3.xyz = (r7.yyy * r3.xyz) + c13.www;
	r0.yzw = r0.yzw * r3.xyz;
	r1.x = r4.z * r4.x;
	r1.y = r1.y * r4.z;
	r1.xy = r1.wz * r1.xy;
	r1.xzw = r10.xyz * r1.xxx;
	r1.xyz = (r1.yyy * r9.xyz) + r1.xzw;
	r1.xyz = (r0.xxx * r11.xyz) + r1.xyz;
	r1.w = c13.w;
	r0.x = (v6.w * c11.w) + r1.w;
	r1.w = r7.x * c105.y;
	r0.x = r0.x * r1.w;
	r1.xyz = r0.xxx * r1.xyz;
	r0.x = r7.y * c101.w;
	r3.xyz = (r2.xyz * r0.xxx) + -c106.xyz;
	r0.x = clamp(r0.x, 0.0, 1.0);
	r3.xyz = (r0.xxx * r3.xyz) + c106.xyz;
	r4.xyz = (r1.xyz * r3.xyz) + r8.xyz;
	r0.x = dot(r4.xyz, c15.xyz);
	r0.x = r0.x + c15.w;
	r0.x = clamp(r0.x * c14.x, 0.0, 1.0);
	r1.w = (r0.x * c14.y) + c14.z;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r1.w;
	r1.w = dot(r2.xyz, c15.xyz);
	r4.xyz = r1.www * c102.xyz;
	r5.xyz = c15.xyz;
	r1.w = dot(c102.xyz, r5.xyz);
	r2.w = r1.w + c2.z;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = ((r2.w >= 0.0) ? r1.w : c2.w);
	r4.xyz = (r4.xyz * r1.www) + -r2.xyz;
	r4.xyz = (c102.www * r4.xyz) + r2.xyz;
	r1.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r4.xyz = (r4.xyz * r1.www) + -r2.xyz;
	r2.xyz = (r0.xxx * r4.xyz) + r2.xyz;
	r2.xyz = r7.zzz * r2.xyz;
	r0.xyz = (r2.xyz * r12.xyz) + r0.yzw;
	r0.xyz = (r1.xyz * r3.xyz) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	oC0.xyz = r0.xyz * c30.xxx;
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
	#undef c20
	#undef c21
	#undef c22
	#undef c23
	#undef c24
	#undef c25
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

