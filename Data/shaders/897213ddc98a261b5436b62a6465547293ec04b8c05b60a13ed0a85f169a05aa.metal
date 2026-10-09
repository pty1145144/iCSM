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
	float4 v7 [[user(texcoord7)]];
	float4 v8 [[user(texcoord8)]];
	float4 v9 [[user(texcoord9)]];
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
	const float4 c13 = float4(0.159154935, 0.5, 6.283185478, -3.141592739); (void) c13;
	const float4 c14 = float4(0.298999992, 0.587000012, 0.114, -0.300000011); (void) c14;
	const float4 c15 = float4(0.57735002, 1.0, 2.0, -1.0); (void) c15;
	const float4 c16 = float4(-3.333333253, -2.0, 3.0, 0.0); (void) c16;
	const float4 c17 = float4(0.0, 1.0, -0.000001, 1000000.0); (void) c17;
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
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c2 uniforms.uniforms_float4[2]
	#define c3 uniforms.uniforms_float4[3]
	#define c4 uniforms.uniforms_float4[4]
	#define c5 uniforms.uniforms_float4[5]
	#define c6 uniforms.uniforms_float4[6]
	#define c7 uniforms.uniforms_float4[7]
	#define c8 uniforms.uniforms_float4[8]
	#define c9 uniforms.uniforms_float4[9]
	#define c10 uniforms.uniforms_float4[10]
	#define c11 uniforms.uniforms_float4[11]
	#define c12 uniforms.uniforms_float4[12]
	#define c19 uniforms.uniforms_float4[13]
	#define c20 uniforms.uniforms_float4[14]
	#define c21 uniforms.uniforms_float4[15]
	#define c22 uniforms.uniforms_float4[16]
	#define c23 uniforms.uniforms_float4[17]
	#define c30 uniforms.uniforms_float4[18]
	#define c33 uniforms.uniforms_float4[19]
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
	#define v7 input.v7
	#define v8 input.v8
	#define v9 input.v9
	#define oC0 output.oC0
	r0.x = c19.y + -v5.z;
	r0.x = r0.x + -c15.z;
	oC0.w = clamp(r0.x * c19.w, 0.0, 1.0);
	r0.x = abs(c103.w);
	r0.yzw = c3.xyz + -v5.xyz;
	r1.x = dot(r0.yzw, r0.yzw);
	r1.x = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r1.yzw = r0.yzw * r1.xxx;
	r2 = s1_texture.sample(s1, v0.xy);
	r2.xyz = (r2.xyz * c15.zzz) + c15.www;
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
	r5.xyz = r3.xyz * c30.zzz;
	r6.xyz = r5.xyz * r5.xyz;
	r6.xyz = r6.xyz * r6.xyz;
	r3.w = dot(r6.xyz, c14.xyz);
	r5.w = r3.w + c17.z;
	r3.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r3.w = ((r5.w >= 0.0) ? r3.w : c17.w);
	r5.w = dot(r5.xyz, c14.xyz);
	r6.xyz = r5.www * r6.xyz;
	r3.xyz = (c30.zzz * -r3.xyz) + r5.www;
	r3.xyz = (-c103.www * r3.xyz) + r5.xyz;
	r6.xyz = (r6.xyz * r3.www) + -r5.xyz;
	r6.xyz = (c103.www * r6.xyz) + r5.xyz;
	r3.xyz = ((c103.w >= 0.0) ? r6.xyz : r3.xyz);
	r3.xyz = ((-r0.x >= 0.0) ? r5.xyz : r3.xyz);
	r5.x = ((r2.x >= 0.0) ? c17.x : c17.y);
	r5.y = ((r2.y >= 0.0) ? c17.x : c17.y);
	r5.z = ((r2.z >= 0.0) ? c17.x : c17.y);
	r6.xyz = r2.xyz * r2.xyz;
	r5.xyz = r5.xyz * r6.xyz;
	r7.xyz = r5.xxx * c5.xyz;
	r8.x = ((r2.x >= 0.0) ? c17.y : c17.x);
	r8.y = ((r2.y >= 0.0) ? c17.y : c17.x);
	r8.z = ((r2.z >= 0.0) ? c17.y : c17.x);
	r6.xyz = r6.xyz * r8.xyz;
	r7.xyz = (r6.xxx * c4.xyz) + r7.xyz;
	r6.xyw = (r6.yyy * c6.xyz) + r7.xyz;
	r5.xyw = (r5.yyy * c7.xyz) + r6.xyw;
	r5.xyw = (r6.zzz * c8.xyz) + r5.xyw;
	r5.xyz = (r5.zzz * c9.xyz) + r5.xyw;
	r6.xyz = c21.xyz + -v5.xyz;
	r7.xyz = normalize(r6.xyz);
	r0.x = clamp(dot(r2.xyz, r7.xyz), 0.0, 1.0);
	r3.w = (r0.x * r0.x) + r0.x;
	r3.w = r3.w * c13.y;
	r6.xyz = c20.xyz * v1.xxx;
	r5.xyz = (r6.xyz * r3.www) + r5.xyz;
	r8.xyz = c23.xyz + -v5.xyz;
	r9.xyz = normalize(r8.xyz);
	r3.w = clamp(dot(r2.xyz, r9.xyz), 0.0, 1.0);
	r8.xyz = (r0.yzw * r1.xxx) + r9.xyz;
	r9.xyz = normalize(r8.xyz);
	r4.x = clamp(dot(r2.xyz, r9.xyz), 0.0, 1.0);
	r5.w = (r3.w * r3.w) + r3.w;
	r5.w = r5.w * c13.y;
	r8.xyz = c22.xyz * v1.yyy;
	r5.xyz = (r8.xyz * r5.www) + r5.xyz;
	r9.xyz = r5.xyz + v6.xyz;
	r10.xyz = r9.xyz + -c103.xxx;
	r10.xyz = clamp(r10.xyz * c103.yyy, float3(0.0), float3(1.0));
	r10.xyz = (r3.xyz * r10.xyz) + -r3.xyz;
	r3.xyz = (c101.xxx * r10.xyz) + r3.xyz;
	r10.xyz = (r3.xyz * r3.xyz) + -r3.xyz;
	r3.xyz = (c103.zzz * r10.xyz) + r3.xyz;
	r10 = s0_texture.sample(s0, v0.xy);
	r11.xyz = r10.www * c104.xyz;
	r3.xyz = r3.xyz * r11.xyz;
	r7.xyw = (r0.yzw * r1.xxx) + r7.xyz;
	r5.w = clamp(r7.z, 0.0, 1.0);
	r5.w = (r5.w * r5.w) + r5.w;
	r5.w = r5.w * c13.y;
	r11.xyz = r5.www * r6.xyz;
	r12.xyz = normalize(r7.xyw);
	r4.y = clamp(dot(r2.xyz, r12.xyz), 0.0, 1.0);
	r7 = s10_texture.sample(s10, v0.xy);
	r4.w = r7.w;
	r12 = s7_texture.sample(s7, r4.yw);
	r4.y = r0.x * r4.y;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r12.xyz = r0.xxx * r12.xyz;
	r5.w = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r3.w = r3.w * r4.x;
	r13 = s7_texture.sample(s7, r4.xw);
	r14 = s4_texture.sample(s4, r4.zw);
	r4.x = -r4.z + c15.y;
	r6.w = pow(abs(r4.x), c105.x);
	r3.w = r3.w * r6.w;
	r4.x = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r13.xyz = r4.xxx * r13.xyz;
	r3.w = r3.w * r4.x;
	r4.xzw = r8.xyz * r13.xyz;
	r8.xyz = r8.xyz * r3.www;
	r4.xzw = (r12.xyz * r6.xyz) + r4.xzw;
	r4.xzw = r2.www * r4.xzw;
	r2.w = mix(c10.x, c10.y, r7.y);
	r3.xyz = (r4.xzw * r2.www) + r3.xyz;
	r12.x = v7.w;
	r12.y = v8.w;
	r12.z = v9.w;
	r4.xzw = -r12.xyz + c21.xyz;
	r12.xyz = normalize(r4.xzw);
	r2.w = clamp(dot(-v9.xyz, r12.xyz), 0.0, 1.0);
	r2.w = (r2.w * r2.w) + r2.w;
	r2.w = r2.w * c13.y;
	r4.xzw = r2.www * r6.xyz;
	r12.x = ((r1.y >= 0.0) ? c17.x : c17.y);
	r12.y = ((r1.z >= 0.0) ? c17.x : c17.y);
	r12.z = ((r1.w >= 0.0) ? c17.x : c17.y);
	r13.xyz = r1.yzw * r1.yzw;
	r1.y = ((r1.y >= 0.0) ? c17.y : c17.x);
	r1.z = ((r1.z >= 0.0) ? c17.y : c17.x);
	r1.w = ((r1.w >= 0.0) ? c17.y : c17.x);
	r1.yzw = r13.xyz * r1.yzw;
	r12.xyz = r12.xyz * r13.xyz;
	r13.xyz = r12.xxx * c5.xyz;
	r13.xyz = (r1.yyy * c4.xyz) + r13.xyz;
	r13.xyz = (r1.zzz * c6.xyz) + r13.xyz;
	r12.xyw = (r12.yyy * c7.xyz) + r13.xyz;
	r1.yzw = (r1.www * c8.xyz) + r12.xyw;
	r1.yzw = (r12.zzz * c9.xyz) + r1.yzw;
	r1.yzw = r11.xyz * r1.yzw;
	r11.xyz = c0.xyz * v6.xyz;
	r4.xzw = (r11.xyz * r4.xzw) + -r1.yzw;
	r2.w = clamp(dot(r2.xyz, v9.xyz), 0.0, 1.0);
	r1.yzw = (r2.www * r4.xzw) + r1.yzw;
	r2.w = r7.x * r14.z;
	r2.w = r2.w * c0.w;
	r1.yzw = r1.yzw * r2.www;
	r1.yzw = (r3.xyz * r14.yyy) + r1.yzw;
	r3.xyz = r10.zxy * c15.xxx;
	r3.xyz = (r10.zxy * c15.xxx) + -r3.zxy;
	r11.xy = c13.xy;
	r2.w = (c12.w * r11.x) + r11.y;
	r2.w = fract(r2.w);
	r2.w = (r2.w * c13.z) + c13.w;
	r11.xy = float2(cos(r2.w), sin(r2.w));
	r3.xyz = r3.xyz * r11.yyy;
	r3.xyz = (r10.xyz * r11.xxx) + r3.xyz;
	r2.w = -r11.x + c15.y;
	r4.x = dot(c15.xxx, r10.xyz);
	r4.x = r4.x * c15.x;
	r3.xyz = (r4.xxx * r2.www) + r3.xyz;
	r2.w = abs(c12.w);
	r3.xyz = ((-r2.w >= 0.0) ? r10.xyz : r3.xyz);
	r4.xzw = r3.xyz + c15.www;
	r4.xzw = (r7.yyy * r4.xzw) + c15.yyy;
	r1.yzw = r1.yzw * r4.xzw;
	r4.xzw = r3.xyz * r3.xyz;
	r4.xzw = r4.xzw * r4.xzw;
	r2.w = dot(r3.xyz, c14.xyz);
	r10.xyz = r2.www * r4.xzw;
	r4.x = dot(r4.xzw, c14.xyz);
	r11.xyz = mix(r3.xyz, r2.www, -c101.yyy);
	r2.w = r4.x + c17.z;
	r4.x = ((r4.x == 0.0) ? FLT_MAX : 1.0 / r4.x);
	r2.w = ((r2.w >= 0.0) ? r4.x : c17.w);
	r4.xzw = (r10.xyz * r2.www) + -r3.xyz;
	r4.xzw = (c101.yyy * r4.xzw) + r3.xyz;
	r4.xzw = ((c101.y >= 0.0) ? r4.xzw : r11.xyz);
	r2.w = abs(c101.y);
	r4.xzw = ((-r2.w >= 0.0) ? r3.xyz : r4.xzw);
	r2.w = r4.y * r6.w;
	r3.w = (r2.w * r0.x) + r3.w;
	r0.x = r0.x * r2.w;
	r6.xyz = (r0.xxx * r6.xyz) + r8.xyz;
	r8.xy = r3.ww + -c33.xw;
	r8.zw = -c33.xw + c33.yz;
	r0.x = ((r8.z == 0.0) ? FLT_MAX : 1.0 / r8.z);
	r2.w = ((r8.w == 0.0) ? FLT_MAX : 1.0 / r8.w);
	r2.w = clamp(r2.w * r8.y, 0.0, 1.0);
	r0.x = clamp(r0.x * r8.x, 0.0, 1.0);
	r3.w = (r0.x * c16.y) + c16.z;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r3.w;
	r3.w = (r2.w * c16.y) + c16.z;
	r2.w = r2.w * r2.w;
	r2.w = r2.w * r3.w;
	r0.x = r0.x * r2.w;
	r4.y = c15.y;
	r2.w = (v6.w * c11.w) + r4.y;
	r3.w = r7.x * c105.y;
	r2.w = r2.w * r3.w;
	r6.xyz = r2.www * r6.xyz;
	r2.w = r7.y * c101.w;
	r8.xyz = (r3.xyz * r2.www) + -c106.xyz;
	r2.w = clamp(r2.w, 0.0, 1.0);
	r8.xyz = (r2.www * r8.xyz) + c106.xyz;
	r10.xyz = r6.xyz * r8.xyz;
	r2.w = dot(r10.xyz, c14.xyz);
	r0.x = r0.x * r2.w;
	r0.x = r0.x * c106.w;
	r2.w = dot(r5.xyz, c14.xyz);
	r5.xyz = (r6.xyz * r8.xyz) + r5.xyz;
	r3.w = dot(r5.xyz, c14.xyz);
	r3.w = r3.w + c14.w;
	r3.w = clamp(r3.w * c16.x, 0.0, 1.0);
	r5.xy = r2.ww + -c2.xw;
	r5.zw = -c2.xw + c2.yz;
	r2.w = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r4.y = ((r5.z == 0.0) ? FLT_MAX : 1.0 / r5.z);
	r4.y = clamp(r4.y * r5.x, 0.0, 1.0);
	r2.w = clamp(r2.w * r5.y, 0.0, 1.0);
	r5.x = (r2.w * c16.y) + c16.z;
	r2.w = r2.w * r2.w;
	r0.x = (r5.x * r2.w) + r0.x;
	r2.w = (r4.y * c16.y) + c16.z;
	r4.y = r4.y * r4.y;
	r2.w = r2.w * r4.y;
	r0.x = r0.x * r2.w;
	r5.xyz = mix(r3.xyz, r4.xzw, r0.xxx);
	r0.x = dot(r5.xyz, c14.xyz);
	r3.xyz = r0.xxx * c102.xyz;
	r4.xyz = c14.xyz;
	r0.x = dot(c102.xyz, r4.xyz);
	r2.w = r0.x + c17.z;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = ((r2.w >= 0.0) ? r0.x : c17.w);
	r3.xyz = (r3.xyz * r0.xxx) + -r5.xyz;
	r3.xyz = (c102.www * r3.xyz) + r5.xyz;
	r0.x = clamp(c107.w + v6.w, 0.0, 1.0);
	r3.xyz = (r3.xyz * r0.xxx) + -r5.xyz;
	r0.x = (r3.w * c16.y) + c16.z;
	r2.w = r3.w * r3.w;
	r0.x = r0.x * r2.w;
	r3.xyz = (r0.xxx * r3.xyz) + r5.xyz;
	r3.xyz = r7.zzz * r3.xyz;
	r1.yzw = (r3.xyz * r9.xyz) + r1.yzw;
	r1.yzw = (r6.xyz * r8.xyz) + r1.yzw;
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
	r0.xyz = (r0.xyz * r7.xxx) + r1.yzw;
	r0.xyz = r0.xyz * c1.xyz;
	oC0.xyz = r0.xyz * c30.xxx;
	#undef c0
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
	#undef c19
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
	#undef v7
	#undef v8
	#undef v9
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

