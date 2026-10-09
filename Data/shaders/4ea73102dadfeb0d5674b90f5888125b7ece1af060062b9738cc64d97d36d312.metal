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
	const float4 c0 = float4(-0.5, 0.000488281, 0.0, -0.000488281); (void) c0;
	const float4 c2 = float4(0.062499999, 0.125, 0.25, 0.57735002); (void) c2;
	const float4 c13 = float4(0.159154935, 0.5, 6.283185478, -3.141592739); (void) c13;
	const float4 c14 = float4(0.0, -1.0, -2.0, 5.0); (void) c14;
	const float4 c15 = float4(-2.0, 3.0, 0.0, 0.0); (void) c15;
	const float4 c16 = float4(1000000.0, -0.300000011, -3.333333253, 0.0); (void) c16;
	const float4 c17 = float4(0.298999992, 0.587000012, 0.114, -0.000001); (void) c17;
	const float4 c18 = float4(2.0, -1.0, 1.0, 0.0); (void) c18;
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
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	r1 = s10_texture.sample(s10, v0.xy);
	r2 = s1_texture.sample(s1, v0.xy);
	r2.xyz = (r2.xyz * c18.xxx) + c18.yyy;
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
	r7 = (v5.xyzx * c18.zzzw) + c18.wwwz;
	r8.x = dot(r7, c69);
	r8.y = dot(r7, c70);
	r6.xz = clamp(r8.xy, float2(0.0), float2(1.0));
	r6.xz = -r8.xy + r6.xz;
	r1.w = dot(r6.xz, c18.zz) + c18.w;
	r9.x = dot(r7, c73);
	r9.y = dot(r7, c74);
	r6.xz = clamp(r9.xy, float2(0.0), float2(1.0));
	r6.xz = -r9.xy + r6.xz;
	r6.x = dot(r6.xz, c18.zz) + c18.w;
	r10.x = dot(r7, c77);
	r10.y = dot(r7, c78);
	r9.z = c18.z;
	r10.z = c18.x;
	r6.xzw = ((-abs(r6.x) >= 0.0) ? r9.xyz : r10.xyz);
	r8.zw = c18.ww;
	r6.xzw = ((-abs(r1.w) >= 0.0) ? r8.xyz : r6.xzw);
	r8.z = dot(r7, c71);
	r9.xy = r6.xz + c0.xx;
	r9.xy = abs(r9.xy) + -c67.zz;
	r9.xy = clamp(r9.xy * c67.ww, float2(0.0), float2(1.0));
	r9.xy = -r9.xy + c18.zz;
	r1.w = r9.y * r9.x;
	r6.xz = clamp(r6.xz, float2(0.0), float2(1.0));
	r9.xyz = r6.www + -c18.wzx;
	r10.zw = c18.zw;
	r11 = ((-abs(r9.x) >= 0.0) ? c85.zwxy : r10.wwww);
	r11 = ((-abs(r9.y) >= 0.0) ? c86.zwxy : r11);
	r9 = ((-abs(r9.z) >= 0.0) ? c87.zwxy : r11);
	r8.xy = (r6.xz * r9.xy) + r9.zw;
	r9 = r8 + c0.yyzz;
	r9 = float4(s8_texture.sample_compare(s8, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
	r11 = r8 + c0.wyzz;
	r11 = float4(s8_texture.sample_compare(s8, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
	r12 = r8 + c0.ywzz;
	r12 = float4(s8_texture.sample_compare(s8, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
	r13 = r8 + c0.wwzz;
	r13 = float4(s8_texture.sample_compare(s8, (r13.xyz).xy, (r13.xyz).z, level(r13.w)));
	r9.y = r11.x;
	r9.z = r12.x;
	r9.w = r13.x;
	r6.x = dot(r9, c2.xxxx);
	r9 = r8 + c0.yzzz;
	r9 = float4(s8_texture.sample_compare(s8, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
	r11 = r8 + c0.wzzz;
	r11 = float4(s8_texture.sample_compare(s8, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
	r12 = r8 + c0.zwzz;
	r12 = float4(s8_texture.sample_compare(s8, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
	r13 = r8 + c0.zyzz;
	r13 = float4(s8_texture.sample_compare(s8, (r13.xyz).xy, (r13.xyz).z, level(r13.w)));
	r9.y = r11.x;
	r9.z = r12.x;
	r9.w = r13.x;
	r6.z = dot(r9, c2.yyyy);
	r9 = float4(s8_texture.sample_compare(s8, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
	r6.x = r6.z + r6.x;
	r6.x = (r9.x * c2.z) + r6.x;
	if (r1.w < c18.z) {
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
		r7 = r8 + c0.yyzz;
		r7 = float4(s8_texture.sample_compare(s8, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
		r11 = r8 + c0.wyzz;
		r11 = float4(s8_texture.sample_compare(s8, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
		r12 = r8 + c0.ywzz;
		r12 = float4(s8_texture.sample_compare(s8, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
		r13 = r8 + c0.wwzz;
		r13 = float4(s8_texture.sample_compare(s8, (r13.xyz).xy, (r13.xyz).z, level(r13.w)));
		r7.y = r11.x;
		r7.z = r12.x;
		r7.w = r13.x;
		r6.z = dot(r7, c2.xxxx);
		r7 = r8 + c0.yzzz;
		r7 = float4(s8_texture.sample_compare(s8, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
		r11 = r8 + c0.wzzz;
		r11 = float4(s8_texture.sample_compare(s8, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
		r12 = r8 + c0.zwzz;
		r12 = float4(s8_texture.sample_compare(s8, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
		r13 = r8 + c0.zyzz;
		r13 = float4(s8_texture.sample_compare(s8, (r13.xyz).xy, (r13.xyz).z, level(r13.w)));
		r7.y = r11.x;
		r7.z = r12.x;
		r7.w = r13.x;
		r6.w = dot(r7, c2.yyyy);
		r7 = float4(s8_texture.sample_compare(s8, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r6.z = r6.w + r6.z;
		r6.z = (r7.x * c2.z) + r6.z;
		r6.z = ((r9.z >= 0.0) ? c18.z : r6.z);
		r7.x = mix(r6.z, r6.x, r1.w);
		r6.x = r7.x;
	}
	r7.xyz = -c89.xyz + v5.xyz;
	r1.w = dot(r7.xyz, r7.xyz);
	r1.w = clamp((r1.w * c68.y) + c68.x, 0.0, 1.0);
	r7.x = mix(r6.x, c18.z, r1.w);
	r6.xzw = r2.xyz * r2.xyz;
	r7.y = ((r2.x >= 0.0) ? c18.w : c18.z);
	r7.z = ((r2.y >= 0.0) ? c18.w : c18.z);
	r7.w = ((r2.z >= 0.0) ? c18.w : c18.z);
	r8.x = ((r2.x >= 0.0) ? c18.z : c18.w);
	r8.y = ((r2.y >= 0.0) ? c18.z : c18.w);
	r8.z = ((r2.z >= 0.0) ? c18.z : c18.w);
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
	r1.w = clamp(dot(r2.xyz, r8.xyz), 0.0, 1.0);
	r8.w = (r1.w * r1.w) + r1.w;
	r8.w = r8.w * -c0.x;
	r9.xyz = r7.yzw * r8.www;
	r6.xzw = (r9.xyz * r7.xxx) + r6.xzw;
	r9.xyz = c23.xyz + -v5.xyz;
	r11.xyz = normalize(r9.xyz);
	r9.xyz = c22.xyz * v1.yyy;
	r8.w = clamp(dot(r2.xyz, r11.xyz), 0.0, 1.0);
	r9.w = (r8.w * r8.w) + r8.w;
	r9.w = r9.w * -c0.x;
	r6.xzw = (r9.xyz * r9.www) + r6.xzw;
	r10.xyw = c25.xyz + -v5.xyz;
	r12.xyz = normalize(r10.xyw);
	r10.xyw = c24.xyz * v1.zzz;
	r9.w = clamp(dot(r2.xyz, r12.xyz), 0.0, 1.0);
	r11.w = (r9.w * r9.w) + r9.w;
	r11.w = r11.w * -c0.x;
	r6.xzw = (r10.xyw * r11.www) + r6.xzw;
	r13 = s3_texture.sample(s3, v0.xy);
	r11.w = abs(c12.w);
	r12.w = r13.x * c12.w;
	r12.w = (r12.w * c13.x) + c13.y;
	r12.w = fract(r12.w);
	r12.w = (r12.w * c13.z) + c13.w;
	r14.xy = float2(cos(r12.w), sin(r12.w));
	r15.xyz = r0.zxy * c2.www;
	r15.xyz = (r0.zxy * c2.www) + -r15.zxy;
	r14.yzw = r14.yyy * r15.xyz;
	r14.yzw = (r0.xyz * r14.xxx) + r14.yzw;
	r12.w = dot(c2.www, r0.xyz);
	r12.w = r12.w * c2.w;
	r13.x = -r14.x + c18.z;
	r14.xyz = (r12.www * r13.xxx) + r14.yzw;
	r0.xyz = ((-r11.w >= 0.0) ? r0.xyz : r14.xyz);
	r11.w = r13.z * c101.x;
	r12.w = -r13.w + c18.z;
	r13.x = r5.w * r5.w;
	r13.w = r13.x * r13.x;
	r14.x = r12.w * r13.w;
	r14.xyz = r14.xxx * v6.xyz;
	r13.xyz = r14.xyz * c14.www;
	r13 = ((-r12.w >= 0.0) ? c18.wwww : r13);
	r14.xyz = (r3.xyz * r3.www) + r8.xyz;
	r15.xyz = normalize(r14.xyz);
	r5.z = clamp(dot(r2.xyz, r15.xyz), 0.0, 1.0);
	r14 = s7_texture.sample(s7, r5.zy);
	r8.x = clamp(dot(r4.xyz, r8.xyz), 0.0, 1.0);
	r8.x = r8.x * r13.w;
	r8.xyz = (r8.xxx * c14.www) + -r14.xyz;
	r8.xyz = (r12.www * r8.xyz) + r14.xyz;
	r8.xyz = ((-r12.w >= 0.0) ? r14.xyz : r8.xyz);
	r14.x = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r14.x = ((r14.x == 0.0) ? FLT_MAX : 1.0 / r14.x);
	r8.xyz = r8.xyz * r14.xxx;
	r8.xyz = r7.yzw * r8.xyz;
	r5.w = -r5.w + c18.z;
	r1.w = r1.w * r5.z;
	r14.y = pow(abs(r5.w), c105.x);
	r1.w = r1.w * r14.y;
	r1.w = r14.x * r1.w;
	r7.yzw = r7.yzw * r1.www;
	r8.xyz = (r8.xyz * r7.xxx) + r13.xyz;
	r13.xyz = (r3.xyz * r3.www) + r11.xyz;
	r15.xyz = normalize(r13.xyz);
	r5.x = clamp(dot(r2.xyz, r15.xyz), 0.0, 1.0);
	r15 = s7_texture.sample(s7, r5.xy);
	r1.w = clamp(dot(r4.xyz, r11.xyz), 0.0, 1.0);
	r1.w = r1.w * r13.w;
	r11.xyz = (r1.www * c14.www) + -r15.xyz;
	r11.xyz = (r12.www * r11.xyz) + r15.xyz;
	r11.xyz = ((-r12.w >= 0.0) ? r15.xyz : r11.xyz);
	r1.w = ((r8.w == 0.0) ? FLT_MAX : rsqrt(abs(r8.w)));
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r11.xyz = r1.www * r11.xyz;
	r5.z = r8.w * r5.x;
	r5.z = r14.y * r5.z;
	r1.w = r1.w * r5.z;
	r13.xyz = r9.xyz * r1.www;
	r8.xyz = (r11.xyz * r9.xyz) + r8.xyz;
	r7.xyz = (r7.yzw * r7.xxx) + r13.xyz;
	r3.xyz = (r3.xyz * r3.www) + r12.xyz;
	r9.xyz = normalize(r3.xyz);
	r5.x = clamp(dot(r2.xyz, r9.xyz), 0.0, 1.0);
	r3 = s7_texture.sample(s7, r5.xy);
	r1.w = clamp(dot(r4.xyz, r12.xyz), 0.0, 1.0);
	r1.w = r1.w * r13.w;
	r5.yzw = (r1.www * c14.www) + -r3.xyz;
	r5.yzw = (r12.www * r5.yzw) + r3.xyz;
	r3.xyz = ((-r12.w >= 0.0) ? r3.xyz : r5.yzw);
	r1.w = ((r9.w == 0.0) ? FLT_MAX : rsqrt(abs(r9.w)));
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r3.xyz = r1.www * r3.xyz;
	r3.w = r9.w * r5.x;
	r3.w = r14.y * r3.w;
	r1.w = r1.w * r3.w;
	r3.xyz = (r3.xyz * r10.xyw) + r8.xyz;
	r5.xyz = (r1.www * r10.xyw) + r7.xyz;
	r1.x = r1.x * c105.y;
	r1.w = (v6.w * c11.w) + r10.z;
	r1.x = r1.w * r1.x;
	r5.xyz = r1.xxx * r5.xyz;
	r3.xyz = r2.www * r3.xyz;
	r2.w = mix(c10.x, c10.y, r1.y);
	r1.x = r4.w + r4.w;
	r1.w = dot(r2.xyz, r2.xyz);
	r4.xyz = r4.xyz * r1.www;
	r2.xyz = (r1.xxx * r2.xyz) + -r4.xyz;
	r4 = s6_texture.sample(s6, r2.xyz);
	r2.xyz = r4.xyz * c30.zzz;
	r1.x = abs(c103.w);
	r7.xyz = r2.xyz * r2.xyz;
	r7.xyz = r7.xyz * r7.xyz;
	r1.w = dot(r2.xyz, c17.xyz);
	r4.xyz = (c30.zzz * -r4.xyz) + r1.www;
	r4.xyz = (-c103.www * r4.xyz) + r2.xyz;
	r3.w = dot(r7.xyz, c17.xyz);
	r4.w = r3.w + c17.w;
	r7.xyz = r1.www * r7.xyz;
	r1.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r1.w = ((r4.w >= 0.0) ? r1.w : c16.x);
	r7.xyz = (r7.xyz * r1.www) + -r2.xyz;
	r7.xyz = (c103.www * r7.xyz) + r2.xyz;
	r4.xyz = ((c103.w >= 0.0) ? r7.xyz : r4.xyz);
	r2.xyz = ((-r1.x >= 0.0) ? r2.xyz : r4.xyz);
	r4.xyz = r6.xzw + v6.xyz;
	r7.xyz = r4.xyz + -c103.xxx;
	r7.xyz = clamp(r7.xyz * c103.yyy, float3(0.0), float3(1.0));
	r7.xyz = (r2.xyz * r7.xyz) + -r2.xyz;
	r2.xyz = (r11.www * r7.xyz) + r2.xyz;
	r7.xyz = (r2.xyz * r2.xyz) + -r2.xyz;
	r2.xyz = (c103.zzz * r7.xyz) + r2.xyz;
	r7.xyz = r0.www * c104.xyz;
	r2.xyz = r2.xyz * r7.xyz;
	r2.xyz = (r3.xyz * r2.www) + r2.xyz;
	r0.w = mix(r6.y, c18.z, r12.w);
	r2.xyz = r0.www * r2.xyz;
	r3.xyz = r0.xyz + c18.yyy;
	r3.xyz = (r1.yyy * r3.xyz) + c18.zzz;
	r2.xyz = r2.xyz * r3.xyz;
	r0.w = r1.y * c101.w;
	r1.x = clamp(r0.w, 0.0, 1.0);
	r3.xyz = (r0.xyz * r0.www) + -c106.xyz;
	r1.xyw = (r1.xxx * r3.xyz) + c106.xyz;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r3.xyz = (r5.xyz * r1.xyw) + r6.xzw;
	r2.w = dot(r3.xyz, c17.xyz);
	r2.w = r2.w + c16.y;
	r2.w = clamp(r2.w * c16.z, 0.0, 1.0);
	r3.x = (r2.w * c15.x) + c15.y;
	r2.w = r2.w * r2.w;
	r2.w = r2.w * r3.x;
	r3.x = dot(r0.xyz, c17.xyz);
	r6.xyz = c17.xyz;
	r3.y = dot(c102.xyz, r6.xyz);
	r3.z = r3.y + c17.w;
	r6.xyz = r3.xxx * c102.xyz;
	r3.x = ((r3.y == 0.0) ? FLT_MAX : 1.0 / r3.y);
	r3.x = ((r3.z >= 0.0) ? r3.x : c16.x);
	r3.xyz = (r6.xyz * r3.xxx) + -r0.xyz;
	r3.xyz = (c102.www * r3.xyz) + r0.xyz;
	r3.xyz = (r3.xyz * r0.www) + -r0.xyz;
	r0.xyz = (r2.www * r3.xyz) + r0.xyz;
	r0.xyz = r1.zzz * r0.xyz;
	r0.xyz = (r0.xyz * r4.xyz) + r2.xyz;
	r0.xyz = (r5.xyz * r1.xyw) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	r0.w = c19.y + -v5.z;
	r0.w = r0.w + -c18.x;
	oC0.w = clamp(r0.w * c19.w, 0.0, 1.0);
	oC0.xyz = r0.xyz * c30.xxx;
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
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

