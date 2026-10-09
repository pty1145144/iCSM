#include <metal_stdlib>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[32];
	bool uniforms_bool[4];
};

struct source_main_Input
{
	float4 v0 [[attribute(0)]];
	float4 v1 [[attribute(1)]];
	float4 v2 [[attribute(2)]];
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
	const float4 c1 = float4(0.05, 0.0001, 0.0, 0.0); (void) c1;
	float4 r0;
	float4 r1;
	float4 r2;
	#define c0 uniforms.uniforms_float4[0]
	#define c2 uniforms.uniforms_float4[1]
	#define c8 uniforms.uniforms_float4[2]
	#define c9 uniforms.uniforms_float4[3]
	#define c10 uniforms.uniforms_float4[4]
	#define c11 uniforms.uniforms_float4[5]
	#define c27 uniforms.uniforms_float4[6]
	#define c28 uniforms.uniforms_float4[7]
	#define c29 uniforms.uniforms_float4[8]
	#define c30 uniforms.uniforms_float4[9]
	#define c31 uniforms.uniforms_float4[10]
	#define c32 uniforms.uniforms_float4[11]
	#define c33 uniforms.uniforms_float4[12]
	#define c34 uniforms.uniforms_float4[13]
	#define c35 uniforms.uniforms_float4[14]
	#define c36 uniforms.uniforms_float4[15]
	#define c37 uniforms.uniforms_float4[16]
	#define c38 uniforms.uniforms_float4[17]
	#define c39 uniforms.uniforms_float4[18]
	#define c40 uniforms.uniforms_float4[19]
	#define c41 uniforms.uniforms_float4[20]
	#define c42 uniforms.uniforms_float4[21]
	#define c43 uniforms.uniforms_float4[22]
	#define c44 uniforms.uniforms_float4[23]
	#define c45 uniforms.uniforms_float4[24]
	#define c46 uniforms.uniforms_float4[25]
	#define c48 uniforms.uniforms_float4[26]
	#define c49 uniforms.uniforms_float4[27]
	#define c50 uniforms.uniforms_float4[28]
	#define c58 uniforms.uniforms_float4[29]
	#define c59 uniforms.uniforms_float4[30]
	#define c60 uniforms.uniforms_float4[31]
	#define b0 uniforms.uniforms_bool[0]
	#define b1 uniforms.uniforms_bool[1]
	#define b2 uniforms.uniforms_bool[2]
	#define b3 uniforms.uniforms_bool[3]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define o0 output.o0
	#define o1 output.o1
	#define o2 output.o2
	#define o3 output.o3
	#define o4 output.o4
	r0.x = dot(v0, c58);
	r0.y = dot(v0, c59);
	r0.z = dot(v0, c60);
	r1.x = dot(v2.xyz, c58.xyz);
	r1.y = dot(v2.xyz, c59.xyz);
	r1.z = dot(v2.xyz, c60.xyz);
	r0.w = dot(r1.xyz, r1.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	o4.xyz = r0.www * r1.xyz;
	r1.xyz = r0.xyz + -c2.xyz;
	r2.xyz = normalize(r1.xyz);
	r0.xyz = (r2.xyz * -c1.xxx) + r0.xyz;
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
		r1.x = max(r1.x, c1.y);
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
		r1.x = max(r1.x, c1.y);
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
		r1.x = max(r1.x, c1.y);
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
		r1.x = max(r1.x, c1.y);
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
	#undef o0
	#undef o1
	#undef o2
	#undef o3
	#undef o4
	return output;
}

