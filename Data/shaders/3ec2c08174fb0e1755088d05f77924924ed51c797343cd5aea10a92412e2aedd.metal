#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[18];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord1)]];
	float4 v2 [[user(texcoord2)]];
	float4 v3 [[user(texcoord3)]];
	float4 v4 [[user(texcoord4)]];
};

struct source_main_Output
{
	float4 oC0 [[color(0)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	texture2d<float> s0_texture [[texture(0)]],
	sampler s0 [[sampler(0)]],
	texture2d<float> s3_texture [[texture(3)]],
	sampler s3 [[sampler(3)]],
	depth2d<float> s4_texture [[texture(4)]],
	sampler s4 [[sampler(4)]],
	texture2d<float> s6_texture [[texture(6)]],
	sampler s6 [[sampler(6)]],
	texture2d<float> s7_texture [[texture(7)]],
	sampler s7 [[sampler(7)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c3 = float4(3.000000119e-01, 5.899999738e-01, 1.099999994e-01, 1.000000000e+00); (void) c3;
	const float4 c4 = float4(2.000000000e+00, -1.000000000e+00, 5.000000000e-01, 1.500000000e+02); (void) c4;
	const float4 c5 = float4(1.000000000e+00, 0.000000000e+00, -4.000000060e-01, 1.953125000e-03); (void) c5;
	const float4 c6 = float4(3.021148033e-03, 2.114803717e-02, 1.208459213e-02, 6.042296067e-02); (void) c6;
	const float4 c7 = float4(-1.953125000e-03, 1.953125000e-03, 0.000000000e+00, 1.000000000e+00); (void) c7;
	const float4 c8 = float4(-9.765625000e-04, 1.953125000e-03, 0.000000000e+00, 1.000000000e+00); (void) c8;
	const float4 c9 = float4(1.953125000e-03, 9.765625000e-04, 0.000000000e+00, 1.000000000e+00); (void) c9;
	const float4 c20 = float4(9.969788790e-02, 1.661631465e-01, 1.399999976e+00, 0.000000000e+00); (void) c20;
	const float4 c21 = float4(-1.953125000e-03, 9.765625000e-04, 0.000000000e+00, 1.000000000e+00); (void) c21;
	const float4 c22 = float4(-1.953125000e-03, -9.765625000e-04, 0.000000000e+00, 1.000000000e+00); (void) c22;
	const float4 c23 = float4(-9.765625000e-04, 9.765625000e-04, 0.000000000e+00, 1.000000000e+00); (void) c23;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c2 uniforms.uniforms_float4[2]
	#define c10 uniforms.uniforms_float4[3]
	#define c11 uniforms.uniforms_float4[4]
	#define c12 uniforms.uniforms_float4[5]
	#define c13 uniforms.uniforms_float4[6]
	#define c14 uniforms.uniforms_float4[7]
	#define c15 uniforms.uniforms_float4[8]
	#define c16 uniforms.uniforms_float4[9]
	#define c17 uniforms.uniforms_float4[10]
	#define c18 uniforms.uniforms_float4[11]
	#define c19 uniforms.uniforms_float4[12]
	#define c26 uniforms.uniforms_float4[13]
	#define c27 uniforms.uniforms_float4[14]
	#define c28 uniforms.uniforms_float4[15]
	#define c29 uniforms.uniforms_float4[16]
	#define c30 uniforms.uniforms_float4[17]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define oC0 output.oC0
	r0.w = c3.w;
	r0.xy = r0.ww + -c27.xy;
	r0.x = r0.x * c27.z;
	r0.x = r0.y * r0.x;
	r1 = s0_texture.sample(s0, v0.xy);
	r2.x = mix(c3.w, r1.w, r0.x);
	oC0.w = r2.x * c1.w;
	r2 = (v4.xyzx * c5.xxxy) + c5.yyyx;
	r0.x = dot(r2, c18);
	r0.y = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r3.x = dot(r2, c15);
	r3.y = dot(r2, c16);
	r3.z = dot(r2, c17);
	r2.xyz = r0.yyy * r3.xyz;
	r3 = r2.xyzx * c5.xxxy;
	r4 = r3 + c5.wwyx;
	r4 = float4(s4_texture.sample_compare(s4, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c7;
	r5 = float4(s4_texture.sample_compare(s4, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c7.yxzw;
	r5 = float4(s4_texture.sample_compare(s4, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c7.xxzw;
	r5 = float4(s4_texture.sample_compare(s4, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r0.y = dot(r4, c6.xxxx);
	r4 = r3 + c5.wyyx;
	r4 = float4(s4_texture.sample_compare(s4, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c7.xzzw;
	r5 = float4(s4_texture.sample_compare(s4, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c5.ywyx;
	r5 = float4(s4_texture.sample_compare(s4, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c7.zxzw;
	r5 = float4(s4_texture.sample_compare(s4, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r0.z = dot(r4, c6.yyyy);
	r0.y = r0.z + r0.y;
	r4 = r3 + c9;
	r4 = float4(s4_texture.sample_compare(s4, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c9.yxzw;
	r5 = float4(s4_texture.sample_compare(s4, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c8;
	r5 = float4(s4_texture.sample_compare(s4, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c21;
	r5 = float4(s4_texture.sample_compare(s4, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r0.z = dot(r4, c6.zzzz);
	r0.y = r0.z + r0.y;
	r4 = r3 + c22;
	r4 = float4(s4_texture.sample_compare(s4, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c22.yxzw;
	r5 = float4(s4_texture.sample_compare(s4, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c21.yxzw;
	r5 = float4(s4_texture.sample_compare(s4, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c8.yxzw;
	r5 = float4(s4_texture.sample_compare(s4, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r0.z = dot(r4, c6.zzzz);
	r0.y = r0.z + r0.y;
	r4 = r3 + c9.yyzw;
	r4 = float4(s4_texture.sample_compare(s4, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c23;
	r5 = float4(s4_texture.sample_compare(s4, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c23.yxzw;
	r5 = float4(s4_texture.sample_compare(s4, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r5.x;
	r5 = r3 + c8.xxzw;
	r5 = float4(s4_texture.sample_compare(s4, (r5.xyz).xy, (r5.xyz).z));
	r4.w = r5.x;
	r0.z = dot(r4, c6.wwww);
	r0.y = r0.z + r0.y;
	r4 = r3 + c9.yzzw;
	r4 = float4(s4_texture.sample_compare(s4, (r4.xyz).xy, (r4.xyz).z));
	r5 = r3 + c8.xzzw;
	r5 = float4(s4_texture.sample_compare(s4, (r5.xyz).xy, (r5.xyz).z));
	r4.y = r5.x;
	r5 = r3 + c8.zxzw;
	r3 = r3 + c9.zyzw;
	r3 = float4(s4_texture.sample_compare(s4, (r3.xyz).xy, (r3.xyz).z));
	r4.w = r3.x;
	r3 = float4(s4_texture.sample_compare(s4, (r5.xyz).xy, (r5.xyz).z));
	r4.z = r3.x;
	r0.z = dot(r4, c20.xxxx);
	r0.y = r0.z + r0.y;
	r2.w = c3.w;
	r3 = float4(s4_texture.sample_compare(s4, (r2.xyz).xy, (r2.xyz).z));
	r2 = s6_texture.sample(s6, r2.xy);
	r2.xyz = r2.xyz * c28.xyz;
	r0.y = (r3.x * c20.y) + r0.y;
	r2.w = pow(abs(r0.y), c20.z);
	r0.y = -r2.w + c3.w;
	r0.y = (c2.y * r0.y) + r2.w;
	r3.x = c3.w;
	r4.xyz = c14.xyz + -v4.xyz;
	r0.z = dot(r4.xyz, r4.xyz);
	r3.z = ((r0.z == 0.0) ? FLT_MAX : 1.0 / r0.z);
	r3.y = ((r0.z == 0.0) ? FLT_MAX : rsqrt(abs(r0.z)));
	r0.z = clamp(dot(c13.xyz, r3.xyz), 0.0, 1.0);
	r3.x = clamp(mix(r0.y, r2.w, r0.z), 0.0, 1.0);
	r2.xyz = r2.xyz * r3.xxx;
	r3.xzw = r3.yyy * r4.xyz;
	r0.y = ((r3.y == 0.0) ? FLT_MAX : 1.0 / r3.y);
	r0.y = r0.y + -c13.w;
	r4.xyz = v3.xyz;
	r5.xyz = r4.yzx * v2.zxy;
	r4.xyz = (v2.yzx * r4.zxy) + -r5.xyz;
	r4.xyz = r4.xyz * v3.www;
	r5 = s3_texture.sample(s3, v1.xy);
	r5.xyz = (r5.xyz * c4.xxx) + c4.yyy;
	r2.w = mix(r5.w, r1.w, c27.x);
	r4.xyz = r4.xyz * r5.yyy;
	r4.xyz = (r5.xxx * v3.xyz) + r4.xyz;
	r4.xyz = (r5.zzz * v2.xyz) + r4.xyz;
	r5.xyz = normalize(r4.xyz);
	r3.y = dot(r3.xzw, r5.xyz);
	r3.y = clamp(r3.y + c28.w, 0.0, 1.0);
	r0.z = r0.z * r3.y;
	r2.xyz = r2.xyz * r0.zzz;
	r0.z = c5.z;
	r0.z = r0.z * c13.w;
	r0.z = ((r0.z == 0.0) ? FLT_MAX : 1.0 / r0.z);
	r0.y = clamp(r0.z * r0.y, 0.0, 1.0);
	r2.xyz = r0.yyy * r2.xyz;
	r0.xyz = ((-r0.x >= 0.0) ? c5.yyy : r2.xyz);
	r2.xyz = c11.xyz + -v4.xyz;
	r3.y = dot(r2.xyz, r2.xyz);
	r3.y = ((r3.y == 0.0) ? FLT_MAX : rsqrt(abs(r3.y)));
	r2.xyz = r2.xyz * r3.yyy;
	r3.y = ((r3.y == 0.0) ? FLT_MAX : 1.0 / r3.y);
	r3.y = clamp((r3.y * c12.w) + c12.x, 0.0, 1.0);
	r4.x = min(r3.y, c12.z);
	r3.y = r4.x * r4.x;
	r4.x = dot(-r2.xyz, r5.xyz);
	r4.x = r4.x + r4.x;
	r4.xyz = (r5.xyz * -r4.xxx) + -r2.xyz;
	r2.x = clamp(dot(r5.xyz, r2.xyz), 0.0, 1.0);
	r2.x = -r2.x + c3.w;
	r2.y = clamp(dot(r4.xyz, r3.xzw), 0.0, 1.0);
	r2.z = abs(c10.z);
	r4 = s7_texture.sample(s7, v0.xy);
	r3.x = -r4.x + c3.w;
	r3.x = (r4.x * c4.w) + r3.x;
	r2.z = ((-r2.z >= 0.0) ? r3.x : c10.z);
	r3.x = pow(abs(r2.y), r2.z);
	r3.xzw = r0.xyz * r3.xxx;
	r4.w = c19.w;
	r5.xyz = (c0.www * r1.xyz) + -r4.www;
	r4.xyz = (r4.yyy * r5.xyz) + c19.www;
	r5.xyz = r4.www * c26.xyz;
	r4.xyz = ((c26.x >= 0.0) ? r5.xyz : r4.xyz);
	r2.y = dot(r1.xyz, c3.xyz);
	r4.w = mix(r2.w, r2.y, c10.y);
	r2.yzw = r4.xyz * r4.www;
	r2.yzw = r2.yzw * r3.xzw;
	r1.w = clamp(r1.w + c27.z, 0.0, 1.0);
	r3.xzw = -r0.www + c1.xyz;
	r3.xzw = (r1.www * r3.xzw) + c3.www;
	r0.xyz = r0.xyz * r3.xzw;
	r0.xyz = r0.xyz * r1.xyz;
	r0.w = (r2.x * -r2.x) + c4.z;
	r1.x = r2.x * r2.x;
	r1.y = r1.x + r1.x;
	r1.x = (r1.x * c4.x) + c4.y;
	r2.x = mix(c19.y, c19.z, r1.x);
	r1.x = -c19.x + c19.y;
	r1.x = (r1.y * r1.x) + c19.x;
	r0.w = ((r0.w >= 0.0) ? r1.x : r2.x);
	r0.xyz = (r2.yzw * r0.www) + r0.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	oC0.xyz = (r3.yyy * r0.xyz) + r1.xyz;
	#undef c0
	#undef c1
	#undef c2
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
	#undef c26
	#undef c27
	#undef c28
	#undef c29
	#undef c30
	#undef v0
	#undef v1
	#undef v2
	#undef v3
	#undef v4
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

