#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[203];
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
	float4 o9 [[user(texcoord8)]];
};

vertex source_main_Output source_main (
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c1 = float4(-1.280000000e+02, -6.400000000e+01, 1.587301679e-02, 1.000000000e+00); (void) c1;
	const float4 c3 = float4(-2.000000000e+00, 1.000000000e+00, 7.650058594e+02, 3.051757812e-05); (void) c3;
	const float4 c4 = float4(2.200000048e+00, 5.000000000e+00, 9.999999747e-05, 0.000000000e+00); (void) c4;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	float4 r7;
	int4 a0;
	const int ARRAYBASE_58 = 0;
	const int ARRAYBASE_27 = 159;
	const int ARRAYBASE_25 = 179;
	const int ARRAYBASE_23 = 181;
	const int ARRAYBASE_21 = 183;
	#define c0 uniforms.uniforms_float4[185]
	#define c2 uniforms.uniforms_float4[186]
	#define c8 uniforms.uniforms_float4[187]
	#define c9 uniforms.uniforms_float4[188]
	#define c10 uniforms.uniforms_float4[189]
	#define c11 uniforms.uniforms_float4[190]
	#define c12 uniforms.uniforms_float4[191]
	#define c13 uniforms.uniforms_float4[192]
	#define c16 uniforms.uniforms_float4[193]
	#define c21 uniforms.uniforms_float4[183]
	#define c23 uniforms.uniforms_float4[181]
	#define c25 uniforms.uniforms_float4[179]
	#define c27 uniforms.uniforms_float4[159]
	#define c28 uniforms.uniforms_float4[160]
	#define c29 uniforms.uniforms_float4[161]
	#define c30 uniforms.uniforms_float4[162]
	#define c31 uniforms.uniforms_float4[163]
	#define c48 uniforms.uniforms_float4[194]
	#define c49 uniforms.uniforms_float4[195]
	#define c50 uniforms.uniforms_float4[196]
	#define c52 uniforms.uniforms_float4[197]
	#define c53 uniforms.uniforms_float4[198]
	#define c54 uniforms.uniforms_float4[199]
	#define c55 uniforms.uniforms_float4[200]
	#define c56 uniforms.uniforms_float4[201]
	#define c57 uniforms.uniforms_float4[202]
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
	r0.x = abs(c50.x);
	r0.yz = c1.xx + v3.xy;
	r1.xy = float2(r0.yz < c0.xx);
	r0.yz = abs(r0.yz) + -r1.xy;
	r0.yz = r0.yz + c1.yy;
	r1.yz = float2(r0.yz < c0.xx);
	r0.yz = abs(r0.yz) + -r1.yz;
	r2.xy = r0.yz * c1.zz;
	r0.y = (r0.y * -c1.z) + c1.w;
	r2.z = (r0.z * -c1.z) + r0.y;
	r3.xyz = normalize(r2.xyz);
	r0.yz = (r1.yz * c3.xx) + c3.yy;
	r2.xy = r0.yz * r3.xy;
	r0.y = (r1.x * c3.x) + c3.y;
	r2.z = r0.y * r3.z;
	r1 = v0;
	r1.xyz = (v7.xyz * c13.xxx) + r1.xyz;
	r0.yzw = (v8.xyz * c13.xxx) + r2.xyz;
	r2.xyz = c3.zzz * v2.zyx;
	a0.xyz = int3(floor(abs(r2.xyz) + float3(0.5)) * sign(r2.xyz));
	r2.xy = c0.yy + v1.xy;
	r2.xy = r2.xy * c3.ww;
	r2.z = r2.y + r2.x;
	r2.z = -r2.z + c0.y;
	r3 = r2.yyyy * uniforms.uniforms_float4[ARRAYBASE_58 + a0.y];
	r4 = r2.yyyy * uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.y];
	r5 = r2.yyyy * uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.y];
	r3 = (uniforms.uniforms_float4[ARRAYBASE_58 + a0.x] * r2.xxxx) + r3;
	r4 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.x] * r2.xxxx) + r4;
	r5 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.x] * r2.xxxx) + r5;
	r3 = (uniforms.uniforms_float4[ARRAYBASE_58 + a0.z] * r2.zzzz) + r3;
	r4 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.z] * r2.zzzz) + r4;
	r2 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.z] * r2.zzzz) + r5;
	r5.x = dot(r1, r3);
	r5.y = dot(r1, r4);
	r5.z = dot(r1, r2);
	r1.x = dot(r0.yzw, r3.xyz);
	r1.y = dot(r0.yzw, r4.xyz);
	r1.z = dot(r0.yzw, r2.xyz);
	r2.xyz = normalize(r1.xyz);
	if (-r0.x < r0.x) {
		r0.xyz = v4.xyz + v4.xyz;
		r1.x = log2(r0.x);
		r1.y = log2(r0.y);
		r1.z = log2(r0.z);
		r0.xyz = r1.xyz * c4.xxx;
		r0.x = exp2(r0.x);
		r0.y = exp2(r0.y);
		r0.z = exp2(r0.z);
		r1.z = c0.y;
		r3.x = c0.y;
		r4.xyz = r0.xyz;
		r0.w = c0.x;
		for (int rep1 = 0; rep1 < i0.x; rep1++) {
			r1.x = r0.w * c4.y;
			a0.x = int(floor(abs(r1.x) + 0.5) * sign(r1.x));
			r6.xyz = -r5.xyz + uniforms.uniforms_float4[(ARRAYBASE_27 + 2) + a0.x].xyz;
			r1.x = dot(r6.xyz, r6.xyz);
			r1.y = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
			r7.xyz = r1.yyy * r6.xyz;
			r6.xyz = (r6.xyz * -r1.yyy) + -uniforms.uniforms_float4[(ARRAYBASE_27 + 1) + a0.x].xyz;
			r6.xyz = (uniforms.uniforms_float4[ARRAYBASE_27 + a0.x].www * r6.xyz) + r7.xyz;
			r1.w = dot(r2.xyz, r6.xyz);
			r1.w = max(r1.w, c0.x);
			r1.w = (r1.w * r1.w) + r1.w;
			r1.w = r1.w * c0.w;
			r6.xyz = r1.www * uniforms.uniforms_float4[ARRAYBASE_27 + a0.x].xyz;
			r3.yz = r1.yz * r1.xx;
			r1.x = dot(uniforms.uniforms_float4[(ARRAYBASE_27 + 4) + a0.x].xyz, r3.xyz);
			r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
			r1.y = dot(uniforms.uniforms_float4[(ARRAYBASE_27 + 1) + a0.x].xyz, -r7.xyz);
			r1.y = r1.y + -uniforms.uniforms_float4[(ARRAYBASE_27 + 3) + a0.x].z;
			r1.y = r1.y * uniforms.uniforms_float4[(ARRAYBASE_27 + 3) + a0.x].w;
			r1.y = max(r1.y, c4.z);
			r2.w = pow(abs(r1.y), uniforms.uniforms_float4[(ARRAYBASE_27 + 3) + a0.x].x);
			r1.y = min(r2.w, c0.y);
			r1.y = (r1.x * r1.y) + -r1.x;
			r1.x = (uniforms.uniforms_float4[(ARRAYBASE_27 + 1) + a0.x].w * r1.y) + r1.x;
			r1.y = -r1.x + c0.y;
			r1.x = (uniforms.uniforms_float4[ARRAYBASE_27 + a0.x].w * r1.y) + r1.x;
			r4.xyz = (r6.xyz * r1.xxx) + r4.xyz;
			r0.w = r0.w + c0.y;
		}
		r0.xyz = r2.xyz * r2.xyz;
		r1.xyz = float3(r2.xyz < c0.xxx);
		a0.xy = int2(floor(abs(r1.xy) + float2(0.5)) * sign(r1.xy));
		r1.xyw = r0.yyy * uniforms.uniforms_float4[ARRAYBASE_23 + a0.y].xyz;
		r0.xyw = (r0.xxx * uniforms.uniforms_float4[ARRAYBASE_21 + a0.x].xyz) + r1.xyw;
		a0.x = int(floor(abs(r1.z) + 0.5) * sign(r1.z));
		r0.xyz = (r0.zzz * uniforms.uniforms_float4[ARRAYBASE_25 + a0.x].xyz) + r0.xyw;
		r0.xyz = r0.xyz + r4.xyz;
	} else {
		r1.z = c0.y;
		r3.x = c0.y;
		r4.xyz = c0.xxx;
		r0.w = c0.x;
		for (int rep1 = 0; rep1 < i0.x; rep1++) {
			r1.x = r0.w * c4.y;
			a0.x = int(floor(abs(r1.x) + 0.5) * sign(r1.x));
			r6.xyz = -r5.xyz + uniforms.uniforms_float4[(ARRAYBASE_27 + 2) + a0.x].xyz;
			r1.x = dot(r6.xyz, r6.xyz);
			r1.y = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
			r7.xyz = r1.yyy * r6.xyz;
			r6.xyz = (r6.xyz * -r1.yyy) + -uniforms.uniforms_float4[(ARRAYBASE_27 + 1) + a0.x].xyz;
			r6.xyz = (uniforms.uniforms_float4[ARRAYBASE_27 + a0.x].www * r6.xyz) + r7.xyz;
			r1.w = dot(r2.xyz, r6.xyz);
			r1.w = max(r1.w, c0.x);
			r1.w = (r1.w * r1.w) + r1.w;
			r1.w = r1.w * c0.w;
			r6.xyz = r1.www * uniforms.uniforms_float4[ARRAYBASE_27 + a0.x].xyz;
			r3.yz = r1.yz * r1.xx;
			r1.x = dot(uniforms.uniforms_float4[(ARRAYBASE_27 + 4) + a0.x].xyz, r3.xyz);
			r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
			r1.y = dot(uniforms.uniforms_float4[(ARRAYBASE_27 + 1) + a0.x].xyz, -r7.xyz);
			r1.y = r1.y + -uniforms.uniforms_float4[(ARRAYBASE_27 + 3) + a0.x].z;
			r1.y = r1.y * uniforms.uniforms_float4[(ARRAYBASE_27 + 3) + a0.x].w;
			r1.y = max(r1.y, c4.z);
			r2.w = pow(abs(r1.y), uniforms.uniforms_float4[(ARRAYBASE_27 + 3) + a0.x].x);
			r1.y = min(r2.w, c0.y);
			r1.y = (r1.x * r1.y) + -r1.x;
			r1.x = (uniforms.uniforms_float4[(ARRAYBASE_27 + 1) + a0.x].w * r1.y) + r1.x;
			r1.y = -r1.x + c0.y;
			r1.x = (uniforms.uniforms_float4[ARRAYBASE_27 + a0.x].w * r1.y) + r1.x;
			r1.xyw = r1.xxx * r6.xyz;
			r2.w = float(-r0.w < r0.w);
			r4.xyz = (r1.xyw * r2.www) + r4.xyz;
			r0.w = r0.w + c0.y;
		}
		r1.xyz = r2.xyz * r2.xyz;
		r3.xyz = float3(r2.xyz < c0.xxx);
		a0.xy = int2(floor(abs(r3.xy) + float2(0.5)) * sign(r3.xy));
		r3.xyw = r1.yyy * uniforms.uniforms_float4[ARRAYBASE_23 + a0.y].xyz;
		r1.xyw = (r1.xxx * uniforms.uniforms_float4[ARRAYBASE_21 + a0.x].xyz) + r3.xyw;
		a0.x = int(floor(abs(r3.z) + 0.5) * sign(r3.z));
		r1.xyz = (r1.zzz * uniforms.uniforms_float4[ARRAYBASE_25 + a0.x].xyz) + r1.xyw;
		r0.xyz = r1.xyz + r4.xyz;
	}
	o1.x = dot(v5, c48);
	o1.y = dot(v5, c49);
	o2.x = dot(v5, c52);
	o2.y = dot(v5, c53);
	o7.xyz = r0.xyz * c12.xxx;
	r5.w = c0.y;
	r0.x = dot(r5, c8);
	r0.y = dot(r5, c9);
	r0.z = dot(r5, c10);
	r0.w = dot(r5, c11);
	o9.x = dot(r5, c54);
	o9.y = dot(r5, c55);
	o9.z = dot(r5, c56);
	o9.w = dot(r5, c57);
	r1.xyz = -r5.xyz + c2.xyz;
	r1.x = dot(r1.xyz, r1.xyz);
	r1.x = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.x = clamp((r1.x * c16.w) + c16.x, 0.0, 1.0);
	o3.w = min(r1.x, c16.z);
	o0 = r0;
	o1.zw = c0.xy * v6.xx;
	o2.zw = c0.xy * v6.xy;
	o3.xyz = r2.xyz;
	o4.xyz = r5.xyz;
	o4.w = c0.x;
	o5 = c0.xxxx;
	o6 = c0.xxxx;
	o7.w = c0.x;
	o8 = r0;
	#undef c0
	#undef c2
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c12
	#undef c13
	#undef c16
	#undef c21
	#undef c23
	#undef c25
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
	#undef c54
	#undef c55
	#undef c56
	#undef c57
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
	#undef o9
	return output;
}

