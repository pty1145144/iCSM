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
	texturecube<float> s6_texture [[texture(6)]],
	sampler s6 [[sampler(6)]],
	texture2d<float> s8_texture [[texture(8)]],
	sampler s8 [[sampler(8)]],
	depth2d<float> s11_texture [[texture(11)]],
	sampler s11 [[sampler(11)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c2 = float4(1.591549367e-01, 5.000000000e-01, 6.283185482e+00, -3.141592741e+00); (void) c2;
	const float4 c26 = float4(5.773500204e-01, 1.000000000e+00, 2.000000000e+00, -1.000000000e+00); (void) c26;
	const float4 c27 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, 1.000000000e+06); (void) c27;
	const float4 c29 = float4(-3.000000119e-01, -3.333333254e+00, -2.000000000e+00, 3.000000000e+00); (void) c29;
	const float4 c31 = float4(0.000000000e+00, 1.000000000e+00, -4.000000060e-01, -9.999999975e-07); (void) c31;
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
	#define c13 uniforms.uniforms_float4[12]
	#define c14 uniforms.uniforms_float4[13]
	#define c15 uniforms.uniforms_float4[14]
	#define c16 uniforms.uniforms_float4[15]
	#define c17 uniforms.uniforms_float4[16]
	#define c18 uniforms.uniforms_float4[17]
	#define c19 uniforms.uniforms_float4[18]
	#define c20 uniforms.uniforms_float4[19]
	#define c21 uniforms.uniforms_float4[20]
	#define c22 uniforms.uniforms_float4[21]
	#define c23 uniforms.uniforms_float4[22]
	#define c24 uniforms.uniforms_float4[23]
	#define c25 uniforms.uniforms_float4[24]
	#define c28 uniforms.uniforms_float4[25]
	#define c30 uniforms.uniforms_float4[26]
	#define c101 uniforms.uniforms_float4[27]
	#define c102 uniforms.uniforms_float4[28]
	#define c103 uniforms.uniforms_float4[29]
	#define c104 uniforms.uniforms_float4[30]
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
	r0.x = r0.x + -c26.z;
	oC0.w = clamp(r0.x * c19.w, 0.0, 1.0);
	r0 = (v5.xyzx * c31.yyyx) + c31.xxxy;
	r1.x = dot(r0, c18);
	r1.y = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r2.x = dot(r0, c15);
	r2.y = dot(r0, c16);
	r2.z = dot(r0, c17);
	r0.xyz = r1.yyy * r2.xyz;
	r2 = s8_texture.sample(s8, r0.xy);
	r1.xyz = ((-r1.x >= 0.0) ? c31.xxx : r2.xyz);
	r2.z = c31.z;
	r1.w = r2.z * c13.w;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r2.xyz = c14.xyz + -v5.xyz;
	r2.w = dot(r2.xyz, r2.xyz);
	r3.y = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r3.z = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r2.w = ((r3.y == 0.0) ? FLT_MAX : 1.0 / r3.y);
	r2.w = r2.w + -c13.w;
	r1.w = clamp(r1.w * r2.w, 0.0, 1.0);
	r3.x = c26.y;
	r2.w = clamp(dot(c13.xyz, r3.xyz), 0.0, 1.0);
	r2.xyz = r2.xyz * r3.yyy;
	r3.x = r1.w * r2.w;
	r3.xyz = r3.xxx * c28.xyz;
	r3.xyz = r1.xyz * r3.xyz;
	r1.xyz = r1.xyz * c28.xyz;
	r0.w = c26.y;
	r0 = float4(s11_texture.sample_compare(s11, (r0.xyz).xy, (r0.xyz).z));
	r0.y = -r0.x + c26.y;
	r0.y = (c109.y * r0.y) + r0.x;
	r3.w = clamp(mix(r0.y, r0.x, r2.w), 0.0, 1.0);
	r0.yzw = r3.www * r3.xyz;
	r3.xyz = c23.xyz + -v5.xyz;
	r4.xyz = normalize(r3.xyz);
	r3.xyz = c3.xyz + -v5.xyz;
	r3.w = dot(r3.xyz, r3.xyz);
	r3.w = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r5.xyz = (r3.xyz * r3.www) + r4.xyz;
	r6.xyz = normalize(r5.xyz);
	r5 = s1_texture.sample(s1, v0.xy);
	r5.xyz = (r5.xyz * c26.zzz) + c26.www;
	r7.x = dot(v2.xyz, r5.xyz);
	r7.y = dot(v3.xyz, r5.xyz);
	r7.z = dot(v4.xyz, r5.xyz);
	r5.xyz = normalize(r7.xyz);
	r4.w = clamp(dot(r5.xyz, r6.xyz), 0.0, 1.0);
	r6.x = pow(abs(r4.w), c10.z);
	r4.x = clamp(dot(r5.xyz, r4.xyz), 0.0, 1.0);
	r4.y = ((r4.x == 0.0) ? FLT_MAX : rsqrt(abs(r4.x)));
	r4.y = ((r4.y == 0.0) ? FLT_MAX : 1.0 / r4.y);
	r4.z = r4.y * r6.x;
	r6.xyz = c22.xyz * v1.yyy;
	r7.xyz = r4.zzz * r6.xyz;
	r8.xyz = c21.xyz + -v5.xyz;
	r9.xyz = normalize(r8.xyz);
	r8.xyz = (r3.xyz * r3.www) + r9.xyz;
	r10.xyz = normalize(r8.xyz);
	r4.z = clamp(dot(r5.xyz, r10.xyz), 0.0, 1.0);
	r6.w = pow(abs(r4.z), c10.z);
	r7.w = clamp(dot(r5.xyz, r9.xyz), 0.0, 1.0);
	r8.x = clamp(r9.z, 0.0, 1.0);
	r8.x = (r8.x * r8.x) + r8.x;
	r8.x = r8.x * c2.y;
	r8.y = ((r7.w == 0.0) ? FLT_MAX : rsqrt(abs(r7.w)));
	r8.y = ((r8.y == 0.0) ? FLT_MAX : 1.0 / r8.y);
	r6.w = r6.w * r8.y;
	r9.xyz = c20.xyz * v1.xxx;
	r7.xyz = (r6.www * r9.xyz) + r7.xyz;
	r10.xyz = c25.xyz + -v5.xyz;
	r11.xyz = normalize(r10.xyz);
	r10.xyz = (r3.xyz * r3.www) + r11.xyz;
	r6.w = clamp(dot(r5.xyz, r11.xyz), 0.0, 1.0);
	r11.xyz = normalize(r10.xyz);
	r8.z = clamp(dot(r5.xyz, r11.xyz), 0.0, 1.0);
	r9.w = pow(abs(r8.z), c10.z);
	r8.z = r6.w * r8.z;
	r8.w = ((r6.w == 0.0) ? FLT_MAX : rsqrt(abs(r6.w)));
	r6.w = (r6.w * r6.w) + r6.w;
	r6.w = r6.w * c2.y;
	r8.w = ((r8.w == 0.0) ? FLT_MAX : 1.0 / r8.w);
	r9.w = r8.w * r9.w;
	r10.xyz = c24.xyz * v1.zzz;
	r7.xyz = (r9.www * r10.xyz) + r7.xyz;
	r11.xyz = (r3.xyz * r3.www) + r2.xyz;
	r2.x = dot(r2.xyz, r5.xyz);
	r3.xyz = r3.www * r3.xyz;
	r12.xyz = normalize(r11.xyz);
	r2.y = clamp(dot(r5.xyz, r12.xyz), 0.0, 1.0);
	r3.w = pow(abs(r2.y), c10.z);
	r2.y = clamp(r2.x, 0.0, 1.0);
	r2.x = clamp(r2.x + c28.w, 0.0, 1.0);
	r2.x = r2.x * r2.w;
	r2.y = ((r2.y == 0.0) ? FLT_MAX : rsqrt(abs(r2.y)));
	r2.y = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r2.y = r2.y * r3.w;
	r0.yzw = (r2.yyy * r0.yzw) + r7.xyz;
	r0.yzw = r5.www * r0.yzw;
	r7.x = ((r5.x >= 0.0) ? c31.x : c31.y);
	r7.y = ((r5.y >= 0.0) ? c31.x : c31.y);
	r7.z = ((r5.z >= 0.0) ? c31.x : c31.y);
	r11.xyz = r5.xyz * r5.xyz;
	r7.xyz = r7.xyz * r11.xyz;
	r12.xyz = r7.xxx * c5.xyz;
	r13.x = ((r5.x >= 0.0) ? c31.y : c31.x);
	r13.y = ((r5.y >= 0.0) ? c31.y : c31.x);
	r13.z = ((r5.z >= 0.0) ? c31.y : c31.x);
	r11.xyz = r11.xyz * r13.xyz;
	r12.xyz = (r11.xxx * c4.xyz) + r12.xyz;
	r11.xyw = (r11.yyy * c6.xyz) + r12.xyz;
	r11.xyw = (r7.yyy * c7.xyz) + r11.xyw;
	r11.xyz = (r11.zzz * c8.xyz) + r11.xyw;
	r7.xyz = (r7.zzz * c9.xyz) + r11.xyz;
	r2.y = (r7.w * r7.w) + r7.w;
	r2.z = r4.z * r7.w;
	r2.y = r2.y * c2.y;
	r7.xyz = (r9.xyz * r2.yyy) + r7.xyz;
	r2.y = (r4.x * r4.x) + r4.x;
	r3.w = r4.x * r4.w;
	r2.y = r2.y * c2.y;
	r4.xzw = (r6.xyz * r2.yyy) + r7.xyz;
	r4.xzw = (r10.xyz * r6.www) + r4.xzw;
	r2.y = clamp(r0.x, 0.0, 1.0);
	r5.w = -r2.y + c26.y;
	r2.y = (c109.y * r5.w) + r2.y;
	r5.w = clamp(mix(r2.y, r0.x, r2.w), 0.0, 1.0);
	r1.xyz = r1.xyz * r5.www;
	r1.xyz = r1.xyz * r2.xxx;
	r1.xyz = (r1.xyz * r1.www) + r4.xzw;
	r2.xyw = r1.xyz + v6.xyz;
	r4.xzw = r2.xyw + -c103.xxx;
	r4.xzw = clamp(r4.xzw * c103.yyy, float3(0.0), float3(1.0));
	r0.x = dot(r5.xyz, r5.xyz);
	r7.xyz = r3.xyz * r0.xxx;
	r0.x = dot(r5.xyz, r3.xyz);
	r1.w = r0.x + r0.x;
	r0.x = clamp(r0.x, 0.0, 1.0);
	r0.x = -r0.x + c26.y;
	r3.xyz = (r1.www * r5.xyz) + -r7.xyz;
	r1.w = clamp(dot(r5.xyz, v9.xyz), 0.0, 1.0);
	r5 = s6_texture.sample(s6, r3.xyz);
	r7.xyz = r5.xyz * c30.zzz;
	r11.xyz = r7.xyz * r7.xyz;
	r11.xyz = r11.xyz * r11.xyz;
	r5.w = dot(r11.xyz, c27.xyz);
	r6.w = r5.w + c31.w;
	r5.w = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r5.w = ((r6.w >= 0.0) ? r5.w : c27.w);
	r6.w = dot(r7.xyz, c27.xyz);
	r11.xyz = r6.www * r11.xyz;
	r5.xyz = (c30.zzz * -r5.xyz) + r6.www;
	r5.xyz = (-c103.www * r5.xyz) + r7.xyz;
	r11.xyz = (r11.xyz * r5.www) + -r7.xyz;
	r11.xyz = (c103.www * r11.xyz) + r7.xyz;
	r5.xyz = ((c103.w >= 0.0) ? r11.xyz : r5.xyz);
	r5.w = abs(c103.w);
	r5.xyz = ((-r5.w >= 0.0) ? r7.xyz : r5.xyz);
	r4.xzw = (r5.xyz * r4.xzw) + -r5.xyz;
	r4.xzw = (c101.xxx * r4.xzw) + r5.xyz;
	r5.xyz = (r4.xzw * r4.xzw) + -r4.xzw;
	r4.xzw = (c103.zzz * r5.xyz) + r4.xzw;
	r5 = s0_texture.sample(s0, v0.xy);
	r7.xyz = r5.www * c104.xyz;
	r4.xzw = r4.xzw * r7.xyz;
	r0.yzw = (r0.yzw * c10.xxx) + r4.xzw;
	r4.x = ((r3.x >= 0.0) ? c31.x : c31.y);
	r4.z = ((r3.y >= 0.0) ? c31.x : c31.y);
	r4.w = ((r3.z >= 0.0) ? c31.x : c31.y);
	r7.xyz = r3.xyz * r3.xyz;
	r3.x = ((r3.x >= 0.0) ? c31.y : c31.x);
	r3.y = ((r3.y >= 0.0) ? c31.y : c31.x);
	r3.z = ((r3.z >= 0.0) ? c31.y : c31.x);
	r3.xyz = r7.xyz * r3.xyz;
	r4.xzw = r4.xzw * r7.xyz;
	r7.xyz = r4.xxx * c5.xyz;
	r7.xyz = (r3.xxx * c4.xyz) + r7.xyz;
	r7.xyz = (r3.yyy * c6.xyz) + r7.xyz;
	r7.xyz = (r4.zzz * c7.xyz) + r7.xyz;
	r3.xyz = (r3.zzz * c8.xyz) + r7.xyz;
	r3.xyz = (r4.www * c9.xyz) + r3.xyz;
	r4.xzw = r8.xxx * r9.xyz;
	r3.xyz = r3.xyz * r4.xzw;
	r7.x = v7.w;
	r7.y = v8.w;
	r7.z = v9.w;
	r4.xzw = -r7.xyz + c21.xyz;
	r7.xyz = normalize(r4.xzw);
	r4.x = clamp(dot(-v9.xyz, r7.xyz), 0.0, 1.0);
	r4.x = (r4.x * r4.x) + r4.x;
	r4.x = r4.x * c2.y;
	r4.xzw = r4.xxx * r9.xyz;
	r7.xyz = c0.xyz * v6.xyz;
	r4.xzw = (r7.xyz * r4.xzw) + -r3.xyz;
	r3.xyz = (r1.www * r4.xzw) + r3.xyz;
	r1.w = (r0.x * -r0.x) + c2.y;
	r4.x = r0.x * r0.x;
	r4.z = pow(abs(r0.x), c105.x);
	r0.x = r4.x + r4.x;
	r4.x = (r4.x * c26.z) + c26.w;
	r5.w = mix(c12.y, c12.z, r4.x);
	r4.x = -c12.x + c12.y;
	r0.x = (r0.x * r4.x) + c12.x;
	r0.x = ((r1.w >= 0.0) ? r0.x : r5.w);
	r1.w = r0.x * c0.w;
	r3.xyz = r1.www * r3.xyz;
	r0.xyz = (r0.yzw * r0.xxx) + r3.xyz;
	r3.xyz = r5.zxy * c26.xxx;
	r3.xyz = (r5.zxy * c26.xxx) + -r3.zxy;
	r7.xy = c2.xy;
	r0.w = (c12.w * r7.x) + r7.y;
	r0.w = fract(r0.w);
	r0.w = (r0.w * c2.z) + c2.w;
	r7.xy = float2(cos(r0.w), sin(r0.w));
	r3.xyz = r3.xyz * r7.yyy;
	r3.xyz = (r5.xyz * r7.xxx) + r3.xyz;
	r0.w = -r7.x + c26.y;
	r1.w = dot(c26.xxx, r5.xyz);
	r1.w = r1.w * c26.x;
	r3.xyz = (r1.www * r0.www) + r3.xyz;
	r0.w = abs(c12.w);
	r3.xyz = ((-r0.w >= 0.0) ? r5.xyz : r3.xyz);
	r0.w = dot(r3.xyz, c27.xyz);
	r5.xyz = r0.www * c102.xyz;
	r7.xyz = c27.xyz;
	r0.w = dot(c102.xyz, r7.xyz);
	r1.w = r0.w + c31.w;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r1.w >= 0.0) ? r0.w : c27.w);
	r5.xyz = (r5.xyz * r0.www) + -r3.xyz;
	r5.xyz = (c102.www * r5.xyz) + r3.xyz;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r5.xyz = (r5.xyz * r0.www) + -r3.xyz;
	r0.w = r3.w * r4.z;
	r0.w = r4.y * r0.w;
	r4.xyw = r6.xyz * r0.www;
	r0.w = r2.z * r4.z;
	r1.w = r4.z * r8.z;
	r1.w = r8.w * r1.w;
	r0.w = r8.y * r0.w;
	r4.xyz = (r0.www * r9.xyz) + r4.xyw;
	r4.xyz = (r1.www * r10.xyz) + r4.xyz;
	r6.y = c26.y;
	r0.w = (v6.w * c11.w) + r6.y;
	r0.w = r0.w * c105.y;
	r4.xyz = r0.www * r4.xyz;
	r0.w = c101.w;
	r6.xyz = (r3.xyz * r0.www) + -c106.xyz;
	r0.w = clamp(c101.w, 0.0, 1.0);
	r6.xyz = (r0.www * r6.xyz) + c106.xyz;
	r1.xyz = (r4.xyz * r6.xyz) + r1.xyz;
	r0.w = dot(r1.xyz, c27.xyz);
	r0.w = r0.w + c29.x;
	r0.w = clamp(r0.w * c29.y, 0.0, 1.0);
	r1.x = (r0.w * c29.z) + c29.w;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.x;
	r1.xyz = (r0.www * r5.xyz) + r3.xyz;
	r1.xyz = r1.xyz * c101.zzz;
	r0.xyz = (r1.xyz * r2.xyw) + r0.xyz;
	r0.xyz = (r4.xyz * r6.xyz) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	oC0.xyz = r0.xyz * c30.xxx;
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
	#undef c101
	#undef c102
	#undef c103
	#undef c104
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

