#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[192];
	bool uniforms_bool[4];
};

struct source_main_Input
{
	float4 v0 [[attribute(0)]];
	float4 v1 [[attribute(1)]];
	float4 v2 [[attribute(2)]];
	float4 v3 [[attribute(3)]];
	float4 v4 [[attribute(4)]];
	float4 v5 [[attribute(5)]];
	float4 v6 [[attribute(6)]];
	float4 v7 [[attribute(7)]];
	float4 v8 [[attribute(8)]];
	float4 v10 [[attribute(10)]];
	float4 v11 [[attribute(11)]];
	float4 v12 [[attribute(12)]];
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
	const float4 c1 = float4(765.005859374, 2.200000047, 0.0001, 0.0); (void) c1;
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
	#define c12 uniforms.uniforms_float4[164]
	#define c13 uniforms.uniforms_float4[165]
	#define c27 uniforms.uniforms_float4[166]
	#define c28 uniforms.uniforms_float4[167]
	#define c29 uniforms.uniforms_float4[168]
	#define c30 uniforms.uniforms_float4[169]
	#define c31 uniforms.uniforms_float4[170]
	#define c32 uniforms.uniforms_float4[171]
	#define c33 uniforms.uniforms_float4[172]
	#define c34 uniforms.uniforms_float4[173]
	#define c35 uniforms.uniforms_float4[174]
	#define c36 uniforms.uniforms_float4[175]
	#define c37 uniforms.uniforms_float4[176]
	#define c38 uniforms.uniforms_float4[177]
	#define c39 uniforms.uniforms_float4[178]
	#define c40 uniforms.uniforms_float4[179]
	#define c41 uniforms.uniforms_float4[180]
	#define c42 uniforms.uniforms_float4[181]
	#define c43 uniforms.uniforms_float4[182]
	#define c44 uniforms.uniforms_float4[183]
	#define c45 uniforms.uniforms_float4[184]
	#define c46 uniforms.uniforms_float4[185]
	#define c48 uniforms.uniforms_float4[186]
	#define c49 uniforms.uniforms_float4[187]
	#define c50 uniforms.uniforms_float4[188]
	#define c51 uniforms.uniforms_float4[189]
	#define c52 uniforms.uniforms_float4[190]
	#define c53 uniforms.uniforms_float4[191]
	#define c58 uniforms.uniforms_float4[0]
	#define c59 uniforms.uniforms_float4[1]
	#define c60 uniforms.uniforms_float4[2]
	#define b0 uniforms.uniforms_bool[0]
	#define b1 uniforms.uniforms_bool[1]
	#define b2 uniforms.uniforms_bool[2]
	#define b3 uniforms.uniforms_bool[3]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define v7 input.v7
	#define v8 input.v8
	#define v10 input.v10
	#define v11 input.v11
	#define v12 input.v12
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
	r0.xyz = (v11.xyz * c13.xxx) + r0.xyz;
	r1.xyz = v12.xyz;
	r2.xyz = (r1.xyz * c13.xxx) + v3.xyz;
	r1.xyz = (r1.xyz * c13.xxx) + v10.xyz;
	r3.xyz = c1.xxx * v2.zyx;
	a0.xyz = int3(floor(abs(r3.xyz) + float3(0.5)) * sign(r3.xyz));
	r1.w = v1.y + v1.x;
	r1.w = -r1.w + c0.y;
	r3 = v1.yyyy * uniforms.uniforms_float4[ARRAYBASE_58 + a0.y];
	r4 = v1.yyyy * uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.y];
	r5 = v1.yyyy * uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.y];
	r3 = (uniforms.uniforms_float4[ARRAYBASE_58 + a0.x] * v1.xxxx) + r3;
	r4 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.x] * v1.xxxx) + r4;
	r5 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.x] * v1.xxxx) + r5;
	r3 = (uniforms.uniforms_float4[ARRAYBASE_58 + a0.z] * r1.wwww) + r3;
	r4 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.z] * r1.wwww) + r4;
	r5 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.z] * r1.wwww) + r5;
	r6.x = dot(r0, r3);
	r6.y = dot(r0, r4);
	r6.z = dot(r0, r5);
	r0.x = dot(r2.xyz, r3.xyz);
	r0.y = dot(r2.xyz, r4.xyz);
	r0.z = dot(r2.xyz, r5.xyz);
	r2.x = dot(r1.xyz, r3.xyz);
	r2.y = dot(r1.xyz, r4.xyz);
	r2.z = dot(r1.xyz, r5.xyz);
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	o3.xyz = r0.www * r0.xyz;
	r0.x = dot(r2.xyz, r2.xyz);
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	o4.xyz = r0.xxx * r2.xyz;
	r0.xyz = v4.xyz + v4.xyz;
	r1.x = log2(r0.x);
	r1.y = log2(r0.y);
	r1.z = log2(r0.z);
	r0.xyz = r1.xyz * c1.yyy;
	r1.x = exp2(r0.x);
	r1.y = exp2(r0.y);
	r1.z = exp2(r0.z);
	r0.xyz = v5.xyz + v5.xyz;
	r2.x = log2(r0.x);
	r2.y = log2(r0.y);
	r2.z = log2(r0.z);
	r0.xyz = r2.xyz * c1.yyy;
	r2.x = exp2(r0.x);
	r2.y = exp2(r0.y);
	r2.z = exp2(r0.z);
	r0.xyz = v6.xyz + v6.xyz;
	r3.x = log2(r0.x);
	r3.y = log2(r0.y);
	r3.z = log2(r0.z);
	r0.xyz = r3.xyz * c1.yyy;
	r3.x = exp2(r0.x);
	r3.y = exp2(r0.y);
	r3.z = exp2(r0.z);
	r0.xyz = (c12.xyz * -v4.www) + r1.xyz;
	r1.xyz = (c12.xyz * -v5.www) + r2.xyz;
	r2.xyz = (c12.xyz * -v6.www) + r3.xyz;
	o7.xyz = max(r0.xyz, c0.xxx);
	o8.xyz = max(r1.xyz, c0.xxx);
	o9.xyz = max(r2.xyz, c0.xxx);
	o1.x = dot(v7, c48);
	o1.y = dot(v7, c49);
	o2.x = dot(v7, c50);
	o2.y = dot(v7, c51);
	o2.z = dot(v7, c52);
	o2.w = dot(v7, c53);
	r6.w = c0.y;
	r0.x = dot(r6, c8);
	r0.y = dot(r6, c9);
	r0.z = dot(r6, c10);
	r0.w = dot(r6, c11);
	if (b0) {
		r1.xyz = -r6.xyz + c29.xyz;
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
		r1.x = max(r1.x, c1.z);
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
		r1.xyz = -r6.xyz + c34.xyz;
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
		r1.x = max(r1.x, c1.z);
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
		r1.xyz = -r6.xyz + c39.xyz;
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
		r1.x = max(r1.x, c1.z);
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
		r1.xyz = -r6.xyz + c44.xyz;
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
		r1.x = max(r1.x, c1.z);
		r2.x = pow(abs(r1.x), c45.x);
		r1.x = min(r2.x, c0.y);
		r1.x = (r1.w * r1.x) + -r1.w;
		r1.x = (c43.w * r1.x) + r1.w;
		r1.y = -r1.x + c0.y;
		o10.w = (c42.w * r1.y) + r1.x;
	} else {
		o10.w = c0.x;
	}
	o0 = r0;
	o1.zw = v8.xy;
	o3.w = c0.x;
	o4.w = v10.w;
	o5.xyz = r6.xyz;
	o5.w = c0.x;
	o6 = r0;
	o7.w = v4.w;
	o8.w = v5.w;
	o9.w = v6.w;
	#undef c0
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c12
	#undef c13
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
	#undef v4
	#undef v5
	#undef v6
	#undef v7
	#undef v8
	#undef v10
	#undef v11
	#undef v12
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

