#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[44];
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
	const float4 c13 = float4(-5.000000000e-01, 4.882812500e-04, 0.000000000e+00, -4.882812500e-04); (void) c13;
	const float4 c14 = float4(6.250000000e-02, 1.250000000e-01, 2.500000000e-01, 5.773500204e-01); (void) c14;
	const float4 c15 = float4(0.000000000e+00, -1.000000000e+00, -2.000000000e+00, 5.000000000e+00); (void) c15;
	const float4 c16 = float4(2.000000000e+00, -1.000000000e+00, 1.000000000e+00, 0.000000000e+00); (void) c16;
	const float4 c17 = float4(1.591549367e-01, 5.000000000e-01, 6.283185482e+00, -3.141592741e+00); (void) c17;
	const float4 c18 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -3.000000119e-01); (void) c18;
	const float4 c26 = float4(-3.333333254e+00, -2.000000000e+00, 3.000000000e+00, -9.999999975e-07); (void) c26;
	const float4 c27 = float4(1.000000000e+06, 0.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c27;
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
	#define c105 uniforms.uniforms_float4[41]
	#define c106 uniforms.uniforms_float4[42]
	#define c107 uniforms.uniforms_float4[43]
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
	r2.xyz = (r2.xyz * c16.xxx) + c16.yyy;
	r3.x = dot(v2.xyz, r2.xyz);
	r3.y = dot(v3.xyz, r2.xyz);
	r3.z = dot(v4.xyz, r2.xyz);
	r2.xyz = normalize(r3.xyz);
	r3.xyz = c3.xyz + -v5.xyz;
	r3.w = dot(r3.xyz, r3.xyz);
	r3.w = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r4.xyz = r3.www * r3.xyz;
	r4.w = dot(r4.xyz, r2.xyz);
	r5.w = clamp(r4.w, 0.0, 1.0);
	r5.y = r1.w;
	r6 = s4_texture.sample(s4, r5.wy);
	r1.w = r1.x * r6.z;
	r7 = (v5.xyzx * c16.zzzw) + c16.wwwz;
	r8.x = dot(r7, c69);
	r8.y = dot(r7, c70);
	r6.xz = clamp(r8.xy, float2(0.0), float2(1.0));
	r6.xz = -r8.xy + r6.xz;
	r6.x = dot(r6.xz, c16.zz) + c16.w;
	r9.x = dot(r7, c73);
	r9.y = dot(r7, c74);
	r6.zw = clamp(r9.xy, float2(0.0), float2(1.0));
	r6.zw = -r9.xy + r6.zw;
	r6.z = dot(r6.zw, c16.zz) + c16.w;
	r10.x = dot(r7, c77);
	r10.y = dot(r7, c78);
	r9.z = c16.z;
	r10.z = c16.x;
	r9.xyz = ((-abs(r6.z) >= 0.0) ? r9.xyz : r10.xyz);
	r8.zw = c16.ww;
	r6.xzw = ((-abs(r6.x) >= 0.0) ? r8.xyz : r9.xyz);
	r8.z = dot(r7, c71);
	r9.xy = r6.xz + c13.xx;
	r9.xy = abs(r9.xy) + -c67.zz;
	r9.xy = clamp(r9.xy * c67.ww, float2(0.0), float2(1.0));
	r9.xy = -r9.xy + c16.zz;
	r9.x = r9.y * r9.x;
	r6.xz = clamp(r6.xz, float2(0.0), float2(1.0));
	r9.yzw = r6.www + -c16.wzx;
	r10.zw = c16.zw;
	r11 = ((-abs(r9.y) >= 0.0) ? c85.zwxy : r10.wwww);
	r11 = ((-abs(r9.z) >= 0.0) ? c86.zwxy : r11);
	r11 = ((-abs(r9.w) >= 0.0) ? c87.zwxy : r11);
	r8.xy = (r6.xz * r11.xy) + r11.zw;
	r11 = r8 + c13.yyzz;
	r11 = float4(s8_texture.sample_compare(s8, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
	r12 = r8 + c13.wyzz;
	r12 = float4(s8_texture.sample_compare(s8, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
	r13 = r8 + c13.ywzz;
	r13 = float4(s8_texture.sample_compare(s8, (r13.xyz).xy, (r13.xyz).z, level(r13.w)));
	r14 = r8 + c13.wwzz;
	r14 = float4(s8_texture.sample_compare(s8, (r14.xyz).xy, (r14.xyz).z, level(r14.w)));
	r11.y = r12.x;
	r11.z = r13.x;
	r11.w = r14.x;
	r6.x = dot(r11, c14.xxxx);
	r11 = r8 + c13.yzzz;
	r11 = float4(s8_texture.sample_compare(s8, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
	r12 = r8 + c13.wzzz;
	r12 = float4(s8_texture.sample_compare(s8, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
	r13 = r8 + c13.zwzz;
	r13 = float4(s8_texture.sample_compare(s8, (r13.xyz).xy, (r13.xyz).z, level(r13.w)));
	r14 = r8 + c13.zyzz;
	r14 = float4(s8_texture.sample_compare(s8, (r14.xyz).xy, (r14.xyz).z, level(r14.w)));
	r11.y = r12.x;
	r11.z = r13.x;
	r11.w = r14.x;
	r6.z = dot(r11, c14.yyyy);
	r11 = float4(s8_texture.sample_compare(s8, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
	r6.x = r6.z + r6.x;
	r6.x = (r11.x * c14.z) + r6.x;
	if (r9.x < c16.z) {
		r9.yzw = r6.www + c15.xyz;
		r11 = ((-abs(r9.y) >= 0.0) ? c73 : r10.wwww);
		r12 = ((-abs(r9.y) >= 0.0) ? c74 : r10.wwww);
		r11 = ((-abs(r9.z) >= 0.0) ? c77 : r11);
		r12 = ((-abs(r9.z) >= 0.0) ? c78 : r12);
		r11 = ((-abs(r9.w) >= 0.0) ? c81 : r11);
		r12 = ((-abs(r9.w) >= 0.0) ? c82 : r12);
		r10.x = clamp(dot(r7, r11), 0.0, 1.0);
		r10.y = clamp(dot(r7, r12), 0.0, 1.0);
		r7 = ((-abs(r9.y) >= 0.0) ? c86.zwxy : r10.wwww);
		r7 = ((-abs(r9.z) >= 0.0) ? c87.zwxy : r7);
		r7 = ((-abs(r9.w) >= 0.0) ? c88.zwxy : r7);
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
		r6.z = dot(r7, c14.xxxx);
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
		r6.w = dot(r7, c14.yyyy);
		r7 = float4(s8_texture.sample_compare(s8, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r6.z = r6.w + r6.z;
		r6.z = (r7.x * c14.z) + r6.z;
		r6.z = ((r9.w >= 0.0) ? c16.z : r6.z);
		r7.x = mix(r6.z, r6.x, r9.x);
		r6.x = r7.x;
	}
	r7.xyz = -c89.xyz + v5.xyz;
	r6.z = dot(r7.xyz, r7.xyz);
	r6.z = clamp((r6.z * c68.y) + c68.x, 0.0, 1.0);
	r7.x = mix(r6.x, c16.z, r6.z);
	r6.xzw = r2.xyz * r2.xyz;
	r7.y = ((r2.x >= 0.0) ? c16.w : c16.z);
	r7.z = ((r2.y >= 0.0) ? c16.w : c16.z);
	r7.w = ((r2.z >= 0.0) ? c16.w : c16.z);
	r8.x = ((r2.x >= 0.0) ? c16.z : c16.w);
	r8.y = ((r2.y >= 0.0) ? c16.z : c16.w);
	r8.z = ((r2.z >= 0.0) ? c16.z : c16.w);
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
	r8.w = clamp(dot(r2.xyz, r8.xyz), 0.0, 1.0);
	r9.x = (r8.w * r8.w) + r8.w;
	r9.x = r9.x * -c13.x;
	r9.xyz = r7.yzw * r9.xxx;
	r6.xzw = (r9.xyz * r7.xxx) + r6.xzw;
	r9.xyz = c23.xyz + -v5.xyz;
	r11.xyz = normalize(r9.xyz);
	r9.xyz = c22.xyz * v1.yyy;
	r9.w = clamp(dot(r2.xyz, r11.xyz), 0.0, 1.0);
	r10.x = (r9.w * r9.w) + r9.w;
	r10.x = r10.x * -c13.x;
	r6.xzw = (r9.xyz * r10.xxx) + r6.xzw;
	r10.xyw = c25.xyz + -v5.xyz;
	r12.xyz = normalize(r10.xyw);
	r10.xyw = c24.xyz * v1.zzz;
	r11.w = clamp(dot(r2.xyz, r12.xyz), 0.0, 1.0);
	r12.w = (r11.w * r11.w) + r11.w;
	r12.w = r12.w * -c13.x;
	r6.xzw = (r10.xyw * r12.www) + r6.xzw;
	r13 = s3_texture.sample(s3, v0.xy);
	r12.w = abs(c12.w);
	r13.y = r13.x * c12.w;
	r13.y = (r13.y * c17.x) + c17.y;
	r13.y = fract(r13.y);
	r13.y = (r13.y * c17.z) + c17.w;
	r14.xy = float2(cos(r13.y), sin(r13.y));
	r15.xyz = r0.zxy * c14.www;
	r15.xyz = (r0.zxy * c14.www) + -r15.zxy;
	r14.yzw = r14.yyy * r15.xyz;
	r14.yzw = (r0.xyz * r14.xxx) + r14.yzw;
	r13.y = dot(c14.www, r0.xyz);
	r13.y = r13.y * c14.w;
	r13.z = -r14.x + c16.z;
	r14.xyz = (r13.yyy * r13.zzz) + r14.yzw;
	r15.xyz = r0.xyz;
	r15.w = r13.x;
	r14.w = c16.z;
	r14 = ((-r12.w >= 0.0) ? r15 : r14);
	r0.x = -r13.w + c16.z;
	r13.xyz = v6.www * v6.xyz;
	r13.xyz = r13.xyz * c107.xyz;
	r15.x = v2.w;
	r15.y = v3.w;
	r15.z = v4.w;
	r16.xyz = (r3.xyz * r3.www) + r15.xyz;
	r17.xyz = normalize(r16.xyz);
	r0.y = clamp(dot(r2.xyz, r17.xyz), 0.0, 1.0);
	r0.z = clamp(dot(r2.xyz, r15.xyz), 0.0, 1.0);
	r12.w = -r5.w + c16.z;
	r0.y = r0.z * r0.y;
	r13.w = pow(abs(r12.w), c105.x);
	r0.y = r0.y * r13.w;
	r0.z = ((r0.z == 0.0) ? FLT_MAX : rsqrt(abs(r0.z)));
	r0.z = ((r0.z == 0.0) ? FLT_MAX : 1.0 / r0.z);
	r0.y = r0.z * r0.y;
	r13.xyz = r13.xyz * r0.yyy;
	r0.y = r5.w * r5.w;
	r15.w = r0.y * r0.y;
	r0.y = r0.x * r15.w;
	r16.xyz = r0.yyy * v6.xyz;
	r15.xyz = r16.xyz * c15.www;
	r15 = ((-r0.x >= 0.0) ? c16.wwww : r15);
	r16.xyz = (r3.xyz * r3.www) + r8.xyz;
	r17.xyz = normalize(r16.xyz);
	r5.z = clamp(dot(r2.xyz, r17.xyz), 0.0, 1.0);
	r16 = s7_texture.sample(s7, r5.zy);
	r0.y = clamp(dot(r4.xyz, r8.xyz), 0.0, 1.0);
	r0.y = r0.y * r15.w;
	r17.xyz = (r0.yyy * c15.www) + -r16.xyz;
	r17.xyz = (r0.xxx * r17.xyz) + r16.xyz;
	r16.xyz = ((-r0.x >= 0.0) ? r16.xyz : r17.xyz);
	r0.y = ((r8.w == 0.0) ? FLT_MAX : rsqrt(abs(r8.w)));
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r16.xyz = r0.yyy * r16.xyz;
	r16.xyz = r7.yzw * r16.xyz;
	r0.z = r8.w * r5.z;
	r0.z = r13.w * r0.z;
	r5.z = r0.y * r0.z;
	r8.xyw = r7.yzw * r5.zzz;
	r15.xyz = (r16.xyz * r7.xxx) + r15.xyz;
	r16.xyz = (r3.xyz * r3.www) + r11.xyz;
	r17.xyz = normalize(r16.xyz);
	r5.x = clamp(dot(r2.xyz, r17.xyz), 0.0, 1.0);
	r16 = s7_texture.sample(s7, r5.xy);
	r5.z = clamp(dot(r4.xyz, r11.xyz), 0.0, 1.0);
	r5.z = r5.z * r15.w;
	r11.xyz = (r5.zzz * c15.www) + -r16.xyz;
	r11.xyz = (r0.xxx * r11.xyz) + r16.xyz;
	r11.xyz = ((-r0.x >= 0.0) ? r16.xyz : r11.xyz);
	r5.z = ((r9.w == 0.0) ? FLT_MAX : rsqrt(abs(r9.w)));
	r5.z = ((r5.z == 0.0) ? FLT_MAX : 1.0 / r5.z);
	r11.xyz = r5.zzz * r11.xyz;
	r5.w = r9.w * r5.x;
	r5.w = r13.w * r5.w;
	r5.z = r5.z * r5.w;
	r16.xyz = r9.xyz * r5.zzz;
	r9.xyz = (r11.xyz * r9.xyz) + r15.xyz;
	r8.xyw = (r8.xyw * r7.xxx) + r16.xyz;
	r0.y = (r0.z * r0.y) + r5.z;
	r3.xyz = (r3.xyz * r3.www) + r12.xyz;
	r11.xyz = normalize(r3.xyz);
	r5.x = clamp(dot(r2.xyz, r11.xyz), 0.0, 1.0);
	r16 = s7_texture.sample(s7, r5.xy);
	r0.z = clamp(dot(r4.xyz, r12.xyz), 0.0, 1.0);
	r0.z = r0.z * r15.w;
	r3.xyz = (r0.zzz * c15.www) + -r16.xyz;
	r3.xyz = (r0.xxx * r3.xyz) + r16.xyz;
	r3.xyz = ((-r0.x >= 0.0) ? r16.xyz : r3.xyz);
	r0.z = ((r11.w == 0.0) ? FLT_MAX : rsqrt(abs(r11.w)));
	r0.z = ((r0.z == 0.0) ? FLT_MAX : 1.0 / r0.z);
	r3.xyz = r0.zzz * r3.xyz;
	r5.x = r11.w * r5.x;
	r5.x = r13.w * r5.x;
	r5.y = r0.z * r5.x;
	r3.xyz = (r3.xyz * r10.xyw) + r9.xyz;
	r5.yzw = (r5.yyy * r10.xyw) + r8.xyw;
	r0.y = (r5.x * r0.z) + r0.y;
	r0.z = r1.x * c105.y;
	r5.x = (v6.w * c11.w) + r10.z;
	r0.z = r0.z * r5.x;
	r5.xyz = r0.zzz * r5.yzw;
	r3.xyz = r2.www * r3.xyz;
	r0.z = mix(c10.x, c10.y, r1.y);
	r3.xyz = r0.zzz * r3.xyz;
	r0.z = r4.w + r4.w;
	r2.w = dot(r2.xyz, r2.xyz);
	r4.xyz = r4.xyz * r2.www;
	r4.xyz = (r0.zzz * r2.xyz) + -r4.xyz;
	r2.w = mix(r6.y, c16.z, r0.x);
	r8.xyw = r4.xyz * r4.xyz;
	r9.x = ((r4.x >= 0.0) ? c16.w : c16.z);
	r9.y = ((r4.y >= 0.0) ? c16.w : c16.z);
	r9.z = ((r4.z >= 0.0) ? c16.w : c16.z);
	r4.x = ((r4.x >= 0.0) ? c16.z : c16.w);
	r4.y = ((r4.y >= 0.0) ? c16.z : c16.w);
	r4.z = ((r4.z >= 0.0) ? c16.z : c16.w);
	r9.xyz = r8.xyw * r9.xyz;
	r4.xyz = r8.xyw * r4.xyz;
	r8.xyw = r9.xxx * c5.xyz;
	r8.xyw = (r4.xxx * c4.xyz) + r8.xyw;
	r4.xyw = (r4.yyy * c6.xyz) + r8.xyw;
	r4.xyw = (r9.yyy * c7.xyz) + r4.xyw;
	r4.xyz = (r4.zzz * c8.xyz) + r4.xyw;
	r4.xyz = (r9.zzz * c9.xyz) + r4.xyz;
	r0.x = clamp(r8.z, 0.0, 1.0);
	r0.x = (r0.x * r0.x) + r0.x;
	r0.x = r0.x * -c13.x;
	r8.xyz = r0.xxx * r7.yzw;
	r4.xyz = r4.xyz * r8.xyz;
	r8.x = v7.w;
	r8.y = v8.w;
	r8.z = v9.w;
	r8.xyz = -r8.xyz + c21.xyz;
	r9.xyz = normalize(r8.xyz);
	r0.x = clamp(dot(-v9.xyz, r9.xyz), 0.0, 1.0);
	r0.x = (r0.x * r0.x) + r0.x;
	r0.x = r0.x * -c13.x;
	r7.xyz = r0.xxx * r7.yzw;
	r0.x = clamp(dot(r2.xyz, v9.xyz), 0.0, 1.0);
	r2.xyz = c0.xyz * v6.xyz;
	r2.xyz = (r2.xyz * r7.xyz) + -r4.xyz;
	r2.xyz = (r0.xxx * r2.xyz) + r4.xyz;
	r0.x = r1.w * c0.w;
	r2.xyz = r0.xxx * r2.xyz;
	r2.xyz = (r3.xyz * r2.www) + r2.xyz;
	r3.xyz = r14.xyz + c16.yyy;
	r3.xyz = (r1.yyy * r3.xyz) + c16.zzz;
	r2.xyz = r2.xyz * r3.xyz;
	r0.x = r1.y * c101.w;
	r0.z = clamp(r0.x, 0.0, 1.0);
	r3.xyz = (r14.xyz * r0.xxx) + -c106.xyz;
	r3.xyz = (r0.zzz * r3.xyz) + c106.xyz;
	r4.xyz = r3.xyz * r5.xyz;
	r0.x = clamp(c107.w + v6.w, 0.0, 1.0);
	r7.xyz = (r5.xyz * r3.xyz) + r6.xzw;
	r0.z = dot(r7.xyz, c18.xyz);
	r0.z = r0.z + c18.w;
	r0.z = clamp(r0.z * c26.x, 0.0, 1.0);
	r1.y = (r0.z * c26.y) + c26.z;
	r0.z = r0.z * r0.z;
	r0.z = r0.z * r1.y;
	r1.y = dot(r6.xzw, c18.xyz);
	r7.xy = -c2.xw + c2.yz;
	r1.yw = r1.yy + -c2.xw;
	r2.w = ((r7.x == 0.0) ? FLT_MAX : 1.0 / r7.x);
	r1.y = clamp(r1.y * r2.w, 0.0, 1.0);
	r2.w = (r1.y * c26.y) + c26.z;
	r1.y = r1.y * r1.y;
	r1.y = r1.y * r2.w;
	r2.w = ((r7.y == 0.0) ? FLT_MAX : 1.0 / r7.y);
	r1.w = clamp(r1.w * r2.w, 0.0, 1.0);
	r2.w = (r1.w * c26.y) + c26.z;
	r1.w = r1.w * r1.w;
	r7.xy = -c33.xw + c33.yz;
	r7.zw = r0.yy + -c33.xw;
	r0.y = ((r7.x == 0.0) ? FLT_MAX : 1.0 / r7.x);
	r0.y = clamp(r0.y * r7.z, 0.0, 1.0);
	r4.w = (r0.y * c26.y) + c26.z;
	r0.y = r0.y * r0.y;
	r0.y = r0.y * r4.w;
	r4.w = ((r7.y == 0.0) ? FLT_MAX : 1.0 / r7.y);
	r4.w = clamp(r4.w * r7.w, 0.0, 1.0);
	r5.w = (r4.w * c26.y) + c26.z;
	r4.w = r4.w * r4.w;
	r4.w = r4.w * r5.w;
	r0.y = r0.y * r4.w;
	r4.x = dot(r4.xyz, c18.xyz);
	r0.y = r0.y * r4.x;
	r0.y = r0.y * c106.w;
	r0.y = (r2.w * r1.w) + r0.y;
	r1.w = abs(c101.y);
	r4.xyz = r14.xyz * r14.xyz;
	r4.xyz = r4.xyz * r4.xyz;
	r2.w = dot(r14.xyz, c18.xyz);
	r7.xyz = mix(r14.xyz, r2.www, -c101.yyy);
	r4.w = dot(r4.xyz, c18.xyz);
	r5.w = r4.w + c26.w;
	r4.xyz = r2.www * r4.xyz;
	r2.w = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r2.w = ((r5.w >= 0.0) ? r2.w : c27.x);
	r4.xyz = (r4.xyz * r2.www) + -r14.xyz;
	r4.xyz = (c101.yyy * r4.xyz) + r14.xyz;
	r4.xyz = ((c101.y >= 0.0) ? r4.xyz : r7.xyz);
	r4.xyz = ((-r1.w >= 0.0) ? r14.xyz : r4.xyz);
	r0.y = r0.y * r1.y;
	r0.y = r14.w * r0.y;
	r7.xyz = mix(r14.xyz, r4.xyz, r0.yyy);
	r0.y = dot(r7.xyz, c18.xyz);
	r4.xyz = c18.xyz;
	r1.y = dot(c102.xyz, r4.xyz);
	r1.w = r1.y + c26.w;
	r4.xyz = r0.yyy * c102.xyz;
	r0.y = ((r1.y == 0.0) ? FLT_MAX : 1.0 / r1.y);
	r0.y = ((r1.w >= 0.0) ? r0.y : c27.x);
	r4.xyz = (r4.xyz * r0.yyy) + -r7.xyz;
	r4.xyz = (c102.www * r4.xyz) + r7.xyz;
	r4.xyz = (r4.xyz * r0.xxx) + -r7.xyz;
	r0.xyz = (r0.zzz * r4.xyz) + r7.xyz;
	r4.xyz = r6.xzw + v6.xyz;
	r0.xyz = r1.zzz * r0.xyz;
	r0.xyz = (r0.xyz * r4.xyz) + r2.xyz;
	r0.xyz = (r5.xyz * r3.xyz) + r0.xyz;
	r0.xyz = (r13.xyz * r1.xxx) + r0.xyz;
	oC0.w = r0.w * c1.w;
	r0.xyz = r0.xyz * c1.xyz;
	r0.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r0.w = clamp((r0.w * c19.w) + c19.x, 0.0, 1.0);
	r1.x = min(r0.w, c19.z);
	r1.yzw = r0.xyz * c30.xxx;
	r0.w = r1.x * r1.x;
	r1.x = c30.x;
	r0.xyz = (r0.xyz * -r1.xxx) + c29.xyz;
	oC0.xyz = (r0.www * r0.xyz) + r1.yzw;
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

