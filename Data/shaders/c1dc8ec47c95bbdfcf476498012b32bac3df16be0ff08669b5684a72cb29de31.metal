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
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(2.0, -1.0, 0.0, 1.0); (void) c0;
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
	#define c7 uniforms.uniforms_float4[4]
	#define c8 uniforms.uniforms_float4[5]
	#define c9 uniforms.uniforms_float4[6]
	#define c11 uniforms.uniforms_float4[7]
	#define c12 uniforms.uniforms_float4[8]
	#define c13 uniforms.uniforms_float4[9]
	#define c14 uniforms.uniforms_float4[10]
	#define c27 uniforms.uniforms_float4[11]
	#define c29 uniforms.uniforms_float4[12]
	#define c30 uniforms.uniforms_float4[13]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define oC0 output.oC0
	r0.yw = c0.yw;
	r0.xz = r0.ww + -c27.xy;
	r0.x = r0.x * c27.z;
	r0.x = r0.z * r0.x;
	r1 = s0_texture.sample(s0, v0.xy);
	r0.z = r1.w + c0.y;
	r0.x = (r0.x * r0.z) + c0.w;
	oC0.w = r0.x * c1.w;
	r2.xyz = v3.xyz;
	r3.xyz = r2.yzx * v2.zxy;
	r2.xyz = (v2.yzx * r2.zxy) + -r3.xyz;
	r2.xyz = r2.xyz * v3.www;
	r3 = s3_texture.sample(s3, v1.xy);
	r3.xyz = (r3.xyz * c0.xxx) + c0.yyy;
	r2.xyz = r2.xyz * r3.yyy;
	r2.xyz = (r3.xxx * v3.xyz) + r2.xyz;
	r2.xyz = (r3.zzz * v2.xyz) + r2.xyz;
	r3.xyz = normalize(r2.xyz);
	r2.x = ((r3.x >= 0.0) ? c0.z : c0.w);
	r2.y = ((r3.y >= 0.0) ? c0.z : c0.w);
	r2.z = ((r3.z >= 0.0) ? c0.z : c0.w);
	r4.xyz = r3.xyz * r3.xyz;
	r2.xyz = r2.xyz * r4.xyz;
	r5.xyz = r2.xxx * c5.xyz;
	r6.x = ((r3.x >= 0.0) ? c0.w : c0.z);
	r6.y = ((r3.y >= 0.0) ? c0.w : c0.z);
	r6.z = ((r3.z >= 0.0) ? c0.w : c0.z);
	r4.xyz = r4.xyz * r6.xyz;
	r5.xyz = (r4.xxx * c4.xyz) + r5.xyz;
	r4.xyw = (r4.yyy * c6.xyz) + r5.xyz;
	r2.xyw = (r2.yyy * c7.xyz) + r4.xyw;
	r2.xyw = (r4.zzz * c8.xyz) + r2.xyw;
	r2.xyz = (r2.zzz * c9.xyz) + r2.xyw;
	r0.x = clamp(r1.w + c27.z, 0.0, 1.0);
	r4.xyz = r0.yyy + c1.xyz;
	r0.xyz = (r0.xxx * r4.xyz) + c0.www;
	r0.xyz = r0.xyz * r2.xyz;
	r0.xyz = r0.xyz * r1.xyz;
	r1.xyz = c11.xyz + -v4.xyz;
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.xyz = r1.www * r1.xyz;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = clamp((r1.w * c12.w) + c12.x, 0.0, 1.0);
	r2.x = min(r1.w, c12.z);
	r1.w = r2.x * r2.x;
	r2.x = ((r1.x >= 0.0) ? c0.z : c0.w);
	r2.y = ((r1.y >= 0.0) ? c0.z : c0.w);
	r2.z = ((r1.z >= 0.0) ? c0.z : c0.w);
	r4.xyz = r1.xyz * r1.xyz;
	r2.xyz = r2.xyz * r4.xyz;
	r5.xyz = r2.xxx * c5.xyz;
	r6.x = ((r1.x >= 0.0) ? c0.w : c0.z);
	r6.y = ((r1.y >= 0.0) ? c0.w : c0.z);
	r6.z = ((r1.z >= 0.0) ? c0.w : c0.z);
	r1.x = clamp(dot(r3.xyz, r1.xyz), 0.0, 1.0);
	r1.y = clamp(r3.z, 0.0, 1.0);
	r1.x = -r1.x + c0.w;
	r1.x = r1.x * r1.x;
	r1.x = r1.x * r1.x;
	r3.xyz = r4.xyz * r6.xyz;
	r4.xyz = (r3.xxx * c4.xyz) + r5.xyz;
	r3.xyw = (r3.yyy * c6.xyz) + r4.xyz;
	r2.xyw = (r2.yyy * c7.xyz) + r3.xyw;
	r2.xyw = (r3.zzz * c8.xyz) + r2.xyw;
	r2.xyz = (r2.zzz * c9.xyz) + r2.xyw;
	r3 = s7_texture.sample(s7, v0.xy);
	r1.z = r3.w + c0.y;
	r0.w = (c13.x * r1.z) + r0.w;
	r0.w = r0.w * r1.x;
	r0.w = r0.w * c14.w;
	r2.xyz = r2.xyz * r0.www;
	r0.xyz = (r2.xyz * r1.yyy) + r0.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	oC0.xyz = (r1.www * r0.xyz) + r1.xyz;
	#undef c1
	#undef c4
	#undef c5
	#undef c6
	#undef c7
	#undef c8
	#undef c9
	#undef c11
	#undef c12
	#undef c13
	#undef c14
	#undef c27
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

