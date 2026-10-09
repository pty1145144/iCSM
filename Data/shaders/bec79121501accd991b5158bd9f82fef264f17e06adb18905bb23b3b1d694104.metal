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
	texture2d<float> s8_texture [[texture(8)]],
	sampler s8 [[sampler(8)]],
	texture2d<float> s10_texture [[texture(10)]],
	sampler s10 [[sampler(10)]],
	depth2d<float> s11_texture [[texture(11)]],
	sampler s11 [[sampler(11)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(1.591549367e-01, 5.000000000e-01, 6.283185482e+00, -3.141592741e+00); (void) c0;
	const float4 c22 = float4(5.773500204e-01, 1.000000000e+00, 2.000000000e+00, -1.000000000e+00); (void) c22;
	const float4 c23 = float4(-3.000000119e-01, -3.333333254e+00, -2.000000000e+00, 3.000000000e+00); (void) c23;
	const float4 c24 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, 1.000000000e+06); (void) c24;
	const float4 c25 = float4(0.000000000e+00, 1.000000000e+00, -4.000000060e-01, -9.999999975e-07); (void) c25;
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
	#define c13 uniforms.uniforms_float4[12]
	#define c14 uniforms.uniforms_float4[13]
	#define c15 uniforms.uniforms_float4[14]
	#define c16 uniforms.uniforms_float4[15]
	#define c17 uniforms.uniforms_float4[16]
	#define c18 uniforms.uniforms_float4[17]
	#define c19 uniforms.uniforms_float4[18]
	#define c20 uniforms.uniforms_float4[19]
	#define c21 uniforms.uniforms_float4[20]
	#define c28 uniforms.uniforms_float4[21]
	#define c30 uniforms.uniforms_float4[22]
	#define c33 uniforms.uniforms_float4[23]
	#define c101 uniforms.uniforms_float4[24]
	#define c102 uniforms.uniforms_float4[25]
	#define c103 uniforms.uniforms_float4[26]
	#define c104 uniforms.uniforms_float4[27]
	#define c105 uniforms.uniforms_float4[28]
	#define c106 uniforms.uniforms_float4[29]
	#define c107 uniforms.uniforms_float4[30]
	#define c109 uniforms.uniforms_float4[31]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define oC0 output.oC0
	r0.x = c19.y + -v5.z;
	r0.x = r0.x + -c22.z;
	oC0.w = clamp(r0.x * c19.w, 0.0, 1.0);
	r0 = s1_texture.sample(s1, v0.xy);
	r0.xyz = (r0.xyz * c22.zzz) + c22.www;
	r1.x = dot(v2.xyz, r0.xyz);
	r1.y = dot(v3.xyz, r0.xyz);
	r1.z = dot(v4.xyz, r0.xyz);
	r0.xyz = normalize(r1.xyz);
	r1.x = ((r0.x >= 0.0) ? c25.x : c25.y);
	r1.y = ((r0.y >= 0.0) ? c25.x : c25.y);
	r1.z = ((r0.z >= 0.0) ? c25.x : c25.y);
	r2.xyz = r0.xyz * r0.xyz;
	r1.xyz = r1.xyz * r2.xyz;
	r3.xyz = r1.xxx * c5.xyz;
	r4.x = ((r0.x >= 0.0) ? c25.y : c25.x);
	r4.y = ((r0.y >= 0.0) ? c25.y : c25.x);
	r4.z = ((r0.z >= 0.0) ? c25.y : c25.x);
	r2.xyz = r2.xyz * r4.xyz;
	r3.xyz = (r2.xxx * c4.xyz) + r3.xyz;
	r2.xyw = (r2.yyy * c6.xyz) + r3.xyz;
	r1.xyw = (r1.yyy * c7.xyz) + r2.xyw;
	r1.xyw = (r2.zzz * c8.xyz) + r1.xyw;
	r1.xyz = (r1.zzz * c9.xyz) + r1.xyw;
	r2.xyz = c21.xyz + -v5.xyz;
	r3.xyz = normalize(r2.xyz);
	r1.w = clamp(dot(r0.xyz, r3.xyz), 0.0, 1.0);
	r2.x = (r1.w * r1.w) + r1.w;
	r2.x = r2.x * c0.y;
	r2.yzw = c20.xyz * v1.xxx;
	r1.xyz = (r2.yzw * r2.xxx) + r1.xyz;
	r4 = (v5.xyzx * c25.yyyx) + c25.xxxy;
	r2.x = dot(r4, c18);
	r3.w = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r5.x = dot(r4, c15);
	r5.y = dot(r4, c16);
	r5.z = dot(r4, c17);
	r4.xyz = r3.www * r5.xyz;
	r5 = s8_texture.sample(s8, r4.xy);
	r5.xyz = ((-r2.x >= 0.0) ? c25.xxx : r5.xyz);
	r6.xyz = r5.xyz * c28.xyz;
	r4.w = c22.y;
	r4 = float4(s11_texture.sample_compare(s11, (r4.xyz).xy, (r4.xyz).z));
	r2.x = clamp(r4.x, 0.0, 1.0);
	r3.w = -r2.x + c22.y;
	r2.x = (c109.y * r3.w) + r2.x;
	r7.x = c22.y;
	r4.yzw = c14.xyz + -v5.xyz;
	r3.w = dot(r4.yzw, r4.yzw);
	r7.z = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r7.y = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r3.w = clamp(dot(c13.xyz, r7.xyz), 0.0, 1.0);
	r5.w = clamp(mix(r2.x, r4.x, r3.w), 0.0, 1.0);
	r6.xyz = r5.www * r6.xyz;
	r4.yzw = r4.yzw * r7.yyy;
	r2.x = ((r7.y == 0.0) ? FLT_MAX : 1.0 / r7.y);
	r2.x = r2.x + -c13.w;
	r5.w = dot(r4.yzw, r0.xyz);
	r6.w = clamp(r5.w + c28.w, 0.0, 1.0);
	r5.w = clamp(r5.w, 0.0, 1.0);
	r5.w = ((r5.w == 0.0) ? FLT_MAX : rsqrt(abs(r5.w)));
	r5.w = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r6.w = r3.w * r6.w;
	r6.xyz = r6.xyz * r6.www;
	r7.z = c25.z;
	r6.w = r7.z * c13.w;
	r6.w = ((r6.w == 0.0) ? FLT_MAX : 1.0 / r6.w);
	r2.x = clamp(r2.x * r6.w, 0.0, 1.0);
	r1.xyz = (r6.xyz * r2.xxx) + r1.xyz;
	r2.x = r2.x * r3.w;
	r6.xyz = r2.xxx * c28.xyz;
	r5.xyz = r5.xyz * r6.xyz;
	r6.xyz = r1.xyz + v6.xyz;
	r7.xyz = r6.xyz + -c103.xxx;
	r7.xyz = clamp(r7.xyz * c103.yyy, float3(0.0), float3(1.0));
	r2.x = dot(r0.xyz, r0.xyz);
	r8.xyz = c3.xyz + -v5.xyz;
	r6.w = dot(r8.xyz, r8.xyz);
	r6.w = ((r6.w == 0.0) ? FLT_MAX : rsqrt(abs(r6.w)));
	r9.xyz = r6.www * r8.xyz;
	r10.xyz = r2.xxx * r9.xyz;
	r9.z = dot(r9.xyz, r0.xyz);
	r2.x = r9.z + r9.z;
	r9.z = clamp(r9.z, 0.0, 1.0);
	r10.xyz = (r2.xxx * r0.xyz) + -r10.xyz;
	r10 = s6_texture.sample(s6, r10.xyz);
	r11.xyz = r10.xyz * c30.zzz;
	r12.xyz = r11.xyz * r11.xyz;
	r12.xyz = r12.xyz * r12.xyz;
	r2.x = dot(r12.xyz, c24.xyz);
	r7.w = r2.x + c25.w;
	r2.x = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r2.x = ((r7.w >= 0.0) ? r2.x : c24.w);
	r7.w = dot(r11.xyz, c24.xyz);
	r12.xyz = r7.www * r12.xyz;
	r10.xyz = (c30.zzz * -r10.xyz) + r7.www;
	r10.xyz = (-c103.www * r10.xyz) + r11.xyz;
	r12.xyz = (r12.xyz * r2.xxx) + -r11.xyz;
	r12.xyz = (c103.www * r12.xyz) + r11.xyz;
	r10.xyz = ((c103.w >= 0.0) ? r12.xyz : r10.xyz);
	r2.x = abs(c103.w);
	r10.xyz = ((-r2.x >= 0.0) ? r11.xyz : r10.xyz);
	r7.xyz = (r10.xyz * r7.xyz) + -r10.xyz;
	r7.xyz = (c101.xxx * r7.xyz) + r10.xyz;
	r10.xyz = (r7.xyz * r7.xyz) + -r7.xyz;
	r7.xyz = (c103.zzz * r10.xyz) + r7.xyz;
	r10 = s0_texture.sample(s0, v0.xy);
	r11.xyz = r10.www * c104.xyz;
	r7.xyz = r7.xyz * r11.xyz;
	r2.x = -r4.x + c22.y;
	r2.x = (c109.y * r2.x) + r4.x;
	r7.w = clamp(mix(r2.x, r4.x, r3.w), 0.0, 1.0);
	r5.xyz = r5.xyz * r7.www;
	r4.xyz = (r8.xyz * r6.www) + r4.yzw;
	r3.xyz = (r8.xyz * r6.www) + r3.xyz;
	r8.xyz = normalize(r3.xyz);
	r9.x = clamp(dot(r0.xyz, r8.xyz), 0.0, 1.0);
	r3.xyz = normalize(r4.xyz);
	r9.y = clamp(dot(r0.xyz, r3.xyz), 0.0, 1.0);
	r3 = s10_texture.sample(s10, v0.xy);
	r9.w = r3.w;
	r4 = s7_texture.sample(s7, r9.yw);
	r0.xyz = r5.www * r4.xyz;
	r0.xyz = r5.xyz * r0.xyz;
	r2.x = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.w = r1.w * r9.x;
	r4 = s7_texture.sample(s7, r9.xw);
	r5 = s4_texture.sample(s4, r9.zw);
	r3.w = -r9.z + c22.y;
	r4.w = pow(abs(r3.w), c105.x);
	r1.w = r1.w * r4.w;
	r2.x = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r4.xyz = r2.xxx * r4.xyz;
	r0.xyz = (r4.xyz * r2.yzw) + r0.xyz;
	r0.xyz = r0.www * r0.xyz;
	r0.w = mix(c10.x, c10.y, r3.y);
	r0.xyz = (r0.xyz * r0.www) + r7.xyz;
	r0.xyz = r5.yyy * r0.xyz;
	r4.xyz = r10.zxy * c22.xxx;
	r4.xyz = (r10.zxy * c22.xxx) + -r4.zxy;
	r5.xy = c0.xy;
	r0.w = (c12.w * r5.x) + r5.y;
	r0.w = fract(r0.w);
	r0.w = (r0.w * c0.z) + c0.w;
	r5.xy = float2(cos(r0.w), sin(r0.w));
	r4.xyz = r4.xyz * r5.yyy;
	r4.xyz = (r10.xyz * r5.xxx) + r4.xyz;
	r0.w = -r5.x + c22.y;
	r3.w = dot(c22.xxx, r10.xyz);
	r3.w = r3.w * c22.x;
	r4.xyz = (r3.www * r0.www) + r4.xyz;
	r0.w = abs(c12.w);
	r4.xyz = ((-r0.w >= 0.0) ? r10.xyz : r4.xyz);
	r5.xyz = r4.xyz + c22.www;
	r5.xyz = (r3.yyy * r5.xyz) + c22.yyy;
	r0.xyz = r0.xyz * r5.xyz;
	r5.xyz = r4.xyz * r4.xyz;
	r5.xyz = r5.xyz * r5.xyz;
	r0.w = dot(r4.xyz, c24.xyz);
	r7.xyz = r0.www * r5.xyz;
	r3.w = dot(r5.xyz, c24.xyz);
	r5.xyz = mix(r4.xyz, r0.www, -c101.yyy);
	r0.w = r3.w + c25.w;
	r3.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r0.w = ((r0.w >= 0.0) ? r3.w : c24.w);
	r7.xyz = (r7.xyz * r0.www) + -r4.xyz;
	r7.xyz = (c101.yyy * r7.xyz) + r4.xyz;
	r5.xyz = ((c101.y >= 0.0) ? r7.xyz : r5.xyz);
	r0.w = abs(c101.y);
	r5.xyz = ((-r0.w >= 0.0) ? r4.xyz : r5.xyz);
	r7.xy = (r1.ww * r2.xx) + -c33.xw;
	r0.w = r1.w * r2.x;
	r2.xyz = r2.yzw * r0.www;
	r7.zw = -c33.xw + c33.yz;
	r0.w = ((r7.z == 0.0) ? FLT_MAX : 1.0 / r7.z);
	r1.w = ((r7.w == 0.0) ? FLT_MAX : 1.0 / r7.w);
	r1.w = clamp(r1.w * r7.y, 0.0, 1.0);
	r0.w = clamp(r0.w * r7.x, 0.0, 1.0);
	r2.w = (r0.w * c23.z) + c23.w;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r2.w;
	r2.w = (r1.w * c23.z) + c23.w;
	r1.w = r1.w * r1.w;
	r1.w = r1.w * r2.w;
	r0.w = r0.w * r1.w;
	r7.y = c22.y;
	r1.w = (v6.w * c11.w) + r7.y;
	r2.w = r3.x * c105.y;
	r1.w = r1.w * r2.w;
	r2.xyz = r1.www * r2.xyz;
	r1.w = r3.y * c101.w;
	r3.xyw = (r4.xyz * r1.www) + -c106.xyz;
	r1.w = clamp(r1.w, 0.0, 1.0);
	r3.xyw = (r1.www * r3.xyw) + c106.xyz;
	r7.xyz = r2.xyz * r3.xyw;
	r1.w = dot(r7.xyz, c24.xyz);
	r0.w = r0.w * r1.w;
	r0.w = r0.w * c106.w;
	r1.w = dot(r1.xyz, c24.xyz);
	r1.xyz = (r2.xyz * r3.xyw) + r1.xyz;
	r1.x = dot(r1.xyz, c24.xyz);
	r1.x = r1.x + c23.x;
	r1.x = clamp(r1.x * c23.y, 0.0, 1.0);
	r1.yz = r1.ww + -c2.xw;
	r7.xy = -c2.xw + c2.yz;
	r1.w = ((r7.y == 0.0) ? FLT_MAX : 1.0 / r7.y);
	r2.w = ((r7.x == 0.0) ? FLT_MAX : 1.0 / r7.x);
	r1.y = clamp(r1.y * r2.w, 0.0, 1.0);
	r1.z = clamp(r1.w * r1.z, 0.0, 1.0);
	r1.w = (r1.z * c23.z) + c23.w;
	r1.z = r1.z * r1.z;
	r0.w = (r1.w * r1.z) + r0.w;
	r1.z = (r1.y * c23.z) + c23.w;
	r1.y = r1.y * r1.y;
	r1.y = r1.y * r1.z;
	r0.w = r0.w * r1.y;
	r1.yzw = mix(r4.xyz, r5.xyz, r0.www);
	r0.w = dot(r1.yzw, c24.xyz);
	r4.xyz = r0.www * c102.xyz;
	r5.xyz = c24.xyz;
	r0.w = dot(c102.xyz, r5.xyz);
	r2.w = r0.w + c25.w;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r2.w >= 0.0) ? r0.w : c24.w);
	r4.xyz = (r4.xyz * r0.www) + -r1.yzw;
	r4.xyz = (c102.www * r4.xyz) + r1.yzw;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r4.xyz = (r4.xyz * r0.www) + -r1.yzw;
	r0.w = (r1.x * c23.z) + c23.w;
	r1.x = r1.x * r1.x;
	r0.w = r0.w * r1.x;
	r1.xyz = (r0.www * r4.xyz) + r1.yzw;
	r1.xyz = r3.zzz * r1.xyz;
	r0.xyz = (r1.xyz * r6.xyz) + r0.xyz;
	r0.xyz = (r2.xyz * r3.xyw) + r0.xyz;
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
	#undef c13
	#undef c14
	#undef c15
	#undef c16
	#undef c17
	#undef c18
	#undef c19
	#undef c20
	#undef c21
	#undef c28
	#undef c30
	#undef c33
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
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

