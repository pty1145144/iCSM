#include <metal_stdlib>
#include <metal_math>
#include <metal_geometric>

using namespace metal;

struct source_main_Input
{
	float4 t0 [[user(texcoord0)]];
	float4 t1 [[user(texcoord1)]];
	float4 t2 [[user(texcoord2)]];
};

struct source_main_Output
{
	float4 oC0 [[color(0)]];
};

fragment source_main_Output source_main (
 constant float4 &source_alpha [[buffer(30)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(1.000000000e+00, 0.000000000e+00, 0.000000000e+00, 0.000000000e+00); (void) c0;
	const float4 c1 = float4(-2.500000000e-01, 0.000000000e+00, -3.606737518e+01, 5.000000000e+00); (void) c1;
	const float4 c2 = float4(2.500000000e-01, -2.500000000e-01, 2.500000000e-01, 4.444444478e-01); (void) c2;
	float4 r0;
	float4 r1;
	#define t0 input.t0
	#define t1 input.t1
	#define t2 input.t2
	#define oC0 output.oC0
	r0.xy = t0.xy;
	r0.xy = r0.xy + -t1.xy;
	r1.xy = r0.xy + c1.xx;
	r0.z = dot(r1.xy, r1.xy) + c1.y;
	r0.z = r0.z * c1.z;
	r0.z = exp2(r0.z);
	r1.xy = r0.xy + c2.xy;
	r0.w = dot(r1.xy, r1.xy) + c1.y;
	r0.w = r0.w * c1.z;
	r0.w = exp2(r0.w);
	r0.z = r0.w + r0.z;
	r0.w = dot(r0.xy, r0.xy) + c1.y;
	r0.w = r0.w * c1.z;
	r0.w = exp2(r0.w);
	r0.z = (r0.w * c1.w) + r0.z;
	r1.xy = r0.xy + c2.yz;
	r0.xy = r0.xy + -c1.xx;
	r0.x = dot(r0.xy, r0.xy) + c1.y;
	r0.x = r0.x * c1.z;
	r0.x = exp2(r0.x);
	r0.y = dot(r1.xy, r1.xy) + c1.y;
	r0.y = r0.y * c1.z;
	r0.y = exp2(r0.y);
	r0.y = r0.y + r0.z;
	r0.x = r0.x + r0.y;
	r0.x = r0.x * c2.w;
	r0.xyz = r0.xxx * t2.xyz;
	r0.w = c0.x;
	oC0 = r0;
	#undef t0
	#undef t1
	#undef t2
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

