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
	const float4 c0 = float4(0.159154935, 0.5, 6.283185478, -3.141592739); (void) c0;
	const float4 c11 = float4(0.57735002, 1.0, 2.0, -1.0); (void) c11;
	const float4 c13 = float4(0.298999992, 0.587000012, 0.114, -0.000001); (void) c13;
	const float4 c14 = float4(1000000.0, -0.300000011, -3.333333253, 0.0); (void) c14;
	const float4 c15 = float4(-2.0, 3.0, 0.0, 0.0); (void) c15;
	const float4 c16 = float4(0.0, 1.0, 0.000796326, 0.999999703); (void) c16;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	float4 r7;
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
	r0.xyz = (r0.xyz * c11.zzz) + c11.www;
	r1.x = dot(v1.xyz, r0.xyz);
	r1.y = dot(v2.xyz, r0.xyz);
	r1.z = dot(v3.xyz, r0.xyz);
	r0.xyz = normalize(r1.xyz);
	r1.xyz = r0.xyz * v6.zxy;
	r1.xyz = (r0.zxy * v6.xyz) + -r1.xyz;
	r0.w = dot(r1.xyz, r1.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r1.xyz = r0.www * r1.xyz;
	r2.xyz = r0.xyz * r1.yzx;
	r2.xyz = (r0.zxy * r1.zxy) + -r2.xyz;
	r1.xyz = r1.xyz * c16.zzz;
	r0.w = dot(r2.xyz, r2.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r2.xyz = r0.www * r2.xyz;
	r1.xyz = (r2.xyz * c16.www) + r1.xyz;
	r0.w = dot(r1.xyz, r1.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r1.xyz = r0.www * r1.xyz;
	r2.xyz = r0.xyz * r1.xyz;
	r2.xyz = (r1.zxy * r0.yzx) + -r2.xyz;
	r3.xyz = r1.xyz * r2.xyz;
	r1.xyz = (r2.zxy * r1.yzx) + -r3.xyz;
	r0.w = dot(r1.xyz, r1.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r2.xyz = c3.xyz + -v4.xyz;
	r1.w = dot(r2.xyz, r2.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r3.xyz = r1.www * r2.xyz;
	r1.xyz = (r1.xyz * r0.www) + -r3.xyz;
	r1.xyz = (c10.www * r1.xyz) + r3.xyz;
	r3.x = clamp(dot(r3.xyz, r0.xyz), 0.0, 1.0);
	r0.w = dot(r0.xyz, r1.xyz);
	r0.w = r0.w + r0.w;
	r2.w = dot(r0.xyz, r0.xyz);
	r1.xyz = r1.xyz * r2.www;
	r1.xyz = (r0.www * r0.xyz) + -r1.xyz;
	r4 = s6_texture.sample(s6, r1.xyz);
	r1.xyz = r4.xyz * c30.zzz;
	r5.xyz = r1.xyz * r1.xyz;
	r5.xyz = r5.xyz * r5.xyz;
	r0.w = dot(r5.xyz, c13.xyz);
	r2.w = r0.w + c13.w;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r2.w >= 0.0) ? r0.w : c14.x);
	r2.w = dot(r1.xyz, c13.xyz);
	r5.xyz = r2.www * r5.xyz;
	r4.xyz = (c30.zzz * -r4.xyz) + r2.www;
	r4.xyz = (-c103.www * r4.xyz) + r1.xyz;
	r5.xyz = (r5.xyz * r0.www) + -r1.xyz;
	r5.xyz = (c103.www * r5.xyz) + r1.xyz;
	r4.xyz = ((c103.w >= 0.0) ? r5.xyz : r4.xyz);
	r0.w = abs(c103.w);
	r1.xyz = ((-r0.w >= 0.0) ? r1.xyz : r4.xyz);
	r4.x = ((r0.x >= 0.0) ? c16.x : c16.y);
	r4.y = ((r0.y >= 0.0) ? c16.x : c16.y);
	r4.z = ((r0.z >= 0.0) ? c16.x : c16.y);
	r5.xyz = r0.xyz * r0.xyz;
	r4.xyz = r4.xyz * r5.xyz;
	r6.xyz = r4.xxx * c5.xyz;
	r7.x = ((r0.x >= 0.0) ? c16.y : c16.x);
	r7.y = ((r0.y >= 0.0) ? c16.y : c16.x);
	r7.z = ((r0.z >= 0.0) ? c16.y : c16.x);
	r5.xyz = r5.xyz * r7.xyz;
	r6.xyz = (r5.xxx * c4.xyz) + r6.xyz;
	r5.xyw = (r5.yyy * c6.xyz) + r6.xyz;
	r4.xyw = (r4.yyy * c7.xyz) + r5.xyw;
	r4.xyw = (r5.zzz * c8.xyz) + r4.xyw;
	r4.xyz = (r4.zzz * c9.xyz) + r4.xyw;
	r5.xyz = r4.xyz + v5.xyz;
	r0.w = dot(r4.xyz, c13.xyz);
	r4.xyz = r5.xyz + -c103.xxx;
	r4.xyz = clamp(r4.xyz * c103.yyy, float3(0.0), float3(1.0));
	r4.xyz = (r1.xyz * r4.xyz) + -r1.xyz;
	r1.xyz = (c101.xxx * r4.xyz) + r1.xyz;
	r4.xyz = (r1.xyz * r1.xyz) + -r1.xyz;
	r1.xyz = (c103.zzz * r4.xyz) + r1.xyz;
	r4 = s0_texture.sample(s0, v0.xy);
	r6.xyz = r4.www * c104.xyz;
	r1.xyz = r1.xyz * r6.xyz;
	r6 = s10_texture.sample(s10, v0.xy);
	r3.y = r6.w;
	r7 = s4_texture.sample(s4, r3.xy);
	r2.w = -r3.x + c11.y;
	r3.x = pow(abs(r2.w), c105.x);
	r1.xyz = r1.xyz * r7.yyy;
	r3.yzw = r4.zxy * c11.xxx;
	r3.yzw = (r4.zxy * c11.xxx) + -r3.wyz;
	r7.xy = c0.xy;
	r2.w = (c12.w * r7.x) + r7.y;
	r2.w = fract(r2.w);
	r2.w = (r2.w * c0.z) + c0.w;
	r7.xy = float2(cos(r2.w), sin(r2.w));
	r3.yzw = r3.yzw * r7.yyy;
	r3.yzw = (r4.xyz * r7.xxx) + r3.yzw;
	r2.w = -r7.x + c11.y;
	r4.w = dot(c11.xxx, r4.xyz);
	r4.w = r4.w * c11.x;
	r3.yzw = (r4.www * r2.www) + r3.yzw;
	r2.w = abs(c12.w);
	r3.yzw = ((-r2.w >= 0.0) ? r4.xyz : r3.yzw);
	r4.xyz = r3.yzw + c11.www;
	r4.xyz = (r6.yyy * r4.xyz) + c11.yyy;
	r1.xyz = r1.xyz * r4.xyz;
	r4.xyz = r3.yzw * r3.yzw;
	r4.xyz = r4.xyz * r4.xyz;
	r2.w = dot(r3.yzw, c13.xyz);
	r7.xyz = r2.www * r4.xyz;
	r4.x = dot(r4.xyz, c13.xyz);
	r4.yzw = mix(r3.yzw, r2.www, -c101.yyy);
	r2.w = r4.x + c13.w;
	r4.x = ((r4.x == 0.0) ? FLT_MAX : 1.0 / r4.x);
	r2.w = ((r2.w >= 0.0) ? r4.x : c14.x);
	r7.xyz = (r7.xyz * r2.www) + -r3.yzw;
	r7.xyz = (c101.yyy * r7.xyz) + r3.yzw;
	r4.xyz = ((c101.y >= 0.0) ? r7.xyz : r4.yzw);
	r2.w = abs(c101.y);
	r4.xyz = ((-r2.w >= 0.0) ? r3.yzw : r4.xyz);
	r6.yw = r0.ww + -c2.xw;
	r0.w = r0.w + c14.y;
	r0.w = clamp(r0.w * c14.z, 0.0, 1.0);
	r7.xy = -c2.xw + c2.yz;
	r2.w = ((r7.x == 0.0) ? FLT_MAX : 1.0 / r7.x);
	r4.w = ((r7.y == 0.0) ? FLT_MAX : 1.0 / r7.y);
	r4.w = clamp(r4.w * r6.w, 0.0, 1.0);
	r2.w = clamp(r2.w * r6.y, 0.0, 1.0);
	r5.w = (r2.w * c15.x) + c15.y;
	r2.w = r2.w * r2.w;
	r2.w = r2.w * r5.w;
	r5.w = (r4.w * c15.x) + c15.y;
	r4.w = r4.w * r4.w;
	r4.w = r4.w * r5.w;
	r2.w = r2.w * r4.w;
	r7.xyz = mix(r3.yzw, r4.xyz, r2.www);
	r2.w = dot(r7.xyz, c13.xyz);
	r3.yzw = r2.www * c102.xyz;
	r4.xyz = c13.xyz;
	r2.w = dot(c102.xyz, r4.xyz);
	r4.x = r2.w + c13.w;
	r2.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r2.w = ((r4.x >= 0.0) ? r2.w : c14.x);
	r3.yzw = (r3.yzw * r2.www) + -r7.xyz;
	r3.yzw = (c102.www * r3.yzw) + r7.xyz;
	r2.w = clamp(c107.w + v5.w, 0.0, 1.0);
	r3.yzw = (r3.yzw * r2.www) + -r7.xyz;
	r2.w = (r0.w * c15.x) + c15.y;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r2.w;
	r3.yzw = (r0.www * r3.yzw) + r7.xyz;
	r3.yzw = r6.zzz * r3.yzw;
	r1.xyz = (r3.yzw * r5.xyz) + r1.xyz;
	r4.x = v1.w;
	r4.y = v2.w;
	r4.z = v3.w;
	r2.xyz = (r2.xyz * r1.www) + r4.xyz;
	r0.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r0.w = clamp((r0.w * c19.w) + c19.x, 0.0, 1.0);
	r1.w = min(r0.w, c19.z);
	r0.w = r1.w * r1.w;
	r1.w = clamp(dot(r0.xyz, r4.xyz), 0.0, 1.0);
	r4.xyz = normalize(r2.xyz);
	r0.x = clamp(dot(r0.xyz, r4.xyz), 0.0, 1.0);
	r0.x = r1.w * r0.x;
	r0.y = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r0.x = r3.x * r0.x;
	r0.x = r0.y * r0.x;
	r2.xyz = v5.www * v5.xyz;
	r2.xyz = r2.xyz * c107.xyz;
	r0.xyz = r0.xxx * r2.xyz;
	r0.xyz = (r0.xyz * r6.xxx) + r1.xyz;
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

