/* Transparent UIKit input only. Panorama still draws/clips every setting
   and owns its vertical scrollbar. No blur, extra texture or render pass. */
static SourceTouchSettingsState settingsScrollState={};
static SourceTouchSettingsState settingsScrollAppliedState={};
static CGSize settingsScrollAppliedHostSize=CGSizeZero;
static bool settingsScrollLayoutApplied=false;
static void (*settingsScrollCallback)(const char *,float)=nullptr;
static uint64_t settingsScrollSamples=0,settingsScrollTaps=0,settingsSliderDrags=0,settingsScrollCancels=0;

enum SettingsTouchIntent { SettingsPending, SettingsVertical, SettingsHorizontalSlider, SettingsIgnore };
static SettingsTouchIntent settingsTouchIntent(CGPoint delta,bool slider) {
    if (std::max(std::abs(delta.x),std::abs(delta.y))<6) return SettingsPending;
    if (std::abs(delta.y)>std::abs(delta.x)) return SettingsVertical;
    return slider?SettingsHorizontalSlider:SettingsIgnore;
}
static bool settingsPointOnSlider(CGPoint point) {
    if (!host || settingsScrollState.render_width<=0 || settingsScrollState.render_height<=0) return false;
    CGFloat sx=host.bounds.size.width/settingsScrollState.render_width;
    CGFloat sy=host.bounds.size.height/settingsScrollState.render_height;
    for (uint32_t i=0;i<settingsScrollState.slider_count;++i) {
        const auto &r=settingsScrollState.sliders[i];
        if (CGRectContainsPoint(CGRectMake(r.x*sx,r.y*sy,r.width*sx,r.height*sy),point)) return true;
    }
    return false;
}

@interface ICSMSettingsContent : UIView
@property(nonatomic,strong) UITouch *primaryTouch;
@property(nonatomic,weak) UIView *pointerHost;
@property(nonatomic) CGPoint origin;
@property(nonatomic) CGFloat maxDistance;
@property(nonatomic) BOOL startedOnSlider;
@property(nonatomic) BOOL forwarded;
-(void)cancelPending;
@end

@interface ICSMSettingsScroll : UIScrollView <UIScrollViewDelegate>
@property(nonatomic) BOOL applyingState;
@property(nonatomic) BOOL animatingScroll;
@property(nonatomic,copy) NSString *tabID;
@property(nonatomic,strong) ICSMSettingsContent *pointerContent;
@end
static ICSMSettingsScroll *settingsScroll;

