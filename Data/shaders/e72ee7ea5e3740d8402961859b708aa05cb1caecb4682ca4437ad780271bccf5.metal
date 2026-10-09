#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[20];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord2)]];
	float4 v2 [[user(texcoord3)]];
	float4 v3 [[user(texcoord4)]];
	float4 v4 [[user(texcoord5)]];
	float4 v5 [[user(texcoord6)]];
	float4 v6 [[user(texcoord8)]];
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
	const float4 c0 = float4(2.000000000e+00, -1.000000000e+00, 0.000000000e+00, 1.000000000e+00); (void) c0;
	const float4 c11 = float4(1.591549367e-01, 5.000000000e-01, 6.283185482e+00, -3.141592741e+00); (void) c11;
	const float4 c13 = float4(5.773500204e-01, 4.999995828e-01, 5.000000000e-01, 5.000000000e+00); (void) c13;
	const float4 c14 = float4(-2.000000000e+00, 3.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c14;
	const float4 c15 = float4(1.000000000e+06, -3.000000119e-01, -3.333333254e+00, 0.000000000e+00); (void) c15;
	const float4 c16 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -9.999999975e-07); (void) c16;
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
	#define c12 uniforms.uniforms_float4[10]
	#define c19 uniforms.uniforms_float4[11]
	#define c29 uniforms.uniforms_float4[12]
	#define c30 uniforms.uniforms_float4[13]
	#define c101 uniforms.uniforms_float4[14]
	#define c102 uniforms.uniforms_float4[15]
	#define c103 uniforms.uniforms_float4[16]
	#define c104 uniforms.uniforms_float4[17]
	#define c105 uniforms.uniforms_float4[18]
	#define c107 uniforms.uniforms_float4[19]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define oC0 output.oC0
	r0 = s1_texture.sample(s1, v0.xy);
	r0.xyz = (r0.xyz * c0.xxx) + c0.yyy;
	r1.x = dot(v1.xyz, r0.xyz);
	r1.y = dot(v2.xyz, r0.xyz);
	r1.z = dot(v3.xyz, r0.xyz);
	r0.xyz = normalize(r1.xyz);
	r1.xyz = r0.xyz * v6.zxy;
	r1.xyz = (r0.zxy * v6.xyz) + -r1.xyz;
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.xyz = r1.www * r1.xyz;
	r2.xyz = r0.xyz * r1.yzx;
	r2.xyz = (r0.zxy * r1.zxy) + -r2.xyz;
	r1.w = dot(r2.xyz, r2.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r2.xyz = r1.www * r2.xyz;
	r3 = s3_texture.sample(s3, v0.xy);
	r1.w = (r3.y * c13.y) + c13.z;
	r1.w = fract(r1.w);
	r1.w = (r1.w * c11.z) + c11.w;
	r4.xy = float2(cos(r1.w), sin(r1.w));
	r1.xyz = r1.xyz * r4.xxx;
	r1.xyz = (r4.yyy * r2.xyz) + r1.xyz;
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.xyz = r1.www * r1.xyz;
	r2.xyz = r0.xyz * r1.xyz;
	r2.xyz = (r1.zxy * r0.yzx) + -r2.xyz;
	r4.xyz = r1.xyz * r2.xyz;
	r1.xyz = (r2.zxy * r1.yzx) + -r4.xyz;
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r2.xyz = c3.xyz + -v4.xyz;
	r2.w = dot(r2.xyz, r2.xyz);
	r2.w = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r4.xyz = r2.www * r2.xyz;
	r1.xyz = (r1.xyz * r1.www) + -r4.xyz;
	r5.z = c0.z;
	r1.w = ((-r3.y >= 0.0) ? r5.z : c10.w);
	r1.xyz = (r1.www * r1.xyz) + r4.xyz;
	r4.x = clamp(dot(r4.xyz, r0.xyz), 0.0, 1.0);
	r1.w = dot(r0.xyz, r1.xyz);
	r1.w = r1.w + r1.w;
	r3.y = dot(r0.xyz, r0.xyz);
	r1.xyz = r1.xyz * r3.yyy;
	r1.xyz = (r1.www * r0.xyz) + -r1.xyz;
	r1 = s6_texture.sample(s6, r1.xyz);
	r5.xyz = r1.xyz * c30.zzz;
	r6.xyz = r5.xyz * r5.xyz;
	r6.xyz = r6.xyz * r6.xyz;
	r1.w = dot(r6.xyz, c16.xyz);
	r3.y = r1.w + c16.w;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = ((r3.y >= 0.0) ? r1.w : c15.x);
	r3.y = dot(r5.xyz, c16.xyz);
	r6.xyz = r3.yyy * r6.xyz;
	r1.xyz = (c30.zzz * -r1.xyz) + r3.yyy;
	r1.xyz = (-c103.www * r1.xyz) + r5.xyz;
	r6.xyz = (r6.xyz * r1.www) + -r5.xyz;
	r6.xyz = (c103.www * r6.xyz) + r5.xyz;
	r1.xyz = ((c103.w >= 0.0) ? r6.xyz : r1.xyz);
	r1.w = abs(c103.w);
	r1.xyz = ((-r1.w >= 0.0) ? r5.xyz : r1.xyz);
	r5.x = ((r0.x >= 0.0) ? c0.z : c0.w);
	r5.y = ((r0.y >= 0.0) ? c0.z : c0.w);
	r5.z = ((r0.z >= 0.0) ? c0.z : c0.w);
	r6.xyz = r0.xyz * r0.xyz;
	r5.xyz = r5.xyz * r6.xyz;
	r7.xyz = r5.xxx * c5.xyz;
	r8.x = ((r0.x >= 0.0) ? c0.w : c0.z);
	r8.y = ((r0.y >= 0.0) ? c0.w : c0.z);
	r8.z = ((r0.z >= 0.0) ? c0.w : c0.z);
	r6.xyz = r6.xyz * r8.xyz;
	r7.xyz = (r6.xxx * c4.xyz) + r7.xyz;
	r6.xyw = (r6.yyy * c6.xyz) + r7.xyz;
	r5.xyw = (r5.yyy * c7.xyz) + r6.xyw;
	r5.xyw = (r6.zzz * c8.xyz) + r5.xyw;
	r5.xyz = (r5.zzz * c9.xyz) + r5.xyw;
	r6.xyz = r5.xyz + v5.xyz;
	r1.w = dot(r5.xyz, c16.xyz);
	r5.xyz = r6.xyz + -c103.xxx;
	r5.xyz = clamp(r5.xyz * c103.yyy, float3(0.0), float3(1.0));
	r5.xyz = (r1.xyz * r5.xyz) + -r1.xyz;
	r3.y = r3.z * c101.x;
	r1.xyz = (r3.yyy * r5.xyz) + r1.xyz;
	r5.xyz = (r1.xyz * r1.xyz) + -r1.xyz;
	r1.xyz = (c103.zzz * r5.xyz) + r1.xyz;
	r3.y = r4.x * r4.x;
	r3.y = r3.y * r3.y;
	r3.z = -r3.w + c0.w;
	r3.y = r3.y * r3.z;
	r5.xyz = r3.yyy * v5.xyz;
	r5.xyz = r0.www * r5.xyz;
	r5.xyz = r5.xyz * c13.www;
	r7 = s10_texture.sample(s10, v0.xy);
	r0.w = mix(c10.x, c10.y, r7.y);
	r5.xyz = r0.www * r5.xyz;
	r5.xyz = ((-r3.z >= 0.0) ? c0.zzz : r5.xyz);
	r8 = s0_texture.sample(s0, v0.xy);
	r9.xyz = r8.www * c104.xyz;
	r1.xyz = (r1.xyz * r9.xyz) + r5.xyz;
	r4.y = r7.w;
	r5 = s4_texture.sample(s4, r4.xy);
	r0.w = -r4.x + c0.w;
	r3.y = pow(abs(r0.w), c105.x);
	r0.w = mix(r5.y, c0.w, r3.z);
	r1.xyz = r0.www * r1.xyz;
	r0.w = r3.x * c12.w;
	r8.w = r3.x;
	r0.w = (r0.w * c11.x) + c11.y;
	r0.w = fract(r0.w);
	r0.w = (r0.w * c11.z) + c11.w;
	r4.xy = float2(cos(r0.w), sin(r0.w));
	r3.xzw = r8.zxy * c13.xxx;
	r3.xzw = (r8.zxy * c13.xxx) + -r3.wxz;
	r3.xzw = r4.yyy * r3.xzw;
	r3.xzw = (r8.xyz * r4.xxx) + r3.xzw;
	r0.w = -r4.x + c0.w;
	r4.x = dot(c13.xxx, r8.xyz);
	r4.x = r4.x * c13.x;
	r4.xyz = (r4.xxx * r0.www) + r3.xzw;
	r0.w = abs(c12.w);
	r4.w = c0.w;
	r4 = ((-r0.w >= 0.0) ? r8 : r4);
	r3.xzw = r4.xyz + c0.yyy;
	r3.xzw = (r7.yyy * r3.xzw) + c0.www;
	r1.xyz = r1.xyz * r3.xzw;
	r3.xzw = r4.xyz * r4.xyz;
	r3.xzw = r3.xzw * r3.xzw;
	r0.w = dot(r4.xyz, c16.xyz);
	r5.xyz = r0.www * r3.xzw;
	r3.x = dot(r3.xzw, c16.xyz);
	r8.xyz = mix(r4.xyz, r0.www, -c101.yyy);
	r0.w = r3.x + c16.w;
	r3.x = ((r3.x == 0.0) ? FLT_MAX : 1.0 / r3.x);
	r0.w = ((r0.w >= 0.0) ? r3.x : c15.x);
	r3.xzw = (r5.xyz * r0.www) + -r4.xyz;
	r3.xzw = (c101.yyy * r3.xzw) + r4.xyz;
	r3.xzw = ((c101.y >= 0.0) ? r3.xzw : r8.xyz);
	r0.w = abs(c101.y);
	r3.xzw = ((-r0.w >= 0.0) ? r4.xyz : r3.xzw);
	r5.xy = r1.ww + -c2.xw;
	r0.w = r1.w + c15.y;
	r0.w = clamp(r0.w * c15.z, 0.0, 1.0);
	r5.zw = -c2.xw + c2.yz;
	r1.w = ((r5.z == 0.0) ? FLT_MAX : 1.0 / r5.z);
	r5.z = ((r5.w == 0.0) ? FLT_MAX : 1.0 / r5.w);
	r5.y = clamp(r5.z * r5.y, 0.0, 1.0);
	r1.w = clamp(r1.w * r5.x, 0.0, 1.0);
	r5.x = (r1.w * c14.x) + c14.y;
	r1.w = r1.w * r1.w;
	r1.w = r1.w * r5.x;
	r5.x = (r5.y * c14.x) + c14.y;
	r5.y = r5.y * r5.y;
	r5.x = r5.y * r5.x;
	r1.w = r1.w * r5.x;
	r1.w = r4.w * r1.w;
	r5.xyz = mix(r4.xyz, r3.xzw, r1.www);
	r1.w = dot(r5.xyz, c16.xyz);
	r3.xzw = r1.www * c102.xyz;
	r4.xyz = c16.xyz;
	r1.w = dot(c102.xyz, r4.xyz);
	r4.x = r1.w + c16.w;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = ((r4.x >= 0.0) ? r1.w : c15.x);
	r3.xzw = (r3.xzw * r1.www) + -r5.xyz;
	r3.xzw = (c102.www * r3.xzw) + r5.xyz;
	r1.w = clamp(c107.w + v5.w, 0.0, 1.0);
	r3.xzw = (r3.xzw * r1.www) + -r5.xyz;
	r1.w = (r0.w * c14.x) + c14.y;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.w;
	r3.xzw = (r0.www * r3.xzw) + r5.xyz;
	r3.xzw = r7.zzz * r3.xzw;
	r1.xyz = (r3.xzw * r6.xyz) + r1.xyz;
	r4.x = v1.w;
	r4.y = v2.w;
	r4.z = v3.w;
	r2.xyz = (r2.xyz * r2.www) + r4.xyz;
	r0.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r0.w = clamp((r0.w * c19.w) + c19.x, 0.0, 1.0);
	r1.w = min(r0.w, c19.z);
	r0.w = r1.w * r1.w;
	r1.w = clamp(dot(r0.xyz, r4.xyz), 0.0, 1.0);
	r4.xyz = normalize(r2.xyz);
	r0.x = clamp(dot(r0.xyz, r4.xyz), 0.0, 1.0);
	r0.x = r1.w * r0.x;
	r0.y = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r0.x = r3.y * r0.x;
	r0.x = r0.y * r0.x;
	r2.xyz = v5.www * v5.xyz;
	r2.xyz = r2.xyz * c107.xyz;
	r0.xyz = r0.xxx * r2.xyz;
	r0.xyz = (r0.xyz * r7.xxx) + r1.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	oC0.xyz = (r0.www * r0.xyz) + r1.xyz;
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
	#undef c12
	#undef c19
	#undef c29
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
	#undef v6
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

