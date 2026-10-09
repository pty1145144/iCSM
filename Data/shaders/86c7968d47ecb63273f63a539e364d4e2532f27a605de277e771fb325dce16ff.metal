#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[193];
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
	float4 v9 [[attribute(9)]];
	float4 v10 [[attribute(10)]];
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
	const float4 c1 = float4(-1.280000000e+02, -6.400000000e+01, 1.587301679e-02, 1.000000000e+00); (void) c1;
	const float4 c3 = float4(7.650058594e+02, 3.051757812e-05, 2.200000048e+00, 9.999999747e-05); (void) c3;
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
	#define c2 uniforms.uniforms_float4[160]
	#define c8 uniforms.uniforms_float4[161]
	#define c9 uniforms.uniforms_float4[162]
	#define c10 uniforms.uniforms_float4[163]
	#define c11 uniforms.uniforms_float4[164]
	#define c13 uniforms.uniforms_float4[165]
	#define c14 uniforms.uniforms_float4[166]
	#define c27 uniforms.uniforms_float4[167]
	#define c28 uniforms.uniforms_float4[168]
	#define c29 uniforms.uniforms_float4[169]
	#define c30 uniforms.uniforms_float4[170]
	#define c31 uniforms.uniforms_float4[171]
	#define c32 uniforms.uniforms_float4[172]
	#define c33 uniforms.uniforms_float4[173]
	#define c34 uniforms.uniforms_float4[174]
	#define c35 uniforms.uniforms_float4[175]
	#define c36 uniforms.uniforms_float4[176]
	#define c37 uniforms.uniforms_float4[177]
	#define c38 uniforms.uniforms_float4[178]
	#define c39 uniforms.uniforms_float4[179]
	#define c40 uniforms.uniforms_float4[180]
	#define c41 uniforms.uniforms_float4[181]
	#define c42 uniforms.uniforms_float4[182]
	#define c43 uniforms.uniforms_float4[183]
	#define c44 uniforms.uniforms_float4[184]
	#define c45 uniforms.uniforms_float4[185]
	#define c46 uniforms.uniforms_float4[186]
	#define c48 uniforms.uniforms_float4[187]
	#define c49 uniforms.uniforms_float4[188]
	#define c50 uniforms.uniforms_float4[189]
	#define c51 uniforms.uniforms_float4[190]
	#define c52 uniforms.uniforms_float4[191]
	#define c53 uniforms.uniforms_float4[192]
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
	#define v9 input.v9
	#define v10 input.v10
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
	r0 = c1.xxxx + v3;
	r1 = float4(r0 < c0.xxxx);
	r0 = abs(r0) + -r1;
	r0 = r0 + c1.yyyy;
	r2 = float4(r0 < c0.xxxx);
	r0 = abs(r0) + -r2;
	r3 = r0 * c1.zzzz;
	r2 = (r2 * -c0.zzzz) + c0.yyyy;
	r1.xyz = (r1.xzw * -c0.zzz) + c0.yyy;
	r0.xz = (r0.xz * -c1.zz) + c1.ww;
	r0.xz = (r0.yw * -c1.zz) + r0.xz;
	r0.yw = r3.xy;
	r4.xyz = normalize(r0.ywx);
	r5.xy = r2.xy * r4.xy;
	r5.z = r1.x * r4.z;
	r0.xy = r3.zw;
	r3.xyz = normalize(r0.xyz);
	r0.xy = r2.zw * r3.xy;
	r0.z = r1.y * r3.z;
	r0.w = c13.y * v9.w;
	r2.xyz = v9.xyz;
	r2.xyz = (r2.xyz * c13.xxx) + v0.xyz;
	r1.xyw = (v10.xyz * c13.xxx) + r5.xyz;
	r0.xyz = (v10.xyz * c13.xxx) + r0.xyz;
	r3.xyz = c3.xxx * v2.zyx;
	a0.xyz = int3(floor(abs(r3.xyz) + float3(0.5)) * sign(r3.xyz));
	r3.xy = c0.yy + v1.xy;
	r3.xy = r3.xy * c3.yy;
	r3.z = r3.y + r3.x;
	r3.z = -r3.z + c0.y;
	r4 = r3.yyyy * uniforms.uniforms_float4[ARRAYBASE_58 + a0.y];
	r5 = r3.yyyy * uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.y];
	r6 = r3.yyyy * uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.y];
	r4 = (uniforms.uniforms_float4[ARRAYBASE_58 + a0.x] * r3.xxxx) + r4;
	r5 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.x] * r3.xxxx) + r5;
	r6 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.x] * r3.xxxx) + r6;
	r4 = (uniforms.uniforms_float4[ARRAYBASE_58 + a0.z] * r3.zzzz) + r4;
	r5 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.z] * r3.zzzz) + r5;
	r3 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.z] * r3.zzzz) + r6;
	r2.w = v0.w;
	r6.x = dot(r2, r4);
	r6.y = dot(r2, r5);
	r6.z = dot(r2, r3);
	r2.x = dot(r1.xyw, r4.xyz);
	r2.y = dot(r1.xyw, r5.xyz);
	r2.z = dot(r1.xyw, r3.xyz);
	r4.x = dot(r0.xyz, r4.xyz);
	r4.y = dot(r0.xyz, r5.xyz);
	r4.z = dot(r0.xyz, r3.xyz);
	r0.x = dot(r2.xyz, r2.xyz);
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	o3.xyz = r0.xxx * r2.xyz;
	r0.x = dot(r4.xyz, r4.xyz);
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	o4.xyz = r0.xxx * r4.xyz;
	r0.xyz = v4.xyz + v4.xyz;
	r2.x = log2(r0.x);
	r2.y = log2(r0.y);
	r2.z = log2(r0.z);
	r0.xyz = r2.xyz * c3.zzz;
	o7.x = exp2(r0.x);
	o7.y = exp2(r0.y);
	o7.z = exp2(r0.z);
	r0.xyz = v5.xyz + v5.xyz;
	r2.x = log2(r0.x);
	r2.y = log2(r0.y);
	r2.z = log2(r0.z);
	r0.xyz = r2.xyz * c3.zzz;
	o8.x = exp2(r0.x);
	o8.y = exp2(r0.y);
	o8.z = exp2(r0.z);
	r0.xyz = v6.xyz + v6.xyz;
	r2.x = log2(r0.x);
	r2.y = log2(r0.y);
	r2.z = log2(r0.z);
	r0.xyz = r2.xyz * c3.zzz;
	o9.x = exp2(r0.x);
	o9.y = exp2(r0.y);
	o9.z = exp2(r0.z);
	o1.x = dot(v7, c48);
	o1.y = dot(v7, c49);
	o2.x = dot(v7, c50);
	o2.y = dot(v7, c51);
	o2.z = dot(v7, c52);
	o2.w = dot(v7, c53);
	if (b0) {
		r0.xyz = -r6.xyz + c29.xyz;
		r1.x = dot(r0.xyz, r0.xyz);
		r2.y = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
		r0.xyz = r0.xyz * r2.yyy;
		r2.xz = c0.yy;
		r2.yz = r1.xx * r2.yz;
		r1.x = dot(c31.xyz, r2.xyz);
		r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
		r0.x = dot(c28.xyz, -r0.xyz);
		r0.x = r0.x + -c30.z;
		r0.x = r0.x * c30.w;
		r0.x = max(r0.x, c3.w);
		r1.y = pow(abs(r0.x), c30.x);
		r0.x = min(r1.y, c0.y);
		r0.x = (r1.x * r0.x) + -r1.x;
		r0.x = (c28.w * r0.x) + r1.x;
		r0.y = -r0.x + c0.y;
		o10.x = (c27.w * r0.y) + r0.x;
	} else {
		o10.x = c0.x;
	}
	if (b1) {
		r0.xyz = -r6.xyz + c34.xyz;
		r1.x = dot(r0.xyz, r0.xyz);
		r2.y = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
		r0.xyz = r0.xyz * r2.yyy;
		r2.xz = c0.yy;
		r2.yz = r1.xx * r2.yz;
		r1.x = dot(c36.xyz, r2.xyz);
		r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
		r0.x = dot(c33.xyz, -r0.xyz);
		r0.x = r0.x + -c35.z;
		r0.x = r0.x * c35.w;
		r0.x = max(r0.x, c3.w);
		r1.y = pow(abs(r0.x), c35.x);
		r0.x = min(r1.y, c0.y);
		r0.x = (r1.x * r0.x) + -r1.x;
		r0.x = (c33.w * r0.x) + r1.x;
		r0.y = -r0.x + c0.y;
		o10.y = (c32.w * r0.y) + r0.x;
	} else {
		o10.y = c0.x;
	}
	if (b2) {
		r0.xyz = -r6.xyz + c39.xyz;
		r1.x = dot(r0.xyz, r0.xyz);
		r2.y = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
		r0.xyz = r0.xyz * r2.yyy;
		r2.xz = c0.yy;
		r2.yz = r1.xx * r2.yz;
		r1.x = dot(c41.xyz, r2.xyz);
		r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
		r0.x = dot(c38.xyz, -r0.xyz);
		r0.x = r0.x + -c40.z;
		r0.x = r0.x * c40.w;
		r0.x = max(r0.x, c3.w);
		r1.y = pow(abs(r0.x), c40.x);
		r0.x = min(r1.y, c0.y);
		r0.x = (r1.x * r0.x) + -r1.x;
		r0.x = (c38.w * r0.x) + r1.x;
		r0.y = -r0.x + c0.y;
		o10.z = (c37.w * r0.y) + r0.x;
	} else {
		o10.z = c0.x;
	}
	if (b3) {
		r0.xyz = -r6.xyz + c44.xyz;
		r1.x = dot(r0.xyz, r0.xyz);
		r2.y = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
		r0.xyz = r0.xyz * r2.yyy;
		r2.xz = c0.yy;
		r2.yz = r1.xx * r2.yz;
		r1.x = dot(c46.xyz, r2.xyz);
		r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
		r0.x = dot(c43.xyz, -r0.xyz);
		r0.x = r0.x + -c45.z;
		r0.x = r0.x * c45.w;
		r0.x = max(r0.x, c3.w);
		r1.y = pow(abs(r0.x), c45.x);
		r0.x = min(r1.y, c0.y);
		r0.x = (r1.x * r0.x) + -r1.x;
		r0.x = (c43.w * r0.x) + r1.x;
		r0.y = -r0.x + c0.y;
		o10.w = (c42.w * r0.y) + r0.x;
	} else {
		o10.w = c0.x;
	}
	r6.w = c0.y;
	r0.x = dot(r6, c8);
	r0.y = dot(r6, c9);
	r0.z = dot(r6, c10);
	o0.w = dot(r6, c11);
	r1.xyw = -r6.xyz + c2.xyz;
	r1.x = dot(r1.xyw, r1.xyw);
	r1.x = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.x = r1.x + -c14.x;
	r1.y = -c14.x + c14.y;
	r1.y = ((r1.y == 0.0) ? FLT_MAX : 1.0 / r1.y);
	o3.w = clamp(r1.y * r1.x, 0.0, 1.0);
	o0.xyz = r0.xyz;
	o1.zw = v8.xy;
	o4.w = r1.z;
	o5.xyz = r6.xyz;
	o5.w = c0.x;
	o6 = r0;
	o7.w = v4.w;
	o8.w = v5.w;
	o9.w = v6.w;
	#undef c0
	#undef c2
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c13
	#undef c14
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
	#undef v9
	#undef v10
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

