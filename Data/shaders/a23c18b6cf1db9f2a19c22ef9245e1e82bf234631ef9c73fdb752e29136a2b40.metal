#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[21];
	bool uniforms_bool[1];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord2), centroid_perspective]];
	float4 v2 [[user(texcoord4)]];
	float4 v3 [[user(texcoord5)]];
	float4 v4 [[user(texcoord8)]];
	float4 v5 [[user(color0)]];
};

struct source_main_Output
{
	float4 oC0 [[color(0)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	texture2d<float> s0_texture [[texture(0)]],
	sampler s0 [[sampler(0)]],
	texture2d<float> s1_texture [[texture(1)]],
	sampler s1 [[sampler(1)]],
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
	texture2d<float> s7_texture [[texture(7)]],
	sampler s7 [[sampler(7)]],
	depth2d<float> s15_texture [[texture(15)]],
	sampler s15 [[sampler(15)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(1.000000000e+00, -0.000000000e+00, -2.000000000e+00, 3.000000000e+00); (void) c0;
	const float4 c1 = float4(2.125000060e-01, 7.153999805e-01, 7.209999859e-02, 5.000000000e-01); (void) c1;
	const float4 c2 = float4(1.041666627e+00, -2.083333395e-02, 4.882812500e-04, 0.000000000e+00); (void) c2;
	const float4 c3 = float4(-4.882812500e-04, 4.882812500e-04, 0.000000000e+00, 6.250000000e-02); (void) c3;
	const float4 c4 = float4(1.250000000e-01, 2.500000000e-01, 0.000000000e+00, 0.000000000e+00); (void) c4;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	float4 r7;
	#define c10 uniforms.uniforms_float4[0]
	#define c11 uniforms.uniforms_float4[1]
	#define c12 uniforms.uniforms_float4[2]
	#define c29 uniforms.uniforms_float4[3]
	#define c30 uniforms.uniforms_float4[4]
	#define c31 uniforms.uniforms_float4[5]
	#define c33 uniforms.uniforms_float4[6]
	#define c34 uniforms.uniforms_float4[7]
	#define c67 uniforms.uniforms_float4[8]
	#define c68 uniforms.uniforms_float4[9]
	#define c69 uniforms.uniforms_float4[10]
	#define c70 uniforms.uniforms_float4[11]
	#define c71 uniforms.uniforms_float4[12]
	#define c73 uniforms.uniforms_float4[13]
	#define c74 uniforms.uniforms_float4[14]
	#define c77 uniforms.uniforms_float4[15]
	#define c78 uniforms.uniforms_float4[16]
	#define c85 uniforms.uniforms_float4[17]
	#define c86 uniforms.uniforms_float4[18]
	#define c87 uniforms.uniforms_float4[19]
	#define c89 uniforms.uniforms_float4[20]
	#define b0 uniforms.uniforms_bool[0]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	r1 = s7_texture.sample(s7, v4.xy);
	r2 = s1_texture.sample(s1, v1.xy);
	r0.xyz = r0.xyz * c33.xyz;
	r3 = s3_texture.sample(s3, v0.zw);
	r1.w = -r3.x + r3.y;
	r3.x = r3.x + r3.y;
	r4.x = min(r3.x, c0.x);
	r1.w = ((r1.w >= 0.0) ? -r1.w : c0.y);
	r3.x = r1.w + r4.x;
	r1.w = r1.w + v3.w;
	r3.x = ((r3.x == 0.0) ? FLT_MAX : 1.0 / r3.x);
	r1.w = clamp(r1.w * r3.x, 0.0, 1.0);
	r3.x = (r1.w * c0.z) + c0.w;
	r1.w = r1.w * r1.w;
	r1.w = r1.w * r3.x;
	r1.xyz = (r1.xyz * c34.xyz) + -r0.xyz;
	r0.xyz = (r1.www * r1.xyz) + r0.xyz;
	r0.xyz = r0.xyz * v5.xyz;
	oC0.w = r0.w * v5.w;
	r1.xyz = r2.xyz * c12.xyz;
	if (b0) {
		if (-r2.w < -c0.y) {
			r0.w = dot(r2.xyz, c1.xyz);
			r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
			r0.w = r0.w * r2.w;
			r2 = (v2.xyzx * abs(c0.xxxy)) + abs(c0.yyyx);
			r3.z = dot(r2, c71);
			r4.x = dot(r2, c69);
			r4.y = dot(r2, c70);
			r4.zw = (r4.xy * c2.xx) + c2.yy;
			r5.xy = clamp(r4.zw, float2(0.0), float2(1.0));
			r4.zw = -r4.zw + r5.xy;
			r1.w = dot(r4.zw, abs(c0.xx)) + abs(c0.y);
			r5.x = dot(r2, c73);
			r5.y = dot(r2, c74);
			r4.zw = (r5.xy * c2.xx) + c2.yy;
			r5.zw = clamp(r4.zw, float2(0.0), float2(1.0));
			r4.zw = -r4.zw + r5.zw;
			r4.z = dot(r4.zw, abs(c0.xx)) + abs(c0.y);
			r4.w = ((-abs(r4.z) >= 0.0) ? abs(c0.x) : abs(c0.y));
			r5.z = dot(r2, c77);
			r2.x = dot(r2, c78);
			r6.x = ((-abs(r4.z) >= 0.0) ? r5.x : r5.z);
			r6.y = ((-abs(r4.z) >= 0.0) ? r5.y : r2.x);
			r2.xy = c86.xy;
			r2.xy = ((-abs(r4.z) >= 0.0) ? r2.xy : c87.xy);
			r2.zw = ((-abs(r1.w) >= 0.0) ? r4.xy : r6.xy);
			r2.xy = ((-abs(r1.w) >= 0.0) ? c85.xy : r2.xy);
			r1.w = ((-abs(r1.w) >= 0.0) ? c0.x : r4.w);
			r4.xy = clamp(r2.zw, float2(0.0), float2(1.0));
			r3.xy = (r4.xy * c1.ww) + r2.xy;
			r3.w = -c0.y;
			r4 = r3 + c2.zzww;
			r4 = float4(s15_texture.sample_compare(s15, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
			r5 = r3 + c3.xyzz;
			r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
			r6 = r3 + c3.yxzz;
			r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
			r7 = r3 + c3.xxzz;
			r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
			r4.y = r5.x;
			r4.z = r6.x;
			r4.w = r7.x;
			r2.x = dot(r4, c3.wwww);
			r4 = r3 + c2.zwww;
			r4 = float4(s15_texture.sample_compare(s15, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
			r5 = r3 + c3.xzzz;
			r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
			r6 = r3 + c3.zxzz;
			r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
			r7 = r3 + c2.wzww;
			r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
			r4.y = r5.x;
			r4.z = r6.x;
			r4.w = r7.x;
			r2.y = dot(r4, c4.xxxx);
			r3 = float4(s15_texture.sample_compare(s15, (r3.xyz).xy, (r3.xyz).z, level(r3.w)));
			r2.x = r2.y + r2.x;
			r2.x = (r3.x * c4.y) + r2.x;
			r2.yz = r2.zw + -c1.ww;
			r2.yz = abs(r2.yz) + -c67.zz;
			r2.yz = clamp(r2.yz * c67.ww, float2(0.0), float2(1.0));
			r2.yz = -r2.yz + c0.xx;
			r1.w = clamp((r2.y * r2.z) + r1.w, 0.0, 1.0);
			r3.x = mix(c0.x, r2.x, r1.w);
			r2.xyz = -c89.xyz + v2.xyz;
			r1.w = dot(r2.xyz, r2.xyz);
			r1.w = clamp((r1.w * c68.y) + c68.x, 0.0, 1.0);
			r2.x = mix(r3.x, c0.x, r1.w);
			r1.w = -r2.x + c0.x;
			r0.w = (r0.w * -r1.w) + c0.x;
			r2.xyz = r0.www * r1.zyx;
			r0.w = (r0.w * c1.w) + c1.w;
			r1.xyz = mix(r2.xyz, r2.zyx, r0.www);
		}
	}
	r1.xyz = r1.xyz + c31.xyz;
	r0.xyz = r0.xyz * r1.xyz;
	r1.xyz = c10.xyz + -v2.xyz;
	r0.w = dot(r1.xyz, r1.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = clamp((r0.w * c11.w) + c11.x, 0.0, 1.0);
	r1.x = min(r0.w, c11.z);
	r1.yzw = r0.xyz * c30.xxx;
	r0.w = r1.x * r1.x;
	r1.x = c30.x;
	r0.xyz = (r0.xyz * -r1.xxx) + c29.xyz;
	oC0.xyz = (r0.www * r0.xyz) + r1.yzw;
	#undef c10
	#undef c11
	#undef c12
	#undef c29
	#undef c30
	#undef c31
	#undef c33
	#undef c34
	#undef c67
	#undef c68
	#undef c69
	#undef c70
	#undef c71
	#undef c73
	#undef c74
	#undef c77
	#undef c78
	#undef c85
	#undef c86
	#undef c87
	#undef c89
	#undef b0
	#undef v0
	#undef v1
	#undef v2
	#undef v3
	#undef v4
	#undef v5
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

