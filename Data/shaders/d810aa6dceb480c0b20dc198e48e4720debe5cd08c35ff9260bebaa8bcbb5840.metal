#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[8];
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
	const float4 c0 = float4(1.000000015e-01, 0.000000000e+00, 8.000000119e-01, 2.000000030e-01); (void) c0;
	const float4 c1 = float4(2.000000000e+00, -1.000000000e+00, 5.000000000e-01, 3.109999895e-01); (void) c1;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	#define c4 uniforms.uniforms_float4[0]
	#define c5 uniforms.uniforms_float4[1]
	#define c8 uniforms.uniforms_float4[2]
	#define c13 uniforms.uniforms_float4[3]
	#define c14 uniforms.uniforms_float4[4]
	#define c22 uniforms.uniforms_float4[5]
	#define c23 uniforms.uniforms_float4[6]
	#define c30 uniforms.uniforms_float4[7]
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
	r0.y = r0.x + c1.z;
	r0.z = fract(r0.y);
	r0.y = -r0.z + r0.y;
	r0.y = (r0.y * c1.w) + c1.z;
	r2.x = t4.x * c13.y;
	r2.y = -t4.y * c13.y;
	r1.zw = r0.yy + r2.yx;
	r1.xy = (r1.xy * c1.xx) + c1.yy;
	r2.zw = r1.yx * c14.yy;
	r3.xy = (r0.zz * r2.wz) + r1.wz;
	r0.y = fract(r0.x);
	r0.x = -r0.y + r0.x;
	r0.xz = (r0.xx * c1.ww) + r2.yx;
	r2.xy = (r0.yy * r2.wz) + r0.zx;
	r3 = s2_texture.sample(s2, r3.xy);
	r2 = s2_texture.sample(s2, r2.xy);
	r0.x = (r0.y * c1.x) + c1.y;
	r0.x = abs(r0.x);
	r1.zw = mix(r2.yx, r3.yx, r0.xx);
	r0.xy = (r1.wz * c1.xx) + c1.yy;
	r0.z = r1.y * r1.y;
	r0.z = (r1.x * r1.x) + r0.z;
	r0.z = r0.z + c0.x;
	r0.z = r0.z * c13.z;
	r0.xy = r0.zz * r0.xy;
	r0.w = dot(r0.xy, -r0.xy) + -c1.y;
	r1.x = max(r0.w, c0.y);
	r0.w = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r0.z = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = dot(r0.xyz, r0.xyz);
	r1.xyz = normalize(t1.xyz);
	r2.xyz = r0.www * r1.xyz;
	r0.w = dot(r0.xyz, r1.xyz);
	r2.w = r0.w + r0.w;
	r0.w = clamp(r0.w, 0.0, 1.0);
	r0.w = -r0.w + -c1.y;
	r1.xyz = (r2.www * r0.xyz) + -r2.xyz;
	r2.x = dot(c22.xyz, r0.xyz);
	r2.y = dot(c23.xyz, r0.xyz);
	r1.w = ((t3.w == 0.0) ? FLT_MAX : 1.0 / t3.w);
	r0.xy = r1.ww * t2.wz;
	r0.xy = (r2.xy * c5.wz) + r0.xy;
	r1 = s1_texture.sample(s1, r1.xyz);
	r2 = s0_texture.sample(s0, r0.xy);
	r0.xyz = r1.xyz * c30.zzz;
	r0.xyz = r0.xyz * c4.xyz;
	r2.w = r0.w * r0.w;
	r2.w = r2.w * r2.w;
	r0.w = r0.w * r2.w;
	r0.w = (r0.w * c0.z) + c0.w;
	r0.xyz = (r0.www * r0.xyz) + r2.xyz;
	r0.w = c4.w;
	oC0 = r0;
	#undef c4
	#undef c5
	#undef c8
	#undef c13
	#undef c14
	#undef c22
	#undef c23
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

