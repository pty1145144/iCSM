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
	float4 t7 [[user(texcoord7), centroid_perspective]];
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
	texture2d<float> s2_texture [[texture(2)]],
	sampler s2 [[sampler(2)]],
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(2.000000000e+00, -1.000000000e+00, 1.000000000e+00, -5.000000075e-02); (void) c0;
	const float4 c2 = float4(8.000000119e-01, 2.000000030e-01, 3.500000000e+00, 2.000000000e+01); (void) c2;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	#define c1 uniforms.uniforms_float4[0]
	#define c4 uniforms.uniforms_float4[1]
	#define c5 uniforms.uniforms_float4[2]
	#define c6 uniforms.uniforms_float4[3]
	#define c22 uniforms.uniforms_float4[4]
	#define c23 uniforms.uniforms_float4[5]
	#define c24 uniforms.uniforms_float4[6]
	#define c30 uniforms.uniforms_float4[7]
	#define t0 input.t0
	#define t1 input.t1
	#define t2 input.t2
	#define t3 input.t3
	#define t7 input.t7
	#define oC0 output.oC0
	r0 = s3_texture.sample(s3, t7.xy);
	r0.xyz = r0.xyz * c30.yyy;
	r0.xyz = r0.xyz * c30.xxx;
	r0.w = ((t3.w == 0.0) ? FLT_MAX : 1.0 / t3.w);
	r1.xy = r0.ww * t2.wz;
	r2.x = (r1.x * c24.x) + c24.z;
	r2.y = (r1.y * c24.y) + c24.w;
	r1 = s2_texture.sample(s2, t0.xy);
	r2 = s0_texture.sample(s0, r2.xy);
	r1.xyz = (r1.xyz * c0.xxx) + c0.yyy;
	r3.w = dot(c22.xyz, r1.xyz);
	r3.xw = r3.ww;
	r3.z = dot(c23.xyz, r1.xyz);
	r3.yz = r3.zz;
	r3 = r1.wwww * r3;
	r4 = r0.wwww * t2;
	r5 = r2.wwww * c5;
	r3 = (r3 * r5) + r4;
	r4.xy = r3.wz;
	r3 = s1_texture.sample(s1, r3.xy);
	r4 = s0_texture.sample(s0, r4.xy);
	r3.xyz = r3.xyz * c4.xyz;
	r0.w = r4.w + c0.w;
	r5.xz = ((r0.w >= 0.0) ? r4.wy : r2.wy);
	r5.w = ((r0.w >= 0.0) ? r4.z : r2.z);
	r5.y = ((r0.w >= 0.0) ? r4.x : r2.x);
	r0.w = clamp(r5.x * c2.z, 0.0, 1.0);
	r2.xy = (r5.yz * c1.xy) + -r5.yz;
	r2.z = (r5.w * c1.z) + -r5.w;
	r4.xy = (r0.ww * r2.xy) + r5.yz;
	r4.z = (r0.w * r2.z) + r5.w;
	r0.xyz = (c6.xyz * r0.xyz) + -r4.xyz;
	r0.xyz = (r5.xxx * r0.xyz) + r4.xyz;
	r2.xyz = normalize(t1.xyz);
	r0.w = clamp(dot(r2.xyz, r1.xyz), 0.0, 1.0);
	r0.w = -r0.w + c0.z;
	r3.w = r0.w * r0.w;
	r3.w = r3.w * r3.w;
	r0.w = r0.w * r3.w;
	r0.w = (r0.w * c2.x) + c2.y;
	r3.w = r5.x + c0.w;
	r1.x = clamp(r5.x + r5.x, 0.0, 1.0);
	r1.xyz = r1.xxx * r3.xyz;
	r1.w = clamp(r3.w * c2.w, 0.0, 1.0);
	r0.w = r0.w * r1.w;
	r0.xyz = (r0.www * r1.xyz) + r0.xyz;
	r0.w = c4.w;
	oC0 = r0;
	#undef c1
	#undef c4
	#undef c5
	#undef c6
	#undef c22
	#undef c23
	#undef c24
	#undef c30
	#undef t0
	#undef t1
	#undef t2
	#undef t3
	#undef t7
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

