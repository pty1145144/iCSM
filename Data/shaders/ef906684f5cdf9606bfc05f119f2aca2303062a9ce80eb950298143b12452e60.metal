#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[36];
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
	const float4 c13 = float4(1.041666626, -0.020833333, 0.5, 0.062499999); (void) c13;
	const float4 c14 = float4(0.000488281, 0.0, -0.000488281, 0.125); (void) c14;
	const float4 c15 = float4(0.25, 0.159154935, 0.5, 0.57735002); (void) c15;
	const float4 c16 = float4(6.283185478, -3.141592739, 0.499999584, 0.5); (void) c16;
	const float4 c17 = float4(5.0, 0.298999992, 0.587000012, 0.114); (void) c17;
	const float4 c18 = float4(2.0, -1.0, 1.0, 0.0); (void) c18;
	const float4 c22 = float4(-0.300000011, -3.333333253, -2.0, 3.0); (void) c22;
	const float4 c23 = float4(-0.000001, 1000000.0, 0.0, 0.0); (void) c23;
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
	#define c30 uniforms.uniforms_float4[16]
	#define c33 uniforms.uniforms_float4[17]
	#define c67 uniforms.uniforms_float4[18]
	#define c68 uniforms.uniforms_float4[19]
	#define c69 uniforms.uniforms_float4[20]
	#define c70 uniforms.uniforms_float4[21]
	#define c71 uniforms.uniforms_float4[22]
	#define c73 uniforms.uniforms_float4[23]
	#define c74 uniforms.uniforms_float4[24]
	#define c77 uniforms.uniforms_float4[25]
	#define c78 uniforms.uniforms_float4[26]
	#define c85 uniforms.uniforms_float4[27]
	#define c86 uniforms.uniforms_float4[28]
	#define c87 uniforms.uniforms_float4[29]
	#define c89 uniforms.uniforms_float4[30]
	#define c101 uniforms.uniforms_float4[31]
	#define c102 uniforms.uniforms_float4[32]
	#define c105 uniforms.uniforms_float4[33]
	#define c106 uniforms.uniforms_float4[34]
	#define c107 uniforms.uniforms_float4[35]
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
	r0.x = r0.x + -c18.x;
	oC0.w = clamp(r0.x * c19.w, 0.0, 1.0);
	r0 = (v5.xyzx * c18.zzzw) + c18.wwwz;
	r1.x = dot(r0, c73);
	r1.y = dot(r0, c74);
	r1.zw = (r1.xy * c13.xx) + c13.yy;
	r2.xy = clamp(r1.zw, float2(0.0), float2(1.0));
	r1.zw = -r1.zw + r2.xy;
	r1.z = dot(r1.zw, c18.zz) + c18.w;
	r1.w = dot(r0, c77);
	r2.x = ((-abs(r1.z) >= 0.0) ? r1.x : r1.w);
	r1.x = dot(r0, c78);
	r2.y = ((-abs(r1.z) >= 0.0) ? r1.y : r1.x);
	r1.x = dot(r0, c69);
	r1.y = dot(r0, c70);
	r0.z = dot(r0, c71);
	r2.zw = (r1.xy * c13.xx) + c13.yy;
	r3.xy = clamp(r2.zw, float2(0.0), float2(1.0));
	r2.zw = -r2.zw + r3.xy;
	r1.w = dot(r2.zw, c18.zz) + c18.w;
	r1.xy = ((-abs(r1.w) >= 0.0) ? r1.xy : r2.xy);
	r2.xy = clamp(r1.xy, float2(0.0), float2(1.0));
	r1.xy = r1.xy + -c13.zz;
	r1.xy = abs(r1.xy) + -c67.zz;
	r1.xy = clamp(r1.xy * c67.ww, float2(0.0), float2(1.0));
	r1.xy = -r1.xy + c18.zz;
	r3.xy = c86.xy;
	r2.zw = ((-abs(r1.z) >= 0.0) ? r3.xy : c87.xy);
	r1.z = ((-abs(r1.z) >= 0.0) ? c18.z : c18.w);
	r1.z = ((-abs(r1.w) >= 0.0) ? c18.z : r1.z);
	r2.zw = ((-abs(r1.w) >= 0.0) ? c85.xy : r2.zw);
	r0.xy = (r2.xy * c13.zz) + r2.zw;
	r1.x = clamp((r1.x * r1.y) + r1.z, 0.0, 1.0);
	r0.w = c18.w;
	r2 = r0 + c14.xxyy;
	r2 = float4(s8_texture.sample_compare(s8, (r2.xyz).xy, (r2.xyz).z, level(r2.w)));
	r3 = r0 + c14.zxyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r2.y = r3.x;
	r3 = r0 + c14.xzyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r2.z = r3.x;
	r3 = r0 + c14.zzyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r2.w = r3.x;
	r1.y = dot(r2, c13.wwww);
	r2 = r0 + c14.xyyy;
	r2 = float4(s8_texture.sample_compare(s8, (r2.xyz).xy, (r2.xyz).z, level(r2.w)));
	r3 = r0 + c14.zyyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r2.y = r3.x;
	r3 = r0 + c14.yzyy;
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r2.z = r3.x;
	r3 = r0 + c14.yxyy;
	r0 = float4(s8_texture.sample_compare(s8, (r0.xyz).xy, (r0.xyz).z, level(r0.w)));
	r3 = float4(s8_texture.sample_compare(s8, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
	r2.w = r3.x;
	r0.y = dot(r2, c14.wwww);
	r0.y = r0.y + r1.y;
	r0.x = (r0.x * c15.x) + r0.y;
	r0.x = r0.x + c18.y;
	r0.x = (r1.x * r0.x) + c18.z;
	r0.yzw = -c89.xyz + v5.xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.y = clamp((r0.y * c68.y) + c68.x, 0.0, 1.0);
	r1.x = mix(r0.x, c18.z, r0.y);
	r0 = s3_texture.sample(s3, v0.xy);
	r0.z = (r0.y * c16.z) + c16.w;
	r0.z = fract(r0.z);
	r0.z = (r0.z * c16.x) + c16.y;
	r2.xy = float2(cos(r0.z), sin(r0.z));
	r3 = s1_texture.sample(s1, v0.xy);
	r1.yzw = (r3.xyz * c18.xxx) + c18.yyy;
	r3.x = dot(v2.xyz, r1.yzw);
	r3.y = dot(v3.xyz, r1.yzw);
	r3.z = dot(v4.xyz, r1.yzw);
	r4.xyz = normalize(r3.xyz);
	r1.yzw = r4.zxy * v8.yzx;
	r1.yzw = (r4.yzx * v8.zxy) + -r1.yzw;
	r3.xyz = normalize(r1.yzw);
	r1.yzw = r3.yzx * r4.zxy;
	r1.yzw = (r4.yzx * r3.zxy) + -r1.yzw;
	r2.xzw = r2.xxx * r3.xyz;
	r3.xyz = normalize(r1.yzw);
	r1.yzw = (r2.yyy * r3.xyz) + r2.xzw;
	r2.xyz = normalize(r1.yzw);
	r1.yzw = c21.xyz + -v5.xyz;
	r3.xyz = normalize(r1.yzw);
	r0.z = dot(r3.xyz, r2.xxx);
	r1.y = (r0.z * -r0.z) + c18.z;
	r1.y = ((r1.y == 0.0) ? FLT_MAX : rsqrt(abs(r1.y)));
	r1.y = ((r1.y == 0.0) ? FLT_MAX : 1.0 / r1.y);
	r5.xyz = c3.xyz + -v5.xyz;
	r1.z = dot(r5.xyz, r5.xyz);
	r1.z = ((r1.z == 0.0) ? FLT_MAX : rsqrt(abs(r1.z)));
	r6.xyz = r1.zzz * r5.xyz;
	r1.w = dot(r6.xyz, r2.xyz);
	r2.w = (r1.w * -r1.w) + c18.z;
	r2.w = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r2.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r1.y = r1.y * r2.w;
	r0.z = clamp((r1.w * r0.z) + r1.y, 0.0, 1.0);
	r7.xyz = (r5.xyz * r1.zzz) + r3.xyz;
	r8.xyz = normalize(r7.xyz);
	r1.y = clamp(dot(r4.xyz, r8.xyz), 0.0, 1.0);
	r7.zw = c18.zw;
	r0.y = ((-r0.y >= 0.0) ? r7.w : c10.w);
	r8.x = mix(r1.y, r0.z, r0.y);
	r9 = s10_texture.sample(s10, v0.xy);
	r8.z = r9.w;
	r10 = s7_texture.sample(s7, r8.xz);
	r0.z = clamp(dot(r6.xyz, r3.xyz), 0.0, 1.0);
	r8.y = clamp(dot(r6.xyz, r4.xyz), 0.0, 1.0);
	r1.y = r8.y * r8.y;
	r11.w = r1.y * r1.y;
	r0.w = -r0.w + c18.z;
	r1.y = r11.w * r0.w;
	r7.xyw = r1.yyy * v6.xyz;
	r11.xyz = r7.xyw * c17.xxx;
	r11 = ((-r0.w >= 0.0) ? c18.wwww : r11);
	r0.z = r0.z * r11.w;
	r7.xyw = (r0.zzz * c17.xxx) + -r10.xyz;
	r7.xyw = (r0.www * r7.xyw) + r10.xyz;
	r7.xyw = ((-r0.w >= 0.0) ? r10.xyz : r7.xyw);
	r0.z = clamp(dot(r4.xyz, r3.xyz), 0.0, 1.0);
	r1.y = clamp(r3.z, 0.0, 1.0);
	r1.y = (r1.y * r1.y) + r1.y;
	r1.y = r1.y * c13.z;
	r1.w = ((r0.z == 0.0) ? FLT_MAX : rsqrt(abs(r0.z)));
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r3.xyz = r1.www * r7.xyw;
	r7.xyw = c20.xyz * v1.xxx;
	r3.xyz = r3.xyz * r7.xyw;
	r3.xyz = (r3.xyz * r1.xxx) + r11.xyz;
	r3.xyz = r3.www * r3.xyz;
	r2.w = mix(c10.x, c10.y, r9.y);
	r3.xyz = r2.www * r3.xyz;
	r10.xyz = r4.xyz * r2.yzx;
	r10.xyz = (r2.xyz * r4.yzx) + -r10.xyz;
	r11.xyz = r2.yzx * r10.xyz;
	r2.xyz = (r10.zxy * r2.zxy) + -r11.xyz;
	r2.w = dot(r2.xyz, r2.xyz);
	r2.w = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r2.xyz = (r2.xyz * r2.www) + -r6.xyz;
	r2.xyz = (r0.yyy * r2.xyz) + r6.xyz;
	r0.y = dot(r4.xyz, r2.xyz);
	r0.y = r0.y + r0.y;
	r2.w = dot(r4.xyz, r4.xyz);
	r2.xyz = r2.xyz * r2.www;
	r2.xyz = (r0.yyy * r4.xyz) + -r2.xyz;
	r6.x = ((r2.x >= 0.0) ? c18.w : c18.z);
	r6.y = ((r2.y >= 0.0) ? c18.w : c18.z);
	r6.z = ((r2.z >= 0.0) ? c18.w : c18.z);
	r10.xyz = r2.xyz * r2.xyz;
	r2.x = ((r2.x >= 0.0) ? c18.z : c18.w);
	r2.y = ((r2.y >= 0.0) ? c18.z : c18.w);
	r2.z = ((r2.z >= 0.0) ? c18.z : c18.w);
	r2.xyz = r10.xyz * r2.xyz;
	r6.xyz = r6.xyz * r10.xyz;
	r10.xyz = r6.xxx * c5.xyz;
	r10.xyz = (r2.xxx * c4.xyz) + r10.xyz;
	r2.xyw = (r2.yyy * c6.xyz) + r10.xyz;
	r2.xyw = (r6.yyy * c7.xyz) + r2.xyw;
	r2.xyz = (r2.zzz * c8.xyz) + r2.xyw;
	r2.xyz = (r6.zzz * c9.xyz) + r2.xyz;
	r6.xyz = r1.yyy * r7.xyw;
	r2.xyz = r2.xyz * r6.xyz;
	r6.x = v7.w;
	r6.y = v8.w;
	r6.z = v9.w;
	r6.xyz = -r6.xyz + c21.xyz;
	r10.xyz = normalize(r6.xyz);
	r0.y = clamp(dot(-v9.xyz, r10.xyz), 0.0, 1.0);
	r0.y = (r0.y * r0.y) + r0.y;
	r0.y = r0.y * c13.z;
	r6.xyz = r0.yyy * r7.xyw;
	r10.xyz = c0.xyz * v6.xyz;
	r6.xyz = (r10.xyz * r6.xyz) + -r2.xyz;
	r0.y = clamp(dot(r4.xyz, v9.xyz), 0.0, 1.0);
	r2.xyz = (r0.yyy * r6.xyz) + r2.xyz;
	r6 = s4_texture.sample(s4, r8.yz);
	r0.y = -r8.y + c18.z;
	r1.y = pow(abs(r0.y), c105.x);
	r0.y = r9.x * r6.z;
	r2.w = mix(r6.y, c18.z, r0.w);
	r0.y = r0.y * c0.w;
	r2.xyz = r0.yyy * r2.xyz;
	r2.xyz = (r3.xyz * r2.www) + r2.xyz;
	r0.y = r0.x * c12.w;
	r3.w = r0.x;
	r0.x = (r0.y * c15.y) + c15.z;
	r0.x = fract(r0.x);
	r0.x = (r0.x * c16.x) + c16.y;
	r6.xy = float2(cos(r0.x), sin(r0.x));
	r10 = s0_texture.sample(s0, v0.xy);
	r0.xyw = r10.zxy * c15.www;
	r0.xyw = (r10.zxy * c15.www) + -r0.wxy;
	r0.xyw = r6.yyy * r0.xyw;
	r0.xyw = (r10.xyz * r6.xxx) + r0.xyw;
	r2.w = -r6.x + c18.z;
	r4.w = dot(c15.www, r10.xyz);
	r3.xyz = r10.xyz;
	r4.w = r4.w * c15.w;
	r6.xyz = (r4.www * r2.www) + r0.xyw;
	r0.x = abs(c12.w);
	r6.w = c18.z;
	r3 = ((-r0.x >= 0.0) ? r3 : r6);
	r0.xyw = r3.xyz + c18.yyy;
	r0.xyw = (r9.yyy * r0.xyw) + c18.zzz;
	r0.xyw = r0.xyw * r2.xyz;
	r2.xyz = r3.xyz * r3.xyz;
	r2.xyz = r2.xyz * r2.xyz;
	r2.w = dot(r3.xyz, c17.yzw);
	r6.xyz = r2.www * r2.xyz;
	r2.x = dot(r2.xyz, c17.yzw);
	r8.yzw = mix(r3.xyz, r2.www, -c101.yyy);
	r2.y = r2.x + c23.x;
	r2.x = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r2.x = ((r2.y >= 0.0) ? r2.x : c23.y);
	r2.xyz = (r6.xyz * r2.xxx) + -r3.xyz;
	r2.xyz = (c101.yyy * r2.xyz) + r3.xyz;
	r2.xyz = ((c101.y >= 0.0) ? r2.xyz : r8.yzw);
	r2.w = abs(c101.y);
	r2.xyz = ((-r2.w >= 0.0) ? r3.xyz : r2.xyz);
	r6.x = ((r4.x >= 0.0) ? c18.w : c18.z);
	r6.y = ((r4.y >= 0.0) ? c18.w : c18.z);
	r6.z = ((r4.z >= 0.0) ? c18.w : c18.z);
	r8.yzw = r4.xyz * r4.xyz;
	r6.xyz = r6.xyz * r8.yzw;
	r10.xyz = r6.xxx * c5.xyz;
	r11.x = ((r4.x >= 0.0) ? c18.z : c18.w);
	r11.y = ((r4.y >= 0.0) ? c18.z : c18.w);
	r11.z = ((r4.z >= 0.0) ? c18.z : c18.w);
	r8.yzw = r8.yzw * r11.xyz;
	r10.xyz = (r8.yyy * c4.xyz) + r10.xyz;
	r10.xyz = (r8.zzz * c6.xyz) + r10.xyz;
	r6.xyw = (r6.yyy * c7.xyz) + r10.xyz;
	r6.xyw = (r8.www * c8.xyz) + r6.xyw;
	r6.xyz = (r6.zzz * c9.xyz) + r6.xyw;
	r2.w = (r0.z * r0.z) + r0.z;
	r0.z = r0.z * r8.x;
	r0.z = r1.y * r0.z;
	r2.w = r2.w * c13.z;
	r8.xyz = r2.www * r7.xyw;
	r6.xyz = (r8.xyz * r1.xxx) + r6.xyz;
	r2.w = dot(r6.xyz, c17.yzw);
	r8.xy = r2.ww + -c2.xw;
	r8.zw = -c2.xw + c2.yz;
	r2.w = ((r8.w == 0.0) ? FLT_MAX : 1.0 / r8.w);
	r4.w = ((r8.z == 0.0) ? FLT_MAX : 1.0 / r8.z);
	r4.w = clamp(r4.w * r8.x, 0.0, 1.0);
	r2.w = clamp(r2.w * r8.y, 0.0, 1.0);
	r5.w = (r2.w * c22.z) + c22.w;
	r2.w = r2.w * r2.w;
	r6.w = r1.w * r0.z;
	r8.xy = (r0.zz * r1.ww) + -c33.xw;
	r7.xyw = r7.xyw * r6.www;
	r7.xyw = r1.xxx * r7.xyw;
	r0.z = (v6.w * c11.w) + r7.z;
	r1.x = r9.x * c105.y;
	r0.z = r0.z * r1.x;
	r7.xyz = r0.zzz * r7.xyw;
	r0.z = r9.y * c101.w;
	r10.xyz = (r3.xyz * r0.zzz) + -c106.xyz;
	r0.z = clamp(r0.z, 0.0, 1.0);
	r10.xyz = (r0.zzz * r10.xyz) + c106.xyz;
	r11.xyz = r7.xyz * r10.xyz;
	r0.z = dot(r11.xyz, c17.yzw);
	r1.xw = -c33.xw + c33.yz;
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.xw = clamp(r1.xw * r8.xy, float2(0.0), float2(1.0));
	r6.w = (r1.x * c22.z) + c22.w;
	r1.x = r1.x * r1.x;
	r1.x = r1.x * r6.w;
	r6.w = (r1.w * c22.z) + c22.w;
	r1.w = r1.w * r1.w;
	r1.w = r1.w * r6.w;
	r1.x = r1.w * r1.x;
	r0.z = r0.z * r1.x;
	r0.z = r0.z * c106.w;
	r0.z = (r5.w * r2.w) + r0.z;
	r1.x = (r4.w * c22.z) + c22.w;
	r1.w = r4.w * r4.w;
	r1.x = r1.w * r1.x;
	r0.z = r0.z * r1.x;
	r0.z = r3.w * r0.z;
	r8.xyz = mix(r3.xyz, r2.xyz, r0.zzz);
	r0.z = dot(r8.xyz, c17.yzw);
	r2.xyz = r0.zzz * c102.xyz;
	r3.yzw = c17.yzw;
	r0.z = dot(c102.xyz, r3.yzw);
	r1.x = r0.z + c23.x;
	r0.z = ((r0.z == 0.0) ? FLT_MAX : 1.0 / r0.z);
	r0.z = ((r1.x >= 0.0) ? r0.z : c23.y);
	r2.xyz = (r2.xyz * r0.zzz) + -r8.xyz;
	r2.xyz = (c102.www * r2.xyz) + r8.xyz;
	r0.z = clamp(c107.w + v6.w, 0.0, 1.0);
	r2.xyz = (r2.xyz * r0.zzz) + -r8.xyz;
	r3.xyz = (r7.xyz * r10.xyz) + r6.xyz;
	r6.xyz = r6.xyz + v6.xyz;
	r0.z = dot(r3.xyz, c17.yzw);
	r0.z = r0.z + c22.x;
	r0.z = clamp(r0.z * c22.y, 0.0, 1.0);
	r1.x = (r0.z * c22.z) + c22.w;
	r0.z = r0.z * r0.z;
	r0.z = r0.z * r1.x;
	r2.xyz = (r0.zzz * r2.xyz) + r8.xyz;
	r2.xyz = r9.zzz * r2.xyz;
	r0.xyz = (r2.xyz * r6.xyz) + r0.xyw;
	r0.xyz = (r7.xyz * r10.xyz) + r0.xyz;
	r2.x = v2.w;
	r2.y = v3.w;
	r2.z = v4.w;
	r1.xzw = (r5.xyz * r1.zzz) + r2.xyz;
	r0.w = clamp(dot(r4.xyz, r2.xyz), 0.0, 1.0);
	r2.xyz = normalize(r1.xzw);
	r1.x = clamp(dot(r4.xyz, r2.xyz), 0.0, 1.0);
	r1.x = r0.w * r1.x;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r1.x = r1.y * r1.x;
	r0.w = r0.w * r1.x;
	r1.xyz = v6.www * v6.xyz;
	r1.xyz = r1.xyz * c107.xyz;
	r1.xyz = r0.www * r1.xyz;
	r0.xyz = (r1.xyz * r9.xxx) + r0.xyz;
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

