#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[11];
};

struct source_main_Input
{
	float4 v0 [[attribute(0)]];
	float4 v1 [[attribute(1)]];
	float4 v2 [[attribute(2)]];
};

struct source_main_Output
{
	float4 o0 [[position]];
	float4 o1 [[user(texcoord0)]];
	float4 o2 [[user(texcoord2)]];
	float4 o3 [[user(texcoord5)]];
	float4 o4 [[user(texcoord6)]];
	float4 o5 [[user(texcoord4)]];
	float4 o6 [[user(texcoord7)]];
};

vertex source_main_Output source_main (
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c1 = float4(-300.0, 0.000588235, -2.0, 3.0); (void) c1;
	const float4 c3 = float4(20.0, 1000.0, 800.0, 600.0); (void) c3;
	const float4 c4 = float4(0.0005, 0.025, 0.001111111, 0.002); (void) c4;
	const float4 c5 = float4(0.200000002, 0.949999989, 130.0, -0.003333333); (void) c5;
	const float4 c6 = float4(0.200000002, 0.800000011, -0.330000012, -6.670000074); (void) c6;
	const float4 c7 = float4(-0.01, -0.016, 0.159154935, 0.5); (void) c7;
	const float4 c12 = float4(6.283185478, -3.141592739, 0.003, 0.007); (void) c12;
	const float4 c13 = float4(3.0, 8.0, 6.0, 10.0); (void) c13;
	const float4 c14 = float4(0.005, 1.5, 0.600000023, 0.400000005); (void) c14;
	const float4 c15 = float4(0.5, 0.700000011, 0.0012, -1.0); (void) c15;
	const float4 c16 = float4(0.02, 0.947867275, 0.052132699, 2.400000095); (void) c16;
	const float4 c17 = float4(0.040449999, 0.07739938, -0.75, 0.0); (void) c17;
	const float4 c18 = float4(0.300000011, 0.589999973, 0.11, 0.0); (void) c18;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	float4 r7;
	float4 r8;
	#define c0 uniforms.uniforms_float4[0]
	#define c2 uniforms.uniforms_float4[1]
	#define c8 uniforms.uniforms_float4[2]
	#define c9 uniforms.uniforms_float4[3]
	#define c10 uniforms.uniforms_float4[4]
	#define c11 uniforms.uniforms_float4[5]
	#define c48 uniforms.uniforms_float4[6]
	#define c51 uniforms.uniforms_float4[7]
	#define c58 uniforms.uniforms_float4[8]
	#define c59 uniforms.uniforms_float4[9]
	#define c60 uniforms.uniforms_float4[10]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define o0 output.o0
	#define o1 output.o1
	#define o2 output.o2
	#define o3 output.o3
	#define o4 output.o4
	#define o5 output.o5
	#define o6 output.o6
	r0.z = dot(v0, c60);
	r0.w = -r0.z + c2.z;
	r0.w = r0.w + c1.x;
	r0.w = clamp(r0.w * c1.y, 0.0, 1.0);
	r1.x = (r0.w * c1.z) + c1.w;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.x;
	r0.x = dot(v0, c58);
	r0.y = dot(v0, c59);
	r1.xyz = r0.xyz + -c2.xyz;
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.xyz = r1.www * r1.xyz;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r2 = r1.wwww + -c3.yxzw;
	r2 = clamp(r2 * c4, float4(0.0), float4(1.0));
	r3.xyz = r1.yzx * c0.yxx;
	r3.xyz = (r1.zxy * c0.xyx) + -r3.xyz;
	r4.xyz = normalize(r3.xyz);
	r3.xyz = r1.zxy * r4.yzx;
	r3.xyz = (r1.yzx * r4.zxy) + -r3.xyz;
	r1.xyz = r0.www * r1.xyz;
	r0.xyz = (r1.xyz * -c3.xxx) + r0.xyz;
	r1.x = dot(r3.xyz, r3.xyz);
	r1.x = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r1.xyz = (r3.xyz * r1.xxx) + -c0.xxy;
	r1.xyz = (r0.www * r1.xyz) + c0.xxy;
	r3 = (r2 * c1.zzzz) + c1.wwww;
	r2 = r2 * r2;
	r2 = r2 * r3;
	r0.w = r2.x * c5.x;
	r3.xy = c48.xy;
	r0.w = (r3.y * c5.y) + r0.w;
	r3.yz = r0.xy + -c51.xy;
	r3.yz = r3.yz * r3.yz;
	r1.w = r3.z + r3.y;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r3.z = c5.z;
	r2.x = r3.z + c51.w;
	r1.w = r1.w + -r2.x;
	r1.w = clamp(r1.w * c5.w, 0.0, 1.0);
	r2.x = (r1.w * c1.z) + c1.w;
	r1.w = r1.w * r1.w;
	r3.y = r1.w * r2.x;
	r1.w = (r2.x * -r1.w) + c0.z;
	o2.x = r3.y * r1.w;
	r1.w = (r3.y * c6.x) + c6.y;
	r2.x = r3.y * r3.y;
	r0.w = r0.w * r1.w;
	r1.w = r0.w * v2.w;
	r1.w = float(abs(r1.w) < c48.w);
	r1.w = (r1.w * -v2.w) + v2.w;
	r1.xyz = r1.www * r1.xyz;
	r3.yz = r1.ww * c7.xy;
	r1.xyz = r0.www * r1.xyz;
	r1.w = r0.x + c48.x;
	r1.w = (r1.w * c7.z) + c7.w;
	r1.w = fract(r1.w);
	r1.w = (r1.w * c12.x) + c12.y;
	r5.y = sin(r1.w);
	r1.w = (r3.x * c0.z) + r0.y;
	r1.w = (r1.w * c7.z) + c7.w;
	r1.w = fract(r1.w);
	r1.w = (r1.w * c12.x) + c12.y;
	r6.y = sin(r1.w);
	r1.w = r5.y + r6.y;
	r1.w = r1.w * r3.z;
	r5.xyz = (r4.xyz * -r1.www) + r0.xyz;
	r4.xyz = r4.xyz * v2.zzz;
	r1.xyz = (r1.xyz * -r2.yyy) + r5.xyz;
	r1.xyz = (r4.xyz * -r0.www) + r1.xyz;
	r4 = r3.xxxx + c6.zzww;
	r0.zw = (r4.xz * c7.zz) + c7.ww;
	r0.zw = fract(r0.zw);
	r0.zw = (r0.zw * c12.xx) + c12.yy;
	r5.y = sin(r0.z);
	r6.y = sin(r0.w);
	r0.z = (r1.x * c12.z) + r6.y;
	r0.w = (r1.x * c12.z) + r5.y;
	r4.xz = r1.yy * c12.zw;
	r5.xy = (r4.yw * c14.yy) + r4.zz;
	r1.w = (r3.x * c14.y) + r4.x;
	r1.w = (r1.w * c7.z) + c7.w;
	r1.w = fract(r1.w);
	r1.w = (r1.w * c12.x) + c12.y;
	r6.y = sin(r1.w);
	r4 = (r4.yyww * c13) + r0.xyxy;
	r4 = (r4 * c7.zzzz) + c7.wwww;
	r4 = fract(r4);
	r4 = (r4 * c12.xxxx) + c12.yyyy;
	r0.xy = (r5.xy * c7.zz) + c7.ww;
	r0.xy = fract(r0.xy);
	r0.xy = (r0.xy * c12.xx) + c12.yy;
	r5.y = sin(r0.x);
	r7.y = sin(r0.y);
	r0.x = (r3.y * r0.z) + r7.y;
	r0.y = (r3.y * r0.w) + r5.y;
	r5.y = sin(r4.x);
	r7.y = sin(r4.y);
	r0.z = r5.y + r7.y;
	r0.z = r0.z * r3.z;
	r5.xw = (r0.zz * c15.xy) + -r0.yy;
	r7.y = sin(r4.z);
	r8.y = sin(r4.w);
	r0.y = r7.y + r8.y;
	r0.y = r0.y * r3.z;
	r5.y = (r0.y * c14.z) + -r0.x;
	r5.z = (r0.y * c14.w) + r0.x;
	o5 = r5 * c15.zzzz;
	r0.x = (r1.x * c14.x) + r3.x;
	r0.x = (r0.x * c7.z) + c7.w;
	r0.x = fract(r0.x);
	r0.x = (r0.x * c12.x) + c12.y;
	r4.y = sin(r0.x);
	r0.x = r6.y + r4.y;
	r0.x = r0.x * r3.y;
	r0.xyz = (r0.xxx * -c14.www) + r1.xyz;
	r0.w = c0.y;
	o0.x = dot(r0, c8);
	o0.y = dot(r0, c9);
	o0.w = dot(r0, c11);
	r0.w = dot(r0, c10);
	o6 = r0;
	r1.w = (r2.z * -c15.x) + -c15.w;
	o1.y = (r2.w * c16.x) + v2.y;
	r1.yz = c0.yy;
	o2.yzw = r2.xxx * r1.yzw;
	r0.xyz = (v1.xyz * c16.yyy) + c16.zzz;
	r1.x = log2(r0.x);
	r1.y = log2(r0.y);
	r1.z = log2(r0.z);
	r0.xyz = r1.xyz * c16.www;
	r0.x = exp2(r0.x);
	r1.x = (v1.x * c17.y) + -r0.x;
	r1.yzw = float3(c17.xxx >= v1.xyz);
	o4.x = (r1.y * r1.x) + r0.x;
	r0.x = exp2(r0.y);
	r0.y = exp2(r0.z);
	r0.z = (v1.y * c17.y) + -r0.x;
	o4.y = (r1.z * r0.z) + r0.x;
	r0.x = (v1.z * c17.y) + -r0.y;
	o4.z = (r1.w * r0.x) + r0.y;
	r0.x = dot(v1.xyz, c18.xyz);
	r0.x = r0.x + c17.z;
	r0.x = clamp(r0.x * -c13.w, 0.0, 1.0);
	r0.y = (r0.x * c1.z) + c1.w;
	r0.x = r0.x * r0.x;
	o4.w = r0.x * r0.y;
	o0.z = r0.w;
	o1.x = v2.x;
	o3 = c0.yyyx;
	#undef c0
	#undef c2
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c48
	#undef c51
	#undef c58
	#undef c59
	#undef c60
	#undef v0
	#undef v1
	#undef v2
	#undef o0
	#undef o1
	#undef o2
	#undef o3
	#undef o4
	#undef o5
	#undef o6
	return output;
}

