#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[24];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord1)]];
	float4 v2 [[user(texcoord2)]];
	float4 v3 [[user(texcoord3)]];
	float4 v4 [[user(texcoord4)]];
	float4 v5 [[user(texcoord5)]];
	float4 v6 [[user(texcoord6)]];
	float4 v7 [[user(texcoord7)]];
	float4 v8 [[user(texcoord8)]];
	float4 v9 [[user(texcoord9)]];
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
	texture2d<float> s4_texture [[texture(4)]],
	sampler s4 [[sampler(4)]],
	texture2d<float> s7_texture [[texture(7)]],
	sampler s7 [[sampler(7)]],
	texture2d<float> s10_texture [[texture(10)]],
	sampler s10 [[sampler(10)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c13 = float4(5.000000000e-01, 1.591549367e-01, 6.283185482e+00, -3.141592741e+00); (void) c13;
	const float4 c14 = float4(5.773500204e-01, 5.000000000e+00, -3.000000119e-01, -3.333333254e+00); (void) c14;
	const float4 c15 = float4(2.000000000e+00, -1.000000000e+00, 0.000000000e+00, 1.000000000e+00); (void) c15;
	const float4 c16 = float4(-2.000000000e+00, 3.000000000e+00, 1.000000000e+06, 0.000000000e+00); (void) c16;
	const float4 c17 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -9.999999975e-07); (void) c17;
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
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c2 uniforms.uniforms_float4[2]
	#define c3 uniforms.uniforms_float4[3]
	#define c4 uniforms.uniforms_float4[4]
	#define c5 uniforms.uniforms_float4[5]
	#define c6 uniforms.uniforms_float4[6]
	#define c7 uniforms.uniforms_float4[7]
	#define c8 uniforms.uniforms_float4[8]
	#define c9 uniforms.uniforms_float4[9]
	#define c10 uniforms.uniforms_float4[10]
	#define c11 uniforms.uniforms_float4[11]
	#define c12 uniforms.uniforms_float4[12]
	#define c19 uniforms.uniforms_float4[13]
	#define c20 uniforms.uniforms_float4[14]
	#define c21 uniforms.uniforms_float4[15]
	#define c29 uniforms.uniforms_float4[16]
	#define c30 uniforms.uniforms_float4[17]
	#define c33 uniforms.uniforms_float4[18]
	#define c101 uniforms.uniforms_float4[19]
	#define c102 uniforms.uniforms_float4[20]
	#define c105 uniforms.uniforms_float4[21]
	#define c106 uniforms.uniforms_float4[22]
	#define c107 uniforms.uniforms_float4[23]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define v7 input.v7
	#define v8 input.v8
	#define v9 input.v9
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	oC0.w = r0.w * c1.w;
	r1.xyz = c17.xyz;
	r1.x = dot(c102.xyz, r1.xyz);
	r1.y = r1.x + c17.w;
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.x = ((r1.y >= 0.0) ? r1.x : c16.z);
	r1.yzw = r0.zxy * c14.xxx;
	r1.yzw = (r0.zxy * c14.xxx) + -r1.wyz;
	r2 = s3_texture.sample(s3, v0.xy);
	r2.y = r2.x * c12.w;
	r2.y = (r2.y * c13.y) + c13.x;
	r2.y = fract(r2.y);
	r2.y = (r2.y * c13.z) + c13.w;
	r3.xy = float2(cos(r2.y), sin(r2.y));
	r1.yzw = r1.yzw * r3.yyy;
	r1.yzw = (r0.xyz * r3.xxx) + r1.yzw;
	r2.y = -r3.x + c15.w;
	r2.z = dot(c14.xxx, r0.xyz);
	r2.z = r2.z * c14.x;
	r3.xyz = (r2.zzz * r2.yyy) + r1.yzw;
	r1.y = abs(c12.w);
	r3.w = c15.w;
	r0.w = r2.x;
	r1.z = -r2.w + c15.w;
	r0 = ((-r1.y >= 0.0) ? r0 : r3);
	r2.xyz = r0.xyz * r0.xyz;
	r2.xyz = r2.xyz * r2.xyz;
	r1.y = dot(r2.xyz, c17.xyz);
	r1.w = r1.y + c17.w;
	r1.y = ((r1.y == 0.0) ? FLT_MAX : 1.0 / r1.y);
	r1.y = ((r1.w >= 0.0) ? r1.y : c16.z);
	r1.w = dot(r0.xyz, c17.xyz);
	r2.xyz = r1.www * r2.xyz;
	r3.xyz = mix(r0.xyz, r1.www, -c101.yyy);
	r2.xyz = (r2.xyz * r1.yyy) + -r0.xyz;
	r2.xyz = (c101.yyy * r2.xyz) + r0.xyz;
	r2.xyz = ((c101.y >= 0.0) ? r2.xyz : r3.xyz);
	r1.y = abs(c101.y);
	r2.xyz = ((-r1.y >= 0.0) ? r0.xyz : r2.xyz);
	r1.yw = -c33.xw + c33.yz;
	r1.y = ((r1.y == 0.0) ? FLT_MAX : 1.0 / r1.y);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r3.xyz = c21.xyz + -v5.xyz;
	r4.xyz = normalize(r3.xyz);
	r3.xyz = c3.xyz + -v5.xyz;
	r2.w = dot(r3.xyz, r3.xyz);
	r2.w = ((r2.w == 0.0) ? FLT_MAX : rsqrt(abs(r2.w)));
	r5.xyz = (r3.xyz * r2.www) + r4.xyz;
	r6.xyz = normalize(r5.xyz);
	r5 = s1_texture.sample(s1, v0.xy);
	r5.xyz = (r5.xyz * c15.xxx) + c15.yyy;
	r7.x = dot(v2.xyz, r5.xyz);
	r7.y = dot(v3.xyz, r5.xyz);
	r7.z = dot(v4.xyz, r5.xyz);
	r5.xyz = normalize(r7.xyz);
	r6.x = clamp(dot(r5.xyz, r6.xyz), 0.0, 1.0);
	r3.w = clamp(dot(r5.xyz, r4.xyz), 0.0, 1.0);
	r4.w = r3.w * r6.x;
	r7.xyz = r2.www * r3.xyz;
	r6.w = dot(r7.xyz, r5.xyz);
	r6.y = clamp(r6.w, 0.0, 1.0);
	r6.w = r6.w + r6.w;
	r7.w = -r6.y + c15.w;
	r8.x = pow(abs(r7.w), c105.x);
	r4.w = r4.w * r8.x;
	r7.w = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r3.w = (r3.w * r3.w) + r3.w;
	r3.w = r3.w * c13.x;
	r7.w = ((r7.w == 0.0) ? FLT_MAX : 1.0 / r7.w);
	r8.yz = (r4.ww * r7.ww) + -c33.xw;
	r4.w = r4.w * r7.w;
	r1.yw = clamp(r1.yw * r8.yz, float2(0.0), float2(1.0));
	r8.y = (r1.y * c16.x) + c16.y;
	r1.y = r1.y * r1.y;
	r1.y = r1.y * r8.y;
	r8.y = (r1.w * c16.x) + c16.y;
	r1.w = r1.w * r1.w;
	r1.w = r1.w * r8.y;
	r1.y = r1.w * r1.y;
	r9 = s10_texture.sample(s10, v0.xy);
	r1.w = r9.y * c101.w;
	r8.yzw = (r0.xyz * r1.www) + -c106.xyz;
	r1.w = clamp(r1.w, 0.0, 1.0);
	r8.yzw = (r1.www * r8.yzw) + c106.xyz;
	r10.xyz = c20.xyz * v1.xxx;
	r11.xyz = r4.www * r10.xyz;
	r1.w = c15.w;
	r1.w = (v6.w * c11.w) + r1.w;
	r4.w = r9.x * c105.y;
	r1.w = r1.w * r4.w;
	r11.xyz = r1.www * r11.xyz;
	r12.xyz = r8.yzw * r11.xyz;
	r1.w = dot(r12.xyz, c17.xyz);
	r1.y = r1.w * r1.y;
	r1.y = r1.y * c106.w;
	r12.x = ((r5.x >= 0.0) ? c15.z : c15.w);
	r12.y = ((r5.y >= 0.0) ? c15.z : c15.w);
	r12.z = ((r5.z >= 0.0) ? c15.z : c15.w);
	r13.xyz = r5.xyz * r5.xyz;
	r12.xyz = r12.xyz * r13.xyz;
	r14.xyz = r12.xxx * c5.xyz;
	r15.x = ((r5.x >= 0.0) ? c15.w : c15.z);
	r15.y = ((r5.y >= 0.0) ? c15.w : c15.z);
	r15.z = ((r5.z >= 0.0) ? c15.w : c15.z);
	r13.xyz = r13.xyz * r15.xyz;
	r14.xyz = (r13.xxx * c4.xyz) + r14.xyz;
	r13.xyw = (r13.yyy * c6.xyz) + r14.xyz;
	r12.xyw = (r12.yyy * c7.xyz) + r13.xyw;
	r12.xyw = (r13.zzz * c8.xyz) + r12.xyw;
	r12.xyz = (r12.zzz * c9.xyz) + r12.xyw;
	r12.xyz = (r10.xyz * r3.www) + r12.xyz;
	r1.w = dot(r12.xyz, c17.xyz);
	r13.xy = r1.ww + -c2.xw;
	r13.zw = -c2.xw + c2.yz;
	r1.w = ((r13.w == 0.0) ? FLT_MAX : 1.0 / r13.w);
	r3.w = ((r13.z == 0.0) ? FLT_MAX : 1.0 / r13.z);
	r3.w = clamp(r3.w * r13.x, 0.0, 1.0);
	r1.w = clamp(r1.w * r13.y, 0.0, 1.0);
	r4.w = (r1.w * c16.x) + c16.y;
	r1.w = r1.w * r1.w;
	r1.y = (r4.w * r1.w) + r1.y;
	r1.w = (r3.w * c16.x) + c16.y;
	r3.w = r3.w * r3.w;
	r1.w = r1.w * r3.w;
	r1.y = r1.y * r1.w;
	r0.w = r0.w * r1.y;
	r13.xyz = mix(r0.xyz, r2.xyz, r0.www);
	r0.xyz = r0.xyz + c15.yyy;
	r0.xyz = (r9.yyy * r0.xyz) + c15.www;
	r0.w = dot(r13.xyz, c17.xyz);
	r2.xyz = r0.www * c102.xyz;
	r1.xyw = (r2.xyz * r1.xxx) + -r13.xyz;
	r1.xyw = (c102.www * r1.xyw) + r13.xyz;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r1.xyw = (r1.xyw * r0.www) + -r13.xyz;
	r2.xyz = (r11.xyz * r8.yzw) + r12.xyz;
	r12.xyz = r12.xyz + v6.xyz;
	r0.w = dot(r2.xyz, c17.xyz);
	r0.w = r0.w + c14.z;
	r0.w = clamp(r0.w * c14.w, 0.0, 1.0);
	r2.x = (r0.w * c16.x) + c16.y;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r2.x;
	r1.xyw = (r0.www * r1.xyw) + r13.xyz;
	r1.xyw = r9.zzz * r1.xyw;
	r2.x = v7.w;
	r2.y = v8.w;
	r2.z = v9.w;
	r2.xyz = -r2.xyz + c21.xyz;
	r13.xyz = normalize(r2.xyz);
	r0.w = clamp(dot(-v9.xyz, r13.xyz), 0.0, 1.0);
	r0.w = (r0.w * r0.w) + r0.w;
	r0.w = r0.w * c13.x;
	r2.xyz = r0.www * r10.xyz;
	r0.w = clamp(r4.z, 0.0, 1.0);
	r3.w = clamp(dot(r7.xyz, r4.xyz), 0.0, 1.0);
	r0.w = (r0.w * r0.w) + r0.w;
	r0.w = r0.w * c13.x;
	r4.xyz = r0.www * r10.xyz;
	r0.w = dot(r5.xyz, r5.xyz);
	r7.xyz = r7.xyz * r0.www;
	r7.xyz = (r6.www * r5.xyz) + -r7.xyz;
	r13.x = ((r7.x >= 0.0) ? c15.z : c15.w);
	r13.y = ((r7.y >= 0.0) ? c15.z : c15.w);
	r13.z = ((r7.z >= 0.0) ? c15.z : c15.w);
	r14.xyz = r7.xyz * r7.xyz;
	r7.x = ((r7.x >= 0.0) ? c15.w : c15.z);
	r7.y = ((r7.y >= 0.0) ? c15.w : c15.z);
	r7.z = ((r7.z >= 0.0) ? c15.w : c15.z);
	r7.xyz = r14.xyz * r7.xyz;
	r13.xyz = r13.xyz * r14.xyz;
	r14.xyz = r13.xxx * c5.xyz;
	r14.xyz = (r7.xxx * c4.xyz) + r14.xyz;
	r14.xyz = (r7.yyy * c6.xyz) + r14.xyz;
	r13.xyw = (r13.yyy * c7.xyz) + r14.xyz;
	r7.xyz = (r7.zzz * c8.xyz) + r13.xyw;
	r7.xyz = (r13.zzz * c9.xyz) + r7.xyz;
	r4.xyz = r4.xyz * r7.xyz;
	r7.xyz = c0.xyz * v6.xyz;
	r2.xyz = (r7.xyz * r2.xyz) + -r4.xyz;
	r0.w = clamp(dot(r5.xyz, v9.xyz), 0.0, 1.0);
	r2.xyz = (r0.www * r2.xyz) + r4.xyz;
	r6.z = r9.w;
	r4 = s4_texture.sample(s4, r6.yz);
	r0.w = r6.y * r6.y;
	r13.w = r0.w * r0.w;
	r6 = s7_texture.sample(s7, r6.xz);
	r0.w = r9.x * r4.z;
	r6.w = mix(r4.y, c15.w, r1.z);
	r0.w = r0.w * c0.w;
	r2.xyz = r0.www * r2.xyz;
	r0.w = r1.z * r13.w;
	r4.xyz = r0.www * v6.xyz;
	r13.xyz = r4.xyz * c14.yyy;
	r4 = ((-r1.z >= 0.0) ? c15.zzzz : r13);
	r0.w = r3.w * r4.w;
	r7.xyz = (r0.www * c14.yyy) + -r6.xyz;
	r7.xyz = (r1.zzz * r7.xyz) + r6.xyz;
	r6.xyz = ((-r1.z >= 0.0) ? r6.xyz : r7.xyz);
	r6.xyz = r7.www * r6.xyz;
	r4.xyz = (r6.xyz * r10.xyz) + r4.xyz;
	r4.xyz = r5.www * r4.xyz;
	r0.w = mix(c10.x, c10.y, r9.y);
	r4.xyz = r0.www * r4.xyz;
	r2.xyz = (r4.xyz * r6.www) + r2.xyz;
	r0.xyz = r0.xyz * r2.xyz;
	r0.xyz = (r1.xyw * r12.xyz) + r0.xyz;
	r0.xyz = (r11.xyz * r8.yzw) + r0.xyz;
	r1.x = v2.w;
	r1.y = v3.w;
	r1.z = v4.w;
	r2.xyz = (r3.xyz * r2.www) + r1.xyz;
	r0.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r0.w = clamp((r0.w * c19.w) + c19.x, 0.0, 1.0);
	r1.w = min(r0.w, c19.z);
	r0.w = r1.w * r1.w;
	r1.x = clamp(dot(r5.xyz, r1.xyz), 0.0, 1.0);
	r3.xyz = normalize(r2.xyz);
	r1.y = clamp(dot(r5.xyz, r3.xyz), 0.0, 1.0);
	r1.y = r1.x * r1.y;
	r1.x = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.y = r8.x * r1.y;
	r1.x = r1.x * r1.y;
	r1.yzw = v6.www * v6.xyz;
	r1.yzw = r1.yzw * c107.xyz;
	r1.xyz = r1.yzw * r1.xxx;
	r0.xyz = (r1.xyz * r9.xxx) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	oC0.xyz = (r0.www * r0.xyz) + r1.xyz;
	#undef c0
	#undef c1
	#undef c2
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
	#undef c19
	#undef c20
	#undef c21
	#undef c29
	#undef c30
	#undef c33
	#undef c101
	#undef c102
	#undef c105
	#undef c106
	#undef c107
	#undef v0
	#undef v1
	#undef v2
	#undef v3
	#undef v4
	#undef v5
	#undef v6
	#undef v7
	#undef v8
	#undef v9
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

