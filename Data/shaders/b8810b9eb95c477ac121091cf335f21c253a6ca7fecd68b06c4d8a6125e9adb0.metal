#include <metal_stdlib>
#include <metal_common>
#include <metal_math>
#include <metal_geometric>
#include <metal_texture>

using namespace metal;

struct source_main_Uniforms
{
	float4 uniforms_float4[7];
};

struct source_main_Input
{
	float4 v0 [[user(texcoord0)]];
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
	constant source_main_Uniforms &uniforms [[buffer(0)]],
	source_main_Input input [[stage_in]]
) {
	source_main_Output output;
	const float4 c0 = float4(8.333333582e-02, 5.000000000e-01, -2.000000000e+00, 3.000000000e+00); (void) c0;
	const float4 c1 = float4(2.500000000e-01, 1.500000000e+00, 4.000000000e+00, 1.200000000e+01); (void) c1;
	const float4 c2 = float4(2.989999950e-01, 5.870000124e-01, 1.140000001e-01, 6.999999881e-01); (void) c2;
	const float4 c3 = float4(1.428571463e+00, 1.000000000e+00, 3.300000131e-01, 6.700000167e-01); (void) c3;
	const float4 c4 = float4(0.000000000e+00, -0.000000000e+00, -1.000000000e+00, 1.000000000e+00); (void) c4;
	const float4 c6 = float4(1.000000000e+00, 0.000000000e+00, -1.000000000e+00, -2.000000000e+00); (void) c6;
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
	#define c5 uniforms.uniforms_float4[0]
	#define c8 uniforms.uniforms_float4[1]
	#define c9 uniforms.uniforms_float4[2]
	#define c10 uniforms.uniforms_float4[3]
	#define c15 uniforms.uniforms_float4[4]
	#define c22 uniforms.uniforms_float4[5]
	#define c23 uniforms.uniforms_float4[6]
	#define v0 input.v0
	#define oC0 output.oC0
	r0 = s0_texture.sample(s0, v0.zw);
	r0.xyz = r0.xyz * c5.xxx;
	r1 = c6.xxyy * v0.xyxx;
	r1 = s1_texture.sample(s1, r1.xy, level(r1.w));
	r2.xyz = c6.xyz;
	r3.xyz = (c22.yxy * r2.xxy) + v0.yxy;
	r4.xzw = c6.xyy * v0.xxx;
	r4.y = r3.x;
	r4 = s1_texture.sample(s1, r4.xy, level(r4.w));
	r3 = r3.yzyy * c6.xxyy;
	r3 = s1_texture.sample(s1, r3.xy, level(r3.w));
	r3.xzw = (c22.yxy * r2.zzy) + v0.yxy;
	r5.xzw = c6.xyy * v0.xxx;
	r5.y = r3.x;
	r5 = s1_texture.sample(s1, r5.xy, level(r5.w));
	r6 = r3.zwzz * c6.xxyy;
	r6 = s1_texture.sample(s1, r6.xy, level(r6.w));
	r2.w = max(r4.y, r1.y);
	r3.x = min(r1.y, r4.y);
	r4.x = max(r3.y, r2.w);
	r2.w = min(r3.x, r3.y);
	r3.x = max(r5.y, r6.y);
	r3.z = min(r6.y, r5.y);
	r5.x = max(r3.x, r4.x);
	r4.x = min(r2.w, r3.z);
	r2.w = r5.x * c23.z;
	r3.x = -r4.x + r5.x;
	r3.z = max(c23.w, r2.w);
	if (r3.x < r3.z) {
		oC0.w = r1.w;
	} else {
		r7.xy = -c22.xy + v0.xy;
		r7.zw = c6.yy;
		r7 = s1_texture.sample(s1, r7.xy, level(r7.w));
		r8.xy = c22.xy + v0.xy;
		r8.zw = c6.yy;
		r8 = s1_texture.sample(s1, r8.xy, level(r8.w));
		r9 = (c22.xyxy * r2.xzzx) + v0.xyxy;
		r10 = r9.xyxx * c6.xxyy;
		r10 = s1_texture.sample(s1, r10.xy, level(r10.w));
		r9 = r9.zwxx * c6.xxyy;
		r9 = s1_texture.sample(s1, r9.xy, level(r9.w));
		r2.x = r4.y + r5.y;
		r2.z = r3.y + r6.y;
		r2.w = ((r3.x == 0.0) ? FLT_MAX : 1.0 / r3.x);
		r3.x = r2.z + r2.x;
		r2.x = (r1.y * c6.w) + r2.x;
		r2.z = (r1.y * c6.w) + r2.z;
		r3.z = r8.y + r10.y;
		r3.w = r7.y + r10.y;
		r4.x = (r3.y * c6.w) + r3.z;
		r3.w = (r5.y * c6.w) + r3.w;
		r4.z = r7.y + r9.y;
		r4.w = r8.y + r9.y;
		r2.x = (abs(r2.x) * -c6.w) + abs(r4.x);
		r2.z = (abs(r2.z) * -c6.w) + abs(r3.w);
		r3.w = (r6.y * c6.w) + r4.z;
		r4.x = (r4.y * c6.w) + r4.w;
		r2.x = r2.x + abs(r3.w);
		r2.z = r2.z + abs(r4.x);
		r3.z = r3.z + r4.z;
		r2.x = -r2.z + r2.x;
		r2.z = (r3.x * -c6.w) + r3.z;
		r3.x = ((r2.x >= 0.0) ? r5.y : r6.y);
		r3.y = ((r2.x >= 0.0) ? r4.y : r3.y);
		r3.z = ((r2.x >= 0.0) ? c22.y : c22.x);
		r2.z = (r2.z * c0.x) + -r1.y;
		r3.w = -r1.y + r3.x;
		r4.x = -r1.y + r3.y;
		r3.xy = r1.yy + r3.xy;
		r4.y = abs(r3.w) + -abs(r4.x);
		r5.x = max(abs(r3.w), abs(r4.x));
		r3.z = ((r4.y >= 0.0) ? -r3.z : r3.z);
		r2.z = clamp(r2.w * abs(r2.z), 0.0, 1.0);
		r2.w = ((r2.x >= 0.0) ? c22.x : r2.y);
		r2.y = ((r2.x >= 0.0) ? r2.y : c22.y);
		r4.xz = (r3.zz * c0.yy) + v0.xy;
		r3.w = ((r2.x >= 0.0) ? v0.x : r4.x);
		r4.x = ((r2.x >= 0.0) ? r4.z : v0.y);
		r6.x = -r2.w + r3.w;
		r6.y = -r2.y + r4.x;
		r7.x = r2.w + r3.w;
		r7.y = r2.y + r4.x;
		r3.w = (r2.z * c0.z) + c0.w;
		r6.zw = c6.yy;
		r8 = s1_texture.sample(s1, r6.xy, level(r6.w));
		r2.z = r2.z * r2.z;
		r7.zw = c6.yy;
		r9 = s1_texture.sample(s1, r7.xy, level(r7.w));
		r3.x = ((r4.y >= 0.0) ? r3.x : r3.y);
		r3.y = r5.x * c1.x;
		r4.x = (r3.x * -c0.y) + r1.y;
		r2.z = r2.z * r3.w;
		r4.y = (r3.x * -c0.y) + r8.y;
		r4.z = (r3.x * -c0.y) + r9.y;
		r5.yz = (r5.xx * -c1.xx) + abs(r4.yz);
		r3.w = (r2.w * -c1.y) + r6.x;
		r8.x = ((r5.y >= 0.0) ? r6.x : r3.w);
		r3.w = (r2.y * -c1.y) + r6.y;
		r8.y = ((r5.y >= 0.0) ? r6.y : r3.w);
		r6.x = ((r5.y >= 0.0) ? c6.y : c6.x);
		r6.y = ((r5.z >= 0.0) ? c6.y : c6.x);
		r3.w = r6.y + r6.x;
		r4.w = (r2.w * c1.y) + r7.x;
		r6.x = ((r5.z >= 0.0) ? r7.x : r4.w);
		r4.w = (r2.y * c1.y) + r7.y;
		r6.y = ((r5.z >= 0.0) ? r7.y : r4.w);
		if (-r3.w < c6.y) {
			if (abs(r4.y) >= r3.y) {
			} else {
				r8.zw = c6.yy;
				r7 = s1_texture.sample(s1, r8.xy, level(r8.w));
				r4.y = r7.y;
			}
			if (abs(r4.z) >= r3.y) {
			} else {
				r6.zw = c6.yy;
				r7 = s1_texture.sample(s1, r6.xy, level(r6.w));
				r4.z = r7.y;
			}
			r3.w = (r3.x * -c0.y) + r4.y;
			r4.y = ((r5.y >= 0.0) ? r4.y : r3.w);
			r3.w = (r3.x * -c0.y) + r4.z;
			r4.z = ((r5.z >= 0.0) ? r4.z : r3.w);
			r5.yz = (r5.xx * -c1.xx) + abs(r4.yz);
			r3.w = (r2.w * c6.w) + r8.x;
			r8.x = ((r5.y >= 0.0) ? r8.x : r3.w);
			r3.w = (r2.y * c6.w) + r8.y;
			r8.y = ((r5.y >= 0.0) ? r8.y : r3.w);
			r7.x = ((r5.y >= 0.0) ? c6.y : c6.x);
			r7.y = ((r5.z >= 0.0) ? c6.y : c6.x);
			r3.w = r7.y + r7.x;
			r4.w = (r2.w * -c6.w) + r6.x;
			r6.x = ((r5.z >= 0.0) ? r6.x : r4.w);
			r4.w = (r2.y * -c6.w) + r6.y;
			r6.y = ((r5.z >= 0.0) ? r6.y : r4.w);
			if (-r3.w < c6.y) {
				if (abs(r4.y) >= r3.y) {
				} else {
					r8.zw = c6.yy;
					r7 = s1_texture.sample(s1, r8.xy, level(r8.w));
					r4.y = r7.y;
				}
				if (abs(r4.z) >= r3.y) {
				} else {
					r6.zw = c6.yy;
					r7 = s1_texture.sample(s1, r6.xy, level(r6.w));
					r4.z = r7.y;
				}
				r3.w = (r3.x * -c0.y) + r4.y;
				r4.y = ((r5.y >= 0.0) ? r4.y : r3.w);
				r3.w = (r3.x * -c0.y) + r4.z;
				r4.z = ((r5.z >= 0.0) ? r4.z : r3.w);
				r5.yz = (r5.xx * -c1.xx) + abs(r4.yz);
				r3.w = (r2.w * -c1.z) + r8.x;
				r8.x = ((r5.y >= 0.0) ? r8.x : r3.w);
				r3.w = (r2.y * -c1.z) + r8.y;
				r8.y = ((r5.y >= 0.0) ? r8.y : r3.w);
				r7.x = ((r5.y >= 0.0) ? c6.y : c6.x);
				r7.y = ((r5.z >= 0.0) ? c6.y : c6.x);
				r3.w = r7.y + r7.x;
				r4.w = (r2.w * c1.z) + r6.x;
				r6.x = ((r5.z >= 0.0) ? r6.x : r4.w);
				r4.w = (r2.y * c1.z) + r6.y;
				r6.y = ((r5.z >= 0.0) ? r6.y : r4.w);
				if (-r3.w < c6.y) {
					if (abs(r4.y) >= r3.y) {
					} else {
						r8.zw = c6.yy;
						r7 = s1_texture.sample(s1, r8.xy, level(r8.w));
						r4.y = r7.y;
					}
					if (abs(r4.z) >= r3.y) {
					} else {
						r6.zw = c6.yy;
						r7 = s1_texture.sample(s1, r6.xy, level(r6.w));
						r4.z = r7.y;
					}
					r3.y = (r3.x * -c0.y) + r4.y;
					r3.x = (r3.x * -c0.y) + r4.z;
					r4.y = ((r5.y >= 0.0) ? r4.y : r3.y);
					r4.z = ((r5.z >= 0.0) ? r4.z : r3.x);
					r3.xy = (r5.xx * -c1.xx) + abs(r4.yz);
					r3.w = (r2.w * -c1.w) + r8.x;
					r8.x = ((r3.x >= 0.0) ? r8.x : r3.w);
					r3.w = (r2.y * -c1.w) + r8.y;
					r8.y = ((r3.x >= 0.0) ? r8.y : r3.w);
					r2.w = (r2.w * c1.w) + r6.x;
					r2.y = (r2.y * c1.w) + r6.y;
					r6.xy = ((r3.y >= 0.0) ? r6.xy : r2.wy);
				}
			}
		}
		r2.y = -r8.x + v0.x;
		r2.w = r6.x + -v0.x;
		r3.x = -r8.y + v0.y;
		r2.y = ((r2.x >= 0.0) ? r2.y : r3.x);
		r3.x = r6.y + -v0.y;
		r2.w = ((r2.x >= 0.0) ? r2.w : r3.x);
		r3.x = ((r4.y >= 0.0) ? c6.y : c6.x);
		r3.y = ((r4.z >= 0.0) ? c6.y : c6.x);
		r3.w = ((r4.x >= 0.0) ? -c6.y : -c6.x);
		r3.xy = r3.ww + r3.xy;
		r3.w = r2.y + r2.w;
		r3.w = ((r3.w == 0.0) ? FLT_MAX : 1.0 / r3.w);
		r4.x = -r2.w + r2.y;
		r4.y = min(r2.w, r2.y);
		r2.y = ((r4.x >= 0.0) ? abs(r3.y) : abs(r3.x));
		r2.z = r2.z * r2.z;
		r2.w = (r4.y * -r3.w) + c0.y;
		r2.z = r2.z * c23.x;
		r2.y = ((-r2.y >= 0.0) ? c6.y : r2.w);
		r3.x = max(r2.y, r2.z);
		r2.yz = (r3.xx * r3.zz) + v0.xy;
		r3.x = ((r2.x >= 0.0) ? v0.x : r2.y);
		r3.y = ((r2.x >= 0.0) ? r2.z : v0.y);
		r3.zw = c6.yy;
		r1 = s1_texture.sample(s1, r3.xy, level(r3.w));
		oC0.w = r1.w;
	}
	r1.w = dot(r1.xyz, c2.xyz);
	r2.xy = (v0.zw * -c6.ww) + -c6.xx;
	r2.z = dot(r2.xy, r2.xy) + c6.y;
	r2.z = ((r2.z == 0.0) ? FLT_MAX : rsqrt(abs(r2.z)));
	r2.z = ((r2.z == 0.0) ? FLT_MAX : 1.0 / r2.z);
	r2.w = -c9.x + c9.y;
	r2.z = r2.z + -c9.x;
	r2.w = ((r2.w == 0.0) ? FLT_MAX : 1.0 / r2.w);
	r2.z = clamp(r2.w * r2.z, 0.0, 1.0);
	r2.w = (r2.z * c0.z) + c0.w;
	r2.z = r2.z * r2.z;
	r2.z = r2.z * r2.w;
	r3.z = c9.z;
	r4.x = mix(c8.x, r3.z, r2.z);
	r1.w = -r0.w + r1.w;
	r2.w = r1.w * r4.x;
	r3.xy = ((r4.x >= 0.0) ? c4.xy : c4.zw);
	r1.w = (r4.x * r1.w) + r3.y;
	r1.w = ((r1.w >= 0.0) ? r2.w : r3.x);
	r1.xyz = r1.www + r1.xyz;
	r1.w = r2.z * c8.z;
	r3.xyz = mix(r1.xyz, r0.www, r1.www);
	r0.xyz = (r0.xyz * c0.yyy) + r3.xyz;
	r1.xyz = (c15.xyz * r0.xyz) + -r0.xyz;
	r0.xyz = (c15.www * r1.xyz) + r0.xyz;
	r1.xy = abs(r2.xy) * abs(r2.xy);
	r1.zw = r1.xy * r1.xy;
	r1.xy = (r1.xy * -r1.zw) + c6.xx;
	r0.w = (r1.x * -r1.y) + c6.x;
	r1.x = clamp(c2.w + -v0.w, 0.0, 1.0);
	r0.w = r0.w * r1.x;
	r0.w = (r0.w * -c3.x) + c3.y;
	r0.w = (r0.w * c3.z) + c3.w;
	r0.xyz = r0.www * r0.xyz;
	oC0.xyz = (c10.xxx * -r0.xyz) + r0.xyz;
	#undef c5
	#undef c8
	#undef c9
	#undef c10
	#undef c15
	#undef c22
	#undef c23
	#undef v0
	#undef oC0
	if (source_alpha.x != 0.0) {
 float a=output.oC0.a, ref=source_alpha.y; uint fn=uint(source_alpha.z);
 bool pass=fn==1 ? false : fn==2 ? a<ref : fn==3 ? a==ref : fn==4 ? a<=ref : fn==5 ? a>ref : fn==6 ? a!=ref : fn==7 ? a>=ref : true;
 if (!pass) discard_fragment();
}
return output;
}

