#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[36];
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
	const float4 c1 = float4(2.200000048e+00, 3.333333433e-01, 5.000000000e+00, 9.999999747e-05); (void) c1;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	float4 r7;
	int4 a0;
	const int ARRAYBASE_27 = 0;
	#define c0 uniforms.uniforms_float4[20]
	#define c2 uniforms.uniforms_float4[21]
	#define c8 uniforms.uniforms_float4[22]
	#define c9 uniforms.uniforms_float4[23]
	#define c10 uniforms.uniforms_float4[24]
	#define c11 uniforms.uniforms_float4[25]
	#define c13 uniforms.uniforms_float4[26]
	#define c16 uniforms.uniforms_float4[27]
	#define c27 uniforms.uniforms_float4[0]
	#define c28 uniforms.uniforms_float4[1]
	#define c29 uniforms.uniforms_float4[2]
	#define c30 uniforms.uniforms_float4[3]
	#define c31 uniforms.uniforms_float4[4]
	#define c48 uniforms.uniforms_float4[28]
	#define c49 uniforms.uniforms_float4[29]
	#define c50 uniforms.uniforms_float4[30]
	#define c52 uniforms.uniforms_float4[31]
	#define c53 uniforms.uniforms_float4[32]
	#define c58 uniforms.uniforms_float4[33]
	#define c59 uniforms.uniforms_float4[34]
	#define c60 uniforms.uniforms_float4[35]
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
	#define o0 output.o0
	#define o1 output.o1
	#define o2 output.o2
	#define o3 output.o3
	#define o4 output.o4
	#define o5 output.o5
	#define o6 output.o6
	#define o7 output.o7
	#define o8 output.o8
	r0 = v0;
	r0.xyz = (v7.xyz * c13.xxx) + r0.xyz;
	r1.xyz = v8.xyz;
	r1.xyz = (r1.xyz * c13.xxx) + v1.xyz;
	r2.x = dot(r0, c58);
	r2.y = dot(r0, c59);
	r2.z = dot(r0, c60);
	r0.x = dot(r1.xyz, c58.xyz);
	r0.y = dot(r1.xyz, c59.xyz);
	r0.z = dot(r1.xyz, c60.xyz);
	r1.xyz = normalize(r0.xyz);
	r0.xyz = v2.xyz + v2.xyz;
	r3.x = log2(r0.x);
	r3.y = log2(r0.y);
	r3.z = log2(r0.z);
	r0.xyz = r3.xyz * c1.xxx;
	r3.x = exp2(r0.x);
	r3.y = exp2(r0.y);
	r3.z = exp2(r0.z);
	r0.xyz = v3.xyz + v3.xyz;
	r4.x = log2(r0.x);
	r4.y = log2(r0.y);
	r4.z = log2(r0.z);
	r0.xyz = r4.xyz * c1.xxx;
	r4.x = exp2(r0.x);
	r4.y = exp2(r0.y);
	r4.z = exp2(r0.z);
	r0.xyz = r3.xyz + r4.xyz;
	r3.xyz = v4.xyz + v4.xyz;
	r4.x = log2(r3.x);
	r4.y = log2(r3.y);
	r4.z = log2(r3.z);
	r3.xyz = r4.xyz * c1.xxx;
	r4.x = exp2(r3.x);
	r4.y = exp2(r3.y);
	r4.z = exp2(r3.z);
	r0.xyz = r0.xyz + r4.xyz;
	r0.w = v2.w;
	r0.w = r0.w + v3.w;
	r0.w = r0.w + v4.w;
	r0.w = r0.w * c1.y;
	r3.z = c0.y;
	r4.x = c0.y;
	r5.xyz = c0.xxx;
	r1.w = c0.x;
	for (int rep1 = 0; rep1 < i0.x; rep1++) {
		r3.x = r1.w * c1.z;
		a0.x = int(floor(abs(r3.x) + 0.5) * sign(r3.x));
		r6.xyz = -r2.xyz + uniforms.uniforms_float4[(ARRAYBASE_27 + 2) + a0.x].xyz;
		r3.x = dot(r6.xyz, r6.xyz);
		r3.y = ((r3.x == 0.0) ? FLT_MAX : rsqrt(abs(r3.x)));
		r7.xyz = r3.yyy * r6.xyz;
		r6.xyz = (r6.xyz * -r3.yyy) + -uniforms.uniforms_float4[(ARRAYBASE_27 + 1) + a0.x].xyz;
		r6.xyz = (uniforms.uniforms_float4[ARRAYBASE_27 + a0.x].www * r6.xyz) + r7.xyz;
		r3.w = dot(r1.xyz, r6.xyz);
		r3.w = max(r3.w, c0.x);
		r3.w = (r3.w * r3.w) + r3.w;
		r3.w = r3.w * c0.w;
		r6.xyz = r3.www * uniforms.uniforms_float4[ARRAYBASE_27 + a0.x].xyz;
		r4.yz = r3.yz * r3.xx;
		r3.x = dot(uniforms.uniforms_float4[(ARRAYBASE_27 + 4) + a0.x].xyz, r4.xyz);
		r3.x = ((r3.x == 0.0) ? FLT_MAX : 1.0 / r3.x);
		r3.y = dot(uniforms.uniforms_float4[(ARRAYBASE_27 + 1) + a0.x].xyz, -r7.xyz);
		r3.y = r3.y + -uniforms.uniforms_float4[(ARRAYBASE_27 + 3) + a0.x].z;
		r3.y = r3.y * uniforms.uniforms_float4[(ARRAYBASE_27 + 3) + a0.x].w;
		r3.y = max(r3.y, c1.w);
		r4.y = pow(abs(r3.y), uniforms.uniforms_float4[(ARRAYBASE_27 + 3) + a0.x].x);
		r3.y = min(r4.y, c0.y);
		r3.y = (r3.x * r3.y) + -r3.x;
		r3.x = (uniforms.uniforms_float4[(ARRAYBASE_27 + 1) + a0.x].w * r3.y) + r3.x;
		r3.y = -r3.x + c0.y;
		r3.x = (uniforms.uniforms_float4[ARRAYBASE_27 + a0.x].w * r3.y) + r3.x;
		r5.xyz = (r6.xyz * r3.xxx) + r5.xyz;
		r1.w = r1.w + c0.y;
	}
	r3.xyz = r0.www * c50.yzw;
	r0.xyz = (r0.xyz * c1.yyy) + -r3.xyz;
	o7.xyz = r5.xyz + r0.xyz;
	r0.xyz = -r2.xyz + c29.xyz;
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r4.xyz = r0.www * r0.xyz;
	r0.xyz = (r0.xyz * -r0.www) + -c28.xyz;
	r0.xyz = (c27.www * r0.xyz) + r4.xyz;
	r0.x = dot(r1.xyz, r0.xyz);
	r0.x = max(r0.x, c0.x);
	r0.x = (r0.x * r0.x) + r0.x;
	r0.x = r0.x * v2.w;
	o5.w = r0.x * c0.w;
	o5.xyz = r3.xyz * v2.www;
	o1.x = dot(v5, c48);
	o1.y = dot(v5, c49);
	o2.x = dot(v5, c52);
	o2.y = dot(v5, c53);
	r2.w = c0.y;
	r0.x = dot(r2, c8);
	r0.y = dot(r2, c9);
	r0.z = dot(r2, c10);
	r0.w = dot(r2, c11);
	r3.xyz = -r2.xyz + c2.xyz;
	r1.w = dot(r3.xyz, r3.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = clamp((r1.w * c16.w) + c16.x, 0.0, 1.0);
	o3.w = min(r1.w, c16.z);
	o0 = r0;
	o1.zw = c0.xy * v6.xx;
	o2.zw = c0.xy * v6.xy;
	o3.xyz = r1.xyz;
	o4.xyz = r2.xyz;
	o4.w = c0.x;
	o6 = c0.xxxx;
	o7.w = c0.x;
	o8 = r0;
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

