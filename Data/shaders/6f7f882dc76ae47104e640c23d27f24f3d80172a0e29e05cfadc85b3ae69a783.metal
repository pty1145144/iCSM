#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[35];
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
	const float4 c26 = float4(5.000000000e-01, 1.591549367e-01, 6.283185482e+00, -3.141592741e+00); (void) c26;
	const float4 c27 = float4(5.773500204e-01, -4.000000060e-01, 5.000000000e+00, -3.000000119e-01); (void) c27;
	const float4 c29 = float4(2.000000000e+00, -1.000000000e+00, 0.000000000e+00, 1.000000000e+00); (void) c29;
	const float4 c31 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -3.333333254e+00); (void) c31;
	const float4 c32 = float4(-2.000000000e+00, 3.000000000e+00, -9.999999975e-07, 1.000000000e+06); (void) c32;
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
	float4 r21;
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
	#define c13 uniforms.uniforms_float4[13]
	#define c14 uniforms.uniforms_float4[14]
	#define c15 uniforms.uniforms_float4[15]
	#define c16 uniforms.uniforms_float4[16]
	#define c17 uniforms.uniforms_float4[17]
	#define c18 uniforms.uniforms_float4[18]
	#define c19 uniforms.uniforms_float4[19]
	#define c20 uniforms.uniforms_float4[20]
	#define c21 uniforms.uniforms_float4[21]
	#define c22 uniforms.uniforms_float4[22]
	#define c23 uniforms.uniforms_float4[23]
	#define c24 uniforms.uniforms_float4[24]
	#define c25 uniforms.uniforms_float4[25]
	#define c28 uniforms.uniforms_float4[26]
	#define c30 uniforms.uniforms_float4[27]
	#define c33 uniforms.uniforms_float4[28]
	#define c101 uniforms.uniforms_float4[29]
	#define c102 uniforms.uniforms_float4[30]
	#define c105 uniforms.uniforms_float4[31]
	#define c106 uniforms.uniforms_float4[32]
	#define c107 uniforms.uniforms_float4[33]
	#define c109 uniforms.uniforms_float4[34]
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
	r0.x = r0.x + -c29.x;
	oC0.w = clamp(r0.x * c19.w, 0.0, 1.0);
	r0.xyz = c31.xyz;
	r0.x = dot(c102.xyz, r0.xyz);
	r0.y = r0.x + c32.z;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = ((r0.y >= 0.0) ? r0.x : c32.w);
	r1 = s3_texture.sample(s3, v0.xy);
	r0.y = r1.x * c12.w;
	r0.y = (r0.y * c26.y) + c26.x;
	r0.y = fract(r0.y);
	r0.y = (r0.y * c26.z) + c26.w;
	r2.xy = float2(cos(r0.y), sin(r0.y));
	r3 = s0_texture.sample(s0, v0.xy);
	r0.yzw = r3.zxy * c27.xxx;
	r0.yzw = (r3.zxy * c27.xxx) + -r0.wyz;
	r0.yzw = r2.yyy * r0.yzw;
	r0.yzw = (r3.xyz * r2.xxx) + r0.yzw;
	r1.y = -r2.x + c29.w;
	r1.z = dot(c27.xxx, r3.xyz);
	r1.z = r1.z * c27.x;
	r2.xyz = (r1.zzz * r1.yyy) + r0.yzw;
	r0.y = abs(c12.w);
	r2.w = c29.w;
	r3.w = r1.x;
	r0.z = -r1.w + c29.w;
	r1 = ((-r0.y >= 0.0) ? r3 : r2);
	r2.xyz = r1.xyz * r1.xyz;
	r2.xyz = r2.xyz * r2.xyz;
	r0.y = dot(r2.xyz, c31.xyz);
	r0.w = r0.y + c32.z;
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r0.y = ((r0.w >= 0.0) ? r0.y : c32.w);
	r0.w = dot(r1.xyz, c31.xyz);
	r2.xyz = r0.www * r2.xyz;
	r3.xyz = mix(r1.xyz, r0.www, -c101.yyy);
	r2.xyz = (r2.xyz * r0.yyy) + -r1.xyz;
	r2.xyz = (c101.yyy * r2.xyz) + r1.xyz;
	r2.xyz = ((c101.y >= 0.0) ? r2.xyz : r3.xyz);
	r0.y = abs(c101.y);
	r2.xyz = ((-r0.y >= 0.0) ? r1.xyz : r2.xyz);
	r0.yw = -c33.xw + c33.yz;
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r3.xyz = c23.xyz + -v5.xyz;
	r4.xyz = normalize(r3.xyz);
	r3.xyz = c3.xyz + -v5.xyz;
	r2.w = dot(r3.xyz, r3.xyz);
	r2.w = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r5.xyz = (r3.xyz * r2.www) + r4.xyz;
	r6.xyz = normalize(r5.xyz);
	r5 = s1_texture.sample(s1, v0.xy);
	r5.xyz = (r5.xyz * c29.xxx) + c29.yyy;
	r7.x = dot(v2.xyz, r5.xyz);
	r7.y = dot(v3.xyz, r5.xyz);
	r7.z = dot(v4.xyz, r5.xyz);
	r5.xyz = normalize(r7.xyz);
	r6.y = clamp(dot(r5.xyz, r6.xyz), 0.0, 1.0);
	r3.w = clamp(dot(r5.xyz, r4.xyz), 0.0, 1.0);
	r4.w = r3.w * r6.y;
	r7.xyz = r2.www * r3.xyz;
	r6.w = dot(r7.xyz, r5.xyz);
	r8.z = clamp(r6.w, 0.0, 1.0);
	r6.w = r6.w + r6.w;
	r7.w = -r8.z + c29.w;
	r9.x = pow(abs(r7.w), c105.x);
	r4.w = r4.w * r9.x;
	r7.w = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r3.w = (r3.w * r3.w) + r3.w;
	r3.w = r3.w * c26.x;
	r7.w = ((r7.w == 0.0) ? FLT_MAX : 1.0 / r7.w);
	r4.w = r4.w * r7.w;
	r9.yzw = c21.xyz + -v5.xyz;
	r10.xyz = normalize(r9.yzw);
	r9.yzw = (r3.xyz * r2.www) + r10.xyz;
	r11.xyz = normalize(r9.yzw);
	r8.x = clamp(dot(r5.xyz, r11.xyz), 0.0, 1.0);
	r9.y = clamp(dot(r5.xyz, r10.xyz), 0.0, 1.0);
	r9.z = r8.x * r9.y;
	r9.z = r9.x * r9.z;
	r9.w = ((r9.y == 0.0) ? FLT_MAX : rsqrt(abs(r9.y)));
	r9.y = (r9.y * r9.y) + r9.y;
	r9.y = r9.y * c26.x;
	r9.w = ((r9.w == 0.0) ? FLT_MAX : 1.0 / r9.w);
	r10.w = (r9.z * r9.w) + r4.w;
	r9.z = r9.w * r9.z;
	r11.xyz = c25.xyz + -v5.xyz;
	r12.xyz = normalize(r11.xyz);
	r11.xyz = (r3.xyz * r2.www) + r12.xyz;
	r13.xyz = normalize(r11.xyz);
	r6.x = clamp(dot(r5.xyz, r13.xyz), 0.0, 1.0);
	r11.x = clamp(dot(r5.xyz, r12.xyz), 0.0, 1.0);
	r11.y = clamp(dot(r7.xyz, r12.xyz), 0.0, 1.0);
	r11.z = r6.x * r11.x;
	r9.x = r9.x * r11.z;
	r11.z = ((r11.x == 0.0) ? FLT_MAX : rsqrt(abs(r11.x)));
	r11.x = (r11.x * r11.x) + r11.x;
	r11.x = r11.x * c26.x;
	r11.z = ((r11.z == 0.0) ? FLT_MAX : 1.0 / r11.z);
	r10.w = (r9.x * r11.z) + r10.w;
	r9.x = r9.x * r11.z;
	r12.xy = r10.ww + -c33.xw;
	r0.yw = clamp(r0.yw * r12.xy, float2(0.0), float2(1.0));
	r10.w = (r0.y * c32.x) + c32.y;
	r0.y = r0.y * r0.y;
	r0.y = r0.y * r10.w;
	r10.w = (r0.w * c32.x) + c32.y;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r10.w;
	r0.y = r0.w * r0.y;
	r12 = s10_texture.sample(s10, v0.xy);
	r0.w = r12.y * c101.w;
	r13.xyz = (r1.xyz * r0.www) + -c106.xyz;
	r0.w = clamp(r0.w, 0.0, 1.0);
	r13.xyz = (r0.www * r13.xyz) + c106.xyz;
	r14.xyz = c22.xyz * v1.yyy;
	r15.xyz = r4.www * r14.xyz;
	r16.xyz = c20.xyz * v1.xxx;
	r15.xyz = (r9.zzz * r16.xyz) + r15.xyz;
	r17.xyz = c24.xyz * v1.zzz;
	r15.xyz = (r9.xxx * r17.xyz) + r15.xyz;
	r0.w = c29.w;
	r0.w = (v6.w * c11.w) + r0.w;
	r4.w = r12.x * c105.y;
	r0.w = r0.w * r4.w;
	r15.xyz = r0.www * r15.xyz;
	r18.xyz = r13.xyz * r15.xyz;
	r0.w = dot(r18.xyz, c31.xyz);
	r0.y = r0.w * r0.y;
	r0.y = r0.y * c106.w;
	r18.x = ((r5.x >= 0.0) ? c29.z : c29.w);
	r18.y = ((r5.y >= 0.0) ? c29.z : c29.w);
	r18.z = ((r5.z >= 0.0) ? c29.z : c29.w);
	r19.xyz = r5.xyz * r5.xyz;
	r18.xyz = r18.xyz * r19.xyz;
	r20.xyz = r18.xxx * c5.xyz;
	r21.x = ((r5.x >= 0.0) ? c29.w : c29.z);
	r21.y = ((r5.y >= 0.0) ? c29.w : c29.z);
	r21.z = ((r5.z >= 0.0) ? c29.w : c29.z);
	r19.xyz = r19.xyz * r21.xyz;
	r20.xyz = (r19.xxx * c4.xyz) + r20.xyz;
	r19.xyw = (r19.yyy * c6.xyz) + r20.xyz;
	r18.xyw = (r18.yyy * c7.xyz) + r19.xyw;
	r18.xyw = (r19.zzz * c8.xyz) + r18.xyw;
	r18.xyz = (r18.zzz * c9.xyz) + r18.xyw;
	r9.xyz = (r16.xyz * r9.yyy) + r18.xyz;
	r9.xyz = (r14.xyz * r3.www) + r9.xyz;
	r9.xyz = (r17.xyz * r11.xxx) + r9.xyz;
	r18 = (v5.xyzx * c29.wwwz) + c29.zzzw;
	r0.w = dot(r18, c18);
	r3.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r19.x = dot(r18, c15);
	r19.y = dot(r18, c16);
	r19.z = dot(r18, c17);
	r18.xyz = r3.www * r19.xyz;
	r19 = s8_texture.sample(s8, r18.xy);
	r19.xyz = ((-r0.w >= 0.0) ? c29.zzz : r19.xyz);
	r20.xyz = r19.xyz * c28.xyz;
	r18.w = c29.w;
	r18 = float4(s11_texture.sample_compare(s11, (r18.xyz).xy, (r18.xyz).z));
	r0.w = clamp(r18.x, 0.0, 1.0);
	r3.w = -r0.w + c29.w;
	r0.w = (c109.y * r3.w) + r0.w;
	r21.x = c29.w;
	r18.yzw = c14.xyz + -v5.xyz;
	r3.w = dot(r18.yzw, r18.yzw);
	r21.z = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r21.y = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r3.w = clamp(dot(c13.xyz, r21.xyz), 0.0, 1.0);
	r4.w = clamp(mix(r0.w, r18.x, r3.w), 0.0, 1.0);
	r20.xyz = r4.www * r20.xyz;
	r18.yzw = r18.yzw * r21.yyy;
	r0.w = ((r21.y == 0.0) ? FLT_MAX : 1.0 / r21.y);
	r0.w = r0.w + -c13.w;
	r4.w = dot(r18.yzw, r5.xyz);
	r3.xyz = (r3.xyz * r2.www) + r18.yzw;
	r21.xyz = normalize(r3.xyz);
	r8.y = clamp(dot(r5.xyz, r21.xyz), 0.0, 1.0);
	r2.w = clamp(r4.w + c28.w, 0.0, 1.0);
	r4.w = clamp(r4.w, 0.0, 1.0);
	r3.x = ((r4.w == 0.0) ? FLT_MAX : rsqrt(abs(r4.w)));
	r3.x = ((r3.x == 0.0) ? FLT_MAX : 1.0 / r3.x);
	r2.w = r2.w * r3.w;
	r18.yzw = r20.xyz * r2.www;
	r3.y = c27.y;
	r2.w = r3.y * c13.w;
	r2.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r0.w = clamp(r0.w * r2.w, 0.0, 1.0);
	r9.xyz = (r18.yzw * r0.www) + r9.xyz;
	r0.w = r0.w * r3.w;
	r18.yzw = r0.www * c28.xyz;
	r18.yzw = r18.yzw * r19.xyz;
	r0.w = dot(r9.xyz, c31.xyz);
	r3.yz = r0.ww + -c2.xw;
	r11.xw = -c2.xw + c2.yz;
	r0.w = ((r11.w == 0.0) ? FLT_MAX : 1.0 / r11.w);
	r2.w = ((r11.x == 0.0) ? FLT_MAX : 1.0 / r11.x);
	r2.w = clamp(r2.w * r3.y, 0.0, 1.0);
	r0.w = clamp(r0.w * r3.z, 0.0, 1.0);
	r3.y = (r0.w * c32.x) + c32.y;
	r0.w = r0.w * r0.w;
	r0.y = (r3.y * r0.w) + r0.y;
	r0.w = (r2.w * c32.x) + c32.y;
	r2.w = r2.w * r2.w;
	r0.w = r0.w * r2.w;
	r0.y = r0.y * r0.w;
	r0.y = r1.w * r0.y;
	r19.xyz = mix(r1.xyz, r2.xyz, r0.yyy);
	r1.xyz = r1.xyz + c29.yyy;
	r1.xyz = (r12.yyy * r1.xyz) + c29.www;
	r0.y = dot(r19.xyz, c31.xyz);
	r2.xyz = r0.yyy * c102.xyz;
	r0.xyw = (r2.xyz * r0.xxx) + -r19.xyz;
	r0.xyw = (c102.www * r0.xyw) + r19.xyz;
	r1.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r0.xyw = (r0.xyw * r1.www) + -r19.xyz;
	r2.xyz = (r15.xyz * r13.xyz) + r9.xyz;
	r9.xyz = r9.xyz + v6.xyz;
	r1.w = dot(r2.xyz, c31.xyz);
	r1.w = r1.w + c27.w;
	r1.w = clamp(r1.w * c31.w, 0.0, 1.0);
	r2.x = (r1.w * c32.x) + c32.y;
	r1.w = r1.w * r1.w;
	r1.w = r1.w * r2.x;
	r0.xyw = (r1.www * r0.xyw) + r19.xyz;
	r0.xyw = r12.zzz * r0.xyw;
	r1.w = -r18.x + c29.w;
	r1.w = (c109.y * r1.w) + r18.x;
	r2.x = clamp(mix(r1.w, r18.x, r3.w), 0.0, 1.0);
	r2.xyz = r2.xxx * r18.yzw;
	r1.w = clamp(dot(r7.xyz, r10.xyz), 0.0, 1.0);
	r2.w = clamp(r10.z, 0.0, 1.0);
	r2.w = (r2.w * r2.w) + r2.w;
	r2.w = r2.w * c26.x;
	r3.yzw = r2.www * r16.xyz;
	r2.w = r8.z * r8.z;
	r10.w = r2.w * r2.w;
	r2.w = r0.z * r10.w;
	r18.xyz = r2.www * v6.xyz;
	r10.xyz = r18.xyz * c27.zzz;
	r10 = ((-r0.z >= 0.0) ? c29.zzzz : r10);
	r1.w = r1.w * r10.w;
	r8.w = r12.w;
	r18 = s7_texture.sample(s7, r8.xw);
	r19.xyz = (r1.www * c27.zzz) + -r18.xyz;
	r19.xyz = (r0.zzz * r19.xyz) + r18.xyz;
	r18.xyz = ((-r0.z >= 0.0) ? r18.xyz : r19.xyz);
	r18.xyz = r9.www * r18.xyz;
	r10.xyz = (r18.xyz * r16.xyz) + r10.xyz;
	r1.w = clamp(dot(r7.xyz, r4.xyz), 0.0, 1.0);
	r1.w = r1.w * r10.w;
	r2.w = r11.y * r10.w;
	r6.z = r8.w;
	r4 = s7_texture.sample(s7, r6.yz);
	r18 = s7_texture.sample(s7, r6.xz);
	r6.xyz = (r1.www * c27.zzz) + -r4.xyz;
	r6.xyz = (r0.zzz * r6.xyz) + r4.xyz;
	r4.xyz = ((-r0.z >= 0.0) ? r4.xyz : r6.xyz);
	r4.xyz = r7.www * r4.xyz;
	r4.xyz = (r4.xyz * r14.xyz) + r10.xyz;
	r6.xyz = (r2.www * c27.zzz) + -r18.xyz;
	r6.xyz = (r0.zzz * r6.xyz) + r18.xyz;
	r6.xyz = ((-r0.z >= 0.0) ? r18.xyz : r6.xyz);
	r6.xyz = r11.zzz * r6.xyz;
	r4.xyz = (r6.xyz * r17.xyz) + r4.xyz;
	r10 = s7_texture.sample(s7, r8.yw);
	r8 = s4_texture.sample(s4, r8.zw);
	r6.xyz = r3.xxx * r10.xyz;
	r2.xyz = (r6.xyz * r2.xyz) + r4.xyz;
	r2.xyz = r5.www * r2.xyz;
	r1.w = mix(c10.x, c10.y, r12.y);
	r2.w = r12.x * r8.z;
	r3.x = mix(r8.y, c29.w, r0.z);
	r0.z = r2.w * c0.w;
	r2.xyz = r1.www * r2.xyz;
	r1.w = dot(r5.xyz, r5.xyz);
	r4.xyz = r7.xyz * r1.www;
	r4.xyz = (r6.www * r5.xyz) + -r4.xyz;
	r1.w = clamp(dot(r5.xyz, v9.xyz), 0.0, 1.0);
	r5.x = ((r4.x >= 0.0) ? c29.z : c29.w);
	r5.y = ((r4.y >= 0.0) ? c29.z : c29.w);
	r5.z = ((r4.z >= 0.0) ? c29.z : c29.w);
	r6.xyz = r4.xyz * r4.xyz;
	r4.x = ((r4.x >= 0.0) ? c29.w : c29.z);
	r4.y = ((r4.y >= 0.0) ? c29.w : c29.z);
	r4.z = ((r4.z >= 0.0) ? c29.w : c29.z);
	r4.xyz = r6.xyz * r4.xyz;
	r5.xyz = r5.xyz * r6.xyz;
	r6.xyz = r5.xxx * c5.xyz;
	r6.xyz = (r4.xxx * c4.xyz) + r6.xyz;
	r4.xyw = (r4.yyy * c6.xyz) + r6.xyz;
	r4.xyw = (r5.yyy * c7.xyz) + r4.xyw;
	r4.xyz = (r4.zzz * c8.xyz) + r4.xyw;
	r4.xyz = (r5.zzz * c9.xyz) + r4.xyz;
	r3.yzw = r3.yzw * r4.xyz;
	r4.x = v7.w;
	r4.y = v8.w;
	r4.z = v9.w;
	r4.xyz = -r4.xyz + c21.xyz;
	r5.xyz = normalize(r4.xyz);
	r2.w = clamp(dot(-v9.xyz, r5.xyz), 0.0, 1.0);
	r2.w = (r2.w * r2.w) + r2.w;
	r2.w = r2.w * c26.x;
	r4.xyz = r2.www * r16.xyz;
	r5.xyz = c0.xyz * v6.xyz;
	r4.xyz = (r5.xyz * r4.xyz) + -r3.yzw;
	r3.yzw = (r1.www * r4.xyz) + r3.yzw;
	r3.yzw = r0.zzz * r3.yzw;
	r2.xyz = (r2.xyz * r3.xxx) + r3.yzw;
	r1.xyz = r1.xyz * r2.xyz;
	r0.xyz = (r0.xyw * r9.xyz) + r1.xyz;
	r0.xyz = (r15.xyz * r13.xyz) + r0.xyz;
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
	#undef c13
	#undef c14
	#undef c15
	#undef c16
	#undef c17
	#undef c18
	#undef c19
	#undef c20
	#undef c21
	#undef c22
	#undef c23
	#undef c24
	#undef c25
	#undef c28
	#undef c30
	#undef c33
	#undef c101
	#undef c102
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

