#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[17];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord2)]];
	float4 v2 [[user(texcoord3)]];
	float4 v3 [[user(texcoord4)]];
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
	texture2d<float> s4_texture [[texture(4)]],
	sampler s4 [[sampler(4)]],
	texture2d<float> s9_texture [[texture(9)]],
	sampler s9 [[sampler(9)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c2 = float4(1.000000000e+00, -1.000000015e-01, 0.000000000e+00, 5.000000000e-01); (void) c2;
	const float4 c3 = float4(6.999999881e-01, 3.499999940e-01, -1.999999955e-02, 2.500000000e+01); (void) c3;
	const float4 c11 = float4(-2.000000000e+00, 3.000000000e+00, 3.000000119e-01, -9.999999776e-03); (void) c11;
	const float4 c12 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, 5.263157845e+00); (void) c12;
	const float4 c13 = float4(2.000000030e-01, 5.000000000e-01, 5.000000000e+00, 8.000000119e-01); (void) c13;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c4 uniforms.uniforms_float4[2]
	#define c5 uniforms.uniforms_float4[3]
	#define c6 uniforms.uniforms_float4[4]
	#define c7 uniforms.uniforms_float4[5]
	#define c8 uniforms.uniforms_float4[6]
	#define c9 uniforms.uniforms_float4[7]
	#define c10 uniforms.uniforms_float4[8]
	#define c14 uniforms.uniforms_float4[9]
	#define c20 uniforms.uniforms_float4[10]
	#define c21 uniforms.uniforms_float4[11]
	#define c22 uniforms.uniforms_float4[12]
	#define c23 uniforms.uniforms_float4[13]
	#define c24 uniforms.uniforms_float4[14]
	#define c25 uniforms.uniforms_float4[15]
	#define c30 uniforms.uniforms_float4[16]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define oC0 output.oC0
	r0.xyz = normalize(v3.xyz);
	r1.x = ((r0.x >= 0.0) ? c2.z : c2.x);
	r1.y = ((r0.y >= 0.0) ? c2.z : c2.x);
	r1.z = ((r0.z >= 0.0) ? c2.z : c2.x);
	r2.xyz = r0.xyz * r0.xyz;
	r1.xyz = r1.xyz * r2.xyz;
	r3.xyz = r1.xxx * c5.xyz;
	r4.x = ((r0.x >= 0.0) ? c2.x : c2.z);
	r4.y = ((r0.y >= 0.0) ? c2.x : c2.z);
	r4.z = ((r0.z >= 0.0) ? c2.x : c2.z);
	r2.xyz = r2.xyz * r4.xyz;
	r3.xyz = (r2.xxx * c4.xyz) + r3.xyz;
	r2.xyw = (r2.yyy * c6.xyz) + r3.xyz;
	r1.xyw = (r1.yyy * c7.xyz) + r2.xyw;
	r1.xyw = (r2.zzz * c8.xyz) + r1.xyw;
	r1.xyz = (r1.zzz * c9.xyz) + r1.xyw;
	r2.xyz = c20.xyz * v1.xxx;
	r3.xyz = c21.xyz + -v2.xyz;
	r4.xyz = normalize(r3.xyz);
	r0.w = clamp(dot(r0.xyz, r4.xyz), 0.0, 1.0);
	r0.w = (r0.w * r0.w) + r0.w;
	r0.w = r0.w * c2.w;
	r1.xyz = (r2.xyz * r0.www) + r1.xyz;
	r2.xyz = c22.xyz * v1.yyy;
	r3.xyz = c23.xyz + -v2.xyz;
	r4.xyz = normalize(r3.xyz);
	r0.w = clamp(dot(r0.xyz, r4.xyz), 0.0, 1.0);
	r0.w = (r0.w * r0.w) + r0.w;
	r0.w = r0.w * c2.w;
	r1.xyz = (r2.xyz * r0.www) + r1.xyz;
	r2.xyz = c24.xyz * v1.zzz;
	r3.xyz = c25.xyz + -v2.xyz;
	r4.xyz = normalize(r3.xyz);
	r0.w = clamp(dot(r0.xyz, r4.xyz), 0.0, 1.0);
	r0.w = (r0.w * r0.w) + r0.w;
	r0.w = r0.w * c2.w;
	r1.xyz = (r2.xyz * r0.www) + r1.xyz;
	r2.x = c20.w * v1.w;
	r2.y = c21.w * v1.w;
	r2.z = c22.w * v1.w;
	r3.x = c23.w + -v2.x;
	r3.y = c24.w + -v2.y;
	r3.z = c25.w + -v2.z;
	r4.xyz = normalize(r3.xyz);
	r0.x = clamp(dot(r0.xyz, r4.xyz), 0.0, 1.0);
	r0.x = (r0.x * r0.x) + r0.x;
	r0.x = r0.x * c2.w;
	r0.xyw = (r2.xyz * r0.xxx) + r1.xyz;
	r1.xy = c2.ww * v0.xy;
	r1 = s4_texture.sample(s4, r1.xy);
	r2 = s1_texture.sample(s1, v0.xy);
	r1.x = r2.y * r2.x;
	r1.x = (r1.x * -r1.y) + c2.x;
	r1.yz = clamp(v0.zw, float2(0.0), float2(1.0));
	r3 = s0_texture.sample(s0, r1.yz);
	r1.y = -r3.w + c2.x;
	r1.y = (c0.w * -r1.y) + c0.z;
	r1.z = r1.y + c3.z;
	r1.y = clamp(r1.y + -c0.y, 0.0, 1.0);
	r1.y = r1.y + c3.z;
	r1.y = -r1.y + r1.x;
	r1.x = -r1.z + r1.x;
	r1.xy = clamp(r1.xy * c3.ww, float2(0.0), float2(1.0));
	r1.z = (r1.x * c11.x) + c11.y;
	r1.x = r1.x * r1.x;
	r1.x = r1.x * r1.z;
	r3.xyz = r3.xyz * c10.xyz;
	r1.z = r3.w + c2.y;
	r2.xw = c1.ww * v0.zw;
	r4 = s9_texture.sample(s9, r2.xw);
	r5.xyz = (r3.xyz * r4.xyz) + -r3.xyz;
	r6.xy = c3.xy;
	r2.xw = r6.xy * c0.xx;
	r3.xyz = (r2.xxx * r5.xyz) + r3.xyz;
	r5.xyz = mix(r4.xyz, r3.xyz, r1.xxx);
	r0.xyw = r0.xyw * r5.xyz;
	r1.x = mix(c2.x, r2.z, r2.w);
	r0.xyw = r0.xyw * r1.xxx;
	r2.xyz = r2.yyy * r0.xyw;
	r0.x = (r1.y * c11.x) + c11.y;
	r0.y = r1.y * r1.y;
	r0.x = r0.y * r0.x;
	r2.w = ((r1.z >= 0.0) ? r0.x : c2.z);
	r0.x = min(v0.y, v0.x);
	r0.x = clamp(r0.x * c13.z, 0.0, 1.0);
	r0.y = (r0.x * c11.x) + c11.y;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r0.y;
	r1.w = max(r2.w, r0.x);
	r0.x = c2.x;
	r0.x = r0.x + -c14.x;
	r0.y = r0.x + -v0.x;
	r3.x = pow(abs(r0.y), c11.z);
	r0.w = r3.x * c11.z;
	r3.x = (r3.x * c11.z) + c11.w;
	r3.x = clamp(r3.x * c12.w, 0.0, 1.0);
	r4.y = clamp((r0.z * r0.w) + v0.y, 0.0, 1.0);
	r4.x = clamp(r0.y + r0.x, 0.0, 1.0);
	r0.x = -r0.x + v0.x;
	r4 = s0_texture.sample(s0, r4.xy);
	r0.z = dot(r4.xyz, c12.xyz);
	r0.w = r4.w + c2.y;
	r0.w = ((r0.w >= 0.0) ? -c2.x : -c2.z);
	r0.y = ((r0.y >= 0.0) ? r0.w : -c2.z);
	r3.y = mix(r0.z, c13.y, c13.x);
	r0.z = (r3.x * c11.x) + c11.y;
	r0.w = r3.x * r3.x;
	r3.x = r0.w * r0.z;
	r0.z = (r0.z * -r0.w) + c2.x;
	r1.xyz = r3.xxx * r3.yyy;
	r1 = ((r0.y >= 0.0) ? r2 : r1);
	r0.y = r0.z * r1.w;
	r2.w = r0.y * c13.w;
	r2.xyz = c2.zzz;
	r0 = ((r0.x >= 0.0) ? r2 : r1);
	oC0.xyz = r0.xyz * c30.xxx;
	oC0.w = r0.w;
	#undef c0
	#undef c1
	#undef c4
	#undef c5
	#undef c6
	#undef c7
	#undef c8
	#undef c9
	#undef c10
	#undef c14
	#undef c20
	#undef c21
	#undef c22
	#undef c23
	#undef c24
	#undef c25
	#undef c30
	#undef v0
	#undef v1
	#undef v2
	#undef v3
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

