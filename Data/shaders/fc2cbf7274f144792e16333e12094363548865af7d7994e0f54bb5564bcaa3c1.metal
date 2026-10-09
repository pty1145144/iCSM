#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[15];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord2)]];
	float4 v2 [[user(texcoord3)]];
	float4 v3 [[user(texcoord6)]];
	float4 v4 [[user(texcoord7)]];
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
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c2 = float4(-2.0, 3.0, -1.0, 1.0); (void) c2;
	const float4 c4 = float4(0.298999992, 0.587000012, 0.114, 0.0); (void) c4;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c3 uniforms.uniforms_float4[2]
	#define c7 uniforms.uniforms_float4[3]
	#define c12 uniforms.uniforms_float4[4]
	#define c13 uniforms.uniforms_float4[5]
	#define c19 uniforms.uniforms_float4[6]
	#define c20 uniforms.uniforms_float4[7]
	#define c21 uniforms.uniforms_float4[8]
	#define c29 uniforms.uniforms_float4[9]
	#define c30 uniforms.uniforms_float4[10]
	#define c43 uniforms.uniforms_float4[11]
	#define c44 uniforms.uniforms_float4[12]
	#define c45 uniforms.uniforms_float4[13]
	#define c46 uniforms.uniforms_float4[14]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define oC0 output.oC0
	r0.x = (c1.w * v3.w) + -c1.w;
	r1 = c1;
	r0.x = (c12.w * r0.x) + r1.w;
	r0.y = abs(c12.y);
	r0.z = c29.w * v4.z;
	oC0.w = ((-r0.y >= 0.0) ? r0.x : r0.z);
	r0.x = clamp(v0.y, 0.0, 1.0);
	r0.xy = r0.xx + -c46.yz;
	r0.zw = -c46.yz + c46.zw;
	r0.z = ((r0.z == 0.0) ? FLT_MAX : 1.0 / r0.z);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.xy = clamp(r0.zw * r0.xy, float2(0.0), float2(1.0));
	r0.z = (r0.x * c2.x) + c2.y;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r0.z;
	r2.xyz = c43.xyz;
	r2.xyz = -r2.xyz + c44.xyz;
	r0.xzw = (r0.xxx * r2.xyz) + c43.xyz;
	r1.w = (r0.y * c2.x) + c2.y;
	r0.y = r0.y * r0.y;
	r0.y = r0.y * r1.w;
	r0.y = r0.y * r0.y;
	r2.xyz = mix(r0.xzw, c45.xyz, r0.yyy);
	r0.xyz = r2.xyz * c1.xyz;
	r0.xyz = ((-c46.x >= 0.0) ? r1.xyz : r0.xyz);
	r0.xyz = r0.xyz + c2.zzz;
	r1 = s0_texture.sample(s0, v0.xy);
	r0.w = clamp(r1.w + c12.x, 0.0, 1.0);
	r0.xyz = (r0.www * r0.xyz) + c2.www;
	r2.xyz = r0.xyz + -c19.zzz;
	r2.xyz = r2.xyz * c19.www;
	r3.xyz = c20.xyz + -v2.xyz;
	r0.w = dot(v1.xyz, r3.xyz);
	r0.w = r0.w + r0.w;
	r2.w = dot(v1.xyz, v1.xyz);
	r4.xyz = r3.xyz * r2.www;
	r2.w = dot(r3.xyz, r3.xyz);
	r2.w = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r2.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r2.w = clamp((r2.w * c21.w) + c21.x, 0.0, 1.0);
	r3.x = min(r2.w, c21.z);
	r2.w = r3.x * r3.x;
	r3.xyz = (r0.www * v1.xyz) + -r4.xyz;
	r3 = s1_texture.sample(s1, r3.xyz);
	r3.xyz = r3.xyz * c30.zzz;
	r0.w = pow(abs(r1.w), c13.w);
	r0.w = clamp((c7.w * r0.w) + c7.z, 0.0, 1.0);
	r3.xyz = r0.www * r3.xyz;
	r3.xyz = r3.xyz * c0.xyz;
	r2.xyz = (r3.xyz * r2.xyz) + -r3.xyz;
	r2.xyz = (c19.yyy * r2.xyz) + r3.xyz;
	r3.xyz = (r2.xyz * r2.xyz) + -r2.xyz;
	r2.xyz = (c19.xxx * r3.xyz) + r2.xyz;
	r0.w = dot(r2.xyz, c4.xyz);
	r3.xyz = mix(r0.www, r2.xyz, c3.xyz);
	r0.xyz = (r1.xyz * r0.xyz) + r3.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	oC0.xyz = (r2.www * r0.xyz) + r1.xyz;
	#undef c0
	#undef c1
	#undef c3
	#undef c7
	#undef c12
	#undef c13
	#undef c19
	#undef c20
	#undef c21
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
	#undef v4
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

