#pragma once
// POD bridge: Source's CViewSetup/VMatrix ABI never crosses into Objective-C.
struct ICSMInterpolationView {
    int x,y,width,height,outputWidth,outputHeight;
    float worldToView[16],viewToClip[16],worldToClip[16]; // Source row-major
    float nearPlane,farPlane,aspect,verticalFOV;
    float cameraOrigin[3];
    double simulationTime;
};
using ICSMInterpolationDepthFn = void (*)(const ICSMInterpolationView *);
using ICSMInterpolationColorFn = void (*)();
using ICSMInterpolationViewmodelFn = void (*)();
