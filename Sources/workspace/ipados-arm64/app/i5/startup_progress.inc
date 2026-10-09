// UIKit-only startup surface. Fractions belong to the current measured stage;
// an unknown amount of engine work uses an indeterminate bar, never a timer %.
@interface ICSMStartupProgressView:UIView
@property UIVisualEffectView *track;
@property UIView *fill;
@property UILabel *stageLabel;
@property UILabel *detailLabel;
@property UILabel *percentLabel;
@property(nonatomic,copy) NSString *stage;
@property(nonatomic,copy) NSString *detail;
@property double fraction;
@property BOOL indeterminate;
@property BOOL failed;
@property CGFloat scanWidth;
-(void)showStage:(NSString*)message fraction:(double)fraction;
-(void)showError:(NSString*)message;
-(NSDictionary*)snapshot;
@end
@implementation ICSMStartupProgressView
-(instancetype)init {
 if((self=[super init])) {
  self.userInteractionEnabled=NO;
  const BOOL pad=UIDevice.currentDevice.userInterfaceIdiom==UIUserInterfaceIdiomPad;
  // UIVisualEffectView and its parents stay at alpha=1; translucency is in
  // the material/tint, as required by UIKit's visual-effects documentation.
  self.track=[[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemMaterialDark]];
  self.track.overrideUserInterfaceStyle=UIUserInterfaceStyleDark;
  self.track.translatesAutoresizingMaskIntoConstraints=NO;
  self.track.layer.cornerRadius=10;self.track.layer.cornerCurve=kCACornerCurveContinuous;
  self.track.clipsToBounds=YES;self.track.layer.borderWidth=1;
  self.track.layer.borderColor=[UIColor colorWithWhite:1 alpha:0.32].CGColor;
  self.track.contentView.backgroundColor=[UIColor colorWithWhite:0 alpha:0.18];
  [self addSubview:self.track];
  self.fill=[UIView new];self.fill.backgroundColor=[UIColor colorWithWhite:1 alpha:0.68];
  self.fill.layer.cornerRadius=7;self.fill.layer.cornerCurve=kCACornerCurveContinuous;
  [self.track.contentView addSubview:self.fill];
  self.stageLabel=[UILabel new];self.stageLabel.textColor=UIColor.whiteColor;
  self.stageLabel.font=[UIFont systemFontOfSize:pad?18:15 weight:UIFontWeightMedium];
  self.stageLabel.adjustsFontForContentSizeCategory=YES;
  self.stageLabel.numberOfLines=2;
  self.stageLabel.layer.shadowColor=UIColor.blackColor.CGColor;
  self.stageLabel.layer.shadowOpacity=0.65;self.stageLabel.layer.shadowRadius=3;
  self.stageLabel.layer.shadowOffset=CGSizeMake(0,1);
  self.percentLabel=[UILabel new];self.percentLabel.textColor=[UIColor colorWithWhite:1 alpha:0.85];
  self.percentLabel.font=[UIFont monospacedDigitSystemFontOfSize:pad?16:14 weight:UIFontWeightMedium];
  [self.percentLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
  [self.percentLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
  self.detailLabel=[UILabel new];self.detailLabel.textColor=[UIColor colorWithWhite:1 alpha:0.82];
  self.detailLabel.font=[UIFont systemFontOfSize:pad?14:12 weight:UIFontWeightRegular];
  self.detailLabel.lineBreakMode=NSLineBreakByTruncatingMiddle;
  self.detailLabel.layer.shadowColor=UIColor.blackColor.CGColor;
  self.detailLabel.layer.shadowOpacity=0.65;self.detailLabel.layer.shadowRadius=3;
  self.detailLabel.layer.shadowOffset=CGSizeMake(0,1);
  for(UILabel *label in @[self.stageLabel,self.detailLabel,self.percentLabel]){
   label.translatesAutoresizingMaskIntoConstraints=NO;[self addSubview:label];
  }
  [NSLayoutConstraint activateConstraints:@[
   [self.track.topAnchor constraintEqualToAnchor:self.topAnchor],
   [self.track.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
   [self.track.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
   [self.track.heightAnchor constraintEqualToConstant:20],
   [self.stageLabel.topAnchor constraintEqualToAnchor:self.track.bottomAnchor constant:12],
   [self.stageLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:2],
   [self.stageLabel.trailingAnchor constraintEqualToAnchor:self.percentLabel.leadingAnchor constant:-12],
   [self.percentLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-2],
   [self.percentLabel.firstBaselineAnchor constraintEqualToAnchor:self.stageLabel.firstBaselineAnchor],
   [self.detailLabel.leadingAnchor constraintEqualToAnchor:self.stageLabel.leadingAnchor],
   [self.detailLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-2],
   [self.detailLabel.topAnchor constraintEqualToAnchor:self.stageLabel.bottomAnchor constant:4],
   [self.detailLabel.bottomAnchor constraintEqualToAnchor:self.bottomAnchor]
  ]];
  self.isAccessibilityElement=YES;self.accessibilityIdentifier=@"ICSMStartupProgress";
  [self showStage:@"正在检查游戏数据" fraction:-1];
 }return self;
}
-(void)layoutSubviews {
 [super layoutSubviews];
 CGRect area=CGRectInset(self.track.contentView.bounds,3,3);
 if(self.scanWidth!=area.size.width){[self.fill.layer removeAnimationForKey:@"loading"];self.scanWidth=area.size.width;}
 self.fill.frame=CGRectMake(area.origin.x,area.origin.y,area.size.width*(self.indeterminate?0.28:self.fraction),area.size.height);
 if(self.indeterminate && !self.failed && ![self.fill.layer animationForKey:@"loading"]) {
  CABasicAnimation *scan=[CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
  scan.fromValue=@(-area.size.width*0.28);scan.toValue=@(area.size.width);
  scan.duration=1.35;scan.repeatCount=HUGE_VALF;
  scan.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  [self.fill.layer addAnimation:scan forKey:@"loading"];
 }
}
-(void)showStage:(NSString*)message fraction:(double)fraction {
 NSArray<NSString*> *lines=[message componentsSeparatedByString:@"\n"];
 NSString *stage=lines.firstObject?:@"正在加载游戏资源";
 NSString *detail=lines.count>1?lines[1]:@"";
 BOOL waiting=!std::isfinite(fraction) || fraction<0;
 double value=waiting?0:std::max(0.0,std::min(1.0,fraction));
 BOOL newStage=![self.stage isEqualToString:stage];
 BOOL newMode=self.indeterminate!=waiting || self.failed;
 self.stage=stage;self.detail=detail;self.fraction=value;self.indeterminate=waiting;self.failed=NO;
 self.stageLabel.text=stage;self.detailLabel.text=detail;
 self.percentLabel.text=waiting?@"":[NSString stringWithFormat:@"%.0f%%",value*100];
 self.fill.backgroundColor=[UIColor colorWithWhite:1 alpha:0.68];
 self.accessibilityLabel=[NSString stringWithFormat:@"%@，%@",stage,detail];
 self.accessibilityValue=waiting?@"正在加载":self.percentLabel.text;
 if(newStage || newMode)[self.fill.layer removeAnimationForKey:@"loading"];
 [self setNeedsLayout];
}
-(void)showError:(NSString*)message {
 self.failed=YES;self.indeterminate=NO;
 [self.fill.layer removeAnimationForKey:@"loading"];
 self.fill.backgroundColor=[UIColor colorWithRed:1 green:0.55 blue:0.45 alpha:0.8];
 self.stage=@"资源加载未完成";self.detail=message;
 self.stageLabel.text=self.stage;self.detailLabel.text=@"";self.percentLabel.text=@"";
 self.accessibilityLabel=[NSString stringWithFormat:@"%@，%@",self.stage,message];
 self.accessibilityValue=@"等待重试";
 [self setNeedsLayout];
}
-(NSDictionary*)snapshot {
 return @{@"style":@"UIKit systemMaterialDark frosted bar",@"stage":self.stage?:@"",
  @"detail":self.detail?:@"",@"fraction":@(self.fraction),@"indeterminate":@(self.indeterminate),
  @"failed":@(self.failed),@"progress_scope":@"current stage",@"bar_rect":NSStringFromCGRect(self.track.frame),
  @"stage_rect":NSStringFromCGRect(self.stageLabel.frame),@"detail_rect":NSStringFromCGRect(self.detailLabel.frame),
  @"rect":NSStringFromCGRect(self.frame),@"scan_animation":@([self.fill.layer animationForKey:@"loading"]!=nil)};
}
@end
