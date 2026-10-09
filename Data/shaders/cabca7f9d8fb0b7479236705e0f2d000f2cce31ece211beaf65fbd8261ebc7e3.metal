#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[5];
};

struct source_main_Input
{
	float4 t0 [[user(texcoord0)]];
	float4 t5 [[user(texcoord5)]];
	float4 t7 [[user(texcoord7)]];
};

struct source_main_Output
{
	float4 oC0 [[color(0)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	texture2d<float> s2_texture [[texture(2)]],
	sampler s2 [[sampler(2)]],
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(2.000000000e+00, -1.000000000e+00, -9.765625000e-04, 1.953125000e-03); (void) c0;
	const float4 c2 = float4(-9.765625000e-04, 1.953125000e-03, 2.222221941e-01, 4.444443882e-01); (void) c2;
	const float4 c3 = float4(1.111110970e-01, 0.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c3;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	#define c1 uniforms.uniforms_float4[0]
	#define c5 uniforms.uniforms_float4[1]
	#define c11 uniforms.uniforms_float4[2]
	#define c12 uniforms.uniforms_float4[3]
	#define c29 uniforms.uniforms_float4[4]
	#define t0 input.t0
	#define t5 input.t5
	#define t7 input.t7
	#define oC0 output.oC0
	r0 = s3_texture.sample(s3, t0.xy);
	r1.xyz = -t7.xyz + c11.xyz;
	r1.x = dot(r1.xyz, r1.xyz);
	r1.x = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.x = clamp((r1.x * c12.w) + c12.x, 0.0, 1.0);
	r2.w = min(r1.x, c12.z);
	r1.x = r2.w * r2.w;
	r1.y = ((t5.z == 0.0) ? FLT_MAX : 1.0 / t5.z);
	r1.yz = r1.yy * t5.xy;
	r2.xy = (r0.xy * c0.xx) + c0.yy;
	r1.w = r0.w * c5.x;
	r1.yz = (r2.xy * r1.ww) + r1.yz;
	r2.xy = r1.yz + c0.wz;
	r3.xy = r1.yz + c0.zz;
	r4.xy = r1.yz + c2.xy;
	r5.xy = r1.yz + c0.ww;
	r2 = s2_texture.sample(s2, r2.xy);
	r3 = s2_texture.sample(s2, r3.xy);
	r5 = s2_texture.sample(s2, r5.xy);
	r4 = s2_texture.sample(s2, r4.xy);
	r1.yzw = r2.zyx * c2.zzz;
	r1.yzw = (r3.zyx * c2.www) + r1.yzw;
	r1.yzw = (r4.zyx * c2.zzz) + r1.yzw;
	r1.yzw = (r5.zyx * c3.xxx) + r1.yzw;
	r2.xyz = r1.wzy * c1.xyz;
	r3.xyz = c1.xyz;
	r1.yzw = (r1.yzw * -r3.zyx) + c29.zyx;
	r0.xyz = (r1.xxx * r1.wzy) + r2.xyz;
	oC0 = r0;
	#undef c1
	#undef c5
	#undef c11
	#undef c12
	#undef c29
	#undef t0
	#undef t5
	#undef t7
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

