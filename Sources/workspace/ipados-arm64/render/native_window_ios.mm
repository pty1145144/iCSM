#include "native_objects.h"
#include "metal_window.h"
#import <UIKit/UIKit.h>
#undef MIN
#undef MAX
namespace SourceMetal {
static CAMetalLayer *metalLayer=nil;
static UIView *metalHost=nil;
static SDL_Window *metalWindow=nullptr;
CAMetalLayer *layer() { return metalLayer; }
}
static void attachView(UIView *view) {
    if(!NSThread.isMainThread || ![view.layer isKindOfClass:CAMetalLayer.class])
        SourceMetal::fatal("UIKit attach",@"Requires a CAMetalLayer view on the main thread");
    SourceMetal::metalHost=view;
    auto l=SourceMetal::metalLayer=(CAMetalLayer*)view.layer;
    l.device=SourceMetal::device(); l.pixelFormat=MTLPixelFormatBGRA8Unorm;
    l.framebufferOnly=YES; l.maximumDrawableCount=3;
    l.contentsGravity=kCAGravityResizeAspect;
    SourceMetalResizeWindow(0,0);
}
extern "C" __attribute__((visibility("default"))) void SourceMetalAttachUIKitView(void *view) {
    attachView((__bridge UIView*)view);
}
extern "C" __attribute__((visibility("default"))) bool SourceMetalUIKitDisplay(unsigned *w,unsigned *h,unsigned *hz) {
    auto v=SourceMetal::metalHost;
    if(!v.window)return false;
    SourceMetalResizeWindow(0,0);
    *w=SourceMetal::metalLayer.drawableSize.width; *h=SourceMetal::metalLayer.drawableSize.height;
    *hz=v.window.screen.maximumFramesPerSecond;
    return *w && *h;
}
void *SourceMetalAttachWindow(SDL_Window *window) {
    SDL_MetalView view=SDL_Metal_CreateView(window);
    if(!view) Error("SDL Metal view failed: %s\n",SDL_GetError());
    SourceMetal::metalWindow=window;
    attachView((__bridge UIView*)view);
    return view;
}
void SourceMetalDetachWindow(void *view) {
    SourceMetal::metalLayer=nil; SourceMetal::metalHost=nil; SourceMetal::metalWindow=nullptr;
    if(view)SDL_Metal_DestroyView(view);
}
void SourceMetalResizeWindow(unsigned,unsigned) {
    auto view=SourceMetal::metalHost; auto l=SourceMetal::metalLayer;
    if(!view || !l || !view.window)return;
    // UIKit stretches the retained surface during a live window drag. Keep its
    // pixel dimensions and Source targets until effectiveGeometry settles.
    if(view.window.windowScene.effectiveGeometry.isInteractivelyResizing && l.drawableSize.width && l.drawableSize.height)return;
    // UIKit owns the window dimensions. Render targets can differ from the
    // drawable; Source Present performs its existing linear copy.
    CGFloat scale=view.window.screen.scale;
    view.contentScaleFactor=scale; l.contentsScale=scale;
    l.drawableSize=CGSizeMake(llround(view.bounds.size.width*scale),llround(view.bounds.size.height*scale));
}
extern "C" __attribute__((visibility("default"))) bool SourceMetalUIKitFullscreen() {
    auto view=SourceMetal::metalHost;if(!view.window)return false;
    CGRect window=[view.window convertRect:view.window.bounds toCoordinateSpace:view.window.screen.coordinateSpace];
    CGRect screen=view.window.screen.coordinateSpace.bounds;
    return fabs(window.origin.x-screen.origin.x)<1 && fabs(window.origin.y-screen.origin.y)<1 && fabs(window.size.width-screen.size.width)<1 && fabs(window.size.height-screen.size.height)<1;
}
void SourceMetalSizeWindow(SDL_Window *window,unsigned width,unsigned height) {
    if(window && window==SourceMetal::metalWindow && width && height) {
        CGFloat scale=SourceMetal::metalHost.window.screen.scale;
        SDL_SetWindowSize(window,llround(width/scale),llround(height/scale));
    }
    SourceMetalResizeWindow(width,height);
}
void SourceMetalPrintWindowStats() {
    auto v=SourceMetal::metalHost; auto l=SourceMetal::metalLayer;
    if(!v || !l) { Msg("Metal UIKit window unavailable\n");return; }
    Msg("Metal UIKit points=%.0fx%.0f drawable=%.0fx%.0f scale=%.3f safe_area=%.1f/%.1f/%.1f/%.1f\n",
        v.bounds.size.width,v.bounds.size.height,l.drawableSize.width,l.drawableSize.height,l.contentsScale,
        v.safeAreaInsets.top,v.safeAreaInsets.left,v.safeAreaInsets.bottom,v.safeAreaInsets.right);
}
void SourceMetalFillRendererInfo(GLMRendererInfoFields *info) {
    memset(info,0,sizeof(*info)); auto d=SourceMetal::device();
    info->m_fullscreen=info->m_accelerated=info->m_windowed=1;
    NSOperatingSystemVersion os=NSProcessInfo.processInfo.operatingSystemVersion;
    info->m_osComboVersion=(os.majorVersion<<16)|(os.minorVersion<<8)|os.patchVersion;
    info->m_pciVendorID=0x106b;
    V_strncpy(info->m_pciModelString,d.name.UTF8String,sizeof(info->m_pciModelString));
    V_strncpy(info->m_driverInfoString,"Native Metal (iPadOS)",sizeof(info->m_driverInfoString));
    info->m_vidMemory=info->m_texMemory=std::min<uint64_t>(d.recommendedMaxWorkingSetSize,INT_MAX);
    for(unsigned n=1;n<=8;n*=2)if([d supportsTextureSampleCount:n])info->m_maxSamples=n;
    info->m_maxAniso=16;
    info->m_hasGammaWrites=info->m_hasMixedAttachmentSizes=info->m_hasBGRA=true;
    info->m_hasNewFullscreenMode=info->m_hasOcclusionQuery=info->m_hasFramebufferBlit=info->m_hasUniformBuffers=true;
    info->m_nMaxVertexTIU=info->m_nNumVertexSamplers=4;
    info->m_nMaxCombinedTIU=info->m_nTotalSamplerCount=20;info->m_nFirstVertexSampler=16;
}
void SourceMetalRunFrame(void (*frame)(float),float frameTime) { @autoreleasepool { frame(frameTime); } }
