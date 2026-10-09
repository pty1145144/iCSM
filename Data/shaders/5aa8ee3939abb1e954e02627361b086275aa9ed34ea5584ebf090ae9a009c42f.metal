#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[2];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
	float4 v1 [[user(texcoord1)]];
	float4 v2 [[user(texcoord2)]];
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
	const float4 c0 = float4(3.187500000e+01, 1.000000000e+00, -5.019608140e-01, 7.739938051e-02); (void) c0;
	const float4 c1 = float4(9.478672743e-01, 5.213269964e-02, 2.400000095e+00, 4.044999927e-02); (void) c1;
	const float4 c2 = float4(5.000000000e-01, 1.666666716e-01, 3.333333433e-01, 6.666666865e-01); (void) c2;
	const float4 c3 = float4(0.000000000e+00, 6.000000000e+00, -2.000000000e+00, 4.000000000e+00); (void) c3;
	const float4 c6 = float4(-1.000000000e+00, -2.000000000e+00, -3.000000000e+00, -4.000000000e+00); (void) c6;
	const float4 c7 = float4(0.000000000e+00, 1.000000000e+00, -0.000000000e+00, -1.000000000e+00); (void) c7;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	#define c4 uniforms.uniforms_float4[0]
	#define c5 uniforms.uniforms_float4[1]
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.xy);
	r0.z = (r0.z * c0.x) + c0.y;
	r0.z = ((r0.z == 0.0) ? FLT_MAX : 1.0 / r0.z);
	r0.xy = r0.yx + c0.zz;
	r1.x = (r0.y * -r0.z) + r0.w;
	r2.yz = (r0.yx * r0.zz) + r0.ww;
	r2.w = (r0.x * -r0.z) + r1.x;
	r2.x = (r0.x * -r0.z) + r2.y;
	r0.xyz = (r2.xzw * c1.xxx) + c1.yyy;
	r1.x = log2(r0.x);
	r1.y = log2(r0.y);
	r1.z = log2(r0.z);
	r0.xyz = r1.xyz * c1.zzz;
	r0.y = exp2(r0.y);
	r1.xyz = r2.xzw * c0.www;
	r2.xyz = -r2.xzw + c1.www;
	r3.x = ((r2.y >= 0.0) ? r1.y : r0.y);
	r0.y = exp2(r0.z);
	r0.x = exp2(r0.x);
	r3.y = ((r2.z >= 0.0) ? r1.z : r0.y);
	r3.z = ((r2.x >= 0.0) ? r1.x : r0.x);
	r0.x = -r3.y + r3.x;
	r0.xy = ((r0.x >= 0.0) ? r3.yx : r3.xy);
	r1.x = max(r3.z, r0.y);
	r1.y = min(r0.x, r3.z);
	r0.x = -r1.y + r1.x;
	r0.yzw = -r3.xyz + r1.xxx;
	r1.yzw = -r1.xxx + r3.zxy;
	r2.x = r0.x * c2.x;
	r0.yzw = (r0.yzw * c2.yyy) + r2.xxx;
	r2.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r2.yz = (r0.wy * r2.xx) + c2.zw;
	r2.yz = (r0.zw * -r2.xx) + r2.yz;
	r0.w = ((-abs(r1.w) >= 0.0) ? r2.z : c3.x);
	r0.w = ((-abs(r1.z) >= 0.0) ? r2.y : r0.w);
	r0.y = r0.y * r2.x;
	r0.y = (r0.z * r2.x) + -r0.y;
	r0.y = ((-abs(r1.y) >= 0.0) ? r0.y : r0.w);
	r2.x = fract(r0.y);
	r0.y = ((r1.x == 0.0) ? FLT_MAX : 1.0 / r1.x);
	r3.x = c2.x;
	r0.z = (r1.x * c5.z) + -r3.x;
	r1.z = (c5.w * r0.z) + r3.x;
	r2.y = r0.y * r0.x;
	r0.xy = ((-abs(r0.x) >= 0.0) ? c3.xx : r2.xy);
	r0.x = r0.x + c5.x;
	r0.x = fract(r0.x);
	r0.z = r0.x * c3.y;
	r0.w = fract(r0.z);
	r0.z = -r0.w + r0.z;
	r2 = r0.zzzz + c6;
	r0.x = (r0.x * c3.y) + -r0.z;
	r0.w = -r0.x + c0.y;
	r3.x = r0.y * c5.y;
	r3.y = c0.y;
	r0.y = (r0.y * -c5.y) + r3.y;
	r1.x = r0.y * r1.z;
	r0.y = (r3.x * -r0.w) + c0.y;
	r0.x = (r3.x * -r0.x) + c0.y;
	r1.yw = r0.yx * r1.zz;
	r4.xz = ((-abs(r2.w) >= 0.0) ? r1.yz : r1.zw);
	r4.y = r1.x;
	r0.xyw = ((-abs(r2.z) >= 0.0) ? r1.xwz : r4.xyz);
	r0.xyw = ((-abs(r2.y) >= 0.0) ? r1.xzy : r0.xyw);
	r0.xyw = ((-abs(r2.x) >= 0.0) ? r1.wzx : r0.xyw);
	r0.xyz = ((-abs(r0.z) >= 0.0) ? r1.zyx : r0.xyw);
	r0.xyz = ((-abs(r3.x) >= 0.0) ? r1.zzz : r0.xyz);
	r1.x = c3.x;
	r1.x = dot(v0.zw, c4.xy) + r1.x;
	r1.y = dot(v0.zw, v0.zw) + c3.x;
	r1.z = dot(c4.xy, c4.xy) + -r3.y;
	r1.y = r1.z * r1.y;
	r1.xy = r1.xy * c3.zw;
	r1.y = (r1.x * r1.x) + -r1.y;
	r2.x = max(r1.y, c3.x);
	r1.y = ((r2.x == 0.0) ? FLT_MAX : rsqrt(abs(r2.x)));
	r1.y = ((r1.y == 0.0) ? FLT_MAX : 1.0 / r1.y);
	r1.w = ((-r1.z >= 0.0) ? c7.x : c7.y);
	r2.x = ((r1.z >= 0.0) ? c7.z : c7.w);
	r1.z = r1.z + r1.z;
	r1.z = ((r1.z == 0.0) ? FLT_MAX : 1.0 / r1.z);
	r1.w = r1.w + r2.x;
	r1.x = (r1.w * r1.y) + -r1.x;
	r1.x = clamp(r1.z * r1.x, 0.0, 1.0);
	r2 = v1;
	r2 = -r2 + v2;
	r1 = (r1.xxxx * r2) + v1;
	r0.w = c0.y;
	oC0 = r0 * r1;
	#undef c4
	#undef c5
	#undef v0
	#undef v1
	#undef v2
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

