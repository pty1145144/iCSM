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
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(5.000000000e-01, 1.666666716e-01, 3.333333433e-01, 6.666666865e-01); (void) c0;
	const float4 c1 = float4(0.000000000e+00, 1.000000000e+00, 6.000000000e+00, 1.801410019e-01); (void) c1;
	const float4 c2 = float4(-1.000000000e+00, -2.000000000e+00, -3.000000000e+00, -4.000000000e+00); (void) c2;
	const float4 c3 = float4(9.990234375e-01, 4.882812500e-04, 2.083509974e-02, -8.513300121e-02); (void) c3;
	const float4 c4 = float4(-3.302994967e-01, 9.998660088e-01, -2.000000000e+00, 1.570796371e+00); (void) c4;
	const float4 c7 = float4(-0.000000000e+00, -3.141592741e+00, 3.141592741e+00, 6.283185482e+00); (void) c7;
	const float4 c8 = float4(1.591549367e-01, 5.000000000e-01, 1.000000000e+00, -1.000000000e+00); (void) c8;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	#define c5 uniforms.uniforms_float4[0]
	#define c6 uniforms.uniforms_float4[1]
	#define v0 input.v0
	#define v1 input.v1
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	r1.x = -r0.z + r0.y;
	r1.xy = ((r1.x >= 0.0) ? r0.zy : r0.yz);
	r2.x = min(r1.x, r0.x);
	r2.y = max(r0.x, r1.y);
	r1.x = -r2.x + r2.y;
	r1.y = r1.x * c0.x;
	r2.xzw = -r0.yzx + r2.yyy;
	r1.yzw = (r2.xzw * c0.yyy) + r1.yyy;
	r2.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r2.zw = (r1.wy * r2.xx) + c0.zw;
	r2.zw = (r1.zw * -r2.xx) + r2.zw;
	r3.xyz = r0.xyz + -r2.yyy;
	r1.w = ((-abs(r3.z) >= 0.0) ? r2.w : c1.x);
	r1.w = ((-abs(r3.y) >= 0.0) ? r2.z : r1.w);
	r1.y = r1.y * r2.x;
	r1.y = (r1.z * r2.x) + -r1.y;
	r1.y = ((-abs(r3.x) >= 0.0) ? r1.y : r1.w);
	r3.x = fract(r1.y);
	r1.y = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r3.y = r1.y * r1.x;
	r1.xy = ((-abs(r1.x) >= 0.0) ? c1.xx : r3.xy);
	r1.x = r1.x + c5.x;
	r1.x = fract(r1.x);
	r1.z = r1.x * c1.z;
	r1.w = fract(r1.z);
	r1.z = -r1.w + r1.z;
	r1.x = (r1.x * c1.z) + -r1.z;
	r1.w = -r1.x + c1.y;
	r2.x = r1.y * c5.y;
	r3.y = c1.y;
	r1.y = (r1.y * -c5.y) + r3.y;
	r1.w = (r2.x * -r1.w) + c1.y;
	r2.z = ((-r0.w >= 0.0) ? c1.x : c1.y);
	r2.w = r3.y + -c5.w;
	r2.w = ((r2.w >= 0.0) ? c1.x : c1.y);
	r2.z = r2.w + r2.z;
	r3.x = c0.x;
	r2.w = (r2.y * c5.z) + -r3.x;
	r2.y = r2.y * c5.z;
	r2.w = (c5.w * r2.w) + r3.x;
	r3.z = ((-r2.z >= 0.0) ? r2.y : r2.w);
	r4 = r1.zzzz + c2;
	r1.x = (r2.x * -r1.x) + c1.y;
	r3.xyw = r1.ywx * r3.zzz;
	r5.xz = ((-abs(r4.w) >= 0.0) ? r3.yz : r3.zw);
	r5.y = r3.x;
	r1.xyw = ((-abs(r4.z) >= 0.0) ? r3.xwz : r5.xyz);
	r1.xyw = ((-abs(r4.y) >= 0.0) ? r3.xzy : r1.xyw);
	r1.xyw = ((-abs(r4.x) >= 0.0) ? r3.wzx : r1.xyw);
	r1.xyz = ((-abs(r1.z) >= 0.0) ? r3.zyx : r1.xyw);
	r0.xyz = ((-abs(r2.x) >= 0.0) ? r3.zzz : r1.xyz);
	r1.x = clamp(v0.z, 0.0, 1.0);
	r1.x = (r1.x * c3.x) + c3.y;
	r1.y = c1.x;
	r1 = s3_texture.sample(s3, r1.xy);
	r0 = r0 * r1;
	r1.xy = (v1.zw * -c0.xx) + v1.xy;
	r2.x = max(abs(r1.x), abs(r1.y));
	r1.z = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r2.x = min(abs(r1.y), abs(r1.x));
	r1.z = r1.z * r2.x;
	r1.w = r1.z * r1.z;
	r2.x = (r1.w * c3.z) + c3.w;
	r2.x = (r1.w * r2.x) + c1.w;
	r2.x = (r1.w * r2.x) + c4.x;
	r1.w = (r1.w * r2.x) + c4.y;
	r1.z = r1.w * r1.z;
	r1.w = (r1.z * c4.z) + c4.w;
	r2.x = -abs(r1.x) + abs(r1.y);
	r2.x = ((r2.x >= 0.0) ? c1.x : c1.y);
	r1.z = (r1.w * r2.x) + r1.z;
	r1.w = ((r1.y >= 0.0) ? c7.x : c7.y);
	r1.z = r1.w + r1.z;
	r1.w = r1.z + r1.z;
	r2.x = max(-r1.x, r1.y);
	r2.x = ((r2.x >= 0.0) ? c1.y : c1.x);
	r2.y = min(r1.y, -r1.x);
	r2.x = ((r2.y >= 0.0) ? c1.x : r2.x);
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
	r2.y = dot(r1.xy, r2.yx) + c1.x;
	r2.x = dot(r1.xy, r2.zw) + c1.x;
	r2.xy = -r1.xy + r2.xy;
	r1.w = dot(r2.xy, r2.xy) + c1.x;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.w = clamp(((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w), 0.0, 1.0);
	r2.x = (r1.z * c8.x) + c8.y;
	r2.x = fract(r2.x);
	r2.x = (r2.x * c7.w) + c7.y;
	r3.xy = float2(cos(r2.x), sin(r2.x));
	r2.xy = r3.xy * c8.zw;
	r3.y = dot(r1.xy, r3.yx) + c1.x;
	r3.x = dot(r1.xy, r2.xy) + c1.x;
	r1.xy = -r1.xy + r3.xy;
	r1.x = dot(r1.xy, r1.xy) + c1.x;
	r1.x = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r1.x = clamp(((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x), 0.0, 1.0);
	r1.x = ((r1.z >= 0.0) ? r1.x : c1.x);
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

