#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[12];
};

struct source_main_Input
{
	float4 t0 [[user(texcoord0)]];
	float4 t1 [[user(texcoord1)]];
	float4 t2 [[user(texcoord2)]];
	float4 t3 [[user(texcoord3)]];
	float4 t4 [[user(texcoord4)]];
	float4 t7 [[user(texcoord7), centroid_perspective]];
};

struct source_main_Output
{
	float4 oC0 [[color(0)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	texture2d<float> s1_texture [[texture(1)]],
	sampler s1 [[sampler(1)]],
	texture2d<float> s2_texture [[texture(2)]],
	sampler s2 [[sampler(2)]],
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
	texture2d<float> s4_texture [[texture(4)]],
	sampler s4 [[sampler(4)]],
	texture2d<float> s5_texture [[texture(5)]],
	sampler s5 [[sampler(5)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(0.100000001, 0.0, 0.800000011, 0.200000002); (void) c0;
	const float4 c1 = float4(2.0, -1.0, 0.5, 0.310999989); (void) c1;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	#define c4 uniforms.uniforms_float4[0]
	#define c5 uniforms.uniforms_float4[1]
	#define c6 uniforms.uniforms_float4[2]
	#define c8 uniforms.uniforms_float4[3]
	#define c11 uniforms.uniforms_float4[4]
	#define c12 uniforms.uniforms_float4[5]
	#define c13 uniforms.uniforms_float4[6]
	#define c14 uniforms.uniforms_float4[7]
	#define c22 uniforms.uniforms_float4[8]
	#define c23 uniforms.uniforms_float4[9]
	#define c29 uniforms.uniforms_float4[10]
	#define c30 uniforms.uniforms_float4[11]
	#define t0 input.t0
	#define t1 input.t1
	#define t2 input.t2
	#define t3 input.t3
	#define t4 input.t4
	#define t7 input.t7
	#define oC0 output.oC0
	r0 = s3_texture.sample(s3, t7.xy);
	r1.x = t4.x * c14.z;
	r1.y = -t4.y * c14.z;
	r2.xy = t0.xy * c13.xx;
	r1 = s5_texture.sample(s5, r1.xy);
	r2 = s4_texture.sample(s4, r2.xy);
	r0.w = c14.x + c14.x;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = (c8.x * r0.w) + r1.y;
	r1.x = r0.w + c1.z;
	r1.y = fract(r1.x);
	r1.x = -r1.y + r1.x;
	r1.x = (r1.x * c1.w) + c1.z;
	r3.x = t4.x * c13.y;
	r3.y = -t4.y * c13.y;
	r1.xz = r1.xx + r3.yx;
	r2.xy = (r2.xy * c1.xx) + c1.yy;
	r2.zw = r2.yx * c14.yy;
	r1.xy = (r1.yy * r2.wz) + r1.zx;
	r1.z = fract(r0.w);
	r0.w = r0.w + -r1.z;
	r3.xy = (r0.ww * c1.ww) + r3.xy;
	r3.xy = (r1.zz * r2.wz) + r3.xy;
	r4 = s2_texture.sample(s2, r1.xy);
	r3 = s2_texture.sample(s2, r3.xy);
	r0.w = (r1.z * c1.x) + c1.y;
	r0.w = abs(r0.w);
	r1.xy = mix(r3.xy, r4.xy, r0.ww);
	r1.xy = (r1.xy * c1.xx) + c1.yy;
	r0.w = r2.y * r2.y;
	r0.w = (r2.x * r2.x) + r0.w;
	r0.w = r0.w + c0.x;
	r0.w = r0.w * c13.z;
	r1.xy = r0.ww * r1.xy;
	r0.w = dot(r1.xy, -r1.xy) + -c1.y;
	r1.w = max(r0.w, c0.y);
	r0.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.z = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r2.x = dot(c22.xyz, r1.xyz);
	r2.y = dot(c23.xyz, r1.xyz);
	r0.w = ((t3.w == 0.0) ? FLT_MAX : 1.0 / t3.w);
	r2.zw = r0.ww * t2.yx;
	r2.xy = (r2.xy * c5.xy) + r2.wz;
	r2 = s1_texture.sample(s1, r2.xy);
	r0.xyz = r0.xyz * c30.yyy;
	r0.xyz = r0.xyz * c30.xxx;
	r0.xyz = r0.xyz * c6.xyz;
	r2.xyz = (r2.xyz * c4.xyz) + -r0.xyz;
	r3.xyz = normalize(t1.xyz);
	r0.w = clamp(dot(r3.xyz, r1.xyz), 0.0, 1.0);
	r0.w = -r0.w + -c1.y;
	r2.w = r0.w * r0.w;
	r2.w = r2.w * r2.w;
	r0.w = r0.w * r2.w;
	r0.w = (r0.w * c0.z) + c0.w;
	r0.xyz = (r0.www * r2.xyz) + r0.xyz;
	r1.xyz = -t4.xyz + c11.xyz;
	r0.w = dot(r1.xyz, r1.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = clamp((r0.w * c12.w) + c12.x, 0.0, 1.0);
	r1.x = min(r0.w, c12.z);
	r0.w = r1.x * r1.x;
	r1.xyz = mix(r0.xyz, c29.xyz, r0.www);
	r1.w = c4.w;
	oC0 = r1;
	#undef c4
	#undef c5
	#undef c6
	#undef c8
	#undef c11
	#undef c12
	#undef c13
	#undef c14
	#undef c22
	#undef c23
	#undef c29
	#undef c30
	#undef t0
	#undef t1
	#undef t2
	#undef t3
	#undef t4
	#undef t7
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

