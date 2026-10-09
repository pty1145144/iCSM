#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[18];
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
	const float4 c10 = float4(5.773500204e-01, 1.000000000e+00, 2.000000000e+00, -1.000000000e+00); (void) c10;
	const float4 c11 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -3.000000119e-01); (void) c11;
	const float4 c13 = float4(-3.333333254e+00, -2.000000000e+00, 3.000000000e+00, 0.000000000e+00); (void) c13;
	const float4 c14 = float4(0.000000000e+00, 1.000000000e+00, -9.999999975e-07, 1.000000000e+06); (void) c14;
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
	#define c1 uniforms.uniforms_float4[0]
	#define c2 uniforms.uniforms_float4[1]
	#define c3 uniforms.uniforms_float4[2]
	#define c4 uniforms.uniforms_float4[3]
	#define c5 uniforms.uniforms_float4[4]
	#define c6 uniforms.uniforms_float4[5]
	#define c7 uniforms.uniforms_float4[6]
	#define c8 uniforms.uniforms_float4[7]
	#define c9 uniforms.uniforms_float4[8]
	#define c12 uniforms.uniforms_float4[9]
	#define c19 uniforms.uniforms_float4[10]
	#define c30 uniforms.uniforms_float4[11]
	#define c101 uniforms.uniforms_float4[12]
	#define c102 uniforms.uniforms_float4[13]
	#define c103 uniforms.uniforms_float4[14]
	#define c104 uniforms.uniforms_float4[15]
	#define c105 uniforms.uniforms_float4[16]
	#define c107 uniforms.uniforms_float4[17]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define oC0 output.oC0
	r0.x = c19.y + -v4.z;
	r0.x = r0.x + -c10.z;
	oC0.w = clamp(r0.x * c19.w, 0.0, 1.0);
	r0.xyz = c11.xyz;
	r0.x = dot(c102.xyz, r0.xyz);
	r0.y = r0.x + c14.z;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = ((r0.y >= 0.0) ? r0.x : c14.w);
	r1.xy = c0.xy;
	r0.y = (c12.w * r1.x) + r1.y;
	r0.y = fract(r0.y);
	r0.y = (r0.y * c0.z) + c0.w;
	r1.xy = float2(cos(r0.y), sin(r0.y));
	r2 = s0_texture.sample(s0, v0.xy);
	r0.yzw = r2.zxy * c10.xxx;
	r0.yzw = (r2.zxy * c10.xxx) + -r0.wyz;
	r0.yzw = r1.yyy * r0.yzw;
	r0.yzw = (r2.xyz * r1.xxx) + r0.yzw;
	r1.x = -r1.x + c10.y;
	r1.y = dot(c10.xxx, r2.xyz);
	r1.y = r1.y * c10.x;
	r0.yzw = (r1.yyy * r1.xxx) + r0.yzw;
	r1.x = abs(c12.w);
	r0.yzw = ((-r1.x >= 0.0) ? r2.xyz : r0.yzw);
	r1.xyz = r2.www * c104.xyz;
	r2.xyz = r0.yzw * r0.yzw;
	r2.xyz = r2.xyz * r2.xyz;
	r1.w = dot(r2.xyz, c11.xyz);
	r2.w = r1.w + c14.z;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = ((r2.w >= 0.0) ? r1.w : c14.w);
	r2.w = dot(r0.yzw, c11.xyz);
	r2.xyz = r2.www * r2.xyz;
	r3.xyz = mix(r0.yzw, r2.www, -c101.yyy);
	r2.xyz = (r2.xyz * r1.www) + -r0.yzw;
	r2.xyz = (c101.yyy * r2.xyz) + r0.yzw;
	r2.xyz = ((c101.y >= 0.0) ? r2.xyz : r3.xyz);
	r1.w = abs(c101.y);
	r2.xyz = ((-r1.w >= 0.0) ? r0.yzw : r2.xyz);
	r3 = s1_texture.sample(s1, v0.xy);
	r3.xyz = (r3.xyz * c10.zzz) + c10.www;
	r4.x = dot(v1.xyz, r3.xyz);
	r4.y = dot(v2.xyz, r3.xyz);
	r4.z = dot(v3.xyz, r3.xyz);
	r3.xyz = normalize(r4.xyz);
	r4.x = ((r3.x >= 0.0) ? c14.x : c14.y);
	r4.y = ((r3.y >= 0.0) ? c14.x : c14.y);
	r4.z = ((r3.z >= 0.0) ? c14.x : c14.y);
	r5.xyz = r3.xyz * r3.xyz;
	r4.xyz = r4.xyz * r5.xyz;
	r6.xyz = r4.xxx * c5.xyz;
	r7.x = ((r3.x >= 0.0) ? c14.y : c14.x);
	r7.y = ((r3.y >= 0.0) ? c14.y : c14.x);
	r7.z = ((r3.z >= 0.0) ? c14.y : c14.x);
	r5.xyz = r5.xyz * r7.xyz;
	r6.xyz = (r5.xxx * c4.xyz) + r6.xyz;
	r5.xyw = (r5.yyy * c6.xyz) + r6.xyz;
	r4.xyw = (r4.yyy * c7.xyz) + r5.xyw;
	r4.xyw = (r5.zzz * c8.xyz) + r4.xyw;
	r4.xyz = (r4.zzz * c9.xyz) + r4.xyw;
	r1.w = dot(r4.xyz, c11.xyz);
	r4.xyz = r4.xyz + v5.xyz;
	r5.xy = r1.ww + -c2.xw;
	r1.w = r1.w + c11.w;
	r1.w = clamp(r1.w * c13.x, 0.0, 1.0);
	r5.zw = -c2.xw + c2.yz;
	r2.w = ((r5.z == 0.0) ? FLT_MAX : 1.0 / r5.z);
	r3.w = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r3.w = clamp(r3.w * r5.y, 0.0, 1.0);
	r2.w = clamp(r2.w * r5.x, 0.0, 1.0);
	r4.w = (r2.w * c13.y) + c13.z;
	r2.w = r2.w * r2.w;
	r2.w = r2.w * r4.w;
	r4.w = (r3.w * c13.y) + c13.z;
	r3.w = r3.w * r3.w;
	r3.w = r3.w * r4.w;
	r2.w = r2.w * r3.w;
	r5.xyz = mix(r0.yzw, r2.xyz, r2.www);
	r0.yzw = r0.yzw + c10.www;
	r2.x = dot(r5.xyz, c11.xyz);
	r2.xyz = r2.xxx * c102.xyz;
	r2.xyz = (r2.xyz * r0.xxx) + -r5.xyz;
	r2.xyz = (c102.www * r2.xyz) + r5.xyz;
	r0.x = clamp(c107.w + v5.w, 0.0, 1.0);
	r2.xyz = (r2.xyz * r0.xxx) + -r5.xyz;
	r0.x = (r1.w * c13.y) + c13.z;
	r1.w = r1.w * r1.w;
	r0.x = r0.x * r1.w;
	r2.xyz = (r0.xxx * r2.xyz) + r5.xyz;
	r5 = s10_texture.sample(s10, v0.xy);
	r2.xyz = r2.xyz * r5.zzz;
	r0.x = dot(r3.xyz, r3.xyz);
	r6.xyz = c3.xyz + -v4.xyz;
	r1.w = dot(r6.xyz, r6.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r7.xyz = r1.www * r6.xyz;
	r8.xyz = r0.xxx * r7.xyz;
	r7.x = dot(r7.xyz, r3.xyz);
	r0.x = r7.x + r7.x;
	r7.x = clamp(r7.x, 0.0, 1.0);
	r8.xyz = (r0.xxx * r3.xyz) + -r8.xyz;
	r8 = s6_texture.sample(s6, r8.xyz);
	r9.xyz = r8.xyz * c30.zzz;
	r10.xyz = r9.xyz * r9.xyz;
	r10.xyz = r10.xyz * r10.xyz;
	r0.x = dot(r10.xyz, c11.xyz);
	r2.w = r0.x + c14.z;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = ((r2.w >= 0.0) ? r0.x : c14.w);
	r2.w = dot(r9.xyz, c11.xyz);
	r10.xyz = r2.www * r10.xyz;
	r8.xyz = (c30.zzz * -r8.xyz) + r2.www;
	r8.xyz = (-c103.www * r8.xyz) + r9.xyz;
	r10.xyz = (r10.xyz * r0.xxx) + -r9.xyz;
	r10.xyz = (c103.www * r10.xyz) + r9.xyz;
	r8.xyz = ((c103.w >= 0.0) ? r10.xyz : r8.xyz);
	r0.x = abs(c103.w);
	r8.xyz = ((-r0.x >= 0.0) ? r9.xyz : r8.xyz);
	r9.xyz = r4.xyz + -c103.xxx;
	r9.xyz = clamp(r9.xyz * c103.yyy, float3(0.0), float3(1.0));
	r9.xyz = (r8.xyz * r9.xyz) + -r8.xyz;
	r8.xyz = (c101.xxx * r9.xyz) + r8.xyz;
	r9.xyz = (r8.xyz * r8.xyz) + -r8.xyz;
	r8.xyz = (c103.zzz * r9.xyz) + r8.xyz;
	r1.xyz = r1.xyz * r8.xyz;
	r7.y = r5.w;
	r8 = s4_texture.sample(s4, r7.xy);
	r0.x = -r7.x + c10.y;
	r2.w = pow(abs(r0.x), c105.x);
	r1.xyz = r1.xyz * r8.yyy;
	r0.xyz = (r5.yyy * r0.yzw) + c10.yyy;
	r0.xyz = r0.xyz * r1.xyz;
	r0.xyz = (r2.xyz * r4.xyz) + r0.xyz;
	r1.x = v1.w;
	r1.y = v2.w;
	r1.z = v3.w;
	r2.xyz = (r6.xyz * r1.www) + r1.xyz;
	r0.w = clamp(dot(r3.xyz, r1.xyz), 0.0, 1.0);
	r1.xyz = normalize(r2.xyz);
	r1.x = clamp(dot(r3.xyz, r1.xyz), 0.0, 1.0);
	r1.x = r0.w * r1.x;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r1.x = r2.w * r1.x;
	r0.w = r0.w * r1.x;
	r1.xyz = v5.www * v5.xyz;
	r1.xyz = r1.xyz * c107.xyz;
	r1.xyz = r0.www * r1.xyz;
	r0.xyz = (r1.xyz * r5.xxx) + r0.xyz;
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

