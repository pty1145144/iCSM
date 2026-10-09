#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[10];
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
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(-0.001, 1.0, 0.0, 0.0); (void) c0;
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
	float4 r21;
	float4 r22;
	#define c1 uniforms.uniforms_float4[0]
	#define c3 uniforms.uniforms_float4[1]
	#define c4 uniforms.uniforms_float4[2]
	#define c5 uniforms.uniforms_float4[3]
	#define c6 uniforms.uniforms_float4[4]
	#define c7 uniforms.uniforms_float4[5]
	#define c8 uniforms.uniforms_float4[6]
	#define c9 uniforms.uniforms_float4[7]
	#define c10 uniforms.uniforms_float4[8]
	#define c11 uniforms.uniforms_float4[9]
	#define t0 input.t0
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, t0.xy);
	r1.w = c0.y;
	r2.w = c0.y;
	r3.w = c0.y;
	r4.w = c0.y;
	r5.w = c0.y;
	r5.xyz = r0.xyz;
	r0.x = clamp((c3.x * r0.w) + c3.y, 0.0, 1.0);
	r0.x = r0.x * c1.y;
	r0.y = clamp((c3.z * r0.w) + c3.w, 0.0, 1.0);
	r0.z = r0.w + c0.x;
	r0.y = r0.y * c1.z;
	r6.w = max(r0.x, r0.y);
	r0.x = r6.w * c1.x;
	r6.xy = (r0.xx * c4.xy) + t0.xy;
	r7.xy = (r0.xx * c4.wz) + t0.xy;
	r8.xy = (r0.xx * c5.xy) + t0.xy;
	r9.xy = (r0.xx * c5.wz) + t0.xy;
	r10.xy = (r0.xx * c6.xy) + t0.xy;
	r11.xy = (r0.xx * c6.wz) + t0.xy;
	r12.xy = (r0.xx * c7.xy) + t0.xy;
	r13.xy = (r0.xx * c7.wz) + t0.xy;
	r14.xy = (r0.xx * c8.xy) + t0.xy;
	r15.xy = (r0.xx * c8.wz) + t0.xy;
	r16.xy = (r0.xx * c9.xy) + t0.xy;
	r17.xy = (r0.xx * c9.wz) + t0.xy;
	r18.xy = (r0.xx * c10.xy) + t0.xy;
	r19.xy = (r0.xx * c10.wz) + t0.xy;
	r20.xy = (r0.xx * c11.xy) + t0.xy;
	r0.xy = (r0.xx * c11.wz) + t0.xy;
	r6 = s0_texture.sample(s0, r6.xy);
	r7 = s0_texture.sample(s0, r7.xy);
	r8 = s0_texture.sample(s0, r8.xy);
	r9 = s0_texture.sample(s0, r9.xy);
	r10 = s0_texture.sample(s0, r10.xy);
	r11 = s0_texture.sample(s0, r11.xy);
	r12 = s0_texture.sample(s0, r12.xy);
	r13 = s0_texture.sample(s0, r13.xy);
	r14 = s0_texture.sample(s0, r14.xy);
	r15 = s0_texture.sample(s0, r15.xy);
	r16 = s0_texture.sample(s0, r16.xy);
	r17 = s0_texture.sample(s0, r17.xy);
	r18 = s0_texture.sample(s0, r18.xy);
	r19 = s0_texture.sample(s0, r19.xy);
	r21 = s0_texture.sample(s0, r0.xy);
	r20 = s0_texture.sample(s0, r20.xy);
	r0.x = clamp((c3.x * r6.w) + c3.y, 0.0, 1.0);
	r0.x = r0.x * c1.y;
	r0.y = clamp((c3.z * r6.w) + c3.w, 0.0, 1.0);
	r0.y = r0.y * c1.z;
	r22.w = max(r0.x, r0.y);
	r0.x = r22.w * r22.w;
	r6.w = -r0.z + r6.w;
	r4.xyz = r6.xyz;
	r0.x = ((r6.w >= 0.0) ? c0.y : r0.x);
	r4 = (r4 * r0.xxxx) + r5;
	r0.x = clamp((c3.x * r7.w) + c3.y, 0.0, 1.0);
	r0.x = r0.x * c1.y;
	r0.y = clamp((c3.z * r7.w) + c3.w, 0.0, 1.0);
	r0.y = r0.y * c1.z;
	r5.x = max(r0.x, r0.y);
	r0.x = r5.x * r5.x;
	r7.w = -r0.z + r7.w;
	r3.xyz = r7.xyz;
	r0.x = ((r7.w >= 0.0) ? c0.y : r0.x);
	r3 = (r3 * r0.xxxx) + r4;
	r0.x = clamp((c3.x * r8.w) + c3.y, 0.0, 1.0);
	r0.x = r0.x * c1.y;
	r0.y = clamp((c3.z * r8.w) + c3.w, 0.0, 1.0);
	r0.y = r0.y * c1.z;
	r4.x = max(r0.x, r0.y);
	r0.x = r4.x * r4.x;
	r8.w = -r0.z + r8.w;
	r2.xyz = r8.xyz;
	r0.x = ((r8.w >= 0.0) ? c0.y : r0.x);
	r2 = (r2 * r0.xxxx) + r3;
	r0.x = clamp((c3.x * r9.w) + c3.y, 0.0, 1.0);
	r0.x = r0.x * c1.y;
	r0.y = clamp((c3.z * r9.w) + c3.w, 0.0, 1.0);
	r0.y = r0.y * c1.z;
	r3.x = max(r0.x, r0.y);
	r0.x = r3.x * r3.x;
	r9.w = -r0.z + r9.w;
	r1.xyz = r9.xyz;
	r0.x = ((r9.w >= 0.0) ? c0.y : r0.x);
	r1 = (r1 * r0.xxxx) + r2;
	r2.w = c0.y;
	r0.x = clamp((c3.x * r10.w) + c3.y, 0.0, 1.0);
	r0.x = r0.x * c1.y;
	r0.y = clamp((c3.z * r10.w) + c3.w, 0.0, 1.0);
	r0.y = r0.y * c1.z;
	r3.x = max(r0.x, r0.y);
	r0.x = r3.x * r3.x;
	r10.w = -r0.z + r10.w;
	r2.xyz = r10.xyz;
	r0.x = ((r10.w >= 0.0) ? c0.y : r0.x);
	r1 = (r2 * r0.xxxx) + r1;
	r2.w = c0.y;
	r0.x = clamp((c3.x * r11.w) + c3.y, 0.0, 1.0);
	r0.x = r0.x * c1.y;
	r0.y = clamp((c3.z * r11.w) + c3.w, 0.0, 1.0);
	r0.y = r0.y * c1.z;
	r3.x = max(r0.x, r0.y);
	r0.x = r3.x * r3.x;
	r11.w = -r0.z + r11.w;
	r2.xyz = r11.xyz;
	r0.x = ((r11.w >= 0.0) ? c0.y : r0.x);
	r1 = (r2 * r0.xxxx) + r1;
	r2.w = c0.y;
	r0.x = clamp((c3.x * r12.w) + c3.y, 0.0, 1.0);
	r0.x = r0.x * c1.y;
	r0.y = clamp((c3.z * r12.w) + c3.w, 0.0, 1.0);
	r0.y = r0.y * c1.z;
	r3.x = max(r0.x, r0.y);
	r0.x = r3.x * r3.x;
	r12.w = -r0.z + r12.w;
	r2.xyz = r12.xyz;
	r0.x = ((r12.w >= 0.0) ? c0.y : r0.x);
	r1 = (r2 * r0.xxxx) + r1;
	r2.w = c0.y;
	r0.x = clamp((c3.x * r13.w) + c3.y, 0.0, 1.0);
	r0.x = r0.x * c1.y;
	r0.y = clamp((c3.z * r13.w) + c3.w, 0.0, 1.0);
	r0.y = r0.y * c1.z;
	r3.x = max(r0.x, r0.y);
	r0.x = r3.x * r3.x;
	r13.w = -r0.z + r13.w;
	r2.xyz = r13.xyz;
	r0.x = ((r13.w >= 0.0) ? c0.y : r0.x);
	r1 = (r2 * r0.xxxx) + r1;
	r2.w = c0.y;
	r0.x = clamp((c3.x * r14.w) + c3.y, 0.0, 1.0);
	r0.x = r0.x * c1.y;
	r0.y = clamp((c3.z * r14.w) + c3.w, 0.0, 1.0);
	r0.y = r0.y * c1.z;
	r3.x = max(r0.x, r0.y);
	r0.x = r3.x * r3.x;
	r14.w = -r0.z + r14.w;
	r2.xyz = r14.xyz;
	r0.x = ((r14.w >= 0.0) ? c0.y : r0.x);
	r1 = (r2 * r0.xxxx) + r1;
	r2.w = c0.y;
	r0.x = clamp((c3.x * r15.w) + c3.y, 0.0, 1.0);
	r0.x = r0.x * c1.y;
	r0.y = clamp((c3.z * r15.w) + c3.w, 0.0, 1.0);
	r0.y = r0.y * c1.z;
	r3.x = max(r0.x, r0.y);
	r0.x = r3.x * r3.x;
	r15.w = -r0.z + r15.w;
	r2.xyz = r15.xyz;
	r0.x = ((r15.w >= 0.0) ? c0.y : r0.x);
	r1 = (r2 * r0.xxxx) + r1;
	r2.w = c0.y;
	r0.x = clamp((c3.x * r16.w) + c3.y, 0.0, 1.0);
	r0.x = r0.x * c1.y;
	r0.y = clamp((c3.z * r16.w) + c3.w, 0.0, 1.0);
	r0.y = r0.y * c1.z;
	r3.x = max(r0.x, r0.y);
	r0.x = r3.x * r3.x;
	r16.w = -r0.z + r16.w;
	r2.xyz = r16.xyz;
	r0.x = ((r16.w >= 0.0) ? c0.y : r0.x);
	r1 = (r2 * r0.xxxx) + r1;
	r2.w = c0.y;
	r0.x = clamp((c3.x * r17.w) + c3.y, 0.0, 1.0);
	r0.x = r0.x * c1.y;
	r0.y = clamp((c3.z * r17.w) + c3.w, 0.0, 1.0);
	r0.y = r0.y * c1.z;
	r3.x = max(r0.x, r0.y);
	r0.x = r3.x * r3.x;
	r17.w = -r0.z + r17.w;
	r2.xyz = r17.xyz;
	r0.x = ((r17.w >= 0.0) ? c0.y : r0.x);
	r1 = (r2 * r0.xxxx) + r1;
	r2.w = c0.y;
	r0.x = clamp((c3.x * r18.w) + c3.y, 0.0, 1.0);
	r0.x = r0.x * c1.y;
	r0.y = clamp((c3.z * r18.w) + c3.w, 0.0, 1.0);
	r0.y = r0.y * c1.z;
	r3.x = max(r0.x, r0.y);
	r0.x = r3.x * r3.x;
	r18.w = -r0.z + r18.w;
	r2.xyz = r18.xyz;
	r0.x = ((r18.w >= 0.0) ? c0.y : r0.x);
	r1 = (r2 * r0.xxxx) + r1;
	r2.w = c0.y;
	r0.x = clamp((c3.x * r19.w) + c3.y, 0.0, 1.0);
	r0.x = r0.x * c1.y;
	r0.y = clamp((c3.z * r19.w) + c3.w, 0.0, 1.0);
	r0.y = r0.y * c1.z;
	r3.x = max(r0.x, r0.y);
	r0.x = r3.x * r3.x;
	r19.w = -r0.z + r19.w;
	r2.xyz = r19.xyz;
	r0.x = ((r19.w >= 0.0) ? c0.y : r0.x);
	r1 = (r2 * r0.xxxx) + r1;
	r2.w = c0.y;
	r0.x = clamp((c3.x * r20.w) + c3.y, 0.0, 1.0);
	r0.x = r0.x * c1.y;
	r0.y = clamp((c3.z * r20.w) + c3.w, 0.0, 1.0);
	r0.y = r0.y * c1.z;
	r3.x = max(r0.x, r0.y);
	r0.x = r3.x * r3.x;
	r20.w = -r0.z + r20.w;
	r0.y = -r0.z + r21.w;
	r2.xyz = r20.xyz;
	r0.x = ((r20.w >= 0.0) ? c0.y : r0.x);
	r1 = (r2 * r0.xxxx) + r1;
	r2.w = c0.y;
	r0.x = clamp((c3.x * r21.w) + c3.y, 0.0, 1.0);
	r0.x = r0.x * c1.y;
	r21.w = clamp((c3.z * r21.w) + c3.w, 0.0, 1.0);
	r2.xyz = r21.xyz;
	r0.z = r21.w * c1.z;
	r3.x = max(r0.x, r0.z);
	r0.x = r3.x * r3.x;
	r0.x = ((r0.y >= 0.0) ? c0.y : r0.x);
	r0 = (r2 * r0.xxxx) + r1;
	r1.x = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0 = r0 * r1.xxxx;
	oC0 = r0;
	#undef c1
	#undef c3
	#undef c4
	#undef c5
	#undef c6
	#undef c7
	#undef c8
	#undef c9
	#undef c10
	#undef c11
	#undef t0
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

