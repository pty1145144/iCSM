#include <metal_stdlib>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[3];
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
	const float4 c3 = float4(2.0, -1.0, 0.0, 0.0); (void) c3;
	const float4 c4 = float4(0.125, 0.111111112, 0.25, 0.375000003); (void) c4;
	const float4 c5 = float4(0.5, 0.625, 0.75, 0.875000003); (void) c5;
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
	#define c2 uniforms.uniforms_float4[2]
	#define t0 input.t0
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, t0.xy);
	r1.x = c3.z;
	r2.x = (t0.y * c3.x) + c3.y;
	r2.y = c3.w;
	r3.xy = (t0.xy * c3.xx) + c3.yy;
	r1.y = -r3.x;
	r1.xy = r1.xy + r2.xy;
	r0.w = dot(r3.xy, r3.xy) + c3.w;
	r1.zw = r0.ww * r3.yx;
	r0.w = abs(c1.z);
	r2.x = (r1.w * -r0.w) + c1.x;
	r2.y = (r1.z * -r0.w) + -c1.y;
	r1.xy = (r1.xy * c1.ww) + r2.xy;
	r0.w = dot(r1.xy, r1.xy) + c3.w;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : rsqrt(abs(r0.w)));
	r1.zw = r0.ww * r1.yx;
	r0.w = ((r0.w == 0.0) ? FLT_MAX : 1.0 / r0.w);
	r0.w = -r0.w + c0.x;
	r1.zw = r1.zw * c0.xx;
	r1.xy = ((r0.w >= 0.0) ? r1.xy : r1.wz);
	r1.xy = r1.xy + t0.xy;
	r2.xy = max(r1.xy, c2.xy);
	r1.xy = min(c2.wz, r2.xy);
	r1.zw = r1.yx + -t0.yx;
	r2.xy = (r1.wz * c4.xx) + t0.xy;
	r3.xy = (r1.wz * c4.zz) + t0.xy;
	r4.xy = (r1.wz * c4.ww) + t0.xy;
	r5.xy = (r1.wz * c5.xx) + t0.xy;
	r6.xy = (r1.wz * c5.yy) + t0.xy;
	r7.xy = (r1.wz * c5.zz) + t0.xy;
	r8.xy = (r1.wz * c5.ww) + t0.xy;
	r1 = s0_texture.sample(s0, r1.xy);
	r2 = s0_texture.sample(s0, r2.xy);
	r3 = s0_texture.sample(s0, r3.xy);
	r4 = s0_texture.sample(s0, r4.xy);
	r5 = s0_texture.sample(s0, r5.xy);
	r6 = s0_texture.sample(s0, r6.xy);
	r8 = s0_texture.sample(s0, r8.xy);
	r7 = s0_texture.sample(s0, r7.xy);
	r2.xyz = r2.xyz * c4.yyy;
	r0.xyz = (r0.xyz * c4.yyy) + r2.xyz;
	r0.xyz = (r3.xyz * c4.yyy) + r0.xyz;
	r0.xyz = (r4.xyz * c4.yyy) + r0.xyz;
	r0.xyz = (r5.xyz * c4.yyy) + r0.xyz;
	r0.xyz = (r6.xyz * c4.yyy) + r0.xyz;
	r0.xyz = (r7.xyz * c4.yyy) + r0.xyz;
	r0.xyz = (r8.xyz * c4.yyy) + r0.xyz;
	r0.xyz = (r1.xyz * c4.yyy) + r0.xyz;
	r0.w = -c3.y;
	oC0 = r0;
	#undef c0
	#undef c1
	#undef c2
	#undef t0
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

