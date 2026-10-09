#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[40];
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
	const float4 c2 = float4(-2.000000000e+00, 1.000000000e+00, 2.200000048e+00, 5.000000000e+00); (void) c2;
	const float4 c3 = float4(9.999999747e-05, 0.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c3;
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
	const int ARRAYBASE_25 = 20;
	const int ARRAYBASE_23 = 22;
	const int ARRAYBASE_21 = 24;
	#define c0 uniforms.uniforms_float4[26]
	#define c8 uniforms.uniforms_float4[27]
	#define c9 uniforms.uniforms_float4[28]
	#define c10 uniforms.uniforms_float4[29]
	#define c11 uniforms.uniforms_float4[30]
	#define c13 uniforms.uniforms_float4[31]
	#define c21 uniforms.uniforms_float4[24]
	#define c23 uniforms.uniforms_float4[22]
	#define c25 uniforms.uniforms_float4[20]
	#define c27 uniforms.uniforms_float4[0]
	#define c28 uniforms.uniforms_float4[1]
	#define c29 uniforms.uniforms_float4[2]
	#define c30 uniforms.uniforms_float4[3]
	#define c31 uniforms.uniforms_float4[4]
	#define c48 uniforms.uniforms_float4[32]
	#define c49 uniforms.uniforms_float4[33]
	#define c50 uniforms.uniforms_float4[34]
	#define c52 uniforms.uniforms_float4[35]
	#define c53 uniforms.uniforms_float4[36]
	#define c58 uniforms.uniforms_float4[37]
	#define c59 uniforms.uniforms_float4[38]
	#define c60 uniforms.uniforms_float4[39]
	#define i0 uniforms.uniforms_int4[0]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
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
	r0.yz = c1.xx + v1.xy;
	r1.xy = float2(r0.yz < c0.xx);
	r0.yz = abs(r0.yz) + -r1.xy;
	r0.yz = r0.yz + c1.yy;
	r1.yz = float2(r0.yz < c0.xx);
	r0.yz = abs(r0.yz) + -r1.yz;
	r2.xy = r0.yz * c1.zz;
	r0.y = (r0.y * -c1.z) + c1.w;
	r2.z = (r0.z * -c1.z) + r0.y;
	r3.xyz = normalize(r2.xyz);
	r0.yz = (r1.yz * c2.xx) + c2.yy;
	r2.xy = r0.yz * r3.xy;
	r0.y = (r1.x * c2.x) + c2.y;
	r2.z = r0.y * r3.z;
	r1 = v0;
	r1.xyz = (v5.xyz * c13.xxx) + r1.xyz;
	r0.yzw = (v6.xyz * c13.xxx) + r2.xyz;
	r2.x = dot(r1, c58);
	r2.y = dot(r1, c59);
	r2.z = dot(r1, c60);
	r1.x = dot(r0.yzw, c58.xyz);
	r1.y = dot(r0.yzw, c59.xyz);
	r1.z = dot(r0.yzw, c60.xyz);
	r3.xyz = normalize(r1.xyz);
	if (-r0.x < r0.x) {
		r0.xyz = v2.xyz + v2.xyz;
		r1.x = log2(r0.x);
		r1.y = log2(r0.y);
		r1.z = log2(r0.z);
		r0.xyz = r1.xyz * c2.zzz;
		r0.x = exp2(r0.x);
		r0.y = exp2(r0.y);
		r0.z = exp2(r0.z);
		r1.z = c0.y;
		r4.x = c0.y;
		r5.xyz = r0.xyz;
		r0.w = c0.x;
		for (int rep1 = 0; rep1 < i0.x; rep1++) {
			r1.x = r0.w * c2.w;
			a0.x = int(floor(abs(r1.x) + 0.5) * sign(r1.x));
			r6.xyz = -r2.xyz + uniforms.uniforms_float4[(ARRAYBASE_27 + 2) + a0.x].xyz;
			r1.x = dot(r6.xyz, r6.xyz);
			r1.y = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
			r7.xyz = r1.yyy * r6.xyz;
			r6.xyz = (r6.xyz * -r1.yyy) + -uniforms.uniforms_float4[(ARRAYBASE_27 + 1) + a0.x].xyz;
			r6.xyz = (uniforms.uniforms_float4[ARRAYBASE_27 + a0.x].www * r6.xyz) + r7.xyz;
			r1.w = dot(r3.xyz, r6.xyz);
			r1.w = max(r1.w, c0.x);
			r1.w = (r1.w * r1.w) + r1.w;
			r1.w = r1.w * c0.w;
			r6.xyz = r1.www * uniforms.uniforms_float4[ARRAYBASE_27 + a0.x].xyz;
			r4.yz = r1.yz * r1.xx;
			r1.x = dot(uniforms.uniforms_float4[(ARRAYBASE_27 + 4) + a0.x].xyz, r4.xyz);
			r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
			r1.y = dot(uniforms.uniforms_float4[(ARRAYBASE_27 + 1) + a0.x].xyz, -r7.xyz);
			r1.y = r1.y + -uniforms.uniforms_float4[(ARRAYBASE_27 + 3) + a0.x].z;
			r1.y = r1.y * uniforms.uniforms_float4[(ARRAYBASE_27 + 3) + a0.x].w;
			r1.y = max(r1.y, c3.x);
			r3.w = pow(abs(r1.y), uniforms.uniforms_float4[(ARRAYBASE_27 + 3) + a0.x].x);
			r1.y = min(r3.w, c0.y);
			r1.y = (r1.x * r1.y) + -r1.x;
			r1.x = (uniforms.uniforms_float4[(ARRAYBASE_27 + 1) + a0.x].w * r1.y) + r1.x;
			r1.y = -r1.x + c0.y;
			r1.x = (uniforms.uniforms_float4[ARRAYBASE_27 + a0.x].w * r1.y) + r1.x;
			r5.xyz = (r6.xyz * r1.xxx) + r5.xyz;
			r0.w = r0.w + c0.y;
		}
		r0.xyz = r3.xyz * r3.xyz;
		r1.xyz = float3(r3.xyz < c0.xxx);
		a0.xy = int2(floor(abs(r1.xy) + float2(0.5)) * sign(r1.xy));
		r1.xyw = r0.yyy * uniforms.uniforms_float4[ARRAYBASE_23 + a0.y].xyz;
		r0.xyw = (r0.xxx * uniforms.uniforms_float4[ARRAYBASE_21 + a0.x].xyz) + r1.xyw;
		a0.x = int(floor(abs(r1.z) + 0.5) * sign(r1.z));
		r0.xyz = (r0.zzz * uniforms.uniforms_float4[ARRAYBASE_25 + a0.x].xyz) + r0.xyw;
		r0.xyz = r0.xyz + r5.xyz;
	} else {
		r1.z = c0.y;
		r4.x = c0.y;
		r5.xyz = c0.xxx;
		r0.w = c0.x;
		for (int rep1 = 0; rep1 < i0.x; rep1++) {
			r1.x = r0.w * c2.w;
			a0.x = int(floor(abs(r1.x) + 0.5) * sign(r1.x));
			r6.xyz = -r2.xyz + uniforms.uniforms_float4[(ARRAYBASE_27 + 2) + a0.x].xyz;
			r1.x = dot(r6.xyz, r6.xyz);
			r1.y = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
			r7.xyz = r1.yyy * r6.xyz;
			r6.xyz = (r6.xyz * -r1.yyy) + -uniforms.uniforms_float4[(ARRAYBASE_27 + 1) + a0.x].xyz;
			r6.xyz = (uniforms.uniforms_float4[ARRAYBASE_27 + a0.x].www * r6.xyz) + r7.xyz;
			r1.w = dot(r3.xyz, r6.xyz);
			r1.w = max(r1.w, c0.x);
			r1.w = (r1.w * r1.w) + r1.w;
			r1.w = r1.w * c0.w;
			r6.xyz = r1.www * uniforms.uniforms_float4[ARRAYBASE_27 + a0.x].xyz;
			r4.yz = r1.yz * r1.xx;
			r1.x = dot(uniforms.uniforms_float4[(ARRAYBASE_27 + 4) + a0.x].xyz, r4.xyz);
			r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
			r1.y = dot(uniforms.uniforms_float4[(ARRAYBASE_27 + 1) + a0.x].xyz, -r7.xyz);
			r1.y = r1.y + -uniforms.uniforms_float4[(ARRAYBASE_27 + 3) + a0.x].z;
			r1.y = r1.y * uniforms.uniforms_float4[(ARRAYBASE_27 + 3) + a0.x].w;
			r1.y = max(r1.y, c3.x);
			r3.w = pow(abs(r1.y), uniforms.uniforms_float4[(ARRAYBASE_27 + 3) + a0.x].x);
			r1.y = min(r3.w, c0.y);
			r1.y = (r1.x * r1.y) + -r1.x;
			r1.x = (uniforms.uniforms_float4[(ARRAYBASE_27 + 1) + a0.x].w * r1.y) + r1.x;
			r1.y = -r1.x + c0.y;
			r1.x = (uniforms.uniforms_float4[ARRAYBASE_27 + a0.x].w * r1.y) + r1.x;
			r1.xyw = r1.xxx * r6.xyz;
			r3.w = float(-r0.w < r0.w);
			r5.xyz = (r1.xyw * r3.www) + r5.xyz;
			r0.w = r0.w + c0.y;
		}
		r1.xyz = r3.xyz * r3.xyz;
		r4.xyz = float3(r3.xyz < c0.xxx);
		a0.xy = int2(floor(abs(r4.xy) + float2(0.5)) * sign(r4.xy));
		r4.xyw = r1.yyy * uniforms.uniforms_float4[ARRAYBASE_23 + a0.y].xyz;
		r1.xyw = (r1.xxx * uniforms.uniforms_float4[ARRAYBASE_21 + a0.x].xyz) + r4.xyw;
		a0.x = int(floor(abs(r4.z) + 0.5) * sign(r4.z));
		r1.xyz = (r1.zzz * uniforms.uniforms_float4[ARRAYBASE_25 + a0.x].xyz) + r1.xyw;
		r0.xyz = r1.xyz + r5.xyz;
	}
	r1.xyz = -r2.xyz + c29.xyz;
	r0.w = dot(r1.xyz, r1.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r4.xyz = r0.www * r1.xyz;
	r1.xyz = (r1.xyz * -r0.www) + -c28.xyz;
	r1.xyz = (c27.www * r1.xyz) + r4.xyz;
	r0.w = dot(r3.xyz, r1.xyz);
	r0.w = max(r0.w, c0.x);
	r0.w = (r0.w * r0.w) + r0.w;
	r0.w = r0.w * v2.w;
	o5.w = r0.w * c0.w;
	o1.x = dot(v3, c48);
	o1.y = dot(v3, c49);
	o2.x = dot(v3, c52);
	o2.y = dot(v3, c53);
	r2.w = c0.y;
	r1.x = dot(r2, c8);
	r1.y = dot(r2, c9);
	r1.z = dot(r2, c10);
	r1.w = dot(r2, c11);
	o0 = r1;
	o1.zw = c0.xy * v4.xx;
	o2.zw = c0.xy * v4.xy;
	o3.xyz = r3.xyz;
	o3.w = c0.x;
	o4.xyz = r2.xyz;
	o4.w = c0.x;
	o5.xyz = c0.xxx;
	o6 = c0.xxxx;
	o7.xyz = r0.xyz;
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

