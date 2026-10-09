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
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
	texture2d<float> s4_texture [[texture(4)]],
	sampler s4 [[sampler(4)]],
	texture2d<float> s7_texture [[texture(7)]],
	sampler s7 [[sampler(7)]],
	texture2d<float> s10_texture [[texture(10)]],
	sampler s10 [[sampler(10)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c13 = float4(2.0, -1.0, 0.0, 1.0); (void) c13;
	const float4 c14 = float4(0.5, 0.159154935, 6.283185478, -3.141592739); (void) c14;
	const float4 c15 = float4(0.57735002, 0.499999584, 0.5, 5.0); (void) c15;
	const float4 c16 = float4(0.298999992, 0.587000012, 0.114, -0.300000011); (void) c16;
	const float4 c17 = float4(-3.333333253, -2.0, 3.0, -0.000001); (void) c17;
	const float4 c18 = float4(1000000.0, 0.0, 0.0, 0.0); (void) c18;
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
	#define v7 input.v7
	#define v8 input.v8
	#define v9 input.v9
	#define oC0 output.oC0
	r0.x = c19.y + -v5.z;
	r0.x = r0.x + -c13.x;
	oC0.w = clamp(r0.x * c19.w, 0.0, 1.0);
	r0.xyz = c23.xyz + -v5.xyz;
	r1.xyz = normalize(r0.xyz);
	r0 = s3_texture.sample(s3, v0.xy);
	r0.z = (r0.y * c15.y) + c15.z;
	r0.z = fract(r0.z);
	r0.z = (r0.z * c14.z) + c14.w;
	r2.xy = float2(cos(r0.z), sin(r0.z));
	r3 = s1_texture.sample(s1, v0.xy);
	r3.xyz = (r3.xyz * c13.xxx) + c13.yyy;
	r4.x = dot(v2.xyz, r3.xyz);
	r4.y = dot(v3.xyz, r3.xyz);
	r4.z = dot(v4.xyz, r3.xyz);
	r3.xyz = normalize(r4.xyz);
	r4.xyz = r3.zxy * v8.yzx;
	r4.xyz = (r3.yzx * v8.zxy) + -r4.xyz;
	r5.xyz = normalize(r4.xyz);
	r4.xyz = r3.zxy * r5.yzx;
	r4.xyz = (r3.yzx * r5.zxy) + -r4.xyz;
	r2.xzw = r2.xxx * r5.xyz;
	r5.xyz = normalize(r4.xyz);
	r2.xyz = (r2.yyy * r5.xyz) + r2.xzw;
	r4.xyz = normalize(r2.xyz);
	r0.z = dot(r1.xyz, r4.xxx);
	r1.w = (r0.z * -r0.z) + c13.w;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r2.xyz = c3.xyz + -v5.xyz;
	r2.w = dot(r2.xyz, r2.xyz);
	r2.w = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r5.xyz = r2.www * r2.xyz;
	r4.w = dot(r5.xyz, r4.xyz);
	r5.w = (r4.w * -r4.w) + c13.w;
	r5.w = ((r5.w == 0.0) ? FLT_MAX : rsqrt(abs(r5.w)));
	r5.w = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r1.w = r1.w * r5.w;
	r0.z = clamp((r4.w * r0.z) + r1.w, 0.0, 1.0);
	r6.xyz = (r2.xyz * r2.www) + r1.xyz;
	r7.xyz = normalize(r6.xyz);
	r1.w = clamp(dot(r3.xyz, r7.xyz), 0.0, 1.0);
	r6.zw = c13.zw;
	r0.y = ((-r0.y >= 0.0) ? r6.z : c10.w);
	r7.x = mix(r1.w, r0.z, r0.y);
	r8 = s10_texture.sample(s10, v0.xy);
	r7.w = r8.w;
	r9 = s7_texture.sample(s7, r7.xw);
	r0.z = clamp(dot(r5.xyz, r1.xyz), 0.0, 1.0);
	r1.x = clamp(dot(r3.xyz, r1.xyz), 0.0, 1.0);
	r7.z = clamp(dot(r5.xyz, r3.xyz), 0.0, 1.0);
	r1.y = r7.z * r7.z;
	r10.w = r1.y * r1.y;
	r0.w = -r0.w + c13.w;
	r1.y = r10.w * r0.w;
	r1.yzw = r1.yyy * v6.xyz;
	r10.xyz = r1.yzw * c15.www;
	r10 = ((-r0.w >= 0.0) ? c13.zzzz : r10);
	r0.z = r0.z * r10.w;
	r1.yzw = (r0.zzz * c15.www) + -r9.xyz;
	r1.yzw = (r0.www * r1.yzw) + r9.xyz;
	r1.yzw = ((-r0.w >= 0.0) ? r9.xyz : r1.yzw);
	r0.z = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r0.z = ((r0.z == 0.0) ? FLT_MAX : 1.0 / r0.z);
	r1.yzw = r0.zzz * r1.yzw;
	r6.xyz = c21.xyz + -v5.xyz;
	r9.xyz = normalize(r6.xyz);
	r6.x = dot(r9.xyz, r4.xxx);
	r6.y = (r6.x * -r6.x) + c13.w;
	r6.y = ((r6.y == 0.0) ? FLT_MAX : rsqrt(abs(r6.y)));
	r6.y = ((r6.y == 0.0) ? FLT_MAX : 1.0 / r6.y);
	r5.w = r5.w * r6.y;
	r4.w = clamp((r4.w * r6.x) + r5.w, 0.0, 1.0);
	r6.xyz = (r2.xyz * r2.www) + r9.xyz;
	r11.xyz = normalize(r6.xyz);
	r5.w = clamp(dot(r3.xyz, r11.xyz), 0.0, 1.0);
	r7.y = mix(r5.w, r4.w, r0.y);
	r11 = s7_texture.sample(s7, r7.yw);
	r12 = s4_texture.sample(s4, r7.zw);
	r4.w = -r7.z + c13.w;
	r5.w = pow(abs(r4.w), c105.x);
	r4.w = clamp(dot(r5.xyz, r9.xyz), 0.0, 1.0);
	r4.w = r4.w * r10.w;
	r6.xyz = (r4.www * c15.www) + -r11.xyz;
	r6.xyz = (r0.www * r6.xyz) + r11.xyz;
	r6.xyz = ((-r0.w >= 0.0) ? r11.xyz : r6.xyz);
	r4.w = mix(r12.y, c13.w, r0.w);
	r0.w = r8.x * r12.z;
	r0.w = r0.w * c0.w;
	r7.z = clamp(dot(r3.xyz, r9.xyz), 0.0, 1.0);
	r7.w = clamp(r9.z, 0.0, 1.0);
	r7.w = (r7.w * r7.w) + r7.w;
	r7.w = r7.w * c14.x;
	r8.w = ((r7.z == 0.0) ? FLT_MAX : rsqrt(abs(r7.z)));
	r8.w = ((r8.w == 0.0) ? FLT_MAX : 1.0 / r8.w);
	r6.xyz = r6.xyz * r8.www;
	r9.xyz = c20.xyz * v1.xxx;
	r6.xyz = (r6.xyz * r9.xyz) + r10.xyz;
	r10.xyz = c22.xyz * v1.yyy;
	r1.yzw = (r1.yzw * r10.xyz) + r6.xyz;
	r1.yzw = r3.www * r1.yzw;
	r3.w = mix(c10.x, c10.y, r8.y);
	r1.yzw = r1.yzw * r3.www;
	r6.xyz = r3.xyz * r4.yzx;
	r6.xyz = (r4.xyz * r3.yzx) + -r6.xyz;
	r11.xyz = r4.yzx * r6.xyz;
	r4.xyz = (r6.zxy * r4.zxy) + -r11.xyz;
	r3.w = dot(r4.xyz, r4.xyz);
	r3.w = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r4.xyz = (r4.xyz * r3.www) + -r5.xyz;
	r4.xyz = (r0.yyy * r4.xyz) + r5.xyz;
	r0.y = dot(r3.xyz, r4.xyz);
	r0.y = r0.y + r0.y;
	r3.w = dot(r3.xyz, r3.xyz);
	r4.xyz = r4.xyz * r3.www;
	r4.xyz = (r0.yyy * r3.xyz) + -r4.xyz;
	r5.x = ((r4.x >= 0.0) ? c13.z : c13.w);
	r5.y = ((r4.y >= 0.0) ? c13.z : c13.w);
	r5.z = ((r4.z >= 0.0) ? c13.z : c13.w);
	r6.xyz = r4.xyz * r4.xyz;
	r4.x = ((r4.x >= 0.0) ? c13.w : c13.z);
	r4.y = ((r4.y >= 0.0) ? c13.w : c13.z);
	r4.z = ((r4.z >= 0.0) ? c13.w : c13.z);
	r4.xyz = r6.xyz * r4.xyz;
	r5.xyz = r5.xyz * r6.xyz;
	r6.xyz = r5.xxx * c5.xyz;
	r6.xyz = (r4.xxx * c4.xyz) + r6.xyz;
	r6.xyz = (r4.yyy * c6.xyz) + r6.xyz;
	r6.xyz = (r5.yyy * c7.xyz) + r6.xyz;
	r4.xyz = (r4.zzz * c8.xyz) + r6.xyz;
	r4.xyz = (r5.zzz * c9.xyz) + r4.xyz;
	r5.xyz = r7.www * r9.xyz;
	r4.xyz = r4.xyz * r5.xyz;
	r5.x = v7.w;
	r5.y = v8.w;
	r5.z = v9.w;
	r5.xyz = -r5.xyz + c21.xyz;
	r6.xyz = normalize(r5.xyz);
	r0.y = clamp(dot(-v9.xyz, r6.xyz), 0.0, 1.0);
	r0.y = (r0.y * r0.y) + r0.y;
	r0.y = r0.y * c14.x;
	r5.xyz = r0.yyy * r9.xyz;
	r6.xyz = c0.xyz * v6.xyz;
	r5.xyz = (r6.xyz * r5.xyz) + -r4.xyz;
	r0.y = clamp(dot(r3.xyz, v9.xyz), 0.0, 1.0);
	r4.xyz = (r0.yyy * r5.xyz) + r4.xyz;
	r4.xyz = r0.www * r4.xyz;
	r1.yzw = (r1.yzw * r4.www) + r4.xyz;
	r0.y = r0.x * c12.w;
	r4.w = r0.x;
	r0.x = (r0.y * c14.y) + c14.x;
	r0.x = fract(r0.x);
	r0.x = (r0.x * c14.z) + c14.w;
	r11.xy = float2(cos(r0.x), sin(r0.x));
	r12 = s0_texture.sample(s0, v0.xy);
	r0.xyw = r12.zxy * c15.xxx;
	r0.xyw = (r12.zxy * c15.xxx) + -r0.wxy;
	r0.xyw = r11.yyy * r0.xyw;
	r0.xyw = (r12.xyz * r11.xxx) + r0.xyw;
	r3.w = -r11.x + c13.w;
	r5.x = dot(c15.xxx, r12.xyz);
	r4.xyz = r12.xyz;
	r5.x = r5.x * c15.x;
	r11.xyz = (r5.xxx * r3.www) + r0.xyw;
	r0.x = abs(c12.w);
	r11.w = c13.w;
	r4 = ((-r0.x >= 0.0) ? r4 : r11);
	r0.xyw = r4.xyz + c13.yyy;
	r0.xyw = (r8.yyy * r0.xyw) + c13.www;
	r0.xyw = r0.xyw * r1.yzw;
	r1.yzw = r4.xyz * r4.xyz;
	r1.yzw = r1.yzw * r1.yzw;
	r3.w = dot(r4.xyz, c16.xyz);
	r5.xyz = r1.yzw * r3.www;
	r1.y = dot(r1.yzw, c16.xyz);
	r6.xyz = mix(r4.xyz, r3.www, -c101.yyy);
	r1.z = r1.y + c17.w;
	r1.y = ((r1.y == 0.0) ? FLT_MAX : 1.0 / r1.y);
	r1.y = ((r1.z >= 0.0) ? r1.y : c18.x);
	r1.yzw = (r5.xyz * r1.yyy) + -r4.xyz;
	r1.yzw = (c101.yyy * r1.yzw) + r4.xyz;
	r1.yzw = ((c101.y >= 0.0) ? r1.yzw : r6.xyz);
	r3.w = abs(c101.y);
	r1.yzw = ((-r3.w >= 0.0) ? r4.xyz : r1.yzw);
	r3.w = r1.x * r7.x;
	r1.x = (r1.x * r1.x) + r1.x;
	r1.x = r1.x * c14.x;
	r3.w = r5.w * r3.w;
	r0.z = r0.z * r3.w;
	r3.w = r7.z * r7.y;
	r5.x = (r7.z * r7.z) + r7.z;
	r5.x = r5.x * c14.x;
	r3.w = r5.w * r3.w;
	r5.y = (r3.w * r8.w) + r0.z;
	r6.xyz = r10.xyz * r0.zzz;
	r0.z = r8.w * r3.w;
	r6.xyz = (r0.zzz * r9.xyz) + r6.xyz;
	r5.yz = r5.yy + -c33.xw;
	r7.xy = -c33.xw + c33.yz;
	r0.z = ((r7.x == 0.0) ? FLT_MAX : 1.0 / r7.x);
	r3.w = ((r7.y == 0.0) ? FLT_MAX : 1.0 / r7.y);
	r3.w = clamp(r3.w * r5.z, 0.0, 1.0);
	r0.z = clamp(r0.z * r5.y, 0.0, 1.0);
	r5.y = (r0.z * c17.y) + c17.z;
	r0.z = r0.z * r0.z;
	r0.z = r0.z * r5.y;
	r5.y = (r3.w * c17.y) + c17.z;
	r3.w = r3.w * r3.w;
	r3.w = r3.w * r5.y;
	r0.z = r0.z * r3.w;
	r3.w = (v6.w * c11.w) + r6.w;
	r5.y = r8.x * c105.y;
	r3.w = r3.w * r5.y;
	r6.xyz = r3.www * r6.xyz;
	r3.w = r8.y * c101.w;
	r7.xyz = (r4.xyz * r3.www) + -c106.xyz;
	r3.w = clamp(r3.w, 0.0, 1.0);
	r7.xyz = (r3.www * r7.xyz) + c106.xyz;
	r11.xyz = r6.xyz * r7.xyz;
	r3.w = dot(r11.xyz, c16.xyz);
	r0.z = r0.z * r3.w;
	r0.z = r0.z * c106.w;
	r11.x = ((r3.x >= 0.0) ? c13.z : c13.w);
	r11.y = ((r3.y >= 0.0) ? c13.z : c13.w);
	r11.z = ((r3.z >= 0.0) ? c13.z : c13.w);
	r12.xyz = r3.xyz * r3.xyz;
	r11.xyz = r11.xyz * r12.xyz;
	r13.xyz = r11.xxx * c5.xyz;
	r14.x = ((r3.x >= 0.0) ? c13.w : c13.z);
	r14.y = ((r3.y >= 0.0) ? c13.w : c13.z);
	r14.z = ((r3.z >= 0.0) ? c13.w : c13.z);
	r12.xyz = r12.xyz * r14.xyz;
	r13.xyz = (r12.xxx * c4.xyz) + r13.xyz;
	r12.xyw = (r12.yyy * c6.xyz) + r13.xyz;
	r11.xyw = (r11.yyy * c7.xyz) + r12.xyw;
	r11.xyw = (r12.zzz * c8.xyz) + r11.xyw;
	r11.xyz = (r11.zzz * c9.xyz) + r11.xyw;
	r5.xyz = (r9.xyz * r5.xxx) + r11.xyz;
	r5.xyz = (r10.xyz * r1.xxx) + r5.xyz;
	r1.x = dot(r5.xyz, c16.xyz);
	r8.yw = r1.xx + -c2.xw;
	r9.xy = -c2.xw + c2.yz;
	r1.x = ((r9.y == 0.0) ? FLT_MAX : 1.0 / r9.y);
	r3.w = ((r9.x == 0.0) ? FLT_MAX : 1.0 / r9.x);
	r3.w = clamp(r3.w * r8.y, 0.0, 1.0);
	r1.x = clamp(r1.x * r8.w, 0.0, 1.0);
	r6.w = (r1.x * c17.y) + c17.z;
	r1.x = r1.x * r1.x;
	r0.z = (r6.w * r1.x) + r0.z;
	r1.x = (r3.w * c17.y) + c17.z;
	r3.w = r3.w * r3.w;
	r1.x = r1.x * r3.w;
	r0.z = r0.z * r1.x;
	r0.z = r4.w * r0.z;
	r9.xyz = mix(r4.xyz, r1.yzw, r0.zzz);
	r0.z = dot(r9.xyz, c16.xyz);
	r1.xyz = r0.zzz * c102.xyz;
	r4.xyz = c16.xyz;
	r0.z = dot(c102.xyz, r4.xyz);
	r1.w = r0.z + c17.w;
	r0.z = ((r0.z == 0.0) ? FLT_MAX : 1.0 / r0.z);
	r0.z = ((r1.w >= 0.0) ? r0.z : c18.x);
	r1.xyz = (r1.xyz * r0.zzz) + -r9.xyz;
	r1.xyz = (c102.www * r1.xyz) + r9.xyz;
	r0.z = clamp(c107.w + v6.w, 0.0, 1.0);
	r1.xyz = (r1.xyz * r0.zzz) + -r9.xyz;
	r4.xyz = (r6.xyz * r7.xyz) + r5.xyz;
	r5.xyz = r5.xyz + v6.xyz;
	r0.z = dot(r4.xyz, c16.xyz);
	r0.z = r0.z + c16.w;
	r0.z = clamp(r0.z * c17.x, 0.0, 1.0);
	r1.w = (r0.z * c17.y) + c17.z;
	r0.z = r0.z * r0.z;
	r0.z = r0.z * r1.w;
	r1.xyz = (r0.zzz * r1.xyz) + r9.xyz;
	r1.xyz = r8.zzz * r1.xyz;
	r0.xyz = (r1.xyz * r5.xyz) + r0.xyw;
	r0.xyz = (r6.xyz * r7.xyz) + r0.xyz;
	r1.x = v2.w;
	r1.y = v3.w;
	r1.z = v4.w;
	r2.xyz = (r2.xyz * r2.www) + r1.xyz;
	r0.w = clamp(dot(r3.xyz, r1.xyz), 0.0, 1.0);
	r1.xyz = normalize(r2.xyz);
	r1.x = clamp(dot(r3.xyz, r1.xyz), 0.0, 1.0);
	r1.x = r0.w * r1.x;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r1.x = r5.w * r1.x;
	r0.w = r0.w * r1.x;
	r1.xyz = v6.www * v6.xyz;
	r1.xyz = r1.xyz * c107.xyz;
	r1.xyz = r0.www * r1.xyz;
	r0.xyz = (r1.xyz * r8.xxx) + r0.xyz;
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

