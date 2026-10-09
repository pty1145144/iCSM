#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[164];
};

struct source_main_Input
{
	float4 v0 [[attribute(0)]];
	float4 v1 [[attribute(1)]];
	float4 v2 [[attribute(2)]];
	float4 v3 [[attribute(3)]];
};

struct source_main_Output
{
	float4 oPos [[position]];
	float4 oT3 [[user(texcoord3)]];
	float4 oT4 [[user(texcoord4)]];
	float4 oT5 [[user(texcoord5)]];
	float4 oT6 [[user(texcoord6)]];
	float4 oT7 [[user(texcoord7)]];
};

vertex source_main_Output source_main (
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c1 = float4(-128.0, -64.0, 0.015873017, 1.0); (void) c1;
	const float4 c2 = float4(765.005859374, 0.000030517, 0.0, 0.0); (void) c2;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	int4 a0;
	const int ARRAYBASE_58 = 0;
	#define c0 uniforms.uniforms_float4[159]
	#define c8 uniforms.uniforms_float4[160]
	#define c9 uniforms.uniforms_float4[161]
	#define c10 uniforms.uniforms_float4[162]
	#define c11 uniforms.uniforms_float4[163]
	#define c58 uniforms.uniforms_float4[0]
	#define c59 uniforms.uniforms_float4[1]
	#define c60 uniforms.uniforms_float4[2]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define oPos output.oPos
	#define oT3 output.oT3
	#define oT4 output.oT4
	#define oT5 output.oT5
	#define oT6 output.oT6
	#define oT7 output.oT7
	r0 = v1 + c1.xxxx;
	r1 = abs(r0);
	r0 = float4(r0 < c0.xxxx);
	r1 = -r0 + r1;
	r0.xyz = (r0.xzw * -c0.zzz) + c0.yyy;
	r1 = r1 + c1.yyyy;
	r2 = abs(r1);
	r1 = float4(r1 < c0.xxxx);
	r2 = -r1 + r2;
	r1 = (r1 * -c0.zzzz) + c0.yyyy;
	r3.xy = (r2.xz * -c1.zz) + c1.ww;
	r3.xy = (r2.yw * -c1.zz) + r3.xy;
	r2 = r2 * c1.zzzz;
	r4.z = r3.y;
	r4.xy = r2.zw;
	r3.zw = r2.xy;
	r2.xyz = normalize(r3.zwx);
	r3.xyz = normalize(r4.xyz);
	r4.xy = r1.zw * r3.xy;
	r4.z = r0.y * r3.z;
	r1.xy = r1.xy * r2.xy;
	r1.z = r0.x * r2.z;
	r0.xyw = v3.zyx * c2.xxx;
	a0.xyz = int3(floor(abs(r0.xyw) + float3(0.5)) * sign(r0.xyw));
	r0.xy = v2.xy + c0.yy;
	r0.xy = r0.xy * c2.yy;
	r2 = r0.yyyy * uniforms.uniforms_float4[ARRAYBASE_58 + a0.y];
	r2 = (uniforms.uniforms_float4[ARRAYBASE_58 + a0.x] * r0.xxxx) + r2;
	r0.w = r0.y + r0.x;
	r0.w = -r0.w + c0.y;
	r2 = (uniforms.uniforms_float4[ARRAYBASE_58 + a0.z] * r0.wwww) + r2;
	r3.x = dot(r4.xyz, r2.xyz);
	r5 = r0.yyyy * uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.y];
	r6 = r0.yyyy * uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.y];
	r6 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.x] * r0.xxxx) + r6;
	r5 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.x] * r0.xxxx) + r5;
	r5 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.z] * r0.wwww) + r5;
	r6 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.z] * r0.wwww) + r6;
	r3.y = dot(r4.xyz, r5.xyz);
	r3.z = dot(r4.xyz, r6.xyz);
	r0.x = dot(r3.xyz, r3.xyz);
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	oT4.xyz = r0.xxx * r3.xyz;
	r4.x = dot(r1.xyz, r2.xyz);
	r2.x = dot(v0, r2);
	r4.y = dot(r1.xyz, r5.xyz);
	r2.y = dot(v0, r5);
	r4.z = dot(r1.xyz, r6.xyz);
	r2.z = dot(v0, r6);
	r0.xyw = r3.yzx * r4.zxy;
	r0.xyw = (r4.yzx * r3.zxy) + -r0.xyw;
	r0.xyz = r0.zzz * r0.xyw;
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	oT5.xyz = r0.www * r0.xyz;
	r0.x = dot(r4.xyz, r4.xyz);
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	oT6.xyz = r0.xxx * r4.xyz;
	r2.w = c0.y;
	r0.x = dot(r2, c8);
	r0.y = dot(r2, c9);
	r0.z = dot(r2, c10);
	r0.w = dot(r2, c11);
	oT3.xyz = r2.xyz;
	oPos = r0;
	oT7 = r0;
	#undef c0
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c58
	#undef c59
	#undef c60
	#undef v0
	#undef v1
	#undef v2
	#undef v3
	#undef oPos
	#undef oT3
	#undef oT4
	#undef oT5
	#undef oT6
	#undef oT7
	return output;
}

