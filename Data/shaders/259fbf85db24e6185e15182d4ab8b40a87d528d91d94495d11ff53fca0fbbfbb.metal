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
	float4 v1 [[user(texcoord2)]];
	float4 v2 [[user(texcoord3)]];
	float4 v3 [[user(texcoord4)]];
	float4 v4 [[user(texcoord5)]];
	float4 v5 [[user(texcoord6)]];
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
	texture2d<float> s10_texture [[texture(10)]],
	sampler s10 [[sampler(10)]],
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(2.000000000e+00, -1.000000000e+00, 0.000000000e+00, 1.000000000e+00); (void) c0;
	const float4 c11 = float4(1.591549367e-01, 5.000000000e-01, 6.283185482e+00, -3.141592741e+00); (void) c11;
	const float4 c13 = float4(5.773500204e-01, 5.000000000e+00, -3.000000119e-01, -3.333333254e+00); (void) c13;
	const float4 c14 = float4(-2.000000000e+00, 3.000000000e+00, 1.000000000e+06, 0.000000000e+00); (void) c14;
	const float4 c15 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, -9.999999975e-07); (void) c15;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	float4 r5;
	float4 r6;
	float4 r7;
	float4 r8;
	#define c1 uniforms.uniforms_float4[0]
	#define c2 uniforms.uniforms_float4[1]
	#define c3 uniforms.uniforms_float4[2]
	#define c4 uniforms.uniforms_float4[3]
	#define c5 uniforms.uniforms_float4[4]
	#define c6 uniforms.uniforms_float4[5]
	#define c7 uniforms.uniforms_float4[6]
	#define c8 uniforms.uniforms_float4[7]
	#define c9 uniforms.uniforms_float4[8]
	#define c10 uniforms.uniforms_float4[9]
	#define c12 uniforms.uniforms_float4[10]
	#define c19 uniforms.uniforms_float4[11]
	#define c29 uniforms.uniforms_float4[12]
	#define c30 uniforms.uniforms_float4[13]
	#define c101 uniforms.uniforms_float4[14]
	#define c102 uniforms.uniforms_float4[15]
	#define c105 uniforms.uniforms_float4[16]
	#define c107 uniforms.uniforms_float4[17]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define v3 input.v3
	#define v4 input.v4
	#define v5 input.v5
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	oC0.w = r0.w * c1.w;
	r1.xyz = r0.zxy * c13.xxx;
	r1.xyz = (r0.zxy * c13.xxx) + -r1.zxy;
	r2 = s3_texture.sample(s3, v0.xy);
	r1.w = r2.x * c12.w;
	r1.w = (r1.w * c11.x) + c11.y;
	r1.w = fract(r1.w);
	r1.w = (r1.w * c11.z) + c11.w;
	r3.xy = float2(cos(r1.w), sin(r1.w));
	r1.xyz = r1.xyz * r3.yyy;
	r1.xyz = (r0.xyz * r3.xxx) + r1.xyz;
	r1.w = -r3.x + c0.w;
	r2.y = dot(c13.xxx, r0.xyz);
	r2.y = r2.y * c13.x;
	r1.xyz = (r2.yyy * r1.www) + r1.xyz;
	r2.y = abs(c12.w);
	r1.w = c0.w;
	r0.w = r2.x;
	r2.x = -r2.w + c0.w;
	r0 = ((-r2.y >= 0.0) ? r0 : r1);
	r1.xyz = r0.xyz * r0.xyz;
	r1.xyz = r1.xyz * r1.xyz;
	r1.w = dot(r1.xyz, c15.xyz);
	r2.y = r1.w + c15.w;
	r1.w = ((r1.w == 0.0) ? FLT_MAX : 1.0 / r1.w);
	r1.w = ((r2.y >= 0.0) ? r1.w : c14.z);
	r2.y = dot(r0.xyz, c15.xyz);
	r1.xyz = r1.xyz * r2.yyy;
	r3.xyz = mix(r0.xyz, r2.yyy, -c101.yyy);
	r1.xyz = (r1.xyz * r1.www) + -r0.xyz;
	r1.xyz = (c101.yyy * r1.xyz) + r0.xyz;
	r1.xyz = ((c101.y >= 0.0) ? r1.xyz : r3.xyz);
	r1.w = abs(c101.y);
	r1.xyz = ((-r1.w >= 0.0) ? r0.xyz : r1.xyz);
	r3 = s1_texture.sample(s1, v0.xy);
	r2.yzw = (r3.xyz * c0.xxx) + c0.yyy;
	r3.x = dot(v1.xyz, r2.yzw);
	r3.y = dot(v2.xyz, r2.yzw);
	r3.z = dot(v3.xyz, r2.yzw);
	r4.xyz = normalize(r3.xyz);
	r2.y = ((r4.x >= 0.0) ? c0.z : c0.w);
	r2.z = ((r4.y >= 0.0) ? c0.z : c0.w);
	r2.w = ((r4.z >= 0.0) ? c0.z : c0.w);
	r3.xyz = r4.xyz * r4.xyz;
	r2.yzw = r2.yzw * r3.xyz;
	r5.xyz = r2.yyy * c5.xyz;
	r6.x = ((r4.x >= 0.0) ? c0.w : c0.z);
	r6.y = ((r4.y >= 0.0) ? c0.w : c0.z);
	r6.z = ((r4.z >= 0.0) ? c0.w : c0.z);
	r3.xyz = r3.xyz * r6.xyz;
	r5.xyz = (r3.xxx * c4.xyz) + r5.xyz;
	r5.xyz = (r3.yyy * c6.xyz) + r5.xyz;
	r5.xyz = (r2.zzz * c7.xyz) + r5.xyz;
	r3.xyz = (r3.zzz * c8.xyz) + r5.xyz;
	r2.yzw = (r2.www * c9.xyz) + r3.xyz;
	r1.w = dot(r2.yzw, c15.xyz);
	r2.yzw = r2.yzw + v5.xyz;
	r3.xy = r1.ww + -c2.xw;
	r1.w = r1.w + c13.z;
	r1.w = clamp(r1.w * c13.w, 0.0, 1.0);
	r5.xy = -c2.xw + c2.yz;
	r3.z = ((r5.x == 0.0) ? FLT_MAX : 1.0 / r5.x);
	r4.w = ((r5.y == 0.0) ? FLT_MAX : 1.0 / r5.y);
	r3.y = clamp(r3.y * r4.w, 0.0, 1.0);
	r3.x = clamp(r3.z * r3.x, 0.0, 1.0);
	r3.z = (r3.x * c14.x) + c14.y;
	r3.x = r3.x * r3.x;
	r3.x = r3.x * r3.z;
	r3.z = (r3.y * c14.x) + c14.y;
	r3.y = r3.y * r3.y;
	r3.y = r3.y * r3.z;
	r3.x = r3.y * r3.x;
	r0.w = r0.w * r3.x;
	r3.xyz = mix(r0.xyz, r1.xyz, r0.www);
	r0.xyz = r0.xyz + c0.yyy;
	r0.w = dot(r3.xyz, c15.xyz);
	r1.xyz = r0.www * c102.xyz;
	r5.xyz = c15.xyz;
	r0.w = dot(c102.xyz, r5.xyz);
	r4.w = r0.w + c15.w;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = ((r4.w >= 0.0) ? r0.w : c14.z);
	r1.xyz = (r1.xyz * r0.www) + -r3.xyz;
	r1.xyz = (c102.www * r1.xyz) + r3.xyz;
	r0.w = clamp(c107.w + v5.w, 0.0, 1.0);
	r1.xyz = (r1.xyz * r0.www) + -r3.xyz;
	r0.w = (r1.w * c14.x) + c14.y;
	r1.w = r1.w * r1.w;
	r0.w = r0.w * r1.w;
	r1.xyz = (r0.www * r1.xyz) + r3.xyz;
	r5 = s10_texture.sample(s10, v0.xy);
	r1.xyz = r1.xyz * r5.zzz;
	r0.xyz = (r5.yyy * r0.xyz) + c0.www;
	r3.xyz = c3.xyz + -v4.xyz;
	r0.w = dot(r3.xyz, r3.xyz);
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r6.xyz = r0.www * r3.xyz;
	r6.x = clamp(dot(r6.xyz, r4.xyz), 0.0, 1.0);
	r1.w = r6.x * r6.x;
	r1.w = r1.w * r1.w;
	r1.w = r1.w * r2.x;
	r7.xyz = r1.www * v5.xyz;
	r7.xyz = r3.www * r7.xyz;
	r7.xyz = r7.xyz * c13.yyy;
	r1.w = mix(c10.x, c10.y, r5.y);
	r7.xyz = r1.www * r7.xyz;
	r6.y = r5.w;
	r8 = s4_texture.sample(s4, r6.xy);
	r1.w = -r6.x + c0.w;
	r3.w = pow(abs(r1.w), c105.x);
	r1.w = mix(r8.y, c0.w, r2.x);
	r5.yzw = r1.www * r7.xyz;
	r0.xyz = r0.xyz * r5.yzw;
	r0.xyz = ((-r2.x >= 0.0) ? c0.zzz : r0.xyz);
	r0.xyz = (r1.xyz * r2.yzw) + r0.xyz;
	r1.x = v1.w;
	r1.y = v2.w;
	r1.z = v3.w;
	r2.xyz = (r3.xyz * r0.www) + r1.xyz;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = clamp((r0.w * c19.w) + c19.x, 0.0, 1.0);
	r1.w = min(r0.w, c19.z);
	r0.w = r1.w * r1.w;
	r1.x = clamp(dot(r4.xyz, r1.xyz), 0.0, 1.0);
	r3.xyz = normalize(r2.xyz);
	r1.y = clamp(dot(r4.xyz, r3.xyz), 0.0, 1.0);
	r1.y = r1.x * r1.y;
	r1.x = ((r1.x == 0.0) ? FLT_MAX : rsqrt(abs(r1.x)));
	r1.x = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r1.y = r3.w * r1.y;
	r1.x = r1.x * r1.y;
	r1.yzw = v5.www * v5.xyz;
	r1.yzw = r1.yzw * c107.xyz;
	r1.xyz = r1.yzw * r1.xxx;
	r0.xyz = (r1.xyz * r5.xxx) + r0.xyz;
	r0.xyz = r0.xyz * c1.xyz;
	r1.xyz = r0.xyz * c30.xxx;
	r2.x = c30.x;
	r0.xyz = (r0.xyz * -r2.xxx) + c29.xyz;
	oC0.xyz = (r0.www * r0.xyz) + r1.xyz;
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
	#undef c12
	#undef c19
	#undef c29
	#undef c30
	#undef c101
	#undef c102
	#undef c105
	#undef c107
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

