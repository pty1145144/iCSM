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
	float4 v1 [[user(texcoord4)]];
};

struct source_main_Output
{
	float4 oC0 [[color(0)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c3 = float4(-0.5, 0.5, -1.0, 0.0); (void) c3;
	const float4 c6 = float4(-2.0, 4.0, 0.999023439, 0.000488281); (void) c6;
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
	#define oC0 output.oC0
	r0 = c3;
	r0.w = dot(v0.zw, c4.xy) + r0.w;
	r0.w = r0.w * c6.x;
	r1.x = dot(v0.zw, v0.zw) + c3.w;
	r0.z = dot(c4.xy, c4.xy) + r0.z;
	r1.x = r0.z * r1.x;
	r1.x = r1.x * c6.y;
	r1.x = (r0.w * r0.w) + -r1.x;
	r2.x = max(r1.x, c3.w);
	r1.x = ((r2.x == 0.0) ? FLT_MAX : rsqrt(abs(r2.x)));
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.y = ((-r0.z >= 0.0) ? abs(c3.w) : abs(c3.z));
	r1.z = ((r0.z >= 0.0) ? -abs(c3.w) : -abs(c3.z));
	r0.z = r0.z + r0.z;
	r0.z = ((r0.z == 0.0) ? FLT_MAX : 1.0 / r0.z);
	r1.y = r1.z + r1.y;
	r0.w = (r1.y * r1.x) + -r0.w;
	r0.z = clamp(r0.z * r0.w, 0.0, 1.0);
	r1.x = (r0.z * c6.z) + c6.w;
	r1.y = c3.w;
	r1 = s3_texture.sample(s3, r1.xy);
	r0.x = r0.x + c5.z;
	r0.xyz = (c5.www * r0.xxx) + r0.yyy;
	r0.w = -c3.z;
	r0 = r1 * r0;
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
	r5.xy = -v1.xy + v1.zw;
	r5.zw = v1.xy;
	r6 = r3 * r5.zwxw;
	r7 = min(r4, r6);
	r1 = (r1 * r3) + -r7;
	r1.x = dot(r1.xy, r1.xy) + c3.w;
	r1.y = dot(r1.zw, r1.zw) + c3.w;
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
	r1.x = dot(r2.xy, r2.xy) + c3.w;
	r1.w = dot(r2.zw, r2.zw) + c3.w;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.x = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r3.zw = clamp(-r1.yz + r1.xw, float2(0.0), float2(1.0));
	r1 = -r3 + -c3.zzzz;
	r0 = r0 * r1.xxxx;
	r0 = r1.yyyy * r0;
	r0 = r1.zzzz * r0;
	oC0 = r1.wwww * r0;
	#undef c0
	#undef c1
	#undef c2
	#undef c4
	#undef c5
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

