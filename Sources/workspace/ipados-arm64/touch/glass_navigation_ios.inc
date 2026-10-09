// The lobby toolbar is a UIKit sibling overlay above SDL's CAMetalLayer.
// Each corner group shares one traditional UIKit frosted background. Original
// Panorama controls remain authoritative for selection and actions.
@interface ICSMGlassNavButton : UIButton
@property(nonatomic,strong) UIImageView *glyph;
@property(nonatomic,strong) UIView *selectionLine;
@end
@implementation ICSMGlassNavButton
- (instancetype)initWithFrame:(CGRect)frame {
    if ((self=[super initWithFrame:frame])) {
        self.glyph=[UIImageView new];self.glyph.contentMode=UIViewContentModeScaleAspectFit;
        self.glyph.userInteractionEnabled=NO;[self addSubview:self.glyph];
        self.selectionLine=[UIView new];self.selectionLine.userInteractionEnabled=NO;
        self.selectionLine.backgroundColor=[UIColor colorWithWhite:1 alpha:.55];
        self.selectionLine.layer.cornerRadius=1;[self addSubview:self.selectionLine];
        self.pointerInteractionEnabled=YES;
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat w=self.bounds.size.width,h=self.bounds.size.height;
    // Match Panorama's 40px icon inside each 112px cell, at any UI scale.
    CGFloat size=std::min(w,h)*(40.0/112.0)*SourceTouchMenuUIScale();
    self.glyph.frame=CGRectMake((w-size)*.5,(h-size)*.5,size,size);
    self.selectionLine.frame=CGRectMake(w*.18,h-std::max<CGFloat>(5,h*.1),w*.64,1);
}
- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    if (UIAccessibilityIsReduceMotionEnabled()) return;
    [UIView animateWithDuration:.14 delay:0 options:UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionAllowUserInteraction animations:^{
        self.glyph.transform=highlighted?CGAffineTransformMakeScale(.9,.9):CGAffineTransformIdentity;
    } completion:nil];
}
@end

