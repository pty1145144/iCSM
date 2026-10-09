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
	float4 v1 [[user(texcoord1)]];
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
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c3 = float4(0.020835099, -0.085133001, -0.330299495, 0.99986601); (void) c3;
	const float4 c4 = float4(0.0, 1.0, 0.5, 0.180141); (void) c4;
	const float4 c5 = float4(-2.0, 1.57079637, 0.0, -3.141592739); (void) c5;
	const float4 c7 = float4(6.283185478, 0.159154935, 0.5, -3.141592739); (void) c7;
	const float4 c8 = float4(1.0, -1.0, 0.0, 0.0); (void) c8;
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
	#define v2 input.v2
	#define oC0 output.oC0
	r0.xy = (v2.zw * -c4.zz) + v2.xy;
	r1.x = max(abs(r0.x), abs(r0.y));
	r0.z = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.x = min(abs(r0.y), abs(r0.x));
	r0.z = r0.z * r1.x;
	r0.w = r0.z * r0.z;
	r1.x = (r0.w * c3.x) + c3.y;
	r1.x = (r0.w * r1.x) + c4.w;
	r1.x = (r0.w * r1.x) + c3.z;
	r0.w = (r0.w * r1.x) + c3.w;
	r0.z = r0.w * r0.z;
	r0.w = (r0.z * c5.x) + c5.y;
	r1.x = -abs(r0.x) + abs(r0.y);
	r1.x = ((r1.x >= 0.0) ? c4.x : c4.y);
	r0.z = (r0.w * r1.x) + r0.z;
	r0.w = ((r0.y >= 0.0) ? c5.z : c5.w);
	r0.z = r0.w + r0.z;
	r0.w = r0.z + r0.z;
	r1.x = max(-r0.x, r0.y);
	r1.x = ((r1.x >= 0.0) ? c4.y : c4.x);
	r1.y = min(r0.y, -r0.x);
	r1.x = ((r1.y >= 0.0) ? c4.x : r1.x);
	r0.z = (r1.x * -r0.w) + r0.z;
	r0.z = r0.z + -c5.w;
	r0.z = r0.z + -c6.z;
	r0.w = r0.z + c7.x;
	r0.z = ((r0.z >= 0.0) ? r0.z : r0.w);
	r0.w = (r0.z * c7.y) + c7.z;
	r0.z = r0.z + -c6.w;
	r0.w = fract(r0.w);
	r0.w = (r0.w * c7.x) + c7.w;
	r1.xy = float2(cos(r0.w), sin(r0.w));
	r1.zw = r1.xy * c8.xy;
	r1.y = dot(r0.xy, r1.yx) + c4.x;
	r1.x = dot(r0.xy, r1.zw) + c4.x;
	r1.xy = -r0.xy + r1.xy;
	r0.w = dot(r1.xy, r1.xy) + c4.x;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = clamp(((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w), 0.0, 1.0);
	r1.x = (r0.z * c7.y) + c7.z;
	r1.x = fract(r1.x);
	r1.x = (r1.x * c7.x) + c7.w;
	r2.xy = float2(cos(r1.x), sin(r1.x));
	r1.xy = r2.xy * c8.xy;
	r2.y = dot(r0.xy, r2.yx) + c4.x;
	r2.x = dot(r0.xy, r1.xy) + c4.x;
	r0.xy = -r0.xy + r2.xy;
	r0.x = dot(r0.xy, r0.xy) + c4.x;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r0.x = clamp(((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x), 0.0, 1.0);
	r0.x = ((r0.z >= 0.0) ? r0.x : c4.x);
	r0.y = r0.w * r0.x;
	r0.z = abs(c6.z);
	r0.x = ((-r0.z >= 0.0) ? r0.x : r0.y);
	r1 = c0;
	r1 = r1 + c2.wxyx;
	r0.y = ((c0.x == 0.0) ? FLT_MAX : 1.0 / c0.x);
	r0.zw = min(c0.yw, c0.xz);
	r2.x = r0.y * r0.z;
	r0.y = ((c0.y == 0.0) ? FLT_MAX : 1.0 / c0.y);
	r2.y = r0.y * r0.z;
	r0.y = ((c0.z == 0.0) ? FLT_MAX : 1.0 / c0.z);
	r2.z = r0.y * r0.w;
	r0.y = ((c0.w == 0.0) ? FLT_MAX : 1.0 / c0.w);
	r2.w = r0.y * r0.w;
	r3 = r1 * r2;
	r4.xy = -v2.xy + v2.zw;
	r4.zw = v2.xy;
	r5 = r2 * r4.zwxw;
	r6 = min(r3, r5);
	r1 = (r1 * r2) + -r6;
	r0.y = dot(r1.xy, r1.xy) + c4.x;
	r1.x = dot(r1.zw, r1.zw) + c4.x;
	r1.x = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.y = clamp(-r0.w + r1.x, 0.0, 1.0);
	r0.y = ((r0.y == 0.0) ? FLT_MAX : rsqrt(abs(r0.y)));
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r1.x = clamp(-r0.z + r0.y, 0.0, 1.0);
	r0.y = ((c1.x == 0.0) ? FLT_MAX : 1.0 / c1.x);
	r0.zw = min(c1.yw, c1.xz);
	r2.x = r0.y * r0.z;
	r0.y = ((c1.y == 0.0) ? FLT_MAX : 1.0 / c1.y);
	r2.y = r0.y * r0.z;
	r0.y = ((c1.z == 0.0) ? FLT_MAX : 1.0 / c1.z);
	r2.z = r0.y * r0.w;
	r0.y = ((c1.w == 0.0) ? FLT_MAX : 1.0 / c1.w);
	r2.w = r0.y * r0.w;
	r3 = r2 * r4.xyzy;
	r4 = c1;
	r4 = r4 + c2.yzwz;
	r5 = r2 * r4;
	r6 = min(r5, r3);
	r2 = (r4 * r2) + -r6;
	r0.y = dot(r2.xy, r2.xy) + c4.x;
	r2.x = dot(r2.zw, r2.zw) + c4.x;
	r2.x = ((r2.x == 0.0) ? FLT_MAX : rsqrt(abs(r2.x)));
	r2.x = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r1.w = clamp(-r0.w + r2.x, 0.0, 1.0);
	r0.y = ((r0.y == 0.0) ? FLT_MAX : rsqrt(abs(r0.y)));
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r1.z = clamp(-r0.z + r0.y, 0.0, 1.0);
	r1 = -r1 + c4.yyyy;
	r2 = s0_texture.sample(s0, v0.xy);
	r2 = r2.wwww * v1;
	r2 = r1.xxxx * r2;
	r2 = r1.yyyy * r2;
	r2 = r1.zzzz * r2;
	r1 = r1.wwww * r2;
	oC0 = r0.xxxx * r1;
	#undef c0
	#undef c1
	#undef c2
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

