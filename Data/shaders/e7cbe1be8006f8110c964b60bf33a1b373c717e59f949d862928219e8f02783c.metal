#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[22];
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
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c2 = float4(1.591549367e-01, 5.000000000e-01, 6.283185482e+00, -3.141592741e+00); (void) c2;
	const float4 c13 = float4(5.773500204e-01, 1.000000000e+00, 2.000000000e+00, -1.000000000e+00); (void) c13;
	const float4 c14 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -3.000000119e-01); (void) c14;
	const float4 c15 = float4(-3.333333254e+00, -2.000000000e+00, 3.000000000e+00, 0.000000000e+00); (void) c15;
	const float4 c16 = float4(0.000000000e+00, 1.000000000e+00, -9.999999975e-07, 1.000000000e+06); (void) c16;
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
	#define c30 uniforms.uniforms_float4[14]
	#define c101 uniforms.uniforms_float4[15]
	#define c102 uniforms.uniforms_float4[16]
	#define c103 uniforms.uniforms_float4[17]
	#define c104 uniforms.uniforms_float4[18]
	#define c105 uniforms.uniforms_float4[19]
	#define c106 uniforms.uniforms_float4[20]
	#define c107 uniforms.uniforms_float4[21]
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
	r0.xyz = c3.xyz + -v5.xyz;
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r1.xyz = r0.www * r0.xyz;
	r2 = s1_texture.sample(s1, v0.xy);
	r2.xyz = (r2.xyz * c13.zzz) + c13.www;
	r3.x = dot(v2.xyz, r2.xyz);
	r3.y = dot(v3.xyz, r2.xyz);
	r3.z = dot(v4.xyz, r2.xyz);
	r2.xyz = normalize(r3.xyz);
	r1.w = dot(r2.xyz, r2.xyz);
	r3.xyz = r1.xyz * r1.www;
	r1.x = dot(r2.xyz, r1.xyz);
	r1.y = r1.x + r1.x;
	r1.x = clamp(r1.x, 0.0, 1.0);
	r1.x = -r1.x + c13.y;
	r1.yzw = (r1.yyy * r2.xyz) + -r3.xyz;
	r3 = s6_texture.sample(s6, r1.yzw);
	r4.xyz = r3.xyz * c30.zzz;
	r5.xyz = r4.xyz * r4.xyz;
	r5.xyz = r5.xyz * r5.xyz;
	r3.w = dot(r5.xyz, c14.xyz);
	r4.w = r3.w + c16.z;
	r3.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r3.w = ((r4.w >= 0.0) ? r3.w : c16.w);
	r4.w = dot(r4.xyz, c14.xyz);
	r5.xyz = r4.www * r5.xyz;
	r3.xyz = (c30.zzz * -r3.xyz) + r4.www;
	r3.xyz = (-c103.www * r3.xyz) + r4.xyz;
	r5.xyz = (r5.xyz * r3.www) + -r4.xyz;
	r5.xyz = (c103.www * r5.xyz) + r4.xyz;
	r3.xyz = ((c103.w >= 0.0) ? r5.xyz : r3.xyz);
	r3.w = abs(c103.w);
	r3.xyz = ((-r3.w >= 0.0) ? r4.xyz : r3.xyz);
	r4.x = ((r2.x >= 0.0) ? c16.x : c16.y);
	r4.y = ((r2.y >= 0.0) ? c16.x : c16.y);
	r4.z = ((r2.z >= 0.0) ? c16.x : c16.y);
	r5.xyz = r2.xyz * r2.xyz;
	r4.xyz = r4.xyz * r5.xyz;
	r6.xyz = r4.xxx * c5.xyz;
	r7.x = ((r2.x >= 0.0) ? c16.y : c16.x);
	r7.y = ((r2.y >= 0.0) ? c16.y : c16.x);
	r7.z = ((r2.z >= 0.0) ? c16.y : c16.x);
	r5.xyz = r5.xyz * r7.xyz;
	r6.xyz = (r5.xxx * c4.xyz) + r6.xyz;
	r5.xyw = (r5.yyy * c6.xyz) + r6.xyz;
	r4.xyw = (r4.yyy * c7.xyz) + r5.xyw;
	r4.xyw = (r5.zzz * c8.xyz) + r4.xyw;
	r4.xyz = (r4.zzz * c9.xyz) + r4.xyw;
	r5.xyz = c21.xyz + -v5.xyz;
	r6.xyz = normalize(r5.xyz);
	r3.w = clamp(dot(r2.xyz, r6.xyz), 0.0, 1.0);
	r4.w = (r3.w * r3.w) + r3.w;
	r4.w = r4.w * c2.y;
	r5.xyz = c20.xyz * v1.xxx;
	r4.xyz = (r5.xyz * r4.www) + r4.xyz;
	r7.xyz = r4.xyz + v6.xyz;
	r8.xyz = r7.xyz + -c103.xxx;
	r8.xyz = clamp(r8.xyz * c103.yyy, float3(0.0), float3(1.0));
	r8.xyz = (r3.xyz * r8.xyz) + -r3.xyz;
	r3.xyz = (c101.xxx * r8.xyz) + r3.xyz;
	r8.xyz = (r3.xyz * r3.xyz) + -r3.xyz;
	r3.xyz = (c103.zzz * r8.xyz) + r3.xyz;
	r8 = s0_texture.sample(s0, v0.xy);
	r9.xyz = r8.www * c104.xyz;
	r3.xyz = r3.xyz * r9.xyz;
	r0.xyz = (r0.xyz * r0.www) + r6.xyz;
	r0.w = clamp(r6.z, 0.0, 1.0);
	r0.w = (r0.w * r0.w) + r0.w;
	r0.w = r0.w * c2.y;
	r6.xyz = r0.www * r5.xyz;
	r9.xyz = normalize(r0.xyz);
	r0.x = clamp(dot(r2.xyz, r9.xyz), 0.0, 1.0);
	r0.y = clamp(dot(r2.xyz, v9.xyz), 0.0, 1.0);
	r2.x = pow(abs(r0.x), c10.z);
	r0.x = r3.w * r0.x;
	r0.z = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r0.z = ((r0.z == 0.0) ? FLT_MAX : 1.0 / r0.z);
	r0.w = r0.z * r2.x;
	r2.xyz = r5.xyz * r0.www;
	r2.xyz = r2.www * r2.xyz;
	r2.xyz = (r2.xyz * c10.xxx) + r3.xyz;
	r3.x = ((r1.y >= 0.0) ? c16.x : c16.y);
	r3.y = ((r1.z >= 0.0) ? c16.x : c16.y);
	r3.z = ((r1.w >= 0.0) ? c16.x : c16.y);
	r9.xyz = r1.yzw * r1.yzw;
	r1.y = ((r1.y >= 0.0) ? c16.y : c16.x);
	r1.z = ((r1.z >= 0.0) ? c16.y : c16.x);
	r1.w = ((r1.w >= 0.0) ? c16.y : c16.x);
	r1.yzw = r9.xyz * r1.yzw;
	r3.xyz = r3.xyz * r9.xyz;
	r9.xyz = r3.xxx * c5.xyz;
	r9.xyz = (r1.yyy * c4.xyz) + r9.xyz;
	r9.xyz = (r1.zzz * c6.xyz) + r9.xyz;
	r3.xyw = (r3.yyy * c7.xyz) + r9.xyz;
	r1.yzw = (r1.www * c8.xyz) + r3.xyw;
	r1.yzw = (r3.zzz * c9.xyz) + r1.yzw;
	r1.yzw = r6.xyz * r1.yzw;
	r3.x = v7.w;
	r3.y = v8.w;
	r3.z = v9.w;
	r3.xyz = -r3.xyz + c21.xyz;
	r6.xyz = normalize(r3.xyz);
	r0.w = clamp(dot(-v9.xyz, r6.xyz), 0.0, 1.0);
	r0.w = (r0.w * r0.w) + r0.w;
	r0.w = r0.w * c2.y;
	r3.xyz = r0.www * r5.xyz;
	r6.xyz = c0.xyz * v6.xyz;
	r3.xyz = (r6.xyz * r3.xyz) + -r1.yzw;
	r1.yzw = (r0.yyy * r3.xyz) + r1.yzw;
	r0.y = (r1.x * -r1.x) + c2.y;
	r0.w = r1.x * r1.x;
	r2.w = pow(abs(r1.x), c105.x);
	r0.x = r0.x * r2.w;
	r0.x = r0.z * r0.x;
	r3.xyz = r5.xyz * r0.xxx;
	r0.x = r0.w + r0.w;
	r0.z = (r0.w * c13.z) + c13.w;
	r1.x = mix(c12.y, c12.z, r0.z);
	r0.z = -c12.x + c12.y;
	r0.x = (r0.x * r0.z) + c12.x;
	r0.x = ((r0.y >= 0.0) ? r0.x : r1.x);
	r0.y = r0.x * c0.w;
	r0.yzw = r0.yyy * r1.yzw;
	r0.xyz = (r2.xyz * r0.xxx) + r0.yzw;
	r1.xyz = r8.zxy * c13.xxx;
	r1.xyz = (r8.zxy * c13.xxx) + -r1.zxy;
	r2.xy = c2.xy;
	r0.w = (c12.w * r2.x) + r2.y;
	r0.w = fract(r0.w);
	r0.w = (r0.w * c2.z) + c2.w;
	r2.xy = float2(cos(r0.w), sin(r0.w));
	r1.xyz = r1.xyz * r2.yyy;
	r1.xyz = (r8.xyz * r2.xxx) + r1.xyz;
	r0.w = -r2.x + c13.y;
	r1.w = dot(c13.xxx, r8.xyz);
	r1.w = r1.w * c13.x;
	r1.xyz = (r1.www * r0.www) + r1.xyz;
	r0.w = abs(c12.w);
	r1.xyz = ((-r0.w >= 0.0) ? r8.xyz : r1.xyz);
	r0.w = dot(r1.xyz, c14.xyz);
	r2.xyz = r0.www * c102.xyz;
	r5.xyz = c14.xyz;
	r0.w = dot(c102.xyz, r5.xyz);
	r1.w = r0.w + c16.z;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r1.w >= 0.0) ? r0.w : c16.w);
	r2.xyz = (r2.xyz * r0.www) + -r1.xyz;
	r2.xyz = (c102.www * r2.xyz) + r1.xyz;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r2.xyz = (r2.xyz * r0.www) + -r1.xyz;
	r5.y = c13.y;
	r0.w = (v6.w * c11.w) + r5.y;
	r0.w = r0.w * c105.y;
	r3.xyz = r0.www * r3.xyz;
	r0.w = c101.w;
	r5.xyz = (r1.xyz * r0.www) + -c106.xyz;
	r0.w = clamp(c101.w, 0.0, 1.0);
	r5.xyz = (r0.www * r5.xyz) + c106.xyz;
	r4.xyz = (r3.xyz * r5.xyz) + r4.xyz;
	r0.w = dot(r4.xyz, c14.xyz);
	r0.w = r0.w + c14.w;
	r0.w = clamp(r0.w * c15.x, 0.0, 1.0);
	r1.w = (r0.w * c15.y) + c15.z;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.w;
	r1.xyz = (r0.www * r2.xyz) + r1.xyz;
	r1.xyz = r1.xyz * c101.zzz;
	r0.xyz = (r1.xyz * r7.xyz) + r0.xyz;
	r0.xyz = (r3.xyz * r5.xyz) + r0.xyz;
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

