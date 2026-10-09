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
	float4 v1 [[user(texcoord1)]];
	float4 v2 [[user(texcoord2)]];
	float4 v3 [[user(texcoord3)]];
	float4 v4 [[user(texcoord4)]];
};

struct source_main_Output
{
	float4 oC0 [[color(0)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	texture2d<float> s0_texture [[texture(0)]],
	sampler s0 [[sampler(0)]],
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
	texture2d<float> s7_texture [[texture(7)]],
	sampler s7 [[sampler(7)]],
	texturecube<float> s8_texture [[texture(8)]],
	sampler s8 [[sampler(8)]],
	texture2d<float> s14_texture [[texture(14)]],
	sampler s14 [[sampler(14)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c3 = float4(3.000000119e-01, 5.899999738e-01, 1.099999994e-01, 1.000000000e+00); (void) c3;
	const float4 c15 = float4(2.000000000e+00, -1.000000000e+00, 5.000000000e-01, -0.000000000e+00); (void) c15;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c2 uniforms.uniforms_float4[2]
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
	#define c19 uniforms.uniforms_float4[14]
	#define c26 uniforms.uniforms_float4[15]
	#define c27 uniforms.uniforms_float4[16]
	#define c30 uniforms.uniforms_float4[17]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define oC0 output.oC0
	r0.x = c12.y + -v4.z;
	r0.x = r0.x + -c15.x;
	oC0.w = clamp(r0.x * c12.w, 0.0, 1.0);
	r0.xyz = v3.xyz;
	r1.xyz = r0.yzx * v2.zxy;
	r0.xyz = (v2.yzx * r0.zxy) + -r1.xyz;
	r0.xyz = r0.xyz * v3.www;
	r1 = s3_texture.sample(s3, v1.xy);
	r1.xyz = (r1.xyz * c15.xxx) + c15.yyy;
	r0.xyz = r0.xyz * r1.yyy;
	r0.xyz = (r1.xxx * v3.xyz) + r0.xyz;
	r0.xyz = (r1.zzz * v2.xyz) + r0.xyz;
	r1.xyz = normalize(r0.xyz);
	r0.x = dot(r1.xyz, r1.xyz);
	r0.yzw = c11.xyz + -v4.xyz;
	r2.xyz = normalize(r0.yzw);
	r0.xyz = r0.xxx * r2.xyz;
	r0.w = dot(r1.xyz, r2.xyz);
	r2.w = r0.w + r0.w;
	r0.w = clamp(r0.w, 0.0, 1.0);
	r0.w = -r0.w + c3.w;
	r0.xyz = (r2.www * r1.xyz) + -r0.xyz;
	r3 = s8_texture.sample(s8, r0.xyz);
	r0.xyz = r3.xyz * c30.zzz;
	r0.xyz = r0.xyz * c2.xyz;
	r2.w = (r0.w * -r0.w) + c15.z;
	r0.w = r0.w * r0.w;
	r3.x = -c19.x + c19.y;
	r3.y = r0.w + r0.w;
	r3.x = (r3.y * r3.x) + c19.x;
	r3.y = (r0.w * c15.x) + c15.y;
	r0.w = r0.w * r0.w;
	r4.x = mix(c19.y, c19.z, r3.y);
	r2.w = ((r2.w >= 0.0) ? r3.x : r4.x);
	r3.xyz = (r2.www * r0.xyz) + -r0.xyz;
	r0.xyz = (c10.xxx * r3.xyz) + r0.xyz;
	r3 = s0_texture.sample(s0, v0.xy);
	r2.w = mix(r1.w, r3.w, c27.x);
	r1.w = dot(r3.xyz, c3.xyz);
	r4.x = mix(r2.w, r1.w, c10.y);
	r1.w = mix(r3.w, r4.x, c2.w);
	r2.w = (r1.w * -c15.x) + -c15.y;
	r1.w = (c27.w * r2.w) + r1.w;
	r0.xyz = r0.xyz * r1.www;
	r4.xyz = r3.xyz * r0.xyz;
	r4.xyz = (r4.xyz * c0.www) + -r0.xyz;
	r5 = s7_texture.sample(s7, v0.xy);
	r4.xyz = (r5.yyy * r4.xyz) + r0.xyz;
	r4.xyz = r4.xyz * r5.xxx;
	r1.w = r5.w + -c3.w;
	r2.w = c3.w;
	r1.w = (c13.x * r1.w) + r2.w;
	r0.w = r0.w * r1.w;
	r0.w = r0.w * c14.w;
	r0.xyz = ((c26.x >= 0.0) ? r0.xyz : r4.xyz);
	r4.x = ((r2.x >= 0.0) ? -c15.w : -c15.y);
	r4.y = ((r2.y >= 0.0) ? -c15.w : -c15.y);
	r4.z = ((r2.z >= 0.0) ? -c15.w : -c15.y);
	r5.xyz = r2.xyz * r2.xyz;
	r2.x = ((r2.x >= 0.0) ? -c15.y : -c15.w);
	r2.y = ((r2.y >= 0.0) ? -c15.y : -c15.w);
	r2.z = ((r2.z >= 0.0) ? -c15.y : -c15.w);
	r2.xyz = r5.xyz * r2.xyz;
	r4.xyz = r4.xyz * r5.xyz;
	r5.xyz = r4.xxx * c5.xyz;
	r5.xyz = (r2.xxx * c4.xyz) + r5.xyz;
	r5.xyz = (r2.yyy * c6.xyz) + r5.xyz;
	r4.xyw = (r4.yyy * c7.xyz) + r5.xyz;
	r2.xyz = (r2.zzz * c8.xyz) + r4.xyw;
	r2.xyz = (r4.zzz * c9.xyz) + r2.xyz;
	r2.xyz = r0.www * r2.xyz;
	r0.w = clamp(r1.z, 0.0, 1.0);
	r0.xyz = (r2.xyz * r0.www) + r0.xyz;
	r2.x = ((r1.x >= 0.0) ? -c15.w : -c15.y);
	r2.y = ((r1.y >= 0.0) ? -c15.w : -c15.y);
	r2.z = ((r1.z >= 0.0) ? -c15.w : -c15.y);
	r4.xyz = r1.xyz * r1.xyz;
	r1.x = ((r1.x >= 0.0) ? -c15.y : -c15.w);
	r1.y = ((r1.y >= 0.0) ? -c15.y : -c15.w);
	r1.z = ((r1.z >= 0.0) ? -c15.y : -c15.w);
	r1.xyz = r4.xyz * r1.xyz;
	r2.xyz = r2.xyz * r4.xyz;
	r4.xyz = r2.xxx * c5.xyz;
	r4.xyz = (r1.xxx * c4.xyz) + r4.xyz;
	r1.xyw = (r1.yyy * c6.xyz) + r4.xyz;
	r1.xyw = (r2.yyy * c7.xyz) + r1.xyw;
	r1.xyz = (r1.zzz * c8.xyz) + r1.xyw;
	r1.xyz = (r2.zzz * c9.xyz) + r1.xyz;
	r2.xyz = -r2.www + c1.xyz;
	r0.w = clamp(r3.w + c27.z, 0.0, 1.0);
	r2.xyz = (r0.www * r2.xyz) + c3.www;
	r1.xyz = r1.xyz * r2.xyz;
	r1.xyz = r1.xyz * r3.xyz;
	r2.xyz = (c0.xyz * r3.xyz) + -r1.xyz;
	r4 = s14_texture.sample(s14, v0.xy);
	r5.xyz = mix(r3.www, r4.xyz, c10.www);
	r1.xyz = (r5.xyz * r2.xyz) + r1.xyz;
	r2.xyz = max(r1.xyz, -c15.www);
	r0.xyz = r0.xyz + r2.xyz;
	oC0.xyz = r0.xyz * c30.xxx;
	#undef c0
	#undef c1
	#undef c2
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
	#undef c19
	#undef c26
	#undef c27
	#undef c30
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

