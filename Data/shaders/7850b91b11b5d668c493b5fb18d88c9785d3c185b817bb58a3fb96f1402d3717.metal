#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[24];
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
	texture2d<float> s10_texture [[texture(10)]],
	sampler s10 [[sampler(10)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(2.000000000e+00, -1.000000000e+00, 0.000000000e+00, 1.000000000e+00); (void) c0;
	const float4 c2 = float4(5.000000000e-01, 1.591549367e-01, 6.283185482e+00, -3.141592741e+00); (void) c2;
	const float4 c13 = float4(5.773500204e-01, 5.000000000e+00, -9.999999975e-07, 1.000000000e+06); (void) c13;
	const float4 c14 = float4(-3.333333254e+00, -2.000000000e+00, 3.000000000e+00, 0.000000000e+00); (void) c14;
	const float4 c15 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -3.000000119e-01); (void) c15;
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
	#define c30 uniforms.uniforms_float4[16]
	#define c101 uniforms.uniforms_float4[17]
	#define c102 uniforms.uniforms_float4[18]
	#define c103 uniforms.uniforms_float4[19]
	#define c104 uniforms.uniforms_float4[20]
	#define c105 uniforms.uniforms_float4[21]
	#define c106 uniforms.uniforms_float4[22]
	#define c107 uniforms.uniforms_float4[23]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define oC0 output.oC0
	r0.x = c19.y + -v5.z;
	r0.x = r0.x + -c0.x;
	oC0.w = clamp(r0.x * c19.w, 0.0, 1.0);
	r0.x = abs(c103.w);
	r1 = s1_texture.sample(s1, v0.xy);
	r0.yzw = (r1.xyz * c0.xxx) + c0.yyy;
	r1.x = dot(v2.xyz, r0.yzw);
	r1.y = dot(v3.xyz, r0.yzw);
	r1.z = dot(v4.xyz, r0.yzw);
	r2.xyz = normalize(r1.xyz);
	r0.y = dot(r2.xyz, r2.xyz);
	r1.xyz = c3.xyz + -v5.xyz;
	r0.z = dot(r1.xyz, r1.xyz);
	r0.z = ((r0.z == 0.0) ? FLT_MAX : rsqrt(abs(r0.z)));
	r3.xyz = r0.zzz * r1.xyz;
	r4.xyz = r0.yyy * r3.xyz;
	r5.z = dot(r3.xyz, r2.xyz);
	r0.y = r5.z + r5.z;
	r5.z = clamp(r5.z, 0.0, 1.0);
	r4.xyz = (r0.yyy * r2.xyz) + -r4.xyz;
	r4 = s6_texture.sample(s6, r4.xyz);
	r6.xyz = r4.xyz * c30.zzz;
	r7.xyz = r6.xyz * r6.xyz;
	r7.xyz = r7.xyz * r7.xyz;
	r0.y = dot(r7.xyz, c15.xyz);
	r0.w = r0.y + c13.z;
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r0.y = ((r0.w >= 0.0) ? r0.y : c13.w);
	r0.w = dot(r6.xyz, c15.xyz);
	r7.xyz = r0.www * r7.xyz;
	r4.xyz = (c30.zzz * -r4.xyz) + r0.www;
	r4.xyz = (-c103.www * r4.xyz) + r6.xyz;
	r7.xyz = (r7.xyz * r0.yyy) + -r6.xyz;
	r7.xyz = (c103.www * r7.xyz) + r6.xyz;
	r4.xyz = ((c103.w >= 0.0) ? r7.xyz : r4.xyz);
	r0.xyw = ((-r0.x >= 0.0) ? r6.xyz : r4.xyz);
	r4.x = ((r2.x >= 0.0) ? c0.z : c0.w);
	r4.y = ((r2.y >= 0.0) ? c0.z : c0.w);
	r4.z = ((r2.z >= 0.0) ? c0.z : c0.w);
	r6.xyz = r2.xyz * r2.xyz;
	r4.xyz = r4.xyz * r6.xyz;
	r7.xyz = r4.xxx * c5.xyz;
	r8.x = ((r2.x >= 0.0) ? c0.w : c0.z);
	r8.y = ((r2.y >= 0.0) ? c0.w : c0.z);
	r8.z = ((r2.z >= 0.0) ? c0.w : c0.z);
	r6.xyz = r6.xyz * r8.xyz;
	r7.xyz = (r6.xxx * c4.xyz) + r7.xyz;
	r6.xyw = (r6.yyy * c6.xyz) + r7.xyz;
	r4.xyw = (r4.yyy * c7.xyz) + r6.xyw;
	r4.xyw = (r6.zzz * c8.xyz) + r4.xyw;
	r4.xyz = (r4.zzz * c9.xyz) + r4.xyw;
	r6.xyz = c21.xyz + -v5.xyz;
	r7.xyz = normalize(r6.xyz);
	r2.w = clamp(dot(r2.xyz, r7.xyz), 0.0, 1.0);
	r3.w = (r2.w * r2.w) + r2.w;
	r3.w = r3.w * c2.x;
	r6.xyz = c20.xyz * v1.xxx;
	r4.xyz = (r6.xyz * r3.www) + r4.xyz;
	r8.xyz = c23.xyz + -v5.xyz;
	r9.xyz = normalize(r8.xyz);
	r3.w = clamp(dot(r2.xyz, r9.xyz), 0.0, 1.0);
	r4.w = (r3.w * r3.w) + r3.w;
	r4.w = r4.w * c2.x;
	r8.xyz = c22.xyz * v1.yyy;
	r4.xyz = (r8.xyz * r4.www) + r4.xyz;
	r10.xyz = r4.xyz + v6.xyz;
	r11.xyz = r10.xyz + -c103.xxx;
	r11.xyz = clamp(r11.xyz * c103.yyy, float3(0.0), float3(1.0));
	r11.xyz = (r0.xyw * r11.xyz) + -r0.xyw;
	r12 = s3_texture.sample(s3, v0.xy);
	r4.w = r12.z * c101.x;
	r0.xyw = (r4.www * r11.xyz) + r0.xyw;
	r11.xyz = (r0.xyw * r0.xyw) + -r0.xyw;
	r0.xyw = (c103.zzz * r11.xyz) + r0.xyw;
	r11 = s0_texture.sample(s0, v0.xy);
	r13.xyz = r11.www * c104.xyz;
	r0.xyw = r0.xyw * r13.xyz;
	r4.w = clamp(dot(r3.xyz, r7.xyz), 0.0, 1.0);
	r7.xyz = (r1.xyz * r0.zzz) + r7.xyz;
	r1.xyz = (r1.xyz * r0.zzz) + r9.xyz;
	r0.z = clamp(dot(r3.xyz, r9.xyz), 0.0, 1.0);
	r3.xyz = normalize(r1.xyz);
	r5.x = clamp(dot(r2.xyz, r3.xyz), 0.0, 1.0);
	r1.xyz = normalize(r7.xyz);
	r5.y = clamp(dot(r2.xyz, r1.xyz), 0.0, 1.0);
	r1.x = r5.z * r5.z;
	r7.w = r1.x * r1.x;
	r1.x = -r12.w + c0.w;
	r1.y = r12.x * c12.w;
	r1.y = (r1.y * c2.y) + c2.x;
	r1.y = fract(r1.y);
	r1.y = (r1.y * c2.z) + c2.w;
	r9.xy = float2(cos(r1.y), sin(r1.y));
	r1.y = r7.w * r1.x;
	r2.xyz = r1.yyy * v6.xyz;
	r7.xyz = r2.xyz * c13.yyy;
	r7 = ((-r1.x >= 0.0) ? c0.zzzz : r7);
	r1.y = r4.w * r7.w;
	r12 = s10_texture.sample(s10, v0.xy);
	r5.w = r12.w;
	r13 = s7_texture.sample(s7, r5.yw);
	r1.z = r2.w * r5.y;
	r2.x = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r2.x = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r2.yzw = (r1.yyy * c13.yyy) + -r13.xyz;
	r2.yzw = (r1.xxx * r2.yzw) + r13.xyz;
	r2.yzw = ((-r1.x >= 0.0) ? r13.xyz : r2.yzw);
	r2.yzw = r2.xxx * r2.yzw;
	r2.yzw = (r2.yzw * r6.xyz) + r7.xyz;
	r0.z = r0.z * r7.w;
	r7 = s7_texture.sample(s7, r5.xw);
	r1.y = r3.w * r5.x;
	r3.x = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r3.x = ((r3.x == 0.0) ? FLT_MAX : 1.0 / r3.x);
	r13 = s4_texture.sample(s4, r5.zw);
	r3.y = -r5.z + c0.w;
	r4.w = pow(abs(r3.y), c105.x);
	r3.y = mix(r13.y, c0.w, r1.x);
	r5.xyz = (r0.zzz * c13.yyy) + -r7.xyz;
	r5.xyz = (r1.xxx * r5.xyz) + r7.xyz;
	r5.xyz = ((-r1.x >= 0.0) ? r7.xyz : r5.xyz);
	r5.xyz = r3.xxx * r5.xyz;
	r2.yzw = (r5.xyz * r8.xyz) + r2.yzw;
	r2.yzw = r1.www * r2.yzw;
	r0.z = mix(c10.x, c10.y, r12.y);
	r0.xyz = (r2.yzw * r0.zzz) + r0.xyw;
	r0.xyz = r3.yyy * r0.xyz;
	r2.yzw = r11.zxy * c13.xxx;
	r2.yzw = (r11.zxy * c13.xxx) + -r2.wyz;
	r2.yzw = r9.yyy * r2.yzw;
	r2.yzw = (r11.xyz * r9.xxx) + r2.yzw;
	r0.w = -r9.x + c0.w;
	r1.x = dot(c13.xxx, r11.xyz);
	r1.x = r1.x * c13.x;
	r2.yzw = (r1.xxx * r0.www) + r2.yzw;
	r0.w = abs(c12.w);
	r2.yzw = ((-r0.w >= 0.0) ? r11.xyz : r2.yzw);
	r3.yzw = r2.yzw + c0.yyy;
	r3.yzw = (r12.yyy * r3.yzw) + c0.www;
	r0.xyz = r0.xyz * r3.yzw;
	r5.xyz = c15.xyz;
	r0.w = dot(c102.xyz, r5.xyz);
	r1.x = r0.w + c13.z;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r1.x >= 0.0) ? r0.w : c13.w);
	r1.x = dot(r2.yzw, c15.xyz);
	r3.yzw = r1.xxx * c102.xyz;
	r3.yzw = (r3.yzw * r0.www) + -r2.yzw;
	r3.yzw = (c102.www * r3.yzw) + r2.yzw;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r3.yzw = (r3.yzw * r0.www) + -r2.yzw;
	r0.w = r1.y * r4.w;
	r1.x = r1.z * r4.w;
	r1.x = r2.x * r1.x;
	r0.w = r3.x * r0.w;
	r1.yzw = r8.xyz * r0.www;
	r1.xyz = (r1.xxx * r6.xyz) + r1.yzw;
	r0.w = c0.w;
	r0.w = (v6.w * c11.w) + r0.w;
	r1.w = r12.x * c105.y;
	r0.w = r0.w * r1.w;
	r1.xyz = r0.www * r1.xyz;
	r0.w = r12.y * c101.w;
	r5.xyz = (r2.yzw * r0.www) + -c106.xyz;
	r0.w = clamp(r0.w, 0.0, 1.0);
	r5.xyz = (r0.www * r5.xyz) + c106.xyz;
	r4.xyz = (r1.xyz * r5.xyz) + r4.xyz;
	r0.w = dot(r4.xyz, c15.xyz);
	r0.w = r0.w + c15.w;
	r0.w = clamp(r0.w * c14.x, 0.0, 1.0);
	r1.w = (r0.w * c14.y) + c14.z;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.w;
	r2.xyz = (r0.www * r3.yzw) + r2.yzw;
	r2.xyz = r12.zzz * r2.xyz;
	r0.xyz = (r2.xyz * r10.xyz) + r0.xyz;
	r0.xyz = (r1.xyz * r5.xyz) + r0.xyz;
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
	#undef c30
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

