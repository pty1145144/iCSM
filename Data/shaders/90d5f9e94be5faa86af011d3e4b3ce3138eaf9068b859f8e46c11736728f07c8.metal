#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[2];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord3)]];
	float4 v2 [[user(texcoord4)]];
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
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(9.990234375e-01, 4.882812500e-04, 0.000000000e+00, 5.000000000e-01); (void) c0;
	const float4 c1 = float4(2.083509974e-02, -8.513300121e-02, 1.801410019e-01, -3.302994967e-01); (void) c1;
	const float4 c2 = float4(9.998660088e-01, 0.000000000e+00, 1.000000000e+00, 3.141592741e+00); (void) c2;
	const float4 c3 = float4(-2.000000000e+00, 1.570796371e+00, 6.283185482e+00, -3.141592741e+00); (void) c3;
	const float4 c5 = float4(1.591549367e-01, 5.000000000e-01, 1.000000000e+00, -1.000000000e+00); (void) c5;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	#define c4 uniforms.uniforms_float4[0]
	#define c6 uniforms.uniforms_float4[1]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define oC0 output.oC0
	r0.xy = (v2.zw * -c0.ww) + v2.xy;
	r1.x = max(abs(r0.x), abs(r0.y));
	r0.z = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.x = min(abs(r0.y), abs(r0.x));
	r0.z = r0.z * r1.x;
	r0.w = r0.z * r0.z;
	r1.x = (r0.w * c1.x) + c1.y;
	r1.x = (r0.w * r1.x) + c1.z;
	r1.x = (r0.w * r1.x) + c1.w;
	r0.w = (r0.w * r1.x) + c2.x;
	r0.z = r0.w * r0.z;
	r0.w = (r0.z * c3.x) + c3.y;
	r1.x = -abs(r0.x) + abs(r0.y);
	r1.x = ((r1.x >= 0.0) ? c2.y : c2.z);
	r0.z = (r0.w * r1.x) + r0.z;
	r0.w = ((r0.y >= 0.0) ? -c2.y : -c2.w);
	r0.z = r0.w + r0.z;
	r0.w = r0.z + r0.z;
	r1.x = max(-r0.x, r0.y);
	r1.x = ((r1.x >= 0.0) ? c2.z : c2.y);
	r1.y = min(r0.y, -r0.x);
	r1.x = ((r1.y >= 0.0) ? c0.z : r1.x);
	r0.z = (r1.x * -r0.w) + r0.z;
	r0.z = r0.z + c2.w;
	r0.z = r0.z + -c6.z;
	r0.w = r0.z + c3.z;
	r0.z = ((r0.z >= 0.0) ? r0.z : r0.w);
	r0.w = (r0.z * c5.x) + c5.y;
	r0.z = r0.z + -c6.w;
	r0.w = fract(r0.w);
	r0.w = (r0.w * c3.z) + c3.w;
	r1.xy = float2(cos(r0.w), sin(r0.w));
	r1.zw = r1.xy * c5.zw;
	r1.y = dot(r0.xy, r1.yx) + c0.z;
	r1.x = dot(r0.xy, r1.zw) + c0.z;
	r1.xy = -r0.xy + r1.xy;
	r0.w = dot(r1.xy, r1.xy) + c0.z;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = clamp(((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w), 0.0, 1.0);
	r1.x = (r0.z * c5.x) + c5.y;
	r1.x = fract(r1.x);
	r1.x = (r1.x * c3.z) + c3.w;
	r2.xy = float2(cos(r1.x), sin(r1.x));
	r1.xy = r2.xy * c5.zw;
	r2.y = dot(r0.xy, r2.yx) + c0.z;
	r2.x = dot(r0.xy, r1.xy) + c0.z;
	r0.xy = -r0.xy + r2.xy;
	r0.x = dot(r0.xy, r0.xy) + c0.z;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r0.x = clamp(((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x), 0.0, 1.0);
	r0.x = ((r0.z >= 0.0) ? r0.x : c0.z);
	r0.y = r0.w * r0.x;
	r0.z = abs(c6.z);
	r0.x = ((-r0.z >= 0.0) ? r0.x : r0.y);
	r0.y = clamp(v0.z, 0.0, 1.0);
	r1.x = (r0.y * c0.x) + c0.y;
	r1.y = c0.z;
	r1 = s3_texture.sample(s3, r1.xy);
	r2 = s0_texture.sample(s0, v0.xy);
	r1 = r1 * r2;
	r2 = s1_texture.sample(s1, v1.xy);
	r2 = r1 * r2.wwww;
	r3 = mix(r1, r2, c4.zzzz);
	oC0 = r0.xxxx * r3;
	#undef c4
	#undef c6
	#undef v0
	#undef v1
	#undef v2
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

