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
	float4 v2 [[user(texcoord3)]];
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
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c3 = float4(0.5, 0.16666667, 0.333333342, 0.666666684); (void) c3;
	const float4 c6 = float4(0.0, 1.0, 6.0, 0.0); (void) c6;
	const float4 c7 = float4(-1.0, -2.0, -3.0, -4.0); (void) c7;
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
	#define c4 uniforms.uniforms_float4[3]
	#define c5 uniforms.uniforms_float4[4]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	r1.x = -r0.z + r0.y;
	r1.xy = ((r1.x >= 0.0) ? r0.zy : r0.yz);
	r2.x = min(r1.x, r0.x);
	r2.y = max(r0.x, r1.y);
	r1.x = -r2.x + r2.y;
	r1.y = r1.x * c3.x;
	r2.xzw = -r0.yzx + r2.yyy;
	r1.yzw = (r2.xzw * c3.yyy) + r1.yyy;
	r2.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r2.zw = (r1.wy * r2.xx) + c3.zw;
	r2.zw = (r1.zw * -r2.xx) + r2.zw;
	r3.xyz = r0.xyz + -r2.yyy;
	r1.w = ((-abs(r3.z) >= 0.0) ? r2.w : c6.x);
	r1.w = ((-abs(r3.y) >= 0.0) ? r2.z : r1.w);
	r1.y = r1.y * r2.x;
	r1.y = (r1.z * r2.x) + -r1.y;
	r1.y = ((-abs(r3.x) >= 0.0) ? r1.y : r1.w);
	r3.x = fract(r1.y);
	r1.y = ((r2.y == 0.0) ? FLT_MAX : 1.0 / r2.y);
	r3.y = r1.y * r1.x;
	r1.xy = ((-abs(r1.x) >= 0.0) ? c6.xx : r3.xy);
	r1.x = r1.x + c5.x;
	r1.x = fract(r1.x);
	r1.z = r1.x * c6.z;
	r1.w = fract(r1.z);
	r1.z = -r1.w + r1.z;
	r1.x = (r1.x * c6.z) + -r1.z;
	r1.w = -r1.x + c6.y;
	r2.x = r1.y * c5.y;
	r3.y = c6.y;
	r1.y = (r1.y * -c5.y) + r3.y;
	r1.w = (r2.x * -r1.w) + c6.y;
	r2.z = r3.y + -c5.w;
	r2.z = ((r2.z >= 0.0) ? c6.x : c6.y);
	r2.w = ((-r0.w >= 0.0) ? c6.x : c6.y);
	r2.z = r2.z + r2.w;
	r3.x = c3.x;
	r2.w = (r2.y * c5.z) + -r3.x;
	r2.y = r2.y * c5.z;
	r2.w = (c5.w * r2.w) + r3.x;
	r3.z = ((-r2.z >= 0.0) ? r2.y : r2.w);
	r1.x = (r2.x * -r1.x) + c6.y;
	r3.xyw = r1.ywx * r3.zzz;
	r4 = r1.zzzz + c7;
	r5.xz = ((-abs(r4.w) >= 0.0) ? r3.yz : r3.zw);
	r5.y = r3.x;
	r1.xyw = ((-abs(r4.z) >= 0.0) ? r3.xwz : r5.xyz);
	r1.xyw = ((-abs(r4.y) >= 0.0) ? r3.xzy : r1.xyw);
	r1.xyw = ((-abs(r4.x) >= 0.0) ? r3.wzx : r1.xyw);
	r1.xyz = ((-abs(r1.z) >= 0.0) ? r3.zyx : r1.xyw);
	r1.xyz = ((-abs(r2.x) >= 0.0) ? r3.zzz : r1.xyz);
	r0.xyz = r0.www * r1.xyz;
	r0 = r0 * v1;
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
	r1.x = dot(r1.xy, r1.xy) + c6.x;
	r1.y = dot(r1.zw, r1.zw) + c6.x;
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
	r1.x = dot(r2.xy, r2.xy) + c6.x;
	r1.w = dot(r2.zw, r2.zw) + c6.x;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.x = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r3.zw = clamp(-r1.yz + r1.xw, float2(0.0), float2(1.0));
	r1 = -r3 + c6.yyyy;
	r0 = r0 * r1.xxxx;
	r0 = r1.yyyy * r0;
	r0 = r1.zzzz * r0;
	r0 = r1.wwww * r0;
	r1 = s1_texture.sample(s1, v2.xy);
	r1 = r0 * r1.wwww;
	oC0 = mix(r0, r1, c4.zzzz);
	#undef c0
	#undef c1
	#undef c2
	#undef c4
	#undef c5
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

