#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[5];
};

struct source_main_Input
{
	float4 t3 [[user(texcoord3)]];
	float4 t7 [[user(texcoord7)]];
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
	const float4 c2 = float4(5.000000000e-01, -3.000000000e+02, 2.000000095e-03, 1.250000000e-01); (void) c2;
	const float4 c3 = float4(-2.000000000e+00, 3.000000000e+00, 3.500000000e+00, 5.000000000e+00); (void) c3;
	const float4 c4 = float4(5.301945806e-01, 5.073426962e-01, 1.250000000e-01, -1.000000000e+00); (void) c4;
	const float4 c5 = float4(6.847710162e-02, 4.128032029e-01, 3.656090051e-02, 5.126258731e-01); (void) c5;
	const float4 c6 = float4(1.017440017e-02, 8.379333019e-01, -1.649499983e-01, 1.560883969e-01); (void) c6;
	const float4 c7 = float4(9.068974853e-01, -8.461230248e-02, -5.736184120e-01, 6.797046065e-01); (void) c7;
	const float4 c8 = float4(-4.168865979e-01, 8.836492896e-01, 3.535653949e-01, -5.666742921e-01); (void) c8;
	const float4 c9 = float4(-4.240800068e-02, -6.649324894e-01, -8.909832835e-01, 3.658477068e-01); (void) c9;
	const float4 c10 = float4(-4.150894880e-01, -2.524949014e-01, 9.709999897e-03, -9.276292920e-01); (void) c10;
	const float4 c11 = float4(4.289346039e-01, 9.020032883e-01, -6.037632227e-01, -6.507930160e-01); (void) c11;
	const float4 c12 = float4(-2.034064978e-01, 1.169684008e-01, 0.000000000e+00, 0.000000000e+00); (void) c12;
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
	float4 r15;
	#define c0 uniforms.uniforms_float4[0]
	#define c1 uniforms.uniforms_float4[1]
	#define c17 uniforms.uniforms_float4[2]
	#define c18 uniforms.uniforms_float4[3]
	#define c30 uniforms.uniforms_float4[4]
	#define t3 input.t3
	#define t7 input.t7
	#define oC0 output.oC0
	r0.xyz = -t3.xyz + c18.xyz;
	r0.x = dot(r0.xyz, r0.xyz);
	r0.x = ((r0.x == 0.0) ? FLT_MAX : rsqrt(abs(r0.x)));
	r0.x = ((r0.x == 0.0) ? FLT_MAX : 1.0 / r0.x);
	r0.x = r0.x + c2.y;
	r0.x = clamp(r0.x * c2.z, 0.0, 1.0);
	r0.y = (r0.x * c3.x) + c3.y;
	r0.x = r0.x * r0.x;
	r0.x = r0.x * r0.y;
	r0.x = (r0.x * -c3.z) + c3.w;
	r0.xy = r0.xx * c0.xy;
	r0.z = ((t7.w == 0.0) ? FLT_MAX : 1.0 / t7.w);
	r0.zw = r0.zz * t7.yx;
	r1.x = (r0.w * c17.x) + c17.z;
	r1.y = (r0.z * c17.y) + c17.w;
	r2.w = c2.x;
	r0.zw = (c0.yx * r2.ww) + r1.yx;
	r1.xy = (r0.xy * c4.xy) + r0.wz;
	r2.xy = (r0.xy * c5.xy) + r0.wz;
	r3.xy = (r0.xy * c5.wz) + r0.wz;
	r4.xy = (r0.xy * c6.xy) + r0.wz;
	r5.xy = (r0.xy * c6.wz) + r0.wz;
	r6.xy = (r0.xy * c7.xy) + r0.wz;
	r7.xy = (r0.xy * c7.wz) + r0.wz;
	r8.xy = (r0.xy * c8.xy) + r0.wz;
	r9.xy = (r0.xy * c8.wz) + r0.wz;
	r10.xy = (r0.xy * c9.xy) + r0.wz;
	r11.xy = (r0.xy * c9.wz) + r0.wz;
	r12.xy = (r0.xy * c10.xy) + r0.wz;
	r13.xy = (r0.xy * c10.wz) + r0.wz;
	r14.xy = (r0.xy * c11.xy) + r0.wz;
	r15.xy = (r0.xy * c11.wz) + r0.wz;
	r0.xy = (r0.xy * c12.xy) + r0.wz;
	r1 = s0_texture.sample(s0, r1.xy);
	r2 = s0_texture.sample(s0, r2.xy);
	r3 = s0_texture.sample(s0, r3.xy);
	r4 = s0_texture.sample(s0, r4.xy);
	r5 = s0_texture.sample(s0, r5.xy);
	r6 = s0_texture.sample(s0, r6.xy);
	r7 = s0_texture.sample(s0, r7.xy);
	r8 = s0_texture.sample(s0, r8.xy);
	r9 = s0_texture.sample(s0, r9.xy);
	r10 = s0_texture.sample(s0, r10.xy);
	r11 = s0_texture.sample(s0, r11.xy);
	r12 = s0_texture.sample(s0, r12.xy);
	r13 = s0_texture.sample(s0, r13.xy);
	r14 = s0_texture.sample(s0, r14.xy);
	r0 = s0_texture.sample(s0, r0.xy);
	r15 = s0_texture.sample(s0, r15.xy);
	r0.x = (r1.y * c4.z) + c4.w;
	r0.x = (r2.y * c2.w) + r0.x;
	r0.x = (r3.y * c2.w) + r0.x;
	r0.x = (r4.y * c2.w) + r0.x;
	r0.x = (r5.y * c2.w) + r0.x;
	r0.x = (r6.y * c2.w) + r0.x;
	r0.x = (r7.y * c2.w) + r0.x;
	r0.x = (r8.y * c2.w) + r0.x;
	r0.x = (r9.y * c2.w) + r0.x;
	r0.x = (r10.y * c2.w) + r0.x;
	r0.x = (r11.y * c2.w) + r0.x;
	r0.x = (r12.y * c2.w) + r0.x;
	r0.x = (r13.y * c2.w) + r0.x;
	r0.x = (r14.y * c2.w) + r0.x;
	r0.x = (r15.y * c2.w) + r0.x;
	r0.x = (r0.y * c2.w) + r0.x;
	r0.x = abs(r0.x);
	r0.x = -r0.x + -c4.w;
	r0.yzw = r0.xxx * c1.zyx;
	r0.yzw = r0.yzw * c30.xxx;
	r0.xyz = ((r0.x >= 0.0) ? r0.wzy : c12.zzz);
	r0.w = -c4.w;
	oC0 = r0;
	#undef c0
	#undef c1
	#undef c17
	#undef c18
	#undef c30
	#undef t3
	#undef t7
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

