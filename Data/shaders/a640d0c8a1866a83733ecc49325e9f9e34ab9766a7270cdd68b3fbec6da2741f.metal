#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[188];
	bool uniforms_bool[4];
};

struct source_main_Input
{
	float4 v0 [[attribute(0)]];
	float4 v1 [[attribute(1)]];
	float4 v2 [[attribute(2)]];
	float4 v3 [[attribute(3)]];
	float4 v4 [[attribute(4)]];
};

struct source_main_Output
{
	float4 o0 [[position]];
	float4 o1 [[user(texcoord0)]];
	float4 o2 [[user(texcoord2)]];
	float4 o3 [[user(texcoord3)]];
	float4 o4 [[user(texcoord4)]];
};

vertex source_main_Output source_main (
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c1 = float4(-1.280000000e+02, -6.400000000e+01, 1.587301679e-02, 1.000000000e+00); (void) c1;
	const float4 c3 = float4(-2.000000000e+00, 1.000000000e+00, 7.650058594e+02, 3.051757812e-05); (void) c3;
	const float4 c4 = float4(5.000000075e-02, 9.999999747e-05, 0.000000000e+00, 0.000000000e+00); (void) c4;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	int4 a0;
	const int ARRAYBASE_58 = 0;
	#define c0 uniforms.uniforms_float4[159]
	#define c2 uniforms.uniforms_float4[160]
	#define c8 uniforms.uniforms_float4[161]
	#define c9 uniforms.uniforms_float4[162]
	#define c10 uniforms.uniforms_float4[163]
	#define c11 uniforms.uniforms_float4[164]
	#define c27 uniforms.uniforms_float4[165]
	#define c28 uniforms.uniforms_float4[166]
	#define c29 uniforms.uniforms_float4[167]
	#define c30 uniforms.uniforms_float4[168]
	#define c31 uniforms.uniforms_float4[169]
	#define c32 uniforms.uniforms_float4[170]
	#define c33 uniforms.uniforms_float4[171]
	#define c34 uniforms.uniforms_float4[172]
	#define c35 uniforms.uniforms_float4[173]
	#define c36 uniforms.uniforms_float4[174]
	#define c37 uniforms.uniforms_float4[175]
	#define c38 uniforms.uniforms_float4[176]
	#define c39 uniforms.uniforms_float4[177]
	#define c40 uniforms.uniforms_float4[178]
	#define c41 uniforms.uniforms_float4[179]
	#define c42 uniforms.uniforms_float4[180]
	#define c43 uniforms.uniforms_float4[181]
	#define c44 uniforms.uniforms_float4[182]
	#define c45 uniforms.uniforms_float4[183]
	#define c46 uniforms.uniforms_float4[184]
	#define c48 uniforms.uniforms_float4[185]
	#define c49 uniforms.uniforms_float4[186]
	#define c50 uniforms.uniforms_float4[187]
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
	#define o0 output.o0
	#define o1 output.o1
	#define o2 output.o2
	#define o3 output.o3
	#define o4 output.o4
	r0.xy = c1.xx + v2.xy;
	r0.zw = float2(r0.xy < c0.xx);
	r0.xy = -r0.zw + abs(r0.xy);
	r0.xy = r0.xy + c1.yy;
	r1.xy = float2(r0.xy < c0.xx);
	r0.xy = abs(r0.xy) + -r1.xy;
	r2.xy = r0.xy * c1.zz;
	r0.x = (r0.x * -c1.z) + c1.w;
	r2.z = (r0.y * -c1.z) + r0.x;
	r3.xyz = normalize(r2.xyz);
	r0.xy = (r1.xy * c3.xx) + c3.yy;
	r1.xy = r0.xy * r3.xy;
	r0.x = (r0.z * c3.x) + c3.y;
	r1.z = r0.x * r3.z;
	r0.xyz = c3.zzz * v4.zyx;
	a0.xyz = int3(floor(abs(r0.xyz) + float3(0.5)) * sign(r0.xyz));
	r0.xy = c0.yy + v3.xy;
	r0.xy = r0.xy * c3.ww;
	r0.z = r0.y + r0.x;
	r0.z = -r0.z + c0.y;
	r2 = r0.yyyy * uniforms.uniforms_float4[ARRAYBASE_58 + a0.y];
	r3 = r0.yyyy * uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.y];
	r4 = r0.yyyy * uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.y];
	r2 = (uniforms.uniforms_float4[ARRAYBASE_58 + a0.x] * r0.xxxx) + r2;
	r3 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.x] * r0.xxxx) + r3;
	r4 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.x] * r0.xxxx) + r4;
	r2 = (uniforms.uniforms_float4[ARRAYBASE_58 + a0.z] * r0.zzzz) + r2;
	r3 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.z] * r0.zzzz) + r3;
	r0 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.z] * r0.zzzz) + r4;
	r4.x = dot(v0, r2);
	r4.y = dot(v0, r3);
	r4.z = dot(v0, r0);
	r2.x = dot(r1.xyz, r2.xyz);
	r2.y = dot(r1.xyz, r3.xyz);
	r2.z = dot(r1.xyz, r0.xyz);
	r0.x = dot(r2.xyz, r2.xyz);
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	o4.xyz = r0.xxx * r2.xyz;
	r0.xyz = r4.xyz + -c2.xyz;
	r1.xyz = normalize(r0.xyz);
	r0.xyz = (r1.xyz * -c4.xxx) + r4.xyz;
	r0.w = c0.y;
	o0.x = dot(r0, c8);
	o0.y = dot(r0, c9);
	o0.z = dot(r0, c10);
	o0.w = dot(r0, c11);
	if (b0) {
		r1.xyz = -r0.xyz + c29.xyz;
		r0.w = dot(r1.xyz, r1.xyz);
		r2.y = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
		r1.xyz = r1.xyz * r2.yyy;
		r2.xz = c0.yy;
		r2.yz = r0.ww * r2.yz;
		r0.w = dot(c31.xyz, r2.xyz);
		r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
		r1.x = dot(c28.xyz, -r1.xyz);
		r1.x = r1.x + -c30.z;
		r1.x = r1.x * c30.w;
		r1.x = max(r1.x, c4.y);
		r2.x = pow(abs(r1.x), c30.x);
		r1.x = min(r2.x, c0.y);
		r1.x = (r0.w * r1.x) + -r0.w;
		r0.w = (c28.w * r1.x) + r0.w;
		r1.x = -r0.w + c0.y;
		o2.x = (c27.w * r1.x) + r0.w;
	} else {
		o2.x = c0.x;
	}
	if (b1) {
		r1.xyz = -r0.xyz + c34.xyz;
		r0.w = dot(r1.xyz, r1.xyz);
		r2.y = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
		r1.xyz = r1.xyz * r2.yyy;
		r2.xz = c0.yy;
		r2.yz = r0.ww * r2.yz;
		r0.w = dot(c36.xyz, r2.xyz);
		r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
		r1.x = dot(c33.xyz, -r1.xyz);
		r1.x = r1.x + -c35.z;
		r1.x = r1.x * c35.w;
		r1.x = max(r1.x, c4.y);
		r2.x = pow(abs(r1.x), c35.x);
		r1.x = min(r2.x, c0.y);
		r1.x = (r0.w * r1.x) + -r0.w;
		r0.w = (c33.w * r1.x) + r0.w;
		r1.x = -r0.w + c0.y;
		o2.y = (c32.w * r1.x) + r0.w;
	} else {
		o2.y = c0.x;
	}
	if (b2) {
		r1.xyz = -r0.xyz + c39.xyz;
		r0.w = dot(r1.xyz, r1.xyz);
		r2.y = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
		r1.xyz = r1.xyz * r2.yyy;
		r2.xz = c0.yy;
		r2.yz = r0.ww * r2.yz;
		r0.w = dot(c41.xyz, r2.xyz);
		r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
		r1.x = dot(c38.xyz, -r1.xyz);
		r1.x = r1.x + -c40.z;
		r1.x = r1.x * c40.w;
		r1.x = max(r1.x, c4.y);
		r2.x = pow(abs(r1.x), c40.x);
		r1.x = min(r2.x, c0.y);
		r1.x = (r0.w * r1.x) + -r0.w;
		r0.w = (c38.w * r1.x) + r0.w;
		r1.x = -r0.w + c0.y;
		o2.z = (c37.w * r1.x) + r0.w;
	} else {
		o2.z = c0.x;
	}
	if (b3) {
		r1.xyz = -r0.xyz + c44.xyz;
		r0.w = dot(r1.xyz, r1.xyz);
		r2.y = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
		r1.xyz = r1.xyz * r2.yyy;
		r2.xz = c0.yy;
		r2.yz = r0.ww * r2.yz;
		r0.w = dot(c46.xyz, r2.xyz);
		r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
		r1.x = dot(c43.xyz, -r1.xyz);
		r1.x = r1.x + -c45.z;
		r1.x = r1.x * c45.w;
		r1.x = max(r1.x, c4.y);
		r2.x = pow(abs(r1.x), c45.x);
		r1.x = min(r2.x, c0.y);
		r1.x = (r0.w * r1.x) + -r0.w;
		r0.w = (c43.w * r1.x) + r0.w;
		r1.x = -r0.w + c0.y;
		o2.w = (c42.w * r1.x) + r0.w;
	} else {
		o2.w = c0.x;
	}
	r1.xy = c48.xy * v1.xy;
	r0.w = r1.y + r1.x;
	o1.z = r0.w + c48.w;
	r1.xy = c49.xy * v1.xy;
	r0.w = r1.y + r1.x;
	r0.w = r0.w + c49.w;
	r0.w = r0.w + -c0.w;
	r1.w = c0.w;
	o1.w = (r0.w * c50.x) + r1.w;
	o1.xy = v1.xy;
	o3.xyz = r0.xyz;
	#undef c0
	#undef c2
	#undef c8
	#undef c9
	#undef c10
	#undef c11
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
	#undef o0
	#undef o1
	#undef o2
	#undef o3
	#undef o4
	return output;
}

