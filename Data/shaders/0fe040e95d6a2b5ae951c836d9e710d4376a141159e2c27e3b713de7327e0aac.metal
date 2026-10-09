#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[11];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord2)]];
	float4 v2 [[user(texcoord3)]];
	float4 v3 [[user(texcoord4)]];
	float4 v4 [[user(texcoord6)]];
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
	texture2d<float> s10_texture [[texture(10)]],
	sampler s10 [[sampler(10)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(1.591549367e-01, 5.000000000e-01, 6.283185482e+00, -3.141592741e+00); (void) c0;
	const float4 c2 = float4(5.773500204e-01, 1.000000000e+00, 2.000000000e+00, -1.000000000e+00); (void) c2;
	const float4 c3 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -9.999999975e-07); (void) c3;
	const float4 c10 = float4(-2.000000000e+00, 3.000000000e+00, 1.000000000e+06, 0.000000000e+00); (void) c10;
	const float4 c11 = float4(0.000000000e+00, 1.000000000e+00, -3.000000119e-01, -3.333333254e+00); (void) c11;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	#define c1 uniforms.uniforms_float4[0]
	#define c4 uniforms.uniforms_float4[1]
	#define c5 uniforms.uniforms_float4[2]
	#define c6 uniforms.uniforms_float4[3]
	#define c7 uniforms.uniforms_float4[4]
	#define c8 uniforms.uniforms_float4[5]
	#define c9 uniforms.uniforms_float4[6]
	#define c12 uniforms.uniforms_float4[7]
	#define c30 uniforms.uniforms_float4[8]
	#define c102 uniforms.uniforms_float4[9]
	#define c107 uniforms.uniforms_float4[10]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define oC0 output.oC0
	r0.xyz = c3.xyz;
	r0.x = dot(c102.xyz, r0.xyz);
	r0.y = r0.x + c3.w;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = ((r0.y >= 0.0) ? r0.x : c10.z);
	r1.xy = c0.xy;
	r0.y = (c12.w * r1.x) + r1.y;
	r0.y = fract(r0.y);
	r0.y = (r0.y * c0.z) + c0.w;
	r1.xy = float2(cos(r0.y), sin(r0.y));
	r2 = s0_texture.sample(s0, v0.xy);
	r0.yzw = r2.zxy * c2.xxx;
	r0.yzw = (r2.zxy * c2.xxx) + -r0.wyz;
	r0.yzw = r1.yyy * r0.yzw;
	r0.yzw = (r2.xyz * r1.xxx) + r0.yzw;
	r1.x = -r1.x + c2.y;
	r1.y = dot(c2.xxx, r2.xyz);
	r1.y = r1.y * c2.x;
	r0.yzw = (r1.yyy * r1.xxx) + r0.yzw;
	r1.x = abs(c12.w);
	r0.yzw = ((-r1.x >= 0.0) ? r2.xyz : r0.yzw);
	r1.x = dot(r0.yzw, c3.xyz);
	r1.xyz = r1.xxx * c102.xyz;
	r1.xyz = (r1.xyz * r0.xxx) + -r0.yzw;
	r1.xyz = (c102.www * r1.xyz) + r0.yzw;
	r0.x = clamp(c107.w + v4.w, 0.0, 1.0);
	r1.xyz = (r1.xyz * r0.xxx) + -r0.yzw;
	r2 = s1_texture.sample(s1, v0.xy);
	r2.xyz = (r2.xyz * c2.zzz) + c2.www;
	r3.x = dot(v1.xyz, r2.xyz);
	r3.y = dot(v2.xyz, r2.xyz);
	r3.z = dot(v3.xyz, r2.xyz);
	r2.xyz = normalize(r3.xyz);
	r3.x = ((r2.x >= 0.0) ? c11.x : c11.y);
	r3.y = ((r2.y >= 0.0) ? c11.x : c11.y);
	r3.z = ((r2.z >= 0.0) ? c11.x : c11.y);
	r4.xyz = r2.xyz * r2.xyz;
	r2.x = ((r2.x >= 0.0) ? c11.y : c11.x);
	r2.y = ((r2.y >= 0.0) ? c11.y : c11.x);
	r2.z = ((r2.z >= 0.0) ? c11.y : c11.x);
	r2.xyz = r4.xyz * r2.xyz;
	r3.xyz = r3.xyz * r4.xyz;
	r4.xyz = r3.xxx * c5.xyz;
	r4.xyz = (r2.xxx * c4.xyz) + r4.xyz;
	r2.xyw = (r2.yyy * c6.xyz) + r4.xyz;
	r2.xyw = (r3.yyy * c7.xyz) + r2.xyw;
	r2.xyz = (r2.zzz * c8.xyz) + r2.xyw;
	r2.xyz = (r3.zzz * c9.xyz) + r2.xyz;
	r0.x = dot(r2.xyz, c3.xyz);
	r2.xyz = r2.xyz + v4.xyz;
	r0.x = r0.x + c11.z;
	r0.x = clamp(r0.x * c11.w, 0.0, 1.0);
	r1.w = (r0.x * c10.x) + c10.y;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r1.w;
	r0.xyz = (r0.xxx * r1.xyz) + r0.yzw;
	r1 = s10_texture.sample(s10, v0.xy);
	r0.xyz = r0.xyz * r1.zzz;
	r0.xyz = r2.xyz * r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	oC0.xyz = r0.xyz * c30.xxx;
	oC0.w = c1.w;
	#undef c1
	#undef c4
	#undef c5
	#undef c6
	#undef c7
	#undef c8
	#undef c9
	#undef c12
	#undef c30
	#undef c102
	#undef c107
	#undef v0
	#undef v1
	#undef v2
	#undef v3
	#undef v4
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

