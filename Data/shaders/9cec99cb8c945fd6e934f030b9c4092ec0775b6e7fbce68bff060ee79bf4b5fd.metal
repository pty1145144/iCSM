#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[17];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord2)]];
	float4 v2 [[user(texcoord3)]];
	float4 v3 [[user(texcoord4)]];
	float4 v4 [[user(texcoord5)]];
	float4 v5 [[user(texcoord6)]];
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
	texture2d<float> s10_texture [[texture(10)]],
	sampler s10 [[sampler(10)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(1.591549367e-01, 5.000000000e-01, 6.283185482e+00, -3.141592741e+00); (void) c0;
	const float4 c2 = float4(5.773500204e-01, 1.000000000e+00, 2.000000000e+00, -1.000000000e+00); (void) c2;
	const float4 c10 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -3.000000119e-01); (void) c10;
	const float4 c11 = float4(-3.333333254e+00, -2.000000000e+00, 3.000000000e+00, 0.000000000e+00); (void) c11;
	const float4 c13 = float4(0.000000000e+00, 1.000000000e+00, -9.999999975e-07, 1.000000000e+06); (void) c13;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	float4 r7;
	float4 r8;
	#define c1 uniforms.uniforms_float4[0]
	#define c3 uniforms.uniforms_float4[1]
	#define c4 uniforms.uniforms_float4[2]
	#define c5 uniforms.uniforms_float4[3]
	#define c6 uniforms.uniforms_float4[4]
	#define c7 uniforms.uniforms_float4[5]
	#define c8 uniforms.uniforms_float4[6]
	#define c9 uniforms.uniforms_float4[7]
	#define c12 uniforms.uniforms_float4[8]
	#define c19 uniforms.uniforms_float4[9]
	#define c30 uniforms.uniforms_float4[10]
	#define c101 uniforms.uniforms_float4[11]
	#define c102 uniforms.uniforms_float4[12]
	#define c103 uniforms.uniforms_float4[13]
	#define c104 uniforms.uniforms_float4[14]
	#define c105 uniforms.uniforms_float4[15]
	#define c107 uniforms.uniforms_float4[16]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define oC0 output.oC0
	r0.x = c19.y + -v4.z;
	r0.x = r0.x + -c2.z;
	oC0.w = clamp(r0.x * c19.w, 0.0, 1.0);
	r0.xyz = c3.xyz + -v4.xyz;
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r1.xyz = r0.www * r0.xyz;
	r2 = s1_texture.sample(s1, v0.xy);
	r2.xyz = (r2.xyz * c2.zzz) + c2.www;
	r3.xyz = r2.www * c104.xyz;
	r4.x = dot(v1.xyz, r2.xyz);
	r4.y = dot(v2.xyz, r2.xyz);
	r4.z = dot(v3.xyz, r2.xyz);
	r2.xyz = normalize(r4.xyz);
	r1.w = dot(r2.xyz, r2.xyz);
	r4.xyz = r1.xyz * r1.www;
	r1.x = dot(r1.xyz, r2.xyz);
	r1.z = r1.x + r1.x;
	r1.x = clamp(r1.x, 0.0, 1.0);
	r4.xyz = (r1.zzz * r2.xyz) + -r4.xyz;
	r4 = s6_texture.sample(s6, r4.xyz);
	r5.xyz = r4.xyz * c30.zzz;
	r6.xyz = r5.xyz * r5.xyz;
	r6.xyz = r6.xyz * r6.xyz;
	r1.z = dot(r6.xyz, c10.xyz);
	r1.w = r1.z + c13.z;
	r1.z = ((r1.z == 0.0) ? FLT_MAX : 1.0 / r1.z);
	r1.z = ((r1.w >= 0.0) ? r1.z : c13.w);
	r1.w = dot(r5.xyz, c10.xyz);
	r6.xyz = r1.www * r6.xyz;
	r4.xyz = (c30.zzz * -r4.xyz) + r1.www;
	r4.xyz = (-c103.www * r4.xyz) + r5.xyz;
	r6.xyz = (r6.xyz * r1.zzz) + -r5.xyz;
	r6.xyz = (c103.www * r6.xyz) + r5.xyz;
	r4.xyz = ((c103.w >= 0.0) ? r6.xyz : r4.xyz);
	r1.z = abs(c103.w);
	r4.xyz = ((-r1.z >= 0.0) ? r5.xyz : r4.xyz);
	r5.x = ((r2.x >= 0.0) ? c13.x : c13.y);
	r5.y = ((r2.y >= 0.0) ? c13.x : c13.y);
	r5.z = ((r2.z >= 0.0) ? c13.x : c13.y);
	r6.xyz = r2.xyz * r2.xyz;
	r5.xyz = r5.xyz * r6.xyz;
	r7.xyz = r5.xxx * c5.xyz;
	r8.x = ((r2.x >= 0.0) ? c13.y : c13.x);
	r8.y = ((r2.y >= 0.0) ? c13.y : c13.x);
	r8.z = ((r2.z >= 0.0) ? c13.y : c13.x);
	r6.xyz = r6.xyz * r8.xyz;
	r7.xyz = (r6.xxx * c4.xyz) + r7.xyz;
	r6.xyw = (r6.yyy * c6.xyz) + r7.xyz;
	r5.xyw = (r5.yyy * c7.xyz) + r6.xyw;
	r5.xyw = (r6.zzz * c8.xyz) + r5.xyw;
	r5.xyz = (r5.zzz * c9.xyz) + r5.xyw;
	r6.xyz = r5.xyz + v5.xyz;
	r1.z = dot(r5.xyz, c10.xyz);
	r1.z = r1.z + c10.w;
	r1.z = clamp(r1.z * c11.x, 0.0, 1.0);
	r5.xyz = r6.xyz + -c103.xxx;
	r5.xyz = clamp(r5.xyz * c103.yyy, float3(0.0), float3(1.0));
	r5.xyz = (r4.xyz * r5.xyz) + -r4.xyz;
	r4.xyz = (c101.xxx * r5.xyz) + r4.xyz;
	r5.xyz = (r4.xyz * r4.xyz) + -r4.xyz;
	r4.xyz = (c103.zzz * r5.xyz) + r4.xyz;
	r3.xyz = r3.xyz * r4.xyz;
	r4 = s10_texture.sample(s10, v0.xy);
	r1.y = r4.w;
	r5 = s4_texture.sample(s4, r1.xy);
	r1.x = -r1.x + c2.y;
	r2.w = pow(abs(r1.x), c105.x);
	r1.xyw = r3.xyz * r5.yyy;
	r3.xy = c0.xy;
	r3.x = (c12.w * r3.x) + r3.y;
	r3.x = fract(r3.x);
	r3.x = (r3.x * c0.z) + c0.w;
	r5.xy = float2(cos(r3.x), sin(r3.x));
	r3 = s0_texture.sample(s0, v0.xy);
	r7.xyz = r3.zxy * c2.xxx;
	r7.xyz = (r3.zxy * c2.xxx) + -r7.zxy;
	r5.yzw = r5.yyy * r7.xyz;
	r5.yzw = (r3.xyz * r5.xxx) + r5.yzw;
	r3.w = -r5.x + c2.y;
	r4.w = dot(c2.xxx, r3.xyz);
	r4.w = r4.w * c2.x;
	r5.xyz = (r4.www * r3.www) + r5.yzw;
	r3.w = abs(c12.w);
	r3.xyz = ((-r3.w >= 0.0) ? r3.xyz : r5.xyz);
	r5.xyz = r3.xyz + c2.www;
	r5.xyz = (r4.yyy * r5.xyz) + c2.yyy;
	r1.xyw = r1.xyw * r5.xyz;
	r5.xyz = c10.xyz;
	r3.w = dot(c102.xyz, r5.xyz);
	r4.y = r3.w + c13.z;
	r3.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
	r3.w = ((r4.y >= 0.0) ? r3.w : c13.w);
	r4.y = dot(r3.xyz, c10.xyz);
	r5.xyz = r4.yyy * c102.xyz;
	r5.xyz = (r5.xyz * r3.www) + -r3.xyz;
	r5.xyz = (c102.www * r5.xyz) + r3.xyz;
	r3.w = clamp(c107.w + v5.w, 0.0, 1.0);
	r5.xyz = (r5.xyz * r3.www) + -r3.xyz;
	r3.w = (r1.z * c11.y) + c11.z;
	r1.z = r1.z * r1.z;
	r1.z = r1.z * r3.w;
	r3.xyz = (r1.zzz * r5.xyz) + r3.xyz;
	r3.xyz = r4.zzz * r3.xyz;
	r1.xyz = (r3.xyz * r6.xyz) + r1.xyw;
	r3.x = v1.w;
	r3.y = v2.w;
	r3.z = v3.w;
	r0.xyz = (r0.xyz * r0.www) + r3.xyz;
	r0.w = clamp(dot(r2.xyz, r3.xyz), 0.0, 1.0);
	r3.xyz = normalize(r0.xyz);
	r0.x = clamp(dot(r2.xyz, r3.xyz), 0.0, 1.0);
	r0.x = r0.w * r0.x;
	r0.y = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r0.x = r2.w * r0.x;
	r0.x = r0.y * r0.x;
	r0.yzw = v5.www * v5.xyz;
	r0.yzw = r0.yzw * c107.xyz;
	r0.xyz = r0.yzw * r0.xxx;
	r0.xyz = (r0.xyz * r4.xxx) + r1.xyz;
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
	#undef c12
	#undef c19
	#undef c30
	#undef c101
	#undef c102
	#undef c103
	#undef c104
	#undef c105
	#undef c107
	#undef v0
	#undef v1
	#undef v2
	#undef v3
	#undef v4
	#undef v5
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

