#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_texture>

using namespace metal;

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
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(31.875000003, 1.0, -0.501960814, 0.07739938); (void) c0;
	const float4 c1 = float4(0.947867275, 0.052132699, 2.400000095, 0.040449999); (void) c1;
	float4 r0;
	float4 r1;
	float4 r2;
	float4 r3;
	float4 r4;
	#define v0 input.v0
	#define v1 input.v1
	#define v2 input.v2
	#define oC0 output.oC0
	r0.x = clamp(v0.z, 0.0, 1.0);
	r1 = v1;
	r1 = -r1 + v2;
	r0 = (r0.xxxx * r1) + v1;
	r1 = s0_texture.sample(s0, v0.xy);
	r1.z = (r1.z * c0.x) + c0.y;
	r1.z = ((r1.z == 0.0) ? FLT_MAX : 1.0 / r1.z);
	r1.xy = r1.yx + c0.zz;
	r2.x = (r1.y * -r1.z) + r1.w;
	r3.yz = (r1.yx * r1.zz) + r1.ww;
	r3.w = (r1.x * -r1.z) + r2.x;
	r3.x = (r1.x * -r1.z) + r3.y;
	r1.xyz = (r3.xzw * c1.xxx) + c1.yyy;
	r2.x = log2(r1.x);
	r2.y = log2(r1.y);
	r2.z = log2(r1.z);
	r1.xyz = r2.xyz * c1.zzz;
	r1.x = exp2(r1.x);
	r2.xyz = r3.xzw * c0.www;
	r3.xyz = -r3.xzw + c1.www;
	r4.x = ((r3.x >= 0.0) ? r2.x : r1.x);
	r1.x = exp2(r1.y);
	r1.y = exp2(r1.z);
	r4.y = ((r3.y >= 0.0) ? r2.y : r1.x);
	r4.z = ((r3.z >= 0.0) ? r2.z : r1.y);
	r4.w = c0.y;
	oC0 = r0 * r4;
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

