#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[6];
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
	texture2d<float> s1_texture [[texture(1)]],
	sampler s1 [[sampler(1)]],
	texture2d<float> s2_texture [[texture(2)]],
	sampler s2 [[sampler(2)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c6 = float4(-0.062499999, -0.5, 1.595800042, 1.164299963); (void) c6;
	const float4 c7 = float4(0.16666667, 0.333333342, 0.666666684, 0.0); (void) c7;
	const float4 c8 = float4(6.0, 1.0, 0.0, 0.0); (void) c8;
	const float4 c9 = float4(-1.0, -2.0, -3.0, -4.0); (void) c9;
	const float4 c10 = float4(0.391730013, 2.01699996, 0.812900006, 2.200000047); (void) c10;
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
	#define c3 uniforms.uniforms_float4[3]
	#define c4 uniforms.uniforms_float4[4]
	#define c5 uniforms.uniforms_float4[5]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define oC0 output.oC0
	r0 = s1_texture.sample(s1, v0.xy);
	r0.x = r0.x + c6.y;
	r0.xy = r0.xx * c10.xy;
	r1 = s0_texture.sample(s0, v0.xy);
	r0.z = r1.x + c6.x;
	r0.x = (r0.z * c6.w) + -r0.x;
	r0.y = (r0.z * c6.w) + r0.y;
	r1.y = pow(abs(r0.y), c10.w);
	r2 = s2_texture.sample(s2, v0.xy);
	r0.y = r2.x + c6.y;
	r0.x = (r0.y * -c10.z) + r0.x;
	r0.y = r0.y * c6.z;
	r0.y = (r0.z * c6.w) + r0.y;
	r1.z = pow(abs(r0.y), c10.w);
	r1.x = pow(abs(r0.x), c10.w);
	r0.x = -r1.y + r1.x;
	r0.xy = ((r0.x >= 0.0) ? r1.yx : r1.xy);
	r2.x = max(r1.z, r0.y);
	r2.y = min(r0.x, r1.z);
	r0.x = -r2.y + r2.x;
	r0.yzw = -r1.xyz + r2.xxx;
	r1.xyz = r1.zxy + -r2.xxx;
	r1.w = r0.x * -c6.y;
	r0.yzw = (r0.yzw * c7.xxx) + r1.www;
	r1.w = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r2.yz = (r0.wy * r1.ww) + c7.yz;
	r2.yz = (r0.zw * -r1.ww) + r2.yz;
	r0.w = ((-abs(r1.z) >= 0.0) ? r2.z : c7.w);
	r0.w = ((-abs(r1.y) >= 0.0) ? r2.y : r0.w);
	r0.y = r0.y * r1.w;
	r0.y = (r0.z * r1.w) + -r0.y;
	r0.y = ((-abs(r1.x) >= 0.0) ? r0.y : r0.w);
	r1.x = fract(r0.y);
	r0.y = ((r2.x == 0.0) ? FLT_MAX : 1.0 / r2.x);
	r2.y = c6.y;
	r0.z = (r2.x * c5.z) + r2.y;
	r2.z = (c5.w * r0.z) + -r2.y;
	r1.y = r0.y * r0.x;
	r0.xy = ((-abs(r0.x) >= 0.0) ? c7.ww : r1.xy);
	r0.x = r0.x + c5.x;
	r0.x = fract(r0.x);
	r0.z = r0.x * c8.x;
	r0.w = fract(r0.z);
	r0.z = -r0.w + r0.z;
	r1 = r0.zzzz + c9;
	r0.x = (r0.x * c8.x) + -r0.z;
	r0.w = -r0.x + c8.y;
	r3.x = r0.y * c5.y;
	r3.y = c8.y;
	r0.y = (r0.y * -c5.y) + r3.y;
	r2.x = r0.y * r2.z;
	r0.y = (r3.x * -r0.w) + c8.y;
	r0.x = (r3.x * -r0.x) + c8.y;
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
	r0.w = c8.y;
	r0 = (r0 * r1) + -c3;
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
	r5.xy = -v4.xy + v4.zw;
	r5.zw = v4.xy;
	r6 = r3 * r5.zwxw;
	r7 = min(r4, r6);
	r1 = (r1 * r3) + -r7;
	r1.x = dot(r1.xy, r1.xy) + c7.w;
	r1.y = dot(r1.zw, r1.zw) + c7.w;
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
	r1.x = dot(r2.xy, r2.xy) + c7.w;
	r1.w = dot(r2.zw, r2.zw) + c7.w;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.x = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r3.zw = clamp(-r1.yz + r1.xw, float2(0.0), float2(1.0));
	r1 = -r3 + c8.yyyy;
	r1.x = r1.y * r1.x;
	r1.x = r1.z * r1.x;
	r1.x = r1.w * r1.x;
	r0 = (r1.xxxx * r0) + c3;
	r1 = s1_texture.sample(s1, v3.xy);
	r1 = r0 * r1.wwww;
	oC0 = mix(r0, r1, c4.zzzz);
	#undef c0
	#undef c1
	#undef c2
	#undef c3
	#undef c4
	#undef c5
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

