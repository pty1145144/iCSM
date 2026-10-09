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
	const float4 c2 = float4(-0.000488281, 0.000488281, 0.0, 0.062499999); (void) c2;
	const float4 c13 = float4(1.0, 0.0, 2.0, 0.000488281); (void) c13;
	const float4 c14 = float4(0.125, 0.25, -0.300000011, -3.333333253); (void) c14;
	const float4 c15 = float4(0.0, -1.0, -2.0, 3.0); (void) c15;
	const float4 c16 = float4(0.57735002, 1.0, 2.0, -1.0); (void) c16;
	const float4 c17 = float4(0.298999992, 0.587000012, 0.114, -0.000001); (void) c17;
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
	#define c19 uniforms.uniforms_float4[11]
	#define c20 uniforms.uniforms_float4[12]
	#define c21 uniforms.uniforms_float4[13]
	#define c30 uniforms.uniforms_float4[14]
	#define c67 uniforms.uniforms_float4[15]
	#define c68 uniforms.uniforms_float4[16]
	#define c69 uniforms.uniforms_float4[17]
	#define c70 uniforms.uniforms_float4[18]
	#define c71 uniforms.uniforms_float4[19]
	#define c73 uniforms.uniforms_float4[20]
	#define c74 uniforms.uniforms_float4[21]
	#define c77 uniforms.uniforms_float4[22]
	#define c78 uniforms.uniforms_float4[23]
	#define c81 uniforms.uniforms_float4[24]
	#define c82 uniforms.uniforms_float4[25]
	#define c85 uniforms.uniforms_float4[26]
	#define c86 uniforms.uniforms_float4[27]
	#define c87 uniforms.uniforms_float4[28]
	#define c88 uniforms.uniforms_float4[29]
	#define c89 uniforms.uniforms_float4[30]
	#define c101 uniforms.uniforms_float4[31]
	#define c102 uniforms.uniforms_float4[32]
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
	r0 = s0_texture.sample(s0, v0.xy);
	r1 = s10_texture.sample(s10, v0.xy);
	r2 = s1_texture.sample(s1, v0.xy);
	r0.w = abs(c12.w);
	r3.xy = c0.xy;
	r3.x = (c12.w * r3.x) + r3.y;
	r3.x = fract(r3.x);
	r3.x = (r3.x * c0.z) + c0.w;
	r4.xy = float2(cos(r3.x), sin(r3.x));
	r3.xyz = r0.zxy * c16.xxx;
	r3.xyz = (r0.zxy * c16.xxx) + -r3.zxy;
	r3.xyz = r4.yyy * r3.xyz;
	r3.xyz = (r0.xyz * r4.xxx) + r3.xyz;
	r3.w = dot(c16.xxx, r0.xyz);
	r3.w = r3.w * c16.x;
	r4.x = -r4.x + c16.y;
	r3.xyz = (r3.www * r4.xxx) + r3.xyz;
	r0.xyz = ((-r0.w >= 0.0) ? r0.xyz : r3.xyz);
	r2.xyz = (r2.xyz * c16.zzz) + c16.www;
	r3.x = dot(v2.xyz, r2.xyz);
	r3.y = dot(v3.xyz, r2.xyz);
	r3.z = dot(v4.xyz, r2.xyz);
	r2.xyz = normalize(r3.xyz);
	r3.xyz = c3.xyz + -v5.xyz;
	r0.w = dot(r3.xyz, r3.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r4.xyz = r0.www * r3.xyz;
	r3.w = clamp(dot(r2.xyz, r4.xyz), 0.0, 1.0);
	r3.w = -r3.w + c16.y;
	r4.x = r3.w * r3.w;
	r4.y = (r3.w * -r3.w) + c0.y;
	r4.z = r4.x + r4.x;
	r4.x = (r4.x * c16.z) + c16.w;
	r4.w = -c12.x + c12.y;
	r5.x = mix(c12.y, c12.z, r4.x);
	r4.x = (r4.z * r4.w) + c12.x;
	r4.x = ((r4.y >= 0.0) ? r4.x : r5.x);
	r5 = (v5.xyzx * c13.xxxy) + c13.yyyx;
	r6.x = dot(r5, c69);
	r6.y = dot(r5, c70);
	r4.yz = clamp(r6.xy, float2(0.0), float2(1.0));
	r4.yz = -r6.xy + r4.yz;
	r4.y = dot(r4.yz, c13.xx) + c13.y;
	r7.x = dot(r5, c73);
	r7.y = dot(r5, c74);
	r4.zw = clamp(r7.xy, float2(0.0), float2(1.0));
	r4.zw = -r7.xy + r4.zw;
	r4.z = dot(r4.zw, c13.xx) + c13.y;
	r8.x = dot(r5, c77);
	r8.y = dot(r5, c78);
	r7.z = c16.y;
	r8.z = c16.z;
	r7.xyz = ((-abs(r4.z) >= 0.0) ? r7.xyz : r8.xyz);
	r6.zw = c13.yy;
	r4.yzw = ((-abs(r4.y) >= 0.0) ? r6.xyz : r7.xyz);
	r6.z = dot(r5, c71);
	r7.xy = r4.yz + -c0.yy;
	r7.xy = abs(r7.xy) + -c67.zz;
	r7.xy = clamp(r7.xy * c67.ww, float2(0.0), float2(1.0));
	r7.xy = -r7.xy + c16.yy;
	r7.x = r7.y * r7.x;
	r4.yz = clamp(r4.yz, float2(0.0), float2(1.0));
	r7.yzw = r4.www + -c13.yxz;
	r8.y = c13.y;
	r9 = ((-abs(r7.y) >= 0.0) ? c85.zwxy : r8.yyyy);
	r9 = ((-abs(r7.z) >= 0.0) ? c86.zwxy : r9);
	r9 = ((-abs(r7.w) >= 0.0) ? c87.zwxy : r9);
	r6.xy = (r4.yz * r9.xy) + r9.zw;
	r9 = r6 + c13.wwyy;
	r9 = float4(s8_texture.sample_compare(s8, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
	r10 = r6 + c2.xyzz;
	r10 = float4(s8_texture.sample_compare(s8, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
	r11 = r6 + c2.yxzz;
	r11 = float4(s8_texture.sample_compare(s8, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
	r12 = r6 + c2.xxzz;
	r12 = float4(s8_texture.sample_compare(s8, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
	r9.y = r10.x;
	r9.z = r11.x;
	r9.w = r12.x;
	r4.y = dot(r9, c2.wwww);
	r9 = r6 + c13.wyyy;
	r9 = float4(s8_texture.sample_compare(s8, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
	r10 = r6 + c2.xzzz;
	r10 = float4(s8_texture.sample_compare(s8, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
	r11 = r6 + c2.zxzz;
	r11 = float4(s8_texture.sample_compare(s8, (r11.xyz).xy, (r11.xyz).z, level(r11.w)));
	r12 = r6 + c13.ywyy;
	r12 = float4(s8_texture.sample_compare(s8, (r12.xyz).xy, (r12.xyz).z, level(r12.w)));
	r9.y = r10.x;
	r9.z = r11.x;
	r9.w = r12.x;
	r4.z = dot(r9, c14.xxxx);
	r9 = float4(s8_texture.sample_compare(s8, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
	r4.y = r4.z + r4.y;
	r4.y = (r9.x * c14.y) + r4.y;
	if (r7.x < c16.y) {
		r7.yzw = r4.www + c15.xyz;
		r9 = ((-abs(r7.y) >= 0.0) ? c73 : r8.yyyy);
		r10 = ((-abs(r7.y) >= 0.0) ? c74 : r8.yyyy);
		r9 = ((-abs(r7.z) >= 0.0) ? c77 : r9);
		r10 = ((-abs(r7.z) >= 0.0) ? c78 : r10);
		r9 = ((-abs(r7.w) >= 0.0) ? c81 : r9);
		r10 = ((-abs(r7.w) >= 0.0) ? c82 : r10);
		r9.x = clamp(dot(r5, r9), 0.0, 1.0);
		r9.y = clamp(dot(r5, r10), 0.0, 1.0);
		r5 = ((-abs(r7.y) >= 0.0) ? c86.zwxy : r8.yyyy);
		r5 = ((-abs(r7.z) >= 0.0) ? c87.zwxy : r5);
		r5 = ((-abs(r7.w) >= 0.0) ? c88.zwxy : r5);
		r6.xy = (r9.xy * r5.xy) + r5.zw;
		r5 = r6 + c13.wwyy;
		r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
		r8 = r6 + c2.xyzz;
		r8 = float4(s8_texture.sample_compare(s8, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r9 = r6 + c2.yxzz;
		r9 = float4(s8_texture.sample_compare(s8, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
		r10 = r6 + c2.xxzz;
		r10 = float4(s8_texture.sample_compare(s8, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r5.y = r8.x;
		r5.z = r9.x;
		r5.w = r10.x;
		r4.z = dot(r5, c2.wwww);
		r5 = r6 + c13.wyyy;
		r5 = float4(s8_texture.sample_compare(s8, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
		r8 = r6 + c2.xzzz;
		r8 = float4(s8_texture.sample_compare(s8, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r9 = r6 + c2.zxzz;
		r9 = float4(s8_texture.sample_compare(s8, (r9.xyz).xy, (r9.xyz).z, level(r9.w)));
		r10 = r6 + c13.ywyy;
		r10 = float4(s8_texture.sample_compare(s8, (r10.xyz).xy, (r10.xyz).z, level(r10.w)));
		r5.y = r8.x;
		r5.z = r9.x;
		r5.w = r10.x;
		r4.w = dot(r5, c14.xxxx);
		r5 = float4(s8_texture.sample_compare(s8, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
		r4.z = r4.w + r4.z;
		r4.z = (r5.x * c14.y) + r4.z;
		r4.z = ((r7.w >= 0.0) ? c16.y : r4.z);
		r5.x = mix(r4.z, r4.y, r7.x);
		r4.y = r5.x;
	}
	r5.xyz = -c89.xyz + v5.xyz;
	r4.z = dot(r5.xyz, r5.xyz);
	r4.z = clamp((r4.z * c68.y) + c68.x, 0.0, 1.0);
	r5.x = mix(r4.y, c16.y, r4.z);
	r4.yzw = r2.xyz * r2.xyz;
	r5.y = ((r2.x >= 0.0) ? c13.y : c13.x);
	r5.z = ((r2.y >= 0.0) ? c13.y : c13.x);
	r5.w = ((r2.z >= 0.0) ? c13.y : c13.x);
	r6.x = ((r2.x >= 0.0) ? c13.x : c13.y);
	r6.y = ((r2.y >= 0.0) ? c13.x : c13.y);
	r6.z = ((r2.z >= 0.0) ? c13.x : c13.y);
	r5.yzw = r4.yzw * r5.yzw;
	r4.yzw = r4.yzw * r6.xyz;
	r6.xyz = r5.yyy * c5.xyz;
	r6.xyz = (r4.yyy * c4.xyz) + r6.xyz;
	r6.xyz = (r4.zzz * c6.xyz) + r6.xyz;
	r6.xyz = (r5.zzz * c7.xyz) + r6.xyz;
	r4.yzw = (r4.www * c8.xyz) + r6.xyz;
	r4.yzw = (r5.www * c9.xyz) + r4.yzw;
	r5.yzw = c21.xyz + -v5.xyz;
	r6.xyz = normalize(r5.yzw);
	r5.yzw = c20.xyz * v1.xxx;
	r6.w = clamp(dot(r2.xyz, r6.xyz), 0.0, 1.0);
	r7.x = (r6.w * r6.w) + r6.w;
	r7.x = r7.x * c0.y;
	r7.xyz = r5.yzw * r7.xxx;
	r4.yzw = (r7.xyz * r5.xxx) + r4.yzw;
	r3.xyz = (r3.xyz * r0.www) + r6.xyz;
	r6.xyz = normalize(r3.xyz);
	r2.x = clamp(dot(r2.xyz, r6.xyz), 0.0, 1.0);
	r2.y = r1.w;
	r7 = s7_texture.sample(s7, r2.xy);
	r0.w = ((r6.w == 0.0) ? FLT_MAX : rsqrt(abs(r6.w)));
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r3.xyz = r0.www * r7.xyz;
	r3.xyz = r5.yzw * r3.xyz;
	r1.w = r6.w * r2.x;
	r2.x = pow(abs(r3.w), c105.x);
	r1.w = r1.w * r2.x;
	r0.w = r0.w * r1.w;
	r2.xyz = r5.yzw * r0.www;
	r3.xyz = r5.xxx * r3.xyz;
	r2.xyz = r5.xxx * r2.xyz;
	r0.w = r1.x * c105.y;
	r5.y = c16.y;
	r1.x = (v6.w * c11.w) + r5.y;
	r0.w = r0.w * r1.x;
	r2.xyz = r0.www * r2.xyz;
	r3.xyz = r2.www * r3.xyz;
	r0.w = mix(c10.x, c10.y, r1.y);
	r3.xyz = r0.www * r3.xyz;
	r3.xyz = r4.xxx * r3.xyz;
	r5.xyz = r0.xyz + c16.www;
	r5.xyz = (r1.yyy * r5.xyz) + c16.yyy;
	r3.xyz = r3.xyz * r5.xyz;
	r0.w = r1.y * c101.w;
	r1.x = clamp(r0.w, 0.0, 1.0);
	r5.xyz = (r0.xyz * r0.www) + -c106.xyz;
	r1.xyw = (r1.xxx * r5.xyz) + c106.xyz;
	r0.w = clamp(c107.w + v6.w, 0.0, 1.0);
	r5.xyz = (r2.xyz * r1.xyw) + r4.yzw;
	r2.w = dot(r5.xyz, c17.xyz);
	r2.w = r2.w + c14.z;
	r2.w = clamp(r2.w * c14.w, 0.0, 1.0);
	r3.w = (r2.w * c15.z) + c15.w;
	r2.w = r2.w * r2.w;
	r2.w = r2.w * r3.w;
	r3.w = dot(r0.xyz, c17.xyz);
	r5.xyz = c17.xyz;
	r4.x = dot(c102.xyz, r5.xyz);
	r5.x = r4.x + c17.w;
	r5.yzw = r3.www * c102.xyz;
	r3.w = ((r4.x == 0.0) ? FLT_MAX : 1.0 / r4.x);
	r3.w = ((r5.x >= 0.0) ? r3.w : c18.x);
	r5.xyz = (r5.yzw * r3.www) + -r0.xyz;
	r5.xyz = (c102.www * r5.xyz) + r0.xyz;
	r5.xyz = (r5.xyz * r0.www) + -r0.xyz;
	r0.xyz = (r2.www * r5.xyz) + r0.xyz;
	r4.xyz = r4.yzw + v6.xyz;
	r0.xyz = r1.zzz * r0.xyz;
	r0.xyz = (r0.xyz * r4.xyz) + r3.xyz;
	r0.xyz = (r2.xyz * r1.xyw) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	r0.w = c19.y + -v5.z;
	r0.w = r0.w + -c16.z;
	oC0.w = clamp(r0.w * c19.w, 0.0, 1.0);
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
	#undef c19
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

