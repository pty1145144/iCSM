#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[38];
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
	const float4 c14 = float4(1.041666627e+00, -2.083333395e-02, 5.000000000e-01, 6.250000000e-02); (void) c14;
	const float4 c15 = float4(4.882812500e-04, 0.000000000e+00, -4.882812500e-04, 1.250000000e-01); (void) c15;
	const float4 c16 = float4(2.500000000e-01, 1.591549367e-01, 5.000000000e-01, 5.773500204e-01); (void) c16;
	const float4 c17 = float4(6.283185482e+00, -3.141592741e+00, 5.000000000e+00, -3.000000119e-01); (void) c17;
	const float4 c18 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -3.333333254e+00); (void) c18;
	const float4 c24 = float4(-2.000000000e+00, 3.000000000e+00, -9.999999975e-07, 1.000000000e+06); (void) c24;
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
	#define c67 uniforms.uniforms_float4[20]
	#define c68 uniforms.uniforms_float4[21]
	#define c69 uniforms.uniforms_float4[22]
	#define c70 uniforms.uniforms_float4[23]
	#define c71 uniforms.uniforms_float4[24]
	#define c73 uniforms.uniforms_float4[25]
	#define c74 uniforms.uniforms_float4[26]
	#define c77 uniforms.uniforms_float4[27]
	#define c78 uniforms.uniforms_float4[28]
	#define c85 uniforms.uniforms_float4[29]
	#define c86 uniforms.uniforms_float4[30]
	#define c87 uniforms.uniforms_float4[31]
	#define c89 uniforms.uniforms_float4[32]
	#define c101 uniforms.uniforms_float4[33]
	#define c102 uniforms.uniforms_float4[34]
	#define c105 uniforms.uniforms_float4[35]
	#define c106 uniforms.uniforms_float4[36]
	#define c107 uniforms.uniforms_float4[37]
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
	r0.xyz = c18.xyz;
	r0.x = dot(c102.xyz, r0.xyz);
	r0.y = r0.x + c24.z;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = ((r0.y >= 0.0) ? r0.x : c24.w);
	r1 = s3_texture.sample(s3, v0.xy);
	r0.y = r1.x * c12.w;
	r0.y = (r0.y * c16.y) + c16.z;
	r0.y = fract(r0.y);
	r0.y = (r0.y * c17.x) + c17.y;
	r2.xy = float2(cos(r0.y), sin(r0.y));
	r3 = s0_texture.sample(s0, v0.xy);
	r0.yzw = r3.zxy * c16.www;
	r0.yzw = (r3.zxy * c16.www) + -r0.wyz;
	r0.yzw = r2.yyy * r0.yzw;
	r0.yzw = (r3.xyz * r2.xxx) + r0.yzw;
	r1.y = -r2.x + c13.z;
	r1.z = dot(c16.www, r3.xyz);
	r1.z = r1.z * c16.w;
	r2.xyz = (r1.zzz * r1.yyy) + r0.yzw;
	r0.y = abs(c12.w);
	r2.w = c13.z;
	r3.w = r1.x;
	r0.z = -r1.w + c13.z;
	r1 = ((-r0.y >= 0.0) ? r3 : r2);
	r2.xyz = r1.xyz * r1.xyz;
	r2.xyz = r2.xyz * r2.xyz;
	r0.y = dot(r2.xyz, c18.xyz);
	r0.w = r0.y + c24.z;
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r0.y = ((r0.w >= 0.0) ? r0.y : c24.w);
	r0.w = dot(r1.xyz, c18.xyz);
	r2.xyz = r0.www * r2.xyz;
	r3.xyz = mix(r1.xyz, r0.www, -c101.yyy);
	r2.xyz = (r2.xyz * r0.yyy) + -r1.xyz;
	r2.xyz = (c101.yyy * r2.xyz) + r1.xyz;
	r2.xyz = ((c101.y >= 0.0) ? r2.xyz : r3.xyz);
	r0.y = abs(c101.y);
	r2.xyz = ((-r0.y >= 0.0) ? r1.xyz : r2.xyz);
	r3 = (v5.xyzx * c13.zzzw) + c13.wwwz;
	r4.x = dot(r3, c73);
	r4.y = dot(r3, c74);
	r0.yw = (r4.xy * c14.xx) + c14.yy;
	r4.zw = clamp(r0.yw, float2(0.0), float2(1.0));
	r0.yw = -r0.yw + r4.zw;
	r0.y = dot(r0.yw, c13.zz) + c13.w;
	r0.w = dot(r3, c77);
	r5.x = ((-abs(r0.y) >= 0.0) ? r4.x : r0.w);
	r0.w = dot(r3, c78);
	r5.y = ((-abs(r0.y) >= 0.0) ? r4.y : r0.w);
	r4.x = dot(r3, c69);
	r4.y = dot(r3, c70);
	r3.z = dot(r3, c71);
	r4.zw = (r4.xy * c14.xx) + c14.yy;
	r5.zw = clamp(r4.zw, float2(0.0), float2(1.0));
	r4.zw = -r4.zw + r5.zw;
	r0.w = dot(r4.zw, c13.zz) + c13.w;
	r4.xy = ((-abs(r0.w) >= 0.0) ? r4.xy : r5.xy);
	r4.zw = clamp(r4.xy, float2(0.0), float2(1.0));
	r4.xy = r4.xy + -c14.zz;
	r4.xy = abs(r4.xy) + -c67.zz;
	r4.xy = clamp(r4.xy * c67.ww, float2(0.0), float2(1.0));
	r4.xy = -r4.xy + c13.zz;
	r5.xy = c86.xy;
	r5.xy = ((-abs(r0.y) >= 0.0) ? r5.xy : c87.xy);
	r0.y = ((-abs(r0.y) >= 0.0) ? c13.z : c13.w);
	r0.y = ((-abs(r0.w) >= 0.0) ? c13.z : r0.y);
	r5.xy = ((-abs(r0.w) >= 0.0) ? c85.xy : r5.xy);
	r3.xy = (r4.zw * c14.zz) + r5.xy;
	r0.y = clamp((r4.x * r4.y) + r0.y, 0.0, 1.0);
	r3.w = c13.w;
	r4 = r3 + c15.xxyy;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
	r5 = r3 + c15.zxyy;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
	r4.y = r5.x;
	r5 = r3 + c15.xzyy;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
	r4.z = r5.x;
	r5 = r3 + c15.zzyy;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
	r4.w = r5.x;
	r0.w = dot(r4, c14.wwww);
	r4 = r3 + c15.xyyy;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
	r5 = r3 + c15.zyyy;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
	r4.y = r5.x;
	r5 = r3 + c15.yzyy;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
	r4.z = r5.x;
	r5 = r3 + c15.yxyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
	r4.w = r5.x;
	r2.w = dot(r4, c15.wwww);
	r0.w = r0.w + r2.w;
	r0.w = (r3.x * c16.x) + r0.w;
	r0.w = r0.w + c13.y;
	r0.y = (r0.y * r0.w) + c13.z;
	r3.xyz = -c89.xyz + v5.xyz;
	r0.w = dot(r3.xyz, r3.xyz);
	r0.w = clamp((r0.w * c68.y) + c68.x, 0.0, 1.0);
	r2.w = mix(r0.y, c13.z, r0.w);
	r3 = s1_texture.sample(s1, v0.xy);
	r3.xyz = (r3.xyz * c13.xxx) + c13.yyy;
	r4.x = dot(v2.xyz, r3.xyz);
	r4.y = dot(v3.xyz, r3.xyz);
	r4.z = dot(v4.xyz, r3.xyz);
	r3.xyz = normalize(r4.xyz);
	r4.x = ((r3.x >= 0.0) ? c13.w : c13.z);
	r4.y = ((r3.y >= 0.0) ? c13.w : c13.z);
	r4.z = ((r3.z >= 0.0) ? c13.w : c13.z);
	r5.xyz = r3.xyz * r3.xyz;
	r4.xyz = r4.xyz * r5.xyz;
	r6.xyz = r4.xxx * c5.xyz;
	r7.x = ((r3.x >= 0.0) ? c13.z : c13.w);
	r7.y = ((r3.y >= 0.0) ? c13.z : c13.w);
	r7.z = ((r3.z >= 0.0) ? c13.z : c13.w);
	r5.xyz = r5.xyz * r7.xyz;
	r6.xyz = (r5.xxx * c4.xyz) + r6.xyz;
	r5.xyw = (r5.yyy * c6.xyz) + r6.xyz;
	r4.xyw = (r4.yyy * c7.xyz) + r5.xyw;
	r4.xyw = (r5.zzz * c8.xyz) + r4.xyw;
	r4.xyz = (r4.zzz * c9.xyz) + r4.xyw;
	r5.xyz = c21.xyz + -v5.xyz;
	r6.xyz = normalize(r5.xyz);
	r0.y = clamp(dot(r3.xyz, r6.xyz), 0.0, 1.0);
	r0.w = (r0.y * r0.y) + r0.y;
	r0.w = r0.w * c14.z;
	r5.xyz = c20.xyz * v1.xxx;
	r7.xyz = r0.www * r5.xyz;
	r4.xyz = (r7.xyz * r2.www) + r4.xyz;
	r7.xyz = c22.xyz * v1.yyy;
	r8.xyz = c23.xyz + -v5.xyz;
	r9.xyz = normalize(r8.xyz);
	r0.w = clamp(dot(r3.xyz, r9.xyz), 0.0, 1.0);
	r4.w = (r0.w * r0.w) + r0.w;
	r4.w = r4.w * c14.z;
	r4.xyz = (r7.xyz * r4.www) + r4.xyz;
	r4.w = dot(r4.xyz, c18.xyz);
	r8.xy = r4.ww + -c2.xw;
	r8.zw = -c2.xw + c2.yz;
	r4.w = ((r8.w == 0.0) ? FLT_MAX : 1.0 / r8.w);
	r5.w = ((r8.z == 0.0) ? FLT_MAX : 1.0 / r8.z);
	r5.w = clamp(r5.w * r8.x, 0.0, 1.0);
	r4.w = clamp(r4.w * r8.y, 0.0, 1.0);
	r6.w = (r4.w * c24.x) + c24.y;
	r4.w = r4.w * r4.w;
	r8.xyz = c3.xyz + -v5.xyz;
	r7.w = dot(r8.xyz, r8.xyz);
	r7.w = ((r7.w == 0.0) ? FLT_MAX : rsqrt(abs(r7.w)));
	r10.xyz = (r8.xyz * r7.www) + r9.xyz;
	r11.xyz = normalize(r10.xyz);
	r10.x = clamp(dot(r3.xyz, r11.xyz), 0.0, 1.0);
	r8.w = r0.w * r10.x;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r11.xyz = r7.www * r8.xyz;
	r9.w = dot(r11.xyz, r3.xyz);
	r10.z = clamp(r9.w, 0.0, 1.0);
	r9.w = r9.w + r9.w;
	r11.w = -r10.z + c13.z;
	r12.x = pow(abs(r11.w), c105.x);
	r8.w = r8.w * r12.x;
	r8.w = r0.w * r8.w;
	r12.yzw = r7.xyz * r8.www;
	r13.xyz = (r8.xyz * r7.www) + r6.xyz;
	r14.xyz = normalize(r13.xyz);
	r10.y = clamp(dot(r3.xyz, r14.xyz), 0.0, 1.0);
	r11.w = r0.y * r10.y;
	r0.y = ((r0.y == 0.0) ? FLT_MAX : rsqrt(abs(r0.y)));
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r11.w = r12.x * r11.w;
	r13.x = r0.y * r11.w;
	r8.w = (r11.w * r0.y) + r8.w;
	r13.yz = r8.ww + -c33.xw;
	r14.xyz = r5.xyz * r13.xxx;
	r12.yzw = (r14.xyz * r2.www) + r12.yzw;
	r14.z = c13.z;
	r8.w = (v6.w * c11.w) + r14.z;
	r14 = s10_texture.sample(s10, v0.xy);
	r11.w = r14.x * c105.y;
	r8.w = r8.w * r11.w;
	r12.yzw = r8.www * r12.yzw;
	r8.w = r14.y * c101.w;
	r15.xyz = (r1.xyz * r8.www) + -c106.xyz;
	r8.w = clamp(r8.w, 0.0, 1.0);
	r15.xyz = (r8.www * r15.xyz) + c106.xyz;
	r16.xyz = r12.yzw * r15.xyz;
	r8.w = dot(r16.xyz, c18.xyz);
	r13.xw = -c33.xw + c33.yz;
	r11.w = ((r13.x == 0.0) ? FLT_MAX : 1.0 / r13.x);
	r13.x = ((r13.w == 0.0) ? FLT_MAX : 1.0 / r13.w);
	r13.x = clamp(r13.x * r13.z, 0.0, 1.0);
	r11.w = clamp(r11.w * r13.y, 0.0, 1.0);
	r13.y = (r11.w * c24.x) + c24.y;
	r11.w = r11.w * r11.w;
	r11.w = r11.w * r13.y;
	r13.y = (r13.x * c24.x) + c24.y;
	r13.x = r13.x * r13.x;
	r13.x = r13.x * r13.y;
	r11.w = r11.w * r13.x;
	r8.w = r8.w * r11.w;
	r8.w = r8.w * c106.w;
	r4.w = (r6.w * r4.w) + r8.w;
	r6.w = (r5.w * c24.x) + c24.y;
	r5.w = r5.w * r5.w;
	r5.w = r5.w * r6.w;
	r4.w = r4.w * r5.w;
	r1.w = r1.w * r4.w;
	r13.xyz = mix(r1.xyz, r2.xyz, r1.www);
	r1.xyz = r1.xyz + c13.yyy;
	r1.xyz = (r14.yyy * r1.xyz) + c13.zzz;
	r1.w = dot(r13.xyz, c18.xyz);
	r2.xyz = r1.www * c102.xyz;
	r2.xyz = (r2.xyz * r0.xxx) + -r13.xyz;
	r2.xyz = (c102.www * r2.xyz) + r13.xyz;
	r0.x = clamp(c107.w + v6.w, 0.0, 1.0);
	r2.xyz = (r2.xyz * r0.xxx) + -r13.xyz;
	r16.xyz = (r12.yzw * r15.xyz) + r4.xyz;
	r4.xyz = r4.xyz + v6.xyz;
	r0.x = dot(r16.xyz, c18.xyz);
	r0.x = r0.x + c17.w;
	r0.x = clamp(r0.x * c18.w, 0.0, 1.0);
	r1.w = (r0.x * c24.x) + c24.y;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r1.w;
	r2.xyz = (r0.xxx * r2.xyz) + r13.xyz;
	r2.xyz = r14.zzz * r2.xyz;
	r0.x = clamp(dot(r11.xyz, r6.xyz), 0.0, 1.0);
	r1.w = clamp(r6.z, 0.0, 1.0);
	r1.w = (r1.w * r1.w) + r1.w;
	r1.w = r1.w * c14.z;
	r6.xyz = r1.www * r5.xyz;
	r1.w = r10.z * r10.z;
	r13.w = r1.w * r1.w;
	r1.w = r0.z * r13.w;
	r16.xyz = r1.www * v6.xyz;
	r13.xyz = r16.xyz * c17.zzz;
	r13 = ((-r0.z >= 0.0) ? c13.wwww : r13);
	r0.x = r0.x * r13.w;
	r10.w = r14.w;
	r16 = s7_texture.sample(s7, r10.yw);
	r17.xyz = (r0.xxx * c17.zzz) + -r16.xyz;
	r17.xyz = (r0.zzz * r17.xyz) + r16.xyz;
	r16.xyz = ((-r0.z >= 0.0) ? r16.xyz : r17.xyz);
	r16.xyz = r0.yyy * r16.xyz;
	r16.xyz = r5.xyz * r16.xyz;
	r13.xyz = (r16.xyz * r2.www) + r13.xyz;
	r0.x = clamp(dot(r11.xyz, r9.xyz), 0.0, 1.0);
	r0.x = r0.x * r13.w;
	r16 = s7_texture.sample(s7, r10.xw);
	r10 = s4_texture.sample(s4, r10.zw);
	r9.xyz = (r0.xxx * c17.zzz) + -r16.xyz;
	r9.xyz = (r0.zzz * r9.xyz) + r16.xyz;
	r9.xyz = ((-r0.z >= 0.0) ? r16.xyz : r9.xyz);
	r1.w = mix(r10.y, c13.z, r0.z);
	r0.x = r14.x * r10.z;
	r0.x = r0.x * c0.w;
	r0.yzw = r0.www * r9.xyz;
	r0.yzw = (r0.yzw * r7.xyz) + r13.xyz;
	r0.yzw = r3.www * r0.yzw;
	r2.w = mix(c10.x, c10.y, r14.y);
	r0.yzw = r0.yzw * r2.www;
	r7.x = v7.w;
	r7.y = v8.w;
	r7.z = v9.w;
	r7.xyz = -r7.xyz + c21.xyz;
	r9.xyz = normalize(r7.xyz);
	r2.w = clamp(dot(-v9.xyz, r9.xyz), 0.0, 1.0);
	r2.w = (r2.w * r2.w) + r2.w;
	r2.w = r2.w * c14.z;
	r5.xyz = r2.www * r5.xyz;
	r2.w = dot(r3.xyz, r3.xyz);
	r7.xyz = r11.xyz * r2.www;
	r7.xyz = (r9.www * r3.xyz) + -r7.xyz;
	r9.x = ((r7.x >= 0.0) ? c13.w : c13.z);
	r9.y = ((r7.y >= 0.0) ? c13.w : c13.z);
	r9.z = ((r7.z >= 0.0) ? c13.w : c13.z);
	r10.xyz = r7.xyz * r7.xyz;
	r7.x = ((r7.x >= 0.0) ? c13.z : c13.w);
	r7.y = ((r7.y >= 0.0) ? c13.z : c13.w);
	r7.z = ((r7.z >= 0.0) ? c13.z : c13.w);
	r7.xyz = r10.xyz * r7.xyz;
	r9.xyz = r9.xyz * r10.xyz;
	r10.xyz = r9.xxx * c5.xyz;
	r10.xyz = (r7.xxx * c4.xyz) + r10.xyz;
	r10.xyz = (r7.yyy * c6.xyz) + r10.xyz;
	r9.xyw = (r9.yyy * c7.xyz) + r10.xyz;
	r7.xyz = (r7.zzz * c8.xyz) + r9.xyw;
	r7.xyz = (r9.zzz * c9.xyz) + r7.xyz;
	r6.xyz = r6.xyz * r7.xyz;
	r7.xyz = c0.xyz * v6.xyz;
	r5.xyz = (r7.xyz * r5.xyz) + -r6.xyz;
	r2.w = clamp(dot(r3.xyz, v9.xyz), 0.0, 1.0);
	r5.xyz = (r2.www * r5.xyz) + r6.xyz;
	r5.xyz = r0.xxx * r5.xyz;
	r0.xyz = (r0.yzw * r1.www) + r5.xyz;
	r0.xyz = r1.xyz * r0.xyz;
	r0.xyz = (r2.xyz * r4.xyz) + r0.xyz;
	r0.xyz = (r12.yzw * r15.xyz) + r0.xyz;
	r1.x = v2.w;
	r1.y = v3.w;
	r1.z = v4.w;
	r2.xyz = (r8.xyz * r7.www) + r1.xyz;
	r0.w = clamp(dot(r3.xyz, r1.xyz), 0.0, 1.0);
	r1.xyz = normalize(r2.xyz);
	r1.x = clamp(dot(r3.xyz, r1.xyz), 0.0, 1.0);
	r1.x = r0.w * r1.x;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r1.x = r12.x * r1.x;
	r0.w = r0.w * r1.x;
	r1.xyz = v6.www * v6.xyz;
	r1.xyz = r1.xyz * c107.xyz;
	r1.xyz = r0.www * r1.xyz;
	r0.xyz = (r1.xyz * r14.xxx) + r0.xyz;
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
	#undef c67
	#undef c68
	#undef c69
	#undef c70
	#undef c71
	#undef c73
	#undef c74
	#undef c77
	#undef c78
	#undef c85
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

