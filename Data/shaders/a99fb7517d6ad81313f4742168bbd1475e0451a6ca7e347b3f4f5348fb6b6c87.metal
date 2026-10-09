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
	texture2d<float> s13_texture [[texture(13)]],
	sampler s13 [[sampler(13)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(2.0, -1.0, 0.0, 1.0); (void) c0;
	const float4 c2 = float4(-0.400000005, 0.0, 0.0, 0.0); (void) c2;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	#define c1 uniforms.uniforms_float4[0]
	#define c5 uniforms.uniforms_float4[1]
	#define c6 uniforms.uniforms_float4[2]
	#define c7 uniforms.uniforms_float4[3]
	#define c8 uniforms.uniforms_float4[4]
	#define c9 uniforms.uniforms_float4[5]
	#define c10 uniforms.uniforms_float4[6]
	#define c12 uniforms.uniforms_float4[7]
	#define c20 uniforms.uniforms_float4[8]
	#define c21 uniforms.uniforms_float4[9]
	#define c22 uniforms.uniforms_float4[10]
	#define c23 uniforms.uniforms_float4[11]
	#define c24 uniforms.uniforms_float4[12]
	#define c25 uniforms.uniforms_float4[13]
	#define c27 uniforms.uniforms_float4[14]
	#define c28 uniforms.uniforms_float4[15]
	#define c29 uniforms.uniforms_float4[16]
	#define c30 uniforms.uniforms_float4[17]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	r0.w = r0.w + c0.y;
	r1.yw = c0.yw;
	r0.w = (c20.w * r0.w) + r1.w;
	r0.w = r0.w * c1.w;
	r1.x = abs(c12.y);
	r1.z = c29.w * v4.w;
	oC0.w = ((-r1.x >= 0.0) ? r0.w : r1.z);
	r2.xyz = v3.xyz;
	r1.xzw = r2.yzx * v2.zxy;
	r1.xzw = (v2.yzx * r2.zxy) + -r1.xzw;
	r1.xzw = r1.xzw * v3.www;
	r2 = s3_texture.sample(s3, v1.xy);
	r2.xyz = (r2.xyz * c0.xxx) + c0.yyy;
	r1.xzw = r1.xzw * r2.yyy;
	r1.xzw = (r2.xxx * v3.xyz) + r1.xzw;
	r1.xzw = (r2.zzz * v2.xyz) + r1.xzw;
	r2.xyz = normalize(r1.xzw);
	r1.x = ((r2.x >= 0.0) ? c0.z : c0.w);
	r1.z = ((r2.y >= 0.0) ? c0.z : c0.w);
	r1.w = ((r2.z >= 0.0) ? c0.z : c0.w);
	r3.xyz = r2.xyz * r2.xyz;
	r1.xzw = r1.xzw * r3.xyz;
	r4.xyz = r1.xxx * c6.xyz;
	r5.x = ((r2.x >= 0.0) ? c0.w : c0.z);
	r5.y = ((r2.y >= 0.0) ? c0.w : c0.z);
	r5.z = ((r2.z >= 0.0) ? c0.w : c0.z);
	r3.xyz = r3.xyz * r5.xyz;
	r4.xyz = (r3.xxx * c5.xyz) + r4.xyz;
	r3.xyw = (r3.yyy * c7.xyz) + r4.xyz;
	r3.xyw = (r1.zzz * c8.xyz) + r3.xyw;
	r3.xyz = (r3.zzz * c9.xyz) + r3.xyw;
	r1.xzw = (r1.www * c10.xyz) + r3.xyz;
	r3.xyz = c23.xyz + -v4.xyz;
	r0.w = dot(r3.xyz, r3.xyz);
	r4.y = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r4.z = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r3.xyz = r3.xyz * r4.yyy;
	r0.w = dot(r3.xyz, r2.xyz);
	r0.w = clamp(r0.w + c28.w, 0.0, 1.0);
	r4.x = c0.w;
	r2.x = clamp(dot(c22.xyz, r4.xyz), 0.0, 1.0);
	r2.y = ((r4.y == 0.0) ? FLT_MAX : 1.0 / r4.y);
	r2.y = r2.y + -c22.w;
	r0.w = r0.w * r2.x;
	r3 = (v4.xyzx * c0.wwwz) + c0.zzzw;
	r4.x = dot(r3, c24);
	r4.y = dot(r3, c25);
	r2.x = dot(r3, c27);
	r2.z = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r2.zw = r2.zz * r4.xy;
	r3 = s7_texture.sample(s7, r2.zw);
	r3.xyz = r3.xyz * c28.xyz;
	r3.xyz = r0.www * r3.xyz;
	r0.w = c22.w;
	r0.w = r0.w * c2.x;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = clamp(r0.w * r2.y, 0.0, 1.0);
	r2.yzw = r0.www * r3.xyz;
	r2.xyz = ((-r2.x >= 0.0) ? c0.zzz : r2.yzw);
	r1.xzw = r1.xzw + r2.xyz;
	r2 = s13_texture.sample(s13, v0.xy);
	r0.w = clamp(r2.y + c12.x, 0.0, 1.0);
	r2.xyz = r1.yyy + c1.xyz;
	r2.xyz = (r0.www * r2.xyz) + c0.www;
	r1.xyz = r1.xzw * r2.xyz;
	r0.xyz = r0.xyz * r1.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	r2.xyz = c20.xyz + -v4.xyz;
	r0.w = dot(r2.xyz, r2.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = clamp((r0.w * c21.w) + c21.x, 0.0, 1.0);
	r1.w = min(r0.w, c21.z);
	r0.w = r1.w * r1.w;
	oC0.xyz = (r0.www * r0.xyz) + r1.xyz;
	#undef c1
	#undef c5
	#undef c6
	#undef c7
	#undef c8
	#undef c9
	#undef c10
	#undef c12
	#undef c20
	#undef c21
	#undef c22
	#undef c23
	#undef c24
	#undef c25
	#undef c27
	#undef c28
	#undef c29
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

