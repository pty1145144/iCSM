/* Covers remain in Source's Metal/Panorama renderer. This clear scroll view
   supplies UIKit's finger tracking, drag cancellation and deceleration only. */
static SourceTouchMapState mapGalleryState={};
static void (*mapGalleryScroll)(float)=nullptr;
static void (*mapGalleryActivate)(const char*)=nullptr;
static NSDictionary *mapGalleryDiagnostics;
static uint64_t mapGalleryScrollSamples=0,mapGalleryTaps=0;
static NSString *mapGalleryLastMap=@"";
static SourceTouchMapState mapGalleryAppliedState={};
static CGSize mapGalleryAppliedHostSize=CGSizeZero;
static bool mapGalleryLayoutApplied=false,mapGalleryAppliedVisible=false;
static bool mapGalleryAppliedDragging=false,mapGalleryAppliedDecelerating=false;
static uint64_t mapGalleryAppliedScrollSamples=0,mapGalleryAppliedTaps=0;

@interface ICSMMapGallery : UIScrollView <UIScrollViewDelegate>
@property(nonatomic) BOOL applyingState;
@property(nonatomic,copy) NSString *containerID;
-(void)selectMap:(UITapGestureRecognizer*)tap;
@end
static ICSMMapGallery *mapGallery;

@implementation ICSMMapGallery
-(instancetype)initWithFrame:(CGRect)frame {
    if ((self=[super initWithFrame:frame])) {
        self.backgroundColor=UIColor.clearColor;self.opaque=NO;
        self.delegate=self;self.directionalLockEnabled=YES;
        self.showsVerticalScrollIndicator=NO;self.showsHorizontalScrollIndicator=YES;
        self.indicatorStyle=UIScrollViewIndicatorStyleWhite;
        self.contentInsetAdjustmentBehavior=UIScrollViewContentInsetAdjustmentNever;
        self.bounces=NO;self.alwaysBounceVertical=NO;self.alwaysBounceHorizontal=NO;
        self.scrollsToTop=NO;self.decelerationRate=UIScrollViewDecelerationRateNormal;
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectMap:)];
        [tap requireGestureRecognizerToFail:self.panGestureRecognizer];
        [self addGestureRecognizer:tap];
        self.accessibilityIdentifier=@"ICSMMapGallery";
    }return self;
}
-(void)scrollViewDidScroll:(UIScrollView*)scrollView {
    if (self.applyingState || self.hidden || !mapGalleryScroll || self.bounds.size.width<=0) return;
    std::lock_guard<std::recursive_mutex> lock(mutex);
    ++mapGalleryScrollSamples;
    mapGalleryScroll((float)(self.contentOffset.x*mapGalleryState.viewport.width/self.bounds.size.width));
}
-(void)selectMap:(UITapGestureRecognizer*)tap {
    if (tap.state!=UIGestureRecognizerStateEnded || self.hidden || self.dragging ||
        self.decelerating || !mapGalleryActivate || self.bounds.size.width<=0 || self.bounds.size.height<=0) return;
    std::lock_guard<std::recursive_mutex> lock(mutex);
    CGPoint p=[tap locationInView:self];
    const CGFloat sx=self.bounds.size.width/mapGalleryState.viewport.width;
    const CGFloat sy=self.bounds.size.height/mapGalleryState.viewport.height;
    for (uint32_t i=0;i<mapGalleryState.tile_count;++i) {
        const SourceTouchMapTile &tile=mapGalleryState.tiles[i];
        CGRect rect=CGRectMake(tile.bounds.x*sx,tile.bounds.y*sy,tile.bounds.width*sx,tile.bounds.height*sy);
        if (!tile.enabled || !CGRectContainsPoint(rect,p)) continue;
        ++mapGalleryTaps;mapGalleryLastMap=[NSString stringWithUTF8String:tile.map_name]?:@"";
        mapGalleryActivate(tile.panel_id);break;
    }
}
@end

