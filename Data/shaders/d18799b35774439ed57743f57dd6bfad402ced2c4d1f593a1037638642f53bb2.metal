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
	float4 uniforms_float4[6];
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
	const float4 c0 = float4(0.999899985, 2.0, -2.0, 0.0); (void) c0;
	const float4 c2 = float4(-1.0, 1.0, 0.000976562, 1.000976562); (void) c2;
	const float4 c3 = float4(0.01, 0.990000011, 0.001, 8.5); (void) c3;
	const float4 c4 = float4(0.200000002, -0.007843137, -2.0, 3.0); (void) c4;
	const float4 c6 = float4(50.0, 0.0001, 5.0, 0.5); (void) c6;
	const float4 c7 = float4(-0.002, -0.200000002, -0.100000001, -0.25); (void) c7;
	const float4 c8 = float4(0.300000011, 0.589999973, 0.11, 0.04); (void) c8;
	const float4 c9 = float4(1.666666625, -6.666666506, -2500.0, -6000.0); (void) c9;
	const float4 c10 = float4(-0.0004, -0.0005, -0.490000011, -33.33333206); (void) c10;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	#define c1 uniforms.uniforms_float4[0]
	#define c5 uniforms.uniforms_float4[1]
	#define c15 uniforms.uniforms_float4[2]
	#define c16 uniforms.uniforms_float4[3]
	#define c17 uniforms.uniforms_float4[4]
	#define c18 uniforms.uniforms_float4[5]
	#define v0 input.v0
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	r1 = -r0.xxxx + c0.xxxx;
	r0.z = r0.x;
	if (any(r1.xyz < float3(0.0))) discard_fragment();
	r1 = c2;
	r0.xyw = (v0.xyx * c0.yzw) + r1.xyy;
	r1.x = dot(r0, c18);
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r2.x = dot(r0, c15);
	r2.y = dot(r0, c16);
	r2.z = dot(r0, c17);
	r0.xy = (r2.xy * r1.xx) + c5.xy;
	r2.xyw = (r2.xyz * -r1.xxx) + c1.xyz;
	r0.z = r1.x * r2.z;
	r0.w = dot(r2.xyw, r2.xyw);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r1.xy = r0.ww + c9.zw;
	r1.xy = r1.yx * c10.yx;
	r2.xy = r0.xy * c5.zw;
	r2.xy = (r2.xy * c2.yx) + c2.zw;
	r2 = s1_texture.sample(s1, r2.xy);
	r0.x = (r0.x * c5.z) + r1.z;
	r0.y = (r0.y * -c5.w) + r1.w;
	r1.z = max(c3.x, r0.y);
	r2.z = min(r1.z, c3.y);
	r1.z = max(c3.x, r0.x);
	r2.y = min(r1.z, c3.y);
	r3 = r2.yzyz + c3.xzzx;
	r4 = s1_texture.sample(s1, r3.xy);
	r3 = s1_texture.sample(s1, r3.zw);
	r0.x = r2.x + r4.x;
	r0.x = r3.x + r0.x;
	r3 = r2.yzyz + -c3.xzzx;
	r4 = s1_texture.sample(s1, r3.xy);
	r3 = s1_texture.sample(s1, r3.zw);
	r0.x = r0.x + r4.x;
	r0.x = r3.x + r0.x;
	r3 = (r0.xxxx * c4.xxxx) + c4.yyyy;
	r0.x = clamp(r3.w * c3.w, 0.0, 1.0);
	if (any(r3.xyz < float3(0.0))) discard_fragment();
	r3.yz = r2.yz * c6.xx;
	r0.yw = -r2.yz + c6.ww;
	r0.yw = abs(r0.yw) + c10.zz;
	r0.yw = clamp(r0.yw * c10.ww, float2(0.0), float2(1.0));
	r3.x = (r0.z * c6.y) + r3.y;
	r2 = s3_texture.sample(s3, r3.xz);
	r0.z = (r0.x * c4.z) + c4.w;
	r0.x = r0.x * r0.x;
	r1.z = (r0.z * r0.x) + -r2.y;
	r1.w = (r0.z * r0.x) + -r1.z;
	r0.x = r0.x * r0.z;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r0.x;
	r0.x = clamp((r0.x * r1.w) + r1.z, 0.0, 1.0);
	r2 = r0.xxxx + c7;
	r3 = r2.xxxx;
	if (any(r3.xyz < float3(0.0))) discard_fragment();
	r1.z = pow(abs(r0.x), c4.x);
	r0.x = clamp(r0.x * c6.z, 0.0, 1.0);
	r0.z = r1.z + c2.x;
	r1.z = (r0.z * abs(c4.z)) + abs(c4.w);
	r0.z = r0.z * r0.z;
	r2.xz = clamp(r2.zw * c9.xy, float2(0.0), float2(1.0));
	r3.xy = (r2.xz * c4.zz) + c4.ww;
	r2.xz = r2.xz * r2.xz;
	r2.xz = r2.xz * r3.xy;
	r0.z = (r1.z * r0.z) + r2.z;
	r0.z = ((r2.y >= 0.0) ? r0.z : c0.w);
	r2.z = max(r1.y, c0.w);
	r1.x = clamp(r1.x, 0.0, 1.0);
	r1.y = (r2.z * c4.z) + c4.w;
	r1.z = r2.z * r2.z;
	r1.y = r1.z * r1.y;
	r3 = s2_texture.sample(s2, v0.xy);
	r1.z = dot(c8.xyz, r3.xyz);
	r2.zw = r1.zz * c6.wz;
	r1.w = fract(abs(r2.w));
	r1.z = ((r1.z >= 0.0) ? r1.w : -r1.w);
	r1.z = (r1.z * -c8.w) + r2.z;
	r1.w = r2.x * r1.z;
	r1.z = r1.z * c8.x;
	r2.yz = ((r2.y >= 0.0) ? r1.ww : r1.zz);
	r2.x = (r0.z * r1.y) + r2.z;
	r1.yzw = -r3.xyz + r2.xyz;
	r0.z = (r1.x * c4.z) + c4.w;
	r1.x = r1.x * r1.x;
	r0.z = r0.z * r1.x;
	oC0.xyz = (r0.zzz * r1.yzw) + r3.xyz;
	r1.xy = (r0.yw * c4.zz) + c4.ww;
	r0.yz = r0.yw * r0.yw;
	r0.yz = r0.yz * r1.xy;
	r0.y = r0.z * r0.y;
	r0.z = (r0.x * c4.z) + c4.w;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r0.z;
	oC0.w = r0.y * r0.x;
	#undef c1
	#undef c5
	#undef c15
	#undef c16
	#undef c17
	#undef c18
	#undef v0
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

