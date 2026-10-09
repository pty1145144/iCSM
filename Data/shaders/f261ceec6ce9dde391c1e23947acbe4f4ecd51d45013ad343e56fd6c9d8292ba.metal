#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[190];
	int4 uniforms_int4[1];
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
};

vertex source_main_Output source_main (
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c1 = float4(765.005859374, 2.200000047, 0.333333342, 5.0); (void) c1;
	const float4 c2 = float4(0.0001, 0.000001, 0.0, 0.0); (void) c2;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	float4 r7;
	float4 r8;
	int4 a0;
	const int ARRAYBASE_58 = 0;
	const int ARRAYBASE_27 = 159;
	#define c0 uniforms.uniforms_float4[179]
	#define c8 uniforms.uniforms_float4[180]
	#define c9 uniforms.uniforms_float4[181]
	#define c10 uniforms.uniforms_float4[182]
	#define c11 uniforms.uniforms_float4[183]
	#define c13 uniforms.uniforms_float4[184]
	#define c27 uniforms.uniforms_float4[159]
	#define c28 uniforms.uniforms_float4[160]
	#define c29 uniforms.uniforms_float4[161]
	#define c30 uniforms.uniforms_float4[162]
	#define c31 uniforms.uniforms_float4[163]
	#define c48 uniforms.uniforms_float4[185]
	#define c49 uniforms.uniforms_float4[186]
	#define c50 uniforms.uniforms_float4[187]
	#define c52 uniforms.uniforms_float4[188]
	#define c53 uniforms.uniforms_float4[189]
	#define c58 uniforms.uniforms_float4[0]
	#define c59 uniforms.uniforms_float4[1]
	#define c60 uniforms.uniforms_float4[2]
	#define i0 uniforms.uniforms_int4[0]
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
	r0.x = abs(c50.x);
	r0.x = float(-r0.x < r0.x);
	r1 = v0;
	r1.xyz = (v9.xyz * c13.xxx) + r1.xyz;
	r2.xyz = v10.xyz;
	r0.yzw = (r2.xyz * c13.xxx) + v3.xyz;
	r2.xyz = c1.xxx * v2.zyx;
	a0.xyz = int3(floor(abs(r2.xyz) + float3(0.5)) * sign(r2.xyz));
	r2.x = v1.y + v1.x;
	r2.x = -r2.x + c0.y;
	r3 = v1.yyyy * uniforms.uniforms_float4[ARRAYBASE_58 + a0.y];
	r4 = v1.yyyy * uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.y];
	r5 = v1.yyyy * uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.y];
	r3 = (uniforms.uniforms_float4[ARRAYBASE_58 + a0.x] * v1.xxxx) + r3;
	r4 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.x] * v1.xxxx) + r4;
	r5 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.x] * v1.xxxx) + r5;
	r3 = (uniforms.uniforms_float4[ARRAYBASE_58 + a0.z] * r2.xxxx) + r3;
	r4 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.z] * r2.xxxx) + r4;
	r2 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.z] * r2.xxxx) + r5;
	r5.x = dot(r1, r3);
	r5.y = dot(r1, r4);
	r5.z = dot(r1, r2);
	r1.x = dot(r0.yzw, r3.xyz);
	r1.y = dot(r0.yzw, r4.xyz);
	r1.z = dot(r0.yzw, r2.xyz);
	r2.xyz = normalize(r1.xyz);
	r0.yzw = v4.xyz + v4.xyz;
	r1.x = log2(r0.y);
	r1.y = log2(r0.z);
	r1.z = log2(r0.w);
	r0.yzw = r1.xyz * c1.yyy;
	r1.x = exp2(r0.y);
	r1.y = exp2(r0.z);
	r1.z = exp2(r0.w);
	r0.yzw = v5.xyz + v5.xyz;
	r3.x = log2(r0.y);
	r3.y = log2(r0.z);
	r3.z = log2(r0.w);
	r0.yzw = r3.xyz * c1.yyy;
	r3.x = exp2(r0.y);
	r3.y = exp2(r0.z);
	r3.z = exp2(r0.w);
	r0.yzw = r1.xyz + r3.xyz;
	r1.xyz = v6.xyz + v6.xyz;
	r3.x = log2(r1.x);
	r3.y = log2(r1.y);
	r3.z = log2(r1.z);
	r1.xyz = r3.xyz * c1.yyy;
	r3.x = exp2(r1.x);
	r3.y = exp2(r1.y);
	r3.z = exp2(r1.z);
	r0.yzw = r0.yzw + r3.xyz;
	r1.w = v4.w;
	r1.x = r1.w + v5.w;
	r1.x = r1.x + v6.w;
	r1.y = r1.x * c1.z;
	r3.z = c0.y;
	r4.x = c0.y;
	r6.xyz = c0.xxx;
	r1.z = c0.x;
	for (int rep1 = 0; rep1 < i0.x; rep1++) {
		r1.w = r1.z * c1.w;
		a0.x = int(floor(abs(r1.w) + 0.5) * sign(r1.w));
		r7.xyz = -r5.xyz + uniforms.uniforms_float4[(ARRAYBASE_27 + 2) + a0.x].xyz;
		r1.w = dot(r7.xyz, r7.xyz);
		r3.y = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
		r8.xyz = r3.yyy * r7.xyz;
		r7.xyz = (r7.xyz * -r3.yyy) + -uniforms.uniforms_float4[(ARRAYBASE_27 + 1) + a0.x].xyz;
		r7.xyz = (uniforms.uniforms_float4[ARRAYBASE_27 + a0.x].www * r7.xyz) + r8.xyz;
		r2.w = dot(r2.xyz, r7.xyz);
		r2.w = max(r2.w, c0.x);
		r2.w = (r2.w * r2.w) + r2.w;
		r2.w = r2.w * c0.w;
		r7.xyz = r2.www * uniforms.uniforms_float4[ARRAYBASE_27 + a0.x].xyz;
		r4.yz = r3.yz * r1.ww;
		r1.w = dot(uniforms.uniforms_float4[(ARRAYBASE_27 + 4) + a0.x].xyz, r4.xyz);
		r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
		r2.w = dot(uniforms.uniforms_float4[(ARRAYBASE_27 + 1) + a0.x].xyz, -r8.xyz);
		r2.w = r2.w + -uniforms.uniforms_float4[(ARRAYBASE_27 + 3) + a0.x].z;
		r2.w = r2.w * uniforms.uniforms_float4[(ARRAYBASE_27 + 3) + a0.x].w;
		r2.w = max(r2.w, c2.x);
		r3.x = pow(abs(r2.w), uniforms.uniforms_float4[(ARRAYBASE_27 + 3) + a0.x].x);
		r2.w = min(r3.x, c0.y);
		r2.w = (r1.w * r2.w) + -r1.w;
		r1.w = (uniforms.uniforms_float4[(ARRAYBASE_27 + 1) + a0.x].w * r2.w) + r1.w;
		r2.w = -r1.w + c0.y;
		r1.w = (uniforms.uniforms_float4[ARRAYBASE_27 + a0.x].w * r2.w) + r1.w;
		r6.xyz = (r7.xyz * r1.www) + r6.xyz;
		r1.z = r1.z + c0.y;
	}
	r1.yzw = r1.yyy * c50.yzw;
	r0.yzw = (r0.yzw * c1.zzz) + -r1.yzw;
	o7.xyz = r6.xyz + r0.yzw;
	r0.yzw = -r5.xyz + c29.xyz;
	r2.w = dot(r0.yzw, r0.yzw);
	r2.w = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r3.xyz = r0.yzw * r2.www;
	r0.yzw = (r0.yzw * -r2.www) + -c28.xyz;
	r0.yzw = (c27.www * r0.yzw) + r3.xyz;
	r0.y = dot(r2.xyz, r0.yzw);
	r0.y = max(r0.y, c0.x);
	r0.y = (r0.y * r0.y) + r0.y;
	r0.y = r0.y * c0.w;
	r3.y = c0.y;
	r0.z = dot(c28.xyz, r3.yyy);
	r0.z = float(c2.y < r0.z);
	r0.y = r0.z * r0.y;
	r0.z = (r1.x * c1.z) + -r0.y;
	o5.w = (r0.x * r0.z) + r0.y;
	o1.x = dot(v7, c48);
	o1.y = dot(v7, c49);
	o2.x = dot(v7, c52);
	o2.y = dot(v7, c53);
	r5.w = c0.y;
	r0.x = dot(r5, c8);
	r0.y = dot(r5, c9);
	r0.z = dot(r5, c10);
	r0.w = dot(r5, c11);
	o0 = r0;
	o1.zw = c0.xy * v8.xx;
	o2.zw = c0.xy * v8.xy;
	o3.xyz = r2.xyz;
	o3.w = c0.x;
	o4.xyz = r5.xyz;
	o4.w = c0.x;
	o5.xyz = r1.yzw;
	o6 = c0.xxxx;
	o7.w = c0.x;
	o8 = r0;
	#undef c0
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c13
	#undef c27
	#undef c28
	#undef c29
	#undef c30
	#undef c31
	#undef c48
	#undef c49
	#undef c50
	#undef c52
	#undef c53
	#undef c58
	#undef c59
	#undef c60
	#undef i0
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
	return output;
}

