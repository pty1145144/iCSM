#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[40];
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
	texturecube<float> s6_texture [[texture(6)]],
	sampler s6 [[sampler(6)]],
	depth2d<float> s8_texture [[texture(8)]],
	sampler s8 [[sampler(8)]],
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
	#define c30 uniforms.uniforms_float4[16]
	#define c67 uniforms.uniforms_float4[17]
	#define c68 uniforms.uniforms_float4[18]
	#define c69 uniforms.uniforms_float4[19]
	#define c70 uniforms.uniforms_float4[20]
	#define c71 uniforms.uniforms_float4[21]
	#define c73 uniforms.uniforms_float4[22]
	#define c74 uniforms.uniforms_float4[23]
	#define c77 uniforms.uniforms_float4[24]
	#define c78 uniforms.uniforms_float4[25]
	#define c81 uniforms.uniforms_float4[26]
	#define c82 uniforms.uniforms_float4[27]
	#define c85 uniforms.uniforms_float4[28]
	#define c86 uniforms.uniforms_float4[29]
	#define c87 uniforms.uniforms_float4[30]
	#define c88 uniforms.uniforms_float4[31]
	#define c89 uniforms.uniforms_float4[32]
	#define c101 uniforms.uniforms_float4[33]
	#define c102 uniforms.uniforms_float4[34]
	#define c103 uniforms.uniforms_float4[35]
	#define c104 uniforms.uniforms_float4[36]
	#define c105 uniforms.uniforms_float4[37]
	#define c106 uniforms.uniforms_float4[38]
	#define c107 uniforms.uniforms_float4[39]
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
	r1 = s1_texture.sample(s1, v0.xy);
	r2.x = abs(c12.w);
	r3.xy = c2.xy;
	r2.y = (c12.w * r3.x) + r3.y;
	r2.y = fract(r2.y);
	r2.y = (r2.y * c2.z) + c2.w;
	r3.xy = float2(cos(r2.y), sin(r2.y));
	r2.yzw = r0.zxy * c19.xxx;
	r2.yzw = (r0.zxy * c19.xxx) + -r2.wyz;
	r2.yzw = r3.yyy * r2.yzw;
	r2.yzw = (r0.xyz * r3.xxx) + r2.yzw;
	r3.y = dot(c19.xxx, r0.xyz);
	r3.y = r3.y * c19.x;
	r3.x = -r3.x + c19.y;
	r2.yzw = (r3.yyy * r3.xxx) + r2.yzw;
	r0.xyz = ((-r2.x >= 0.0) ? r0.xyz : r2.yzw);
	r1.xyz = (r1.xyz * c19.zzz) + c19.www;
	r2.x = dot(v2.xyz, r1.xyz);
	r2.y = dot(v3.xyz, r1.xyz);
	r2.z = dot(v4.xyz, r1.xyz);
	r1.xyz = normalize(r2.xyz);
	r2.xyz = c3.xyz + -v5.xyz;
	r2.w = dot(r2.xyz, r2.xyz);
	r2.w = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r3.xyz = r2.www * r2.xyz;
	r3.w = dot(r1.xyz, r3.xyz);
	r4.x = clamp(r3.w, 0.0, 1.0);
	r4.x = -r4.x + c19.y;
	r4.y = r4.x * r4.x;
	r4.z = (r4.x * -r4.x) + c2.y;
	r4.w = r4.y + r4.y;
	r4.y = (r4.y * c19.z) + c19.w;
	r5.x = -c12.x + c12.y;
	r5.y = mix(c12.y, c12.z, r4.y);
	r4.y = (r4.w * r5.x) + c12.x;
	r4.y = ((r4.z >= 0.0) ? r4.y : r5.y);
	r5 = (v5.xyzx * c13.xxxy) + c13.yyyx;
	r6.x = dot(r5, c69);
	r6.y = dot(r5, c70);
	r4.zw = clamp(r6.xy, float2(0.0), float2(1.0));
	r4.zw = -r6.xy + r4.zw;
	r4.z = dot(r4.zw, c13.xx) + c13.y;
	r7.x = dot(r5, c73);
	r7.y = dot(r5, c74);
	r8.xy = clamp(r7.xy, float2(0.0), float2(1.0));
	r8.xy = -r7.xy + r8.xy;
	r4.w = dot(r8.xy, c13.xx) + c13.y;
	r8.x = dot(r5, c77);
	r8.y = dot(r5, c78);
	r7.z = c19.y;
	r8.z = c19.z;
	r7.xyz = ((-abs(r4.w) >= 0.0) ? r7.xyz : r8.xyz);
	r6.z = c13.y;
	r6.xyz = ((-abs(r4.z) >= 0.0) ? r6.xyz : r7.xyz);
	r7.z = dot(r5, c71);
	r4.zw = r6.xy + -c2.yy;
	r4.zw = abs(r4.zw) + -c67.zz;
	r4.zw = clamp(r4.zw * c67.ww, float2(0.0), float2(1.0));
	r4.zw = -r4.zw + c19.yy;
	r4.z = r4.w * r4.z;
	r6.xy = clamp(r6.xy, float2(0.0), float2(1.0));
	r8.xyz = r6.zzz + -c13.yxz;
	r9.y = c13.y;
	r10 = ((-abs(r8.x) >= 0.0) ? c85.zwxy : r9.yyyy);
	r10 = ((-abs(r8.y) >= 0.0) ? c86.zwxy : r10);
	r8 = ((-abs(r8.z) >= 0.0) ? c87.zwxy : r10);
	r7.xy = (r6.xy * r8.xy) + r8.zw;
	r7.w = c13.y;
	r8 = r7 + c13.wwyy;
	r8 = float4(s8_texture.sample_compare(s8, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
	r10 = r7 + c14.xyzz;
	r10 = float4(s8_texture.sample_compare(s8, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
	r11 = r7 + c14.yxzz;
	r11 = float4(s8_texture.sample_compare(s8, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
	r12 = r7 + c14.xxzz;
	r12 = float4(s8_texture.sample_compare(s8, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
	r8.y = r10.x;
	r8.z = r11.x;
	r8.w = r12.x;
	r4.w = dot(r8, c14.wwww);
	r8 = r7 + c13.wyyy;
	r8 = float4(s8_texture.sample_compare(s8, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
	r10 = r7 + c14.xzzz;
	r10 = float4(s8_texture.sample_compare(s8, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
	r11 = r7 + c14.zxzz;
	r11 = float4(s8_texture.sample_compare(s8, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
	r12 = r7 + c13.ywyy;
	r12 = float4(s8_texture.sample_compare(s8, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
	r8.y = r10.x;
	r8.z = r11.x;
	r8.w = r12.x;
	r6.x = dot(r8, c15.xxxx);
	r8 = float4(s8_texture.sample_compare(s8, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
	r4.w = r4.w + r6.x;
	r4.w = (r8.x * c15.y) + r4.w;
	if (r4.z < c19.y) {
		r6.xyz = r6.zzz + c17.xyz;
		r8 = ((-abs(r6.x) >= 0.0) ? c73 : r9.yyyy);
		r10 = ((-abs(r6.x) >= 0.0) ? c74 : r9.yyyy);
		r8 = ((-abs(r6.y) >= 0.0) ? c77 : r8);
		r10 = ((-abs(r6.y) >= 0.0) ? c78 : r10);
		r8 = ((-abs(r6.z) >= 0.0) ? c81 : r8);
		r10 = ((-abs(r6.z) >= 0.0) ? c82 : r10);
		r8.x = clamp(dot(r5, r8), 0.0, 1.0);
		r8.y = clamp(dot(r5, r10), 0.0, 1.0);
		r5 = ((-abs(r6.x) >= 0.0) ? c86.zwxy : r9.yyyy);
		r5 = ((-abs(r6.y) >= 0.0) ? c87.zwxy : r5);
		r5 = ((-abs(r6.z) >= 0.0) ? c88.zwxy : r5);
		r7.xy = (r8.xy * r5.xy) + r5.zw;
		r5 = r7 + c13.wwyy;
		r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
		r8 = r7 + c14.xyzz;
		r8 = float4(s8_texture.sample_compare(s8, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r9 = r7 + c14.yxzz;
		r9 = float4(s8_texture.sample_compare(s8, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
		r10 = r7 + c14.xxzz;
		r10 = float4(s8_texture.sample_compare(s8, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r5.y = r8.x;
		r5.z = r9.x;
		r5.w = r10.x;
		r5.x = dot(r5, c14.wwww);
		r8 = r7 + c13.wyyy;
		r8 = float4(s8_texture.sample_compare(s8, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r9 = r7 + c14.xzzz;
		r9 = float4(s8_texture.sample_compare(s8, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
		r10 = r7 + c14.zxzz;
		r10 = float4(s8_texture.sample_compare(s8, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r11 = r7 + c13.ywyy;
		r11 = float4(s8_texture.sample_compare(s8, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
		r8.y = r9.x;
		r8.z = r10.x;
		r8.w = r11.x;
		r5.y = dot(r8, c15.xxxx);
		r7 = float4(s8_texture.sample_compare(s8, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
		r5.x = r5.y + r5.x;
		r5.x = (r7.x * c15.y) + r5.x;
		r5.x = ((r6.z >= 0.0) ? c19.y : r5.x);
		r6.x = mix(r5.x, r4.w, r4.z);
		r4.w = r6.x;
	}
	r5.xyz = -c89.xyz + v5.xyz;
	r4.z = dot(r5.xyz, r5.xyz);
	r4.z = clamp((r4.z * c68.y) + c68.x, 0.0, 1.0);
	r5.x = mix(r4.w, c19.y, r4.z);
	r5.yzw = r1.xyz * r1.xyz;
	r6.x = ((r1.x >= 0.0) ? c13.y : c13.x);
	r6.y = ((r1.y >= 0.0) ? c13.y : c13.x);
	r6.z = ((r1.z >= 0.0) ? c13.y : c13.x);
	r7.x = ((r1.x >= 0.0) ? c13.x : c13.y);
	r7.y = ((r1.y >= 0.0) ? c13.x : c13.y);
	r7.z = ((r1.z >= 0.0) ? c13.x : c13.y);
	r6.xyz = r5.yzw * r6.xyz;
	r5.yzw = r5.yzw * r7.xyz;
	r7.xyz = r6.xxx * c5.xyz;
	r7.xyz = (r5.yyy * c4.xyz) + r7.xyz;
	r7.xyz = (r5.zzz * c6.xyz) + r7.xyz;
	r6.xyw = (r6.yyy * c7.xyz) + r7.xyz;
	r5.yzw = (r5.www * c8.xyz) + r6.xyw;
	r5.yzw = (r6.zzz * c9.xyz) + r5.yzw;
	r6.xyz = c21.xyz + -v5.xyz;
	r7.xyz = normalize(r6.xyz);
	r6.xyz = c20.xyz * v1.xxx;
	r4.z = clamp(dot(r1.xyz, r7.xyz), 0.0, 1.0);
	r4.w = (r4.z * r4.z) + r4.z;
	r4.w = r4.w * c2.y;
	r8.xyz = r4.www * r6.xyz;
	r5.yzw = (r8.xyz * r5.xxx) + r5.yzw;
	r8.xyz = c23.xyz + -v5.xyz;
	r9.xyz = normalize(r8.xyz);
	r8.xyz = c22.xyz * v1.yyy;
	r4.w = clamp(dot(r1.xyz, r9.xyz), 0.0, 1.0);
	r6.w = (r4.w * r4.w) + r4.w;
	r6.w = r6.w * c2.y;
	r5.yzw = (r8.xyz * r6.www) + r5.yzw;
	r7.xyw = (r2.xyz * r2.www) + r7.xyz;
	r10.xyz = normalize(r7.xyw);
	r6.w = clamp(dot(r1.xyz, r10.xyz), 0.0, 1.0);
	r7.x = pow(abs(r6.w), c10.z);
	r7.y = ((r4.z == 0.0) ? FLT_MAX : rsqrt(abs(r4.z)));
	r7.y = ((r7.y == 0.0) ? FLT_MAX : 1.0 / r7.y);
	r7.x = r7.y * r7.x;
	r10.xyz = r6.xyz * r7.xxx;
	r4.z = r4.z * r6.w;
	r6.w = pow(abs(r4.x), c105.x);
	r4.x = r4.z * r6.w;
	r4.x = r7.y * r4.x;
	r7.xyw = r6.xyz * r4.xxx;
	r2.xyz = (r2.xyz * r2.www) + r9.xyz;
	r9.xyz = normalize(r2.xyz);
	r2.x = clamp(dot(r1.xyz, r9.xyz), 0.0, 1.0);
	r4.x = pow(abs(r2.x), c10.z);
	r2.y = ((r4.w == 0.0) ? FLT_MAX : rsqrt(abs(r4.w)));
	r2.y = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r2.z = r2.y * r4.x;
	r9.xyz = r8.xyz * r2.zzz;
	r2.x = r4.w * r2.x;
	r2.x = r6.w * r2.x;
	r2.x = r2.y * r2.x;
	r2.xyz = r8.xyz * r2.xxx;
	r4.xzw = (r10.xyz * r5.xxx) + r9.xyz;
	r2.xyz = (r7.xyw * r5.xxx) + r2.xyz;
	r7.y = c19.y;
	r2.w = (v6.w * c11.w) + r7.y;
	r2.w = r2.w * c105.y;
	r2.xyz = r2.www * r2.xyz;
	r4.xzw = r1.www * r4.xzw;
	r1.w = r3.w + r3.w;
	r2.w = dot(r1.xyz, r1.xyz);
	r3.xyz = r3.xyz * r2.www;
	r3.xyz = (r1.www * r1.xyz) + -r3.xyz;
	r8 = s6_texture.sample(s6, r3.xyz);
	r7.xyw = r8.xyz * c30.zzz;
	r1.w = abs(c103.w);
	r9.xyz = r7.xyw * r7.xyw;
	r9.xyz = r9.xyz * r9.xyz;
	r2.w = dot(r7.xyw, c18.xyz);
	r8.xyz = (c30.zzz * -r8.xyz) + r2.www;
	r8.xyz = (-c103.www * r8.xyz) + r7.xyw;
	r3.w = dot(r9.xyz, c18.xyz);
	r5.x = r3.w + c15.z;
	r9.xyz = r2.www * r9.xyz;
	r2.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r2.w = ((r5.x >= 0.0) ? r2.w : c15.w);
	r9.xyz = (r9.xyz * r2.www) + -r7.xyw;
	r9.xyz = (c103.www * r9.xyz) + r7.xyw;
	r8.xyz = ((c103.w >= 0.0) ? r9.xyz : r8.xyz);
	r7.xyw = ((-r1.w >= 0.0) ? r7.xyw : r8.xyz);
	r8.xyz = r5.yzw + v6.xyz;
	r9.xyz = r8.xyz + -c103.xxx;
	r9.xyz = clamp(r9.xyz * c103.yyy, float3(0.0), float3(1.0));
	r9.xyz = (r7.xyw * r9.xyz) + -r7.xyw;
	r7.xyw = (c101.xxx * r9.xyz) + r7.xyw;
	r9.xyz = (r7.xyw * r7.xyw) + -r7.xyw;
	r7.xyw = (c103.zzz * r9.xyz) + r7.xyw;
	r9.xyz = r0.www * c104.xyz;
	r7.xyw = r7.xyw * r9.xyz;
	r4.xzw = (r4.xzw * c10.xxx) + r7.xyw;
	r7.xyw = r3.xyz * r3.xyz;
	r9.x = ((r3.x >= 0.0) ? c13.y : c13.x);
	r9.y = ((r3.y >= 0.0) ? c13.y : c13.x);
	r9.z = ((r3.z >= 0.0) ? c13.y : c13.x);
	r3.x = ((r3.x >= 0.0) ? c13.x : c13.y);
	r3.y = ((r3.y >= 0.0) ? c13.x : c13.y);
	r3.z = ((r3.z >= 0.0) ? c13.x : c13.y);
	r9.xyz = r7.xyw * r9.xyz;
	r3.xyz = r7.xyw * r3.xyz;
	r7.xyw = r9.xxx * c5.xyz;
	r7.xyw = (r3.xxx * c4.xyz) + r7.xyw;
	r3.xyw = (r3.yyy * c6.xyz) + r7.xyw;
	r3.xyw = (r9.yyy * c7.xyz) + r3.xyw;
	r3.xyz = (r3.zzz * c8.xyz) + r3.xyw;
	r3.xyz = (r9.zzz * c9.xyz) + r3.xyz;
	r0.w = clamp(r7.z, 0.0, 1.0);
	r0.w = (r0.w * r0.w) + r0.w;
	r0.w = r0.w * c2.y;
	r7.xyz = r0.www * r6.xyz;
	r3.xyz = r3.xyz * r7.xyz;
	r7.x = v7.w;
	r7.y = v8.w;
	r7.z = v9.w;
	r7.xyz = -r7.xyz + c21.xyz;
	r9.xyz = normalize(r7.xyz);
	r0.w = clamp(dot(-v9.xyz, r9.xyz), 0.0, 1.0);
	r0.w = (r0.w * r0.w) + r0.w;
	r0.w = r0.w * c2.y;
	r6.xyz = r0.www * r6.xyz;
	r0.w = clamp(dot(r1.xyz, v9.xyz), 0.0, 1.0);
	r1.xyz = c0.xyz * v6.xyz;
	r1.xyz = (r1.xyz * r6.xyz) + -r3.xyz;
	r1.xyz = (r0.www * r1.xyz) + r3.xyz;
	r0.w = r4.y * c0.w;
	r1.xyz = r0.www * r1.xyz;
	r1.xyz = (r4.xzw * r4.yyy) + r1.xyz;
	r0.w = clamp(c101.w, 0.0, 1.0);
	r1.w = c101.w;
	r3.xyz = (r0.xyz * r1.www) + -c106.xyz;
	r3.xyz = (r0.www * r3.xyz) + c106.xyz;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r4.xyz = (r2.xyz * r3.xyz) + r5.yzw;
	r1.w = dot(r4.xyz, c18.xyz);
	r1.w = r1.w + c17.w;
	r1.w = clamp(r1.w * c18.w, 0.0, 1.0);
	r2.w = (r1.w * c16.x) + c16.y;
	r1.w = r1.w * r1.w;
	r1.w = r1.w * r2.w;
	r2.w = dot(r0.xyz, c18.xyz);
	r4.xyz = c18.xyz;
	r3.w = dot(c102.xyz, r4.xyz);
	r4.x = r3.w + c15.z;
	r4.yzw = r2.www * c102.xyz;
	r2.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r2.w = ((r4.x >= 0.0) ? r2.w : c15.w);
	r4.xyz = (r4.yzw * r2.www) + -r0.xyz;
	r4.xyz = (c102.www * r4.xyz) + r0.xyz;
	r4.xyz = (r4.xyz * r0.www) + -r0.xyz;
	r0.xyz = (r1.www * r4.xyz) + r0.xyz;
	r0.xyz = r0.xyz * c101.zzz;
	r0.xyz = (r0.xyz * r8.xyz) + r1.xyz;
	r0.xyz = (r2.xyz * r3.xyz) + r0.xyz;
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

