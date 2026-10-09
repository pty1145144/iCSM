#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[14];
};

struct source_main_Input
{
	float4 t0 [[user(texcoord0)]];
	float4 t1 [[user(texcoord1)]];
	float4 t2 [[user(texcoord2)]];
	float4 t3 [[user(texcoord3)]];
	float4 t4 [[user(texcoord4)]];
};

struct source_main_Output
{
	float4 oC0 [[color(0)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	texture2d<float> s0_texture [[texture(0)]],
	sampler s0 [[sampler(0)]],
	texturecube<float> s1_texture [[texture(1)]],
	sampler s1 [[sampler(1)]],
	texture2d<float> s2_texture [[texture(2)]],
	sampler s2 [[sampler(2)]],
	texture2d<float> s4_texture [[texture(4)]],
	sampler s4 [[sampler(4)]],
	texture2d<float> s5_texture [[texture(5)]],
	sampler s5 [[sampler(5)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(0.100000001, 0.0, 0.800000011, 0.200000002); (void) c0;
	const float4 c2 = float4(2.0, -1.0, 0.5, 0.310999989); (void) c2;
	const float4 c3 = float4(-0.05, 3.5, 20.0, 0.0); (void) c3;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	#define c1 uniforms.uniforms_float4[0]
	#define c4 uniforms.uniforms_float4[1]
	#define c5 uniforms.uniforms_float4[2]
	#define c6 uniforms.uniforms_float4[3]
	#define c8 uniforms.uniforms_float4[4]
	#define c11 uniforms.uniforms_float4[5]
	#define c12 uniforms.uniforms_float4[6]
	#define c13 uniforms.uniforms_float4[7]
	#define c14 uniforms.uniforms_float4[8]
	#define c22 uniforms.uniforms_float4[9]
	#define c23 uniforms.uniforms_float4[10]
	#define c24 uniforms.uniforms_float4[11]
	#define c29 uniforms.uniforms_float4[12]
	#define c30 uniforms.uniforms_float4[13]
	#define t0 input.t0
	#define t1 input.t1
	#define t2 input.t2
	#define t3 input.t3
	#define t4 input.t4
	#define oC0 output.oC0
	r0.x = t4.x * c14.z;
	r0.y = -t4.y * c14.z;
	r1.xy = t0.xy * c13.xx;
	r0 = s5_texture.sample(s5, r0.xy);
	r1 = s4_texture.sample(s4, r1.xy);
	r0.x = c14.x + c14.x;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = (c8.x * r0.x) + r0.y;
	r0.y = r0.x + c2.z;
	r0.z = fract(r0.y);
	r0.y = -r0.z + r0.y;
	r0.y = (r0.y * c2.w) + c2.z;
	r2.x = t4.x * c13.y;
	r2.y = -t4.y * c13.y;
	r1.zw = r0.yy + r2.yx;
	r1.xy = (r1.xy * c2.xx) + c2.yy;
	r2.zw = r1.yx * c14.yy;
	r3.xy = (r0.zz * r2.wz) + r1.wz;
	r0.y = fract(r0.x);
	r0.x = -r0.y + r0.x;
	r0.xz = (r0.xx * c2.ww) + r2.yx;
	r2.xy = (r0.yy * r2.wz) + r0.zx;
	r0.x = ((t3.w == 0.0) ? FLT_MAX : 1.0 / t3.w);
	r0.zw = r0.xx * t2.zw;
	r4.x = (r0.w * c24.x) + c24.z;
	r4.y = (r0.z * c24.y) + c24.w;
	r3 = s2_texture.sample(s2, r3.xy);
	r2 = s2_texture.sample(s2, r2.xy);
	r4 = s0_texture.sample(s0, r4.xy);
	r0.x = (r0.y * c2.x) + c2.y;
	r0.x = abs(r0.x);
	r1.zw = mix(r2.yx, r3.yx, r0.xx);
	r0.xy = (r1.wz * c2.xx) + c2.yy;
	r1.y = r1.y * r1.y;
	r1.x = (r1.x * r1.x) + r1.y;
	r1.x = r1.x + c0.x;
	r1.x = r1.x * c13.z;
	r1.xy = r0.xy * r1.xx;
	r1.w = dot(r1.xy, -r1.xy) + -c2.y;
	r0.x = max(r1.w, c0.y);
	r1.w = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r1.z = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = dot(r1.xyz, r1.xyz);
	r2.xyz = normalize(t1.xyz);
	r3.xyz = r1.www * r2.xyz;
	r1.w = dot(r1.xyz, r2.xyz);
	r3.w = r1.w + r1.w;
	r1.w = clamp(r1.w, 0.0, 1.0);
	r1.w = -r1.w + -c2.y;
	r2.xyz = (r3.www * r1.xyz) + -r3.xyz;
	r0.x = dot(c22.xyz, r1.xyz);
	r0.y = dot(c23.xyz, r1.xyz);
	r1.xy = r4.ww * c5.wz;
	r0.xy = (r0.xy * r1.xy) + r0.wz;
	r2 = s1_texture.sample(s1, r2.xyz);
	r0 = s0_texture.sample(s0, r0.xy);
	r1.xyz = r2.xyz * c30.zzz;
	r1.xyz = r1.xyz * c4.xyz;
	r2.x = r0.w + c3.x;
	r3.xz = ((r2.x >= 0.0) ? r0.wy : r4.wy);
	r3.w = ((r2.x >= 0.0) ? r0.z : r4.z);
	r3.y = ((r2.x >= 0.0) ? r0.x : r4.x);
	r0.x = clamp(r3.x + r3.x, 0.0, 1.0);
	r0.xyz = r0.xxx * r1.xyz;
	r0.w = clamp(r3.x * c3.y, 0.0, 1.0);
	r1.xy = (r3.yz * c1.xy) + -r3.yz;
	r1.z = (r3.w * c1.z) + -r3.w;
	r2.xy = (r0.ww * r1.xy) + r3.yz;
	r2.z = (r0.w * r1.z) + r3.w;
	r1.xyz = mix(r2.xyz, c6.xyz, r3.xxx);
	r0.w = r3.x + c3.x;
	r0.w = clamp(r0.w * c3.z, 0.0, 1.0);
	r2.x = r1.w * r1.w;
	r2.x = r2.x * r2.x;
	r1.w = r1.w * r2.x;
	r1.w = (r1.w * c0.z) + c0.w;
	r0.w = r0.w * r1.w;
	r0.xyz = (r0.www * r0.xyz) + r1.xyz;
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
	#undef c1
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
	#undef c24
	#undef c29
	#undef c30
	#undef t0
	#undef t1
	#undef t2
	#undef t3
	#undef t4
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

