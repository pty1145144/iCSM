#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[196];
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
	const float4 c1 = float4(-1.280000000e+02, -6.400000000e+01, 1.587301679e-02, 1.000000000e+00); (void) c1;
	const float4 c2 = float4(-2.000000000e+00, 1.000000000e+00, 7.650058594e+02, 3.051757812e-05); (void) c2;
	const float4 c3 = float4(2.200000048e+00, 5.000000000e+00, 9.999999747e-05, 9.999999975e-07); (void) c3;
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
	const int ARRAYBASE_25 = 179;
	const int ARRAYBASE_23 = 181;
	const int ARRAYBASE_21 = 183;
	#define c0 uniforms.uniforms_float4[185]
	#define c8 uniforms.uniforms_float4[186]
	#define c9 uniforms.uniforms_float4[187]
	#define c10 uniforms.uniforms_float4[188]
	#define c11 uniforms.uniforms_float4[189]
	#define c13 uniforms.uniforms_float4[190]
	#define c21 uniforms.uniforms_float4[183]
	#define c23 uniforms.uniforms_float4[181]
	#define c25 uniforms.uniforms_float4[179]
	#define c27 uniforms.uniforms_float4[159]
	#define c28 uniforms.uniforms_float4[160]
	#define c29 uniforms.uniforms_float4[161]
	#define c30 uniforms.uniforms_float4[162]
	#define c31 uniforms.uniforms_float4[163]
	#define c48 uniforms.uniforms_float4[191]
	#define c49 uniforms.uniforms_float4[192]
	#define c50 uniforms.uniforms_float4[193]
	#define c52 uniforms.uniforms_float4[194]
	#define c53 uniforms.uniforms_float4[195]
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
	r0.x = abs(c50.x);
	r0.y = float(-r0.x < r0.x);
	r0.zw = c1.xx + v3.xy;
	r1.xy = float2(r0.zw < c0.xx);
	r0.zw = abs(r0.zw) + -r1.xy;
	r0.zw = r0.zw + c1.yy;
	r1.yz = float2(r0.zw < c0.xx);
	r0.zw = abs(r0.zw) + -r1.yz;
	r2.xy = r0.zw * c1.zz;
	r0.z = (r0.z * -c1.z) + c1.w;
	r2.z = (r0.w * -c1.z) + r0.z;
	r3.xyz = normalize(r2.xyz);
	r0.zw = (r1.yz * c2.xx) + c2.yy;
	r2.xy = r0.zw * r3.xy;
	r0.z = (r1.x * c2.x) + c2.y;
	r2.z = r0.z * r3.z;
	r1 = v0;
	r1.xyz = (v7.xyz * c13.xxx) + r1.xyz;
	r2.xyz = (v8.xyz * c13.xxx) + r2.xyz;
	r3.xyz = c2.zzz * v2.zyx;
	a0.xyz = int3(floor(abs(r3.xyz) + float3(0.5)) * sign(r3.xyz));
	r0.zw = c0.yy + v1.xy;
	r0.zw = r0.zw * c2.ww;
	r2.w = r0.w + r0.z;
	r2.w = -r2.w + c0.y;
	r3 = r0.wwww * uniforms.uniforms_float4[ARRAYBASE_58 + a0.y];
	r4 = r0.wwww * uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.y];
	r5 = r0.wwww * uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.y];
	r3 = (uniforms.uniforms_float4[ARRAYBASE_58 + a0.x] * r0.zzzz) + r3;
	r4 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.x] * r0.zzzz) + r4;
	r5 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.x] * r0.zzzz) + r5;
	r3 = (uniforms.uniforms_float4[ARRAYBASE_58 + a0.z] * r2.wwww) + r3;
	r4 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 1) + a0.z] * r2.wwww) + r4;
	r5 = (uniforms.uniforms_float4[(ARRAYBASE_58 + 2) + a0.z] * r2.wwww) + r5;
	r6.x = dot(r1, r3);
	r6.y = dot(r1, r4);
	r6.z = dot(r1, r5);
	r1.x = dot(r2.xyz, r3.xyz);
	r1.y = dot(r2.xyz, r4.xyz);
	r1.z = dot(r2.xyz, r5.xyz);
	r2.xyz = normalize(r1.xyz);
	if (-r0.x < r0.x) {
		r0.xzw = v4.xyz + v4.xyz;
		r1.x = log2(r0.x);
		r1.y = log2(r0.z);
		r1.z = log2(r0.w);
		r0.xzw = r1.xyz * c3.xxx;
		r0.x = exp2(r0.x);
		r0.z = exp2(r0.z);
		r0.w = exp2(r0.w);
		r1.z = c0.y;
		r3.x = c0.y;
		r4.xyz = r0.xzw;
		r1.x = c0.x;
		for (int rep1 = 0; rep1 < i0.x; rep1++) {
			r1.w = r1.x * c3.y;
			a0.x = int(floor(abs(r1.w) + 0.5) * sign(r1.w));
			r5.xyz = -r6.xyz + uniforms.uniforms_float4[(ARRAYBASE_27 + 2) + a0.x].xyz;
			r1.w = dot(r5.xyz, r5.xyz);
			r1.y = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
			r7.xyz = r1.yyy * r5.xyz;
			r5.xyz = (r5.xyz * -r1.yyy) + -uniforms.uniforms_float4[(ARRAYBASE_27 + 1) + a0.x].xyz;
			r5.xyz = (uniforms.uniforms_float4[ARRAYBASE_27 + a0.x].www * r5.xyz) + r7.xyz;
			r2.w = dot(r2.xyz, r5.xyz);
			r2.w = max(r2.w, c0.x);
			r2.w = (r2.w * r2.w) + r2.w;
			r2.w = r2.w * c0.w;
			r5.xyz = r2.www * uniforms.uniforms_float4[ARRAYBASE_27 + a0.x].xyz;
			r3.yz = r1.yz * r1.ww;
			r1.y = dot(uniforms.uniforms_float4[(ARRAYBASE_27 + 4) + a0.x].xyz, r3.xyz);
			r1.y = ((r1.y == 0.0) ? FLT_MAX : 1.0 / r1.y);
			r1.w = dot(uniforms.uniforms_float4[(ARRAYBASE_27 + 1) + a0.x].xyz, -r7.xyz);
			r1.w = r1.w + -uniforms.uniforms_float4[(ARRAYBASE_27 + 3) + a0.x].z;
			r1.w = r1.w * uniforms.uniforms_float4[(ARRAYBASE_27 + 3) + a0.x].w;
			r1.w = max(r1.w, c3.z);
			r2.w = pow(abs(r1.w), uniforms.uniforms_float4[(ARRAYBASE_27 + 3) + a0.x].x);
			r1.w = min(r2.w, c0.y);
			r1.w = (r1.y * r1.w) + -r1.y;
			r1.y = (uniforms.uniforms_float4[(ARRAYBASE_27 + 1) + a0.x].w * r1.w) + r1.y;
			r1.w = -r1.y + c0.y;
			r1.y = (uniforms.uniforms_float4[ARRAYBASE_27 + a0.x].w * r1.w) + r1.y;
			r4.xyz = (r5.xyz * r1.yyy) + r4.xyz;
			r1.x = r1.x + c0.y;
		}
		r0.xzw = r2.xyz * r2.xyz;
		r1.xyz = float3(r2.xyz < c0.xxx);
		a0.xy = int2(floor(abs(r1.xy) + float2(0.5)) * sign(r1.xy));
		r1.xyw = r0.zzz * uniforms.uniforms_float4[ARRAYBASE_23 + a0.y].xyz;
		r1.xyw = (r0.xxx * uniforms.uniforms_float4[ARRAYBASE_21 + a0.x].xyz) + r1.xyw;
		a0.x = int(floor(abs(r1.z) + 0.5) * sign(r1.z));
		r0.xzw = (r0.www * uniforms.uniforms_float4[ARRAYBASE_25 + a0.x].xyz) + r1.xyw;
		r0.xzw = r0.xzw + r4.xyz;
		o5.xyz = c0.xxx;
	} else {
		r1.z = c0.y;
		r3.x = c0.y;
		r4.xyz = c0.xxx;
		r5.xyz = c0.xxx;
		r1.x = c0.x;
		for (int rep1 = 0; rep1 < i0.x; rep1++) {
			r1.w = r1.x * c3.y;
			a0.x = int(floor(abs(r1.w) + 0.5) * sign(r1.w));
			r7.xyz = -r6.xyz + uniforms.uniforms_float4[(ARRAYBASE_27 + 2) + a0.x].xyz;
			r1.w = dot(r7.xyz, r7.xyz);
			r1.y = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
			r8.xyz = r1.yyy * r7.xyz;
			r7.xyz = (r7.xyz * -r1.yyy) + -uniforms.uniforms_float4[(ARRAYBASE_27 + 1) + a0.x].xyz;
			r7.xyz = (uniforms.uniforms_float4[ARRAYBASE_27 + a0.x].www * r7.xyz) + r8.xyz;
			r2.w = dot(r2.xyz, r7.xyz);
			r2.w = max(r2.w, c0.x);
			r2.w = (r2.w * r2.w) + r2.w;
			r2.w = r2.w * c0.w;
			r7.xyz = r2.www * uniforms.uniforms_float4[ARRAYBASE_27 + a0.x].xyz;
			r3.yz = r1.yz * r1.ww;
			r1.y = dot(uniforms.uniforms_float4[(ARRAYBASE_27 + 4) + a0.x].xyz, r3.xyz);
			r1.y = ((r1.y == 0.0) ? FLT_MAX : 1.0 / r1.y);
			r1.w = dot(uniforms.uniforms_float4[(ARRAYBASE_27 + 1) + a0.x].xyz, -r8.xyz);
			r1.w = r1.w + -uniforms.uniforms_float4[(ARRAYBASE_27 + 3) + a0.x].z;
			r1.w = r1.w * uniforms.uniforms_float4[(ARRAYBASE_27 + 3) + a0.x].w;
			r1.w = max(r1.w, c3.z);
			r2.w = pow(abs(r1.w), uniforms.uniforms_float4[(ARRAYBASE_27 + 3) + a0.x].x);
			r1.w = min(r2.w, c0.y);
			r1.w = (r1.y * r1.w) + -r1.y;
			r1.y = (uniforms.uniforms_float4[(ARRAYBASE_27 + 1) + a0.x].w * r1.w) + r1.y;
			r1.w = -r1.y + c0.y;
			r1.y = (uniforms.uniforms_float4[ARRAYBASE_27 + a0.x].w * r1.w) + r1.y;
			r3.yzw = r1.yyy * r7.xyz;
			r1.y = float(-r1.x >= r1.x);
			r4.xyz = (r1.yyy * r3.yzw) + r4.xyz;
			r1.y = float(-r1.x < r1.x);
			r5.xyz = (r3.yzw * r1.yyy) + r5.xyz;
			r1.x = r1.x + c0.y;
		}
		o5.xyz = r4.xyz;
		r1.xyz = r2.xyz * r2.xyz;
		r3.xyz = float3(r2.xyz < c0.xxx);
		a0.xy = int2(floor(abs(r3.xy) + float2(0.5)) * sign(r3.xy));
		r3.xyw = r1.yyy * uniforms.uniforms_float4[ARRAYBASE_23 + a0.y].xyz;
		r1.xyw = (r1.xxx * uniforms.uniforms_float4[ARRAYBASE_21 + a0.x].xyz) + r3.xyw;
		a0.x = int(floor(abs(r3.z) + 0.5) * sign(r3.z));
		r1.xyz = (r1.zzz * uniforms.uniforms_float4[ARRAYBASE_25 + a0.x].xyz) + r1.xyw;
		r0.xzw = r1.xyz + r5.xyz;
	}
	r1.xyz = -r6.xyz + c29.xyz;
	r1.w = dot(r1.xyz, r1.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r3.xyz = r1.www * r1.xyz;
	r1.xyz = (r1.xyz * -r1.www) + -c28.xyz;
	r1.xyz = (c27.www * r1.xyz) + r3.xyz;
	r1.x = dot(r2.xyz, r1.xyz);
	r1.x = max(r1.x, c0.x);
	r1.x = (r1.x * r1.x) + r1.x;
	r1.x = r1.x * c0.w;
	r1.y = c0.y;
	r1.y = dot(c28.xyz, r1.yyy);
	r1.y = float(c3.w < r1.y);
	r1.z = r1.y * r1.x;
	r1.x = (r1.x * -r1.y) + v4.w;
	o5.w = (r0.y * r1.x) + r1.z;
	o1.x = dot(v5, c48);
	o1.y = dot(v5, c49);
	o2.x = dot(v5, c52);
	o2.y = dot(v5, c53);
	r6.w = c0.y;
	r1.x = dot(r6, c8);
	r1.y = dot(r6, c9);
	r1.z = dot(r6, c10);
	r1.w = dot(r6, c11);
	o0 = r1;
	o1.zw = c0.xy * v6.xx;
	o2.zw = c0.xy * v6.xy;
	o3.xyz = r2.xyz;
	o3.w = c0.x;
	o4.xyz = r6.xyz;
	o4.w = c0.x;
	o6 = c0.xxxx;
	o7.xyz = r0.xzw;
	o7.w = c0.x;
	o8 = r1;
	#undef c0
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c13
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

