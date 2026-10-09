#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[18];
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
	float4 r23;
	float4 r24;
	float4 r25;
	float4 r26;
	float4 r27;
	float4 r28;
	float4 r29;
	float4 r30;
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
	#define c12 uniforms.uniforms_float4[10]
	#define c13 uniforms.uniforms_float4[11]
	#define c14 uniforms.uniforms_float4[12]
	#define c15 uniforms.uniforms_float4[13]
	#define c16 uniforms.uniforms_float4[14]
	#define c17 uniforms.uniforms_float4[15]
	#define c18 uniforms.uniforms_float4[16]
	#define c19 uniforms.uniforms_float4[17]
	#define t0 input.t0
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, t0.xy);
	r1.w = c0.y;
	r2.w = c0.y;
	r3.w = c0.y;
	r4.w = c0.y;
	r5.w = c0.y;
	r6.w = c0.y;
	r7.w = c0.y;
	r8.w = c0.y;
	r8.xyz = r0.xyz;
	r0.x = clamp((c3.x * r0.w) + c3.y, 0.0, 1.0);
	r0.x = r0.x * c1.y;
	r0.y = clamp((c3.z * r0.w) + c3.w, 0.0, 1.0);
	r0.z = r0.w + c0.x;
	r0.y = r0.y * c1.z;
	r9.w = max(r0.x, r0.y);
	r0.x = r9.w * c1.x;
	r9.xy = (r0.xx * c4.xy) + t0.xy;
	r10.xy = (r0.xx * c4.wz) + t0.xy;
	r11.xy = (r0.xx * c5.xy) + t0.xy;
	r12.xy = (r0.xx * c5.wz) + t0.xy;
	r13.xy = (r0.xx * c6.xy) + t0.xy;
	r14.xy = (r0.xx * c6.wz) + t0.xy;
	r15.xy = (r0.xx * c7.xy) + t0.xy;
	r16.xy = (r0.xx * c7.wz) + t0.xy;
	r17.xy = (r0.xx * c8.xy) + t0.xy;
	r18.xy = (r0.xx * c8.wz) + t0.xy;
	r19.xy = (r0.xx * c9.xy) + t0.xy;
	r20.xy = (r0.xx * c9.wz) + t0.xy;
	r21.xy = (r0.xx * c10.xy) + t0.xy;
	r22.xy = (r0.xx * c10.wz) + t0.xy;
	r23.xy = (r0.xx * c11.xy) + t0.xy;
	r24.xy = (r0.xx * c11.wz) + t0.xy;
	r25.xy = (r0.xx * c12.xy) + t0.xy;
	r26.xy = (r0.xx * c12.wz) + t0.xy;
	r27.xy = (r0.xx * c13.xy) + t0.xy;
	r28.xy = (r0.xx * c13.wz) + t0.xy;
	r29.xy = (r0.xx * c14.xy) + t0.xy;
	r30.xy = (r0.xx * c14.wz) + t0.xy;
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
	r20 = s0_texture.sample(s0, r20.xy);
	r21 = s0_texture.sample(s0, r21.xy);
	r22 = s0_texture.sample(s0, r22.xy);
	r23 = s0_texture.sample(s0, r23.xy);
	r24 = s0_texture.sample(s0, r24.xy);
	r25 = s0_texture.sample(s0, r25.xy);
	r26 = s0_texture.sample(s0, r26.xy);
	r27 = s0_texture.sample(s0, r27.xy);
	r28 = s0_texture.sample(s0, r28.xy);
	r29 = s0_texture.sample(s0, r29.xy);
	r30 = s0_texture.sample(s0, r30.xy);
	r7.xyz = r9.xyz;
	r0.y = clamp((c3.x * r9.w) + c3.y, 0.0, 1.0);
	r0.y = r0.y * c1.y;
	r0.w = clamp((c3.z * r9.w) + c3.w, 0.0, 1.0);
	r9.x = -r0.z + r9.w;
	r0.w = r0.w * c1.z;
	r9.y = max(r0.y, r0.w);
	r0.y = r9.y * r9.y;
	r0.y = ((r9.x >= 0.0) ? c0.y : r0.y);
	r7 = (r7 * r0.yyyy) + r8;
	r6.xyz = r10.xyz;
	r0.y = clamp((c3.x * r10.w) + c3.y, 0.0, 1.0);
	r0.y = r0.y * c1.y;
	r0.w = clamp((c3.z * r10.w) + c3.w, 0.0, 1.0);
	r8.x = -r0.z + r10.w;
	r0.w = r0.w * c1.z;
	r8.y = max(r0.y, r0.w);
	r0.y = r8.y * r8.y;
	r0.y = ((r8.x >= 0.0) ? c0.y : r0.y);
	r6 = (r6 * r0.yyyy) + r7;
	r5.xyz = r11.xyz;
	r0.y = clamp((c3.x * r11.w) + c3.y, 0.0, 1.0);
	r0.y = r0.y * c1.y;
	r0.w = clamp((c3.z * r11.w) + c3.w, 0.0, 1.0);
	r7.x = -r0.z + r11.w;
	r0.w = r0.w * c1.z;
	r7.y = max(r0.y, r0.w);
	r0.y = r7.y * r7.y;
	r0.y = ((r7.x >= 0.0) ? c0.y : r0.y);
	r5 = (r5 * r0.yyyy) + r6;
	r4.xyz = r12.xyz;
	r0.y = clamp((c3.x * r12.w) + c3.y, 0.0, 1.0);
	r0.y = r0.y * c1.y;
	r0.w = clamp((c3.z * r12.w) + c3.w, 0.0, 1.0);
	r6.x = -r0.z + r12.w;
	r0.w = r0.w * c1.z;
	r6.y = max(r0.y, r0.w);
	r0.y = r6.y * r6.y;
	r0.y = ((r6.x >= 0.0) ? c0.y : r0.y);
	r4 = (r4 * r0.yyyy) + r5;
	r3.xyz = r13.xyz;
	r0.y = clamp((c3.x * r13.w) + c3.y, 0.0, 1.0);
	r0.y = r0.y * c1.y;
	r0.w = clamp((c3.z * r13.w) + c3.w, 0.0, 1.0);
	r5.x = -r0.z + r13.w;
	r0.w = r0.w * c1.z;
	r5.y = max(r0.y, r0.w);
	r0.y = r5.y * r5.y;
	r0.y = ((r5.x >= 0.0) ? c0.y : r0.y);
	r3 = (r3 * r0.yyyy) + r4;
	r2.xyz = r14.xyz;
	r0.y = clamp((c3.x * r14.w) + c3.y, 0.0, 1.0);
	r0.y = r0.y * c1.y;
	r0.w = clamp((c3.z * r14.w) + c3.w, 0.0, 1.0);
	r4.x = -r0.z + r14.w;
	r0.w = r0.w * c1.z;
	r4.y = max(r0.y, r0.w);
	r0.y = r4.y * r4.y;
	r0.y = ((r4.x >= 0.0) ? c0.y : r0.y);
	r2 = (r2 * r0.yyyy) + r3;
	r1.xyz = r15.xyz;
	r0.y = clamp((c3.x * r15.w) + c3.y, 0.0, 1.0);
	r0.y = r0.y * c1.y;
	r0.w = clamp((c3.z * r15.w) + c3.w, 0.0, 1.0);
	r3.x = -r0.z + r15.w;
	r0.w = r0.w * c1.z;
	r3.y = max(r0.y, r0.w);
	r0.y = r3.y * r3.y;
	r0.y = ((r3.x >= 0.0) ? c0.y : r0.y);
	r1 = (r1 * r0.yyyy) + r2;
	r2.w = c0.y;
	r2.xyz = r16.xyz;
	r0.y = clamp((c3.x * r16.w) + c3.y, 0.0, 1.0);
	r0.y = r0.y * c1.y;
	r0.w = clamp((c3.z * r16.w) + c3.w, 0.0, 1.0);
	r3.x = -r0.z + r16.w;
	r0.w = r0.w * c1.z;
	r3.y = max(r0.y, r0.w);
	r0.y = r3.y * r3.y;
	r0.y = ((r3.x >= 0.0) ? c0.y : r0.y);
	r1 = (r2 * r0.yyyy) + r1;
	r2.w = c0.y;
	r2.xyz = r17.xyz;
	r0.y = clamp((c3.x * r17.w) + c3.y, 0.0, 1.0);
	r0.y = r0.y * c1.y;
	r0.w = clamp((c3.z * r17.w) + c3.w, 0.0, 1.0);
	r3.x = -r0.z + r17.w;
	r0.w = r0.w * c1.z;
	r3.y = max(r0.y, r0.w);
	r0.y = r3.y * r3.y;
	r0.y = ((r3.x >= 0.0) ? c0.y : r0.y);
	r1 = (r2 * r0.yyyy) + r1;
	r2.w = c0.y;
	r2.xyz = r18.xyz;
	r0.y = clamp((c3.x * r18.w) + c3.y, 0.0, 1.0);
	r0.y = r0.y * c1.y;
	r0.w = clamp((c3.z * r18.w) + c3.w, 0.0, 1.0);
	r3.x = -r0.z + r18.w;
	r0.w = r0.w * c1.z;
	r3.y = max(r0.y, r0.w);
	r0.y = r3.y * r3.y;
	r0.y = ((r3.x >= 0.0) ? c0.y : r0.y);
	r1 = (r2 * r0.yyyy) + r1;
	r2.w = c0.y;
	r2.xyz = r19.xyz;
	r0.y = clamp((c3.x * r19.w) + c3.y, 0.0, 1.0);
	r0.y = r0.y * c1.y;
	r0.w = clamp((c3.z * r19.w) + c3.w, 0.0, 1.0);
	r3.x = -r0.z + r19.w;
	r0.w = r0.w * c1.z;
	r3.y = max(r0.y, r0.w);
	r0.y = r3.y * r3.y;
	r0.y = ((r3.x >= 0.0) ? c0.y : r0.y);
	r1 = (r2 * r0.yyyy) + r1;
	r2.w = c0.y;
	r2.xyz = r20.xyz;
	r0.y = clamp((c3.x * r20.w) + c3.y, 0.0, 1.0);
	r0.y = r0.y * c1.y;
	r0.w = clamp((c3.z * r20.w) + c3.w, 0.0, 1.0);
	r3.x = -r0.z + r20.w;
	r0.w = r0.w * c1.z;
	r3.y = max(r0.y, r0.w);
	r0.y = r3.y * r3.y;
	r0.y = ((r3.x >= 0.0) ? c0.y : r0.y);
	r1 = (r2 * r0.yyyy) + r1;
	r2.w = c0.y;
	r2.xyz = r21.xyz;
	r0.y = clamp((c3.x * r21.w) + c3.y, 0.0, 1.0);
	r0.y = r0.y * c1.y;
	r0.w = clamp((c3.z * r21.w) + c3.w, 0.0, 1.0);
	r3.x = -r0.z + r21.w;
	r0.w = r0.w * c1.z;
	r3.y = max(r0.y, r0.w);
	r0.y = r3.y * r3.y;
	r0.y = ((r3.x >= 0.0) ? c0.y : r0.y);
	r1 = (r2 * r0.yyyy) + r1;
	r2.w = c0.y;
	r2.xyz = r22.xyz;
	r0.y = clamp((c3.x * r22.w) + c3.y, 0.0, 1.0);
	r0.y = r0.y * c1.y;
	r0.w = clamp((c3.z * r22.w) + c3.w, 0.0, 1.0);
	r3.x = -r0.z + r22.w;
	r0.w = r0.w * c1.z;
	r3.y = max(r0.y, r0.w);
	r0.y = r3.y * r3.y;
	r0.y = ((r3.x >= 0.0) ? c0.y : r0.y);
	r1 = (r2 * r0.yyyy) + r1;
	r2.w = c0.y;
	r2.xyz = r23.xyz;
	r0.y = clamp((c3.x * r23.w) + c3.y, 0.0, 1.0);
	r0.y = r0.y * c1.y;
	r0.w = clamp((c3.z * r23.w) + c3.w, 0.0, 1.0);
	r3.x = -r0.z + r23.w;
	r0.w = r0.w * c1.z;
	r3.y = max(r0.y, r0.w);
	r0.y = r3.y * r3.y;
	r0.y = ((r3.x >= 0.0) ? c0.y : r0.y);
	r1 = (r2 * r0.yyyy) + r1;
	r2.w = c0.y;
	r2.xyz = r24.xyz;
	r0.y = clamp((c3.x * r24.w) + c3.y, 0.0, 1.0);
	r0.y = r0.y * c1.y;
	r0.w = clamp((c3.z * r24.w) + c3.w, 0.0, 1.0);
	r3.x = -r0.z + r24.w;
	r0.w = r0.w * c1.z;
	r3.y = max(r0.y, r0.w);
	r0.y = r3.y * r3.y;
	r0.y = ((r3.x >= 0.0) ? c0.y : r0.y);
	r1 = (r2 * r0.yyyy) + r1;
	r2.w = c0.y;
	r2.xyz = r25.xyz;
	r0.y = clamp((c3.x * r25.w) + c3.y, 0.0, 1.0);
	r0.y = r0.y * c1.y;
	r0.w = clamp((c3.z * r25.w) + c3.w, 0.0, 1.0);
	r3.x = -r0.z + r25.w;
	r0.w = r0.w * c1.z;
	r3.y = max(r0.y, r0.w);
	r0.y = r3.y * r3.y;
	r0.y = ((r3.x >= 0.0) ? c0.y : r0.y);
	r1 = (r2 * r0.yyyy) + r1;
	r2.w = c0.y;
	r2.xyz = r26.xyz;
	r0.y = clamp((c3.x * r26.w) + c3.y, 0.0, 1.0);
	r0.y = r0.y * c1.y;
	r0.w = clamp((c3.z * r26.w) + c3.w, 0.0, 1.0);
	r3.x = -r0.z + r26.w;
	r0.w = r0.w * c1.z;
	r3.y = max(r0.y, r0.w);
	r0.y = r3.y * r3.y;
	r0.y = ((r3.x >= 0.0) ? c0.y : r0.y);
	r1 = (r2 * r0.yyyy) + r1;
	r2.w = c0.y;
	r2.xyz = r27.xyz;
	r0.y = clamp((c3.x * r27.w) + c3.y, 0.0, 1.0);
	r0.y = r0.y * c1.y;
	r0.w = clamp((c3.z * r27.w) + c3.w, 0.0, 1.0);
	r3.x = -r0.z + r27.w;
	r0.w = r0.w * c1.z;
	r3.y = max(r0.y, r0.w);
	r0.y = r3.y * r3.y;
	r0.y = ((r3.x >= 0.0) ? c0.y : r0.y);
	r1 = (r2 * r0.yyyy) + r1;
	r2.w = c0.y;
	r2.xyz = r28.xyz;
	r0.y = clamp((c3.x * r28.w) + c3.y, 0.0, 1.0);
	r0.y = r0.y * c1.y;
	r0.w = clamp((c3.z * r28.w) + c3.w, 0.0, 1.0);
	r3.x = -r0.z + r28.w;
	r0.w = r0.w * c1.z;
	r3.y = max(r0.y, r0.w);
	r0.y = r3.y * r3.y;
	r0.y = ((r3.x >= 0.0) ? c0.y : r0.y);
	r1 = (r2 * r0.yyyy) + r1;
	r2.w = c0.y;
	r2.xyz = r29.xyz;
	r0.y = clamp((c3.x * r29.w) + c3.y, 0.0, 1.0);
	r0.y = r0.y * c1.y;
	r0.w = clamp((c3.z * r29.w) + c3.w, 0.0, 1.0);
	r3.x = -r0.z + r29.w;
	r0.w = r0.w * c1.z;
	r3.y = max(r0.y, r0.w);
	r0.y = r3.y * r3.y;
	r0.y = ((r3.x >= 0.0) ? c0.y : r0.y);
	r1 = (r2 * r0.yyyy) + r1;
	r2.w = c0.y;
	r2.xyz = r30.xyz;
	r0.y = clamp((c3.x * r30.w) + c3.y, 0.0, 1.0);
	r0.y = r0.y * c1.y;
	r0.w = clamp((c3.z * r30.w) + c3.w, 0.0, 1.0);
	r3.x = -r0.z + r30.w;
	r0.w = r0.w * c1.z;
	r3.y = max(r0.y, r0.w);
	r0.y = r3.y * r3.y;
	r0.y = ((r3.x >= 0.0) ? c0.y : r0.y);
	r1 = (r2 * r0.yyyy) + r1;
	r2.w = c0.y;
	r3.xy = (r0.xx * c15.xy) + t0.xy;
	r4.xy = (r0.xx * c15.wz) + t0.xy;
	r5.xy = (r0.xx * c16.xy) + t0.xy;
	r6.xy = (r0.xx * c16.wz) + t0.xy;
	r7.xy = (r0.xx * c17.xy) + t0.xy;
	r8.xy = (r0.xx * c17.wz) + t0.xy;
	r9.xy = (r0.xx * c18.xy) + t0.xy;
	r10.xy = (r0.xx * c18.wz) + t0.xy;
	r11.xy = (r0.xx * c19.xy) + t0.xy;
	r0.xy = (r0.xx * c19.wz) + t0.xy;
	r3 = s0_texture.sample(s0, r3.xy);
	r4 = s0_texture.sample(s0, r4.xy);
	r5 = s0_texture.sample(s0, r5.xy);
	r6 = s0_texture.sample(s0, r6.xy);
	r7 = s0_texture.sample(s0, r7.xy);
	r8 = s0_texture.sample(s0, r8.xy);
	r9 = s0_texture.sample(s0, r9.xy);
	r10 = s0_texture.sample(s0, r10.xy);
	r12 = s0_texture.sample(s0, r0.xy);
	r11 = s0_texture.sample(s0, r11.xy);
	r2.xyz = r3.xyz;
	r0.x = clamp((c3.x * r3.w) + c3.y, 0.0, 1.0);
	r0.x = r0.x * c1.y;
	r0.y = clamp((c3.z * r3.w) + c3.w, 0.0, 1.0);
	r0.w = -r0.z + r3.w;
	r0.y = r0.y * c1.z;
	r3.x = max(r0.x, r0.y);
	r0.x = r3.x * r3.x;
	r0.x = ((r0.w >= 0.0) ? c0.y : r0.x);
	r1 = (r2 * r0.xxxx) + r1;
	r2.w = c0.y;
	r2.xyz = r4.xyz;
	r0.x = clamp((c3.x * r4.w) + c3.y, 0.0, 1.0);
	r0.x = r0.x * c1.y;
	r0.y = clamp((c3.z * r4.w) + c3.w, 0.0, 1.0);
	r0.w = -r0.z + r4.w;
	r0.y = r0.y * c1.z;
	r3.x = max(r0.x, r0.y);
	r0.x = r3.x * r3.x;
	r0.x = ((r0.w >= 0.0) ? c0.y : r0.x);
	r1 = (r2 * r0.xxxx) + r1;
	r2.w = c0.y;
	r2.xyz = r5.xyz;
	r0.x = clamp((c3.x * r5.w) + c3.y, 0.0, 1.0);
	r0.x = r0.x * c1.y;
	r0.y = clamp((c3.z * r5.w) + c3.w, 0.0, 1.0);
	r0.w = -r0.z + r5.w;
	r0.y = r0.y * c1.z;
	r3.x = max(r0.x, r0.y);
	r0.x = r3.x * r3.x;
	r0.x = ((r0.w >= 0.0) ? c0.y : r0.x);
	r1 = (r2 * r0.xxxx) + r1;
	r2.w = c0.y;
	r2.xyz = r6.xyz;
	r0.x = clamp((c3.x * r6.w) + c3.y, 0.0, 1.0);
	r0.x = r0.x * c1.y;
	r0.y = clamp((c3.z * r6.w) + c3.w, 0.0, 1.0);
	r0.w = -r0.z + r6.w;
	r0.y = r0.y * c1.z;
	r3.x = max(r0.x, r0.y);
	r0.x = r3.x * r3.x;
	r0.x = ((r0.w >= 0.0) ? c0.y : r0.x);
	r1 = (r2 * r0.xxxx) + r1;
	r2.w = c0.y;
	r2.xyz = r7.xyz;
	r0.x = clamp((c3.x * r7.w) + c3.y, 0.0, 1.0);
	r0.x = r0.x * c1.y;
	r0.y = clamp((c3.z * r7.w) + c3.w, 0.0, 1.0);
	r0.w = -r0.z + r7.w;
	r0.y = r0.y * c1.z;
	r3.x = max(r0.x, r0.y);
	r0.x = r3.x * r3.x;
	r0.x = ((r0.w >= 0.0) ? c0.y : r0.x);
	r1 = (r2 * r0.xxxx) + r1;
	r2.w = c0.y;
	r2.xyz = r8.xyz;
	r0.x = clamp((c3.x * r8.w) + c3.y, 0.0, 1.0);
	r0.x = r0.x * c1.y;
	r0.y = clamp((c3.z * r8.w) + c3.w, 0.0, 1.0);
	r0.w = -r0.z + r8.w;
	r0.y = r0.y * c1.z;
	r3.x = max(r0.x, r0.y);
	r0.x = r3.x * r3.x;
	r0.x = ((r0.w >= 0.0) ? c0.y : r0.x);
	r1 = (r2 * r0.xxxx) + r1;
	r2.w = c0.y;
	r2.xyz = r9.xyz;
	r0.x = clamp((c3.x * r9.w) + c3.y, 0.0, 1.0);
	r0.x = r0.x * c1.y;
	r0.y = clamp((c3.z * r9.w) + c3.w, 0.0, 1.0);
	r0.w = -r0.z + r9.w;
	r0.y = r0.y * c1.z;
	r3.x = max(r0.x, r0.y);
	r0.x = r3.x * r3.x;
	r0.x = ((r0.w >= 0.0) ? c0.y : r0.x);
	r1 = (r2 * r0.xxxx) + r1;
	r2.w = c0.y;
	r2.xyz = r10.xyz;
	r0.x = clamp((c3.x * r10.w) + c3.y, 0.0, 1.0);
	r0.x = r0.x * c1.y;
	r0.y = clamp((c3.z * r10.w) + c3.w, 0.0, 1.0);
	r0.w = -r0.z + r10.w;
	r0.y = r0.y * c1.z;
	r3.x = max(r0.x, r0.y);
	r0.x = r3.x * r3.x;
	r0.x = ((r0.w >= 0.0) ? c0.y : r0.x);
	r1 = (r2 * r0.xxxx) + r1;
	r2.w = c0.y;
	r2.xyz = r11.xyz;
	r0.x = clamp((c3.x * r11.w) + c3.y, 0.0, 1.0);
	r0.x = r0.x * c1.y;
	r0.y = clamp((c3.z * r11.w) + c3.w, 0.0, 1.0);
	r0.w = -r0.z + r11.w;
	r0.z = -r0.z + r12.w;
	r0.y = r0.y * c1.z;
	r3.x = max(r0.x, r0.y);
	r0.x = r3.x * r3.x;
	r0.x = ((r0.w >= 0.0) ? c0.y : r0.x);
	r1 = (r2 * r0.xxxx) + r1;
	r2.w = c0.y;
	r2.xyz = r12.xyz;
	r0.x = clamp((c3.x * r12.w) + c3.y, 0.0, 1.0);
	r0.y = clamp((c3.z * r12.w) + c3.w, 0.0, 1.0);
	r0.y = r0.y * c1.z;
	r0.x = r0.x * c1.y;
	r3.x = max(r0.x, r0.y);
	r0.x = r3.x * r3.x;
	r0.x = ((r0.z >= 0.0) ? c0.y : r0.x);
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
	#undef c12
	#undef c13
	#undef c14
	#undef c15
	#undef c16
	#undef c17
	#undef c18
	#undef c19
	#undef t0
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

