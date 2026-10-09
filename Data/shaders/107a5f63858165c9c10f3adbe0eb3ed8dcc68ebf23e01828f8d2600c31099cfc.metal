#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[3];
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
	const float4 c0 = float4(3.187500000e+01, 1.000000000e+00, -5.019608140e-01, 7.739938051e-02); (void) c0;
	const float4 c1 = float4(9.478672743e-01, 5.213269964e-02, 2.400000095e+00, 4.044999927e-02); (void) c1;
	const float4 c2 = float4(5.000000000e-01, 1.666666716e-01, 3.333333433e-01, 6.666666865e-01); (void) c2;
	const float4 c3 = float4(0.000000000e+00, 6.000000000e+00, -2.000000000e+00, 4.000000000e+00); (void) c3;
	const float4 c7 = float4(-1.000000000e+00, -2.000000000e+00, -3.000000000e+00, -4.000000000e+00); (void) c7;
	const float4 c8 = float4(9.990234375e-01, 4.882812500e-04, 2.083509974e-02, -8.513300121e-02); (void) c8;
	const float4 c9 = float4(1.801410019e-01, -3.302994967e-01, 9.998660088e-01, 3.141592741e+00); (void) c9;
	const float4 c10 = float4(-2.000000000e+00, 1.570796371e+00, -0.000000000e+00, -3.141592741e+00); (void) c10;
	const float4 c11 = float4(6.283185482e+00, 1.591549367e-01, 5.000000000e-01, -3.141592741e+00); (void) c11;
	const float4 c12 = float4(0.000000000e+00, 1.000000000e+00, -0.000000000e+00, -1.000000000e+00); (void) c12;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	#define c4 uniforms.uniforms_float4[0]
	#define c5 uniforms.uniforms_float4[1]
	#define c6 uniforms.uniforms_float4[2]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	r0.z = (r0.z * c0.x) + c0.y;
	r0.z = ((r0.z == 0.0) ? FLT_MAX : 1.0 / r0.z);
	r0.xy = r0.yx + c0.zz;
	r1.x = (r0.y * -r0.z) + r0.w;
	r2.yz = (r0.yx * r0.zz) + r0.ww;
	r2.w = (r0.x * -r0.z) + r1.x;
	r2.x = (r0.x * -r0.z) + r2.y;
	r0.xyz = (r2.xzw * c1.xxx) + c1.yyy;
	r1.x = log2(r0.x);
	r1.y = log2(r0.y);
	r1.z = log2(r0.z);
	r0.xyz = r1.xyz * c1.zzz;
	r0.y = exp2(r0.y);
	r1.xyz = r2.xzw * c0.www;
	r2.xyz = -r2.xzw + c1.www;
	r3.x = ((r2.y >= 0.0) ? r1.y : r0.y);
	r0.y = exp2(r0.z);
	r0.x = exp2(r0.x);
	r3.y = ((r2.z >= 0.0) ? r1.z : r0.y);
	r3.z = ((r2.x >= 0.0) ? r1.x : r0.x);
	r0.x = -r3.y + r3.x;
	r0.xy = ((r0.x >= 0.0) ? r3.yx : r3.xy);
	r1.x = max(r3.z, r0.y);
	r1.y = min(r0.x, r3.z);
	r0.x = -r1.y + r1.x;
	r0.yzw = -r3.xyz + r1.xxx;
	r1.yzw = -r1.xxx + r3.zxy;
	r2.x = r0.x * c2.x;
	r0.yzw = (r0.yzw * c2.yyy) + r2.xxx;
	r2.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r2.yz = (r0.wy * r2.xx) + c2.zw;
	r2.yz = (r0.zw * -r2.xx) + r2.yz;
	r0.w = ((-abs(r1.w) >= 0.0) ? r2.z : c3.x);
	r0.w = ((-abs(r1.z) >= 0.0) ? r2.y : r0.w);
	r0.y = r0.y * r2.x;
	r0.y = (r0.z * r2.x) + -r0.y;
	r0.y = ((-abs(r1.y) >= 0.0) ? r0.y : r0.w);
	r2.x = fract(r0.y);
	r0.y = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r3.x = c2.x;
	r0.z = (r1.x * c5.z) + -r3.x;
	r1.z = (c5.w * r0.z) + r3.x;
	r2.y = r0.y * r0.x;
	r0.xy = ((-abs(r0.x) >= 0.0) ? c3.xx : r2.xy);
	r0.x = r0.x + c5.x;
	r0.x = fract(r0.x);
	r0.z = r0.x * c3.y;
	r0.w = fract(r0.z);
	r0.z = -r0.w + r0.z;
	r2 = r0.zzzz + c7;
	r0.x = (r0.x * c3.y) + -r0.z;
	r0.w = -r0.x + c0.y;
	r3.x = r0.y * c5.y;
	r3.y = c0.y;
	r0.y = (r0.y * -c5.y) + r3.y;
	r1.x = r0.y * r1.z;
	r0.y = (r3.x * -r0.w) + c0.y;
	r0.x = (r3.x * -r0.x) + c0.y;
	r1.yw = r0.yx * r1.zz;
	r4.xz = ((-abs(r2.w) >= 0.0) ? r1.yz : r1.zw);
	r4.y = r1.x;
	r0.xyw = ((-abs(r2.z) >= 0.0) ? r1.xwz : r4.xyz);
	r0.xyw = ((-abs(r2.y) >= 0.0) ? r1.xzy : r0.xyw);
	r0.xyw = ((-abs(r2.x) >= 0.0) ? r1.wzx : r0.xyw);
	r0.xyz = ((-abs(r0.z) >= 0.0) ? r1.zyx : r0.xyw);
	r0.xyz = ((-abs(r3.x) >= 0.0) ? r1.zzz : r0.xyz);
	r1.x = c3.x;
	r1.x = dot(v0.zw, c4.xy) + r1.x;
	r1.y = dot(v0.zw, v0.zw) + c3.x;
	r1.z = dot(c4.xy, c4.xy) + -r3.y;
	r1.y = r1.z * r1.y;
	r1.xy = r1.xy * c3.zw;
	r1.y = (r1.x * r1.x) + -r1.y;
	r2.x = max(r1.y, c3.x);
	r1.y = ((r2.x == 0.0) ? FLT_MAX : rsqrt(abs(r2.x)));
	r1.y = ((r1.y == 0.0) ? FLT_MAX : 1.0 / r1.y);
	r1.w = ((-r1.z >= 0.0) ? c12.x : c12.y);
	r2.x = ((r1.z >= 0.0) ? c12.z : c12.w);
	r1.z = r1.z + r1.z;
	r1.z = ((r1.z == 0.0) ? FLT_MAX : 1.0 / r1.z);
	r1.w = r1.w + r2.x;
	r1.x = (r1.w * r1.y) + -r1.x;
	r1.x = clamp(r1.z * r1.x, 0.0, 1.0);
	r1.x = (r1.x * c8.x) + c8.y;
	r1.y = c3.x;
	r1 = s3_texture.sample(s3, r1.xy);
	r0.w = c0.y;
	r0 = r0 * r1;
	r1 = s1_texture.sample(s1, v1.xy);
	r1 = r0 * r1.wwww;
	r2 = mix(r0, r1, c4.zzzz);
	r0.xy = (v2.zw * -c2.xx) + v2.xy;
	r1.x = max(abs(r0.x), abs(r0.y));
	r0.z = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.x = min(abs(r0.y), abs(r0.x));
	r0.z = r0.z * r1.x;
	r0.w = r0.z * r0.z;
	r1.x = (r0.w * c8.z) + c8.w;
	r1.x = (r0.w * r1.x) + c9.x;
	r1.x = (r0.w * r1.x) + c9.y;
	r0.w = (r0.w * r1.x) + c9.z;
	r0.z = r0.w * r0.z;
	r0.w = (r0.z * c10.x) + c10.y;
	r1.x = -abs(r0.x) + abs(r0.y);
	r1.x = ((r1.x >= 0.0) ? c12.x : c12.y);
	r0.z = (r0.w * r1.x) + r0.z;
	r0.w = ((r0.y >= 0.0) ? c10.z : c10.w);
	r0.z = r0.w + r0.z;
	r0.w = r0.z + r0.z;
	r1.x = max(-r0.x, r0.y);
	r1.x = ((r1.x >= 0.0) ? c12.y : c12.x);
	r1.y = min(r0.y, -r0.x);
	r1.x = ((r1.y >= 0.0) ? c3.x : r1.x);
	r0.z = (r1.x * -r0.w) + r0.z;
	r0.z = r0.z + c9.w;
	r0.z = r0.z + -c6.z;
	r0.w = r0.z + c11.x;
	r0.z = ((r0.z >= 0.0) ? r0.z : r0.w);
	r0.w = (r0.z * c11.y) + c11.z;
	r0.z = r0.z + -c6.w;
	r0.w = fract(r0.w);
	r0.w = (r0.w * c11.x) + c11.w;
	r1.xy = float2(cos(r0.w), sin(r0.w));
	r1.zw = r1.xy * c12.yw;
	r1.y = dot(r0.xy, r1.yx) + c3.x;
	r1.x = dot(r0.xy, r1.zw) + c3.x;
	r1.xy = -r0.xy + r1.xy;
	r0.w = dot(r1.xy, r1.xy) + c3.x;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = clamp(((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w), 0.0, 1.0);
	r1.x = (r0.z * c11.y) + c11.z;
	r1.x = fract(r1.x);
	r1.x = (r1.x * c11.x) + c11.w;
	r3.xy = float2(cos(r1.x), sin(r1.x));
	r1.xy = r3.xy * c12.yw;
	r3.y = dot(r0.xy, r3.yx) + c3.x;
	r3.x = dot(r0.xy, r1.xy) + c3.x;
	r0.xy = -r0.xy + r3.xy;
	r0.x = dot(r0.xy, r0.xy) + c3.x;
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r0.x = clamp(((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x), 0.0, 1.0);
	r0.x = ((r0.z >= 0.0) ? r0.x : c3.x);
	r0.y = r0.w * r0.x;
	r0.z = abs(c6.z);
	r0.x = ((-r0.z >= 0.0) ? r0.x : r0.y);
	oC0 = r0.xxxx * r2;
	#undef c4
	#undef c5
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

