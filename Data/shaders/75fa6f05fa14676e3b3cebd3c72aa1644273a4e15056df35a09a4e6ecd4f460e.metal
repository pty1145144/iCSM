#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[10];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord3)]];
	float4 v2 [[user(texcoord6)]];
	float4 v3 [[user(texcoord7)]];
};

struct source_main_Output
{
	float4 oC0 [[color(0)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	texture2d<float> s0_texture [[texture(0)]],
	sampler s0 [[sampler(0)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(-1.000000000e+00, 1.000000000e+00, -2.000000000e+00, 3.000000000e+00); (void) c0;
	const float4 c2 = float4(7.999999798e-04, -7.999999821e-02, 2.500000000e+01, 0.000000000e+00); (void) c2;
	float4 r0;
	float4 r1;
	#define c1 uniforms.uniforms_float4[0]
	#define c6 uniforms.uniforms_float4[1]
	#define c12 uniforms.uniforms_float4[2]
	#define c20 uniforms.uniforms_float4[3]
	#define c29 uniforms.uniforms_float4[4]
	#define c30 uniforms.uniforms_float4[5]
	#define c43 uniforms.uniforms_float4[6]
	#define c44 uniforms.uniforms_float4[7]
	#define c45 uniforms.uniforms_float4[8]
	#define c46 uniforms.uniforms_float4[9]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define oC0 output.oC0
	r0.x = clamp(v0.y, 0.0, 1.0);
	r0.xy = r0.xx + -c46.yz;
	r0.zw = -c46.yz + c46.zw;
	r0.z = ((r0.z == 0.0) ? FLT_MAX : 1.0 / r0.z);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.xy = clamp(r0.zw * r0.xy, float2(0.0), float2(1.0));
	r0.z = (r0.x * c0.z) + c0.w;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r0.z;
	r1.xyz = c43.xyz;
	r1.xyz = -r1.xyz + c44.xyz;
	r0.xzw = (r0.xxx * r1.xyz) + c43.xyz;
	r1.x = (r0.y * c0.z) + c0.w;
	r0.y = r0.y * r0.y;
	r0.y = r0.y * r1.x;
	r0.y = r0.y * r0.y;
	r1.xyz = mix(r0.xzw, c45.xyz, r0.yyy);
	r0.xyz = r1.xyz * c1.xyz;
	r1.x = c46.x;
	r0.xyz = ((-r1.x >= 0.0) ? c1.xyz : r0.xyz);
	r0.xyz = r0.xyz + c0.xxx;
	r1 = s0_texture.sample(s0, v0.xy);
	r0.w = clamp(r1.w + c12.x, 0.0, 1.0);
	r0.xyz = (r0.www * r0.xyz) + c0.yyy;
	r0.xyz = r0.xyz * r1.xyz;
	r0.w = r1.w + c0.x;
	r1.y = c0.y;
	r0.w = (c20.w * r0.w) + r1.y;
	r0.w = r0.w * c1.w;
	oC0.xyz = r0.xyz * c30.xxx;
	r0.x = (r0.w * v2.w) + -r0.w;
	r0.x = (c12.w * r0.x) + r0.w;
	r0.yzw = -c6.xyz + v1.xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.y = ((r0.y == 0.0) ? FLT_MAX : rsqrt(abs(r0.y)));
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r0.y = (r0.y * c2.x) + c2.y;
	r0.y = clamp(r0.y * c2.z, 0.0, 1.0);
	r0.z = (r0.y * c0.z) + c0.w;
	r0.y = r0.y * r0.y;
	r0.y = r0.y * r0.z;
	r0.x = r0.y * r0.x;
	r0.y = abs(c12.y);
	r0.z = c29.w * v3.z;
	oC0.w = ((-r0.y >= 0.0) ? r0.x : r0.z);
	#undef c1
	#undef c6
	#undef c12
	#undef c20
	#undef c29
	#undef c30
	#undef c43
	#undef c44
	#undef c45
	#undef c46
	#undef v0
	#undef v1
	#undef v2
	#undef v3
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

