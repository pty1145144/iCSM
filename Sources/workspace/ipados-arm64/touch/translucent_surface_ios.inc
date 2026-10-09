// Ordinary UIKit frost, retaining existing content and continuous corners.
static UIColor *translucentSurfaceColor(BOOL selected) {
    return selected?[UIColor colorWithRed:.31 green:.34 blue:.41 alpha:.76]:
        [UIColor colorWithRed:.12 green:.15 blue:.20 alpha:.58];
}
@interface ICSMTranslucentSurface : UIView
@property(nonatomic) BOOL elevated;
@property(nonatomic) BOOL frosted;
@property(nonatomic,strong) UIVisualEffectView *blurView;
@end
@implementation ICSMTranslucentSurface
-(instancetype)initWithFrame:(CGRect)frame {
    if((self=[super initWithFrame:frame])) {
        self.backgroundColor=translucentSurfaceColor(NO);
        self.layer.cornerCurve=kCACornerCurveContinuous;
        self.layer.borderColor=[UIColor colorWithWhite:1 alpha:.18].CGColor;
        self.layer.borderWidth=.5;
    }return self;
}
-(void)layoutSubviews {
    [super layoutSubviews];
    if(self.blurView) {
        self.blurView.frame=self.bounds;
        self.blurView.cornerConfiguration=self.cornerConfiguration;
    }
    if(self.elevated) {
        CGFloat radius=[self effectiveRadiusForCorner:UIRectCornerTopLeft];
        self.layer.shadowPath=[UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:radius].CGPath;
    }
}
-(void)setFrosted:(BOOL)frosted {
    if(_frosted==frosted)return;
    _frosted=frosted;
    if(frosted) {
        // Thin Material Dark is ordinary blur, without glass refraction,
        // highlights or interactive deformation. Keep effect/ancestor alpha
        // at 1, as required by UIVisualEffectView; tint its content instead.
        self.backgroundColor=UIColor.clearColor;
        self.blurView=[[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemThinMaterialDark]];
        self.blurView.userInteractionEnabled=NO;self.blurView.alpha=1;
        self.blurView.clipsToBounds=YES;self.blurView.layer.cornerCurve=kCACornerCurveContinuous;
        self.blurView.contentView.backgroundColor=[UIColor colorWithRed:.08 green:.10 blue:.14 alpha:.08];
        [self insertSubview:self.blurView atIndex:0];
    } else {
        [self.blurView removeFromSuperview];self.blurView=nil;
        self.backgroundColor=translucentSurfaceColor(NO);
    }
    [self setNeedsLayout];
}
-(void)setElevated:(BOOL)elevated {
    _elevated=elevated;self.layer.shadowColor=UIColor.blackColor.CGColor;
    self.layer.shadowOpacity=elevated?.18:0;self.layer.shadowRadius=8;
    self.layer.shadowOffset=CGSizeMake(0,3);[self setNeedsLayout];
}
@end
static ICSMTranslucentSurface *translucentSurface(CGFloat radius,BOOL elevated) {
    ICSMTranslucentSurface *view=[ICSMTranslucentSurface new];view.elevated=elevated;
    view.cornerConfiguration=[UICornerConfiguration configurationWithUniformRadius:[UICornerRadius fixedRadius:radius]];
    return view;
}

static ICSMTranslucentSurface *frostedSurface(CGFloat radius,BOOL elevated) {
    ICSMTranslucentSurface *view=translucentSurface(radius,elevated);view.frosted=YES;return view;
}

static NSUInteger translucentEffectCount(UIView *view) {
    if(!view)return 0;
    NSUInteger count=[view isKindOfClass:UIVisualEffectView.class]?1:0;
    for(UIView *child in view.subviews)count+=translucentEffectCount(child);
    return count;
}
