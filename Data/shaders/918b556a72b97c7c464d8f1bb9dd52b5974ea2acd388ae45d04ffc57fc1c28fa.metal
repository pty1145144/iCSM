#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[35];
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
	texturecube<float> s6_texture [[texture(6)]],
	sampler s6 [[sampler(6)]],
	texture2d<float> s7_texture [[texture(7)]],
	sampler s7 [[sampler(7)]],
	depth2d<float> s8_texture [[texture(8)]],
	sampler s8 [[sampler(8)]],
	texture2d<float> s10_texture [[texture(10)]],
	sampler s10 [[sampler(10)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c13 = float4(2.000000000e+00, -1.000000000e+00, 1.000000000e+00, 0.000000000e+00); (void) c13;
	const float4 c14 = float4(1.041666627e+00, -2.083333395e-02, 5.000000000e-01, 1.591549367e-01); (void) c14;
	const float4 c15 = float4(6.283185482e+00, -3.141592741e+00, 5.773500204e-01, 5.000000000e+00); (void) c15;
	const float4 c16 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -3.000000119e-01); (void) c16;
	const float4 c17 = float4(-3.333333254e+00, -2.000000000e+00, 3.000000000e+00, 0.000000000e+00); (void) c17;
	const float4 c18 = float4(4.999995828e-01, 5.000000000e-01, -9.999999975e-07, 1.000000000e+06); (void) c18;
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
	#define c20 uniforms.uniforms_float4[13]
	#define c21 uniforms.uniforms_float4[14]
	#define c22 uniforms.uniforms_float4[15]
	#define c23 uniforms.uniforms_float4[16]
	#define c30 uniforms.uniforms_float4[17]
	#define c33 uniforms.uniforms_float4[18]
	#define c68 uniforms.uniforms_float4[19]
	#define c71 uniforms.uniforms_float4[20]
	#define c73 uniforms.uniforms_float4[21]
	#define c74 uniforms.uniforms_float4[22]
	#define c77 uniforms.uniforms_float4[23]
	#define c78 uniforms.uniforms_float4[24]
	#define c86 uniforms.uniforms_float4[25]
	#define c87 uniforms.uniforms_float4[26]
	#define c89 uniforms.uniforms_float4[27]
	#define c101 uniforms.uniforms_float4[28]
	#define c102 uniforms.uniforms_float4[29]
	#define c103 uniforms.uniforms_float4[30]
	#define c104 uniforms.uniforms_float4[31]
	#define c105 uniforms.uniforms_float4[32]
	#define c106 uniforms.uniforms_float4[33]
	#define c107 uniforms.uniforms_float4[34]
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
	r0 = (v5.xyzx * c13.zzzw) + c13.wwwz;
	r1.x = dot(r0, c73);
	r1.y = dot(r0, c74);
	r1.zw = (r1.xy * c14.xx) + c14.yy;
	r2.xy = clamp(r1.zw, float2(0.0), float2(1.0));
	r1.zw = -r1.zw + r2.xy;
	r1.z = dot(r1.zw, c13.zz) + c13.w;
	r1.w = dot(r0, c77);
	r2.x = clamp(((-abs(r1.z) >= 0.0) ? r1.x : r1.w), 0.0, 1.0);
	r1.x = dot(r0, c78);
	r0.z = dot(r0, c71);
	r2.y = clamp(((-abs(r1.z) >= 0.0) ? r1.y : r1.x), 0.0, 1.0);
	r1.xy = c86.xy;
	r1.xy = ((-abs(r1.z) >= 0.0) ? r1.xy : c87.xy);
	r0.xy = (r2.xy * c14.zz) + r1.xy;
	r0.w = c13.w;
	r0 = float4(s8_texture.sample_compare(s8, (r0.xyz).xy, (r0.xyz).z, level(r0.w)));
	r0.yzw = -c89.xyz + v5.xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.y = clamp((r0.y * c68.y) + c68.x, 0.0, 1.0);
	r1.x = mix(r0.x, c13.z, r0.y);
	r0 = s3_texture.sample(s3, v0.xy);
	r1.y = (r0.y * c18.x) + c18.y;
	r1.y = fract(r1.y);
	r1.y = (r1.y * c15.x) + c15.y;
	r2.xy = float2(cos(r1.y), sin(r1.y));
	r3 = s1_texture.sample(s1, v0.xy);
	r1.yzw = (r3.xyz * c13.xxx) + c13.yyy;
	r3.x = dot(v2.xyz, r1.yzw);
	r3.y = dot(v3.xyz, r1.yzw);
	r3.z = dot(v4.xyz, r1.yzw);
	r4.xyz = normalize(r3.xyz);
	r1.yzw = r4.zxy * v8.yzx;
	r1.yzw = (r4.yzx * v8.zxy) + -r1.yzw;
	r3.xyz = normalize(r1.yzw);
	r1.yzw = r3.yzx * r4.zxy;
	r1.yzw = (r4.yzx * r3.zxy) + -r1.yzw;
	r2.xzw = r2.xxx * r3.xyz;
	r3.xyz = normalize(r1.yzw);
	r1.yzw = (r2.yyy * r3.xyz) + r2.xzw;
	r2.xyz = normalize(r1.yzw);
	r1.yzw = c21.xyz + -v5.xyz;
	r3.xyz = normalize(r1.yzw);
	r1.y = dot(r3.xyz, r2.xxx);
	r1.z = (r1.y * -r1.y) + c13.z;
	r1.z = ((r1.z == 0.0) ? FLT_MAX : rsqrt(abs(r1.z)));
	r1.z = ((r1.z == 0.0) ? FLT_MAX : 1.0 / r1.z);
	r5.xyz = c3.xyz + -v5.xyz;
	r1.w = dot(r5.xyz, r5.xyz);
	r1.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r6.xyz = r1.www * r5.xyz;
	r2.w = dot(r6.xyz, r2.xyz);
	r4.w = (r2.w * -r2.w) + c13.z;
	r4.w = ((r4.w == 0.0) ? FLT_MAX : rsqrt(abs(r4.w)));
	r4.w = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r1.z = r1.z * r4.w;
	r1.y = clamp((r2.w * r1.y) + r1.z, 0.0, 1.0);
	r7.xyz = (r5.xyz * r1.www) + r3.xyz;
	r8.xyz = normalize(r7.xyz);
	r1.z = clamp(dot(r4.xyz, r8.xyz), 0.0, 1.0);
	r7.zw = c13.zw;
	r0.y = ((-r0.y >= 0.0) ? r7.w : c10.w);
	r8.y = mix(r1.z, r1.y, r0.y);
	r9 = s10_texture.sample(s10, v0.xy);
	r8.w = r9.w;
	r10 = s7_texture.sample(s7, r8.yw);
	r1.y = clamp(dot(r6.xyz, r3.xyz), 0.0, 1.0);
	r8.z = clamp(dot(r6.xyz, r4.xyz), 0.0, 1.0);
	r1.z = r8.z * r8.z;
	r11.w = r1.z * r1.z;
	r0.w = -r0.w + c13.z;
	r1.z = r11.w * r0.w;
	r7.xyw = r1.zzz * v6.xyz;
	r11.xyz = r7.xyw * c15.www;
	r11 = ((-r0.w >= 0.0) ? c13.wwww : r11);
	r1.y = r1.y * r11.w;
	r7.xyw = (r1.yyy * c15.www) + -r10.xyz;
	r7.xyw = (r0.www * r7.xyw) + r10.xyz;
	r7.xyw = ((-r0.w >= 0.0) ? r10.xyz : r7.xyw);
	r1.y = clamp(dot(r4.xyz, r3.xyz), 0.0, 1.0);
	r1.z = clamp(r3.z, 0.0, 1.0);
	r1.z = (r1.z * r1.z) + r1.z;
	r1.z = r1.z * c14.z;
	r3.x = ((r1.y == 0.0) ? FLT_MAX : rsqrt(abs(r1.y)));
	r3.x = ((r3.x == 0.0) ? FLT_MAX : 1.0 / r3.x);
	r7.xyw = r3.xxx * r7.xyw;
	r10.xyz = c20.xyz * v1.xxx;
	r7.xyw = r7.xyw * r10.xyz;
	r7.xyw = (r7.xyw * r1.xxx) + r11.xyz;
	r11.xyz = c23.xyz + -v5.xyz;
	r12.xyz = normalize(r11.xyz);
	r3.y = dot(r12.xyz, r2.xxx);
	r3.z = (r3.y * -r3.y) + c13.z;
	r3.z = ((r3.z == 0.0) ? FLT_MAX : rsqrt(abs(r3.z)));
	r3.z = ((r3.z == 0.0) ? FLT_MAX : 1.0 / r3.z);
	r3.z = r3.z * r4.w;
	r2.w = clamp((r2.w * r3.y) + r3.z, 0.0, 1.0);
	r11.xyz = (r5.xyz * r1.www) + r12.xyz;
	r13.xyz = normalize(r11.xyz);
	r3.y = clamp(dot(r4.xyz, r13.xyz), 0.0, 1.0);
	r8.x = mix(r3.y, r2.w, r0.y);
	r13 = s7_texture.sample(s7, r8.xw);
	r14 = s4_texture.sample(s4, r8.zw);
	r2.w = -r8.z + c13.z;
	r3.y = pow(abs(r2.w), c105.x);
	r2.w = clamp(dot(r6.xyz, r12.xyz), 0.0, 1.0);
	r3.z = clamp(dot(r4.xyz, r12.xyz), 0.0, 1.0);
	r2.w = r2.w * r11.w;
	r11.xyz = (r2.www * c15.www) + -r13.xyz;
	r11.xyz = (r0.www * r11.xyz) + r13.xyz;
	r11.xyz = ((-r0.w >= 0.0) ? r13.xyz : r11.xyz);
	r2.w = mix(r14.y, c13.z, r0.w);
	r0.w = r9.x * r14.z;
	r0.w = r0.w * c0.w;
	r4.w = ((r3.z == 0.0) ? FLT_MAX : rsqrt(abs(r3.z)));
	r4.w = ((r4.w == 0.0) ? FLT_MAX : 1.0 / r4.w);
	r11.xyz = r4.www * r11.xyz;
	r12.xyz = c22.xyz * v1.yyy;
	r7.xyw = (r11.xyz * r12.xyz) + r7.xyw;
	r7.xyw = r3.www * r7.xyw;
	r11.xyz = r4.xyz * r2.yzx;
	r11.xyz = (r2.xyz * r4.yzx) + -r11.xyz;
	r13.xyz = r2.yzx * r11.xyz;
	r2.xyz = (r11.zxy * r2.zxy) + -r13.xyz;
	r3.w = dot(r2.xyz, r2.xyz);
	r3.w = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r2.xyz = (r2.xyz * r3.www) + -r6.xyz;
	r2.xyz = (r0.yyy * r2.xyz) + r6.xyz;
	r0.y = dot(r4.xyz, r2.xyz);
	r0.y = r0.y + r0.y;
	r3.w = dot(r4.xyz, r4.xyz);
	r2.xyz = r2.xyz * r3.www;
	r2.xyz = (r0.yyy * r4.xyz) + -r2.xyz;
	r6 = s6_texture.sample(s6, r2.xyz);
	r11.xyz = r6.xyz * c30.zzz;
	r13.xyz = r11.xyz * r11.xyz;
	r13.xyz = r13.xyz * r13.xyz;
	r0.y = dot(r13.xyz, c16.xyz);
	r3.w = r0.y + c18.z;
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r0.y = ((r3.w >= 0.0) ? r0.y : c18.w);
	r3.w = dot(r11.xyz, c16.xyz);
	r13.xyz = r3.www * r13.xyz;
	r6.xyz = (c30.zzz * -r6.xyz) + r3.www;
	r6.xyz = (-c103.www * r6.xyz) + r11.xyz;
	r13.xyz = (r13.xyz * r0.yyy) + -r11.xyz;
	r13.xyz = (c103.www * r13.xyz) + r11.xyz;
	r6.xyz = ((c103.w >= 0.0) ? r13.xyz : r6.xyz);
	r0.y = abs(c103.w);
	r6.xyz = ((-r0.y >= 0.0) ? r11.xyz : r6.xyz);
	r11.x = ((r4.x >= 0.0) ? c13.w : c13.z);
	r11.y = ((r4.y >= 0.0) ? c13.w : c13.z);
	r11.z = ((r4.z >= 0.0) ? c13.w : c13.z);
	r13.xyz = r4.xyz * r4.xyz;
	r11.xyz = r11.xyz * r13.xyz;
	r14.xyz = r11.xxx * c5.xyz;
	r15.x = ((r4.x >= 0.0) ? c13.z : c13.w);
	r15.y = ((r4.y >= 0.0) ? c13.z : c13.w);
	r15.z = ((r4.z >= 0.0) ? c13.z : c13.w);
	r13.xyz = r13.xyz * r15.xyz;
	r14.xyz = (r13.xxx * c4.xyz) + r14.xyz;
	r13.xyw = (r13.yyy * c6.xyz) + r14.xyz;
	r11.xyw = (r11.yyy * c7.xyz) + r13.xyw;
	r11.xyw = (r13.zzz * c8.xyz) + r11.xyw;
	r11.xyz = (r11.zzz * c9.xyz) + r11.xyw;
	r0.y = (r1.y * r1.y) + r1.y;
	r1.y = r1.y * r8.y;
	r1.y = r3.y * r1.y;
	r0.y = r0.y * c14.z;
	r8.yzw = r0.yyy * r10.xyz;
	r8.yzw = (r8.yzw * r1.xxx) + r11.xyz;
	r0.y = (r3.z * r3.z) + r3.z;
	r3.z = r3.z * r8.x;
	r3.z = r3.y * r3.z;
	r3.z = r4.w * r3.z;
	r0.y = r0.y * c14.z;
	r8.xyz = (r12.xyz * r0.yyy) + r8.yzw;
	r11.xyz = r12.xyz * r3.zzz;
	r0.y = (r1.y * r3.x) + r3.z;
	r1.y = r3.x * r1.y;
	r3.xzw = r10.xyz * r1.yyy;
	r3.xzw = (r3.xzw * r1.xxx) + r11.xyz;
	r1.xy = r0.yy + -c33.xw;
	r11.xyz = r8.xyz + v6.xyz;
	r12.xyz = r11.xyz + -c103.xxx;
	r12.xyz = clamp(r12.xyz * c103.yyy, float3(0.0), float3(1.0));
	r12.xyz = (r6.xyz * r12.xyz) + -r6.xyz;
	r0.y = r0.z * c101.x;
	r6.xyz = (r0.yyy * r12.xyz) + r6.xyz;
	r12.xyz = (r6.xyz * r6.xyz) + -r6.xyz;
	r6.xyz = (c103.zzz * r12.xyz) + r6.xyz;
	r12 = s0_texture.sample(s0, v0.xy);
	r13.xyz = r12.www * c104.xyz;
	r6.xyz = r6.xyz * r13.xyz;
	r0.y = mix(c10.x, c10.y, r9.y);
	r6.xyz = (r7.xyw * r0.yyy) + r6.xyz;
	r7.xyw = r1.zzz * r10.xyz;
	r13.x = ((r2.x >= 0.0) ? c13.w : c13.z);
	r13.y = ((r2.y >= 0.0) ? c13.w : c13.z);
	r13.z = ((r2.z >= 0.0) ? c13.w : c13.z);
	r14.xyz = r2.xyz * r2.xyz;
	r2.x = ((r2.x >= 0.0) ? c13.z : c13.w);
	r2.y = ((r2.y >= 0.0) ? c13.z : c13.w);
	r2.z = ((r2.z >= 0.0) ? c13.z : c13.w);
	r2.xyz = r14.xyz * r2.xyz;
	r13.xyz = r13.xyz * r14.xyz;
	r14.xyz = r13.xxx * c5.xyz;
	r14.xyz = (r2.xxx * c4.xyz) + r14.xyz;
	r14.xyz = (r2.yyy * c6.xyz) + r14.xyz;
	r13.xyw = (r13.yyy * c7.xyz) + r14.xyz;
	r2.xyz = (r2.zzz * c8.xyz) + r13.xyw;
	r2.xyz = (r13.zzz * c9.xyz) + r2.xyz;
	r2.xyz = r7.xyw * r2.xyz;
	r13.x = v7.w;
	r13.y = v8.w;
	r13.z = v9.w;
	r7.xyw = -r13.xyz + c21.xyz;
	r13.xyz = normalize(r7.xyw);
	r0.y = clamp(dot(-v9.xyz, r13.xyz), 0.0, 1.0);
	r0.y = (r0.y * r0.y) + r0.y;
	r0.y = r0.y * c14.z;
	r7.xyw = r0.yyy * r10.xyz;
	r10.xyz = c0.xyz * v6.xyz;
	r7.xyw = (r10.xyz * r7.xyw) + -r2.xyz;
	r0.y = clamp(dot(r4.xyz, v9.xyz), 0.0, 1.0);
	r2.xyz = (r0.yyy * r7.xyw) + r2.xyz;
	r0.yzw = r0.www * r2.xyz;
	r0.yzw = (r6.xyz * r2.www) + r0.yzw;
	r1.z = r0.x * c12.w;
	r12.w = r0.x;
	r0.x = (r1.z * c14.w) + c14.z;
	r0.x = fract(r0.x);
	r0.x = (r0.x * c15.x) + c15.y;
	r2.xy = float2(cos(r0.x), sin(r0.x));
	r6.xyz = r12.zxy * c15.zzz;
	r6.xyz = (r12.zxy * c15.zzz) + -r6.zxy;
	r2.yzw = r2.yyy * r6.xyz;
	r2.yzw = (r12.xyz * r2.xxx) + r2.yzw;
	r0.x = -r2.x + c13.z;
	r1.z = dot(c15.zzz, r12.xyz);
	r1.z = r1.z * c15.z;
	r2.xyz = (r1.zzz * r0.xxx) + r2.yzw;
	r0.x = abs(c12.w);
	r2.w = c13.z;
	r2 = ((-r0.x >= 0.0) ? r12 : r2);
	r6.xyz = r2.xyz + c13.yyy;
	r6.xyz = (r9.yyy * r6.xyz) + c13.zzz;
	r0.xyz = r0.yzw * r6.xyz;
	r6.xyz = r2.xyz * r2.xyz;
	r6.xyz = r6.xyz * r6.xyz;
	r0.w = dot(r2.xyz, c16.xyz);
	r7.xyw = r0.www * r6.xyz;
	r1.z = dot(r6.xyz, c16.xyz);
	r6.xyz = mix(r2.xyz, r0.www, -c101.yyy);
	r0.w = r1.z + c18.z;
	r1.z = ((r1.z == 0.0) ? FLT_MAX : 1.0 / r1.z);
	r0.w = ((r0.w >= 0.0) ? r1.z : c18.w);
	r7.xyw = (r7.xyw * r0.www) + -r2.xyz;
	r7.xyw = (c101.yyy * r7.xyw) + r2.xyz;
	r6.xyz = ((c101.y >= 0.0) ? r7.xyw : r6.xyz);
	r0.w = abs(c101.y);
	r6.xyz = ((-r0.w >= 0.0) ? r2.xyz : r6.xyz);
	r7.xy = -c33.xw + c33.yz;
	r0.w = ((r7.x == 0.0) ? FLT_MAX : 1.0 / r7.x);
	r1.z = ((r7.y == 0.0) ? FLT_MAX : 1.0 / r7.y);
	r1.y = clamp(r1.z * r1.y, 0.0, 1.0);
	r0.w = clamp(r0.w * r1.x, 0.0, 1.0);
	r1.x = (r0.w * c17.y) + c17.z;
	r0.w = r0.w * r0.w;
	r0.w = r0.w * r1.x;
	r1.x = (r1.y * c17.y) + c17.z;
	r1.y = r1.y * r1.y;
	r1.x = r1.y * r1.x;
	r0.w = r0.w * r1.x;
	r1.x = (v6.w * c11.w) + r7.z;
	r1.y = r9.x * c105.y;
	r1.x = r1.x * r1.y;
	r1.xyz = r1.xxx * r3.xzw;
	r3.x = r9.y * c101.w;
	r7.xyz = (r2.xyz * r3.xxx) + -c106.xyz;
	r3.x = clamp(r3.x, 0.0, 1.0);
	r3.xzw = (r3.xxx * r7.xyz) + c106.xyz;
	r7.xyz = r1.xyz * r3.xzw;
	r4.w = dot(r7.xyz, c16.xyz);
	r0.w = r0.w * r4.w;
	r0.w = r0.w * c106.w;
	r4.w = dot(r8.xyz, c16.xyz);
	r7.xyz = (r1.xyz * r3.xzw) + r8.xyz;
	r5.w = dot(r7.xyz, c16.xyz);
	r5.w = r5.w + c16.w;
	r5.w = clamp(r5.w * c17.x, 0.0, 1.0);
	r7.xy = r4.ww + -c2.xw;
	r7.zw = -c2.xw + c2.yz;
	r4.w = ((r7.w == 0.0) ? FLT_MAX : 1.0 / r7.w);
	r6.w = ((r7.z == 0.0) ? FLT_MAX : 1.0 / r7.z);
	r6.w = clamp(r6.w * r7.x, 0.0, 1.0);
	r4.w = clamp(r4.w * r7.y, 0.0, 1.0);
	r7.x = (r4.w * c17.y) + c17.z;
	r4.w = r4.w * r4.w;
	r0.w = (r7.x * r4.w) + r0.w;
	r4.w = (r6.w * c17.y) + c17.z;
	r6.w = r6.w * r6.w;
	r4.w = r4.w * r6.w;
	r0.w = r0.w * r4.w;
	r0.w = r2.w * r0.w;
	r7.xyz = mix(r2.xyz, r6.xyz, r0.www);
	r0.w = dot(r7.xyz, c16.xyz);
	r2.xyz = r0.www * c102.xyz;
	r6.xyz = c16.xyz;
	r0.w = dot(c102.xyz, r6.xyz);
	r2.w = r0.w + c18.z;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r2.w >= 0.0) ? r0.w : c18.w);
	r2.xyz = (r2.xyz * r0.www) + -r7.xyz;
	r2.xyz = (c102.www * r2.xyz) + r7.xyz;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r2.xyz = (r2.xyz * r0.www) + -r7.xyz;
	r0.w = (r5.w * c17.y) + c17.z;
	r2.w = r5.w * r5.w;
	r0.w = r0.w * r2.w;
	r2.xyz = (r0.www * r2.xyz) + r7.xyz;
	r2.xyz = r9.zzz * r2.xyz;
	r0.xyz = (r2.xyz * r11.xyz) + r0.xyz;
	r0.xyz = (r1.xyz * r3.xzw) + r0.xyz;
	r1.x = v2.w;
	r1.y = v3.w;
	r1.z = v4.w;
	r2.xyz = (r5.xyz * r1.www) + r1.xyz;
	r0.w = clamp(dot(r4.xyz, r1.xyz), 0.0, 1.0);
	r1.xyz = normalize(r2.xyz);
	r1.x = clamp(dot(r4.xyz, r1.xyz), 0.0, 1.0);
	r1.x = r0.w * r1.x;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r1.x = r3.y * r1.x;
	r0.w = r0.w * r1.x;
	r1.xyz = v6.www * v6.xyz;
	r1.xyz = r1.xyz * c107.xyz;
	r1.xyz = r0.www * r1.xyz;
	r0.xyz = (r1.xyz * r9.xxx) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	oC0.xyz = r0.xyz * c30.xxx;
	oC0.w = c1.w;
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
	#undef c20
	#undef c21
	#undef c22
	#undef c23
	#undef c30
	#undef c33
	#undef c68
	#undef c71
	#undef c73
	#undef c74
	#undef c77
	#undef c78
	#undef c86
	#undef c87
	#undef c89
	#undef c101
	#undef c102
	#undef c103
	#undef c104
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