@implementation ICSMSettingsContent
-(void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event {
    if (self.primaryTouch || !host) return;
    UITouch *touch=touches.anyObject;
    if (touch.type==UITouchTypeIndirectPointer) return;
    self.primaryTouch=touch;self.pointerHost=host;
    self.origin=[touch locationInView:host];self.maxDistance=0;
    self.startedOnSlider=settingsPointOnSlider(self.origin);self.forwarded=NO;
    // Defer the SDL mouse-down. A vertical drag must never change a slider
    // or activate a button, even after a long stationary touch-down.
}
-(void)touchesMoved:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event {
    UITouch *touch=self.primaryTouch;UIView *v=self.pointerHost;
    if (!touch || !v || ![touches containsObject:touch]) return;
    CGPoint p=[touch locationInView:v],delta=CGPointMake(p.x-self.origin.x,p.y-self.origin.y);
    self.maxDistance=std::max(self.maxDistance,std::hypot(delta.x,delta.y));
    NSSet *one=[NSSet setWithObject:touch];
    // UIScrollView has already rejected this horizontal gesture. Ownership
    // stays with the Source slider until release, including diagonal jitter.
    if (!self.forwarded && settingsTouchIntent(delta,self.startedOnSlider)==SettingsHorizontalSlider &&
        (settingsScroll.panGestureRecognizer.state==UIGestureRecognizerStateFailed || !settingsScroll.scrollEnabled)) {
        self.forwarded=YES;++settingsSliderDrags;[v touchesBegan:one withEvent:event];
    }
    if (self.forwarded) [v touchesMoved:one withEvent:event];
}
-(void)touchesEnded:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event {
    UITouch *touch=self.primaryTouch;UIView *v=self.pointerHost;
    if (!touch || !v || ![touches containsObject:touch]) return;
    CGPoint p=[touch locationInView:v];
    self.maxDistance=std::max(self.maxDistance,std::hypot(p.x-self.origin.x,p.y-self.origin.y));
    NSSet *one=[NSSet setWithObject:touch];
    if (self.forwarded) [v touchesEnded:one withEvent:event];
    else if (self.maxDistance<=8 && !settingsScroll.dragging && !settingsScroll.decelerating) {
        // Actual UITouch and original SDL coordinate conversion/Source input,
        // rather than synthesising a click or reimplementing widget actions.
        ++settingsScrollTaps;[v touchesBegan:one withEvent:event];[v touchesEnded:one withEvent:event];
    }
    self.primaryTouch=nil;self.pointerHost=nil;self.forwarded=NO;
}
-(void)touchesCancelled:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event {
    if (self.primaryTouch && [touches containsObject:self.primaryTouch]) [self cancelPending];
}
-(void)cancelPending {
    if (!self.primaryTouch) return;
    // Only a slider can have received a down event; cancelled vertical
    // gestures have never entered SDL and cannot become an accidental tap.
    if (self.forwarded && self.pointerHost)
        [self.pointerHost touchesCancelled:[NSSet setWithObject:self.primaryTouch] withEvent:nil];
    ++settingsScrollCancels;self.primaryTouch=nil;self.pointerHost=nil;self.forwarded=NO;
}
@end

@implementation ICSMSettingsScroll
-(instancetype)initWithFrame:(CGRect)frame {
    if ((self=[super initWithFrame:frame])) {
        self.backgroundColor=UIColor.clearColor;self.opaque=NO;self.clipsToBounds=YES;
        self.delegate=self;self.directionalLockEnabled=YES;self.scrollsToTop=NO;
        self.delaysContentTouches=NO;self.canCancelContentTouches=YES;
        self.showsVerticalScrollIndicator=YES;self.showsHorizontalScrollIndicator=NO;
        self.indicatorStyle=UIScrollViewIndicatorStyleWhite;
        self.contentInsetAdjustmentBehavior=UIScrollViewContentInsetAdjustmentNever;
        self.bounces=NO;self.alwaysBounceVertical=NO;self.alwaysBounceHorizontal=NO;
        self.decelerationRate=UIScrollViewDecelerationRateNormal;
        self.panGestureRecognizer.maximumNumberOfTouches=1;
        self.pointerContent=[[ICSMSettingsContent alloc] initWithFrame:CGRectZero];
        self.pointerContent.backgroundColor=UIColor.clearColor;self.pointerContent.opaque=NO;
        self.pointerContent.multipleTouchEnabled=YES;[self addSubview:self.pointerContent];
        self.accessibilityIdentifier=@"ICSMSettingsScroll";
    }return self;
}
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer*)recognizer {
    if (recognizer==self.panGestureRecognizer) {
        CGPoint delta=[self.panGestureRecognizer translationInView:self];
        if (std::abs(delta.y)<=std::abs(delta.x)) return NO;
    }
    return [super gestureRecognizerShouldBegin:recognizer];
}
-(BOOL)touchesShouldCancelInContentView:(UIView*)view { return YES; }
-(UIView*)hitTest:(CGPoint)point withEvent:(UIEvent*)event {
    // External mice retain the original SDL pointer/wheel path.
    for (UITouch *touch in event.allTouches) if (touch.type==UITouchTypeIndirectPointer) return nil;
    return [super hitTest:point withEvent:event];
}
-(void)scrollViewDidScroll:(UIScrollView*)scrollView {
    if (self.applyingState || self.hidden || !settingsScrollCallback || self.bounds.size.height<=0) return;
    std::lock_guard<std::recursive_mutex> lock(mutex);
    ++settingsScrollSamples;
    settingsScrollCallback(self.tabID.UTF8String,(float)(self.contentOffset.y*settingsScrollState.viewport.height/self.bounds.size.height));
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView*)scrollView { self.animatingScroll=NO; }
@end

