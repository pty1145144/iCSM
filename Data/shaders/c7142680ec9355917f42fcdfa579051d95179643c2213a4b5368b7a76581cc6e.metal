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
	const float4 c0 = float4(-0.062499999, -0.5, 1.595800042, 1.164299963); (void) c0;
	const float4 c1 = float4(0.16666667, 0.333333342, 0.666666684, 0.0); (void) c1;
	const float4 c2 = float4(6.0, 1.0, 0.999023439, 0.000488281); (void) c2;
	const float4 c3 = float4(-1.0, -2.0, -3.0, -4.0); (void) c3;
	const float4 c4 = float4(0.020835099, -0.085133001, 0.180141, -0.330299495); (void) c4;
	const float4 c7 = float4(0.99986601, 0.0, 1.0, 3.141592739); (void) c7;
	const float4 c8 = float4(-2.0, 1.57079637, 6.283185478, -3.141592739); (void) c8;
	const float4 c9 = float4(0.159154935, 0.5, 1.0, -1.0); (void) c9;
	const float4 c10 = float4(0.391730013, 2.01699996, 0.812900006, 2.200000047); (void) c10;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	#define c5 uniforms.uniforms_float4[0]
	#define c6 uniforms.uniforms_float4[1]
	#define v0 input.v0
	#define v1 input.v1
	#define oC0 output.oC0
	r0 = s1_texture.sample(s1, v0.xy);
	r0.x = r0.x + c0.y;
	r0.xy = r0.xx * c10.xy;
	r1 = s0_texture.sample(s0, v0.xy);
	r0.z = r1.x + c0.x;
	r0.x = (r0.z * c0.w) + -r0.x;
	r0.y = (r0.z * c0.w) + r0.y;
	r1.y = pow(abs(r0.y), c10.w);
	r2 = s2_texture.sample(s2, v0.xy);
	r0.y = r2.x + c0.y;
	r0.x = (r0.y * -c10.z) + r0.x;
	r0.y = r0.y * c0.z;
	r0.y = (r0.z * c0.w) + r0.y;
	r1.z = pow(abs(r0.y), c10.w);
	r1.x = pow(abs(r0.x), c10.w);
	r0.x = -r1.y + r1.x;
	r0.xy = ((r0.x >= 0.0) ? r1.yx : r1.xy);
	r2.x = max(r1.z, r0.y);
	r2.y = min(r0.x, r1.z);
	r0.x = -r2.y + r2.x;
	r0.yzw = -r1.xyz + r2.xxx;
	r1.xyz = r1.zxy + -r2.xxx;
	r1.w = r0.x * -c0.y;
	r0.yzw = (r0.yzw * c1.xxx) + r1.www;
	r1.w = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r2.yz = (r0.wy * r1.ww) + c1.yz;
	r2.yz = (r0.zw * -r1.ww) + r2.yz;
	r0.w = ((-abs(r1.z) >= 0.0) ? r2.z : c1.w);
	r0.w = ((-abs(r1.y) >= 0.0) ? r2.y : r0.w);
	r0.y = r0.y * r1.w;
	r0.y = (r0.z * r1.w) + -r0.y;
	r0.y = ((-abs(r1.x) >= 0.0) ? r0.y : r0.w);
	r1.x = fract(r0.y);
	r0.y = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r2.y = c0.y;
	r0.z = (r2.x * c5.z) + r2.y;
	r2.z = (c5.w * r0.z) + -r2.y;
	r1.y = r0.y * r0.x;
	r0.xy = ((-abs(r0.x) >= 0.0) ? c1.ww : r1.xy);
	r0.x = r0.x + c5.x;
	r0.x = fract(r0.x);
	r0.z = r0.x * c2.x;
	r0.w = fract(r0.z);
	r0.z = -r0.w + r0.z;
	r1 = r0.zzzz + c3;
	r0.x = (r0.x * c2.x) + -r0.z;
	r0.w = -r0.x + c2.y;
	r3.x = r0.y * c5.y;
	r3.y = c2.y;
	r0.y = (r0.y * -c5.y) + r3.y;
	r2.x = r0.y * r2.z;
	r0.y = (r3.x * -r0.w) + c2.y;
	r0.x = (r3.x * -r0.x) + c2.y;
	r2.yw = r0.yx * r2.zz;
	r4.xz = ((-abs(r1.w) >= 0.0) ? r2.yz : r2.zw);
	r4.y = r2.x;
	r0.xyw = ((-abs(r1.z) >= 0.0) ? r2.xwz : r4.xyz);
	r0.xyw = ((-abs(r1.y) >= 0.0) ? r2.xzy : r0.xyw);
	r0.xyw = ((-abs(r1.x) >= 0.0) ? r2.wzx : r0.xyw);
	r0.xyz = ((-abs(r0.z) >= 0.0) ? r2.zyx : r0.xyw);
	r0.xyz = ((-abs(r3.x) >= 0.0) ? r2.zzz : r0.xyz);
	r1.x = clamp(v0.z, 0.0, 1.0);
	r1.x = (r1.x * c2.z) + c2.w;
	r1.y = c1.w;
	r1 = s3_texture.sample(s3, r1.xy);
	r0.w = c2.y;
	r0 = r0 * r1;
	r1.xy = (v1.zw * c0.yy) + v1.xy;
	r2.x = max(abs(r1.x), abs(r1.y));
	r1.z = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r2.x = min(abs(r1.y), abs(r1.x));
	r1.z = r1.z * r2.x;
	r1.w = r1.z * r1.z;
	r2.x = (r1.w * c4.x) + c4.y;
	r2.x = (r1.w * r2.x) + c4.z;
	r2.x = (r1.w * r2.x) + c4.w;
	r1.w = (r1.w * r2.x) + c7.x;
	r1.z = r1.w * r1.z;
	r1.w = (r1.z * c8.x) + c8.y;
	r2.x = -abs(r1.x) + abs(r1.y);
	r2.x = ((r2.x >= 0.0) ? c7.y : c7.z);
	r1.z = (r1.w * r2.x) + r1.z;
	r1.w = ((r1.y >= 0.0) ? -c7.y : -c7.w);
	r1.z = r1.w + r1.z;
	r1.w = r1.z + r1.z;
	r2.x = max(-r1.x, r1.y);
	r2.x = ((r2.x >= 0.0) ? c7.z : c7.y);
	r2.y = min(r1.y, -r1.x);
	r2.x = ((r2.y >= 0.0) ? c1.w : r2.x);
	r1.z = (r2.x * -r1.w) + r1.z;
	r1.z = r1.z + c7.w;
	r1.z = r1.z + -c6.z;
	r1.w = r1.z + c8.z;
	r1.z = ((r1.z >= 0.0) ? r1.z : r1.w);
	r1.w = (r1.z * c9.x) + c9.y;
	r1.z = r1.z + -c6.w;
	r1.w = fract(r1.w);
	r1.w = (r1.w * c8.z) + c8.w;
	r2.xy = float2(cos(r1.w), sin(r1.w));
	r2.zw = r2.xy * c9.zw;
	r2.y = dot(r1.xy, r2.yx) + c1.w;
	r2.x = dot(r1.xy, r2.zw) + c1.w;
	r2.xy = -r1.xy + r2.xy;
	r1.w = dot(r2.xy, r2.xy) + c1.w;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.w = clamp(((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w), 0.0, 1.0);
	r2.x = (r1.z * c9.x) + c9.y;
	r2.x = fract(r2.x);
	r2.x = (r2.x * c8.z) + c8.w;
	r3.xy = float2(cos(r2.x), sin(r2.x));
	r2.xy = r3.xy * c9.zw;
	r3.y = dot(r1.xy, r3.yx) + c1.w;
	r3.x = dot(r1.xy, r2.xy) + c1.w;
	r1.xy = -r1.xy + r3.xy;
	r1.x = dot(r1.xy, r1.xy) + c1.w;
	r1.x = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r1.x = clamp(((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x), 0.0, 1.0);
	r1.x = ((r1.z >= 0.0) ? r1.x : c1.w);
	r1.y = r1.w * r1.x;
	r1.z = abs(c6.z);
	r1.x = ((-r1.z >= 0.0) ? r1.x : r1.y);
	oC0 = r0 * r1.xxxx;
	#undef c5
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

