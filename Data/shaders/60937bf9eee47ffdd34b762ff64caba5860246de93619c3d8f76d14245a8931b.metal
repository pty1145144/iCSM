#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[46];
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
	texturecube<float> s6_texture [[texture(6)]],
	sampler s6 [[sampler(6)]],
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
	const float4 c13 = float4(-5.000000000e-01, 4.882812500e-04, 0.000000000e+00, -4.882812500e-04); (void) c13;
	const float4 c14 = float4(0.000000000e+00, -1.000000000e+00, -2.000000000e+00, 5.000000000e+00); (void) c14;
	const float4 c15 = float4(6.250000000e-02, 1.250000000e-01, 2.500000000e-01, 5.773500204e-01); (void) c15;
	const float4 c16 = float4(1.591549367e-01, 5.000000000e-01, 6.283185482e+00, -3.141592741e+00); (void) c16;
	const float4 c17 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -3.000000119e-01); (void) c17;
	const float4 c18 = float4(-3.333333254e+00, -2.000000000e+00, 3.000000000e+00, 0.000000000e+00); (void) c18;
	const float4 c26 = float4(4.999995828e-01, 5.000000000e-01, -9.999999975e-07, 1.000000000e+06); (void) c26;
	const float4 c27 = float4(2.000000000e+00, -1.000000000e+00, 1.000000000e+00, 0.000000000e+00); (void) c27;
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
	float4 r22;
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
	#define c24 uniforms.uniforms_float4[18]
	#define c25 uniforms.uniforms_float4[19]
	#define c29 uniforms.uniforms_float4[20]
	#define c30 uniforms.uniforms_float4[21]
	#define c33 uniforms.uniforms_float4[22]
	#define c67 uniforms.uniforms_float4[23]
	#define c68 uniforms.uniforms_float4[24]
	#define c69 uniforms.uniforms_float4[25]
	#define c70 uniforms.uniforms_float4[26]
	#define c71 uniforms.uniforms_float4[27]
	#define c73 uniforms.uniforms_float4[28]
	#define c74 uniforms.uniforms_float4[29]
	#define c77 uniforms.uniforms_float4[30]
	#define c78 uniforms.uniforms_float4[31]
	#define c81 uniforms.uniforms_float4[32]
	#define c82 uniforms.uniforms_float4[33]
	#define c85 uniforms.uniforms_float4[34]
	#define c86 uniforms.uniforms_float4[35]
	#define c87 uniforms.uniforms_float4[36]
	#define c88 uniforms.uniforms_float4[37]
	#define c89 uniforms.uniforms_float4[38]
	#define c101 uniforms.uniforms_float4[39]
	#define c102 uniforms.uniforms_float4[40]
	#define c103 uniforms.uniforms_float4[41]
	#define c104 uniforms.uniforms_float4[42]
	#define c105 uniforms.uniforms_float4[43]
	#define c106 uniforms.uniforms_float4[44]
	#define c107 uniforms.uniforms_float4[45]
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
	r1 = s10_texture.sample(s10, v0.xy);
	r2 = s1_texture.sample(s1, v0.xy);
	r2.xyz = (r2.xyz * c27.xxx) + c27.yyy;
	r3.x = dot(v2.xyz, r2.xyz);
	r3.y = dot(v3.xyz, r2.xyz);
	r3.z = dot(v4.xyz, r2.xyz);
	r2.xyz = normalize(r3.xyz);
	r3.xyz = c3.xyz + -v5.xyz;
	r3.w = dot(r3.xyz, r3.xyz);
	r3.w = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r4.xyz = r3.www * r3.xyz;
	r5.w = clamp(dot(r4.xyz, r2.xyz), 0.0, 1.0);
	r5.z = r1.w;
	r6 = s4_texture.sample(s4, r5.wz);
	r1.w = r1.x * r6.z;
	r7 = (v5.xyzx * c27.zzzw) + c27.wwwz;
	r8.x = dot(r7, c69);
	r8.y = dot(r7, c70);
	r6.xz = clamp(r8.xy, float2(0.0), float2(1.0));
	r6.xz = -r8.xy + r6.xz;
	r4.w = dot(r6.xz, c27.zz) + c27.w;
	r9.x = dot(r7, c73);
	r9.y = dot(r7, c74);
	r6.xz = clamp(r9.xy, float2(0.0), float2(1.0));
	r6.xz = -r9.xy + r6.xz;
	r6.x = dot(r6.xz, c27.zz) + c27.w;
	r10.x = dot(r7, c77);
	r10.y = dot(r7, c78);
	r9.z = c27.z;
	r10.z = c27.x;
	r6.xzw = ((-abs(r6.x) >= 0.0) ? r9.xyz : r10.xyz);
	r8.zw = c27.ww;
	r6.xzw = ((-abs(r4.w) >= 0.0) ? r8.xyz : r6.xzw);
	r8.z = dot(r7, c71);
	r9.xy = r6.xz + c13.xx;
	r9.xy = abs(r9.xy) + -c67.zz;
	r9.xy = clamp(r9.xy * c67.ww, float2(0.0), float2(1.0));
	r9.xy = -r9.xy + c27.zz;
	r4.w = r9.y * r9.x;
	r6.xz = clamp(r6.xz, float2(0.0), float2(1.0));
	r9.xyz = r6.www + -c27.wzx;
	r10.zw = c27.zw;
	r11 = ((-abs(r9.x) >= 0.0) ? c85.zwxy : r10.wwww);
	r11 = ((-abs(r9.y) >= 0.0) ? c86.zwxy : r11);
	r9 = ((-abs(r9.z) >= 0.0) ? c87.zwxy : r11);
	r8.xy = (r6.xz * r9.xy) + r9.zw;
	r9 = r8 + c13.yyzz;
	r9 = float4(s8_texture.sample_compare(s8, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
	r11 = r8 + c13.wyzz;
	r11 = float4(s8_texture.sample_compare(s8, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
	r12 = r8 + c13.ywzz;
	r12 = float4(s8_texture.sample_compare(s8, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
	r13 = r8 + c13.wwzz;
	r13 = float4(s8_texture.sample_compare(s8, (r13.xyz).xy, (r13.xyz).z, level(r13.w)));
	r9.y = r11.x;
	r9.z = r12.x;
	r9.w = r13.x;
	r6.x = dot(r9, c15.xxxx);
	r9 = r8 + c13.yzzz;
	r9 = float4(s8_texture.sample_compare(s8, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
	r11 = r8 + c13.wzzz;
	r11 = float4(s8_texture.sample_compare(s8, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
	r12 = r8 + c13.zwzz;
	r12 = float4(s8_texture.sample_compare(s8, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
	r13 = r8 + c13.zyzz;
	r13 = float4(s8_texture.sample_compare(s8, (r13.xyz).xy, (r13.xyz).z, level(r13.w)));
	r9.y = r11.x;
	r9.z = r12.x;
	r9.w = r13.x;
	r6.z = dot(r9, c15.yyyy);
	r9 = float4(s8_texture.sample_compare(s8, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
	r6.x = r6.z + r6.x;
	r6.x = (r9.x * c15.z) + r6.x;
	if (r4.w < c27.z) {
		r9.xyz = r6.www + c14.xyz;
		r11 = ((-abs(r9.x) >= 0.0) ? c73 : r10.wwww);
		r12 = ((-abs(r9.x) >= 0.0) ? c74 : r10.wwww);
		r11 = ((-abs(r9.y) >= 0.0) ? c77 : r11);
		r12 = ((-abs(r9.y) >= 0.0) ? c78 : r12);
		r11 = ((-abs(r9.z) >= 0.0) ? c81 : r11);
		r12 = ((-abs(r9.z) >= 0.0) ? c82 : r12);
		r10.x = clamp(dot(r7, r11), 0.0, 1.0);
		r10.y = clamp(dot(r7, r12), 0.0, 1.0);
		r7 = ((-abs(r9.x) >= 0.0) ? c86.zwxy : r10.wwww);
		r7 = ((-abs(r9.y) >= 0.0) ? c87.zwxy : r7);
		r7 = ((-abs(r9.z) >= 0.0) ? c88.zwxy : r7);
		r8.xy = (r10.xy * r7.xy) + r7.zw;
		r7 = r8 + c13.yyzz;
		r7 = float4(s8_texture.sample_compare(s8, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
		r11 = r8 + c13.wyzz;
		r11 = float4(s8_texture.sample_compare(s8, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
		r12 = r8 + c13.ywzz;
		r12 = float4(s8_texture.sample_compare(s8, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
		r13 = r8 + c13.wwzz;
		r13 = float4(s8_texture.sample_compare(s8, (r13.xyz).xy, (r13.xyz).z, level(r13.w)));
		r7.y = r11.x;
		r7.z = r12.x;
		r7.w = r13.x;
		r6.z = dot(r7, c15.xxxx);
		r7 = r8 + c13.yzzz;
		r7 = float4(s8_texture.sample_compare(s8, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
		r11 = r8 + c13.wzzz;
		r11 = float4(s8_texture.sample_compare(s8, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
		r12 = r8 + c13.zwzz;
		r12 = float4(s8_texture.sample_compare(s8, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
		r13 = r8 + c13.zyzz;
		r13 = float4(s8_texture.sample_compare(s8, (r13.xyz).xy, (r13.xyz).z, level(r13.w)));
		r7.y = r11.x;
		r7.z = r12.x;
		r7.w = r13.x;
		r6.w = dot(r7, c15.yyyy);
		r7 = float4(s8_texture.sample_compare(s8, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r6.z = r6.w + r6.z;
		r6.z = (r7.x * c15.z) + r6.z;
		r6.z = ((r9.z >= 0.0) ? c27.z : r6.z);
		r7.x = mix(r6.z, r6.x, r4.w);
		r6.x = r7.x;
	}
	r7.xyz = -c89.xyz + v5.xyz;
	r4.w = dot(r7.xyz, r7.xyz);
	r4.w = clamp((r4.w * c68.y) + c68.x, 0.0, 1.0);
	r7.x = mix(r6.x, c27.z, r4.w);
	r6.xzw = r2.xyz * r2.xyz;
	r7.y = ((r2.x >= 0.0) ? c27.w : c27.z);
	r7.z = ((r2.y >= 0.0) ? c27.w : c27.z);
	r7.w = ((r2.z >= 0.0) ? c27.w : c27.z);
	r8.x = ((r2.x >= 0.0) ? c27.z : c27.w);
	r8.y = ((r2.y >= 0.0) ? c27.z : c27.w);
	r8.z = ((r2.z >= 0.0) ? c27.z : c27.w);
	r7.yzw = r6.xzw * r7.yzw;
	r6.xzw = r6.xzw * r8.xyz;
	r8.xyz = r7.yyy * c5.xyz;
	r8.xyz = (r6.xxx * c4.xyz) + r8.xyz;
	r8.xyz = (r6.zzz * c6.xyz) + r8.xyz;
	r8.xyz = (r7.zzz * c7.xyz) + r8.xyz;
	r6.xzw = (r6.www * c8.xyz) + r8.xyz;
	r6.xzw = (r7.www * c9.xyz) + r6.xzw;
	r7.yzw = c21.xyz + -v5.xyz;
	r8.xyz = normalize(r7.yzw);
	r7.yzw = c20.xyz * v1.xxx;
	r4.w = clamp(dot(r2.xyz, r8.xyz), 0.0, 1.0);
	r8.w = (r4.w * r4.w) + r4.w;
	r8.w = r8.w * -c13.x;
	r9.xyz = r7.yzw * r8.www;
	r6.xzw = (r9.xyz * r7.xxx) + r6.xzw;
	r9.xyz = c23.xyz + -v5.xyz;
	r11.xyz = normalize(r9.xyz);
	r9.xyz = c22.xyz * v1.yyy;
	r8.w = clamp(dot(r2.xyz, r11.xyz), 0.0, 1.0);
	r9.w = (r8.w * r8.w) + r8.w;
	r9.w = r9.w * -c13.x;
	r6.xzw = (r9.xyz * r9.www) + r6.xzw;
	r12.xyz = c25.xyz + -v5.xyz;
	r13.xyz = normalize(r12.xyz);
	r12.xyz = c24.xyz * v1.zzz;
	r9.w = clamp(dot(r2.xyz, r13.xyz), 0.0, 1.0);
	r10.x = (r9.w * r9.w) + r9.w;
	r10.x = r10.x * -c13.x;
	r6.xzw = (r12.xyz * r10.xxx) + r6.xzw;
	r14.x = c23.w + -v5.x;
	r14.y = c24.w + -v5.y;
	r14.z = c25.w + -v5.z;
	r15.xyz = normalize(r14.xyz);
	r14.x = c20.w * v1.w;
	r14.y = c21.w * v1.w;
	r14.z = c22.w * v1.w;
	r10.x = clamp(dot(r2.xyz, r15.xyz), 0.0, 1.0);
	r10.y = (r10.x * r10.x) + r10.x;
	r10.y = r10.y * -c13.x;
	r6.xzw = (r14.xyz * r10.yyy) + r6.xzw;
	r16 = s3_texture.sample(s3, v0.xy);
	r10.y = abs(c12.w);
	r11.w = r16.x * c12.w;
	r11.w = (r11.w * c16.x) + c16.y;
	r11.w = fract(r11.w);
	r11.w = (r11.w * c16.z) + c16.w;
	r17.xy = float2(cos(r11.w), sin(r11.w));
	r18.xyz = r0.zxy * c15.www;
	r18.xyz = (r0.zxy * c15.www) + -r18.zxy;
	r17.yzw = r17.yyy * r18.xyz;
	r17.yzw = (r0.xyz * r17.xxx) + r17.yzw;
	r11.w = dot(c15.www, r0.xyz);
	r11.w = r11.w * c15.w;
	r12.w = -r17.x + c27.z;
	r17.xyz = (r11.www * r12.www) + r17.yzw;
	r18.xyz = r0.xyz;
	r18.w = r16.x;
	r17.w = c27.z;
	r17 = ((-r10.y >= 0.0) ? r18 : r17);
	r0.x = ((-r16.y >= 0.0) ? r10.w : c10.w);
	r0.y = r16.z * c101.x;
	r0.z = -r16.w + c27.z;
	r16.xzw = v6.www * v6.xyz;
	r16.xzw = r16.xzw * c107.xyz;
	r18.x = v2.w;
	r18.y = v3.w;
	r18.z = v4.w;
	r19.xyz = (r3.xyz * r3.www) + r18.xyz;
	r20.xyz = normalize(r19.xyz);
	r10.y = clamp(dot(r2.xyz, r20.xyz), 0.0, 1.0);
	r10.w = clamp(dot(r2.xyz, r18.xyz), 0.0, 1.0);
	r11.w = -r5.w + c27.z;
	r10.y = r10.w * r10.y;
	r12.w = pow(abs(r11.w), c105.x);
	r10.y = r10.y * r12.w;
	r10.w = ((r10.w == 0.0) ? FLT_MAX : rsqrt(abs(r10.w)));
	r10.w = ((r10.w == 0.0) ? FLT_MAX : 1.0 / r10.w);
	r10.y = r10.w * r10.y;
	r16.xzw = r16.xzw * r10.yyy;
	r18.xyz = r2.zxy * v8.yzx;
	r18.xyz = (r2.yzx * v8.zxy) + -r18.xyz;
	r19.xyz = normalize(r18.xyz);
	r18.xyz = r2.zxy * r19.yzx;
	r18.xyz = (r2.yzx * r19.zxy) + -r18.xyz;
	r20.xyz = normalize(r18.xyz);
	r10.y = (r16.y * c26.x) + c26.y;
	r10.y = fract(r10.y);
	r10.y = (r10.y * c16.z) + c16.w;
	r18.xy = float2(cos(r10.y), sin(r10.y));
	r18.xzw = r19.xyz * r18.xxx;
	r18.xyz = (r18.yyy * r20.xyz) + r18.xzw;
	r19.xyz = normalize(r18.xyz);
	r18.xyz = r2.xyz * r19.yzx;
	r18.xyz = (r19.xyz * r2.yzx) + -r18.xyz;
	r20.xyz = r19.yzx * r18.xyz;
	r18.xyz = (r18.zxy * r19.zxy) + -r20.xyz;
	r10.y = dot(r18.xyz, r18.xyz);
	r10.y = ((r10.y == 0.0) ? FLT_MAX : rsqrt(abs(r10.y)));
	r18.xyz = (r18.xyz * r10.yyy) + -r4.xyz;
	r18.xyz = (r0.xxx * r18.xyz) + r4.xyz;
	r5.w = r5.w * r5.w;
	r20.w = r5.w * r5.w;
	r5.w = r0.z * r20.w;
	r21.xyz = r5.www * v6.xyz;
	r20.xyz = r21.xyz * c14.www;
	r20 = ((-r0.z >= 0.0) ? c27.wwww : r20);
	r5.w = dot(r4.xyz, r19.xyz);
	r10.y = (r5.w * -r5.w) + c27.z;
	r10.y = ((r10.y == 0.0) ? FLT_MAX : rsqrt(abs(r10.y)));
	r10.y = ((r10.y == 0.0) ? FLT_MAX : 1.0 / r10.y);
	r19.yzw = (r3.xyz * r3.www) + r8.xyz;
	r21.xyz = normalize(r19.yzw);
	r10.w = clamp(dot(r2.xyz, r21.xyz), 0.0, 1.0);
	r11.w = dot(r8.xyz, r19.xxx);
	r13.w = (r11.w * -r11.w) + c27.z;
	r13.w = ((r13.w == 0.0) ? FLT_MAX : rsqrt(abs(r13.w)));
	r13.w = ((r13.w == 0.0) ? FLT_MAX : 1.0 / r13.w);
	r13.w = r10.y * r13.w;
	r11.w = clamp((r5.w * r11.w) + r13.w, 0.0, 1.0);
	r5.y = mix(r10.w, r11.w, r0.x);
	r21 = s7_texture.sample(s7, r5.yz);
	r8.x = clamp(dot(r4.xyz, r8.xyz), 0.0, 1.0);
	r8.x = r8.x * r20.w;
	r19.yzw = (r8.xxx * c14.www) + -r21.xyz;
	r19.yzw = (r0.zzz * r19.yzw) + r21.xyz;
	r19.yzw = ((-r0.z >= 0.0) ? r21.xyz : r19.yzw);
	r8.x = ((r4.w == 0.0) ? FLT_MAX : rsqrt(abs(r4.w)));
	r8.x = ((r8.x == 0.0) ? FLT_MAX : 1.0 / r8.x);
	r19.yzw = r8.xxx * r19.yzw;
	r19.yzw = r7.yzw * r19.yzw;
	r4.w = r4.w * r5.y;
	r4.w = r12.w * r4.w;
	r8.y = r8.x * r4.w;
	r21.xyz = r7.yzw * r8.yyy;
	r19.yzw = (r19.yzw * r7.xxx) + r20.xyz;
	r20.xyz = (r3.xyz * r3.www) + r11.xyz;
	r22.xyz = normalize(r20.xyz);
	r8.y = clamp(dot(r2.xyz, r22.xyz), 0.0, 1.0);
	r10.w = dot(r11.xyz, r19.xxx);
	r11.w = (r10.w * -r10.w) + c27.z;
	r11.w = ((r11.w == 0.0) ? FLT_MAX : rsqrt(abs(r11.w)));
	r11.w = ((r11.w == 0.0) ? FLT_MAX : 1.0 / r11.w);
	r11.w = r10.y * r11.w;
	r10.w = clamp((r5.w * r10.w) + r11.w, 0.0, 1.0);
	r5.x = mix(r8.y, r10.w, r0.x);
	r22 = s7_texture.sample(s7, r5.xz);
	r8.y = clamp(dot(r4.xyz, r11.xyz), 0.0, 1.0);
	r8.y = r8.y * r20.w;
	r11.xyz = (r8.yyy * c14.www) + -r22.xyz;
	r11.xyz = (r0.zzz * r11.xyz) + r22.xyz;
	r11.xyz = ((-r0.z >= 0.0) ? r22.xyz : r11.xyz);
	r8.y = ((r8.w == 0.0) ? FLT_MAX : rsqrt(abs(r8.w)));
	r8.y = ((r8.y == 0.0) ? FLT_MAX : 1.0 / r8.y);
	r11.xyz = r8.yyy * r11.xyz;
	r8.w = r8.w * r5.x;
	r8.w = r12.w * r8.w;
	r8.y = r8.y * r8.w;
	r20.xyz = r9.xyz * r8.yyy;
	r9.xyz = (r11.xyz * r9.xyz) + r19.yzw;
	r11.xyz = (r21.xyz * r7.xxx) + r20.xyz;
	r4.w = (r4.w * r8.x) + r8.y;
	r8.xyw = (r3.xyz * r3.www) + r13.xyz;
	r20.xyz = normalize(r8.xyw);
	r7.x = clamp(dot(r2.xyz, r20.xyz), 0.0, 1.0);
	r8.x = dot(r13.xyz, r19.xxx);
	r8.y = (r8.x * -r8.x) + c27.z;
	r8.y = ((r8.y == 0.0) ? FLT_MAX : rsqrt(abs(r8.y)));
	r8.y = ((r8.y == 0.0) ? FLT_MAX : 1.0 / r8.y);
	r8.y = r8.y * r10.y;
	r8.x = clamp((r5.w * r8.x) + r8.y, 0.0, 1.0);
	r5.y = mix(r7.x, r8.x, r0.x);
	r21 = s7_texture.sample(s7, r5.yz);
	r7.x = clamp(dot(r4.xyz, r13.xyz), 0.0, 1.0);
	r7.x = r7.x * r20.w;
	r8.xyw = (r7.xxx * c14.www) + -r21.xyz;
	r8.xyw = (r0.zzz * r8.xyw) + r21.xyz;
	r8.xyw = ((-r0.z >= 0.0) ? r21.xyz : r8.xyw);
	r7.x = ((r9.w == 0.0) ? FLT_MAX : rsqrt(abs(r9.w)));
	r7.x = ((r7.x == 0.0) ? FLT_MAX : 1.0 / r7.x);
	r8.xyw = r7.xxx * r8.xyw;
	r5.y = r9.w * r5.y;
	r5.y = r12.w * r5.y;
	r9.w = r7.x * r5.y;
	r8.xyw = (r8.xyw * r12.xyz) + r9.xyz;
	r9.xyz = (r9.www * r12.xyz) + r11.xyz;
	r4.w = (r5.y * r7.x) + r4.w;
	r3.xyz = (r3.xyz * r3.www) + r15.xyz;
	r11.xyz = normalize(r3.xyz);
	r3.x = clamp(dot(r2.xyz, r11.xyz), 0.0, 1.0);
	r3.y = dot(r15.xyz, r19.xxx);
	r3.z = (r3.y * -r3.y) + c27.z;
	r3.z = ((r3.z == 0.0) ? FLT_MAX : rsqrt(abs(r3.z)));
	r3.z = ((r3.z == 0.0) ? FLT_MAX : 1.0 / r3.z);
	r3.z = r3.z * r10.y;
	r3.y = clamp((r5.w * r3.y) + r3.z, 0.0, 1.0);
	r5.x = mix(r3.x, r3.y, r0.x);
	r11 = s7_texture.sample(s7, r5.xz);
	r0.x = clamp(dot(r4.xyz, r15.xyz), 0.0, 1.0);
	r0.x = r0.x * r20.w;
	r3.xyz = (r0.xxx * c14.www) + -r11.xyz;
	r3.xyz = (r0.zzz * r3.xyz) + r11.xyz;
	r3.xyz = ((-r0.z >= 0.0) ? r11.xyz : r3.xyz);
	r0.x = ((r10.x == 0.0) ? FLT_MAX : rsqrt(abs(r10.x)));
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r3.xyz = r0.xxx * r3.xyz;
	r4.x = r10.x * r5.x;
	r4.x = r12.w * r4.x;
	r4.y = r0.x * r4.x;
	r3.xyz = (r3.xyz * r14.xyz) + r8.xyw;
	r5.xyz = (r4.yyy * r14.xyz) + r9.xyz;
	r0.x = (r4.x * r0.x) + r4.w;
	r4.x = r1.x * c105.y;
	r4.y = (v6.w * c11.w) + r10.z;
	r4.x = r4.y * r4.x;
	r4.xyz = r4.xxx * r5.xyz;
	r3.xyz = r2.www * r3.xyz;
	r2.w = mix(c10.x, c10.y, r1.y);
	r4.w = dot(r2.xyz, r18.xyz);
	r4.w = r4.w + r4.w;
	r5.x = dot(r2.xyz, r2.xyz);
	r5.xyz = r18.xyz * r5.xxx;
	r5.xyz = (r4.www * r2.xyz) + -r5.xyz;
	r9 = s6_texture.sample(s6, r5.xyz);
	r8.xyw = r9.xyz * c30.zzz;
	r4.w = abs(c103.w);
	r10.xyz = r8.xyw * r8.xyw;
	r10.xyz = r10.xyz * r10.xyz;
	r5.w = dot(r8.xyw, c17.xyz);
	r9.xyz = (c30.zzz * -r9.xyz) + r5.www;
	r9.xyz = (-c103.www * r9.xyz) + r8.xyw;
	r7.x = dot(r10.xyz, c17.xyz);
	r9.w = r7.x + c26.z;
	r10.xyz = r5.www * r10.xyz;
	r5.w = ((r7.x == 0.0) ? FLT_MAX : 1.0 / r7.x);
	r5.w = ((r9.w >= 0.0) ? r5.w : c26.w);
	r10.xyz = (r10.xyz * r5.www) + -r8.xyw;
	r10.xyz = (c103.www * r10.xyz) + r8.xyw;
	r9.xyz = ((c103.w >= 0.0) ? r10.xyz : r9.xyz);
	r8.xyw = ((-r4.w >= 0.0) ? r8.xyw : r9.xyz);
	r9.xyz = r6.xzw + v6.xyz;
	r10.xyz = r9.xyz + -c103.xxx;
	r10.xyz = clamp(r10.xyz * c103.yyy, float3(0.0), float3(1.0));
	r10.xyz = (r8.xyw * r10.xyz) + -r8.xyw;
	r8.xyw = (r0.yyy * r10.xyz) + r8.xyw;
	r10.xyz = (r8.xyw * r8.xyw) + -r8.xyw;
	r8.xyw = (c103.zzz * r10.xyz) + r8.xyw;
	r10.xyz = r0.www * c104.xyz;
	r8.xyw = r8.xyw * r10.xyz;
	r3.xyz = (r3.xyz * r2.www) + r8.xyw;
	r2.w = mix(r6.y, c27.z, r0.z);
	r0.yzw = r5.xyz * r5.xyz;
	r8.x = ((r5.x >= 0.0) ? c27.w : c27.z);
	r8.y = ((r5.y >= 0.0) ? c27.w : c27.z);
	r8.w = ((r5.z >= 0.0) ? c27.w : c27.z);
	r5.x = ((r5.x >= 0.0) ? c27.z : c27.w);
	r5.y = ((r5.y >= 0.0) ? c27.z : c27.w);
	r5.z = ((r5.z >= 0.0) ? c27.z : c27.w);
	r8.xyw = r0.yzw * r8.xyw;
	r0.yzw = r0.yzw * r5.xyz;
	r5.xyz = r8.xxx * c5.xyz;
	r5.xyz = (r0.yyy * c4.xyz) + r5.xyz;
	r5.xyz = (r0.zzz * c6.xyz) + r5.xyz;
	r5.xyz = (r8.yyy * c7.xyz) + r5.xyz;
	r0.yzw = (r0.www * c8.xyz) + r5.xyz;
	r0.yzw = (r8.www * c9.xyz) + r0.yzw;
	r4.w = clamp(r8.z, 0.0, 1.0);
	r4.w = (r4.w * r4.w) + r4.w;
	r4.w = r4.w * -c13.x;
	r5.xyz = r4.www * r7.yzw;
	r0.yzw = r0.yzw * r5.xyz;
	r5.x = v7.w;
	r5.y = v8.w;
	r5.z = v9.w;
	r5.xyz = -r5.xyz + c21.xyz;
	r8.xyz = normalize(r5.xyz);
	r4.w = clamp(dot(-v9.xyz, r8.xyz), 0.0, 1.0);
	r4.w = (r4.w * r4.w) + r4.w;
	r4.w = r4.w * -c13.x;
	r5.xyz = r4.www * r7.yzw;
	r2.x = clamp(dot(r2.xyz, v9.xyz), 0.0, 1.0);
	r7.xyz = c0.xyz * v6.xyz;
	r5.xyz = (r7.xyz * r5.xyz) + -r0.yzw;
	r0.yzw = (r2.xxx * r5.xyz) + r0.yzw;
	r1.w = r1.w * c0.w;
	r0.yzw = r0.yzw * r1.www;
	r0.yzw = (r3.xyz * r2.www) + r0.yzw;
	r2.xyz = r17.xyz + c27.yyy;
	r2.xyz = (r1.yyy * r2.xyz) + c27.zzz;
	r0.yzw = r0.yzw * r2.xyz;
	r1.y = r1.y * c101.w;
	r1.w = clamp(r1.y, 0.0, 1.0);
	r2.xyz = (r17.xyz * r1.yyy) + -c106.xyz;
	r2.xyz = (r1.www * r2.xyz) + c106.xyz;
	r3.xyz = r2.xyz * r4.xyz;
	r1.y = clamp(c107.w + v6.w, 0.0, 1.0);
	r5.xyz = (r4.xyz * r2.xyz) + r6.xzw;
	r1.w = dot(r5.xyz, c17.xyz);
	r1.w = r1.w + c17.w;
	r1.w = clamp(r1.w * c18.x, 0.0, 1.0);
	r2.w = (r1.w * c18.y) + c18.z;
	r1.w = r1.w * r1.w;
	r1.w = r1.w * r2.w;
	r2.w = dot(r6.xzw, c17.xyz);
	r5.xy = -c2.xw + c2.yz;
	r5.zw = r2.ww + -c2.xw;
	r2.w = ((r5.x == 0.0) ? FLT_MAX : 1.0 / r5.x);
	r2.w = clamp(r2.w * r5.z, 0.0, 1.0);
	r4.w = (r2.w * c18.y) + c18.z;
	r2.w = r2.w * r2.w;
	r2.w = r2.w * r4.w;
	r4.w = ((r5.y == 0.0) ? FLT_MAX : 1.0 / r5.y);
	r4.w = clamp(r4.w * r5.w, 0.0, 1.0);
	r5.x = (r4.w * c18.y) + c18.z;
	r4.w = r4.w * r4.w;
	r5.yz = -c33.xw + c33.yz;
	r6.xy = r0.xx + -c33.xw;
	r0.x = ((r5.y == 0.0) ? FLT_MAX : 1.0 / r5.y);
	r0.x = clamp(r0.x * r6.x, 0.0, 1.0);
	r5.y = (r0.x * c18.y) + c18.z;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r5.y;
	r5.y = ((r5.z == 0.0) ? FLT_MAX : 1.0 / r5.z);
	r5.y = clamp(r5.y * r6.y, 0.0, 1.0);
	r5.z = (r5.y * c18.y) + c18.z;
	r5.y = r5.y * r5.y;
	r5.y = r5.y * r5.z;
	r0.x = r0.x * r5.y;
	r3.x = dot(r3.xyz, c17.xyz);
	r0.x = r0.x * r3.x;
	r0.x = r0.x * c106.w;
	r0.x = (r5.x * r4.w) + r0.x;
	r3.x = abs(c101.y);
	r5.xyz = r17.xyz * r17.xyz;
	r5.xyz = r5.xyz * r5.xyz;
	r3.y = dot(r17.xyz, c17.xyz);
	r6.xyz = mix(r17.xyz, r3.yyy, -c101.yyy);
	r3.z = dot(r5.xyz, c17.xyz);
	r4.w = r3.z + c26.z;
	r5.xyz = r3.yyy * r5.xyz;
	r3.y = ((r3.z == 0.0) ? FLT_MAX : 1.0 / r3.z);
	r3.y = ((r4.w >= 0.0) ? r3.y : c26.w);
	r5.xyz = (r5.xyz * r3.yyy) + -r17.xyz;
	r5.xyz = (c101.yyy * r5.xyz) + r17.xyz;
	r5.xyz = ((c101.y >= 0.0) ? r5.xyz : r6.xyz);
	r3.xyz = ((-r3.x >= 0.0) ? r17.xyz : r5.xyz);
	r0.x = r0.x * r2.w;
	r0.x = r17.w * r0.x;
	r5.xyz = mix(r17.xyz, r3.xyz, r0.xxx);
	r0.x = dot(r5.xyz, c17.xyz);
	r3.xyz = c17.xyz;
	r2.w = dot(c102.xyz, r3.xyz);
	r3.x = r2.w + c26.z;
	r6.xyz = r0.xxx * c102.xyz;
	r0.x = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r0.x = ((r3.x >= 0.0) ? r0.x : c26.w);
	r3.xyz = (r6.xyz * r0.xxx) + -r5.xyz;
	r3.xyz = (c102.www * r3.xyz) + r5.xyz;
	r3.xyz = (r3.xyz * r1.yyy) + -r5.xyz;
	r3.xyz = (r1.www * r3.xyz) + r5.xyz;
	r1.yzw = r1.zzz * r3.xyz;
	r0.xyz = (r1.yzw * r9.xyz) + r0.yzw;
	r0.xyz = (r4.xyz * r2.xyz) + r0.xyz;
	r0.xyz = (r16.xzw * r1.xxx) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	r0.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r0.w = clamp((r0.w * c19.w) + c19.x, 0.0, 1.0);
	r1.x = min(r0.w, c19.z);
	r1.yzw = r0.xyz * c30.xxx;
	r0.w = r1.x * r1.x;
	r1.x = c30.x;
	r0.xyz = (r0.xyz * -r1.xxx) + c29.xyz;
	oC0.xyz = (r0.www * r0.xyz) + r1.yzw;
	oC0.w = c1.w;
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
	#undef c24
	#undef c25
	#undef c29
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
	#undef c81
	#undef c82
	#undef c85
	#undef c86
	#undef c87
	#undef c88
	#undef c89
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

