#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[11];
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
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(2.0, -1.0, 0.0, 1.0); (void) c0;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	#define c1 uniforms.uniforms_float4[0]
	#define c5 uniforms.uniforms_float4[1]
	#define c6 uniforms.uniforms_float4[2]
	#define c7 uniforms.uniforms_float4[3]
	#define c8 uniforms.uniforms_float4[4]
	#define c9 uniforms.uniforms_float4[5]
	#define c10 uniforms.uniforms_float4[6]
	#define c12 uniforms.uniforms_float4[7]
	#define c20 uniforms.uniforms_float4[8]
	#define c29 uniforms.uniforms_float4[9]
	#define c30 uniforms.uniforms_float4[10]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define oC0 output.oC0
	r0.x = abs(c12.y);
	r0.y = c29.w * v4.w;
	r1 = s0_texture.sample(s0, v0.xy);
	r0.z = r1.w + c0.y;
	r2.yw = c0.yw;
	r0.z = (c20.w * r0.z) + r2.w;
	r0.z = r0.z * c1.w;
	oC0.w = ((-r0.x >= 0.0) ? r0.z : r0.y);
	r0.xyz = v3.xyz;
	r2.xzw = r0.yzx * v2.zxy;
	r0.xyz = (v2.yzx * r0.zxy) + -r2.xzw;
	r0.xyz = r0.xyz * v3.www;
	r3 = s3_texture.sample(s3, v1.xy);
	r2.xzw = (r3.xyz * c0.xxx) + c0.yyy;
	r0.xyz = r0.xyz * r2.zzz;
	r0.xyz = (r2.xxx * v3.xyz) + r0.xyz;
	r0.xyz = (r2.www * v2.xyz) + r0.xyz;
	r3.xyz = normalize(r0.xyz);
	r0.x = ((r3.x >= 0.0) ? c0.z : c0.w);
	r0.y = ((r3.y >= 0.0) ? c0.z : c0.w);
	r0.z = ((r3.z >= 0.0) ? c0.z : c0.w);
	r2.xzw = r3.xyz * r3.xyz;
	r3.x = ((r3.x >= 0.0) ? c0.w : c0.z);
	r3.y = ((r3.y >= 0.0) ? c0.w : c0.z);
	r3.z = ((r3.z >= 0.0) ? c0.w : c0.z);
	r3.xyz = r2.xzw * r3.xyz;
	r0.xyz = r0.xyz * r2.xzw;
	r2.xzw = r0.xxx * c6.xyz;
	r2.xzw = (r3.xxx * c5.xyz) + r2.xzw;
	r2.xzw = (r3.yyy * c7.xyz) + r2.xzw;
	r0.xyw = (r0.yyy * c8.xyz) + r2.xzw;
	r0.xyw = (r3.zzz * c9.xyz) + r0.xyw;
	r0.xyz = (r0.zzz * c10.xyz) + r0.xyw;
	r0.w = clamp(r1.w + c12.x, 0.0, 1.0);
	r2.xyz = r2.yyy + c1.xyz;
	r2.xyz = (r0.www * r2.xyz) + c0.www;
	r0.xyz = r0.xyz * r2.xyz;
	r0.xyz = r0.xyz * r1.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	r0.w = v2.w * v2.w;
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