static void updateSettingsScrollLayout() {
    if (!NSThread.isMainThread || !settingsScroll) return;
    bool show=host && host.window && settingsScrollState.visible && !editing && !consoleVisible &&
        settingsScrollState.render_width>0 && settingsScrollState.render_height>0 &&
        settingsScrollState.viewport.width>0 && settingsScrollState.viewport.height>0;
    CGSize hostSize=host?host.bounds.size:CGSizeZero;
    if (settingsScrollLayoutApplied && show==!settingsScroll.hidden &&
        std::memcmp(&settingsScrollState,&settingsScrollAppliedState,sizeof(settingsScrollState))==0 &&
        CGSizeEqualToSize(hostSize,settingsScrollAppliedHostSize) && (!show || settingsScroll.superview==host)) return;
    settingsScroll.applyingState=YES;
    if (show) {
        NSString *tab=[NSString stringWithUTF8String:settingsScrollState.tab_id]?:@"";
        bool changed=settingsScroll.hidden || ![settingsScroll.tabID isEqualToString:tab];
        CGFloat sx=hostSize.width/settingsScrollState.render_width,sy=hostSize.height/settingsScrollState.render_height;
        const auto &r=settingsScrollState.viewport;
        CGRect frame=CGRectMake(r.x*sx,r.y*sy,r.width*sx,r.height*sy);
        // UIKit derives frame from center/bounds and may differ by a few
        // floating-point bits. Such differences must never cancel a drag.
        CGRect current=settingsScroll.frame;
        bool resized=std::abs(current.origin.x-frame.origin.x)>.25 || std::abs(current.origin.y-frame.origin.y)>.25 ||
            std::abs(current.size.width-frame.size.width)>.25 || std::abs(current.size.height-frame.size.height)>.25;
        if (changed || resized) {
            settingsScroll.animatingScroll=NO;
            [settingsScroll.pointerContent cancelPending];
            settingsScroll.panGestureRecognizer.enabled=NO;settingsScroll.panGestureRecognizer.enabled=YES;
            [settingsScroll setContentOffset:settingsScroll.contentOffset animated:NO];
        }
        if (settingsScroll.superview!=host) [host addSubview:settingsScroll];
        if (resized) settingsScroll.frame=frame;
        CGSize size=CGSizeMake(frame.size.width,std::max(r.height,settingsScrollState.content_height)*sy);
        if (!CGSizeEqualToSize(size,settingsScroll.contentSize)) settingsScroll.contentSize=size;
        CGRect contentFrame=CGRectMake(0,0,size.width,size.height);
        if (!CGRectEqualToRect(settingsScroll.pointerContent.frame,contentFrame)) settingsScroll.pointerContent.frame=contentFrame;
        if (changed || resized || (!settingsScroll.tracking && !settingsScroll.dragging && !settingsScroll.decelerating && !settingsScroll.animatingScroll)) {
            CGFloat offset=std::clamp((CGFloat)settingsScrollState.scroll_offset*sy,(CGFloat)0,std::max((CGFloat)0,size.height-frame.size.height));
            if (std::abs(settingsScroll.contentOffset.y-offset)>.5) [settingsScroll setContentOffset:CGPointMake(0,offset) animated:NO];
        }
        settingsScroll.tabID=tab;
    } else if (!settingsScroll.hidden) {
        settingsScroll.animatingScroll=NO;
        [settingsScroll.pointerContent cancelPending];
        [settingsScroll setContentOffset:settingsScroll.contentOffset animated:NO];
        settingsScroll.panGestureRecognizer.enabled=NO;settingsScroll.panGestureRecognizer.enabled=YES;
    }
    settingsScroll.hidden=!show;settingsScroll.applyingState=NO;
    settingsScrollLayoutApplied=true;settingsScrollAppliedState=settingsScrollState;settingsScrollAppliedHostSize=hostSize;
}

