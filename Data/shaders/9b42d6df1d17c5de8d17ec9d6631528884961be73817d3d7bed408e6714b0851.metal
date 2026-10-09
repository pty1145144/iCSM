#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[42];
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
	depth2d<float> s8_texture [[texture(8)]],
	sampler s8 [[sampler(8)]],
	texture2d<float> s10_texture [[texture(10)]],
	sampler s10 [[sampler(10)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c2 = float4(1.591549367e-01, 5.000000000e-01, 6.283185482e+00, -3.141592741e+00); (void) c2;
	const float4 c13 = float4(1.000000000e+00, 0.000000000e+00, 2.000000000e+00, 4.882812500e-04); (void) c13;
	const float4 c14 = float4(-4.882812500e-04, 4.882812500e-04, 0.000000000e+00, 6.250000000e-02); (void) c14;
	const float4 c15 = float4(1.250000000e-01, 2.500000000e-01, -9.999999975e-07, 1.000000000e+06); (void) c15;
	const float4 c16 = float4(-2.000000000e+00, 3.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c16;
	const float4 c17 = float4(0.000000000e+00, -1.000000000e+00, -2.000000000e+00, -3.000000119e-01); (void) c17;
	const float4 c18 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -3.333333254e+00); (void) c18;
	const float4 c19 = float4(5.773500204e-01, 1.000000000e+00, 2.000000000e+00, -1.000000000e+00); (void) c19;
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
	#define c3 uniforms.uniforms_float4[2]
	#define c4 uniforms.uniforms_float4[3]
	#define c5 uniforms.uniforms_float4[4]
	#define c6 uniforms.uniforms_float4[5]
	#define c7 uniforms.uniforms_float4[6]
	#define c8 uniforms.uniforms_float4[7]
	#define c9 uniforms.uniforms_float4[8]
	#define c10 uniforms.uniforms_float4[9]
	#define c11 uniforms.uniforms_float4[10]
	#define c12 uniforms.uniforms_float4[11]
	#define c20 uniforms.uniforms_float4[12]
	#define c21 uniforms.uniforms_float4[13]
	#define c22 uniforms.uniforms_float4[14]
	#define c23 uniforms.uniforms_float4[15]
	#define c24 uniforms.uniforms_float4[16]
	#define c25 uniforms.uniforms_float4[17]
	#define c30 uniforms.uniforms_float4[18]
	#define c67 uniforms.uniforms_float4[19]
	#define c68 uniforms.uniforms_float4[20]
	#define c69 uniforms.uniforms_float4[21]
	#define c70 uniforms.uniforms_float4[22]
	#define c71 uniforms.uniforms_float4[23]
	#define c73 uniforms.uniforms_float4[24]
	#define c74 uniforms.uniforms_float4[25]
	#define c77 uniforms.uniforms_float4[26]
	#define c78 uniforms.uniforms_float4[27]
	#define c81 uniforms.uniforms_float4[28]
	#define c82 uniforms.uniforms_float4[29]
	#define c85 uniforms.uniforms_float4[30]
	#define c86 uniforms.uniforms_float4[31]
	#define c87 uniforms.uniforms_float4[32]
	#define c88 uniforms.uniforms_float4[33]
	#define c89 uniforms.uniforms_float4[34]
	#define c101 uniforms.uniforms_float4[35]
	#define c102 uniforms.uniforms_float4[36]
	#define c103 uniforms.uniforms_float4[37]
	#define c104 uniforms.uniforms_float4[38]
	#define c105 uniforms.uniforms_float4[39]
	#define c106 uniforms.uniforms_float4[40]
	#define c107 uniforms.uniforms_float4[41]
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
	r3.x = abs(c12.w);
	r4.xy = c2.xy;
	r3.y = (c12.w * r4.x) + r4.y;
	r3.y = fract(r3.y);
	r3.y = (r3.y * c2.z) + c2.w;
	r4.xy = float2(cos(r3.y), sin(r3.y));
	r3.yzw = r0.zxy * c19.xxx;
	r3.yzw = (r0.zxy * c19.xxx) + -r3.wyz;
	r3.yzw = r4.yyy * r3.yzw;
	r3.yzw = (r0.xyz * r4.xxx) + r3.yzw;
	r4.y = dot(c19.xxx, r0.xyz);
	r4.y = r4.y * c19.x;
	r4.x = -r4.x + c19.y;
	r3.yzw = (r4.yyy * r4.xxx) + r3.yzw;
	r0.xyz = ((-r3.x >= 0.0) ? r0.xyz : r3.yzw);
	r2.xyz = (r2.xyz * c19.zzz) + c19.www;
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
	r5.z = r1.w;
	r6 = s4_texture.sample(s4, r5.wz);
	r1.w = r1.x * r6.z;
	r7 = (v5.xyzx * c13.xxxy) + c13.yyyx;
	r8.x = dot(r7, c69);
	r8.y = dot(r7, c70);
	r6.xz = clamp(r8.xy, float2(0.0), float2(1.0));
	r6.xz = -r8.xy + r6.xz;
	r6.x = dot(r6.xz, c13.xx) + c13.y;
	r9.x = dot(r7, c73);
	r9.y = dot(r7, c74);
	r6.zw = clamp(r9.xy, float2(0.0), float2(1.0));
	r6.zw = -r9.xy + r6.zw;
	r6.z = dot(r6.zw, c13.xx) + c13.y;
	r10.x = dot(r7, c77);
	r10.y = dot(r7, c78);
	r9.z = c19.y;
	r10.z = c19.z;
	r9.xyz = ((-abs(r6.z) >= 0.0) ? r9.xyz : r10.xyz);
	r8.zw = c13.yy;
	r6.xzw = ((-abs(r6.x) >= 0.0) ? r8.xyz : r9.xyz);
	r8.z = dot(r7, c71);
	r9.xy = r6.xz + -c2.yy;
	r9.xy = abs(r9.xy) + -c67.zz;
	r9.xy = clamp(r9.xy * c67.ww, float2(0.0), float2(1.0));
	r9.xy = -r9.xy + c19.yy;
	r9.x = r9.y * r9.x;
	r6.xz = clamp(r6.xz, float2(0.0), float2(1.0));
	r9.yzw = r6.www + -c13.yxz;
	r10.y = c13.y;
	r11 = ((-abs(r9.y) >= 0.0) ? c85.zwxy : r10.yyyy);
	r11 = ((-abs(r9.z) >= 0.0) ? c86.zwxy : r11);
	r11 = ((-abs(r9.w) >= 0.0) ? c87.zwxy : r11);
	r8.xy = (r6.xz * r11.xy) + r11.zw;
	r11 = r8 + c13.wwyy;
	r11 = float4(s8_texture.sample_compare(s8, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
	r12 = r8 + c14.xyzz;
	r12 = float4(s8_texture.sample_compare(s8, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
	r13 = r8 + c14.yxzz;
	r13 = float4(s8_texture.sample_compare(s8, (r13.xyz).xy, (r13.xyz).z, level(r13.w)));
	r14 = r8 + c14.xxzz;
	r14 = float4(s8_texture.sample_compare(s8, (r14.xyz).xy, (r14.xyz).z, level(r14.w)));
	r11.y = r12.x;
	r11.z = r13.x;
	r11.w = r14.x;
	r6.x = dot(r11, c14.wwww);
	r11 = r8 + c13.wyyy;
	r11 = float4(s8_texture.sample_compare(s8, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
	r12 = r8 + c14.xzzz;
	r12 = float4(s8_texture.sample_compare(s8, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
	r13 = r8 + c14.zxzz;
	r13 = float4(s8_texture.sample_compare(s8, (r13.xyz).xy, (r13.xyz).z, level(r13.w)));
	r14 = r8 + c13.ywyy;
	r14 = float4(s8_texture.sample_compare(s8, (r14.xyz).xy, (r14.xyz).z, level(r14.w)));
	r11.y = r12.x;
	r11.z = r13.x;
	r11.w = r14.x;
	r6.z = dot(r11, c15.xxxx);
	r11 = float4(s8_texture.sample_compare(s8, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
	r6.x = r6.z + r6.x;
	r6.x = (r11.x * c15.y) + r6.x;
	if (r9.x < c19.y) {
		r9.yzw = r6.www + c17.xyz;
		r11 = ((-abs(r9.y) >= 0.0) ? c73 : r10.yyyy);
		r12 = ((-abs(r9.y) >= 0.0) ? c74 : r10.yyyy);
		r11 = ((-abs(r9.z) >= 0.0) ? c77 : r11);
		r12 = ((-abs(r9.z) >= 0.0) ? c78 : r12);
		r11 = ((-abs(r9.w) >= 0.0) ? c81 : r11);
		r12 = ((-abs(r9.w) >= 0.0) ? c82 : r12);
		r11.x = clamp(dot(r7, r11), 0.0, 1.0);
		r11.y = clamp(dot(r7, r12), 0.0, 1.0);
		r7 = ((-abs(r9.y) >= 0.0) ? c86.zwxy : r10.yyyy);
		r7 = ((-abs(r9.z) >= 0.0) ? c87.zwxy : r7);
		r7 = ((-abs(r9.w) >= 0.0) ? c88.zwxy : r7);
		r8.xy = (r11.xy * r7.xy) + r7.zw;
		r7 = r8 + c13.wwyy;
		r7 = float4(s8_texture.sample_compare(s8, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
		r10 = r8 + c14.xyzz;
		r10 = float4(s8_texture.sample_compare(s8, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r11 = r8 + c14.yxzz;
		r11 = float4(s8_texture.sample_compare(s8, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
		r12 = r8 + c14.xxzz;
		r12 = float4(s8_texture.sample_compare(s8, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
		r7.y = r10.x;
		r7.z = r11.x;
		r7.w = r12.x;
		r6.z = dot(r7, c14.wwww);
		r7 = r8 + c13.wyyy;
		r7 = float4(s8_texture.sample_compare(s8, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
		r10 = r8 + c14.xzzz;
		r10 = float4(s8_texture.sample_compare(s8, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r11 = r8 + c14.zxzz;
		r11 = float4(s8_texture.sample_compare(s8, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
		r12 = r8 + c13.ywyy;
		r12 = float4(s8_texture.sample_compare(s8, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
		r7.y = r10.x;
		r7.z = r11.x;
		r7.w = r12.x;
		r6.w = dot(r7, c15.xxxx);
		r7 = float4(s8_texture.sample_compare(s8, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r6.z = r6.w + r6.z;
		r6.z = (r7.x * c15.y) + r6.z;
		r6.z = ((r9.w >= 0.0) ? c19.y : r6.z);
		r7.x = mix(r6.z, r6.x, r9.x);
		r6.x = r7.x;
	}
	r7.xyz = -c89.xyz + v5.xyz;
	r6.z = dot(r7.xyz, r7.xyz);
	r6.z = clamp((r6.z * c68.y) + c68.x, 0.0, 1.0);
	r7.x = mix(r6.x, c19.y, r6.z);
	r6.xzw = r2.xyz * r2.xyz;
	r7.y = ((r2.x >= 0.0) ? c13.y : c13.x);
	r7.z = ((r2.y >= 0.0) ? c13.y : c13.x);
	r7.w = ((r2.z >= 0.0) ? c13.y : c13.x);
	r8.x = ((r2.x >= 0.0) ? c13.x : c13.y);
	r8.y = ((r2.y >= 0.0) ? c13.x : c13.y);
	r8.z = ((r2.z >= 0.0) ? c13.x : c13.y);
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
	r9.x = r9.x * c2.y;
	r9.xyz = r7.yzw * r9.xxx;
	r6.xzw = (r9.xyz * r7.xxx) + r6.xzw;
	r9.xyz = c23.xyz + -v5.xyz;
	r10.xyz = normalize(r9.xyz);
	r9.xyz = c22.xyz * v1.yyy;
	r9.w = clamp(dot(r2.xyz, r10.xyz), 0.0, 1.0);
	r10.w = (r9.w * r9.w) + r9.w;
	r10.w = r10.w * c2.y;
	r6.xzw = (r9.xyz * r10.www) + r6.xzw;
	r11.xyz = c25.xyz + -v5.xyz;
	r12.xyz = normalize(r11.xyz);
	r11.xyz = c24.xyz * v1.zzz;
	r10.w = clamp(dot(r2.xyz, r12.xyz), 0.0, 1.0);
	r11.w = (r10.w * r10.w) + r10.w;
	r11.w = r11.w * c2.y;
	r6.xzw = (r11.xyz * r11.www) + r6.xzw;
	r13.x = c23.w + -v5.x;
	r13.y = c24.w + -v5.y;
	r13.z = c25.w + -v5.z;
	r14.xyz = normalize(r13.xyz);
	r13.x = c20.w * v1.w;
	r13.y = c21.w * v1.w;
	r13.z = c22.w * v1.w;
	r11.w = clamp(dot(r2.xyz, r14.xyz), 0.0, 1.0);
	r12.w = (r11.w * r11.w) + r11.w;
	r12.w = r12.w * c2.y;
	r6.xzw = (r13.xyz * r12.www) + r6.xzw;
	r15.xyz = (r3.xyz * r3.www) + r8.xyz;
	r16.xyz = normalize(r15.xyz);
	r5.y = clamp(dot(r2.xyz, r16.xyz), 0.0, 1.0);
	r15 = s7_texture.sample(s7, r5.yz);
	r8.x = ((r8.w == 0.0) ? FLT_MAX : rsqrt(abs(r8.w)));
	r8.x = ((r8.x == 0.0) ? FLT_MAX : 1.0 / r8.x);
	r15.xyz = r8.xxx * r15.xyz;
	r15.xyz = r7.yzw * r15.xyz;
	r5.w = -r5.w + c19.y;
	r8.y = r8.w * r5.y;
	r8.w = pow(abs(r5.w), c105.x);
	r5.w = r8.w * r8.y;
	r5.w = r8.x * r5.w;
	r16.xyz = r7.yzw * r5.www;
	r10.xyz = (r3.xyz * r3.www) + r10.xyz;
	r17.xyz = normalize(r10.xyz);
	r5.x = clamp(dot(r2.xyz, r17.xyz), 0.0, 1.0);
	r17 = s7_texture.sample(s7, r5.xz);
	r5.w = ((r9.w == 0.0) ? FLT_MAX : rsqrt(abs(r9.w)));
	r5.w = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r10.xyz = r5.www * r17.xyz;
	r10.xyz = r9.xyz * r10.xyz;
	r8.x = r9.w * r5.x;
	r8.x = r8.w * r8.x;
	r5.w = r5.w * r8.x;
	r9.xyz = r9.xyz * r5.www;
	r10.xyz = (r15.xyz * r7.xxx) + r10.xyz;
	r9.xyz = (r16.xyz * r7.xxx) + r9.xyz;
	r12.xyz = (r3.xyz * r3.www) + r12.xyz;
	r15.xyz = normalize(r12.xyz);
	r5.y = clamp(dot(r2.xyz, r15.xyz), 0.0, 1.0);
	r12 = s7_texture.sample(s7, r5.yz);
	r5.w = ((r10.w == 0.0) ? FLT_MAX : rsqrt(abs(r10.w)));
	r5.w = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r12.xyz = r5.www * r12.xyz;
	r5.y = r10.w * r5.y;
	r5.y = r8.w * r5.y;
	r5.y = r5.w * r5.y;
	r10.xyz = (r12.xyz * r11.xyz) + r10.xyz;
	r9.xyz = (r5.yyy * r11.xyz) + r9.xyz;
	r3.xyz = (r3.xyz * r3.www) + r14.xyz;
	r11.xyz = normalize(r3.xyz);
	r5.x = clamp(dot(r2.xyz, r11.xyz), 0.0, 1.0);
	r3 = s7_texture.sample(s7, r5.xz);
	r3.w = ((r11.w == 0.0) ? FLT_MAX : rsqrt(abs(r11.w)));
	r3.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r3.xyz = r3.www * r3.xyz;
	r5.x = r11.w * r5.x;
	r5.x = r8.w * r5.x;
	r3.w = r3.w * r5.x;
	r3.xyz = (r3.xyz * r13.xyz) + r10.xyz;
	r5.xyz = (r3.www * r13.xyz) + r9.xyz;
	r1.x = r1.x * c105.y;
	r8.y = c19.y;
	r3.w = (v6.w * c11.w) + r8.y;
	r1.x = r1.x * r3.w;
	r5.xyz = r1.xxx * r5.xyz;
	r3.xyz = r2.www * r3.xyz;
	r2.w = mix(c10.x, c10.y, r1.y);
	r1.x = r4.w + r4.w;
	r3.w = dot(r2.xyz, r2.xyz);
	r4.xyz = r4.xyz * r3.www;
	r4.xyz = (r1.xxx * r2.xyz) + -r4.xyz;
	r9 = s6_texture.sample(s6, r4.xyz);
	r8.xyw = r9.xyz * c30.zzz;
	r1.x = abs(c103.w);
	r10.xyz = r8.xyw * r8.xyw;
	r10.xyz = r10.xyz * r10.xyz;
	r3.w = dot(r8.xyw, c18.xyz);
	r9.xyz = (c30.zzz * -r9.xyz) + r3.www;
	r9.xyz = (-c103.www * r9.xyz) + r8.xyw;
	r4.w = dot(r10.xyz, c18.xyz);
	r5.w = r4.w + c15.z;
	r10.xyz = r3.www * r10.xyz;
	r3.w = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r3.w = ((r5.w >= 0.0) ? r3.w : c15.w);
	r10.xyz = (r10.xyz * r3.www) + -r8.xyw;
	r10.xyz = (c103.www * r10.xyz) + r8.xyw;
	r9.xyz = ((c103.w >= 0.0) ? r10.xyz : r9.xyz);
	r8.xyw = ((-r1.x >= 0.0) ? r8.xyw : r9.xyz);
	r9.xyz = r6.xzw + v6.xyz;
	r10.xyz = r9.xyz + -c103.xxx;
	r10.xyz = clamp(r10.xyz * c103.yyy, float3(0.0), float3(1.0));
	r10.xyz = (r8.xyw * r10.xyz) + -r8.xyw;
	r8.xyw = (c101.xxx * r10.xyz) + r8.xyw;
	r10.xyz = (r8.xyw * r8.xyw) + -r8.xyw;
	r8.xyw = (c103.zzz * r10.xyz) + r8.xyw;
	r10.xyz = r0.www * c104.xyz;
	r8.xyw = r8.xyw * r10.xyz;
	r3.xyz = (r3.xyz * r2.www) + r8.xyw;
	r8.xyw = r4.xyz * r4.xyz;
	r10.x = ((r4.x >= 0.0) ? c13.y : c13.x);
	r10.y = ((r4.y >= 0.0) ? c13.y : c13.x);
	r10.z = ((r4.z >= 0.0) ? c13.y : c13.x);
	r4.x = ((r4.x >= 0.0) ? c13.x : c13.y);
	r4.y = ((r4.y >= 0.0) ? c13.x : c13.y);
	r4.z = ((r4.z >= 0.0) ? c13.x : c13.y);
	r10.xyz = r8.xyw * r10.xyz;
	r4.xyz = r8.xyw * r4.xyz;
	r8.xyw = r10.xxx * c5.xyz;
	r8.xyw = (r4.xxx * c4.xyz) + r8.xyw;
	r4.xyw = (r4.yyy * c6.xyz) + r8.xyw;
	r4.xyw = (r10.yyy * c7.xyz) + r4.xyw;
	r4.xyz = (r4.zzz * c8.xyz) + r4.xyw;
	r4.xyz = (r10.zzz * c9.xyz) + r4.xyz;
	r0.w = clamp(r8.z, 0.0, 1.0);
	r0.w = (r0.w * r0.w) + r0.w;
	r0.w = r0.w * c2.y;
	r8.xyz = r0.www * r7.yzw;
	r4.xyz = r4.xyz * r8.xyz;
	r8.x = v7.w;
	r8.y = v8.w;
	r8.z = v9.w;
	r8.xyz = -r8.xyz + c21.xyz;
	r10.xyz = normalize(r8.xyz);
	r0.w = clamp(dot(-v9.xyz, r10.xyz), 0.0, 1.0);
	r0.w = (r0.w * r0.w) + r0.w;
	r0.w = r0.w * c2.y;
	r7.xyz = r0.www * r7.yzw;
	r0.w = clamp(dot(r2.xyz, v9.xyz), 0.0, 1.0);
	r2.xyz = c0.xyz * v6.xyz;
	r2.xyz = (r2.xyz * r7.xyz) + -r4.xyz;
	r2.xyz = (r0.www * r2.xyz) + r4.xyz;
	r0.w = r1.w * c0.w;
	r2.xyz = r0.www * r2.xyz;
	r2.xyz = (r3.xyz * r6.yyy) + r2.xyz;
	r3.xyz = r0.xyz + c19.www;
	r3.xyz = (r1.yyy * r3.xyz) + c19.yyy;
	r2.xyz = r2.xyz * r3.xyz;
	r0.w = r1.y * c101.w;
	r1.x = clamp(r0.w, 0.0, 1.0);
	r3.xyz = (r0.xyz * r0.www) + -c106.xyz;
	r1.xyw = (r1.xxx * r3.xyz) + c106.xyz;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r3.xyz = (r5.xyz * r1.xyw) + r6.xzw;
	r2.w = dot(r3.xyz, c18.xyz);
	r2.w = r2.w + c17.w;
	r2.w = clamp(r2.w * c18.w, 0.0, 1.0);
	r3.x = (r2.w * c16.x) + c16.y;
	r2.w = r2.w * r2.w;
	r2.w = r2.w * r3.x;
	r3.x = dot(r0.xyz, c18.xyz);
	r4.xyz = c18.xyz;
	r3.y = dot(c102.xyz, r4.xyz);
	r3.z = r3.y + c15.z;
	r4.xyz = r3.xxx * c102.xyz;
	r3.x = ((r3.y == 0.0) ? FLT_MAX : 1.0 / r3.y);
	r3.x = ((r3.z >= 0.0) ? r3.x : c15.w);
	r3.xyz = (r4.xyz * r3.xxx) + -r0.xyz;
	r3.xyz = (c102.www * r3.xyz) + r0.xyz;
	r3.xyz = (r3.xyz * r0.www) + -r0.xyz;
	r0.xyz = (r2.www * r3.xyz) + r0.xyz;
	r0.xyz = r1.zzz * r0.xyz;
	r0.xyz = (r0.xyz * r9.xyz) + r2.xyz;
	r0.xyz = (r5.xyz * r1.xyw) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	oC0.xyz = r0.xyz * c30.xxx;
	oC0.w = c1.w;
	#undef c0
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

