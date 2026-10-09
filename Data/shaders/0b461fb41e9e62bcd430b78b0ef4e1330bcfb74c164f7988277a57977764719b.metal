#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_relational>
#include <metal_geometric>
#include <metal_graphics>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[16];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord2)]];
	float4 v2 [[user(texcoord6)]];
	float4 v3 [[user(texcoord7)]];
};

struct source_main_Output
{
	float4 oC0 [[color(0)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	texture2d<float> s4_texture [[texture(4)]],
	sampler s4 [[sampler(4)]],
	texture2d<float> s15_texture [[texture(15)]],
	sampler s15 [[sampler(15)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(1.0, 0.0, -0.150000004, 0.5); (void) c0;
	const float4 c1 = float4(1.041666626, -0.020833333, 0.000488281, 0.0); (void) c1;
	const float4 c2 = float4(-0.000488281, 0.000488281, 0.0, 0.062499999); (void) c2;
	const float4 c3 = float4(0.125, 0.25, 0.0, 0.0); (void) c3;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	#define c11 uniforms.uniforms_float4[0]
	#define c30 uniforms.uniforms_float4[1]
	#define c64 uniforms.uniforms_float4[2]
	#define c67 uniforms.uniforms_float4[3]
	#define c68 uniforms.uniforms_float4[4]
	#define c69 uniforms.uniforms_float4[5]
	#define c70 uniforms.uniforms_float4[6]
	#define c71 uniforms.uniforms_float4[7]
	#define c73 uniforms.uniforms_float4[8]
	#define c74 uniforms.uniforms_float4[9]
	#define c77 uniforms.uniforms_float4[10]
	#define c78 uniforms.uniforms_float4[11]
	#define c85 uniforms.uniforms_float4[12]
	#define c86 uniforms.uniforms_float4[13]
	#define c87 uniforms.uniforms_float4[14]
	#define c89 uniforms.uniforms_float4[15]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define oC0 output.oC0
	r0.xyz = c0.xxy * v0.xyx;
	r0.w = c11.w;
	r0 = s4_texture.sample(s4, r0.xy, bias(r0.w));
	r1 = (r0.wwww * v1.wwww) + c0.zzzz;
	if (any(r1.xyz < float3(0.0))) discard_fragment();
	r1 = (v3.xyzx * c0.xxxy) + c0.yyyx;
	r2.x = dot(r1, c73);
	r2.y = dot(r1, c74);
	r2.zw = (r2.xy * c1.xx) + c1.yy;
	r3.xy = clamp(r2.zw, float2(0.0), float2(1.0));
	r2.zw = -r2.zw + r3.xy;
	r0.w = dot(r2.zw, c0.xx) + c0.y;
	r2.z = dot(r1, c77);
	r3.x = ((-abs(r0.w) >= 0.0) ? r2.x : r2.z);
	r2.x = dot(r1, c78);
	r3.y = ((-abs(r0.w) >= 0.0) ? r2.y : r2.x);
	r2.x = dot(r1, c69);
	r2.y = dot(r1, c70);
	r1.z = dot(r1, c71);
	r2.zw = (r2.xy * c1.xx) + c1.yy;
	r3.zw = clamp(r2.zw, float2(0.0), float2(1.0));
	r2.zw = -r2.zw + r3.zw;
	r2.z = dot(r2.zw, c0.xx) + c0.y;
	r2.xy = ((-abs(r2.z) >= 0.0) ? r2.xy : r3.xy);
	r3.xy = clamp(r2.xy, float2(0.0), float2(1.0));
	r2.xy = r2.xy + -c0.ww;
	r2.xy = abs(r2.xy) + -c67.zz;
	r2.xy = clamp(r2.xy * c67.ww, float2(0.0), float2(1.0));
	r2.xy = -r2.xy + c0.xx;
	r4.xy = c86.xy;
	r3.zw = ((-abs(r0.w) >= 0.0) ? r4.xy : c87.xy);
	r0.w = ((-abs(r0.w) >= 0.0) ? c0.x : c0.y);
	r0.w = ((-abs(r2.z) >= 0.0) ? c0.x : r0.w);
	r2.zw = ((-abs(r2.z) >= 0.0) ? c85.xy : r3.zw);
	r1.xy = (r3.xy * c0.ww) + r2.zw;
	r0.w = clamp((r2.x * r2.y) + r0.w, 0.0, 1.0);
	r1.w = c0.y;
	r2 = r1 + c1.zzww;
	r2 = s15_texture.sample(s15, r2.xy, level(r2.w));
	r3 = r1 + c2.xyzz;
	r3 = s15_texture.sample(s15, r3.xy, level(r3.w));
	r2.y = r3.x;
	r3 = r1 + c2.yxzz;
	r3 = s15_texture.sample(s15, r3.xy, level(r3.w));
	r2.z = r3.x;
	r3 = r1 + c2.xxzz;
	r3 = s15_texture.sample(s15, r3.xy, level(r3.w));
	r2.w = r3.x;
	r2.x = dot(r2, c2.wwww);
	r3 = r1 + c1.zwww;
	r3 = s15_texture.sample(s15, r3.xy, level(r3.w));
	r4 = r1 + c2.xzzz;
	r4 = s15_texture.sample(s15, r4.xy, level(r4.w));
	r3.y = r4.x;
	r4 = r1 + c2.zxzz;
	r4 = s15_texture.sample(s15, r4.xy, level(r4.w));
	r3.z = r4.x;
	r4 = r1 + c1.wzww;
	r1 = s15_texture.sample(s15, r1.xy, level(r1.w));
	r4 = s15_texture.sample(s15, r4.xy, level(r4.w));
	r3.w = r4.x;
	r1.y = dot(r3, c3.xxxx);
	r1.y = r1.y + r2.x;
	r1.x = (r1.x * c3.y) + r1.y;
	r2.x = mix(c0.x, r1.x, r0.w);
	r1.xyz = -c89.xyz + v3.xyz;
	r0.w = dot(r1.xyz, r1.xyz);
	r0.w = clamp((r0.w * c68.y) + c68.x, 0.0, 1.0);
	r1.x = mix(r2.x, c0.x, r0.w);
	r1.yzw = c64.www * c64.xyz;
	r2.xyz = (r1.yzw * r1.xxx) + v2.xyz;
	r1.xyz = (r1.yzw * v2.www) + v2.xyz;
	r3.xyz = mix(r2.xyz, r1.xyz, v2.www);
	r0.xyz = r0.xyz * r3.xyz;
	r0.xyz = r0.xyz * v1.xyz;
	oC0.xyz = r0.xyz * c30.xxx;
	oC0.w = c0.x;
	#undef c11
	#undef c30
	#undef c64
	#undef c67
	#undef c68
	#undef c69
	#undef c70
	#undef c71
	#undef c73
	#undef c74
	#undef c77
	#undef c78
	#undef c85
	#undef c86
	#undef c87
	#undef c89
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

