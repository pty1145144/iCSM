#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[6];
};

struct source_main_Input
{
	float4 t0 [[user(texcoord0)]];
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
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(-1.000000047e-03, 2.200000048e+00, 1.000000000e+00, 0.000000000e+00); (void) c0;
	const float4 c2 = float4(0.000000000e+00, 0.000000000e+00, 0.000000000e+00, -1.000000047e-03); (void) c2;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	float4 r7;
	float4 r8;
	float4 r9;
	float4 r10;
	float4 r11;
	float4 r12;
	float4 r13;
	float4 r14;
	float4 r15;
	float4 r16;
	float4 r17;
	float4 r18;
	float4 r19;
	float4 r20;
	#define c1 uniforms.uniforms_float4[0]
	#define c3 uniforms.uniforms_float4[1]
	#define c4 uniforms.uniforms_float4[2]
	#define c5 uniforms.uniforms_float4[3]
	#define c6 uniforms.uniforms_float4[4]
	#define c7 uniforms.uniforms_float4[5]
	#define t0 input.t0
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, t0.xy);
	r1.w = c0.z;
	r2.w = c0.z;
	r3.w = clamp((c3.x * r0.w) + c3.y, 0.0, 1.0);
	r3.x = r3.w * c1.y;
	r3.y = clamp((c3.z * r0.w) + c3.w, 0.0, 1.0);
	r3.y = r3.y * c1.z;
	r4.w = max(r3.x, r3.y);
	r3.x = r4.w * c1.x;
	r4.xy = (r3.xx * c4.wz) + t0.xy;
	r5.xy = (r3.xx * c4.xy) + t0.xy;
	r6.xy = (r3.xx * c5.xy) + t0.xy;
	r7.xy = (r3.xx * c5.wz) + t0.xy;
	r8.xy = (r3.xx * c6.xy) + t0.xy;
	r9.xy = (r3.xx * c6.wz) + t0.xy;
	r10.xy = (r3.xx * c7.xy) + t0.xy;
	r3.xy = (r3.xx * c7.wz) + t0.xy;
	r11 = s0_texture.sample(s0, r4.xy);
	r4 = s1_texture.sample(s1, r4.xy);
	r12 = s0_texture.sample(s0, r5.xy);
	r5 = s1_texture.sample(s1, r5.xy);
	r13 = s0_texture.sample(s0, r6.xy);
	r6 = s1_texture.sample(s1, r6.xy);
	r14 = s0_texture.sample(s0, r7.xy);
	r7 = s1_texture.sample(s1, r7.xy);
	r15 = s0_texture.sample(s0, r8.xy);
	r8 = s1_texture.sample(s1, r8.xy);
	r16 = s0_texture.sample(s0, r9.xy);
	r9 = s1_texture.sample(s1, r9.xy);
	r17 = s0_texture.sample(s0, r10.xy);
	r10 = s1_texture.sample(s1, r10.xy);
	r18 = s1_texture.sample(s1, r3.xy);
	r3 = s0_texture.sample(s0, r3.xy);
	r19.w = clamp((c3.x * r11.w) + c3.y, 0.0, 1.0);
	r19.x = r19.w * c1.y;
	r19.y = clamp((c3.z * r11.w) + c3.w, 0.0, 1.0);
	r19.y = r19.y * c1.z;
	r20.w = max(r19.x, r19.y);
	r19.x = clamp(r20.w * c0.y, 0.0, 1.0);
	r20 = mix(r11, r4, r19.xxxx);
	r4.x = clamp((c3.x * r20.w) + c3.y, 0.0, 1.0);
	r4.x = r4.x * c1.y;
	r4.y = clamp((c3.z * r20.w) + c3.w, 0.0, 1.0);
	r4.y = r4.y * c1.z;
	r11.x = max(r4.x, r4.y);
	r4.x = r11.x * r11.x;
	r4.y = r0.w + c0.x;
	r0 = r0 + c2;
	r20.w = -r4.y + r20.w;
	r2.xyz = r20.xyz;
	r4.x = ((r20.w >= 0.0) ? c0.z : r4.x);
	r2 = r2 * r4.xxxx;
	r4.x = clamp((c3.x * r12.w) + c3.y, 0.0, 1.0);
	r4.x = r4.x * c1.y;
	r4.z = clamp((c3.z * r12.w) + c3.w, 0.0, 1.0);
	r4.z = r4.z * c1.z;
	r11.x = max(r4.x, r4.z);
	r4.x = clamp(r11.x * c0.y, 0.0, 1.0);
	r11 = mix(r12, r5, r4.xxxx);
	r4.x = clamp((c3.x * r11.w) + c3.y, 0.0, 1.0);
	r4.x = r4.x * c1.y;
	r4.z = clamp((c3.z * r11.w) + c3.w, 0.0, 1.0);
	r4.z = r4.z * c1.z;
	r5.x = max(r4.x, r4.z);
	r4.x = r5.x * r5.x;
	r11.w = -r4.y + r11.w;
	r1.xyz = r11.xyz;
	r4.x = ((r11.w >= 0.0) ? c0.z : r4.x);
	r1 = (r1 * r4.xxxx) + r2;
	r2.w = c0.z;
	r4.x = clamp((c3.x * r13.w) + c3.y, 0.0, 1.0);
	r4.x = r4.x * c1.y;
	r4.z = clamp((c3.z * r13.w) + c3.w, 0.0, 1.0);
	r4.z = r4.z * c1.z;
	r5.x = max(r4.x, r4.z);
	r4.x = clamp(r5.x * c0.y, 0.0, 1.0);
	r5 = mix(r13, r6, r4.xxxx);
	r4.x = clamp((c3.x * r5.w) + c3.y, 0.0, 1.0);
	r4.x = r4.x * c1.y;
	r4.z = clamp((c3.z * r5.w) + c3.w, 0.0, 1.0);
	r4.z = r4.z * c1.z;
	r6.x = max(r4.x, r4.z);
	r4.x = r6.x * r6.x;
	r5.w = -r4.y + r5.w;
	r2.xyz = r5.xyz;
	r4.x = ((r5.w >= 0.0) ? c0.z : r4.x);
	r1 = (r2 * r4.xxxx) + r1;
	r2.w = c0.z;
	r4.x = clamp((c3.x * r14.w) + c3.y, 0.0, 1.0);
	r4.x = r4.x * c1.y;
	r4.z = clamp((c3.z * r14.w) + c3.w, 0.0, 1.0);
	r4.z = r4.z * c1.z;
	r5.x = max(r4.x, r4.z);
	r4.x = clamp(r5.x * c0.y, 0.0, 1.0);
	r5 = mix(r14, r7, r4.xxxx);
	r4.x = clamp((c3.x * r5.w) + c3.y, 0.0, 1.0);
	r4.x = r4.x * c1.y;
	r4.z = clamp((c3.z * r5.w) + c3.w, 0.0, 1.0);
	r4.z = r4.z * c1.z;
	r6.x = max(r4.x, r4.z);
	r4.x = r6.x * r6.x;
	r5.w = -r4.y + r5.w;
	r2.xyz = r5.xyz;
	r4.x = ((r5.w >= 0.0) ? c0.z : r4.x);
	r1 = (r2 * r4.xxxx) + r1;
	r2.w = c0.z;
	r4.x = clamp((c3.x * r15.w) + c3.y, 0.0, 1.0);
	r4.x = r4.x * c1.y;
	r4.z = clamp((c3.z * r15.w) + c3.w, 0.0, 1.0);
	r4.z = r4.z * c1.z;
	r5.x = max(r4.x, r4.z);
	r4.x = clamp(r5.x * c0.y, 0.0, 1.0);
	r5 = mix(r15, r8, r4.xxxx);
	r4.x = clamp((c3.x * r5.w) + c3.y, 0.0, 1.0);
	r4.x = r4.x * c1.y;
	r4.z = clamp((c3.z * r5.w) + c3.w, 0.0, 1.0);
	r4.z = r4.z * c1.z;
	r6.x = max(r4.x, r4.z);
	r4.x = r6.x * r6.x;
	r5.w = -r4.y + r5.w;
	r2.xyz = r5.xyz;
	r4.x = ((r5.w >= 0.0) ? c0.z : r4.x);
	r1 = (r2 * r4.xxxx) + r1;
	r2.w = c0.z;
	r4.x = clamp((c3.x * r16.w) + c3.y, 0.0, 1.0);
	r4.x = r4.x * c1.y;
	r4.z = clamp((c3.z * r16.w) + c3.w, 0.0, 1.0);
	r4.z = r4.z * c1.z;
	r5.x = max(r4.x, r4.z);
	r4.x = clamp(r5.x * c0.y, 0.0, 1.0);
	r5 = mix(r16, r9, r4.xxxx);
	r4.x = clamp((c3.x * r5.w) + c3.y, 0.0, 1.0);
	r4.x = r4.x * c1.y;
	r4.z = clamp((c3.z * r5.w) + c3.w, 0.0, 1.0);
	r4.z = r4.z * c1.z;
	r6.x = max(r4.x, r4.z);
	r4.x = r6.x * r6.x;
	r5.w = -r4.y + r5.w;
	r2.xyz = r5.xyz;
	r4.x = ((r5.w >= 0.0) ? c0.z : r4.x);
	r1 = (r2 * r4.xxxx) + r1;
	r2.w = c0.z;
	r4.x = clamp((c3.x * r17.w) + c3.y, 0.0, 1.0);
	r4.x = r4.x * c1.y;
	r4.z = clamp((c3.z * r17.w) + c3.w, 0.0, 1.0);
	r4.z = r4.z * c1.z;
	r5.x = max(r4.x, r4.z);
	r4.x = clamp(r5.x * c0.y, 0.0, 1.0);
	r5 = mix(r17, r10, r4.xxxx);
	r4.x = clamp((c3.x * r5.w) + c3.y, 0.0, 1.0);
	r4.x = r4.x * c1.y;
	r4.z = clamp((c3.z * r5.w) + c3.w, 0.0, 1.0);
	r4.z = r4.z * c1.z;
	r6.x = max(r4.x, r4.z);
	r4.x = r6.x * r6.x;
	r5.w = -r4.y + r5.w;
	r2.xyz = r5.xyz;
	r4.x = ((r5.w >= 0.0) ? c0.z : r4.x);
	r1 = (r2 * r4.xxxx) + r1;
	r2.w = c0.z;
	r4.x = clamp((c3.x * r3.w) + c3.y, 0.0, 1.0);
	r4.x = r4.x * c1.y;
	r4.z = clamp((c3.z * r3.w) + c3.w, 0.0, 1.0);
	r4.z = r4.z * c1.z;
	r5.x = max(r4.x, r4.z);
	r4.x = clamp(r5.x * c0.y, 0.0, 1.0);
	r5 = mix(r3, r18, r4.xxxx);
	r3.x = clamp((c3.x * r5.w) + c3.y, 0.0, 1.0);
	r3.x = r3.x * c1.y;
	r3.y = clamp((c3.z * r5.w) + c3.w, 0.0, 1.0);
	r3.y = r3.y * c1.z;
	r4.x = max(r3.x, r3.y);
	r3.x = r4.x * r4.x;
	r5.w = -r4.y + r5.w;
	r2.xyz = r5.xyz;
	r3.x = ((r5.w >= 0.0) ? c0.z : r3.x);
	r1 = (r2 * r3.xxxx) + r1;
	r2.x = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r2 = r1 * r2.xxxx;
	r0 = ((-r1.w >= 0.0) ? r0 : r2);
	oC0 = r0;
	#undef c1
	#undef c3
	#undef c4
	#undef c5
	#undef c6
	#undef c7
	#undef t0
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

