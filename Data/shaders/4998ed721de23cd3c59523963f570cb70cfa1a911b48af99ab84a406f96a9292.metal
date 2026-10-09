#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[27];
	bool uniforms_bool[1];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord2)]];
	float4 v2 [[user(texcoord3)]];
	float4 v3 [[user(texcoord4)]];
	float4 v4 [[user(texcoord6)]];
	float4 v5 [[user(texcoord7)]];
};

struct source_main_Output
{
	float4 oC0 [[color(0)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	texture2d<float> s0_texture [[texture(0)]],
	sampler s0 [[sampler(0)]],
	texturecube<float> s1_texture [[texture(1)]],
	sampler s1 [[sampler(1)]],
	depth2d<float> s15_texture [[texture(15)]],
	sampler s15 [[sampler(15)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c2 = float4(1.000000000e+00, 0.000000000e+00, 1.041666627e+00, -2.083333395e-02); (void) c2;
	const float4 c4 = float4(5.000000000e-01, 4.882812500e-04, 0.000000000e+00, -4.882812500e-04); (void) c4;
	const float4 c5 = float4(6.250000000e-02, 1.250000000e-01, 2.500000000e-01, -2.000000000e+00); (void) c5;
	const float4 c6 = float4(2.125000060e-01, 7.153999805e-01, 7.209999859e-02, 0.000000000e+00); (void) c6;
	const float4 c7 = float4(-2.000000000e+00, 3.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c7;
	const float4 c8 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, 0.000000000e+00); (void) c8;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	float4 r7;
	float4 r8;
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c3 uniforms.uniforms_float4[2]
	#define c12 uniforms.uniforms_float4[3]
	#define c13 uniforms.uniforms_float4[4]
	#define c19 uniforms.uniforms_float4[5]
	#define c20 uniforms.uniforms_float4[6]
	#define c21 uniforms.uniforms_float4[7]
	#define c29 uniforms.uniforms_float4[8]
	#define c30 uniforms.uniforms_float4[9]
	#define c43 uniforms.uniforms_float4[10]
	#define c44 uniforms.uniforms_float4[11]
	#define c45 uniforms.uniforms_float4[12]
	#define c46 uniforms.uniforms_float4[13]
	#define c67 uniforms.uniforms_float4[14]
	#define c68 uniforms.uniforms_float4[15]
	#define c69 uniforms.uniforms_float4[16]
	#define c70 uniforms.uniforms_float4[17]
	#define c71 uniforms.uniforms_float4[18]
	#define c73 uniforms.uniforms_float4[19]
	#define c74 uniforms.uniforms_float4[20]
	#define c77 uniforms.uniforms_float4[21]
	#define c78 uniforms.uniforms_float4[22]
	#define c85 uniforms.uniforms_float4[23]
	#define c86 uniforms.uniforms_float4[24]
	#define c87 uniforms.uniforms_float4[25]
	#define c89 uniforms.uniforms_float4[26]
	#define b0 uniforms.uniforms_bool[0]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	r1.xyz = c20.xyz + -v2.xyz;
	r2.xyz = normalize(r1.xyz);
	r1.w = dot(v1.xyz, v1.xyz);
	r2.w = ((r1.w == 0.0) ? FLT_MAX : rsqrt(abs(r1.w)));
	r3.xyz = r2.www * v1.xyz;
	r2.x = clamp(dot(r3.xyz, r2.xyz), 0.0, 1.0);
	r2.x = -r2.x + c2.x;
	r3.x = pow(abs(r2.x), c13.z);
	r2.x = (c13.y * r3.x) + c13.x;
	if (b0) {
		r3 = (v2.xyzx * c2.xxxy) + c2.yyyx;
		r4.z = dot(r3, c71);
		r5.x = dot(r3, c69);
		r5.y = dot(r3, c70);
		r2.yz = (r5.xy * c2.zz) + c2.ww;
		r5.zw = clamp(r2.yz, float2(0.0), float2(1.0));
		r2.yz = -r2.yz + r5.zw;
		r2.y = dot(r2.yz, c2.xx) + c2.y;
		r6.x = dot(r3, c73);
		r6.y = dot(r3, c74);
		r2.zw = (r6.xy * c2.zz) + c2.ww;
		r5.zw = clamp(r2.zw, float2(0.0), float2(1.0));
		r2.zw = -r2.zw + r5.zw;
		r2.z = dot(r2.zw, c2.xx) + c2.y;
		r2.w = ((-abs(r2.z) >= 0.0) ? c2.x : c2.y);
		r5.z = dot(r3, c77);
		r3.x = dot(r3, c78);
		r7.x = ((-abs(r2.z) >= 0.0) ? r6.x : r5.z);
		r7.y = ((-abs(r2.z) >= 0.0) ? r6.y : r3.x);
		r3.xy = c86.xy;
		r3.xy = ((-abs(r2.z) >= 0.0) ? r3.xy : c87.xy);
		r3.zw = ((-abs(r2.y) >= 0.0) ? r5.xy : r7.xy);
		r3.xy = ((-abs(r2.y) >= 0.0) ? c85.xy : r3.xy);
		r2.y = ((-abs(r2.y) >= 0.0) ? c2.x : r2.w);
		r2.zw = clamp(r3.zw, float2(0.0), float2(1.0));
		r4.xy = (r2.zw * c4.xx) + r3.xy;
		r4.w = c2.y;
		r5 = r4 + c4.yyzz;
		r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
		r6 = r4 + c4.wyzz;
		r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
		r7 = r4 + c4.ywzz;
		r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
		r8 = r4 + c4.wwzz;
		r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r5.y = r6.x;
		r5.z = r7.x;
		r5.w = r8.x;
		r2.z = dot(r5, c5.xxxx);
		r5 = r4 + c4.yzzz;
		r5 = float4(s15_texture.sample_compare(s15, (r5.xyz).xy, (r5.xyz).z, level(r5.w)));
		r6 = r4 + c4.wzzz;
		r6 = float4(s15_texture.sample_compare(s15, (r6.xyz).xy, (r6.xyz).z, level(r6.w)));
		r7 = r4 + c4.zwzz;
		r7 = float4(s15_texture.sample_compare(s15, (r7.xyz).xy, (r7.xyz).z, level(r7.w)));
		r8 = r4 + c4.zyzz;
		r8 = float4(s15_texture.sample_compare(s15, (r8.xyz).xy, (r8.xyz).z, level(r8.w)));
		r5.y = r6.x;
		r5.z = r7.x;
		r5.w = r8.x;
		r2.w = dot(r5, c5.yyyy);
		r4 = float4(s15_texture.sample_compare(s15, (r4.xyz).xy, (r4.xyz).z, level(r4.w)));
		r2.z = r2.w + r2.z;
		r2.z = (r4.x * c5.z) + r2.z;
		r3.xy = r3.zw + -c4.xx;
		r3.xy = abs(r3.xy) + -c67.zz;
		r3.xy = clamp(r3.xy * c67.ww, float2(0.0), float2(1.0));
		r3.xy = -r3.xy + c2.xx;
		r2.y = clamp((r3.x * r3.y) + r2.y, 0.0, 1.0);
		r3.x = mix(c2.x, r2.z, r2.y);
		r2.yzw = -c89.xyz + v2.xyz;
		r2.y = dot(r2.yzw, r2.yzw);
		r2.y = clamp((r2.y * c68.y) + c68.x, 0.0, 1.0);
		r4.x = mix(r3.x, c2.x, r2.y);
	} else {
		r4.x = c2.x;
	}
	r3.xyz = v3.xyz;
	r2.yzw = (r3.xyz * r4.xxx) + v4.xyz;
	if (b0) {
		r3.x = dot(r2.yzw, c6.xyz);
		r3.x = ((r3.x == 0.0) ? FLT_MAX : 1.0 / r3.x);
		r3.x = r3.x * v3.w;
		r3.y = -r4.x + c2.x;
		r3.x = (r3.x * -r3.y) + c2.x;
		r3.yzw = r2.wzy * r3.xxx;
		r3.x = (r3.x * c4.x) + c4.x;
		r2.yzw = mix(r3.yzw, r3.wzy, r3.xxx);
	}
	r3.x = clamp(v0.y, 0.0, 1.0);
	r3.yz = -c46.yz + c46.zw;
	r3.xw = r3.xx + -c46.yz;
	r3.y = ((r3.y == 0.0) ? FLT_MAX : 1.0 / r3.y);
	r3.x = clamp(r3.y * r3.x, 0.0, 1.0);
	r3.y = (r3.x * c7.x) + c7.y;
	r3.x = r3.x * r3.x;
	r3.x = r3.x * r3.y;
	r4.xyz = c43.xyz;
	r4.xyz = -r4.xyz + c44.xyz;
	r4.xyz = (r3.xxx * r4.xyz) + c43.xyz;
	r3.x = ((r3.z == 0.0) ? FLT_MAX : 1.0 / r3.z);
	r3.x = clamp(r3.x * r3.w, 0.0, 1.0);
	r3.y = (r3.x * c7.x) + c7.y;
	r3.x = r3.x * r3.x;
	r3.x = r3.x * r3.y;
	r3.x = r3.x * r3.x;
	r5.xyz = mix(r4.xyz, c45.xyz, r3.xxx);
	r3.xyz = r5.xyz * c1.xyz;
	r4.x = c46.x;
	r3.xyz = ((-r4.x >= 0.0) ? c1.xyz : r3.xyz);
	r0.w = clamp(r0.w + c12.x, 0.0, 1.0);
	r4.xyz = mix(c2.xxx, r3.xyz, r0.www);
	r3.xyz = r2.yzw * r4.xyz;
	r0.w = dot(v1.xyz, r1.xyz);
	r0.w = r0.w + r0.w;
	r1.xyz = r1.xyz * r1.www;
	r1.xyz = (r0.www * v1.xyz) + -r1.xyz;
	r1 = s1_texture.sample(s1, r1.xyz);
	r1.xyz = r1.xyz * c30.zzz;
	r1.xyz = r2.xxx * r1.xyz;
	r1.xyz = r1.xyz * c0.xyz;
	r2.xyz = (r2.yzw * r4.xyz) + -c19.zzz;
	r2.xyz = r2.xyz * c19.www;
	r2.xyz = (r1.xyz * r2.xyz) + -r1.xyz;
	r1.xyz = (c19.yyy * r2.xyz) + r1.xyz;
	r2.xyz = (r1.xyz * r1.xyz) + -r1.xyz;
	r1.xyz = (c19.xxx * r2.xyz) + r1.xyz;
	r0.w = dot(r1.xyz, c8.xyz);
	r2.xyz = mix(r0.www, r1.xyz, c3.xyz);
	r0.xyz = (r0.xyz * r3.xyz) + r2.xyz;
	r0.w = c21.y + -v2.z;
	r0.w = r0.w + c5.w;
	r0.w = clamp(r0.w * c21.w, 0.0, 1.0);
	r1.x = abs(c12.y);
	oC0.xyz = r0.xyz * c30.xxx;
	r0.x = c29.w * v5.z;
	oC0.w = ((-r1.x >= 0.0) ? r0.w : r0.x);
	#undef c0
	#undef c1
	#undef c3
	#undef c12
	#undef c13
	#undef c19
	#undef c20
	#undef c21
	#undef c29
	#undef c30
	#undef c43
	#undef c44
	#undef c45
	#undef c46
	#undef c67
	#undef c68
	#undef c69
	#undef c70
	#undef c71
	#undef c73
	#undef c74
	#undef c77
	#undef c78
	#undef c85
	#undef c86
	#undef c87
	#undef c89
	#undef b0
	#undef v0
	#undef v1
	#undef v2
	#undef v3
	#undef v4
	#undef v5
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

