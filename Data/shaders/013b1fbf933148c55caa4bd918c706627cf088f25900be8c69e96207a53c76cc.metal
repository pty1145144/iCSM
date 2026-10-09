#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[1];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
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
	const float4 c1 = float4(0.02, 0.01, -0.01, -0.02); (void) c1;
	const float4 c2 = float4(0.200000002, 10.0, 0.900000023, -0.200000002); (void) c2;
	const float4 c3 = float4(0.100000001, 0.680000005, 0.300000011, 0.5); (void) c3;
	const float4 c4 = float4(6.666666506, -2.0, 3.0, 1.25); (void) c4;
	const float4 c5 = float4(0.800000011, 0.400000005, 0.600000023, 0.850000023); (void) c5;
	const float4 c6 = float4(4.0, 0.0, 0.0, 0.0); (void) c6;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	#define c0 uniforms.uniforms_float4[0]
	#define v0 input.v0
	#define oC0 output.oC0
	r0 = s3_texture.sample(s3, v0.xy);
	r0.x = r0.w + c2.w;
	r0.y = clamp(r0.w * c6.x, 0.0, 1.0);
	r0.x = clamp(r0.x * c4.x, 0.0, 1.0);
	r0.z = (r0.x * c4.y) + c4.z;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r0.z;
	r0.x = r0.x * c4.w;
	r1 = c1.xyzx + v0.xyxy;
	r2 = s0_texture.sample(s0, r1.xy);
	r1 = s0_texture.sample(s0, r1.zw);
	r3 = s0_texture.sample(s0, v0.xy);
	r0.zw = r2.yz + r3.yz;
	r0.zw = r1.yz + r0.zw;
	r1 = c1.wzyw + v0.xyxy;
	r2 = s0_texture.sample(s0, r1.xy);
	r1 = s0_texture.sample(s0, r1.zw);
	r0.zw = r0.zw + r2.yz;
	r0.zw = r1.yz + r0.zw;
	r1.xy = r0.zw * c2.xx;
	r2.x = c2.x;
	r2.z = (r0.z * r2.x) + c0.y;
	r1.zw = c3.zw;
	r4 = s2_texture.sample(s2, r1.yw);
	r1 = s2_texture.sample(s2, r1.xz);
	r4 = r4 * c0.xxxx;
	r4 = r0.xxxx * r4;
	r2.yw = c3.xy;
	r5 = s2_texture.sample(s2, r2.zw);
	r0.xzw = (r5.xyz * c2.xxx) + r1.xyz;
	r0.xzw = (r0.xzw * c5.xxx) + -r4.xyz;
	r0.xzw = (r1.www * r0.xzw) + r4.xyz;
	r1.x = r4.w * c5.y;
	r1.y = r1.w * c5.z;
	r2.z = max(r1.x, r1.y);
	r1.xy = c2.yy * v0.xy;
	r1 = s1_texture.sample(s1, r1.xy);
	r1.x = r1.x + c2.z;
	r2.x = r1.x * r3.x;
	r1 = s2_texture.sample(s2, r2.xy);
	r1.xyz = -r0.xzw + r1.xyz;
	oC0.xyz = (r1.www * r1.xyz) + r0.xzw;
	r0.x = r1.w * c5.w;
	r1.x = clamp(max(r2.z, r0.x), 0.0, 1.0);
	oC0.w = r0.y * r1.x;
	#undef c0
	#undef v0
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

