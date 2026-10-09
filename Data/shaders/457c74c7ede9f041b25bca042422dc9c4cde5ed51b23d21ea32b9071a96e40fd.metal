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
	const float4 c0 = float4(0.159154935, 0.5, 6.283185478, -3.141592739); (void) c0;
	const float4 c2 = float4(1.0, 0.0, 2.0, 0.000488281); (void) c2;
	const float4 c13 = float4(-0.000488281, 0.000488281, 0.0, 0.062499999); (void) c13;
	const float4 c14 = float4(0.125, 0.25, -0.300000011, -3.333333253); (void) c14;
	const float4 c15 = float4(0.0, -1.0, -2.0, 3.0); (void) c15;
	const float4 c16 = float4(0.298999992, 0.587000012, 0.114, -0.000001); (void) c16;
	const float4 c17 = float4(0.57735002, 1.0, 2.0, -1.0); (void) c17;
	const float4 c18 = float4(1000000.0, 0.0, 0.0, 0.0); (void) c18;
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
	#define c20 uniforms.uniforms_float4[11]
	#define c21 uniforms.uniforms_float4[12]
	#define c30 uniforms.uniforms_float4[13]
	#define c67 uniforms.uniforms_float4[14]
	#define c68 uniforms.uniforms_float4[15]
	#define c69 uniforms.uniforms_float4[16]
	#define c70 uniforms.uniforms_float4[17]
	#define c71 uniforms.uniforms_float4[18]
	#define c73 uniforms.uniforms_float4[19]
	#define c74 uniforms.uniforms_float4[20]
	#define c77 uniforms.uniforms_float4[21]
	#define c78 uniforms.uniforms_float4[22]
	#define c81 uniforms.uniforms_float4[23]
	#define c82 uniforms.uniforms_float4[24]
	#define c85 uniforms.uniforms_float4[25]
	#define c86 uniforms.uniforms_float4[26]
	#define c87 uniforms.uniforms_float4[27]
	#define c88 uniforms.uniforms_float4[28]
	#define c89 uniforms.uniforms_float4[29]
	#define c101 uniforms.uniforms_float4[30]
	#define c102 uniforms.uniforms_float4[31]
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
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	r1 = s10_texture.sample(s10, v0.xy);
	r2 = s1_texture.sample(s1, v0.xy);
	r3.x = abs(c12.w);
	r4.xy = c0.xy;
	r3.y = (c12.w * r4.x) + r4.y;
	r3.y = fract(r3.y);
	r3.y = (r3.y * c0.z) + c0.w;
	r4.xy = float2(cos(r3.y), sin(r3.y));
	r3.yzw = r0.zxy * c17.xxx;
	r3.yzw = (r0.zxy * c17.xxx) + -r3.wyz;
	r3.yzw = r4.yyy * r3.yzw;
	r3.yzw = (r0.xyz * r4.xxx) + r3.yzw;
	r4.y = dot(c17.xxx, r0.xyz);
	r4.y = r4.y * c17.x;
	r4.x = -r4.x + c17.y;
	r3.yzw = (r4.yyy * r4.xxx) + r3.yzw;
	r0.xyz = ((-r3.x >= 0.0) ? r0.xyz : r3.yzw);
	r2.xyz = (r2.xyz * c17.zzz) + c17.www;
	r3.x = dot(v2.xyz, r2.xyz);
	r3.y = dot(v3.xyz, r2.xyz);
	r3.z = dot(v4.xyz, r2.xyz);
	r2.xyz = normalize(r3.xyz);
	r3.xyz = c3.xyz + -v5.xyz;
	r3.w = dot(r3.xyz, r3.xyz);
	r3.w = ((r3.w == 0.0) ? FLT_MAX : rsqrt(abs(r3.w)));
	r4.xyz = r3.www * r3.xyz;
	r4.x = clamp(dot(r2.xyz, r4.xyz), 0.0, 1.0);
	r4.x = -r4.x + c17.y;
	r4.y = r4.x * r4.x;
	r4.z = (r4.x * -r4.x) + c0.y;
	r4.w = r4.y + r4.y;
	r4.y = (r4.y * c17.z) + c17.w;
	r5.x = -c12.x + c12.y;
	r5.y = mix(c12.y, c12.z, r4.y);
	r4.y = (r4.w * r5.x) + c12.x;
	r4.y = ((r4.z >= 0.0) ? r4.y : r5.y);
	r5 = (v5.xyzx * c2.xxxy) + c2.yyyx;
	r6.x = dot(r5, c69);
	r6.y = dot(r5, c70);
	r4.zw = clamp(r6.xy, float2(0.0), float2(1.0));
	r4.zw = -r6.xy + r4.zw;
	r4.z = dot(r4.zw, c2.xx) + c2.y;
	r7.x = dot(r5, c73);
	r7.y = dot(r5, c74);
	r8.xy = clamp(r7.xy, float2(0.0), float2(1.0));
	r8.xy = -r7.xy + r8.xy;
	r4.w = dot(r8.xy, c2.xx) + c2.y;
	r8.x = dot(r5, c77);
	r8.y = dot(r5, c78);
	r7.z = c17.y;
	r8.z = c17.z;
	r7.xyz = ((-abs(r4.w) >= 0.0) ? r7.xyz : r8.xyz);
	r6.z = c2.y;
	r6.xyz = ((-abs(r4.z) >= 0.0) ? r6.xyz : r7.xyz);
	r7.z = dot(r5, c71);
	r4.zw = r6.xy + -c0.yy;
	r4.zw = abs(r4.zw) + -c67.zz;
	r4.zw = clamp(r4.zw * c67.ww, float2(0.0), float2(1.0));
	r4.zw = -r4.zw + c17.yy;
	r4.z = r4.w * r4.z;
	r6.xy = clamp(r6.xy, float2(0.0), float2(1.0));
	r8.xyz = r6.zzz + -c2.yxz;
	r9.y = c2.y;
	r10 = ((-abs(r8.x) >= 0.0) ? c85.zwxy : r9.yyyy);
	r10 = ((-abs(r8.y) >= 0.0) ? c86.zwxy : r10);
	r8 = ((-abs(r8.z) >= 0.0) ? c87.zwxy : r10);
	r7.xy = (r6.xy * r8.xy) + r8.zw;
	r7.w = c2.y;
	r8 = r7 + c2.wwyy;
	r8 = float4(s8_texture.sample_compare(s8, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
	r10 = r7 + c13.xyzz;
	r10 = float4(s8_texture.sample_compare(s8, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
	r11 = r7 + c13.yxzz;
	r11 = float4(s8_texture.sample_compare(s8, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
	r12 = r7 + c13.xxzz;
	r12 = float4(s8_texture.sample_compare(s8, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
	r8.y = r10.x;
	r8.z = r11.x;
	r8.w = r12.x;
	r4.w = dot(r8, c13.wwww);
	r8 = r7 + c2.wyyy;
	r8 = float4(s8_texture.sample_compare(s8, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
	r10 = r7 + c13.xzzz;
	r10 = float4(s8_texture.sample_compare(s8, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
	r11 = r7 + c13.zxzz;
	r11 = float4(s8_texture.sample_compare(s8, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
	r12 = r7 + c2.ywyy;
	r12 = float4(s8_texture.sample_compare(s8, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
	r8.y = r10.x;
	r8.z = r11.x;
	r8.w = r12.x;
	r6.x = dot(r8, c14.xxxx);
	r8 = float4(s8_texture.sample_compare(s8, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
	r4.w = r4.w + r6.x;
	r4.w = (r8.x * c14.y) + r4.w;
	if (r4.z < c17.y) {
		r6.xyz = r6.zzz + c15.xyz;
		r8 = ((-abs(r6.x) >= 0.0) ? c73 : r9.yyyy);
		r10 = ((-abs(r6.x) >= 0.0) ? c74 : r9.yyyy);
		r8 = ((-abs(r6.y) >= 0.0) ? c77 : r8);
		r10 = ((-abs(r6.y) >= 0.0) ? c78 : r10);
		r8 = ((-abs(r6.z) >= 0.0) ? c81 : r8);
		r10 = ((-abs(r6.z) >= 0.0) ? c82 : r10);
		r8.x = clamp(dot(r5, r8), 0.0, 1.0);
		r8.y = clamp(dot(r5, r10), 0.0, 1.0);
		r5 = ((-abs(r6.x) >= 0.0) ? c86.zwxy : r9.yyyy);
		r5 = ((-abs(r6.y) >= 0.0) ? c87.zwxy : r5);
		r5 = ((-abs(r6.z) >= 0.0) ? c88.zwxy : r5);
		r7.xy = (r8.xy * r5.xy) + r5.zw;
		r5 = r7 + c2.wwyy;
		r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
		r8 = r7 + c13.xyzz;
		r8 = float4(s8_texture.sample_compare(s8, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r9 = r7 + c13.yxzz;
		r9 = float4(s8_texture.sample_compare(s8, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
		r10 = r7 + c13.xxzz;
		r10 = float4(s8_texture.sample_compare(s8, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r5.y = r8.x;
		r5.z = r9.x;
		r5.w = r10.x;
		r5.x = dot(r5, c13.wwww);
		r8 = r7 + c2.wyyy;
		r8 = float4(s8_texture.sample_compare(s8, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r9 = r7 + c13.xzzz;
		r9 = float4(s8_texture.sample_compare(s8, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
		r10 = r7 + c13.zxzz;
		r10 = float4(s8_texture.sample_compare(s8, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r11 = r7 + c2.ywyy;
		r11 = float4(s8_texture.sample_compare(s8, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
		r8.y = r9.x;
		r8.z = r10.x;
		r8.w = r11.x;
		r5.y = dot(r8, c14.xxxx);
		r7 = float4(s8_texture.sample_compare(s8, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
		r5.x = r5.y + r5.x;
		r5.x = (r7.x * c14.y) + r5.x;
		r5.x = ((r6.z >= 0.0) ? c17.y : r5.x);
		r6.x = mix(r5.x, r4.w, r4.z);
		r4.w = r6.x;
	}
	r5.xyz = -c89.xyz + v5.xyz;
	r4.z = dot(r5.xyz, r5.xyz);
	r4.z = clamp((r4.z * c68.y) + c68.x, 0.0, 1.0);
	r5.x = mix(r4.w, c17.y, r4.z);
	r5.yzw = r2.xyz * r2.xyz;
	r6.x = ((r2.x >= 0.0) ? c2.y : c2.x);
	r6.y = ((r2.y >= 0.0) ? c2.y : c2.x);
	r6.z = ((r2.z >= 0.0) ? c2.y : c2.x);
	r7.x = ((r2.x >= 0.0) ? c2.x : c2.y);
	r7.y = ((r2.y >= 0.0) ? c2.x : c2.y);
	r7.z = ((r2.z >= 0.0) ? c2.x : c2.y);
	r6.xyz = r5.yzw * r6.xyz;
	r5.yzw = r5.yzw * r7.xyz;
	r7.xyz = r6.xxx * c5.xyz;
	r7.xyz = (r5.yyy * c4.xyz) + r7.xyz;
	r7.xyz = (r5.zzz * c6.xyz) + r7.xyz;
	r6.xyw = (r6.yyy * c7.xyz) + r7.xyz;
	r5.yzw = (r5.www * c8.xyz) + r6.xyw;
	r5.yzw = (r6.zzz * c9.xyz) + r5.yzw;
	r6.xyz = c21.xyz + -v5.xyz;
	r7.xyz = normalize(r6.xyz);
	r6.xyz = c20.xyz * v1.xxx;
	r4.z = clamp(dot(r2.xyz, r7.xyz), 0.0, 1.0);
	r4.w = (r4.z * r4.z) + r4.z;
	r4.w = r4.w * c0.y;
	r8.xyz = r4.www * r6.xyz;
	r5.yzw = (r8.xyz * r5.xxx) + r5.yzw;
	r3.xyz = (r3.xyz * r3.www) + r7.xyz;
	r7.xyz = normalize(r3.xyz);
	r2.x = clamp(dot(r2.xyz, r7.xyz), 0.0, 1.0);
	r2.y = r1.w;
	r3 = s7_texture.sample(s7, r2.xy);
	r1.w = ((r4.z == 0.0) ? FLT_MAX : rsqrt(abs(r4.z)));
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r3.xyz = r1.www * r3.xyz;
	r3.xyz = r6.xyz * r3.xyz;
	r2.x = r4.z * r2.x;
	r2.y = pow(abs(r4.x), c105.x);
	r2.x = r2.y * r2.x;
	r1.w = r1.w * r2.x;
	r2.xyz = r6.xyz * r1.www;
	r3.xyz = r5.xxx * r3.xyz;
	r2.xyz = r5.xxx * r2.xyz;
	r1.x = r1.x * c105.y;
	r6.y = c17.y;
	r1.w = (v6.w * c11.w) + r6.y;
	r1.x = r1.w * r1.x;
	r2.xyz = r1.xxx * r2.xyz;
	r3.xyz = r2.www * r3.xyz;
	r2.w = mix(c10.x, c10.y, r1.y);
	r3.xyz = r2.www * r3.xyz;
	r3.xyz = r4.yyy * r3.xyz;
	r4.xyz = r0.xyz + c17.www;
	r4.xyz = (r1.yyy * r4.xyz) + c17.yyy;
	r3.xyz = r3.xyz * r4.xyz;
	r1.x = r1.y * c101.w;
	r1.y = clamp(r1.x, 0.0, 1.0);
	r4.xyz = (r0.xyz * r1.xxx) + -c106.xyz;
	r1.xyw = (r1.yyy * r4.xyz) + c106.xyz;
	r2.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r4.xyz = (r2.xyz * r1.xyw) + r5.yzw;
	r3.w = dot(r4.xyz, c16.xyz);
	r3.w = r3.w + c14.z;
	r3.w = clamp(r3.w * c14.w, 0.0, 1.0);
	r4.x = (r3.w * c15.z) + c15.w;
	r3.w = r3.w * r3.w;
	r3.w = r3.w * r4.x;
	r4.x = dot(r0.xyz, c16.xyz);
	r6.xyz = c16.xyz;
	r4.y = dot(c102.xyz, r6.xyz);
	r4.z = r4.y + c16.w;
	r6.xyz = r4.xxx * c102.xyz;
	r4.x = ((r4.y == 0.0) ? FLT_MAX : 1.0 / r4.y);
	r4.x = ((r4.z >= 0.0) ? r4.x : c18.x);
	r4.xyz = (r6.xyz * r4.xxx) + -r0.xyz;
	r4.xyz = (c102.www * r4.xyz) + r0.xyz;
	r4.xyz = (r4.xyz * r2.www) + -r0.xyz;
	r0.xyz = (r3.www * r4.xyz) + r0.xyz;
	r4.xyz = r5.yzw + v6.xyz;
	r0.xyz = r1.zzz * r0.xyz;
	r0.xyz = (r0.xyz * r4.xyz) + r3.xyz;
	r0.xyz = (r2.xyz * r1.xyw) + r0.xyz;
	oC0.w = r0.w * c1.w;
	r0.xyz = r0.xyz * c1.xyz;
	oC0.xyz = r0.xyz * c30.xxx;
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
	#undef c20
	#undef c21
	#undef c30
	#undef c67
	#undef c68
	#undef c69
	#undef c70
	#undef c71
	#undef c73
	#undef c74
	#undef c77
	#undef c78
	#undef c81
	#undef c82
	#undef c85
	#undef c86
	#undef c87
	#undef c88
	#undef c89
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
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