static void updateMapGalleryLayout() {
    if (!NSThread.isMainThread || !mapGallery) return;
    bool show=host && host.window && mapGalleryState.visible && !editing && !consoleVisible &&
        mapGalleryState.render_width>0 && mapGalleryState.render_height>0 &&
        mapGalleryState.viewport.width>0 && mapGalleryState.viewport.height>0;
    CGSize hostSize=host?host.bounds.size:CGSizeZero;
    if (mapGalleryLayoutApplied && show==mapGalleryAppliedVisible &&
        std::memcmp(&mapGalleryState,&mapGalleryAppliedState,sizeof(mapGalleryState))==0 &&
        CGSizeEqualToSize(hostSize,mapGalleryAppliedHostSize) &&
        mapGalleryAppliedDragging==mapGallery.dragging && mapGalleryAppliedDecelerating==mapGallery.decelerating &&
        mapGalleryAppliedScrollSamples==mapGalleryScrollSamples && mapGalleryAppliedTaps==mapGalleryTaps &&
        (!show || mapGallery.superview==host)) return;
    mapGallery.applyingState=YES;
    if (show) {
        NSString *container=[NSString stringWithUTF8String:mapGalleryState.container_id]?:@"";
        bool changed=mapGallery.hidden || ![mapGallery.containerID isEqualToString:container];
        if (changed) {
            mapGallery.panGestureRecognizer.enabled=NO;mapGallery.panGestureRecognizer.enabled=YES;
            [mapGallery setContentOffset:mapGallery.contentOffset animated:NO];
        }
        if (mapGallery.superview!=host) [host addSubview:mapGallery];
        CGFloat sx=host.bounds.size.width/mapGalleryState.render_width;
        CGFloat sy=host.bounds.size.height/mapGalleryState.render_height;
        SourceTouchRect v=mapGalleryState.viewport;
        CGRect frame=CGRectMake(v.x*sx,v.y*sy,v.width*sx,v.height*sy);
        bool resized=!CGRectEqualToRect(mapGallery.frame,frame);
        if (resized) mapGallery.frame=frame;
        CGSize size=CGSizeMake(std::max(v.width,mapGalleryState.content_width)*sx,frame.size.height);
        if (!CGSizeEqualToSize(mapGallery.contentSize,size)) mapGallery.contentSize=size;
        if (changed || resized || (!mapGallery.tracking && !mapGallery.dragging && !mapGallery.decelerating)) {
            CGFloat offset=std::clamp((CGFloat)mapGalleryState.scroll_offset*sx,(CGFloat)0,
                std::max((CGFloat)0,size.width-frame.size.width));
            if (std::abs(mapGallery.contentOffset.x-offset)>.5)
                [mapGallery setContentOffset:CGPointMake(offset,0) animated:NO];
        }
        mapGallery.containerID=container;
    } else if (!mapGallery.hidden) {
        [mapGallery setContentOffset:mapGallery.contentOffset animated:NO];
        mapGallery.panGestureRecognizer.enabled=NO;mapGallery.panGestureRecognizer.enabled=YES;
    }
    mapGallery.hidden=!show;mapGallery.applyingState=NO;
    if (show) {
        // Leave native bottom buttons/profile above the gallery during layout changes.
        for (UIView *v in @[glassNavigation?:[NSNull null],glassNavigationRight?:[NSNull null],glassProfile?:[NSNull null]])
            if ([v isKindOfClass:UIView.class] && v.superview==host) [host bringSubviewToFront:v];
    }
    NSMutableArray *tiles=[NSMutableArray array];
    CGFloat sx=host && mapGalleryState.render_width>0?host.bounds.size.width/mapGalleryState.render_width:0;
    CGFloat sy=host && mapGalleryState.render_height>0?host.bounds.size.height/mapGalleryState.render_height:0;
    for (uint32_t i=0;i<mapGalleryState.tile_count;++i) {
        const auto &t=mapGalleryState.tiles[i];
        [tiles addObject:@{@"id":@(t.panel_id),@"map":@(t.map_name),@"selected":@(t.selected),@"enabled":@(t.enabled),
            @"content_rect_points":@[@(t.bounds.x*sx),@(t.bounds.y*sy),@(t.bounds.width*sx),@(t.bounds.height*sy)]}];
    }
    CGRect f=mapGallery.frame;
    mapGalleryDiagnostics=@{@"backend":@"UIScrollView + original Panorama scrollbar/Activated",
        @"visible":@(show),@"container":mapGallery.containerID?:@"",@"tiles":tiles,
        @"viewport_points":@[@(f.origin.x),@(f.origin.y),@(f.size.width),@(f.size.height)],
        @"content_width_points":@(mapGallery.contentSize.width),@"offset_points":@(mapGallery.contentOffset.x),
        @"source_offset_pixels":@(mapGalleryState.scroll_offset),@"dragging":@(mapGallery.dragging),
        @"decelerating":@(mapGallery.decelerating),@"scroll_samples":@(mapGalleryScrollSamples),
        @"taps":@(mapGalleryTaps),@"last_map":mapGalleryLastMap};
    // Do not allocate a tile array or reorder native views every rendered
    // frame when neither layout nor gesture/selection state has changed.
    mapGalleryLayoutApplied=true;mapGalleryAppliedVisible=show;
    mapGalleryAppliedState=mapGalleryState;mapGalleryAppliedHostSize=hostSize;
    mapGalleryAppliedDragging=mapGallery.dragging;mapGalleryAppliedDecelerating=mapGallery.decelerating;
    mapGalleryAppliedScrollSamples=mapGalleryScrollSamples;mapGalleryAppliedTaps=mapGalleryTaps;
}

static void shutdownMapGallery() {
    std::lock_guard<std::recursive_mutex> lock(mutex);
    mapGalleryScroll=nullptr;mapGalleryActivate=nullptr;mapGalleryState={};
    mapGalleryLayoutApplied=false;
    void (^remove)(void)=^{[mapGallery removeFromSuperview];mapGallery=nil;};
    if (NSThread.isMainThread) remove();else dispatch_async(dispatch_get_main_queue(),remove);
    mapGalleryDiagnostics=@{@"visible":@NO};
}
extern "C" void SourceTouchSetMapCallbacks(void (*scroll)(float),void (*activate)(const char*)) {
    std::lock_guard<std::recursive_mutex> lock(mutex);mapGalleryScroll=scroll;mapGalleryActivate=activate;
}
extern "C" void SourceTouchUpdateMaps(const SourceTouchMapState *maps) {
    if (!NSThread.isMainThread || !maps || maps->struct_size!=sizeof(*maps) || maps->tile_count>SOURCE_MAP_TILE_LIMIT) return;
    std::lock_guard<std::recursive_mutex> lock(mutex);mapGalleryState=*maps;
    if (!mapGallery && maps->visible && host) mapGallery=[[ICSMMapGallery alloc] initWithFrame:CGRectZero];
    updateMapGalleryLayout();
}
