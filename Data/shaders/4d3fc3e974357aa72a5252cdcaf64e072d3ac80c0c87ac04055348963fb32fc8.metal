#include <metal_stdlib>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[17];
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
	float4 o2 [[user(texcoord1)]];
	float4 o3 [[user(texcoord2)]];
	float4 o4 [[user(texcoord3)]];
	float4 o5 [[user(texcoord4)]];
	float4 o6 [[user(texcoord5)]];
	float4 o7 [[user(texcoord6)]];
	float4 o8 [[user(color1)]];
};

vertex source_main_Output source_main (
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	float4 r0;
	float4 r1;
	float4 r2;
	#define c0 uniforms.uniforms_float4[0]
	#define c8 uniforms.uniforms_float4[1]
	#define c9 uniforms.uniforms_float4[2]
	#define c10 uniforms.uniforms_float4[3]
	#define c11 uniforms.uniforms_float4[4]
	#define c48 uniforms.uniforms_float4[5]
	#define c49 uniforms.uniforms_float4[6]
	#define c50 uniforms.uniforms_float4[7]
	#define c51 uniforms.uniforms_float4[8]
	#define c52 uniforms.uniforms_float4[9]
	#define c54 uniforms.uniforms_float4[10]
	#define c55 uniforms.uniforms_float4[11]
	#define c56 uniforms.uniforms_float4[12]
	#define c57 uniforms.uniforms_float4[13]
	#define c58 uniforms.uniforms_float4[14]
	#define c59 uniforms.uniforms_float4[15]
	#define c60 uniforms.uniforms_float4[16]
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
	#define o5 output.o5
	#define o6 output.o6
	#define o7 output.o7
	#define o8 output.o8
	r0 = (v0.xyzx * c0.yyyx) + c0.xxxy;
	r1.x = dot(r0, c58);
	r1.y = dot(r0, c59);
	r1.z = dot(r0, c60);
	r1.w = c0.y;
	o0.z = dot(r1, c10);
	r0.xy = c54.xy * v2.xy;
	r0.x = r0.y + r0.x;
	o2.x = r0.x + c54.w;
	r0.xy = c55.xy * v2.xy;
	r0.x = r0.y + r0.x;
	o2.y = r0.x + c55.w;
	o1.x = dot(r1, c49);
	o1.y = dot(r1, c50);
	o1.z = dot(r1, c51);
	o1.w = dot(r1, c52);
	r0.xy = c56.xy * v2.xy;
	r0.x = r0.y + r0.x;
	o4.x = r0.x + c56.w;
	r0.xy = c57.xy * v2.xy;
	r0.x = r0.y + r0.x;
	o4.y = r0.x + c57.w;
	r0.x = dot(v3.xyz, c58.xyz);
	r0.y = dot(v3.xyz, c59.xyz);
	r0.z = dot(v3.xyz, c60.xyz);
	r2.xyz = -r1.xyz + c48.xyz;
	o3.x = dot(r2.xyz, r0.xyz);
	r0.x = dot(v4.xyz, c58.xyz);
	r0.y = dot(v4.xyz, c59.xyz);
	r0.z = dot(v4.xyz, c60.xyz);
	o3.y = dot(r2.xyz, r0.xyz);
	r0.x = dot(v1.xyz, c58.xyz);
	r0.y = dot(v1.xyz, c59.xyz);
	r0.z = dot(v1.xyz, c60.xyz);
	o3.z = dot(r2.xyz, r0.xyz);
	r0.x = dot(r1, c8);
	r0.y = dot(r1, c9);
	r0.w = dot(r1, c11);
	o6 = r1;
	o0.xyw = r0.xyw;
	o7.xyz = r0.xyw;
	o5.xy = c0.xx;
	o8 = c0.xxxx;
	#undef c0
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef c48
	#undef c49
	#undef c50
	#undef c51
	#undef c52
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

