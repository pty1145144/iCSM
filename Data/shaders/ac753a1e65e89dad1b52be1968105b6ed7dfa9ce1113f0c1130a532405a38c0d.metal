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
	const float4 c1 = float4(5.0, 0.01, -2.0, 3.0); (void) c1;
	const float4 c3 = float4(-300.0, 0.000588235, 20.0, 0.200000002); (void) c3;
	const float4 c4 = float4(-1000.0, -20.0, -800.0, -600.0); (void) c4;
	const float4 c5 = float4(0.0005, 0.025, 0.001111111, 0.002); (void) c5;
	const float4 c6 = float4(-0.01, -0.016, 0.159154935, 0.5); (void) c6;
	const float4 c7 = float4(0.949999989, -0.330000012, -6.670000074, 0.005); (void) c7;
	const float4 c12 = float4(6.283185478, -3.141592739, 0.003, 0.007); (void) c12;
	const float4 c13 = float4(3.0, 8.0, 6.0, 10.0); (void) c13;
	const float4 c14 = float4(1.5, 0.600000023, 0.400000005, 0.0012); (void) c14;
	const float4 c15 = float4(0.5, 0.700000011, -0.5, 1.0); (void) c15;
	const float4 c16 = float4(0.800000011, 0.200000002, 0.02, 2.400000095); (void) c16;
	const float4 c17 = float4(0.947867275, 0.052132699, 0.040449999, 0.07739938); (void) c17;
	const float4 c18 = float4(0.300000011, 0.589999973, 0.11, -0.75); (void) c18;
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
	#define c52 uniforms.uniforms_float4[7]
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
	r0.x = dot(v0, c58);
	r0.y = dot(v0, c59);
	r0.z = dot(v0, c60);
	r1.xyz = -r0.xyz + c52.xyz;
	r0.w = dot(r1.xyz, r1.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r1.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r1.xyz = r0.www * r1.xyz;
	r0.w = r1.w + c1.x;
	r0.w = r0.w * c1.y;
	r0.w = min(r0.w, c0.y);
	r1.w = (r0.w * c1.z) + c1.w;
	r0.w = r0.w * r0.w;
	r2.x = (r1.w * -r0.w) + c0.y;
	r0.w = r0.w * r1.w;
	r1.xyz = r1.xyz * r2.xxx;
	r2.xyz = c0.xyz;
	r1.xyz = (r1.xyz * -c52.www) + r2.xxy;
	r2.xyw = mix(r1.xyz, c0.xxy, r0.www);
	r0.w = (r0.w * c16.x) + c16.y;
	r1.xyz = r0.xyz + -c2.xyz;
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.xyz = r1.www * r1.xyz;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r3 = r1.wwww + c4;
	r3 = clamp(r3 * c5, float4(0.0), float4(1.0));
	r4.xyz = r1.yzx * r2.wxy;
	r4.xyz = (r2.ywx * r1.zxy) + -r4.xyz;
	r5.xyz = normalize(r4.xyz);
	r4.xyz = r1.zxy * r5.yzx;
	r4.xyz = (r1.yzx * r5.zxy) + -r4.xyz;
	r1.w = dot(r4.xyz, r4.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r4.xyz = (r4.xyz * r1.www) + -r2.xyw;
	r1.w = -r0.z + c2.z;
	r1.w = r1.w + c3.x;
	r1.w = clamp(r1.w * c3.y, 0.0, 1.0);
	r4.w = (r1.w * c1.z) + c1.w;
	r1.w = r1.w * r1.w;
	r1.w = r1.w * r4.w;
	r2.xyw = (r1.www * r4.xyz) + r2.xyw;
	r1.xyz = r1.www * r1.xyz;
	r0.xyz = (r1.xyz * -c3.zzz) + r0.xyz;
	r1 = (r3 * c1.zzzz) + c1.wwww;
	r3 = r3 * r3;
	r1 = r1 * r3;
	r1.x = r1.x * c3.w;
	r3.xy = c48.xy;
	r1.x = (r3.y * c7.x) + r1.x;
	r3.y = r1.x * v2.w;
	r3.y = float(abs(r3.y) < c48.w);
	r3.y = (r3.y * -v2.w) + v2.w;
	r2.xyw = r2.xyw * r3.yyy;
	r3.yz = r3.yy * c6.xy;
	r2.xyw = r1.xxx * r2.xyw;
	r3.w = r0.x + c48.x;
	r3.w = (r3.w * c6.z) + c6.w;
	r3.w = fract(r3.w);
	r3.w = (r3.w * c12.x) + c12.y;
	r4.y = sin(r3.w);
	r2.z = (c48.x * r2.z) + r0.y;
	r2.z = (r2.z * c6.z) + c6.w;
	r2.z = fract(r2.z);
	r2.z = (r2.z * c12.x) + c12.y;
	r6.y = sin(r2.z);
	r2.z = r4.y + r6.y;
	r2.z = r2.z * r3.z;
	r4.xyz = (r5.xyz * -r2.zzz) + r0.xyz;
	r5.xyz = r5.xyz * v2.zzz;
	r2.xyz = (r2.xyw * -r1.yyy) + r4.xyz;
	r2.xyz = (r5.xyz * -r1.xxx) + r2.xyz;
	r4 = r3.xxxx + c7.yyzz;
	r1.xy = (r4.xz * c6.zz) + c6.ww;
	r1.xy = fract(r1.xy);
	r1.xy = (r1.xy * c12.xx) + c12.yy;
	r5.y = sin(r1.x);
	r6.y = sin(r1.y);
	r0.z = (r2.x * c12.z) + r6.y;
	r1.x = (r2.x * c12.z) + r5.y;
	r4.xz = r2.yy * c12.zw;
	r5.xy = (r4.yw * c14.xx) + r4.zz;
	r1.y = (r3.x * c14.x) + r4.x;
	r1.y = (r1.y * c6.z) + c6.w;
	r1.y = fract(r1.y);
	r1.y = (r1.y * c12.x) + c12.y;
	r6.y = sin(r1.y);
	r4 = (r4.yyww * c13) + r0.xyxy;
	r4 = (r4 * c6.zzzz) + c6.wwww;
	r4 = fract(r4);
	r4 = (r4 * c12.xxxx) + c12.yyyy;
	r0.xy = (r5.xy * c6.zz) + c6.ww;
	r0.xy = fract(r0.xy);
	r0.xy = (r0.xy * c12.xx) + c12.yy;
	r5.y = sin(r0.x);
	r7.y = sin(r0.y);
	r0.x = (r3.y * r0.z) + r7.y;
	r0.y = (r3.y * r1.x) + r5.y;
	r5.y = sin(r4.x);
	r7.y = sin(r4.y);
	r0.z = r5.y + r7.y;
	r0.z = r0.z * r3.z;
	r5.xw = (r0.zz * c15.xy) + -r0.yy;
	r7.y = sin(r4.z);
	r8.y = sin(r4.w);
	r0.y = r7.y + r8.y;
	r0.y = r0.y * r3.z;
	r5.y = (r0.y * c14.y) + -r0.x;
	r5.z = (r0.y * c14.z) + r0.x;
	o5 = r5 * c14.wwww;
	r0.x = (r2.x * c7.w) + r3.x;
	r0.x = (r0.x * c6.z) + c6.w;
	r0.x = fract(r0.x);
	r0.x = (r0.x * c12.x) + c12.y;
	r4.y = sin(r0.x);
	r0.x = r6.y + r4.y;
	r0.x = r0.x * r3.y;
	r2.xyz = (r0.xxx * -c14.zzz) + r2.xyz;
	r2.w = c0.y;
	o0.x = dot(r2, c8);
	o0.y = dot(r2, c9);
	o0.w = dot(r2, c11);
	r0.x = dot(r2, c10);
	o6.xyz = r2.xyz;
	r0.y = (r1.z * c15.z) + c15.w;
	o1.y = (r1.w * c16.z) + v2.y;
	o2.w = r0.w * r0.y;
	r0.yzw = (v1.xyz * c17.xxx) + c17.yyy;
	r1.x = log2(r0.y);
	r1.y = log2(r0.z);
	r1.z = log2(r0.w);
	r0.yzw = r1.xyz * c16.www;
	r0.y = exp2(r0.y);
	r1.x = (v1.x * c17.w) + -r0.y;
	r1.yzw = float3(c17.zzz >= v1.xyz);
	o4.x = (r1.y * r1.x) + r0.y;
	r0.y = exp2(r0.z);
	r0.z = exp2(r0.w);
	r0.w = (v1.y * c17.w) + -r0.y;
	o4.y = (r1.z * r0.w) + r0.y;
	r0.y = (v1.z * c17.w) + -r0.z;
	o4.z = (r1.w * r0.y) + r0.z;
	r0.y = dot(v1.xyz, c18.xyz);
	r0.y = r0.y + c18.w;
	r0.y = clamp(r0.y * -c13.w, 0.0, 1.0);
	r0.z = (r0.y * c1.z) + c1.w;
	r0.y = r0.y * r0.y;
	o4.w = r0.y * r0.z;
	o0.z = r0.x;
	o6.w = r0.x;
	o1.x = v2.x;
	o2.xyz = c0.yyy;
	o3 = c0.yyyx;
	#undef c0
	#undef c2
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c48
	#undef c52
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

