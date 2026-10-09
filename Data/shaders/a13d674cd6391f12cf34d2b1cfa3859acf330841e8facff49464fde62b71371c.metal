#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[4];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord4)]];
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
	const float4 c3 = float4(0.999023439, 0.000488281, 0.0, 1.0); (void) c3;
	const float4 c4 = float4(0.5, 0.020835099, -0.085133001, 0.180141); (void) c4;
	const float4 c5 = float4(-0.330299495, 0.99986601, -2.0, 1.57079637); (void) c5;
	const float4 c7 = float4(0.0, -3.141592739, 3.141592739, 6.283185478); (void) c7;
	const float4 c8 = float4(0.159154935, 0.5, 1.0, -1.0); (void) c8;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c2 uniforms.uniforms_float4[2]
	#define c6 uniforms.uniforms_float4[3]
	#define v0 input.v0
	#define v1 input.v1
	#define oC0 output.oC0
	r0 = c0;
	r0 = r0 + c2.wxyx;
	r1.x = ((c0.x == 0.0) ? FLT_MAX : 1.0 / c0.x);
	r1.yz = min(c0.yw, c0.xz);
	r2.x = r1.x * r1.y;
	r1.x = ((c0.y == 0.0) ? FLT_MAX : 1.0 / c0.y);
	r2.y = r1.x * r1.y;
	r1.x = ((c0.z == 0.0) ? FLT_MAX : 1.0 / c0.z);
	r2.z = r1.x * r1.z;
	r1.x = ((c0.w == 0.0) ? FLT_MAX : 1.0 / c0.w);
	r2.w = r1.x * r1.z;
	r3 = r0 * r2;
	r4.xy = -v1.xy + v1.zw;
	r4.zw = v1.xy;
	r5 = r2 * r4.zwxw;
	r6 = min(r3, r5);
	r0 = (r0 * r2) + -r6;
	r0.x = dot(r0.xy, r0.xy) + c3.z;
	r0.y = dot(r0.zw, r0.zw) + c3.z;
	r0.y = ((r0.y == 0.0) ? FLT_MAX : rsqrt(abs(r0.y)));
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r2.xy = clamp(-r1.yz + r0.xy, float2(0.0), float2(1.0));
	r0.x = ((c1.x == 0.0) ? FLT_MAX : 1.0 / c1.x);
	r0.yz = min(c1.yw, c1.xz);
	r1.x = r0.x * r0.y;
	r0.x = ((c1.y == 0.0) ? FLT_MAX : 1.0 / c1.y);
	r1.y = r0.x * r0.y;
	r0.x = ((c1.z == 0.0) ? FLT_MAX : 1.0 / c1.z);
	r1.z = r0.x * r0.z;
	r0.x = ((c1.w == 0.0) ? FLT_MAX : 1.0 / c1.w);
	r1.w = r0.x * r0.z;
	r3 = r1 * r4.xyzy;
	r4 = c1;
	r4 = r4 + c2.yzwz;
	r5 = r1 * r4;
	r6 = min(r5, r3);
	r1 = (r4 * r1) + -r6;
	r0.x = dot(r1.xy, r1.xy) + c3.z;
	r0.w = dot(r1.zw, r1.zw) + c3.z;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r2.zw = clamp(-r0.yz + r0.xw, float2(0.0), float2(1.0));
	r0 = -r2 + c3.wwww;
	r1.x = clamp(v0.z, 0.0, 1.0);
	r1.x = (r1.x * c3.x) + c3.y;
	r1.y = c3.z;
	r1 = s3_texture.sample(s3, r1.xy);
	r2 = s0_texture.sample(s0, v0.xy);
	r1 = r1 * r2;
	r1 = r0.xxxx * r1;
	r1 = r0.yyyy * r1;
	r1 = r0.zzzz * r1;
	r0 = r0.wwww * r1;
	r1.xy = (v1.zw * -c4.xx) + v1.xy;
	r2.x = max(abs(r1.x), abs(r1.y));
	r1.z = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r2.x = min(abs(r1.y), abs(r1.x));
	r1.z = r1.z * r2.x;
	r1.w = r1.z * r1.z;
	r2.x = (r1.w * c4.y) + c4.z;
	r2.x = (r1.w * r2.x) + c4.w;
	r2.x = (r1.w * r2.x) + c5.x;
	r1.w = (r1.w * r2.x) + c5.y;
	r1.z = r1.w * r1.z;
	r1.w = (r1.z * c5.z) + c5.w;
	r2.x = -abs(r1.x) + abs(r1.y);
	r2.x = ((r2.x >= 0.0) ? c3.z : c3.w);
	r1.z = (r1.w * r2.x) + r1.z;
	r1.w = ((r1.y >= 0.0) ? c7.x : c7.y);
	r1.z = r1.w + r1.z;
	r1.w = r1.z + r1.z;
	r2.x = max(-r1.x, r1.y);
	r2.x = ((r2.x >= 0.0) ? c3.w : c3.z);
	r2.y = min(r1.y, -r1.x);
	r2.x = ((r2.y >= 0.0) ? c3.z : r2.x);
	r1.z = (r2.x * -r1.w) + r1.z;
	r1.z = r1.z + c7.z;
	r1.z = r1.z + -c6.z;
	r1.w = r1.z + c7.w;
	r1.z = ((r1.z >= 0.0) ? r1.z : r1.w);
	r1.w = (r1.z * c8.x) + c8.y;
	r1.z = r1.z + -c6.w;
	r1.w = fract(r1.w);
	r1.w = (r1.w * c7.w) + c7.y;
	r2.xy = float2(cos(r1.w), sin(r1.w));
	r2.zw = r2.xy * c8.zw;
	r2.y = dot(r1.xy, r2.yx) + c3.z;
	r2.x = dot(r1.xy, r2.zw) + c3.z;
	r2.xy = -r1.xy + r2.xy;
	r1.w = dot(r2.xy, r2.xy) + c3.z;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.w = clamp(((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w), 0.0, 1.0);
	r2.x = (r1.z * c8.x) + c8.y;
	r2.x = fract(r2.x);
	r2.x = (r2.x * c7.w) + c7.y;
	r3.xy = float2(cos(r2.x), sin(r2.x));
	r2.xy = r3.xy * c8.zw;
	r3.y = dot(r1.xy, r3.yx) + c3.z;
	r3.x = dot(r1.xy, r2.xy) + c3.z;
	r1.xy = -r1.xy + r3.xy;
	r1.x = dot(r1.xy, r1.xy) + c3.z;
	r1.x = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r1.x = clamp(((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x), 0.0, 1.0);
	r1.x = ((r1.z >= 0.0) ? r1.x : c3.z);
	r1.y = r1.w * r1.x;
	r1.z = abs(c6.z);
	r1.x = ((-r1.z >= 0.0) ? r1.x : r1.y);
	oC0 = r0 * r1.xxxx;
	#undef c0
	#undef c1
	#undef c2
	#undef c6
	#undef v0
	#undef v1
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

