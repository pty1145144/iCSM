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
	const float4 c0 = float4(1.591549367e-01, 5.000000000e-01, 6.283185482e+00, -3.141592741e+00); (void) c0;
	const float4 c2 = float4(5.773500204e-01, 1.000000000e+00, 2.000000000e+00, -1.000000000e+00); (void) c2;
	const float4 c13 = float4(1.000000000e+00, 0.000000000e+00, 1.041666627e+00, -2.083333395e-02); (void) c13;
	const float4 c14 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -9.999999975e-07); (void) c14;
	const float4 c15 = float4(-2.000000000e+00, 3.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c15;
	const float4 c16 = float4(1.000000000e+06, -3.000000119e-01, -3.333333254e+00, 0.000000000e+00); (void) c16;
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
	#define c68 uniforms.uniforms_float4[19]
	#define c71 uniforms.uniforms_float4[20]
	#define c73 uniforms.uniforms_float4[21]
	#define c74 uniforms.uniforms_float4[22]
	#define c77 uniforms.uniforms_float4[23]
	#define c78 uniforms.uniforms_float4[24]
	#define c86 uniforms.uniforms_float4[25]
	#define c87 uniforms.uniforms_float4[26]
	#define c89 uniforms.uniforms_float4[27]
	#define c101 uniforms.uniforms_float4[28]
	#define c102 uniforms.uniforms_float4[29]
	#define c103 uniforms.uniforms_float4[30]
	#define c104 uniforms.uniforms_float4[31]
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
	#define oC0 output.oC0
	r0.x = c19.y + -v5.z;
	r0.x = r0.x + -c2.z;
	oC0.w = clamp(r0.x * c19.w, 0.0, 1.0);
	r0 = (v5.xyzx * c13.xxxy) + c13.yyyx;
	r1.x = dot(r0, c73);
	r1.y = dot(r0, c74);
	r1.zw = (r1.xy * c13.zz) + c13.ww;
	r2.xy = clamp(r1.zw, float2(0.0), float2(1.0));
	r1.zw = -r1.zw + r2.xy;
	r1.z = dot(r1.zw, c13.xx) + c13.y;
	r1.w = dot(r0, c77);
	r2.x = clamp(((-abs(r1.z) >= 0.0) ? r1.x : r1.w), 0.0, 1.0);
	r1.x = dot(r0, c78);
	r0.z = dot(r0, c71);
	r2.y = clamp(((-abs(r1.z) >= 0.0) ? r1.y : r1.x), 0.0, 1.0);
	r1.xy = c86.xy;
	r1.xy = ((-abs(r1.z) >= 0.0) ? r1.xy : c87.xy);
	r0.xy = (r2.xy * c0.yy) + r1.xy;
	r0.w = c13.y;
	r0 = float4(s8_texture.sample_compare(s8, (r0.xyz).xy, (r0.xyz).z, level(r0.w)));
	r0.yzw = -c89.xyz + v5.xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.y = clamp((r0.y * c68.y) + c68.x, 0.0, 1.0);
	r1.x = mix(r0.x, c2.y, r0.y);
	r0 = s1_texture.sample(s1, v0.xy);
	r0.xyz = (r0.xyz * c2.zzz) + c2.www;
	r2.x = dot(v2.xyz, r0.xyz);
	r2.y = dot(v3.xyz, r0.xyz);
	r2.z = dot(v4.xyz, r0.xyz);
	r0.xyz = normalize(r2.xyz);
	r1.y = ((r0.x >= 0.0) ? c13.y : c13.x);
	r1.z = ((r0.y >= 0.0) ? c13.y : c13.x);
	r1.w = ((r0.z >= 0.0) ? c13.y : c13.x);
	r2.xyz = r0.xyz * r0.xyz;
	r1.yzw = r1.yzw * r2.xyz;
	r3.xyz = r1.yyy * c5.xyz;
	r4.x = ((r0.x >= 0.0) ? c13.x : c13.y);
	r4.y = ((r0.y >= 0.0) ? c13.x : c13.y);
	r4.z = ((r0.z >= 0.0) ? c13.x : c13.y);
	r2.xyz = r2.xyz * r4.xyz;
	r3.xyz = (r2.xxx * c4.xyz) + r3.xyz;
	r2.xyw = (r2.yyy * c6.xyz) + r3.xyz;
	r2.xyw = (r1.zzz * c7.xyz) + r2.xyw;
	r2.xyz = (r2.zzz * c8.xyz) + r2.xyw;
	r1.yzw = (r1.www * c9.xyz) + r2.xyz;
	r2.xyz = c21.xyz + -v5.xyz;
	r3.xyz = normalize(r2.xyz);
	r2.x = clamp(dot(r0.xyz, r3.xyz), 0.0, 1.0);
	r2.y = (r2.x * r2.x) + r2.x;
	r2.y = r2.y * c0.y;
	r4.xyz = c20.xyz * v1.xxx;
	r2.yzw = r2.yyy * r4.xyz;
	r1.yzw = (r2.yzw * r1.xxx) + r1.yzw;
	r2.yzw = c22.xyz * v1.yyy;
	r5.xyz = c23.xyz + -v5.xyz;
	r6.xyz = normalize(r5.xyz);
	r3.w = clamp(dot(r0.xyz, r6.xyz), 0.0, 1.0);
	r4.w = (r3.w * r3.w) + r3.w;
	r4.w = r4.w * c0.y;
	r1.yzw = (r2.yzw * r4.www) + r1.yzw;
	r5.xyz = c24.xyz * v1.zzz;
	r7.xyz = c25.xyz + -v5.xyz;
	r8.xyz = normalize(r7.xyz);
	r4.w = clamp(dot(r0.xyz, r8.xyz), 0.0, 1.0);
	r5.w = (r4.w * r4.w) + r4.w;
	r5.w = r5.w * c0.y;
	r1.yzw = (r5.xyz * r5.www) + r1.yzw;
	r7.x = c20.w * v1.w;
	r7.y = c21.w * v1.w;
	r7.z = c22.w * v1.w;
	r9.x = c23.w + -v5.x;
	r9.y = c24.w + -v5.y;
	r9.z = c25.w + -v5.z;
	r10.xyz = normalize(r9.xyz);
	r5.w = clamp(dot(r0.xyz, r10.xyz), 0.0, 1.0);
	r6.w = (r5.w * r5.w) + r5.w;
	r6.w = r6.w * c0.y;
	r1.yzw = (r7.xyz * r6.www) + r1.yzw;
	r9.xyz = r1.yzw + v6.xyz;
	r11.xyz = r9.xyz + -c103.xxx;
	r11.xyz = clamp(r11.xyz * c103.yyy, float3(0.0), float3(1.0));
	r6.w = abs(c103.w);
	r7.w = dot(r0.xyz, r0.xyz);
	r12.xyz = c3.xyz + -v5.xyz;
	r8.w = dot(r12.xyz, r12.xyz);
	r8.w = ((r8.w == 0.0) ? FLT_MAX : rsqrt(abs(r8.w)));
	r13.xyz = r8.www * r12.xyz;
	r14.xyz = r7.www * r13.xyz;
	r13.z = dot(r13.xyz, r0.xyz);
	r7.w = r13.z + r13.z;
	r13.z = clamp(r13.z, 0.0, 1.0);
	r14.xyz = (r7.www * r0.xyz) + -r14.xyz;
	r14 = s6_texture.sample(s6, r14.xyz);
	r15.xyz = r14.xyz * c30.zzz;
	r16.xyz = r15.xyz * r15.xyz;
	r16.xyz = r16.xyz * r16.xyz;
	r7.w = dot(r16.xyz, c14.xyz);
	r9.w = r7.w + c14.w;
	r7.w = ((r7.w == 0.0) ? FLT_MAX : 1.0 / r7.w);
	r7.w = ((r9.w >= 0.0) ? r7.w : c16.x);
	r9.w = dot(r15.xyz, c14.xyz);
	r16.xyz = r9.www * r16.xyz;
	r14.xyz = (c30.zzz * -r14.xyz) + r9.www;
	r14.xyz = (-c103.www * r14.xyz) + r15.xyz;
	r16.xyz = (r16.xyz * r7.www) + -r15.xyz;
	r16.xyz = (c103.www * r16.xyz) + r15.xyz;
	r14.xyz = ((c103.w >= 0.0) ? r16.xyz : r14.xyz);
	r14.xyz = ((-r6.w >= 0.0) ? r15.xyz : r14.xyz);
	r11.xyz = (r14.xyz * r11.xyz) + -r14.xyz;
	r11.xyz = (c101.xxx * r11.xyz) + r14.xyz;
	r14.xyz = (r11.xyz * r11.xyz) + -r11.xyz;
	r11.xyz = (c103.zzz * r14.xyz) + r11.xyz;
	r14.xyz = r0.www * c104.xyz;
	r11.xyz = r11.xyz * r14.xyz;
	r6.w = ((r2.x == 0.0) ? FLT_MAX : rsqrt(abs(r2.x)));
	r6.w = ((r6.w == 0.0) ? FLT_MAX : 1.0 / r6.w);
	r3.xyz = (r12.xyz * r8.www) + r3.xyz;
	r14.xyz = normalize(r3.xyz);
	r13.y = clamp(dot(r0.xyz, r14.xyz), 0.0, 1.0);
	r14 = s10_texture.sample(s10, v0.xy);
	r13.w = r14.w;
	r15 = s7_texture.sample(s7, r13.yw);
	r2.x = r2.x * r13.y;
	r3.xyz = r6.www * r15.xyz;
	r3.xyz = r4.xyz * r3.xyz;
	r7.w = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r7.w = ((r7.w == 0.0) ? FLT_MAX : 1.0 / r7.w);
	r6.xyz = (r12.xyz * r8.www) + r6.xyz;
	r15.xyz = normalize(r6.xyz);
	r13.x = clamp(dot(r0.xyz, r15.xyz), 0.0, 1.0);
	r15 = s7_texture.sample(s7, r13.xw);
	r3.w = r3.w * r13.x;
	r6.xyz = r7.www * r15.xyz;
	r6.xyz = r2.yzw * r6.xyz;
	r3.xyz = (r3.xyz * r1.xxx) + r6.xyz;
	r6.x = ((r4.w == 0.0) ? FLT_MAX : rsqrt(abs(r4.w)));
	r6.x = ((r6.x == 0.0) ? FLT_MAX : 1.0 / r6.x);
	r8.xyz = (r12.xyz * r8.www) + r8.xyz;
	r15.xyz = normalize(r8.xyz);
	r8.y = clamp(dot(r0.xyz, r15.xyz), 0.0, 1.0);
	r8.z = r13.w;
	r15 = s4_texture.sample(s4, r13.zw);
	r6.y = -r13.z + c2.y;
	r9.w = pow(abs(r6.y), c105.x);
	r13 = s7_texture.sample(s7, r8.yz);
	r4.w = r4.w * r8.y;
	r4.w = r9.w * r4.w;
	r4.w = r6.x * r4.w;
	r6.xyz = r6.xxx * r13.xyz;
	r3.xyz = (r6.xyz * r5.xyz) + r3.xyz;
	r6.xyz = (r12.xyz * r8.www) + r10.xyz;
	r10.xyz = normalize(r6.xyz);
	r8.x = clamp(dot(r0.xyz, r10.xyz), 0.0, 1.0);
	r10 = s7_texture.sample(s7, r8.xz);
	r6.x = r5.w * r8.x;
	r5.w = ((r5.w == 0.0) ? FLT_MAX : rsqrt(abs(r5.w)));
	r5.w = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r6.x = r9.w * r6.x;
	r6.x = r5.w * r6.x;
	r8.xyz = r5.www * r10.xyz;
	r3.xyz = (r8.xyz * r7.xyz) + r3.xyz;
	r3.xyz = r0.www * r3.xyz;
	r0.w = mix(c10.x, c10.y, r14.y);
	r3.xyz = (r3.xyz * r0.www) + r11.xyz;
	r3.xyz = r15.yyy * r3.xyz;
	r8.xy = c0.xy;
	r0.w = (c12.w * r8.x) + r8.y;
	r0.w = fract(r0.w);
	r0.w = (r0.w * c0.z) + c0.w;
	r10.xy = float2(cos(r0.w), sin(r0.w));
	r11 = s0_texture.sample(s0, v0.xy);
	r8.xyz = r11.zxy * c2.xxx;
	r8.xyz = (r11.zxy * c2.xxx) + -r8.zxy;
	r8.xyz = r10.yyy * r8.xyz;
	r8.xyz = (r11.xyz * r10.xxx) + r8.xyz;
	r0.w = -r10.x + c2.y;
	r5.w = dot(c2.xxx, r11.xyz);
	r5.w = r5.w * c2.x;
	r8.xyz = (r5.www * r0.www) + r8.xyz;
	r0.w = abs(c12.w);
	r8.xyz = ((-r0.w >= 0.0) ? r11.xyz : r8.xyz);
	r10.xyz = r8.xyz + c2.www;
	r10.xyz = (r14.yyy * r10.xyz) + c2.yyy;
	r3.xyz = r3.xyz * r10.xyz;
	r10.xyz = c14.xyz;
	r0.w = dot(c102.xyz, r10.xyz);
	r5.w = r0.w + c14.w;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r5.w >= 0.0) ? r0.w : c16.x);
	r5.w = dot(r8.xyz, c14.xyz);
	r10.xyz = r5.www * c102.xyz;
	r10.xyz = (r10.xyz * r0.www) + -r8.xyz;
	r10.xyz = (c102.www * r10.xyz) + r8.xyz;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r10.xyz = (r10.xyz * r0.www) + -r8.xyz;
	r0.w = r2.x * r9.w;
	r0.w = r6.w * r0.w;
	r4.xyz = r4.xyz * r0.www;
	r0.w = r3.w * r9.w;
	r0.w = r7.w * r0.w;
	r2.xyz = r2.yzw * r0.www;
	r2.xyz = (r4.xyz * r1.xxx) + r2.xyz;
	r2.xyz = (r4.www * r5.xyz) + r2.xyz;
	r2.xyz = (r6.xxx * r7.xyz) + r2.xyz;
	r4.y = c2.y;
	r0.w = (v6.w * c11.w) + r4.y;
	r1.x = r14.x * c105.y;
	r0.w = r0.w * r1.x;
	r2.xyz = r0.www * r2.xyz;
	r0.w = r14.y * c101.w;
	r4.xyz = (r8.xyz * r0.www) + -c106.xyz;
	r0.w = clamp(r0.w, 0.0, 1.0);
	r4.xyz = (r0.www * r4.xyz) + c106.xyz;
	r1.xyz = (r2.xyz * r4.xyz) + r1.yzw;
	r0.w = dot(r1.xyz, c14.xyz);
	r0.w = r0.w + c16.y;
	r0.w = clamp(r0.w * c16.z, 0.0, 1.0);
	r1.x = (r0.w * c15.x) + c15.y;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.x;
	r1.xyz = (r0.www * r10.xyz) + r8.xyz;
	r1.xyz = r14.zzz * r1.xyz;
	r1.xyz = (r1.xyz * r9.xyz) + r3.xyz;
	r1.xyz = (r2.xyz * r4.xyz) + r1.xyz;
	r2.x = v2.w;
	r2.y = v3.w;
	r2.z = v4.w;
	r3.xyz = (r12.xyz * r8.www) + r2.xyz;
	r0.w = clamp(dot(r0.xyz, r2.xyz), 0.0, 1.0);
	r2.xyz = normalize(r3.xyz);
	r0.x = clamp(dot(r0.xyz, r2.xyz), 0.0, 1.0);
	r0.x = r0.w * r0.x;
	r0.y = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r0.x = r9.w * r0.x;
	r0.x = r0.y * r0.x;
	r0.yzw = v6.www * v6.xyz;
	r0.yzw = r0.yzw * c107.xyz;
	r0.xyz = r0.yzw * r0.xxx;
	r0.xyz = (r0.xyz * r14.xxx) + r1.xyz;
	r0.xyz = r0.xyz * c1.xyz;
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

