#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[36];
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
	const float4 c0 = float4(1.041666627e+00, -2.083333395e-02, 5.000000000e-01, 1.591549367e-01); (void) c0;
	const float4 c2 = float4(6.283185482e+00, -3.141592741e+00, 5.773500204e-01, 5.000000000e+00); (void) c2;
	const float4 c13 = float4(2.000000000e+00, -1.000000000e+00, 1.000000000e+00, 0.000000000e+00); (void) c13;
	const float4 c14 = float4(-2.000000000e+00, 3.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c14;
	const float4 c15 = float4(1.000000000e+06, -3.000000119e-01, -3.333333254e+00, 0.000000000e+00); (void) c15;
	const float4 c16 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -9.999999975e-07); (void) c16;
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
	#define c19 uniforms.uniforms_float4[11]
	#define c20 uniforms.uniforms_float4[12]
	#define c21 uniforms.uniforms_float4[13]
	#define c22 uniforms.uniforms_float4[14]
	#define c23 uniforms.uniforms_float4[15]
	#define c24 uniforms.uniforms_float4[16]
	#define c25 uniforms.uniforms_float4[17]
	#define c29 uniforms.uniforms_float4[18]
	#define c30 uniforms.uniforms_float4[19]
	#define c68 uniforms.uniforms_float4[20]
	#define c71 uniforms.uniforms_float4[21]
	#define c73 uniforms.uniforms_float4[22]
	#define c74 uniforms.uniforms_float4[23]
	#define c77 uniforms.uniforms_float4[24]
	#define c78 uniforms.uniforms_float4[25]
	#define c86 uniforms.uniforms_float4[26]
	#define c87 uniforms.uniforms_float4[27]
	#define c89 uniforms.uniforms_float4[28]
	#define c101 uniforms.uniforms_float4[29]
	#define c102 uniforms.uniforms_float4[30]
	#define c103 uniforms.uniforms_float4[31]
	#define c104 uniforms.uniforms_float4[32]
	#define c105 uniforms.uniforms_float4[33]
	#define c106 uniforms.uniforms_float4[34]
	#define c107 uniforms.uniforms_float4[35]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define v6 input.v6
	#define oC0 output.oC0
	r0 = (v5.xyzx * c13.zzzw) + c13.wwwz;
	r1.x = dot(r0, c73);
	r1.y = dot(r0, c74);
	r1.zw = (r1.xy * c0.xx) + c0.yy;
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
	r0.xy = (r2.xy * c0.zz) + r1.xy;
	r0.w = c13.w;
	r0 = float4(s8_texture.sample_compare(s8, (r0.xyz).xy, (r0.xyz).z, level(r0.w)));
	r0.yzw = -c89.xyz + v5.xyz;
	r0.y = dot(r0.yzw, r0.yzw);
	r0.y = clamp((r0.y * c68.y) + c68.x, 0.0, 1.0);
	r1.x = mix(r0.x, c13.z, r0.y);
	r0.xyz = c21.xyz + -v5.xyz;
	r2.xyz = normalize(r0.xyz);
	r0.xyz = c3.xyz + -v5.xyz;
	r0.w = dot(r0.xyz, r0.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r1.yzw = r0.www * r0.xyz;
	r2.w = clamp(dot(r1.yzw, r2.xyz), 0.0, 1.0);
	r3 = s1_texture.sample(s1, v0.xy);
	r3.xyz = (r3.xyz * c13.xxx) + c13.yyy;
	r4.x = dot(v2.xyz, r3.xyz);
	r4.y = dot(v3.xyz, r3.xyz);
	r4.z = dot(v4.xyz, r3.xyz);
	r3.xyz = normalize(r4.xyz);
	r4.x = dot(r1.yzw, r3.xyz);
	r5.z = clamp(r4.x, 0.0, 1.0);
	r4.x = r4.x + r4.x;
	r4.y = r5.z * r5.z;
	r6.w = r4.y * r4.y;
	r7 = s3_texture.sample(s3, v0.xy);
	r4.y = -r7.w + c13.z;
	r4.z = r6.w * r4.y;
	r8.xyz = r4.zzz * v6.xyz;
	r6.xyz = r8.xyz * c2.www;
	r6 = ((-r4.y >= 0.0) ? c13.wwww : r6);
	r2.w = r2.w * r6.w;
	r8.xyz = (r0.xyz * r0.www) + r2.xyz;
	r2.x = clamp(dot(r3.xyz, r2.xyz), 0.0, 1.0);
	r9.xyz = normalize(r8.xyz);
	r5.y = clamp(dot(r3.xyz, r9.xyz), 0.0, 1.0);
	r8 = s10_texture.sample(s10, v0.xy);
	r5.w = r8.w;
	r9 = s7_texture.sample(s7, r5.yw);
	r2.y = r2.x * r5.y;
	r10.xyz = (r2.www * c2.www) + -r9.xyz;
	r10.xyz = (r4.yyy * r10.xyz) + r9.xyz;
	r9.xyz = ((-r4.y >= 0.0) ? r9.xyz : r10.xyz);
	r2.z = ((r2.x == 0.0) ? FLT_MAX : rsqrt(abs(r2.x)));
	r2.x = (r2.x * r2.x) + r2.x;
	r2.x = r2.x * c0.z;
	r2.z = ((r2.z == 0.0) ? FLT_MAX : 1.0 / r2.z);
	r9.xyz = r2.zzz * r9.xyz;
	r10.xyz = c20.xyz * v1.xxx;
	r9.xyz = r9.xyz * r10.xyz;
	r6.xyz = (r9.xyz * r1.xxx) + r6.xyz;
	r9.xyz = c23.xyz + -v5.xyz;
	r11.xyz = normalize(r9.xyz);
	r2.w = clamp(dot(r1.yzw, r11.xyz), 0.0, 1.0);
	r2.w = r2.w * r6.w;
	r9.xyz = (r0.xyz * r0.www) + r11.xyz;
	r4.z = clamp(dot(r3.xyz, r11.xyz), 0.0, 1.0);
	r11.xyz = normalize(r9.xyz);
	r5.x = clamp(dot(r3.xyz, r11.xyz), 0.0, 1.0);
	r9 = s7_texture.sample(s7, r5.xw);
	r4.w = r4.z * r5.x;
	r11.xyz = (r2.www * c2.www) + -r9.xyz;
	r11.xyz = (r4.yyy * r11.xyz) + r9.xyz;
	r9.xyz = ((-r4.y >= 0.0) ? r9.xyz : r11.xyz);
	r2.w = ((r4.z == 0.0) ? FLT_MAX : rsqrt(abs(r4.z)));
	r4.z = (r4.z * r4.z) + r4.z;
	r2.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r9.xyz = r2.www * r9.xyz;
	r11.xyz = c22.xyz * v1.yyy;
	r6.xyz = (r9.xyz * r11.xyz) + r6.xyz;
	r9.xyz = c25.xyz + -v5.xyz;
	r12.xyz = normalize(r9.xyz);
	r5.x = clamp(dot(r1.yzw, r12.xyz), 0.0, 1.0);
	r5.x = r5.x * r6.w;
	r0.xyz = (r0.xyz * r0.www) + r12.xyz;
	r5.y = clamp(dot(r3.xyz, r12.xyz), 0.0, 1.0);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = clamp((r0.w * c19.w) + c19.x, 0.0, 1.0);
	r6.w = min(r0.w, c19.z);
	r0.w = r6.w * r6.w;
	r9.xyz = normalize(r0.xyz);
	r0.x = clamp(dot(r3.xyz, r9.xyz), 0.0, 1.0);
	r0.y = r5.w;
	r9 = s4_texture.sample(s4, r5.zw);
	r0.z = -r5.z + c13.z;
	r5.z = pow(abs(r0.z), c105.x);
	r0.z = mix(r9.y, c13.z, r4.y);
	r9 = s7_texture.sample(s7, r0.xy);
	r0.x = r5.y * r0.x;
	r0.x = r5.z * r0.x;
	r12.xyz = (r5.xxx * c2.www) + -r9.xyz;
	r12.xyz = (r4.yyy * r12.xyz) + r9.xyz;
	r9.xyz = ((-r4.y >= 0.0) ? r9.xyz : r12.xyz);
	r0.y = ((r5.y == 0.0) ? FLT_MAX : rsqrt(abs(r5.y)));
	r4.y = (r5.y * r5.y) + r5.y;
	r4.yz = r4.yz * c0.zz;
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r5.xyw = r0.yyy * r9.xyz;
	r0.x = r0.y * r0.x;
	r9.xyz = c24.xyz * v1.zzz;
	r5.xyw = (r5.xyw * r9.xyz) + r6.xyz;
	r5.xyw = r3.www * r5.xyw;
	r6.x = ((r3.x >= 0.0) ? c13.w : c13.z);
	r6.y = ((r3.y >= 0.0) ? c13.w : c13.z);
	r6.z = ((r3.z >= 0.0) ? c13.w : c13.z);
	r12.xyz = r3.xyz * r3.xyz;
	r6.xyz = r6.xyz * r12.xyz;
	r13.xyz = r6.xxx * c5.xyz;
	r14.x = ((r3.x >= 0.0) ? c13.z : c13.w);
	r14.y = ((r3.y >= 0.0) ? c13.z : c13.w);
	r14.z = ((r3.z >= 0.0) ? c13.z : c13.w);
	r12.xyz = r12.xyz * r14.xyz;
	r13.xyz = (r12.xxx * c4.xyz) + r13.xyz;
	r12.xyw = (r12.yyy * c6.xyz) + r13.xyz;
	r6.xyw = (r6.yyy * c7.xyz) + r12.xyw;
	r6.xyw = (r12.zzz * c8.xyz) + r6.xyw;
	r6.xyz = (r6.zzz * c9.xyz) + r6.xyw;
	r12.xyz = r2.xxx * r10.xyz;
	r6.xyz = (r12.xyz * r1.xxx) + r6.xyz;
	r6.xyz = (r11.xyz * r4.zzz) + r6.xyz;
	r6.xyz = (r9.xyz * r4.yyy) + r6.xyz;
	r12.xyz = r6.xyz + v6.xyz;
	r13.xyz = r12.xyz + -c103.xxx;
	r13.xyz = clamp(r13.xyz * c103.yyy, float3(0.0), float3(1.0));
	r0.y = dot(r3.xyz, r3.xyz);
	r1.yzw = r1.yzw * r0.yyy;
	r1.yzw = (r4.xxx * r3.xyz) + -r1.yzw;
	r3 = s6_texture.sample(s6, r1.yzw);
	r1.yzw = r3.xyz * c30.zzz;
	r4.xyz = r1.yzw * r1.yzw;
	r4.xyz = r4.xyz * r4.xyz;
	r0.y = dot(r4.xyz, c16.xyz);
	r2.x = r0.y + c16.w;
	r0.y = ((r0.y == 0.0) ? FLT_MAX : 1.0 / r0.y);
	r0.y = ((r2.x >= 0.0) ? r0.y : c15.x);
	r2.x = dot(r1.yzw, c16.xyz);
	r4.xyz = r2.xxx * r4.xyz;
	r3.xyz = (c30.zzz * -r3.xyz) + r2.xxx;
	r3.xyz = (-c103.www * r3.xyz) + r1.yzw;
	r4.xyz = (r4.xyz * r0.yyy) + -r1.yzw;
	r4.xyz = (c103.www * r4.xyz) + r1.yzw;
	r3.xyz = ((c103.w >= 0.0) ? r4.xyz : r3.xyz);
	r0.y = abs(c103.w);
	r1.yzw = ((-r0.y >= 0.0) ? r1.yzw : r3.xyz);
	r3.xyz = (r1.yzw * r13.xyz) + -r1.yzw;
	r0.y = r7.z * c101.x;
	r2.x = r7.x * c12.w;
	r2.x = (r2.x * c0.w) + c0.z;
	r2.x = fract(r2.x);
	r2.x = (r2.x * c2.x) + c2.y;
	r7.xy = float2(cos(r2.x), sin(r2.x));
	r1.yzw = (r0.yyy * r3.xyz) + r1.yzw;
	r3.xyz = (r1.yzw * r1.yzw) + -r1.yzw;
	r1.yzw = (c103.zzz * r3.xyz) + r1.yzw;
	r3 = s0_texture.sample(s0, v0.xy);
	r4.xyz = r3.www * c104.xyz;
	r1.yzw = r1.yzw * r4.xyz;
	r0.y = mix(c10.x, c10.y, r8.y);
	r1.yzw = (r5.xyw * r0.yyy) + r1.yzw;
	r1.yzw = r0.zzz * r1.yzw;
	r4.xyz = r3.zxy * c2.zzz;
	r4.xyz = (r3.zxy * c2.zzz) + -r4.zxy;
	r4.xyz = r7.yyy * r4.xyz;
	r4.xyz = (r3.xyz * r7.xxx) + r4.xyz;
	r0.y = -r7.x + c13.z;
	r0.z = dot(c2.zzz, r3.xyz);
	r0.z = r0.z * c2.z;
	r4.xyz = (r0.zzz * r0.yyy) + r4.xyz;
	r0.y = abs(c12.w);
	r3.xyz = ((-r0.y >= 0.0) ? r3.xyz : r4.xyz);
	r4.xyz = r3.xyz + c13.yyy;
	r4.xyz = (r8.yyy * r4.xyz) + c13.zzz;
	r1.yzw = r1.yzw * r4.xyz;
	r0.y = r2.y * r5.z;
	r0.z = r4.w * r5.z;
	r0.yz = r2.zw * r0.yz;
	r2.xyw = r11.xyz * r0.zzz;
	r4.xyz = r10.xyz * r0.yyy;
	r2.xyz = (r4.xyz * r1.xxx) + r2.xyw;
	r0.xyz = (r0.xxx * r9.xyz) + r2.xyz;
	r2.z = c13.z;
	r1.x = (v6.w * c11.w) + r2.z;
	r2.x = r8.x * c105.y;
	r1.x = r1.x * r2.x;
	r0.xyz = r0.xyz * r1.xxx;
	r1.x = r8.y * c101.w;
	r2.xyz = (r3.xyz * r1.xxx) + -c106.xyz;
	r1.x = clamp(r1.x, 0.0, 1.0);
	r2.xyz = (r1.xxx * r2.xyz) + c106.xyz;
	r4.xyz = (r0.xyz * r2.xyz) + r6.xyz;
	r1.x = dot(r4.xyz, c16.xyz);
	r1.x = r1.x + c15.y;
	r1.x = clamp(r1.x * c15.z, 0.0, 1.0);
	r2.w = (r1.x * c14.x) + c14.y;
	r1.x = r1.x * r1.x;
	r1.x = r1.x * r2.w;
	r2.w = dot(r3.xyz, c16.xyz);
	r4.xyz = r2.www * c102.xyz;
	r5.xyz = c16.xyz;
	r2.w = dot(c102.xyz, r5.xyz);
	r3.w = r2.w + c16.w;
	r2.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r2.w = ((r3.w >= 0.0) ? r2.w : c15.x);
	r4.xyz = (r4.xyz * r2.www) + -r3.xyz;
	r4.xyz = (c102.www * r4.xyz) + r3.xyz;
	r2.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r4.xyz = (r4.xyz * r2.www) + -r3.xyz;
	r3.xyz = (r1.xxx * r4.xyz) + r3.xyz;
	r3.xyz = r8.zzz * r3.xyz;
	r1.xyz = (r3.xyz * r12.xyz) + r1.yzw;
	r0.xyz = (r0.xyz * r2.xyz) + r1.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	oC0.xyz = (r0.www * r0.xyz) + r1.xyz;
	oC0.w = c1.w;
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
	#undef c19
	#undef c20
	#undef c21
	#undef c22
	#undef c23
	#undef c24
	#undef c25
	#undef c29
	#undef c30
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
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

