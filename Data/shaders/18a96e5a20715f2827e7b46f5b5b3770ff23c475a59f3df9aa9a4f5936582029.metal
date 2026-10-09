#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[37];
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
	const float4 c13 = float4(5.773500204e-01, 1.000000000e+00, 2.000000000e+00, -1.000000000e+00); (void) c13;
	const float4 c14 = float4(1.000000000e+00, 0.000000000e+00, 1.041666627e+00, -2.083333395e-02); (void) c14;
	const float4 c15 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -9.999999975e-07); (void) c15;
	const float4 c16 = float4(1.000000000e+06, -3.000000119e-01, -3.333333254e+00, 0.000000000e+00); (void) c16;
	const float4 c17 = float4(-2.000000000e+00, 3.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c17;
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
	#define c1 uniforms.uniforms_float4[0]
	#define c2 uniforms.uniforms_float4[1]
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
	#define c33 uniforms.uniforms_float4[20]
	#define c68 uniforms.uniforms_float4[21]
	#define c71 uniforms.uniforms_float4[22]
	#define c73 uniforms.uniforms_float4[23]
	#define c74 uniforms.uniforms_float4[24]
	#define c77 uniforms.uniforms_float4[25]
	#define c78 uniforms.uniforms_float4[26]
	#define c86 uniforms.uniforms_float4[27]
	#define c87 uniforms.uniforms_float4[28]
	#define c89 uniforms.uniforms_float4[29]
	#define c101 uniforms.uniforms_float4[30]
	#define c102 uniforms.uniforms_float4[31]
	#define c103 uniforms.uniforms_float4[32]
	#define c104 uniforms.uniforms_float4[33]
	#define c105 uniforms.uniforms_float4[34]
	#define c106 uniforms.uniforms_float4[35]
	#define c107 uniforms.uniforms_float4[36]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define oC0 output.oC0
	r0.x = c19.y + -v5.z;
	r0.x = r0.x + -c13.z;
	oC0.w = clamp(r0.x * c19.w, 0.0, 1.0);
	r0.xy = c0.xy;
	r0.x = (c12.w * r0.x) + r0.y;
	r0.x = fract(r0.x);
	r0.x = (r0.x * c0.z) + c0.w;
	r1.xy = float2(cos(r0.x), sin(r0.x));
	r0 = s0_texture.sample(s0, v0.xy);
	r2.xyz = r0.zxy * c13.xxx;
	r2.xyz = (r0.zxy * c13.xxx) + -r2.zxy;
	r1.yzw = r1.yyy * r2.xyz;
	r1.yzw = (r0.xyz * r1.xxx) + r1.yzw;
	r1.x = -r1.x + c13.y;
	r2.x = dot(c13.xxx, r0.xyz);
	r2.x = r2.x * c13.x;
	r1.xyz = (r2.xxx * r1.xxx) + r1.yzw;
	r1.w = abs(c12.w);
	r0.xyz = ((-r1.w >= 0.0) ? r0.xyz : r1.xyz);
	r1.xyz = r0.www * c104.xyz;
	r2.xyz = r0.xyz * r0.xyz;
	r2.xyz = r2.xyz * r2.xyz;
	r0.w = dot(r2.xyz, c15.xyz);
	r1.w = r0.w + c15.w;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r1.w >= 0.0) ? r0.w : c16.x);
	r1.w = dot(r0.xyz, c15.xyz);
	r2.xyz = r1.www * r2.xyz;
	r3.xyz = mix(r0.xyz, r1.www, -c101.yyy);
	r2.xyz = (r2.xyz * r0.www) + -r0.xyz;
	r2.xyz = (c101.yyy * r2.xyz) + r0.xyz;
	r2.xyz = ((c101.y >= 0.0) ? r2.xyz : r3.xyz);
	r0.w = abs(c101.y);
	r2.xyz = ((-r0.w >= 0.0) ? r0.xyz : r2.xyz);
	r3.xyz = c23.xyz + -v5.xyz;
	r4.xyz = normalize(r3.xyz);
	r3.xyz = c3.xyz + -v5.xyz;
	r0.w = dot(r3.xyz, r3.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r5.xyz = (r3.xyz * r0.www) + r4.xyz;
	r6.xyz = normalize(r5.xyz);
	r5 = s1_texture.sample(s1, v0.xy);
	r5.xyz = (r5.xyz * c13.zzz) + c13.www;
	r7.x = dot(v2.xyz, r5.xyz);
	r7.y = dot(v3.xyz, r5.xyz);
	r7.z = dot(v4.xyz, r5.xyz);
	r5.xyz = normalize(r7.xyz);
	r6.x = clamp(dot(r5.xyz, r6.xyz), 0.0, 1.0);
	r1.w = clamp(dot(r5.xyz, r4.xyz), 0.0, 1.0);
	r2.w = r1.w * r6.x;
	r4.xyz = r0.www * r3.xyz;
	r3.w = dot(r4.xyz, r5.xyz);
	r6.z = clamp(r3.w, 0.0, 1.0);
	r3.w = r3.w + r3.w;
	r4.w = -r6.z + c13.y;
	r7.x = pow(abs(r4.w), c105.x);
	r2.w = r2.w * r7.x;
	r4.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.w = (r1.w * r1.w) + r1.w;
	r1.w = r1.w * c0.y;
	r4.w = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r2.w = r2.w * r4.w;
	r7.yzw = c21.xyz + -v5.xyz;
	r8.xyz = normalize(r7.yzw);
	r7.yzw = (r3.xyz * r0.www) + r8.xyz;
	r8.x = clamp(dot(r5.xyz, r8.xyz), 0.0, 1.0);
	r9.xyz = normalize(r7.yzw);
	r6.y = clamp(dot(r5.xyz, r9.xyz), 0.0, 1.0);
	r7.y = r8.x * r6.y;
	r7.y = r7.x * r7.y;
	r7.z = ((r8.x == 0.0) ? FLT_MAX : rsqrt(abs(r8.x)));
	r7.w = (r8.x * r8.x) + r8.x;
	r7.w = r7.w * c0.y;
	r7.z = ((r7.z == 0.0) ? FLT_MAX : 1.0 / r7.z);
	r8.x = (r7.y * r7.z) + r2.w;
	r7.y = r7.z * r7.y;
	r8.yzw = c25.xyz + -v5.xyz;
	r9.xyz = normalize(r8.yzw);
	r3.xyz = (r3.xyz * r0.www) + r9.xyz;
	r0.w = clamp(dot(r5.xyz, r9.xyz), 0.0, 1.0);
	r9.xyz = normalize(r3.xyz);
	r3.x = clamp(dot(r5.xyz, r9.xyz), 0.0, 1.0);
	r3.z = r0.w * r3.x;
	r3.z = r7.x * r3.z;
	r7.x = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = (r0.w * r0.w) + r0.w;
	r0.w = r0.w * c0.y;
	r7.x = ((r7.x == 0.0) ? FLT_MAX : 1.0 / r7.x);
	r8.x = (r3.z * r7.x) + r8.x;
	r3.z = r3.z * r7.x;
	r8.xy = r8.xx + -c33.xw;
	r8.zw = -c33.xw + c33.yz;
	r8.z = ((r8.z == 0.0) ? FLT_MAX : 1.0 / r8.z);
	r8.w = ((r8.w == 0.0) ? FLT_MAX : 1.0 / r8.w);
	r8.xy = clamp(r8.zw * r8.xy, float2(0.0), float2(1.0));
	r8.z = (r8.x * c17.x) + c17.y;
	r8.x = r8.x * r8.x;
	r8.x = r8.x * r8.z;
	r8.z = (r8.y * c17.x) + c17.y;
	r8.y = r8.y * r8.y;
	r8.y = r8.y * r8.z;
	r8.x = r8.y * r8.x;
	r9 = (v5.xyzx * c14.xxxy) + c14.yyyx;
	r10.x = dot(r9, c73);
	r10.y = dot(r9, c74);
	r8.yz = (r10.xy * c14.zz) + c14.ww;
	r10.zw = clamp(r8.yz, float2(0.0), float2(1.0));
	r8.yz = -r8.yz + r10.zw;
	r8.y = dot(r8.yz, c14.xx) + c14.y;
	r8.z = dot(r9, c77);
	r11.x = clamp(((-abs(r8.y) >= 0.0) ? r10.x : r8.z), 0.0, 1.0);
	r8.z = dot(r9, c78);
	r9.z = dot(r9, c71);
	r11.y = clamp(((-abs(r8.y) >= 0.0) ? r10.y : r8.z), 0.0, 1.0);
	r10.xy = c86.xy;
	r8.yz = ((-abs(r8.y) >= 0.0) ? r10.xy : c87.xy);
	r9.xy = (r11.xy * c0.yy) + r8.yz;
	r9.w = c14.y;
	r9 = float4(s8_texture.sample_compare(s8, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
	r8.yzw = -c89.xyz + v5.xyz;
	r8.y = dot(r8.yzw, r8.yzw);
	r8.y = clamp((r8.y * c68.y) + c68.x, 0.0, 1.0);
	r10.x = mix(r9.x, c13.y, r8.y);
	r8.yzw = c20.xyz * v1.xxx;
	r9.xyz = r7.yyy * r8.yzw;
	r10.yzw = c22.xyz * v1.yyy;
	r11.xyz = r2.www * r10.yzw;
	r9.xyz = (r9.xyz * r10.xxx) + r11.xyz;
	r11.xyz = c24.xyz * v1.zzz;
	r9.xyz = (r3.zzz * r11.xyz) + r9.xyz;
	r7.y = c13.y;
	r2.w = (v6.w * c11.w) + r7.y;
	r12 = s10_texture.sample(s10, v0.xy);
	r3.z = r12.x * c105.y;
	r2.w = r2.w * r3.z;
	r9.xyz = r2.www * r9.xyz;
	r2.w = r12.y * c101.w;
	r13.xyz = (r0.xyz * r2.www) + -c106.xyz;
	r2.w = clamp(r2.w, 0.0, 1.0);
	r13.xyz = (r2.www * r13.xyz) + c106.xyz;
	r14.xyz = r9.xyz * r13.xyz;
	r2.w = dot(r14.xyz, c15.xyz);
	r2.w = r2.w * r8.x;
	r2.w = r2.w * c106.w;
	r14.x = ((r5.x >= 0.0) ? c14.y : c14.x);
	r14.y = ((r5.y >= 0.0) ? c14.y : c14.x);
	r14.z = ((r5.z >= 0.0) ? c14.y : c14.x);
	r15.xyz = r5.xyz * r5.xyz;
	r14.xyz = r14.xyz * r15.xyz;
	r16.xyz = r14.xxx * c5.xyz;
	r17.x = ((r5.x >= 0.0) ? c14.x : c14.y);
	r17.y = ((r5.y >= 0.0) ? c14.x : c14.y);
	r17.z = ((r5.z >= 0.0) ? c14.x : c14.y);
	r15.xyz = r15.xyz * r17.xyz;
	r16.xyz = (r15.xxx * c4.xyz) + r16.xyz;
	r15.xyw = (r15.yyy * c6.xyz) + r16.xyz;
	r14.xyw = (r14.yyy * c7.xyz) + r15.xyw;
	r14.xyw = (r15.zzz * c8.xyz) + r14.xyw;
	r14.xyz = (r14.zzz * c9.xyz) + r14.xyw;
	r15.xyz = r7.www * r8.yzw;
	r14.xyz = (r15.xyz * r10.xxx) + r14.xyz;
	r14.xyz = (r10.yzw * r1.www) + r14.xyz;
	r14.xyz = (r11.xyz * r0.www) + r14.xyz;
	r0.w = dot(r14.xyz, c15.xyz);
	r7.yw = r0.ww + -c2.xw;
	r15.xy = -c2.xw + c2.yz;
	r0.w = ((r15.y == 0.0) ? FLT_MAX : 1.0 / r15.y);
	r1.w = ((r15.x == 0.0) ? FLT_MAX : 1.0 / r15.x);
	r1.w = clamp(r1.w * r7.y, 0.0, 1.0);
	r0.w = clamp(r0.w * r7.w, 0.0, 1.0);
	r3.z = (r0.w * c17.x) + c17.y;
	r0.w = r0.w * r0.w;
	r0.w = (r3.z * r0.w) + r2.w;
	r2.w = (r1.w * c17.x) + c17.y;
	r1.w = r1.w * r1.w;
	r1.w = r1.w * r2.w;
	r0.w = r0.w * r1.w;
	r15.xyz = mix(r0.xyz, r2.xyz, r0.www);
	r0.xyz = r0.xyz + c13.www;
	r0.xyz = (r12.yyy * r0.xyz) + c13.yyy;
	r0.w = dot(r15.xyz, c15.xyz);
	r2.xyz = r0.www * c102.xyz;
	r16.xyz = c15.xyz;
	r0.w = dot(c102.xyz, r16.xyz);
	r1.w = r0.w + c15.w;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r1.w >= 0.0) ? r0.w : c16.x);
	r2.xyz = (r2.xyz * r0.www) + -r15.xyz;
	r2.xyz = (c102.www * r2.xyz) + r15.xyz;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r2.xyz = (r2.xyz * r0.www) + -r15.xyz;
	r16.xyz = (r9.xyz * r13.xyz) + r14.xyz;
	r14.xyz = r14.xyz + v6.xyz;
	r0.w = dot(r16.xyz, c15.xyz);
	r0.w = r0.w + c16.y;
	r0.w = clamp(r0.w * c16.z, 0.0, 1.0);
	r1.w = (r0.w * c17.x) + c17.y;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.w;
	r2.xyz = (r0.www * r2.xyz) + r15.xyz;
	r2.xyz = r12.zzz * r2.xyz;
	r6.w = r12.w;
	r0.w = mix(c10.x, c10.y, r12.y);
	r12 = s7_texture.sample(s7, r6.yw);
	r7.yzw = r7.zzz * r12.xyz;
	r7.yzw = r8.yzw * r7.yzw;
	r8 = s7_texture.sample(s7, r6.xw);
	r8.xyz = r4.www * r8.xyz;
	r8.xyz = r10.yzw * r8.xyz;
	r7.yzw = (r7.yzw * r10.xxx) + r8.xyz;
	r3.y = r6.w;
	r6 = s4_texture.sample(s4, r6.zw);
	r8 = s7_texture.sample(s7, r3.xy);
	r3.xyz = r7.xxx * r8.xyz;
	r3.xyz = (r3.xyz * r11.xyz) + r7.yzw;
	r3.xyz = r5.www * r3.xyz;
	r1.w = dot(r5.xyz, r5.xyz);
	r4.xyz = r4.xyz * r1.www;
	r4.xyz = (r3.www * r5.xyz) + -r4.xyz;
	r4 = s6_texture.sample(s6, r4.xyz);
	r5.xyz = r4.xyz * c30.zzz;
	r6.xzw = r5.xyz * r5.xyz;
	r6.xzw = r6.xzw * r6.xzw;
	r1.w = dot(r6.xzw, c15.xyz);
	r2.w = r1.w + c15.w;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = ((r2.w >= 0.0) ? r1.w : c16.x);
	r2.w = dot(r5.xyz, c15.xyz);
	r6.xzw = r2.www * r6.xzw;
	r4.xyz = (c30.zzz * -r4.xyz) + r2.www;
	r4.xyz = (-c103.www * r4.xyz) + r5.xyz;
	r6.xzw = (r6.xzw * r1.www) + -r5.xyz;
	r6.xzw = (c103.www * r6.xzw) + r5.xyz;
	r4.xyz = ((c103.w >= 0.0) ? r6.xzw : r4.xyz);
	r1.w = abs(c103.w);
	r4.xyz = ((-r1.w >= 0.0) ? r5.xyz : r4.xyz);
	r5.xyz = r14.xyz + -c103.xxx;
	r5.xyz = clamp(r5.xyz * c103.yyy, float3(0.0), float3(1.0));
	r5.xyz = (r4.xyz * r5.xyz) + -r4.xyz;
	r4.xyz = (c101.xxx * r5.xyz) + r4.xyz;
	r5.xyz = (r4.xyz * r4.xyz) + -r4.xyz;
	r4.xyz = (c103.zzz * r5.xyz) + r4.xyz;
	r1.xyz = r1.xyz * r4.xyz;
	r1.xyz = (r3.xyz * r0.www) + r1.xyz;
	r1.xyz = r6.yyy * r1.xyz;
	r0.xyz = r0.xyz * r1.xyz;
	r0.xyz = (r2.xyz * r14.xyz) + r0.xyz;
	r0.xyz = (r9.xyz * r13.xyz) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	oC0.xyz = r0.xyz * c30.xxx;
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
	#undef c30
	#undef c33
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

