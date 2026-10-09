#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[14];
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
	const float4 c6 = float4(0.949999989, 130.0, -0.003333333, 0.005); (void) c6;
	const float4 c7 = float4(0.200000002, 0.800000011, -0.330000012, -6.670000074); (void) c7;
	const float4 c12 = float4(-0.01, -0.016, 0.159154935, 0.5); (void) c12;
	const float4 c13 = float4(6.283185478, -3.141592739, 0.003, 0.007); (void) c13;
	const float4 c14 = float4(3.0, 8.0, 6.0, 10.0); (void) c14;
	const float4 c15 = float4(1.5, 0.600000023, 0.400000005, 0.0012); (void) c15;
	const float4 c16 = float4(0.5, 0.700000011, -0.5, 1.0); (void) c16;
	const float4 c17 = float4(0.02, 0.947867275, 0.052132699, 2.400000095); (void) c17;
	const float4 c18 = float4(0.040449999, 0.07739938, -0.75, 0.0); (void) c18;
	const float4 c19 = float4(0.300000011, 0.589999973, 0.11, 0.0); (void) c19;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	float4 r7;
	float4 r8;
	float4 r9;
	#define c0 uniforms.uniforms_float4[0]
	#define c2 uniforms.uniforms_float4[1]
	#define c8 uniforms.uniforms_float4[2]
	#define c9 uniforms.uniforms_float4[3]
	#define c10 uniforms.uniforms_float4[4]
	#define c11 uniforms.uniforms_float4[5]
	#define c48 uniforms.uniforms_float4[6]
	#define c51 uniforms.uniforms_float4[7]
	#define c52 uniforms.uniforms_float4[8]
	#define c53 uniforms.uniforms_float4[9]
	#define c54 uniforms.uniforms_float4[10]
	#define c58 uniforms.uniforms_float4[11]
	#define c59 uniforms.uniforms_float4[12]
	#define c60 uniforms.uniforms_float4[13]
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
	r2.xyw = -r0.xyz + c53.xyz;
	r1.w = dot(r2.xyw, r2.xyw);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r3.x = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r2.xyw = r1.www * r2.xyw;
	r1.w = r3.x + c1.x;
	r1.w = r1.w * c1.y;
	r1.w = min(r1.w, c0.y);
	r3.x = (r1.w * c1.z) + c1.w;
	r1.w = r1.w * r1.w;
	r3.y = (r3.x * -r1.w) + c0.y;
	r1.w = r1.w * r3.x;
	r0.w = min(r0.w, r1.w);
	r2.xyw = r2.xyw * r3.yyy;
	r1.xyz = (r2.xyw * -c53.www) + r1.xyz;
	r2.xyw = -r0.xyz + c54.xyz;
	r1.w = dot(r2.xyw, r2.xyw);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r3.x = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r2.xyw = r1.www * r2.xyw;
	r1.w = r3.x + c1.x;
	r1.w = r1.w * c1.y;
	r1.w = min(r1.w, c0.y);
	r3.x = (r1.w * c1.z) + c1.w;
	r1.w = r1.w * r1.w;
	r3.y = (r3.x * -r1.w) + c0.y;
	r1.w = r1.w * r3.x;
	r0.w = min(r0.w, r1.w);
	r2.xyw = r2.xyw * r3.yyy;
	r1.xyz = (r2.xyw * -c54.www) + r1.xyz;
	r2.xyw = mix(r1.xyz, c0.xxy, r0.www);
	r0.w = (r0.w * c7.y) + c7.x;
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
	r1.x = (r3.y * c6.x) + r1.x;
	r3.yz = r0.xy + -c51.xy;
	r3.yz = r3.yz * r3.yz;
	r3.y = r3.z + r3.y;
	r3.y = ((r3.y == 0.0) ? FLT_MAX : rsqrt(abs(r3.y)));
	r3.y = ((r3.y == 0.0) ? FLT_MAX : 1.0 / r3.y);
	r4.y = c6.y;
	r3.z = r4.y + c51.w;
	r3.y = -r3.z + r3.y;
	r3.y = clamp(r3.y * c6.z, 0.0, 1.0);
	r3.z = (r3.y * c1.z) + c1.w;
	r3.y = r3.y * r3.y;
	r3.w = r3.y * r3.z;
	r3.y = (r3.z * -r3.y) + c0.z;
	r4.x = r3.w * r3.y;
	r3.y = (r3.w * c7.x) + c7.y;
	r3.z = r3.w * r3.w;
	r1.x = r1.x * r3.y;
	r3.y = r1.x * v2.w;
	r3.y = float(abs(r3.y) < c48.w);
	r3.y = (r3.y * -v2.w) + v2.w;
	r2.xyw = r2.xyw * r3.yyy;
	r3.yw = r3.yy * c12.xy;
	r2.xyw = r1.xxx * r2.xyw;
	r5.w = r0.x + c48.x;
	r5.w = (r5.w * c12.z) + c12.w;
	r5.w = fract(r5.w);
	r5.w = (r5.w * c13.x) + c13.y;
	r6.y = sin(r5.w);
	r2.z = (c48.x * r2.z) + r0.y;
	r2.z = (r2.z * c12.z) + c12.w;
	r2.z = fract(r2.z);
	r2.z = (r2.z * c13.x) + c13.y;
	r7.y = sin(r2.z);
	r2.z = r6.y + r7.y;
	r2.z = r2.z * r3.w;
	r6.xyz = (r5.xyz * -r2.zzz) + r0.xyz;
	r5.xyz = r5.xyz * v2.zzz;
	r2.xyz = (r2.xyw * -r1.yyy) + r6.xyz;
	r2.xyz = (r5.xyz * -r1.xxx) + r2.xyz;
	r5 = r3.xxxx + c7.zzww;
	r1.xy = (r5.xz * c12.zz) + c12.ww;
	r1.xy = fract(r1.xy);
	r1.xy = (r1.xy * c13.xx) + c13.yy;
	r6.y = sin(r1.x);
	r7.y = sin(r1.y);
	r0.z = (r2.x * c13.z) + r7.y;
	r1.x = (r2.x * c13.z) + r6.y;
	r5.xz = r2.yy * c13.zw;
	r6.xy = (r5.yw * c15.xx) + r5.zz;
	r1.y = (r3.x * c15.x) + r5.x;
	r1.y = (r1.y * c12.z) + c12.w;
	r1.y = fract(r1.y);
	r1.y = (r1.y * c13.x) + c13.y;
	r7.y = sin(r1.y);
	r5 = (r5.yyww * c14) + r0.xyxy;
	r5 = (r5 * c12.zzzz) + c12.wwww;
	r5 = fract(r5);
	r5 = (r5 * c13.xxxx) + c13.yyyy;
	r0.xy = (r6.xy * c12.zz) + c12.ww;
	r0.xy = fract(r0.xy);
	r0.xy = (r0.xy * c13.xx) + c13.yy;
	r6.y = sin(r0.x);
	r8.y = sin(r0.y);
	r0.x = (r3.y * r0.z) + r8.y;
	r0.y = (r3.y * r1.x) + r6.y;
	r6.y = sin(r5.x);
	r8.y = sin(r5.y);
	r0.z = r6.y + r8.y;
	r0.z = r0.z * r3.w;
	r6.xw = (r0.zz * c16.xy) + -r0.yy;
	r8.y = sin(r5.z);
	r9.y = sin(r5.w);
	r0.y = r8.y + r9.y;
	r0.y = r0.y * r3.w;
	r6.y = (r0.y * c15.y) + -r0.x;
	r6.z = (r0.y * c15.z) + r0.x;
	o5 = r6 * c15.wwww;
	r0.x = (r2.x * c6.w) + r3.x;
	r0.x = (r0.x * c12.z) + c12.w;
	r0.x = fract(r0.x);
	r0.x = (r0.x * c13.x) + c13.y;
	r5.y = sin(r0.x);
	r0.x = r7.y + r5.y;
	r0.x = r0.x * r3.y;
	r2.xyz = (r0.xxx * -c15.zzz) + r2.xyz;
	r2.w = c0.y;
	o0.x = dot(r2, c8);
	o0.y = dot(r2, c9);
	o0.w = dot(r2, c11);
	r0.x = dot(r2, c10);
	o6.xyz = r2.xyz;
	o1.y = (r1.w * c17.x) + v2.y;
	r0.z = (r1.z * c16.z) + c16.w;
	r1.xyz = (v1.xyz * c17.yyy) + c17.zzz;
	r2.x = log2(r1.x);
	r2.y = log2(r1.y);
	r2.z = log2(r1.z);
	r1.xyz = r2.xyz * c17.www;
	r1.x = exp2(r1.x);
	r1.w = (v1.x * c18.y) + -r1.x;
	r2.xyz = float3(c18.xxx >= v1.xyz);
	o4.x = (r2.x * r1.w) + r1.x;
	r1.x = exp2(r1.y);
	r1.y = exp2(r1.z);
	r1.z = (v1.y * c18.y) + -r1.x;
	o4.y = (r2.y * r1.z) + r1.x;
	r1.x = (v1.z * c18.y) + -r1.y;
	o4.z = (r2.z * r1.x) + r1.y;
	r1.x = dot(v1.xyz, c19.xyz);
	r1.x = r1.x + c18.z;
	r1.x = clamp(r1.x * -c14.w, 0.0, 1.0);
	r1.y = (r1.x * c1.z) + c1.w;
	r1.x = r1.x * r1.x;
	o4.w = r1.x * r1.y;
	o0.z = r0.x;
	o6.w = r0.x;
	o1.x = v2.x;
	r0.y = c0.y;
	r4.yz = r3.zz * r0.yz;
	r4.w = r0.w * r4.z;
	o2 = r4.xyyw;
	o3 = c0.yyyx;
	#undef c0
	#undef c2
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c48
	#undef c51
	#undef c52
	#undef c53
	#undef c54
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