static NSDictionary *settingsScrollDiagnostics() {
    CGRect f=settingsScroll.frame;
    return @{@"backend":@"UIScrollView + original Panorama vertical scrollbar/SDL widgets",
        @"visible":@((bool)(settingsScroll && !settingsScroll.hidden)),@"tab":settingsScroll.tabID?:@"",
        @"viewport_points":@[@(f.origin.x),@(f.origin.y),@(f.size.width),@(f.size.height)],
        @"content_height_points":@(settingsScroll.contentSize.height),@"offset_points":@(settingsScroll.contentOffset.y),
        @"source_offset_pixels":@(settingsScrollState.scroll_offset),@"slider_count":@(settingsScrollState.slider_count),
        @"dragging":@(settingsScroll.dragging),@"decelerating":@(settingsScroll.decelerating),
        @"scroll_samples":@(settingsScrollSamples),@"taps":@(settingsScrollTaps),@"slider_drags":@(settingsSliderDrags),@"cancelled_content_touches":@(settingsScrollCancels)};
}
static void shutdownSettingsScroll() {
    std::lock_guard<std::recursive_mutex> lock(mutex);settingsScrollCallback=nullptr;settingsScrollState={};settingsScrollLayoutApplied=false;
    void (^remove)(void)=^{[settingsScroll.pointerContent cancelPending];[settingsScroll removeFromSuperview];settingsScroll=nil;};
    if (NSThread.isMainThread) remove();else dispatch_async(dispatch_get_main_queue(),remove);
}
extern "C" void SourceTouchSetSettingsScrollCallback(void (*scroll)(const char*,float)) {
    std::lock_guard<std::recursive_mutex> lock(mutex);settingsScrollCallback=scroll;
}
extern "C" void SourceTouchUpdateSettings(const SourceTouchSettingsState *settings) {
    if (!NSThread.isMainThread || !settings || settings->struct_size!=sizeof(*settings) || settings->slider_count>SOURCE_SETTINGS_SLIDER_LIMIT) return;
    std::lock_guard<std::recursive_mutex> lock(mutex);settingsScrollState=*settings;
    if (!settingsScroll && settings->visible && host) settingsScroll=[[ICSMSettingsScroll alloc] initWithFrame:CGRectZero];
    updateSettingsScrollLayout();
}
extern "C" bool SourceTouchSettingsScrollTo(float pixels,bool animated) {
    std::lock_guard<std::recursive_mutex> lock(mutex);
    if (!NSThread.isMainThread || !settingsScroll || settingsScroll.hidden || !std::isfinite(pixels) || settingsScrollState.viewport.height<=0) return false;
    CGFloat points=pixels*settingsScroll.bounds.size.height/settingsScrollState.viewport.height;
    points=std::clamp(points,(CGFloat)0,std::max((CGFloat)0,settingsScroll.contentSize.height-settingsScroll.bounds.size.height));
    settingsScroll.animatingScroll=animated && std::abs(settingsScroll.contentOffset.y-points)>.5;
    [settingsScroll setContentOffset:CGPointMake(0,points) animated:animated];return true;
}
extern "C" size_t SourceTouchSettingsScrollSelfTestJSON(char *buffer,size_t capacity) {
    if (!buffer || !capacity) return 0;
    bool pass=settingsTouchIntent(CGPointMake(2,2),true)==SettingsPending &&
        settingsTouchIntent(CGPointMake(3,20),true)==SettingsVertical &&
        settingsTouchIntent(CGPointMake(3,-20),false)==SettingsVertical &&
        settingsTouchIntent(CGPointMake(20,3),true)==SettingsHorizontalSlider &&
        settingsTouchIntent(CGPointMake(-20,3),false)==SettingsIgnore;
    NSData *json=[NSJSONSerialization dataWithJSONObject:@{@"passed":@(pass),@"fixtures":@5,
        @"scope":@"direction classifier only; no fabricated touch events or host callbacks",@"runtime":settingsScrollDiagnostics()} options:0 error:nil];
    if (json.length+1>capacity) return 0;std::memcpy(buffer,json.bytes,json.length);buffer[json.length]=0;return json.length;
}
