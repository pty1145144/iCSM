#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[34];
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
	const float4 c13 = float4(5.773500204e-01, 1.000000000e+00, 2.000000000e+00, -1.000000000e+00); (void) c13;
	const float4 c14 = float4(1.000000000e+00, 0.000000000e+00, 1.041666627e+00, -2.083333395e-02); (void) c14;
	const float4 c15 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -3.000000119e-01); (void) c15;
	const float4 c16 = float4(-3.333333254e+00, -2.000000000e+00, 3.000000000e+00, -9.999999975e-07); (void) c16;
	const float4 c17 = float4(1.000000000e+06, 0.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c17;
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
	#define c19 uniforms.uniforms_float4[12]
	#define c20 uniforms.uniforms_float4[13]
	#define c21 uniforms.uniforms_float4[14]
	#define c22 uniforms.uniforms_float4[15]
	#define c23 uniforms.uniforms_float4[16]
	#define c24 uniforms.uniforms_float4[17]
	#define c25 uniforms.uniforms_float4[18]
	#define c30 uniforms.uniforms_float4[19]
	#define c68 uniforms.uniforms_float4[20]
	#define c71 uniforms.uniforms_float4[21]
	#define c73 uniforms.uniforms_float4[22]
	#define c74 uniforms.uniforms_float4[23]
	#define c77 uniforms.uniforms_float4[24]
	#define c78 uniforms.uniforms_float4[25]
	#define c86 uniforms.uniforms_float4[26]
	#define c87 uniforms.uniforms_float4[27]
	#define c89 uniforms.uniforms_float4[28]
	#define c101 uniforms.uniforms_float4[29]
	#define c102 uniforms.uniforms_float4[30]
	#define c105 uniforms.uniforms_float4[31]
	#define c106 uniforms.uniforms_float4[32]
	#define c107 uniforms.uniforms_float4[33]
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
	r0.x = r0.x + -c13.z;
	oC0.w = clamp(r0.x * c19.w, 0.0, 1.0);
	r0.xyz = c15.xyz;
	r0.x = dot(c102.xyz, r0.xyz);
	r0.y = r0.x + c16.w;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = ((r0.y >= 0.0) ? r0.x : c17.x);
	r1.xy = c2.xy;
	r0.y = (c12.w * r1.x) + r1.y;
	r0.y = fract(r0.y);
	r0.y = (r0.y * c2.z) + c2.w;
	r1.xy = float2(cos(r0.y), sin(r0.y));
	r2 = s0_texture.sample(s0, v0.xy);
	r0.yzw = r2.zxy * c13.xxx;
	r0.yzw = (r2.zxy * c13.xxx) + -r0.wyz;
	r0.yzw = r1.yyy * r0.yzw;
	r0.yzw = (r2.xyz * r1.xxx) + r0.yzw;
	r1.x = -r1.x + c13.y;
	r1.y = dot(c13.xxx, r2.xyz);
	r1.y = r1.y * c13.x;
	r0.yzw = (r1.yyy * r1.xxx) + r0.yzw;
	r1.x = abs(c12.w);
	r0.yzw = ((-r1.x >= 0.0) ? r2.xyz : r0.yzw);
	r1.x = dot(r0.yzw, c15.xyz);
	r1.xyz = r1.xxx * c102.xyz;
	r1.xyz = (r1.xyz * r0.xxx) + -r0.yzw;
	r1.xyz = (c102.www * r1.xyz) + r0.yzw;
	r0.x = clamp(c107.w + v6.w, 0.0, 1.0);
	r1.xyz = (r1.xyz * r0.xxx) + -r0.yzw;
	r2 = s10_texture.sample(s10, v0.xy);
	r0.x = r2.y * c101.w;
	r3.xyz = (r0.yzw * r0.xxx) + -c106.xyz;
	r0.x = clamp(r0.x, 0.0, 1.0);
	r3.xyz = (r0.xxx * r3.xyz) + c106.xyz;
	r4 = (v5.xyzx * c14.xxxy) + c14.yyyx;
	r5.x = dot(r4, c73);
	r5.y = dot(r4, c74);
	r5.zw = (r5.xy * c14.zz) + c14.ww;
	r6.xy = clamp(r5.zw, float2(0.0), float2(1.0));
	r5.zw = -r5.zw + r6.xy;
	r0.x = dot(r5.zw, c14.xx) + c14.y;
	r1.w = dot(r4, c77);
	r6.x = clamp(((-abs(r0.x) >= 0.0) ? r5.x : r1.w), 0.0, 1.0);
	r1.w = dot(r4, c78);
	r4.z = dot(r4, c71);
	r6.y = clamp(((-abs(r0.x) >= 0.0) ? r5.y : r1.w), 0.0, 1.0);
	r5.xy = c86.xy;
	r5.xy = ((-abs(r0.x) >= 0.0) ? r5.xy : c87.xy);
	r4.xy = (r6.xy * c2.yy) + r5.xy;
	r4.w = c14.y;
	r4 = float4(s8_texture.sample_compare(s8, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
	r4.yzw = -c89.xyz + v5.xyz;
	r0.x = dot(r4.yzw, r4.yzw);
	r0.x = clamp((r0.x * c68.y) + c68.x, 0.0, 1.0);
	r1.w = mix(r4.x, c13.y, r0.x);
	r4.xyz = c23.xyz + -v5.xyz;
	r5.xyz = normalize(r4.xyz);
	r4.xyz = c3.xyz + -v5.xyz;
	r0.x = dot(r4.xyz, r4.xyz);
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r6.xyz = (r4.xyz * r0.xxx) + r5.xyz;
	r7.xyz = normalize(r6.xyz);
	r6 = s1_texture.sample(s1, v0.xy);
	r6.xyz = (r6.xyz * c13.zzz) + c13.www;
	r8.x = dot(v2.xyz, r6.xyz);
	r8.y = dot(v3.xyz, r6.xyz);
	r8.z = dot(v4.xyz, r6.xyz);
	r6.xyz = normalize(r8.xyz);
	r7.x = clamp(dot(r6.xyz, r7.xyz), 0.0, 1.0);
	r3.w = clamp(dot(r6.xyz, r5.xyz), 0.0, 1.0);
	r4.w = r3.w * r7.x;
	r5.xyz = r0.xxx * r4.xyz;
	r5.w = dot(r5.xyz, r6.xyz);
	r7.z = clamp(r5.w, 0.0, 1.0);
	r5.w = r5.w + r5.w;
	r8.x = -r7.z + c13.y;
	r9.x = pow(abs(r8.x), c105.x);
	r4.w = r4.w * r9.x;
	r8.x = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r3.w = (r3.w * r3.w) + r3.w;
	r3.w = r3.w * c2.y;
	r8.x = ((r8.x == 0.0) ? FLT_MAX : 1.0 / r8.x);
	r4.w = r4.w * r8.x;
	r8.yzw = c22.xyz * v1.yyy;
	r9.yzw = r4.www * r8.yzw;
	r10.xyz = c21.xyz + -v5.xyz;
	r11.xyz = normalize(r10.xyz);
	r10.xyz = (r4.xyz * r0.xxx) + r11.xyz;
	r12.xyz = normalize(r10.xyz);
	r7.y = clamp(dot(r6.xyz, r12.xyz), 0.0, 1.0);
	r4.w = clamp(dot(r6.xyz, r11.xyz), 0.0, 1.0);
	r10.x = clamp(r11.z, 0.0, 1.0);
	r10.x = (r10.x * r10.x) + r10.x;
	r10.x = r10.x * c2.y;
	r10.y = r4.w * r7.y;
	r10.y = r9.x * r10.y;
	r10.z = ((r4.w == 0.0) ? FLT_MAX : rsqrt(abs(r4.w)));
	r4.w = (r4.w * r4.w) + r4.w;
	r4.w = r4.w * c2.y;
	r10.z = ((r10.z == 0.0) ? FLT_MAX : 1.0 / r10.z);
	r10.y = r10.z * r10.y;
	r11.xyz = c20.xyz * v1.xxx;
	r12.xyz = r10.yyy * r11.xyz;
	r9.yzw = (r12.xyz * r1.www) + r9.yzw;
	r12.xyz = c25.xyz + -v5.xyz;
	r13.xyz = normalize(r12.xyz);
	r4.xyz = (r4.xyz * r0.xxx) + r13.xyz;
	r0.x = clamp(dot(r6.xyz, r13.xyz), 0.0, 1.0);
	r12.xyz = normalize(r4.xyz);
	r4.x = clamp(dot(r6.xyz, r12.xyz), 0.0, 1.0);
	r4.z = r0.x * r4.x;
	r4.z = r9.x * r4.z;
	r9.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r0.x = (r0.x * r0.x) + r0.x;
	r0.x = r0.x * c2.y;
	r9.x = ((r9.x == 0.0) ? FLT_MAX : 1.0 / r9.x);
	r4.z = r4.z * r9.x;
	r12.xyz = c24.xyz * v1.zzz;
	r9.yzw = (r4.zzz * r12.xyz) + r9.yzw;
	r10.y = c13.y;
	r4.z = (v6.w * c11.w) + r10.y;
	r10.y = r2.x * c105.y;
	r4.z = r4.z * r10.y;
	r9.yzw = r4.zzz * r9.yzw;
	r13.x = ((r6.x >= 0.0) ? c14.y : c14.x);
	r13.y = ((r6.y >= 0.0) ? c14.y : c14.x);
	r13.z = ((r6.z >= 0.0) ? c14.y : c14.x);
	r14.xyz = r6.xyz * r6.xyz;
	r13.xyz = r13.xyz * r14.xyz;
	r15.xyz = r13.xxx * c5.xyz;
	r16.x = ((r6.x >= 0.0) ? c14.x : c14.y);
	r16.y = ((r6.y >= 0.0) ? c14.x : c14.y);
	r16.z = ((r6.z >= 0.0) ? c14.x : c14.y);
	r14.xyz = r14.xyz * r16.xyz;
	r15.xyz = (r14.xxx * c4.xyz) + r15.xyz;
	r14.xyw = (r14.yyy * c6.xyz) + r15.xyz;
	r13.xyw = (r13.yyy * c7.xyz) + r14.xyw;
	r13.xyw = (r14.zzz * c8.xyz) + r13.xyw;
	r13.xyz = (r13.zzz * c9.xyz) + r13.xyw;
	r14.xyz = r4.www * r11.xyz;
	r13.xyz = (r14.xyz * r1.www) + r13.xyz;
	r13.xyz = (r8.yzw * r3.www) + r13.xyz;
	r13.xyz = (r12.xyz * r0.xxx) + r13.xyz;
	r14.xyz = (r9.yzw * r3.xyz) + r13.xyz;
	r13.xyz = r13.xyz + v6.xyz;
	r0.x = dot(r14.xyz, c15.xyz);
	r0.x = r0.x + c15.w;
	r0.x = clamp(r0.x * c16.x, 0.0, 1.0);
	r3.w = (r0.x * c16.y) + c16.z;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r3.w;
	r1.xyz = (r0.xxx * r1.xyz) + r0.yzw;
	r0.xyz = r0.yzw + c13.www;
	r0.xyz = (r2.yyy * r0.xyz) + c13.yyy;
	r1.xyz = r2.zzz * r1.xyz;
	r7.w = r2.w;
	r14 = s7_texture.sample(s7, r7.xw);
	r14.xyz = r8.xxx * r14.xyz;
	r8.xyz = r8.yzw * r14.xyz;
	r14 = s7_texture.sample(s7, r7.yw);
	r10.yzw = r10.zzz * r14.xyz;
	r10.yzw = r11.xyz * r10.yzw;
	r8.xyz = (r10.yzw * r1.www) + r8.xyz;
	r4.y = r7.w;
	r7 = s4_texture.sample(s4, r7.zw);
	r4 = s7_texture.sample(s7, r4.xy);
	r4.xyz = r9.xxx * r4.xyz;
	r4.xyz = (r4.xyz * r12.xyz) + r8.xyz;
	r4.xyz = r6.www * r4.xyz;
	r0.w = mix(c10.x, c10.y, r2.y);
	r1.w = r2.x * r7.z;
	r1.w = r1.w * c0.w;
	r2.xyz = r0.www * r4.xyz;
	r0.w = dot(r6.xyz, r6.xyz);
	r4.xyz = r5.xyz * r0.www;
	r4.xyz = (r5.www * r6.xyz) + -r4.xyz;
	r0.w = clamp(dot(r6.xyz, v9.xyz), 0.0, 1.0);
	r5.x = ((r4.x >= 0.0) ? c14.y : c14.x);
	r5.y = ((r4.y >= 0.0) ? c14.y : c14.x);
	r5.z = ((r4.z >= 0.0) ? c14.y : c14.x);
	r6.xyz = r4.xyz * r4.xyz;
	r4.x = ((r4.x >= 0.0) ? c14.x : c14.y);
	r4.y = ((r4.y >= 0.0) ? c14.x : c14.y);
	r4.z = ((r4.z >= 0.0) ? c14.x : c14.y);
	r4.xyz = r6.xyz * r4.xyz;
	r5.xyz = r5.xyz * r6.xyz;
	r6.xyz = r5.xxx * c5.xyz;
	r6.xyz = (r4.xxx * c4.xyz) + r6.xyz;
	r4.xyw = (r4.yyy * c6.xyz) + r6.xyz;
	r4.xyw = (r5.yyy * c7.xyz) + r4.xyw;
	r4.xyz = (r4.zzz * c8.xyz) + r4.xyw;
	r4.xyz = (r5.zzz * c9.xyz) + r4.xyz;
	r5.xyz = r10.xxx * r11.xyz;
	r4.xyz = r4.xyz * r5.xyz;
	r5.x = v7.w;
	r5.y = v8.w;
	r5.z = v9.w;
	r5.xyz = -r5.xyz + c21.xyz;
	r6.xyz = normalize(r5.xyz);
	r2.w = clamp(dot(-v9.xyz, r6.xyz), 0.0, 1.0);
	r2.w = (r2.w * r2.w) + r2.w;
	r2.w = r2.w * c2.y;
	r5.xyz = r2.www * r11.xyz;
	r6.xyz = c0.xyz * v6.xyz;
	r5.xyz = (r6.xyz * r5.xyz) + -r4.xyz;
	r4.xyz = (r0.www * r5.xyz) + r4.xyz;
	r4.xyz = r1.www * r4.xyz;
	r2.xyz = (r2.xyz * r7.yyy) + r4.xyz;
	r0.xyz = r0.xyz * r2.xyz;
	r0.xyz = (r1.xyz * r13.xyz) + r0.xyz;
	r0.xyz = (r9.yzw * r3.xyz) + r0.xyz;
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

