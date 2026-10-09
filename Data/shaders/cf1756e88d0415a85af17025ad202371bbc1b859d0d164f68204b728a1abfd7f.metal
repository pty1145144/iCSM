#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[5];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord1)]];
	float4 v2 [[user(texcoord2)]];
	float4 v3 [[user(texcoord4)]];
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
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c3 = float4(-6.250000000e-02, -5.000000000e-01, 1.595800042e+00, 1.164299965e+00); (void) c3;
	const float4 c4 = float4(1.666666716e-01, 3.333333433e-01, 6.666666865e-01, 0.000000000e+00); (void) c4;
	const float4 c7 = float4(6.000000000e+00, 1.000000000e+00, 2.083509974e-02, -8.513300121e-02); (void) c7;
	const float4 c8 = float4(-1.000000000e+00, -2.000000000e+00, -3.000000000e+00, -4.000000000e+00); (void) c8;
	const float4 c9 = float4(1.801410019e-01, -3.302994967e-01, 9.998660088e-01, 3.141592741e+00); (void) c9;
	const float4 c10 = float4(0.000000000e+00, 1.000000000e+00, -2.000000000e+00, 1.570796371e+00); (void) c10;
	const float4 c11 = float4(1.591549367e-01, 5.000000000e-01, 1.000000000e+00, -1.000000000e+00); (void) c11;
	const float4 c12 = float4(-0.000000000e+00, -3.141592741e+00, 6.283185482e+00, 0.000000000e+00); (void) c12;
	const float4 c13 = float4(3.917300105e-01, 2.016999960e+00, 8.129000068e-01, 2.200000048e+00); (void) c13;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	float4 r7;
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c2 uniforms.uniforms_float4[2]
	#define c5 uniforms.uniforms_float4[3]
	#define c6 uniforms.uniforms_float4[4]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define oC0 output.oC0
	r0 = s1_texture.sample(s1, v0.xy);
	r0.x = r0.x + c3.y;
	r0.xy = r0.xx * c13.xy;
	r1 = s0_texture.sample(s0, v0.xy);
	r0.z = r1.x + c3.x;
	r0.x = (r0.z * c3.w) + -r0.x;
	r0.y = (r0.z * c3.w) + r0.y;
	r1.y = pow(abs(r0.y), c13.w);
	r2 = s2_texture.sample(s2, v0.xy);
	r0.y = r2.x + c3.y;
	r0.x = (r0.y * -c13.z) + r0.x;
	r0.y = r0.y * c3.z;
	r0.y = (r0.z * c3.w) + r0.y;
	r1.z = pow(abs(r0.y), c13.w);
	r1.x = pow(abs(r0.x), c13.w);
	r0.x = -r1.y + r1.x;
	r0.xy = ((r0.x >= 0.0) ? r1.yx : r1.xy);
	r2.x = max(r1.z, r0.y);
	r2.y = min(r0.x, r1.z);
	r0.x = -r2.y + r2.x;
	r0.yzw = -r1.xyz + r2.xxx;
	r1.xyz = r1.zxy + -r2.xxx;
	r1.w = r0.x * -c3.y;
	r0.yzw = (r0.yzw * c4.xxx) + r1.www;
	r1.w = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r2.yz = (r0.wy * r1.ww) + c4.yz;
	r2.yz = (r0.zw * -r1.ww) + r2.yz;
	r0.w = ((-abs(r1.z) >= 0.0) ? r2.z : c4.w);
	r0.w = ((-abs(r1.y) >= 0.0) ? r2.y : r0.w);
	r0.y = r0.y * r1.w;
	r0.y = (r0.z * r1.w) + -r0.y;
	r0.y = ((-abs(r1.x) >= 0.0) ? r0.y : r0.w);
	r1.x = fract(r0.y);
	r0.y = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r2.y = c3.y;
	r0.z = (r2.x * c5.z) + r2.y;
	r2.z = (c5.w * r0.z) + -r2.y;
	r1.y = r0.y * r0.x;
	r0.xy = ((-abs(r0.x) >= 0.0) ? c4.ww : r1.xy);
	r0.x = r0.x + c5.x;
	r0.x = fract(r0.x);
	r0.z = r0.x * c7.x;
	r0.w = fract(r0.z);
	r0.z = -r0.w + r0.z;
	r1 = r0.zzzz + c8;
	r0.x = (r0.x * c7.x) + -r0.z;
	r0.w = -r0.x + c7.y;
	r3.x = r0.y * c5.y;
	r3.y = c7.y;
	r0.y = (r0.y * -c5.y) + r3.y;
	r2.x = r0.y * r2.z;
	r0.y = (r3.x * -r0.w) + c7.y;
	r0.x = (r3.x * -r0.x) + c7.y;
	r2.yw = r0.yx * r2.zz;
	r4.xz = ((-abs(r1.w) >= 0.0) ? r2.yz : r2.zw);
	r4.y = r2.x;
	r0.xyw = ((-abs(r1.z) >= 0.0) ? r2.xwz : r4.xyz);
	r0.xyw = ((-abs(r1.y) >= 0.0) ? r2.xzy : r0.xyw);
	r0.xyw = ((-abs(r1.x) >= 0.0) ? r2.wzx : r0.xyw);
	r0.xyz = ((-abs(r0.z) >= 0.0) ? r2.zyx : r0.xyw);
	r0.xyz = ((-abs(r3.x) >= 0.0) ? r2.zzz : r0.xyz);
	r1.x = clamp(v0.z, 0.0, 1.0);
	r2 = v1;
	r2 = -r2 + v2;
	r1 = (r1.xxxx * r2) + v1;
	r0.w = c7.y;
	r0 = r0 * r1;
	r1 = c0;
	r1 = r1 + c2.wxyx;
	r2.x = ((c0.x == 0.0) ? FLT_MAX : 1.0 / c0.x);
	r2.yz = min(c0.yw, c0.xz);
	r3.x = r2.x * r2.y;
	r2.x = ((c0.y == 0.0) ? FLT_MAX : 1.0 / c0.y);
	r3.y = r2.x * r2.y;
	r2.x = ((c0.z == 0.0) ? FLT_MAX : 1.0 / c0.z);
	r3.z = r2.x * r2.z;
	r2.x = ((c0.w == 0.0) ? FLT_MAX : 1.0 / c0.w);
	r3.w = r2.x * r2.z;
	r4 = r1 * r3;
	r5.xy = -v3.xy + v3.zw;
	r5.zw = v3.xy;
	r6 = r3 * r5.zwxw;
	r7 = min(r4, r6);
	r1 = (r1 * r3) + -r7;
	r1.x = dot(r1.xy, r1.xy) + c4.w;
	r1.y = dot(r1.zw, r1.zw) + c4.w;
	r1.y = ((r1.y == 0.0) ? FLT_MAX : rsqrt(abs(r1.y)));
	r1.y = ((r1.y == 0.0) ? FLT_MAX : 1.0 / r1.y);
	r1.x = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r3.xy = clamp(-r2.yz + r1.xy, float2(0.0), float2(1.0));
	r1.x = ((c1.x == 0.0) ? FLT_MAX : 1.0 / c1.x);
	r1.yz = min(c1.yw, c1.xz);
	r2.x = r1.x * r1.y;
	r1.x = ((c1.y == 0.0) ? FLT_MAX : 1.0 / c1.y);
	r2.y = r1.x * r1.y;
	r1.x = ((c1.z == 0.0) ? FLT_MAX : 1.0 / c1.z);
	r2.z = r1.x * r1.z;
	r1.x = ((c1.w == 0.0) ? FLT_MAX : 1.0 / c1.w);
	r2.w = r1.x * r1.z;
	r4 = r2 * r5.xyzy;
	r5 = c1;
	r5 = r5 + c2.yzwz;
	r6 = r2 * r5;
	r7 = min(r6, r4);
	r2 = (r5 * r2) + -r7;
	r1.x = dot(r2.xy, r2.xy) + c4.w;
	r1.w = dot(r2.zw, r2.zw) + c4.w;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.x = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r3.zw = clamp(-r1.yz + r1.xw, float2(0.0), float2(1.0));
	r1 = -r3 + c7.yyyy;
	r0 = r0 * r1.xxxx;
	r0 = r1.yyyy * r0;
	r0 = r1.zzzz * r0;
	r0 = r1.wwww * r0;
	r1.xy = (v3.zw * c3.yy) + v3.xy;
	r2.x = max(abs(r1.x), abs(r1.y));
	r1.z = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r2.x = min(abs(r1.y), abs(r1.x));
	r1.z = r1.z * r2.x;
	r1.w = r1.z * r1.z;
	r2.x = (r1.w * c7.z) + c7.w;
	r2.x = (r1.w * r2.x) + c9.x;
	r2.x = (r1.w * r2.x) + c9.y;
	r1.w = (r1.w * r2.x) + c9.z;
	r1.z = r1.w * r1.z;
	r1.w = (r1.z * c10.z) + c10.w;
	r2.x = -abs(r1.x) + abs(r1.y);
	r2.x = ((r2.x >= 0.0) ? c10.x : c10.y);
	r1.z = (r1.w * r2.x) + r1.z;
	r1.w = ((r1.y >= 0.0) ? c12.x : c12.y);
	r1.z = r1.w + r1.z;
	r1.w = r1.z + r1.z;
	r2.x = max(-r1.x, r1.y);
	r2.x = ((r2.x >= 0.0) ? c10.y : c10.x);
	r2.y = min(r1.y, -r1.x);
	r2.x = ((r2.y >= 0.0) ? c4.w : r2.x);
	r1.z = (r2.x * -r1.w) + r1.z;
	r1.z = r1.z + c9.w;
	r1.z = r1.z + -c6.z;
	r1.w = r1.z + c12.z;
	r1.z = ((r1.z >= 0.0) ? r1.z : r1.w);
	r1.w = (r1.z * c11.x) + c11.y;
	r1.z = r1.z + -c6.w;
	r1.w = fract(r1.w);
	r1.w = (r1.w * c12.z) + c12.y;
	r2.xy = float2(cos(r1.w), sin(r1.w));
	r2.zw = r2.xy * c11.zw;
	r2.y = dot(r1.xy, r2.yx) + c4.w;
	r2.x = dot(r1.xy, r2.zw) + c4.w;
	r2.xy = -r1.xy + r2.xy;
	r1.w = dot(r2.xy, r2.xy) + c4.w;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.w = clamp(((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w), 0.0, 1.0);
	r2.x = (r1.z * c11.x) + c11.y;
	r2.x = fract(r2.x);
	r2.x = (r2.x * c12.z) + c12.y;
	r3.xy = float2(cos(r2.x), sin(r2.x));
	r2.xy = r3.xy * c11.zw;
	r3.y = dot(r1.xy, r3.yx) + c4.w;
	r3.x = dot(r1.xy, r2.xy) + c4.w;
	r1.xy = -r1.xy + r3.xy;
	r1.x = dot(r1.xy, r1.xy) + c4.w;
	r1.x = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r1.x = clamp(((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x), 0.0, 1.0);
	r1.x = ((r1.z >= 0.0) ? r1.x : c4.w);
	r1.y = r1.w * r1.x;
	r1.z = abs(c6.z);
	r1.x = ((-r1.z >= 0.0) ? r1.x : r1.y);
	oC0 = r0 * r1.xxxx;
	#undef c0
	#undef c1
	#undef c2
	#undef c5
	#undef c6
	#undef v0
	#undef v1
	#undef v2
	#undef v3
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

