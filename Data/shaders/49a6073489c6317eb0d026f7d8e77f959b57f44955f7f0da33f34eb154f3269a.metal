#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[37];
	bool uniforms_bool[4];
};

struct source_main_Input
{
	float4 v0 [[attribute(0)]];
	float4 v1 [[attribute(1)]];
	float4 v2 [[attribute(2)]];
	float4 v3 [[attribute(3)]];
	float4 v5 [[attribute(5)]];
	float4 v6 [[attribute(6)]];
	float4 v7 [[attribute(7)]];
};

struct source_main_Output
{
	float4 o0 [[position]];
	float4 o1 [[user(texcoord0)]];
	float4 o2 [[user(texcoord1)]];
	float4 o3 [[user(texcoord2)]];
	float4 o4 [[user(texcoord3)]];
	float4 o5 [[user(texcoord4)]];
	float4 o6 [[user(texcoord5)]];
	float4 o7 [[user(texcoord6)]];
	float4 o8 [[user(texcoord7)]];
	float4 o9 [[user(texcoord8)]];
	float4 o10 [[user(texcoord9)]];
};

vertex source_main_Output source_main (
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c1 = float4(9.999999747e-05, 0.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c1;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	#define c0 uniforms.uniforms_float4[0]
	#define c2 uniforms.uniforms_float4[1]
	#define c8 uniforms.uniforms_float4[2]
	#define c9 uniforms.uniforms_float4[3]
	#define c10 uniforms.uniforms_float4[4]
	#define c11 uniforms.uniforms_float4[5]
	#define c13 uniforms.uniforms_float4[6]
	#define c16 uniforms.uniforms_float4[7]
	#define c27 uniforms.uniforms_float4[8]
	#define c28 uniforms.uniforms_float4[9]
	#define c29 uniforms.uniforms_float4[10]
	#define c30 uniforms.uniforms_float4[11]
	#define c31 uniforms.uniforms_float4[12]
	#define c32 uniforms.uniforms_float4[13]
	#define c33 uniforms.uniforms_float4[14]
	#define c34 uniforms.uniforms_float4[15]
	#define c35 uniforms.uniforms_float4[16]
	#define c36 uniforms.uniforms_float4[17]
	#define c37 uniforms.uniforms_float4[18]
	#define c38 uniforms.uniforms_float4[19]
	#define c39 uniforms.uniforms_float4[20]
	#define c40 uniforms.uniforms_float4[21]
	#define c41 uniforms.uniforms_float4[22]
	#define c42 uniforms.uniforms_float4[23]
	#define c43 uniforms.uniforms_float4[24]
	#define c44 uniforms.uniforms_float4[25]
	#define c45 uniforms.uniforms_float4[26]
	#define c46 uniforms.uniforms_float4[27]
	#define c48 uniforms.uniforms_float4[28]
	#define c49 uniforms.uniforms_float4[29]
	#define c50 uniforms.uniforms_float4[30]
	#define c51 uniforms.uniforms_float4[31]
	#define c52 uniforms.uniforms_float4[32]
	#define c53 uniforms.uniforms_float4[33]
	#define c58 uniforms.uniforms_float4[34]
	#define c59 uniforms.uniforms_float4[35]
	#define c60 uniforms.uniforms_float4[36]
	#define b0 uniforms.uniforms_bool[0]
	#define b1 uniforms.uniforms_bool[1]
	#define b2 uniforms.uniforms_bool[2]
	#define b3 uniforms.uniforms_bool[3]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v5 input.v5
	#define v6 input.v6
	#define v7 input.v7
	#define o0 output.o0
	#define o1 output.o1
	#define o2 output.o2
	#define o3 output.o3
	#define o4 output.o4
	#define o5 output.o5
	#define o6 output.o6
	#define o7 output.o7
	#define o8 output.o8
	#define o9 output.o9
	#define o10 output.o10
	r0 = v0;
	r0.xyz = (v6.xyz * c13.xxx) + r0.xyz;
	r1.xyz = v7.xyz;
	r2.xyz = (r1.xyz * c13.xxx) + v1.xyz;
	r1.xyz = (r1.xyz * c13.xxx) + v5.xyz;
	r3.x = dot(r0, c58);
	r3.y = dot(r0, c59);
	r3.z = dot(r0, c60);
	r0.x = dot(r2.xyz, c58.xyz);
	r0.y = dot(r2.xyz, c59.xyz);
	r0.z = dot(r2.xyz, c60.xyz);
	r2.x = dot(r1.xyz, c58.xyz);
	r2.y = dot(r1.xyz, c59.xyz);
	r2.z = dot(r1.xyz, c60.xyz);
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	o3.xyz = r0.www * r0.xyz;
	r0.x = dot(r2.xyz, r2.xyz);
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	o4.xyz = r0.xxx * r2.xyz;
	o1.x = dot(v2, c48);
	o1.y = dot(v2, c49);
	o2.x = dot(v2, c50);
	o2.y = dot(v2, c51);
	o2.z = dot(v2, c52);
	o2.w = dot(v2, c53);
	r3.w = c0.y;
	r0.x = dot(r3, c8);
	r0.y = dot(r3, c9);
	r0.z = dot(r3, c10);
	r0.w = dot(r3, c11);
	if (b0) {
		r1.xyz = -r3.xyz + c29.xyz;
		r1.w = dot(r1.xyz, r1.xyz);
		r2.y = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
		r1.xyz = r1.xyz * r2.yyy;
		r2.xz = c0.yy;
		r2.yz = r1.ww * r2.yz;
		r1.w = dot(c31.xyz, r2.xyz);
		r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
		r1.x = dot(c28.xyz, -r1.xyz);
		r1.x = r1.x + -c30.z;
		r1.x = r1.x * c30.w;
		r1.x = max(r1.x, c1.x);
		r2.x = pow(abs(r1.x), c30.x);
		r1.x = min(r2.x, c0.y);
		r1.x = (r1.w * r1.x) + -r1.w;
		r1.x = (c28.w * r1.x) + r1.w;
		r1.y = -r1.x + c0.y;
		o10.x = (c27.w * r1.y) + r1.x;
	} else {
		o10.x = c0.x;
	}
	if (b1) {
		r1.xyz = -r3.xyz + c34.xyz;
		r1.w = dot(r1.xyz, r1.xyz);
		r2.y = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
		r1.xyz = r1.xyz * r2.yyy;
		r2.xz = c0.yy;
		r2.yz = r1.ww * r2.yz;
		r1.w = dot(c36.xyz, r2.xyz);
		r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
		r1.x = dot(c33.xyz, -r1.xyz);
		r1.x = r1.x + -c35.z;
		r1.x = r1.x * c35.w;
		r1.x = max(r1.x, c1.x);
		r2.x = pow(abs(r1.x), c35.x);
		r1.x = min(r2.x, c0.y);
		r1.x = (r1.w * r1.x) + -r1.w;
		r1.x = (c33.w * r1.x) + r1.w;
		r1.y = -r1.x + c0.y;
		o10.y = (c32.w * r1.y) + r1.x;
	} else {
		o10.y = c0.x;
	}
	if (b2) {
		r1.xyz = -r3.xyz + c39.xyz;
		r1.w = dot(r1.xyz, r1.xyz);
		r2.y = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
		r1.xyz = r1.xyz * r2.yyy;
		r2.xz = c0.yy;
		r2.yz = r1.ww * r2.yz;
		r1.w = dot(c41.xyz, r2.xyz);
		r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
		r1.x = dot(c38.xyz, -r1.xyz);
		r1.x = r1.x + -c40.z;
		r1.x = r1.x * c40.w;
		r1.x = max(r1.x, c1.x);
		r2.x = pow(abs(r1.x), c40.x);
		r1.x = min(r2.x, c0.y);
		r1.x = (r1.w * r1.x) + -r1.w;
		r1.x = (c38.w * r1.x) + r1.w;
		r1.y = -r1.x + c0.y;
		o10.z = (c37.w * r1.y) + r1.x;
	} else {
		o10.z = c0.x;
	}
	if (b3) {
		r1.xyz = -r3.xyz + c44.xyz;
		r1.w = dot(r1.xyz, r1.xyz);
		r2.y = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
		r1.xyz = r1.xyz * r2.yyy;
		r2.xz = c0.yy;
		r2.yz = r1.ww * r2.yz;
		r1.w = dot(c46.xyz, r2.xyz);
		r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
		r1.x = dot(c43.xyz, -r1.xyz);
		r1.x = r1.x + -c45.z;
		r1.x = r1.x * c45.w;
		r1.x = max(r1.x, c1.x);
		r2.x = pow(abs(r1.x), c45.x);
		r1.x = min(r2.x, c0.y);
		r1.x = (r1.w * r1.x) + -r1.w;
		r1.x = (c43.w * r1.x) + r1.w;
		r1.y = -r1.x + c0.y;
		o10.w = (c42.w * r1.y) + r1.x;
	} else {
		o10.w = c0.x;
	}
	r1.xyz = -r3.xyz + c2.xyz;
	r1.x = dot(r1.xyz, r1.xyz);
	r1.x = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.x = clamp((r1.x * c16.w) + c16.x, 0.0, 1.0);
	o3.w = min(r1.x, c16.z);
	o0 = r0;
	o1.zw = v3.xy;
	o4.w = v5.w;
	o5.xyz = r3.xyz;
	o5.w = c0.x;
	o6 = r0;
	o7 = c0.xxxx;
	o8 = c0.xxxx;
	o9 = c0.xxxx;
	#undef c0
	#undef c2
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c13
	#undef c16
	#undef c27
	#undef c28
	#undef c29
	#undef c30
	#undef c31
	#undef c32
	#undef c33
	#undef c34
	#undef c35
	#undef c36
	#undef c37
	#undef c38
	#undef c39
	#undef c40
	#undef c41
	#undef c42
	#undef c43
	#undef c44
	#undef c45
	#undef c46
	#undef c48
	#undef c49
	#undef c50
	#undef c51
	#undef c52
	#undef c53
	#undef c58
	#undef c59
	#undef c60
	#undef b0
	#undef b1
	#undef b2
	#undef b3
	#undef v0
	#undef v1
	#undef v2
	#undef v3
	#undef v5
	#undef v6
	#undef v7
	#undef o0
	#undef o1
	#undef o2
	#undef o3
	#undef o4
	#undef o5
	#undef o6
	#undef o7
	#undef o8
	#undef o9
	#undef o10
	return output;
}

