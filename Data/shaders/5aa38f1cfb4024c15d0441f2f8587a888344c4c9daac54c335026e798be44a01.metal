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
	texture2d<float> s4_texture [[texture(4)]],
	sampler s4 [[sampler(4)]],
	texture2d<float> s5_texture [[texture(5)]],
	sampler s5 [[sampler(5)]],
	texture2d<float> s11_texture [[texture(11)]],
	sampler s11 [[sampler(11)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(1.000000015e-01, 0.000000000e+00, 8.000000119e-01, 2.000000030e-01); (void) c0;
	const float4 c2 = float4(2.000000000e+00, -1.000000000e+00, 5.000000000e-01, 3.109999895e-01); (void) c2;
	const float4 c3 = float4(-5.000000075e-02, 3.500000000e+00, 2.000000000e+01, -9.999999776e-03); (void) c3;
	const float4 c7 = float4(5.000000000e+00, 0.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c7;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
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
	#define t7 input.t7
	#define oC0 output.oC0
	r0 = s3_texture.sample(s3, t7.xy);
	r1 = s11_texture.sample(s11, t0.xy);
	r2.x = t4.x * c14.z;
	r2.y = -t4.y * c14.z;
	r3.xy = t0.xy * c13.xx;
	r2 = s5_texture.sample(s5, r2.xy);
	r3 = s4_texture.sample(s4, r3.xy);
	r0.w = c14.x + c14.x;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = (c8.x * r0.w) + r2.y;
	r2.x = r0.w + c2.z;
	r2.y = fract(r2.x);
	r2.x = -r2.y + r2.x;
	r2.x = (r2.x * c2.w) + c2.z;
	r4.x = t4.x * c13.y;
	r4.y = -t4.y * c13.y;
	r2.xz = r2.xx + r4.yx;
	r3.xy = (r3.xy * c2.xx) + c2.yy;
	r3.zw = r3.yx * c14.yy;
	r2.xy = (r2.yy * r3.wz) + r2.zx;
	r2.z = fract(r0.w);
	r0.w = r0.w + -r2.z;
	r4.xy = (r0.ww * c2.ww) + r4.xy;
	r4.xy = (r2.zz * r3.wz) + r4.xy;
	r0.w = ((t3.w == 0.0) ? FLT_MAX : 1.0 / t3.w);
	r3.zw = r0.ww * t2.zw;
	r5.x = (r3.w * c24.x) + c24.z;
	r5.y = (r3.z * c24.y) + c24.w;
	r6 = s2_texture.sample(s2, r2.xy);
	r4 = s2_texture.sample(s2, r4.xy);
	r5 = s0_texture.sample(s0, r5.xy);
	r2.x = (r2.z * c2.x) + c2.y;
	r2.x = abs(r2.x);
	r3.zw = mix(r4.yx, r6.yx, r2.xx);
	r2.xy = (r3.wz * c2.xx) + c2.yy;
	r2.z = r3.y * r3.y;
	r2.z = (r3.x * r3.x) + r2.z;
	r2.z = r2.z + c0.x;
	r2.z = r2.z * c13.z;
	r2.xy = r2.zz * r2.xy;
	r2.w = dot(r2.xy, -r2.xy) + -c2.y;
	r3.x = max(r2.w, c0.y);
	r2.w = ((r3.x == 0.0) ? FLT_MAX : rsqrt(abs(r3.x)));
	r2.z = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r3.xyz = normalize(t1.xyz);
	r2.w = clamp(dot(r3.xyz, r2.xyz), 0.0, 1.0);
	r2.w = -r2.w + -c2.y;
	r3.x = r2.w * r2.w;
	r3.x = r3.x * r3.x;
	r2.w = r2.w * r3.x;
	r2.w = (r2.w * c0.z) + c0.w;
	r3.xw = float2(dot(c22.xyz, r2.xyz));
	r3.yz = float2(dot(c23.xyz, r2.xyz));
	r4 = r0.wwww * t2;
	r6 = r5.wwww * c5;
	r3 = (r3 * r6) + r4;
	r2.xy = r3.wz;
	r3 = s1_texture.sample(s1, r3.xy);
	r4 = s0_texture.sample(s0, r2.xy);
	r2.xyz = r3.xyz * c4.xyz;
	r0.w = r4.w + c3.x;
	r3.xz = ((r0.w >= 0.0) ? r4.wy : r5.wy);
	r3.w = ((r0.w >= 0.0) ? r4.z : r5.z);
	r3.y = ((r0.w >= 0.0) ? r4.x : r5.x);
	r0.w = r3.x + c3.x;
	r0.w = clamp(r0.w * c3.z, 0.0, 1.0);
	r0.w = r0.w * r2.w;
	r2.w = clamp(r3.x * c3.y, 0.0, 1.0);
	r4.xy = (r3.yz * c1.xy) + -r3.yz;
	r4.z = (r3.w * c1.z) + -r3.w;
	r5.xy = (r2.ww * r4.xy) + r3.yz;
	r5.z = (r2.w * r4.z) + r3.w;
	r0.xyz = r0.xyz * c30.yyy;
	r0.xyz = r0.xyz * c30.xxx;
	r3.yzw = (c6.zyx * r0.zyx) + -r5.zyx;
	r3.yzw = (r3.xxx * r3.yzw) + r5.zyx;
	r2.w = clamp(r3.x + r3.x, 0.0, 1.0);
	r3.x = r3.x + c3.w;
	r3.x = clamp(r3.x * c7.x, 0.0, 1.0);
	r2.xyz = r2.www * r2.xyz;
	r2.xyz = (r0.www * r2.xyz) + r3.wzy;
	r0.xyz = (r1.xyz * r0.xyz) + -r2.xyz;
	r0.w = r1.w * r3.x;
	r0.xyz = (r0.www * r0.xyz) + r2.xyz;
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
	#undef t7
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

