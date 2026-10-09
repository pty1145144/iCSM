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
	depth2d<float> s8_texture [[texture(8)]],
	sampler s8 [[sampler(8)]],
	texture2d<float> s10_texture [[texture(10)]],
	sampler s10 [[sampler(10)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c13 = float4(2.000000000e+00, -1.000000000e+00, 1.000000000e+00, 0.000000000e+00); (void) c13;
	const float4 c14 = float4(1.041666627e+00, -2.083333395e-02, 5.000000000e-01, 1.591549367e-01); (void) c14;
	const float4 c15 = float4(6.283185482e+00, -3.141592741e+00, 5.773500204e-01, 5.000000000e+00); (void) c15;
	const float4 c16 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -3.000000119e-01); (void) c16;
	const float4 c17 = float4(-3.333333254e+00, -2.000000000e+00, 3.000000000e+00, -9.999999975e-07); (void) c17;
	const float4 c18 = float4(1.000000000e+06, 0.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c18;
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
	#define c20 uniforms.uniforms_float4[13]
	#define c21 uniforms.uniforms_float4[14]
	#define c22 uniforms.uniforms_float4[15]
	#define c23 uniforms.uniforms_float4[16]
	#define c24 uniforms.uniforms_float4[17]
	#define c25 uniforms.uniforms_float4[18]
	#define c30 uniforms.uniforms_float4[19]
	#define c33 uniforms.uniforms_float4[20]
	#define c68 uniforms.uniforms_float4[21]
	#define c71 uniforms.uniforms_float4[22]
	#define c73 uniforms.uniforms_float4[23]
	#define c74 uniforms.uniforms_float4[24]
	#define c77 uniforms.uniforms_float4[25]
	#define c78 uniforms.uniforms_float4[26]
	#define c86 uniforms.uniforms_float4[27]
	#define c87 uniforms.uniforms_float4[28]
	#define c89 uniforms.uniforms_float4[29]
	#define c101 uniforms.uniforms_float4[30]
	#define c102 uniforms.uniforms_float4[31]
	#define c105 uniforms.uniforms_float4[32]
	#define c106 uniforms.uniforms_float4[33]
	#define c107 uniforms.uniforms_float4[34]
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
	r0 = s0_texture.sample(s0, v0.xy);
	oC0.w = r0.w * c1.w;
	r1.xyz = c16.xyz;
	r1.x = dot(c102.xyz, r1.xyz);
	r1.y = r1.x + c17.w;
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.x = ((r1.y >= 0.0) ? r1.x : c18.x);
	r1.yzw = r0.zxy * c15.zzz;
	r1.yzw = (r0.zxy * c15.zzz) + -r1.wyz;
	r2 = s3_texture.sample(s3, v0.xy);
	r2.y = r2.x * c12.w;
	r2.y = (r2.y * c14.w) + c14.z;
	r2.y = fract(r2.y);
	r2.y = (r2.y * c15.x) + c15.y;
	r3.xy = float2(cos(r2.y), sin(r2.y));
	r1.yzw = r1.yzw * r3.yyy;
	r1.yzw = (r0.xyz * r3.xxx) + r1.yzw;
	r2.y = -r3.x + c13.z;
	r2.z = dot(c15.zzz, r0.xyz);
	r2.z = r2.z * c15.z;
	r3.xyz = (r2.zzz * r2.yyy) + r1.yzw;
	r1.y = abs(c12.w);
	r3.w = c13.z;
	r0.w = r2.x;
	r1.z = -r2.w + c13.z;
	r0 = ((-r1.y >= 0.0) ? r0 : r3);
	r2.xyz = r0.xyz * r0.xyz;
	r2.xyz = r2.xyz * r2.xyz;
	r1.y = dot(r2.xyz, c16.xyz);
	r1.w = r1.y + c17.w;
	r1.y = ((r1.y == 0.0) ? FLT_MAX : 1.0 / r1.y);
	r1.y = ((r1.w >= 0.0) ? r1.y : c18.x);
	r1.w = dot(r0.xyz, c16.xyz);
	r2.xyz = r1.www * r2.xyz;
	r3.xyz = mix(r0.xyz, r1.www, -c101.yyy);
	r2.xyz = (r2.xyz * r1.yyy) + -r0.xyz;
	r2.xyz = (c101.yyy * r2.xyz) + r0.xyz;
	r2.xyz = ((c101.y >= 0.0) ? r2.xyz : r3.xyz);
	r1.y = abs(c101.y);
	r2.xyz = ((-r1.y >= 0.0) ? r0.xyz : r2.xyz);
	r3 = s10_texture.sample(s10, v0.xy);
	r1.y = r3.y * c101.w;
	r4.xyz = (r0.xyz * r1.yyy) + -c106.xyz;
	r1.y = clamp(r1.y, 0.0, 1.0);
	r4.xyz = (r1.yyy * r4.xyz) + c106.xyz;
	r5 = (v5.xyzx * c13.zzzw) + c13.wwwz;
	r6.x = dot(r5, c73);
	r6.y = dot(r5, c74);
	r1.yw = (r6.xy * c14.xx) + c14.yy;
	r6.zw = clamp(r1.yw, float2(0.0), float2(1.0));
	r1.yw = -r1.yw + r6.zw;
	r1.y = dot(r1.yw, c13.zz) + c13.w;
	r1.w = dot(r5, c77);
	r7.x = clamp(((-abs(r1.y) >= 0.0) ? r6.x : r1.w), 0.0, 1.0);
	r1.w = dot(r5, c78);
	r5.z = dot(r5, c71);
	r7.y = clamp(((-abs(r1.y) >= 0.0) ? r6.y : r1.w), 0.0, 1.0);
	r6.xy = c86.xy;
	r1.yw = ((-abs(r1.y) >= 0.0) ? r6.xy : c87.xy);
	r5.xy = (r7.xy * c14.zz) + r1.yw;
	r5.w = c13.w;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
	r5.yzw = -c89.xyz + v5.xyz;
	r1.y = dot(r5.yzw, r5.yzw);
	r1.y = clamp((r1.y * c68.y) + c68.x, 0.0, 1.0);
	r2.w = mix(r5.x, c13.z, r1.y);
	r5.xyz = c23.xyz + -v5.xyz;
	r6.xyz = normalize(r5.xyz);
	r5.xyz = c3.xyz + -v5.xyz;
	r1.y = dot(r5.xyz, r5.xyz);
	r1.y = ((r1.y == 0.0) ? FLT_MAX : rsqrt(abs(r1.y)));
	r7.xyz = (r5.xyz * r1.yyy) + r6.xyz;
	r8.xyz = normalize(r7.xyz);
	r7 = s1_texture.sample(s1, v0.xy);
	r7.xyz = (r7.xyz * c13.xxx) + c13.yyy;
	r9.x = dot(v2.xyz, r7.xyz);
	r9.y = dot(v3.xyz, r7.xyz);
	r9.z = dot(v4.xyz, r7.xyz);
	r7.xyz = normalize(r9.xyz);
	r8.x = clamp(dot(r7.xyz, r8.xyz), 0.0, 1.0);
	r1.w = clamp(dot(r7.xyz, r6.xyz), 0.0, 1.0);
	r4.w = r1.w * r8.x;
	r9.xyz = r1.yyy * r5.xyz;
	r5.w = dot(r9.xyz, r7.xyz);
	r8.z = clamp(r5.w, 0.0, 1.0);
	r5.w = r5.w + r5.w;
	r6.w = -r8.z + c13.z;
	r9.w = pow(abs(r6.w), c105.x);
	r4.w = r4.w * r9.w;
	r6.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.w = (r1.w * r1.w) + r1.w;
	r1.w = r1.w * c14.z;
	r6.w = ((r6.w == 0.0) ? FLT_MAX : 1.0 / r6.w);
	r4.w = r4.w * r6.w;
	r10.xyz = c22.xyz * v1.yyy;
	r11.xyz = r4.www * r10.xyz;
	r12.xyz = c21.xyz + -v5.xyz;
	r13.xyz = normalize(r12.xyz);
	r12.xyz = (r5.xyz * r1.yyy) + r13.xyz;
	r14.xyz = normalize(r12.xyz);
	r8.y = clamp(dot(r7.xyz, r14.xyz), 0.0, 1.0);
	r10.w = clamp(dot(r7.xyz, r13.xyz), 0.0, 1.0);
	r11.w = r8.y * r10.w;
	r11.w = r9.w * r11.w;
	r12.x = ((r10.w == 0.0) ? FLT_MAX : rsqrt(abs(r10.w)));
	r10.w = (r10.w * r10.w) + r10.w;
	r10.w = r10.w * c14.z;
	r12.x = ((r12.x == 0.0) ? FLT_MAX : 1.0 / r12.x);
	r12.y = r11.w * r12.x;
	r4.w = (r11.w * r12.x) + r4.w;
	r14.xyz = c20.xyz * v1.xxx;
	r12.yzw = r12.yyy * r14.xyz;
	r11.xyz = (r12.yzw * r2.www) + r11.xyz;
	r12.yzw = c25.xyz + -v5.xyz;
	r15.xyz = normalize(r12.yzw);
	r12.yzw = (r5.xyz * r1.yyy) + r15.xyz;
	r16.xyz = normalize(r12.yzw);
	r16.x = clamp(dot(r7.xyz, r16.xyz), 0.0, 1.0);
	r11.w = clamp(dot(r7.xyz, r15.xyz), 0.0, 1.0);
	r12.y = clamp(dot(r9.xyz, r15.xyz), 0.0, 1.0);
	r12.z = r11.w * r16.x;
	r12.z = r9.w * r12.z;
	r12.w = ((r11.w == 0.0) ? FLT_MAX : rsqrt(abs(r11.w)));
	r11.w = (r11.w * r11.w) + r11.w;
	r11.w = r11.w * c14.z;
	r12.w = ((r12.w == 0.0) ? FLT_MAX : 1.0 / r12.w);
	r13.w = r12.w * r12.z;
	r4.w = (r12.z * r12.w) + r4.w;
	r15.xy = r4.ww + -c33.xw;
	r17.xyz = c24.xyz * v1.zzz;
	r11.xyz = (r13.www * r17.xyz) + r11.xyz;
	r12.z = c13.z;
	r4.w = (v6.w * c11.w) + r12.z;
	r12.z = r3.x * c105.y;
	r4.w = r4.w * r12.z;
	r11.xyz = r4.www * r11.xyz;
	r18.xyz = r4.xyz * r11.xyz;
	r4.w = dot(r18.xyz, c16.xyz);
	r15.zw = -c33.xw + c33.yz;
	r12.z = ((r15.z == 0.0) ? FLT_MAX : 1.0 / r15.z);
	r13.w = ((r15.w == 0.0) ? FLT_MAX : 1.0 / r15.w);
	r13.w = clamp(r13.w * r15.y, 0.0, 1.0);
	r12.z = clamp(r12.z * r15.x, 0.0, 1.0);
	r14.w = (r12.z * c17.y) + c17.z;
	r12.z = r12.z * r12.z;
	r12.z = r12.z * r14.w;
	r14.w = (r13.w * c17.y) + c17.z;
	r13.w = r13.w * r13.w;
	r13.w = r13.w * r14.w;
	r12.z = r12.z * r13.w;
	r4.w = r4.w * r12.z;
	r4.w = r4.w * c106.w;
	r15.x = ((r7.x >= 0.0) ? c13.w : c13.z);
	r15.y = ((r7.y >= 0.0) ? c13.w : c13.z);
	r15.z = ((r7.z >= 0.0) ? c13.w : c13.z);
	r18.xyz = r7.xyz * r7.xyz;
	r15.xyz = r15.xyz * r18.xyz;
	r19.xyz = r15.xxx * c5.xyz;
	r20.x = ((r7.x >= 0.0) ? c13.z : c13.w);
	r20.y = ((r7.y >= 0.0) ? c13.z : c13.w);
	r20.z = ((r7.z >= 0.0) ? c13.z : c13.w);
	r18.xyz = r18.xyz * r20.xyz;
	r19.xyz = (r18.xxx * c4.xyz) + r19.xyz;
	r18.xyw = (r18.yyy * c6.xyz) + r19.xyz;
	r15.xyw = (r15.yyy * c7.xyz) + r18.xyw;
	r15.xyw = (r18.zzz * c8.xyz) + r15.xyw;
	r15.xyz = (r15.zzz * c9.xyz) + r15.xyw;
	r18.xyz = r10.www * r14.xyz;
	r15.xyz = (r18.xyz * r2.www) + r15.xyz;
	r15.xyz = (r10.xyz * r1.www) + r15.xyz;
	r15.xyz = (r17.xyz * r11.www) + r15.xyz;
	r1.w = dot(r15.xyz, c16.xyz);
	r16.zw = r1.ww + -c2.xw;
	r18.xy = -c2.xw + c2.yz;
	r1.w = ((r18.y == 0.0) ? FLT_MAX : 1.0 / r18.y);
	r10.w = ((r18.x == 0.0) ? FLT_MAX : 1.0 / r18.x);
	r10.w = clamp(r10.w * r16.z, 0.0, 1.0);
	r1.w = clamp(r1.w * r16.w, 0.0, 1.0);
	r11.w = (r1.w * c17.y) + c17.z;
	r1.w = r1.w * r1.w;
	r1.w = (r11.w * r1.w) + r4.w;
	r4.w = (r10.w * c17.y) + c17.z;
	r10.w = r10.w * r10.w;
	r4.w = r4.w * r10.w;
	r1.w = r1.w * r4.w;
	r0.w = r0.w * r1.w;
	r18.xyz = mix(r0.xyz, r2.xyz, r0.www);
	r0.xyz = r0.xyz + c13.yyy;
	r0.xyz = (r3.yyy * r0.xyz) + c13.zzz;
	r0.w = dot(r18.xyz, c16.xyz);
	r2.xyz = r0.www * c102.xyz;
	r2.xyz = (r2.xyz * r1.xxx) + -r18.xyz;
	r2.xyz = (c102.www * r2.xyz) + r18.xyz;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r2.xyz = (r2.xyz * r0.www) + -r18.xyz;
	r19.xyz = (r11.xyz * r4.xyz) + r15.xyz;
	r15.xyz = r15.xyz + v6.xyz;
	r0.w = dot(r19.xyz, c16.xyz);
	r0.w = r0.w + c16.w;
	r0.w = clamp(r0.w * c17.x, 0.0, 1.0);
	r1.x = (r0.w * c17.y) + c17.z;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.x;
	r2.xyz = (r0.www * r2.xyz) + r18.xyz;
	r2.xyz = r3.zzz * r2.xyz;
	r0.w = clamp(dot(r9.xyz, r13.xyz), 0.0, 1.0);
	r1.x = clamp(r13.z, 0.0, 1.0);
	r1.x = (r1.x * r1.x) + r1.x;
	r1.x = r1.x * c14.z;
	r13.xyz = r1.xxx * r14.xyz;
	r1.x = r8.z * r8.z;
	r18.w = r1.x * r1.x;
	r1.x = r1.z * r18.w;
	r19.xyz = r1.xxx * v6.xyz;
	r18.xyz = r19.xyz * c15.www;
	r18 = ((-r1.z >= 0.0) ? c13.wwww : r18);
	r0.w = r0.w * r18.w;
	r8.w = r3.w;
	r19 = s7_texture.sample(s7, r8.yw);
	r20.xyz = (r0.www * c15.www) + -r19.xyz;
	r20.xyz = (r1.zzz * r20.xyz) + r19.xyz;
	r19.xyz = ((-r1.z >= 0.0) ? r19.xyz : r20.xyz);
	r19.xyz = r12.xxx * r19.xyz;
	r19.xyz = r14.xyz * r19.xyz;
	r18.xyz = (r19.xyz * r2.www) + r18.xyz;
	r0.w = clamp(dot(r9.xyz, r6.xyz), 0.0, 1.0);
	r0.w = r0.w * r18.w;
	r1.x = r12.y * r18.w;
	r19 = s7_texture.sample(s7, r8.xw);
	r6.xyz = (r0.www * c15.www) + -r19.xyz;
	r6.xyz = (r1.zzz * r6.xyz) + r19.xyz;
	r6.xyz = ((-r1.z >= 0.0) ? r19.xyz : r6.xyz);
	r6.xyz = r6.www * r6.xyz;
	r6.xyz = (r6.xyz * r10.xyz) + r18.xyz;
	r16.y = r8.w;
	r8 = s4_texture.sample(s4, r8.zw);
	r10 = s7_texture.sample(s7, r16.xy);
	r12.xyz = (r1.xxx * c15.www) + -r10.xyz;
	r12.xyz = (r1.zzz * r12.xyz) + r10.xyz;
	r10.xyz = ((-r1.z >= 0.0) ? r10.xyz : r12.xyz);
	r0.w = mix(r8.y, c13.z, r1.z);
	r1.x = r3.x * r8.z;
	r1.x = r1.x * c0.w;
	r8.xyz = r12.www * r10.xyz;
	r6.xyz = (r8.xyz * r17.xyz) + r6.xyz;
	r6.xyz = r7.www * r6.xyz;
	r1.z = mix(c10.x, c10.y, r3.y);
	r3.yzw = r1.zzz * r6.xyz;
	r6.x = v7.w;
	r6.y = v8.w;
	r6.z = v9.w;
	r6.xyz = -r6.xyz + c21.xyz;
	r8.xyz = normalize(r6.xyz);
	r1.z = clamp(dot(-v9.xyz, r8.xyz), 0.0, 1.0);
	r1.z = (r1.z * r1.z) + r1.z;
	r1.z = r1.z * c14.z;
	r6.xyz = r1.zzz * r14.xyz;
	r1.z = dot(r7.xyz, r7.xyz);
	r8.xyz = r9.xyz * r1.zzz;
	r8.xyz = (r5.www * r7.xyz) + -r8.xyz;
	r9.x = ((r8.x >= 0.0) ? c13.w : c13.z);
	r9.y = ((r8.y >= 0.0) ? c13.w : c13.z);
	r9.z = ((r8.z >= 0.0) ? c13.w : c13.z);
	r10.xyz = r8.xyz * r8.xyz;
	r8.x = ((r8.x >= 0.0) ? c13.z : c13.w);
	r8.y = ((r8.y >= 0.0) ? c13.z : c13.w);
	r8.z = ((r8.z >= 0.0) ? c13.z : c13.w);
	r8.xyz = r10.xyz * r8.xyz;
	r9.xyz = r9.xyz * r10.xyz;
	r10.xyz = r9.xxx * c5.xyz;
	r10.xyz = (r8.xxx * c4.xyz) + r10.xyz;
	r8.xyw = (r8.yyy * c6.xyz) + r10.xyz;
	r8.xyw = (r9.yyy * c7.xyz) + r8.xyw;
	r8.xyz = (r8.zzz * c8.xyz) + r8.xyw;
	r8.xyz = (r9.zzz * c9.xyz) + r8.xyz;
	r8.xyz = r13.xyz * r8.xyz;
	r9.xyz = c0.xyz * v6.xyz;
	r6.xyz = (r9.xyz * r6.xyz) + -r8.xyz;
	r1.z = clamp(dot(r7.xyz, v9.xyz), 0.0, 1.0);
	r6.xyz = (r1.zzz * r6.xyz) + r8.xyz;
	r1.xzw = r1.xxx * r6.xyz;
	r1.xzw = (r3.yzw * r0.www) + r1.xzw;
	r0.xyz = r0.xyz * r1.xzw;
	r0.xyz = (r2.xyz * r15.xyz) + r0.xyz;
	r0.xyz = (r11.xyz * r4.xyz) + r0.xyz;
	r2.x = v2.w;
	r2.y = v3.w;
	r2.z = v4.w;
	r1.xyz = (r5.xyz * r1.yyy) + r2.xyz;
	r0.w = clamp(dot(r7.xyz, r2.xyz), 0.0, 1.0);
	r2.xyz = normalize(r1.xyz);
	r1.x = clamp(dot(r7.xyz, r2.xyz), 0.0, 1.0);
	r1.x = r0.w * r1.x;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r1.x = r9.w * r1.x;
	r0.w = r0.w * r1.x;
	r1.xyz = v6.www * v6.xyz;
	r1.xyz = r1.xyz * c107.xyz;
	r1.xyz = r0.www * r1.xyz;
	r0.xyz = (r1.xyz * r3.xxx) + r0.xyz;
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
	#undef c20
	#undef c21
	#undef c22
	#undef c23
	#undef c24
	#undef c25
	#undef c30
	#undef c33
	#undef c68
	#undef c71
	#undef c73
	#undef c74
	#undef c77
	#undef c78
	#undef c86
	#undef c87
	#undef c89
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

