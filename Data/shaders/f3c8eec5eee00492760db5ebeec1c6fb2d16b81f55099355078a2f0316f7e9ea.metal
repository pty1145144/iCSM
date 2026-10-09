#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[16];
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
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
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
	const float4 c2 = float4(5.773500204e-01, 5.000000000e+00, -9.999999975e-07, 1.000000000e+06); (void) c2;
	const float4 c11 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -3.000000119e-01); (void) c11;
	const float4 c13 = float4(2.000000000e+00, -1.000000000e+00, 0.000000000e+00, 1.000000000e+00); (void) c13;
	const float4 c14 = float4(-3.333333254e+00, -2.000000000e+00, 3.000000000e+00, 0.000000000e+00); (void) c14;
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
	#define c10 uniforms.uniforms_float4[8]
	#define c12 uniforms.uniforms_float4[9]
	#define c30 uniforms.uniforms_float4[10]
	#define c101 uniforms.uniforms_float4[11]
	#define c102 uniforms.uniforms_float4[12]
	#define c103 uniforms.uniforms_float4[13]
	#define c104 uniforms.uniforms_float4[14]
	#define c107 uniforms.uniforms_float4[15]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define oC0 output.oC0
	r0.xyz = c3.xyz + -v4.xyz;
	r1.xyz = normalize(r0.xyz);
	r0 = s1_texture.sample(s1, v0.xy);
	r0.xyz = (r0.xyz * c13.xxx) + c13.yyy;
	r2.x = dot(v1.xyz, r0.xyz);
	r2.y = dot(v2.xyz, r0.xyz);
	r2.z = dot(v3.xyz, r0.xyz);
	r0.xyz = normalize(r2.xyz);
	r1.w = dot(r0.xyz, r0.xyz);
	r2.xyz = r1.xyz * r1.www;
	r1.x = dot(r1.xyz, r0.xyz);
	r1.z = r1.x + r1.x;
	r1.x = clamp(r1.x, 0.0, 1.0);
	r2.xyz = (r1.zzz * r0.xyz) + -r2.xyz;
	r2 = s6_texture.sample(s6, r2.xyz);
	r3.xyz = r2.xyz * c30.zzz;
	r4.xyz = r3.xyz * r3.xyz;
	r4.xyz = r4.xyz * r4.xyz;
	r1.z = dot(r4.xyz, c11.xyz);
	r1.w = r1.z + c2.z;
	r1.z = ((r1.z == 0.0) ? FLT_MAX : 1.0 / r1.z);
	r1.z = ((r1.w >= 0.0) ? r1.z : c2.w);
	r1.w = dot(r3.xyz, c11.xyz);
	r4.xyz = r1.www * r4.xyz;
	r2.xyz = (c30.zzz * -r2.xyz) + r1.www;
	r2.xyz = (-c103.www * r2.xyz) + r3.xyz;
	r4.xyz = (r4.xyz * r1.zzz) + -r3.xyz;
	r4.xyz = (c103.www * r4.xyz) + r3.xyz;
	r2.xyz = ((c103.w >= 0.0) ? r4.xyz : r2.xyz);
	r1.z = abs(c103.w);
	r2.xyz = ((-r1.z >= 0.0) ? r3.xyz : r2.xyz);
	r3.x = ((r0.x >= 0.0) ? c13.z : c13.w);
	r3.y = ((r0.y >= 0.0) ? c13.z : c13.w);
	r3.z = ((r0.z >= 0.0) ? c13.z : c13.w);
	r4.xyz = r0.xyz * r0.xyz;
	r0.x = ((r0.x >= 0.0) ? c13.w : c13.z);
	r0.y = ((r0.y >= 0.0) ? c13.w : c13.z);
	r0.z = ((r0.z >= 0.0) ? c13.w : c13.z);
	r0.xyz = r4.xyz * r0.xyz;
	r3.xyz = r3.xyz * r4.xyz;
	r4.xyz = r3.xxx * c5.xyz;
	r4.xyz = (r0.xxx * c4.xyz) + r4.xyz;
	r4.xyz = (r0.yyy * c6.xyz) + r4.xyz;
	r3.xyw = (r3.yyy * c7.xyz) + r4.xyz;
	r0.xyz = (r0.zzz * c8.xyz) + r3.xyw;
	r0.xyz = (r3.zzz * c9.xyz) + r0.xyz;
	r3.xyz = r0.xyz + v5.xyz;
	r0.x = dot(r0.xyz, c11.xyz);
	r0.x = r0.x + c11.w;
	r0.x = clamp(r0.x * c14.x, 0.0, 1.0);
	r4.xyz = r3.xyz + -c103.xxx;
	r4.xyz = clamp(r4.xyz * c103.yyy, float3(0.0), float3(1.0));
	r4.xyz = (r2.xyz * r4.xyz) + -r2.xyz;
	r5 = s3_texture.sample(s3, v0.xy);
	r0.y = r5.z * c101.x;
	r2.xyz = (r0.yyy * r4.xyz) + r2.xyz;
	r4.xyz = (r2.xyz * r2.xyz) + -r2.xyz;
	r2.xyz = (c103.zzz * r4.xyz) + r2.xyz;
	r0.y = r1.x * r1.x;
	r0.y = r0.y * r0.y;
	r0.z = -r5.w + c13.w;
	r1.z = r5.x * c12.w;
	r1.z = (r1.z * c0.x) + c0.y;
	r1.z = fract(r1.z);
	r1.z = (r1.z * c0.z) + c0.w;
	r4.xy = float2(cos(r1.z), sin(r1.z));
	r0.y = r0.y * r0.z;
	r5.xyz = r0.yyy * v5.xyz;
	r5.xyz = r0.www * r5.xyz;
	r5.xyz = r5.xyz * c2.yyy;
	r6 = s10_texture.sample(s10, v0.xy);
	r0.y = mix(c10.x, c10.y, r6.y);
	r5.xyz = r0.yyy * r5.xyz;
	r5.xyz = ((-r0.z >= 0.0) ? c13.zzz : r5.xyz);
	r7 = s0_texture.sample(s0, v0.xy);
	r8.xyz = r7.www * c104.xyz;
	r2.xyz = (r2.xyz * r8.xyz) + r5.xyz;
	r1.y = r6.w;
	r1 = s4_texture.sample(s4, r1.xy);
	r2.w = mix(r1.y, c13.w, r0.z);
	r0.yzw = r2.www * r2.xyz;
	r1.xyz = r7.zxy * c2.xxx;
	r1.xyz = (r7.zxy * c2.xxx) + -r1.zxy;
	r1.xyz = r4.yyy * r1.xyz;
	r1.xyz = (r7.xyz * r4.xxx) + r1.xyz;
	r1.w = -r4.x + c13.w;
	r2.x = dot(c2.xxx, r7.xyz);
	r2.x = r2.x * c2.x;
	r1.xyz = (r2.xxx * r1.www) + r1.xyz;
	r1.w = abs(c12.w);
	r1.xyz = ((-r1.w >= 0.0) ? r7.xyz : r1.xyz);
	r2.xyz = r1.xyz + c13.yyy;
	r2.xyz = (r6.yyy * r2.xyz) + c13.www;
	r0.yzw = r0.yzw * r2.xyz;
	r1.w = dot(r1.xyz, c11.xyz);
	r2.xyz = r1.www * c102.xyz;
	r4.xyz = c11.xyz;
	r1.w = dot(c102.xyz, r4.xyz);
	r2.w = r1.w + c2.z;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = ((r2.w >= 0.0) ? r1.w : c2.w);
	r2.xyz = (r2.xyz * r1.www) + -r1.xyz;
	r2.xyz = (c102.www * r2.xyz) + r1.xyz;
	r1.w = clamp(c107.w + v5.w, 0.0, 1.0);
	r2.xyz = (r2.xyz * r1.www) + -r1.xyz;
	r1.w = (r0.x * c14.y) + c14.z;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r1.w;
	r1.xyz = (r0.xxx * r2.xyz) + r1.xyz;
	r1.xyz = r6.zzz * r1.xyz;
	r0.xyz = (r1.xyz * r3.xyz) + r0.yzw;
	r0.xyz = r0.xyz * c1.xyz;
	oC0.xyz = r0.xyz * c30.xxx;
	oC0.w = c1.w;
	#undef c1
	#undef c3
	#undef c4
	#undef c5
	#undef c6
	#undef c7
	#undef c8
	#undef c9
	#undef c10
	#undef c12
	#undef c30
	#undef c101
	#undef c102
	#undef c103
	#undef c104
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

