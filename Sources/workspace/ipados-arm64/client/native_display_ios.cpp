// I2 UIKit display query; database methods retained from M6 native_display.cpp.
#include "togl/rendermechanism.h"
#include "metal_window.h"
extern "C" bool SourceMetalUIKitDisplay(unsigned*,unsigned*,unsigned*);
static GLMDisplayModeInfoFields currentMode() {
    unsigned w=0,h=0,hz=0;
    if(!SourceMetalUIKitDisplay(&w,&h,&hz))Error("UIKit display is not attached\n");
    return {w,h,hz};
}
// The full client already defines GLMDisplayMode in original sdlmgr.cpp.
GLMDisplayInfo::GLMDisplayInfo(CGDirectDisplayID id,CGOpenGLDisplayMask) : m_modes(nullptr),m_display(id) {
    memset(&m_info,0,sizeof(m_info)); auto mode=currentMode();
    m_info.m_cgDisplayID=id; m_info.m_displayPixelWidth=mode.m_modePixelWidth; m_info.m_displayPixelHeight=mode.m_modePixelHeight;
    m_DesktopMode.Init(mode.m_modePixelWidth,mode.m_modePixelHeight,mode.m_modeRefreshHz);
}
GLMDisplayInfo::~GLMDisplayInfo() { if(m_modes) { m_modes->PurgeAndDeleteElements(); delete m_modes; } }
void GLMDisplayInfo::PopulateModes() {
    if(m_modes)return;
    m_modes=new CUtlVector<GLMDisplayMode*>;auto mode=currentMode();
    m_modes->AddToTail(new GLMDisplayMode(mode.m_modePixelWidth,mode.m_modePixelHeight,mode.m_modeRefreshHz));
}
void GLMDisplayInfo::Dump(int which) { Msg("Metal display %d: %ux%u\n",which,m_info.m_displayPixelWidth,m_info.m_displayPixelHeight); }
GLMRendererInfo::GLMRendererInfo(GLMRendererInfoFields *info) : m_info(*info),m_displays(nullptr) {}
GLMRendererInfo::~GLMRendererInfo() { if(m_displays) { m_displays->PurgeAndDeleteElements(); delete m_displays; } }
void GLMRendererInfo::PopulateDisplays() {
    if(m_displays) return;
    m_displays=new CUtlVector<GLMDisplayInfo*>;
    // I2 owns one UIKit window. Ordinal zero identifies that window's
    // actual screen; it is not a CoreGraphics desktop display identifier.
    auto d=new GLMDisplayInfo(0,0); d->PopulateModes(); m_displays->AddToTail(d);
}
void GLMRendererInfo::Dump(int which) { Msg("Metal device %d: %s\n",which,m_info.m_pciModelString); }
GLMDisplayDB::GLMDisplayDB() : m_renderers(nullptr) {}
GLMDisplayDB::~GLMDisplayDB() { if(m_renderers) { m_renderers->PurgeAndDeleteElements(); delete m_renderers; } }
void GLMDisplayDB::PopulateRenderers() {
    if(m_renderers) return;
    m_renderers=new CUtlVector<GLMRendererInfo*>;
    GLMRendererInfoFields info; SourceMetalFillRendererInfo(&info);
    auto r=new GLMRendererInfo(&info); r->PopulateDisplays(); m_renderers->AddToTail(r);
}
void GLMDisplayDB::PopulateFakeAdapters(uint r) {
    if(r>=static_cast<uint>(m_renderers->Count())) return;
    for(int i=0;i<(*m_renderers)[r]->m_displays->Count();++i) { GLMFakeAdapter a={static_cast<int>(r),i}; m_fakeAdapters.AddToTail(a); }
}
void GLMDisplayDB::Populate() { PopulateRenderers(); if(!m_fakeAdapters.Count()) for(int r=0;r<m_renderers->Count();++r) PopulateFakeAdapters(r); }
int GLMDisplayDB::GetFakeAdapterCount() { return m_fakeAdapters.Count(); }
bool GLMDisplayDB::GetFakeAdapterInfo(int n,int *ro,int *dout,GLMRendererInfoFields *ri,GLMDisplayInfoFields *di) {
    if(n<0 || n>=m_fakeAdapters.Count()) return true;
    auto a=m_fakeAdapters[n]; if(ro)*ro=a.m_rendererIndex; if(dout)*dout=a.m_displayIndex;
    return (ri && GetRendererInfo(a.m_rendererIndex,ri)) || (di && GetDisplayInfo(a.m_rendererIndex,a.m_displayIndex,di));
}
int GLMDisplayDB::GetRendererCount() { return m_renderers ? m_renderers->Count():0; }
bool GLMDisplayDB::GetRendererInfo(int r,GLMRendererInfoFields *out) { if(r<0 || r>=GetRendererCount())return true; *out=(*m_renderers)[r]->m_info; return false; }
int GLMDisplayDB::GetDisplayCount(int r) { return r<0 || r>=GetRendererCount() ? 0:(*m_renderers)[r]->m_displays->Count(); }
bool GLMDisplayDB::GetDisplayInfo(int r,int d,GLMDisplayInfoFields *out) {
    if(d<0 || d>=GetDisplayCount(r))return true;
    auto display=(*(*m_renderers)[r]->m_displays)[d];auto mode=currentMode();
    display->m_info.m_displayPixelWidth=mode.m_modePixelWidth;
    display->m_info.m_displayPixelHeight=mode.m_modePixelHeight;
    *out=display->m_info; return false;
}
int GLMDisplayDB::GetModeCount(int r,int d) { return d<0 || d>=GetDisplayCount(r) ? 0:(*(*m_renderers)[r]->m_displays)[d]->m_modes->Count(); }
bool GLMDisplayDB::GetModeInfo(int r,int d,int n,GLMDisplayModeInfoFields *out) {
    if(d<0 || d>=GetDisplayCount(r))return true;
    auto display=(*(*m_renderers)[r]->m_displays)[d];
    if(n==-1) {
        auto mode=currentMode();
        display->m_DesktopMode.Init(mode.m_modePixelWidth,mode.m_modePixelHeight,mode.m_modeRefreshHz);
        *out=display->m_DesktopMode.m_info; return false;
    }
    if(n<0 || n>=GetModeCount(r,d))return true;
    auto mode=currentMode();
    (*display->m_modes)[n]->Init(mode.m_modePixelWidth,mode.m_modePixelHeight,mode.m_modeRefreshHz);
    *out=(*display->m_modes)[n]->m_info; return false;
}
void GLMDisplayDB::Dump() { for(int r=0;r<GetRendererCount();++r) (*m_renderers)[r]->Dump(r); }
