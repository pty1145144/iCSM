#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[32];
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
	const float4 c13 = float4(1.000000000e+00, 0.000000000e+00, 1.041666627e+00, -2.083333395e-02); (void) c13;
	const float4 c14 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -9.999999975e-07); (void) c14;
	const float4 c15 = float4(5.773500204e-01, 1.000000000e+00, 2.000000000e+00, -1.000000000e+00); (void) c15;
	const float4 c16 = float4(-2.000000000e+00, 3.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c16;
	const float4 c17 = float4(1.000000000e+06, -3.000000119e-01, -3.333333254e+00, 0.000000000e+00); (void) c17;
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
	#define c20 uniforms.uniforms_float4[12]
	#define c21 uniforms.uniforms_float4[13]
	#define c30 uniforms.uniforms_float4[14]
	#define c33 uniforms.uniforms_float4[15]
	#define c68 uniforms.uniforms_float4[16]
	#define c71 uniforms.uniforms_float4[17]
	#define c73 uniforms.uniforms_float4[18]
	#define c74 uniforms.uniforms_float4[19]
	#define c77 uniforms.uniforms_float4[20]
	#define c78 uniforms.uniforms_float4[21]
	#define c86 uniforms.uniforms_float4[22]
	#define c87 uniforms.uniforms_float4[23]
	#define c89 uniforms.uniforms_float4[24]
	#define c101 uniforms.uniforms_float4[25]
	#define c102 uniforms.uniforms_float4[26]
	#define c103 uniforms.uniforms_float4[27]
	#define c104 uniforms.uniforms_float4[28]
	#define c105 uniforms.uniforms_float4[29]
	#define c106 uniforms.uniforms_float4[30]
	#define c107 uniforms.uniforms_float4[31]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define oC0 output.oC0
	r0.xy = c0.xy;
	r0.x = (c12.w * r0.x) + r0.y;
	r0.x = fract(r0.x);
	r0.x = (r0.x * c0.z) + c0.w;
	r1.xy = float2(cos(r0.x), sin(r0.x));
	r0 = s0_texture.sample(s0, v0.xy);
	r2.xyz = r0.zxy * c15.xxx;
	r2.xyz = (r0.zxy * c15.xxx) + -r2.zxy;
	r1.yzw = r1.yyy * r2.xyz;
	r1.yzw = (r0.xyz * r1.xxx) + r1.yzw;
	r1.x = -r1.x + c15.y;
	r2.x = dot(c15.xxx, r0.xyz);
	r2.x = r2.x * c15.x;
	r1.xyz = (r2.xxx * r1.xxx) + r1.yzw;
	r1.w = abs(c12.w);
	r0.xyz = ((-r1.w >= 0.0) ? r0.xyz : r1.xyz);
	r1.xyz = r0.www * c104.xyz;
	r2.xyz = r0.xyz * r0.xyz;
	r2.xyz = r2.xyz * r2.xyz;
	r0.w = dot(r2.xyz, c14.xyz);
	r1.w = r0.w + c14.w;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r1.w >= 0.0) ? r0.w : c17.x);
	r1.w = dot(r0.xyz, c14.xyz);
	r2.xyz = r1.www * r2.xyz;
	r3.xyz = mix(r0.xyz, r1.www, -c101.yyy);
	r2.xyz = (r2.xyz * r0.www) + -r0.xyz;
	r2.xyz = (c101.yyy * r2.xyz) + r0.xyz;
	r2.xyz = ((c101.y >= 0.0) ? r2.xyz : r3.xyz);
	r0.w = abs(c101.y);
	r2.xyz = ((-r0.w >= 0.0) ? r0.xyz : r2.xyz);
	r3 = s10_texture.sample(s10, v0.xy);
	r0.w = r3.y * c101.w;
	r4.xyz = (r0.xyz * r0.www) + -c106.xyz;
	r0.w = clamp(r0.w, 0.0, 1.0);
	r4.xyz = (r0.www * r4.xyz) + c106.xyz;
	r5 = (v5.xyzx * c13.xxxy) + c13.yyyx;
	r6.x = dot(r5, c73);
	r6.y = dot(r5, c74);
	r6.zw = (r6.xy * c13.zz) + c13.ww;
	r7.xy = clamp(r6.zw, float2(0.0), float2(1.0));
	r6.zw = -r6.zw + r7.xy;
	r0.w = dot(r6.zw, c13.xx) + c13.y;
	r1.w = dot(r5, c77);
	r7.x = clamp(((-abs(r0.w) >= 0.0) ? r6.x : r1.w), 0.0, 1.0);
	r1.w = dot(r5, c78);
	r5.z = dot(r5, c71);
	r7.y = clamp(((-abs(r0.w) >= 0.0) ? r6.y : r1.w), 0.0, 1.0);
	r6.xy = c86.xy;
	r6.xy = ((-abs(r0.w) >= 0.0) ? r6.xy : c87.xy);
	r5.xy = (r7.xy * c0.yy) + r6.xy;
	r5.w = c13.y;
	r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
	r5.yzw = -c89.xyz + v5.xyz;
	r0.w = dot(r5.yzw, r5.yzw);
	r0.w = clamp((r0.w * c68.y) + c68.x, 0.0, 1.0);
	r1.w = mix(r5.x, c15.y, r0.w);
	r5.xyz = c21.xyz + -v5.xyz;
	r6.xyz = normalize(r5.xyz);
	r5.xyz = c3.xyz + -v5.xyz;
	r0.w = dot(r5.xyz, r5.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r7.xyz = (r5.xyz * r0.www) + r6.xyz;
	r5.xyz = r0.www * r5.xyz;
	r8.xyz = normalize(r7.xyz);
	r7 = s1_texture.sample(s1, v0.xy);
	r7.xyz = (r7.xyz * c15.zzz) + c15.www;
	r9.x = dot(v2.xyz, r7.xyz);
	r9.y = dot(v3.xyz, r7.xyz);
	r9.z = dot(v4.xyz, r7.xyz);
	r7.xyz = normalize(r9.xyz);
	r8.x = clamp(dot(r7.xyz, r8.xyz), 0.0, 1.0);
	r0.w = clamp(dot(r7.xyz, r6.xyz), 0.0, 1.0);
	r2.w = r0.w * r8.x;
	r4.w = dot(r5.xyz, r7.xyz);
	r8.y = clamp(r4.w, 0.0, 1.0);
	r4.w = r4.w + r4.w;
	r5.w = -r8.y + c15.y;
	r6.x = pow(abs(r5.w), c105.x);
	r2.w = r2.w * r6.x;
	r5.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = (r0.w * r0.w) + r0.w;
	r0.w = r0.w * c0.y;
	r5.w = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r6.x = r2.w * r5.w;
	r6.yz = (r2.ww * r5.ww) + -c33.xw;
	r9.xyz = c20.xyz * v1.xxx;
	r10.xyz = r6.xxx * r9.xyz;
	r10.xyz = r1.www * r10.xyz;
	r11.y = c15.y;
	r2.w = (v6.w * c11.w) + r11.y;
	r3.x = r3.x * c105.y;
	r2.w = r2.w * r3.x;
	r10.xyz = r2.www * r10.xyz;
	r11.xyz = r4.xyz * r10.xyz;
	r2.w = dot(r11.xyz, c14.xyz);
	r6.xw = -c33.xw + c33.yz;
	r3.x = ((r6.x == 0.0) ? FLT_MAX : 1.0 / r6.x);
	r6.x = ((r6.w == 0.0) ? FLT_MAX : 1.0 / r6.w);
	r6.x = clamp(r6.x * r6.z, 0.0, 1.0);
	r3.x = clamp(r3.x * r6.y, 0.0, 1.0);
	r6.y = (r3.x * c16.x) + c16.y;
	r3.x = r3.x * r3.x;
	r3.x = r3.x * r6.y;
	r6.y = (r6.x * c16.x) + c16.y;
	r6.x = r6.x * r6.x;
	r6.x = r6.x * r6.y;
	r3.x = r3.x * r6.x;
	r2.w = r2.w * r3.x;
	r2.w = r2.w * c106.w;
	r6.x = ((r7.x >= 0.0) ? c13.y : c13.x);
	r6.y = ((r7.y >= 0.0) ? c13.y : c13.x);
	r6.z = ((r7.z >= 0.0) ? c13.y : c13.x);
	r11.xyz = r7.xyz * r7.xyz;
	r6.xyz = r6.xyz * r11.xyz;
	r12.xyz = r6.xxx * c5.xyz;
	r13.x = ((r7.x >= 0.0) ? c13.x : c13.y);
	r13.y = ((r7.y >= 0.0) ? c13.x : c13.y);
	r13.z = ((r7.z >= 0.0) ? c13.x : c13.y);
	r11.xyz = r11.xyz * r13.xyz;
	r12.xyz = (r11.xxx * c4.xyz) + r12.xyz;
	r11.xyw = (r11.yyy * c6.xyz) + r12.xyz;
	r6.xyw = (r6.yyy * c7.xyz) + r11.xyw;
	r6.xyw = (r11.zzz * c8.xyz) + r6.xyw;
	r6.xyz = (r6.zzz * c9.xyz) + r6.xyw;
	r11.xyz = r0.www * r9.xyz;
	r6.xyz = (r11.xyz * r1.www) + r6.xyz;
	r0.w = dot(r6.xyz, c14.xyz);
	r11.xy = r0.ww + -c2.xw;
	r11.zw = -c2.xw + c2.yz;
	r0.w = ((r11.w == 0.0) ? FLT_MAX : 1.0 / r11.w);
	r3.x = ((r11.z == 0.0) ? FLT_MAX : 1.0 / r11.z);
	r3.x = clamp(r3.x * r11.x, 0.0, 1.0);
	r0.w = clamp(r0.w * r11.y, 0.0, 1.0);
	r6.w = (r0.w * c16.x) + c16.y;
	r0.w = r0.w * r0.w;
	r0.w = (r6.w * r0.w) + r2.w;
	r2.w = (r3.x * c16.x) + c16.y;
	r3.x = r3.x * r3.x;
	r2.w = r2.w * r3.x;
	r0.w = r0.w * r2.w;
	r11.xyz = mix(r0.xyz, r2.xyz, r0.www);
	r0.xyz = r0.xyz + c15.www;
	r0.xyz = (r3.yyy * r0.xyz) + c15.yyy;
	r0.w = dot(r11.xyz, c14.xyz);
	r2.xyz = r0.www * c102.xyz;
	r12.xyz = c14.xyz;
	r0.w = dot(c102.xyz, r12.xyz);
	r2.w = r0.w + c14.w;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r2.w >= 0.0) ? r0.w : c17.x);
	r2.xyz = (r2.xyz * r0.www) + -r11.xyz;
	r2.xyz = (c102.www * r2.xyz) + r11.xyz;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r2.xyz = (r2.xyz * r0.www) + -r11.xyz;
	r12.xyz = (r10.xyz * r4.xyz) + r6.xyz;
	r6.xyz = r6.xyz + v6.xyz;
	r0.w = dot(r12.xyz, c14.xyz);
	r0.w = r0.w + c17.y;
	r0.w = clamp(r0.w * c17.z, 0.0, 1.0);
	r2.w = (r0.w * c16.x) + c16.y;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r2.w;
	r2.xyz = (r0.www * r2.xyz) + r11.xyz;
	r2.xyz = r3.zzz * r2.xyz;
	r8.z = r3.w;
	r0.w = mix(c10.x, c10.y, r3.y);
	r3 = s7_texture.sample(s7, r8.xz);
	r8 = s4_texture.sample(s4, r8.yz);
	r3.xyz = r5.www * r3.xyz;
	r3.xyz = r9.xyz * r3.xyz;
	r3.xyz = r1.www * r3.xyz;
	r3.xyz = r7.www * r3.xyz;
	r1.w = dot(r7.xyz, r7.xyz);
	r5.xyz = r5.xyz * r1.www;
	r5.xyz = (r4.www * r7.xyz) + -r5.xyz;
	r5 = s6_texture.sample(s6, r5.xyz);
	r7.xyz = r5.xyz * c30.zzz;
	r8.xzw = r7.xyz * r7.xyz;
	r8.xzw = r8.xzw * r8.xzw;
	r1.w = dot(r8.xzw, c14.xyz);
	r2.w = r1.w + c14.w;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = ((r2.w >= 0.0) ? r1.w : c17.x);
	r2.w = dot(r7.xyz, c14.xyz);
	r8.xzw = r2.www * r8.xzw;
	r5.xyz = (c30.zzz * -r5.xyz) + r2.www;
	r5.xyz = (-c103.www * r5.xyz) + r7.xyz;
	r8.xzw = (r8.xzw * r1.www) + -r7.xyz;
	r8.xzw = (c103.www * r8.xzw) + r7.xyz;
	r5.xyz = ((c103.w >= 0.0) ? r8.xzw : r5.xyz);
	r1.w = abs(c103.w);
	r5.xyz = ((-r1.w >= 0.0) ? r7.xyz : r5.xyz);
	r7.xyz = r6.xyz + -c103.xxx;
	r7.xyz = clamp(r7.xyz * c103.yyy, float3(0.0), float3(1.0));
	r7.xyz = (r5.xyz * r7.xyz) + -r5.xyz;
	r5.xyz = (c101.xxx * r7.xyz) + r5.xyz;
	r7.xyz = (r5.xyz * r5.xyz) + -r5.xyz;
	r5.xyz = (c103.zzz * r7.xyz) + r5.xyz;
	r1.xyz = r1.xyz * r5.xyz;
	r1.xyz = (r3.xyz * r0.www) + r1.xyz;
	r1.xyz = r8.yyy * r1.xyz;
	r0.xyz = r0.xyz * r1.xyz;
	r0.xyz = (r2.xyz * r6.xyz) + r0.xyz;
	r0.xyz = (r10.xyz * r4.xyz) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	oC0.xyz = r0.xyz * c30.xxx;
	oC0.w = c1.w;
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
	#undef c20
	#undef c21
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

