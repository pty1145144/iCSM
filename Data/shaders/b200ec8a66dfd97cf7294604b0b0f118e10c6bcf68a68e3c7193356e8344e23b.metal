#include <metal_stdlib>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[19];
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
	const float4 c1 = float4(2.200000048e+00, 3.333333433e-01, 0.000000000e+00, 0.000000000e+00); (void) c1;
	float4 r0;
	float4 r1;
	float4 r2;
	#define c0 uniforms.uniforms_float4[0]
	#define c8 uniforms.uniforms_float4[1]
	#define c9 uniforms.uniforms_float4[2]
	#define c10 uniforms.uniforms_float4[3]
	#define c11 uniforms.uniforms_float4[4]
	#define c12 uniforms.uniforms_float4[5]
	#define c13 uniforms.uniforms_float4[6]
	#define c48 uniforms.uniforms_float4[7]
	#define c49 uniforms.uniforms_float4[8]
	#define c50 uniforms.uniforms_float4[9]
	#define c52 uniforms.uniforms_float4[10]
	#define c53 uniforms.uniforms_float4[11]
	#define c54 uniforms.uniforms_float4[12]
	#define c55 uniforms.uniforms_float4[13]
	#define c56 uniforms.uniforms_float4[14]
	#define c57 uniforms.uniforms_float4[15]
	#define c58 uniforms.uniforms_float4[16]
	#define c59 uniforms.uniforms_float4[17]
	#define c60 uniforms.uniforms_float4[18]
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
	r0.xyz = v8.xyz;
	r0.xyz = (r0.xyz * c13.xxx) + v1.xyz;
	r1.x = dot(r0.xyz, c58.xyz);
	r1.y = dot(r0.xyz, c59.xyz);
	r1.z = dot(r0.xyz, c60.xyz);
	r0.x = dot(r1.xyz, r1.xyz);
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	o3.xyz = r0.xxx * r1.xyz;
	o1.x = dot(v5, c48);
	o1.y = dot(v5, c49);
	o2.x = dot(v5, c52);
	o2.y = dot(v5, c53);
	r0.xyz = v2.xyz + v2.xyz;
	r1.x = log2(r0.x);
	r1.y = log2(r0.y);
	r1.z = log2(r0.z);
	r0.xyz = r1.xyz * c1.xxx;
	r1.x = exp2(r0.x);
	r1.y = exp2(r0.y);
	r1.z = exp2(r0.z);
	r0.xyz = v3.xyz + v3.xyz;
	r2.x = log2(r0.x);
	r2.y = log2(r0.y);
	r2.z = log2(r0.z);
	r0.xyz = r2.xyz * c1.xxx;
	r2.x = exp2(r0.x);
	r2.y = exp2(r0.y);
	r2.z = exp2(r0.z);
	r0.xyz = r1.xyz + r2.xyz;
	r1.xyz = v4.xyz + v4.xyz;
	r2.x = log2(r1.x);
	r2.y = log2(r1.y);
	r2.z = log2(r1.z);
	r1.xyz = r2.xyz * c1.xxx;
	r2.x = exp2(r1.x);
	r2.y = exp2(r1.y);
	r2.z = exp2(r1.z);
	r0.xyz = r0.xyz + r2.xyz;
	r0.w = v2.w;
	r0.w = r0.w + v3.w;
	r0.w = r0.w + v4.w;
	r0.w = r0.w * c1.y;
	r1.xyz = r0.www * c50.yzw;
	r0.xyz = (r0.xyz * c1.yyy) + -r1.xyz;
	o5.xyz = r1.xyz;
	o7.xyz = r0.xyz * c12.xxx;
	r0 = v0;
	r0.xyz = (v7.xyz * c13.xxx) + r0.xyz;
	r1.x = dot(r0, c58);
	r1.y = dot(r0, c59);
	r1.z = dot(r0, c60);
	r1.w = c0.y;
	o9.x = dot(r1, c54);
	o9.y = dot(r1, c55);
	o9.z = dot(r1, c56);
	o9.w = dot(r1, c57);
	r0.x = dot(r1, c8);
	r0.y = dot(r1, c9);
	r0.z = dot(r1, c10);
	r0.w = dot(r1, c11);
	o4.xyz = r1.xyz;
	o0 = r0;
	o8 = r0;
	o1.zw = c0.xy * v6.xx;
	o2.zw = c0.xy * v6.xy;
	o3.w = c0.x;
	o4.w = c0.x;
	o5.w = c0.x;
	o6 = c0.xxxx;
	o7.w = c0.x;
	#undef c0
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c12
	#undef c13
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