// The title is decoration, so it never captures game/menu touches. Its text
// uses UIKit points and native display scale, independent of scene resolution.
@interface ICSMGlassTitle : UIView
@property(nonatomic,strong) ICSMTranslucentSurface *glassView;
@property(nonatomic,strong) UILabel *titleLabel;
@end
@implementation ICSMGlassTitle
- (instancetype)initWithFrame:(CGRect)frame {
    if ((self=[super initWithFrame:frame])) {
        self.backgroundColor=UIColor.clearColor;self.userInteractionEnabled=NO;
        self.overrideUserInterfaceStyle=UIUserInterfaceStyleDark;
        self.accessibilityIdentifier=@"ICSMTranslucentTitle";
        self.isAccessibilityElement=YES;self.accessibilityLabel=@"iCSM";
        self.glassView=frostedSurface(6,NO);
        [self addSubview:self.glassView];
        self.titleLabel=[UILabel new];self.titleLabel.text=@"iCSM";
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        self.titleLabel.textColor=UIColor.whiteColor;
        self.titleLabel.font=[UIFont systemFontOfSize:20 weight:UIFontWeightBold];
        self.titleLabel.shadowColor=[UIColor colorWithWhite:0 alpha:.7];
        self.titleLabel.shadowOffset=CGSizeMake(0,1);
        self.titleLabel.adjustsFontSizeToFitWidth=YES;self.titleLabel.minimumScaleFactor=.8;
        self.titleLabel.isAccessibilityElement=NO;
        [self.glassView addSubview:self.titleLabel];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.glassView.frame=self.bounds;
    self.glassView.cornerConfiguration=[UICornerConfiguration configurationWithUniformRadius:[UICornerRadius fixedRadius:6]];
    self.titleLabel.frame=CGRectInset(self.bounds,12,1);
}
@end

@interface ICSMGlassProfile : UIButton
@property(nonatomic,strong) ICSMTranslucentSurface *glassView;
@property(nonatomic,strong) UIImageView *avatar;
@property(nonatomic,strong) UIImageView *editGlyph;
@property(nonatomic,strong) UILabel *nameLabel;
- (void)activateProfile;
@end

@interface ICSMGlassNavigation : UIView
@property(nonatomic,strong) ICSMTranslucentSurface *glassView;
@property(nonatomic,strong) NSArray<ICSMGlassNavButton*> *buttons;
- (instancetype)initWithActions:(NSArray<NSNumber*> *)actions;
- (void)activate:(ICSMGlassNavButton *)sender;
@end

static ICSMGlassNavigation *glassNavigation;
static ICSMGlassNavigation *glassNavigationRight;
static ICSMGlassTitle *glassTitle;
static ICSMGlassProfile *glassProfile;
// A non-drawing, full-container guide asks UIKit for the window's concentric
// radius through public APIs. Never read private display-corner properties.
static UIView *glassCornerGuide;
static CGFloat glassSharedCornerRadius=0;
static NSString *glassCornerSource=@"unresolved";
static SourceTouchNavigationState glassNavigationState={};
static void (*glassNavigationCallback)(SourceTouchNavigationAction)=nullptr;
static void (*glassProfileCallback)(void)=nullptr;
static NSDictionary *glassNavigationDiagnostics;
static uint64_t glassNavigationActivations=0;
static int glassNavigationLastAction=-1;
static SourceTouchNavigationState glassNavigationAppliedState={};
static CGSize glassNavigationAppliedHostSize=CGSizeZero;
static UIEdgeInsets glassNavigationAppliedSafeAreaInsets=UIEdgeInsetsZero;
static bool glassNavigationLayoutApplied=false;
static bool glassNavigationAppliedVisible=false;
static bool glassTitleAppliedVisible=false;
static bool glassProfileAppliedVisible=false;
static bool glassAppliedInteractionAllowed=false;
static uint64_t glassNavigationAppliedActivations=0;
static uint64_t glassProfileActivations=0;
static uint64_t glassProfileAppliedActivations=0;

@implementation ICSMGlassProfile
- (instancetype)initWithFrame:(CGRect)frame {
    if ((self=[super initWithFrame:frame])) {
        self.backgroundColor=UIColor.clearColor;
        self.overrideUserInterfaceStyle=UIUserInterfaceStyleDark;
        self.accessibilityIdentifier=@"ICSMTranslucentProfile";
        self.accessibilityLabel=@"修改昵称";self.pointerInteractionEnabled=YES;
        self.glassView=frostedSurface(35,YES);
        self.glassView.userInteractionEnabled=NO;
        [self addSubview:self.glassView];
        self.avatar=[UIImageView new];self.editGlyph=[UIImageView new];
        NSString *directory=[NSBundle.mainBundle.resourcePath stringByAppendingPathComponent:@"native-navigation"];
        self.avatar.image=[[UIImage imageWithContentsOfFile:[directory stringByAppendingPathComponent:@"profile-avatar.png"]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        self.editGlyph.image=[[UIImage imageWithContentsOfFile:[directory stringByAppendingPathComponent:@"profile-edit.png"]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        if (!self.avatar.image || !self.editGlyph.image) return nil;
        for (UIImageView *image in @[self.avatar,self.editGlyph]) {
            image.contentMode=UIViewContentModeScaleAspectFit;image.tintColor=UIColor.whiteColor;
            image.userInteractionEnabled=NO;[self.glassView addSubview:image];
        }
        self.nameLabel=[UILabel new];self.nameLabel.textColor=UIColor.whiteColor;
        self.nameLabel.lineBreakMode=NSLineBreakByTruncatingTail;
        self.nameLabel.shadowColor=[UIColor colorWithWhite:0 alpha:.45];
        self.nameLabel.shadowOffset=CGSizeMake(0,1);
        [self.glassView addSubview:self.nameLabel];
        [self addTarget:self action:@selector(activateProfile) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];self.glassView.frame=self.bounds;
    // Keep the original 400x80 card proportions; reserve clear icon/text
    // insets inside the system corners, including the shorter phone layout.
    CGFloat h=self.bounds.size.height,w=self.bounds.size.width,s=h/80.0;
    CGFloat inset=std::max<CGFloat>(12*s,glassSharedCornerRadius*.55);
    CGFloat avatar=56*s,edit=28*s,gap=14*s;
    self.avatar.frame=CGRectMake(inset,(h-avatar)*.5,avatar,avatar);
    self.editGlyph.frame=CGRectMake(w-inset-edit,(h-edit)*.5,edit,edit);
    CGFloat textX=inset+avatar+gap;
    self.nameLabel.frame=CGRectMake(textX,0,std::max<CGFloat>(0,w-inset-edit-gap-textX),h);
    self.nameLabel.font=[UIFont systemFontOfSize:std::max<CGFloat>(17*SourceTouchMenuUIScale(),24*s) weight:UIFontWeightSemibold];
}
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event {
    // Keep the compact nickname card easy to tap without enlarging its glass.
    CGFloat dx=std::max<CGFloat>(0,(44-self.bounds.size.width)*.5);
    CGFloat dy=std::max<CGFloat>(0,(44-self.bounds.size.height)*.5);
    return CGRectContainsPoint(CGRectInset(self.bounds,-dx,-dy),point);
}
- (void)activateProfile {
    if (self.hidden || !self.enabled || !glassNavigationState.profile_visible || !glassProfileCallback) return;
    ++glassProfileActivations;glassProfileCallback();
}
@end

@implementation ICSMGlassNavigation
- (instancetype)initWithActions:(NSArray<NSNumber*> *)actions {
    if ((self=[super initWithFrame:CGRectZero])) {
        self.backgroundColor=UIColor.clearColor;self.accessibilityIdentifier=@"ICSMTranslucentToolbar";
        self.overrideUserInterfaceStyle=UIUserInterfaceStyleDark;
        self.glassView=frostedSurface(35,YES);
        [self addSubview:self.glassView];
        NSArray *names=@[@"home",@"play",@"inventory",@"settings",@"console",@"rooms",@"fps",@"quit"];
        NSArray *labels=@[@"大厅",@"开始游戏",@"库存",@"设置",@"控制台",@"搜索房间",@"帧数显示",@"退出游戏"];
        NSMutableArray *buttons=[NSMutableArray array];
        for (NSNumber *action in actions) {
            NSUInteger i=action.unsignedIntegerValue;
            NSString *path=[[NSBundle.mainBundle.resourcePath stringByAppendingPathComponent:@"native-navigation"] stringByAppendingPathComponent:[names[i] stringByAppendingString:@".png"]];
            UIImage *image=[UIImage imageWithContentsOfFile:path];
            if (!image) {fprintf(stderr,"ICSM_GLASS_NAV missing_icon=%s\n",[names[i] UTF8String]);return nil;}
            ICSMGlassNavButton *button=[[ICSMGlassNavButton alloc] initWithFrame:CGRectZero];
            button.tag=i;button.accessibilityLabel=labels[i];
            button.accessibilityIdentifier=[@"ICSMGlassNav-" stringByAppendingString:names[i]];
            button.glyph.image=[image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            [button addTarget:self action:@selector(activate:) forControlEvents:UIControlEventTouchUpInside];
            [self.glassView addSubview:button];[buttons addObject:button];
        }
        self.buttons=buttons;
    }
    return self;
}
- (void)activate:(ICSMGlassNavButton *)sender {
    if (self.hidden || !sender.enabled || !glassNavigationState.visible || !glassNavigationCallback) return;
    ++glassNavigationActivations;glassNavigationLastAction=(int)sender.tag;
    glassNavigationCallback((SourceTouchNavigationAction)sender.tag);
}
@end

static CGRect glassRect(SourceTouchRect r) {
    CGFloat x=host.bounds.size.width/glassNavigationState.render_width;
    CGFloat y=host.bounds.size.height/glassNavigationState.render_height;
    return CGRectMake(r.x*x,r.y*y,r.width*x,r.height*y);
}

static void glassBottomFrames(CGRect *left,CGRect *right,CGRect *profile) {
    *left=glassRect(glassNavigationState.bar);
    *right=glassRect(glassNavigationState.bar_right);
    *profile=glassRect(glassNavigationState.profile);
    // Anchor UIKit controls to the actual view and safe area. The render
    // surface can resize independently; it must never push them off-screen.
    UIEdgeInsets insets=host.safeAreaInsets;
    const CGFloat edge=24,gap=16;
    CGFloat width=host.bounds.size.width,height=host.bounds.size.height;
    CGFloat groupWidth=std::max(left->size.width,right->size.width);
    CGFloat groupHeight=std::max(left->size.height,right->size.height);
    CGFloat available=std::max<CGFloat>(0,width-insets.left-insets.right-2*edge);
    CGFloat required=2*groupWidth+profile->size.width+2*gap;
    CGFloat scale=required>0?std::min<CGFloat>(1,available/required):1;
    const CGFloat phoneScale=SourceTouchMenuUIScale();
    scale*=phoneScale;
    left->size=right->size=CGSizeMake(std::max<CGFloat>(132,groupWidth*scale),
        phoneScale<1?std::max<CGFloat>(44,groupHeight*scale):groupHeight*scale);
    profile->size=CGSizeMake(profile->size.width*scale,profile->size.height*scale);
    // Moving the phone row to the bottom safe-area edge gives about a 5mm
    // downward shift, limited by the home gesture area rather than the render
    // resolution. iPad retains its existing 24-point bottom padding.
    const CGFloat bottomEdge=phoneScale<1?0:edge;
    left->origin=CGPointMake(insets.left+edge,height-insets.bottom-bottomEdge-left->size.height);
    right->origin=CGPointMake(width-insets.right-edge-right->size.width,left->origin.y);
    profile->origin=CGPointMake((width+insets.left-insets.right-profile->size.width)*.5,
        left->origin.y+(left->size.height-profile->size.height)*.5);
}

static void updateGlassNavigationLayout() {
    if (!NSThread.isMainThread || (!glassNavigation && !glassTitle && !glassProfile) || !host) return;
    bool commonVisible=focusActive && !editing &&
        glassNavigationState.render_width>0 && glassNavigationState.render_height>0;
    // Keep the toolbar behind native dialogs; UIKit handles modal dimming and
    // input capture. Opening the name editor must not expose the flat card.
    bool interactionAllowed=!host.window.rootViewController.presentedViewController;
    bool visible=glassNavigation && glassNavigationRight && commonVisible && glassNavigationState.visible &&
        glassNavigationState.bar.width>0 && glassNavigationState.bar.height>0 &&
        glassNavigationState.bar_right.width>0 && glassNavigationState.bar_right.height>0;
    bool titleVisible=glassTitle && commonVisible && glassNavigationState.title_visible &&
        glassNavigationState.title_bar.width>0 && glassNavigationState.title_bar.height>0;
    bool profileVisible=glassProfile && commonVisible && glassNavigationState.profile_visible &&
        glassNavigationState.profile.width>0 && glassNavigationState.profile.height>0;
    // Source publishes every frame. Only update UIKit and diagnostics when
    // layout, selection, visibility or interaction actually changes.
    if (glassNavigationLayoutApplied && glassNavigationAppliedVisible==visible &&
        glassTitleAppliedVisible==titleVisible &&
        glassProfileAppliedVisible==profileVisible && glassAppliedInteractionAllowed==interactionAllowed &&
        std::memcmp(&glassNavigationAppliedState,&glassNavigationState,sizeof(glassNavigationState))==0 &&
        CGSizeEqualToSize(glassNavigationAppliedHostSize,host.bounds.size) &&
        UIEdgeInsetsEqualToEdgeInsets(glassNavigationAppliedSafeAreaInsets,host.safeAreaInsets) &&
        glassNavigationAppliedActivations==glassNavigationActivations &&
        glassProfileAppliedActivations==glassProfileActivations &&
        (!visible || glassNavigation.superview==host) &&
        (!visible || glassNavigationRight.superview==host) &&
        (!titleVisible || glassTitle.superview==host) &&
        (!profileVisible || glassProfile.superview==host)) return;
    glassNavigationLayoutApplied=true;glassNavigationAppliedVisible=visible;
    glassTitleAppliedVisible=titleVisible;
    glassProfileAppliedVisible=profileVisible;glassAppliedInteractionAllowed=interactionAllowed;
    glassNavigationAppliedState=glassNavigationState;
    glassNavigationAppliedHostSize=host.bounds.size;
    glassNavigationAppliedSafeAreaInsets=host.safeAreaInsets;
    glassNavigationAppliedActivations=glassNavigationActivations;
    glassProfileAppliedActivations=glassProfileActivations;
    glassNavigation.hidden=!visible;
    glassNavigationRight.hidden=!visible;
    glassTitle.hidden=!titleVisible;
    glassProfile.hidden=!profileVisible;
    CGRect leftFrame=CGRectZero,rightFrame=CGRectZero,profileFrame=CGRectZero;
    if (commonVisible) glassBottomFrames(&leftFrame,&rightFrame,&profileFrame);
    NSArray<ICSMGlassNavigation*> *groups=glassNavigation && glassNavigationRight?@[glassNavigation,glassNavigationRight]:@[];
    if (profileVisible) {
        if (glassProfile.superview!=host) { [glassProfile removeFromSuperview];[host addSubview:glassProfile]; }
        CGRect profile=profileFrame;
        if (!CGRectEqualToRect(glassProfile.frame,profile)) glassProfile.frame=profile;
        glassProfile.enabled=interactionAllowed && glassNavigationState.profile_enabled;
        NSString *name=[NSString stringWithUTF8String:glassNavigationState.profile_name_utf8]?:@"";
        if (![glassProfile.nameLabel.text isEqualToString:name]) {
            glassProfile.nameLabel.text=name;glassProfile.accessibilityValue=name;
        }
    }
    if (titleVisible) {
        if (glassTitle.superview!=host) { [glassTitle removeFromSuperview];[host addSubview:glassTitle]; }
        CGRect title=glassRect(glassNavigationState.title_bar);
        // Reserve a readable 20pt line even when Panorama's UI scale shrinks
        // its notification strip on small or low-resolution game surfaces.
        title.size.height=std::max<CGFloat>(30,title.size.height);
        if (!CGRectEqualToRect(glassTitle.frame,title)) glassTitle.frame=title;
    }
    if (visible) {
        for (NSUInteger groupIndex=0;groupIndex<groups.count;++groupIndex) {
            ICSMGlassNavigation *group=groups[groupIndex];
            if (group.superview!=host) { [group removeFromSuperview];[host addSubview:group]; }
            CGRect bar=groupIndex==0?leftFrame:rightFrame;
            if (!CGRectEqualToRect(group.frame,bar)) group.frame=bar;
            group.glassView.frame=group.bounds;
            for (NSUInteger cell=0;cell<group.buttons.count;++cell) {
            ICSMGlassNavButton *button=group.buttons[cell];int i=(int)button.tag;
            // Exactly three equally-sized cells, including after leaving a
            // match where Panorama still carries pause-menu layout offsets.
            CGFloat cellWidth=group.bounds.size.width/group.buttons.count;
            CGRect r=CGRectMake(cell*cellWidth,0,cellWidth,group.bounds.size.height);
            if (!CGRectEqualToRect(button.frame,r)) button.frame=r;
            button.hidden=r.size.width<=0 || r.size.height<=0;
            button.enabled=interactionAllowed && (glassNavigationState.enabled_mask & (1u<<i))!=0;
            UIColor *color=i==SourceNavigationFPS && glassNavigationState.fps_enabled?
                [UIColor colorWithRed:164.0/255 green:227.0/255 blue:107.0/255 alpha:1]:UIColor.whiteColor;
            if (![button.glyph.tintColor isEqual:color]) button.glyph.tintColor=color;
            button.selectionLine.hidden=(glassNavigationState.selected_mask & (1u<<i))==0;
            button.accessibilityTraits=UIAccessibilityTraitButton |
                ((glassNavigationState.selected_mask & (1u<<i))?UIAccessibilityTraitSelected:0) |
                (button.enabled?0:UIAccessibilityTraitNotEnabled);
            if (i==SourceNavigationFPS) button.accessibilityValue=glassNavigationState.fps_enabled?@"开启":@"关闭";
            }
        }
    }
    if (profileVisible || visible) {
        if (!glassCornerGuide) {
            glassCornerGuide=[UIView new];glassCornerGuide.userInteractionEnabled=NO;
            glassCornerGuide.alpha=0;
            glassCornerGuide.cornerConfiguration=[UICornerConfiguration configurationWithUniformRadius:[UICornerRadius containerConcentricRadius]];
        }
        if (glassCornerGuide.superview!=host) { [glassCornerGuide removeFromSuperview];[host insertSubview:glassCornerGuide atIndex:0]; }
        glassCornerGuide.frame=host.bounds;[glassCornerGuide layoutIfNeeded];
        CGFloat radius=[glassCornerGuide effectiveRadiusForCorner:UIRectCornerAllCorners];
        glassCornerSource=@"UIKit full-container concentric";
        if (radius<=0) {
            // UIKit may report a square container (e.g. a square window).
            // Its capsule rule provides a system-derived fallback, shared by
            // both controls instead of independently hard-coded pixel radii.
            bool hasProfileSize=glassProfile && glassProfile.bounds.size.height>0;
            ICSMTranslucentSurface *reference=hasProfileSize?glassProfile.glassView:glassNavigation.glassView;
            reference.frame=hasProfileSize?glassProfile.bounds:glassNavigation.bounds;
            reference.cornerConfiguration=UICornerConfiguration.capsuleConfiguration;
            [reference layoutIfNeeded];
            radius=[reference effectiveRadiusForCorner:UIRectCornerAllCorners];
            glassCornerSource=@"UIKit capsule fallback for square container";
        }
        CGFloat maximum=CGFLOAT_MAX;
        if (glassProfile && glassProfile.bounds.size.height>0) maximum=std::min(maximum,glassProfile.bounds.size.height*.5);
        if (visible) maximum=std::min(maximum,glassNavigation.bounds.size.height*.5);
        glassSharedCornerRadius=std::min(radius,maximum);
        UICornerConfiguration *corners=[UICornerConfiguration configurationWithUniformRadius:[UICornerRadius fixedRadius:glassSharedCornerRadius]];
        for (UIView *view in @[glassProfile?:[NSNull null],glassNavigation?:[NSNull null],glassNavigationRight?:[NSNull null]]) {
            ICSMTranslucentSurface *glass=nil;
            if ([view isKindOfClass:ICSMGlassProfile.class]) glass=((ICSMGlassProfile *)view).glassView;
            if ([view isKindOfClass:ICSMGlassNavigation.class]) glass=((ICSMGlassNavigation *)view).glassView;
            if (!glass) continue;
            glass.cornerConfiguration=corners;glass.layer.cornerCurve=kCACornerCurveContinuous;
            [glass setNeedsLayout];
        }
        [glassProfile setNeedsLayout];[glassProfile layoutIfNeeded];
    }
    NSMutableArray *buttons=[NSMutableArray array];
    NSMutableArray *groupDiagnostics=[NSMutableArray array];
    for (ICSMGlassNavigation *group in groups) {
      NSMutableArray *actions=[NSMutableArray array];
      for (ICSMGlassNavButton *button in group.buttons) {
        CGRect r=button.frame;
        [actions addObject:@(button.tag)];
        [buttons addObject:@{@"action":@(button.tag),@"frame_points":@[@(r.origin.x),@(r.origin.y),@(r.size.width),@(r.size.height)],
            @"screen_frame_points":@[@(group.frame.origin.x+r.origin.x),@(group.frame.origin.y+r.origin.y),@(r.size.width),@(r.size.height)],
            @"enabled":@(button.enabled),@"hidden":@(button.hidden)}];
      }
      CGRect g=group.frame;
      [groupDiagnostics addObject:@{@"actions":actions,@"bar_points":@[@(g.origin.x),@(g.origin.y),@(g.size.width),@(g.size.height)]}];
    }
    CGRect bar=glassNavigation?glassNavigation.frame:CGRectZero;
    CGRect title=glassTitle?glassTitle.frame:CGRectZero;
    CGRect profile=glassProfile?glassProfile.frame:CGRectZero;
    glassNavigationDiagnostics=@{@"backend":@"UIBlurEffect Thin Material Dark / ordinary frosted background",@"visible":@(visible),
        @"material":@"UIBlurEffectStyleSystemThinMaterialDark",@"liquid_glass_views":@0,
        @"visual_effect_views":@(translucentEffectCount(glassNavigation)+translucentEffectCount(glassNavigationRight)+translucentEffectCount(glassTitle)+translucentEffectCount(glassProfile)),@"shared_glass_views":@0,@"translucent_groups":@2,@"icons":@(buttons.count),@"fps_enabled":@(glassNavigationState.fps_enabled),
        @"layout":@"left-three / profile / right-three",@"groups":groupDiagnostics,
        @"menu_ui_scale":@(SourceTouchMenuUIScale()),
        @"bottom_clearance_points":@(host.bounds.size.height-CGRectGetMaxY(bar)),
        @"bar_points":@[@(bar.origin.x),@(bar.origin.y),@(bar.size.width),@(bar.size.height)],
        @"buttons":buttons,@"activations":@(glassNavigationActivations),@"last_action":@(glassNavigationLastAction),
        @"corner_radius_points":@(glassSharedCornerRadius),@"corner_curve":@"continuous",@"corner_source":glassCornerSource,
        @"profile":@{@"visible":@(profileVisible),@"enabled":@(glassProfile.enabled),
            @"text":glassProfile.nameLabel.text?:@"",@"activations":@(glassProfileActivations),
            @"corner_radius_points":@(glassSharedCornerRadius),@"corner_curve":@"continuous",
            @"bar_points":@[@(profile.origin.x),@(profile.origin.y),@(profile.size.width),@(profile.size.height)]},
        @"title":@{@"visible":@(titleVisible),@"text":@"iCSM",@"font_points":@20,@"font_weight":@"bold",
            @"text_color":@"white",@"captures_touches":@NO,
            @"bar_points":@[@(title.origin.x),@(title.origin.y),@(title.size.width),@(title.size.height)]}};
}

static void shutdownGlassNavigation() {
    std::lock_guard<std::recursive_mutex> lock(mutex);
    glassNavigationCallback=nullptr;glassProfileCallback=nullptr;glassNavigationState={};
    glassNavigationLayoutApplied=false;
    void (^removeViews)(void)=^{
        [glassNavigation removeFromSuperview];glassNavigation=nil;
        [glassNavigationRight removeFromSuperview];glassNavigationRight=nil;
        [glassTitle removeFromSuperview];glassTitle=nil;
        [glassProfile removeFromSuperview];glassProfile=nil;[glassCornerGuide removeFromSuperview];glassCornerGuide=nil;
    };
    if (NSThread.isMainThread) removeViews();
    else dispatch_async(dispatch_get_main_queue(),removeViews);
    glassNavigationDiagnostics=@{@"visible":@NO};
}

extern "C" void SourceTouchSetNavigationCallback(void (*callback)(SourceTouchNavigationAction)) {
    std::lock_guard<std::recursive_mutex> lock(mutex);glassNavigationCallback=callback;
}
extern "C" void SourceTouchSetProfileCallback(void (*callback)(void)) {
    std::lock_guard<std::recursive_mutex> lock(mutex);glassProfileCallback=callback;
}
extern "C" uint32_t SourceTouchUpdateNavigation(const SourceTouchNavigationState *navigation) {
    if (!NSThread.isMainThread) return 0;
    std::lock_guard<std::recursive_mutex> lock(mutex);
    if (!navigation || navigation->struct_size!=sizeof(*navigation)) return 0;
    glassNavigationState=*navigation;
    if (!glassNavigation && navigation->visible && host) {
        if (@available(iOS 26.0,*)) {
            glassNavigation=[[ICSMGlassNavigation alloc] initWithActions:@[@(SourceNavigationPlay),@(SourceNavigationInventory),@(SourceNavigationSettings)]];
            glassNavigationRight=[[ICSMGlassNavigation alloc] initWithActions:@[@(SourceNavigationConsole),@(SourceNavigationRooms),@(SourceNavigationFPS)]];
            if (!glassNavigation || !glassNavigationRight) {glassNavigation=nil;glassNavigationRight=nil;}
        }
        if (glassNavigation) fprintf(stderr,"ICSM_GLASS_NAV created=1 material=ordinary-thin-frosted-blur groups=2 icons=6\n");
    }
    if (!glassTitle && navigation->title_visible && host) {
        if (@available(iOS 26.0,*)) glassTitle=[[ICSMGlassTitle alloc] initWithFrame:CGRectZero];
        if (glassTitle) fprintf(stderr,"ICSM_GLASS_TITLE created=1 material=ordinary-thin-frosted-blur font=20pt-bold\n");
    }
    if (!glassProfile && navigation->profile_visible && host) {
        if (@available(iOS 26.0,*)) glassProfile=[[ICSMGlassProfile alloc] initWithFrame:CGRectZero];
        if (glassProfile) fprintf(stderr,"ICSM_GLASS_PROFILE created=1 material=ordinary-thin-frosted-blur shared_corners=1\n");
    }
    updateGlassNavigationLayout();
    return (glassNavigation && glassNavigationRight && !glassNavigation.hidden && !glassNavigationRight.hidden?SourceGlassNavigation:0u) |
        (glassTitle && !glassTitle.hidden?SourceGlassTitle:0u) |
        (glassProfile && !glassProfile.hidden?SourceGlassProfile:0u);
}
