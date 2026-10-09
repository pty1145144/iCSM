#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[16];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord1)]];
	float4 v2 [[user(texcoord2)]];
	float4 v3 [[user(texcoord3)]];
	float4 v4 [[user(texcoord4)]];
};

struct source_main_Output
{
	float4 oC0 [[color(0)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	texture2d<float> s0_texture [[texture(0)]],
	sampler s0 [[sampler(0)]],
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
	texture2d<float> s6_texture [[texture(6)]],
	sampler s6 [[sampler(6)]],
	texture2d<float> s7_texture [[texture(7)]],
	sampler s7 [[sampler(7)]],
	texture2d<float> s10_texture [[texture(10)]],
	sampler s10 [[sampler(10)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c2 = float4(3.000000119e-01, 5.899999738e-01, 1.099999994e-01, 1.000000000e+00); (void) c2;
	const float4 c3 = float4(2.000000000e+00, -1.000000000e+00, 5.000000000e-01, 1.500000000e+02); (void) c3;
	const float4 c4 = float4(1.000000000e+00, 0.000000000e+00, -4.000000060e-01, 0.000000000e+00); (void) c4;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c10 uniforms.uniforms_float4[2]
	#define c11 uniforms.uniforms_float4[3]
	#define c12 uniforms.uniforms_float4[4]
	#define c13 uniforms.uniforms_float4[5]
	#define c14 uniforms.uniforms_float4[6]
	#define c15 uniforms.uniforms_float4[7]
	#define c16 uniforms.uniforms_float4[8]
	#define c18 uniforms.uniforms_float4[9]
	#define c19 uniforms.uniforms_float4[10]
	#define c26 uniforms.uniforms_float4[11]
	#define c27 uniforms.uniforms_float4[12]
	#define c28 uniforms.uniforms_float4[13]
	#define c29 uniforms.uniforms_float4[14]
	#define c30 uniforms.uniforms_float4[15]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define oC0 output.oC0
	r0.w = c2.w;
	r0.xy = r0.ww + -c27.xy;
	r0.x = r0.x * c27.z;
	r0.x = r0.y * r0.x;
	r1 = s0_texture.sample(s0, v0.xy);
	r2.x = mix(c2.w, r1.w, r0.x);
	oC0.w = r2.x * c1.w;
	r2 = (v4.xyzx * c4.xxxy) + c4.yyyx;
	r0.x = dot(r2, c15);
	r0.y = dot(r2, c16);
	r0.z = dot(r2, c18);
	r2.x = ((r0.z == 0.0) ? FLT_MAX : 1.0 / r0.z);
	r0.xy = r0.xy * r2.xx;
	r2 = s6_texture.sample(s6, r0.xy);
	r2.xyz = r2.xyz * c28.xyz;
	r3.xyz = v3.xyz;
	r4.xyz = r3.yzx * v2.zxy;
	r3.xyz = (v2.yzx * r3.zxy) + -r4.xyz;
	r3.xyz = r3.xyz * v3.www;
	r4 = s3_texture.sample(s3, v1.xy);
	r4.xyz = (r4.xyz * c3.xxx) + c3.yyy;
	r0.x = mix(r4.w, r1.w, c27.x);
	r3.xyz = r3.xyz * r4.yyy;
	r3.xyz = (r4.xxx * v3.xyz) + r3.xyz;
	r3.xyz = (r4.zzz * v2.xyz) + r3.xyz;
	r4.xyz = normalize(r3.xyz);
	r3.xyz = c14.xyz + -v4.xyz;
	r0.y = dot(r3.xyz, r3.xyz);
	r5.y = ((r0.y == 0.0) ? FLT_MAX : rsqrt(abs(r0.y)));
	r5.z = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r3.xyz = r3.xyz * r5.yyy;
	r0.y = dot(r3.xyz, r4.xyz);
	r0.y = clamp(r0.y + c28.w, 0.0, 1.0);
	r5.x = c2.w;
	r2.w = clamp(dot(c13.xyz, r5.xyz), 0.0, 1.0);
	r3.w = ((r5.y == 0.0) ? FLT_MAX : 1.0 / r5.y);
	r3.w = r3.w + -c13.w;
	r0.y = r0.y * r2.w;
	r2.xyz = r2.xyz * r0.yyy;
	r5.z = c4.z;
	r0.y = r5.z * c13.w;
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r0.y = clamp(r0.y * r3.w, 0.0, 1.0);
	r2.xyz = r0.yyy * r2.xyz;
	r2.xyz = ((-r0.z >= 0.0) ? c4.yyy : r2.xyz);
	r5.xyz = c11.xyz + -v4.xyz;
	r0.y = dot(r5.xyz, r5.xyz);
	r0.y = ((r0.y == 0.0) ? FLT_MAX : rsqrt(abs(r0.y)));
	r5.xyz = r0.yyy * r5.xyz;
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r0.y = clamp((r0.y * c12.w) + c12.x, 0.0, 1.0);
	r2.w = min(r0.y, c12.z);
	r0.y = r2.w * r2.w;
	r0.z = dot(-r5.xyz, r4.xyz);
	r0.z = r0.z + r0.z;
	r6.xyz = (r4.xyz * -r0.zzz) + -r5.xyz;
	r0.z = clamp(dot(r4.xyz, r5.xyz), 0.0, 1.0);
	r0.z = -r0.z + c2.w;
	r2.w = clamp(dot(r6.xyz, r3.xyz), 0.0, 1.0);
	r3.x = abs(c10.z);
	r4 = s7_texture.sample(s7, v0.xy);
	r3.y = -r4.x + c2.w;
	r3.y = (r4.x * c3.w) + r3.y;
	r3.x = ((-r3.x >= 0.0) ? r3.y : c10.z);
	r4.x = pow(abs(r2.w), r3.x);
	r3.xyz = r2.xyz * r4.xxx;
	r2.w = c19.w;
	r4.xzw = (c0.www * r1.xyz) + -r2.www;
	r4.xyz = (r4.yyy * r4.xzw) + c19.www;
	r5.xyz = r2.www * c26.xyz;
	r4.xyz = ((c26.x >= 0.0) ? r5.xyz : r4.xyz);
	r2.w = dot(r1.xyz, c2.xyz);
	r3.w = mix(r0.x, r2.w, c10.y);
	r4.xyz = r4.xyz * r3.www;
	r3.xyz = r3.xyz * r4.xyz;
	r0.x = clamp(r1.w + c27.z, 0.0, 1.0);
	r4.xyz = -r0.www + c1.xyz;
	r4.xyz = (r0.xxx * r4.xyz) + c2.www;
	r2.xyz = r2.xyz * r4.xyz;
	r1.xyz = r1.xyz * r2.xyz;
	r2 = s10_texture.sample(s10, v0.zw);
	r1.xyz = r1.xyz * r2.xyz;
	r0.x = (r0.z * -r0.z) + c3.z;
	r0.z = r0.z * r0.z;
	r0.w = r0.z + r0.z;
	r0.z = (r0.z * c3.x) + c3.y;
	r1.w = mix(c19.y, c19.z, r0.z);
	r0.z = -c19.x + c19.y;
	r0.z = (r0.w * r0.z) + c19.x;
	r0.x = ((r0.x >= 0.0) ? r0.z : r1.w);
	r0.xzw = (r3.xyz * r0.xxx) + r1.xyz;
	r1.xyz = r0.xzw * c30.xxx;
	r2.x = c30.x;
	r0.xzw = (r0.xzw * -r2.xxx) + c29.xyz;
	oC0.xyz = (r0.yyy * r0.xzw) + r1.xyz;
	#undef c0
	#undef c1
	#undef c10
	#undef c11
	#undef c12
	#undef c13
	#undef c14
	#undef c15
	#undef c16
	#undef c18
	#undef c19
	#undef c26
	#undef c27
	#undef c28
	#undef c29
	#undef c30
	#undef v0
	#undef v1
	#undef v2
	#undef v3
	#undef v4
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

