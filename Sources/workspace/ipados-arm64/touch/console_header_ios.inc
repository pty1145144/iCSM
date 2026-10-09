/* UIKit draws one rounded frosted console. Source retains command execution,
   colored output, command history and exact keyboard-safe window bounds. */
static SourceTouchConsoleState consoleState={};
static void (*consoleCloseCallback)()=nullptr;
static void (*consoleSubmitCallback)(const char*)=nullptr;
static void (*consoleRecallCallback)(int)=nullptr;
static uint64_t consoleNativeCloses=0,consoleNativeSubmits=0,consoleInputBegins=0,consoleTextVersion=0;
static NSMutableAttributedString *consoleText;
static UIView *consoleCornerGuide;
static CGFloat consoleCornerRadius=0;
static NSString *consoleCornerSource=@"UIKit full-container concentric";
static UIFont *consoleFont() {return [UIFont monospacedSystemFontOfSize:16 weight:UIFontWeightRegular];}
static void trimConsoleText() {
    const NSUInteger limit=65536;
    if(consoleText.length<=limit)return;
    NSUInteger cut=consoleText.length-limit;
    NSRange newline=[consoleText.string rangeOfString:@"\n" options:0 range:NSMakeRange(cut,consoleText.length-cut)];
    if(newline.location!=NSNotFound)cut=NSMaxRange(newline);
    [consoleText deleteCharactersInRange:NSMakeRange(0,cut)];
}
@interface ICSMConsoleHeader : UIView <UITextFieldDelegate>
@property(nonatomic,strong) ICSMTranslucentSurface *surface;
@property(nonatomic,strong) UILabel *title;
@property(nonatomic,strong) UITextView *history;
@property(nonatomic,strong) ICSMTranslucentSurface *closeSurface;
@property(nonatomic,strong) UIButton *closeButton;
@property(nonatomic,strong) ICSMTranslucentSurface *inputSurface;
@property(nonatomic,strong) UITextField *input;
@property(nonatomic,strong) ICSMTranslucentSurface *submitSurface;
@property(nonatomic,strong) UIButton *submitButton;
@property(nonatomic) uint64_t appliedTextVersion;
-(void)closeConsole;
-(void)submitCommand;
-(void)refreshHistory;
@end
static ICSMConsoleHeader *consoleHeader;
@implementation ICSMConsoleHeader
-(instancetype)initWithFrame:(CGRect)frame {
    if((self=[super initWithFrame:frame])) {
        self.backgroundColor=UIColor.clearColor;self.overrideUserInterfaceStyle=UIUserInterfaceStyleDark;
        self.accessibilityIdentifier=@"ICSMFrostedConsole";self.accessibilityViewIsModal=YES;
        self.surface=frostedSurface(0,YES);self.surface.userInteractionEnabled=NO;[self addSubview:self.surface];
        self.surface.blurView.contentView.backgroundColor=[UIColor colorWithRed:.06 green:.08 blue:.12 alpha:.18];
        self.title=[UILabel new];self.title.text=@"控制台";self.title.textColor=UIColor.whiteColor;
        self.title.font=[UIFont systemFontOfSize:18 weight:UIFontWeightSemibold];[self addSubview:self.title];
        self.history=[[UITextView alloc] initWithFrame:CGRectZero];self.history.backgroundColor=UIColor.clearColor;
        self.history.editable=NO;self.history.selectable=YES;self.history.font=consoleFont();
        self.history.textColor=UIColor.whiteColor;self.history.textContainerInset=UIEdgeInsetsMake(8,8,8,8);
        self.history.contentInsetAdjustmentBehavior=UIScrollViewContentInsetAdjustmentNever;
        self.history.indicatorStyle=UIScrollViewIndicatorStyleWhite;self.history.alwaysBounceVertical=YES;
        self.history.accessibilityIdentifier=@"ICSMConsoleHistory";[self addSubview:self.history];
        self.closeSurface=frostedSurface(0,NO);self.submitSurface=frostedSurface(0,NO);self.inputSurface=frostedSurface(0,NO);
        for(ICSMTranslucentSurface *view in @[self.closeSurface,self.submitSurface,self.inputSurface]) {
            view.cornerConfiguration=UICornerConfiguration.capsuleConfiguration;view.userInteractionEnabled=NO;
            view.blurView.contentView.backgroundColor=[UIColor colorWithRed:.025 green:.035 blue:.055 alpha:view==self.inputSurface?.35:.62];
            [self addSubview:view];
        }
        self.closeButton=[UIButton buttonWithType:UIButtonTypeSystem];self.submitButton=[UIButton buttonWithType:UIButtonTypeSystem];
        for(UIButton *button in @[self.closeButton,self.submitButton]) {
            button.tintColor=UIColor.whiteColor;button.titleLabel.font=[UIFont systemFontOfSize:16 weight:UIFontWeightSemibold];
            [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];[self addSubview:button];
        }
        [self.closeButton setTitle:@" 关闭" forState:UIControlStateNormal];
        [self.closeButton setImage:[UIImage systemImageNamed:@"xmark"] forState:UIControlStateNormal];
        self.closeButton.accessibilityIdentifier=@"ICSMFrostedConsoleClose";self.closeButton.accessibilityLabel=@"关闭控制台";
        [self.closeButton addTarget:self action:@selector(closeConsole) forControlEvents:UIControlEventTouchUpInside];
        [self.submitButton setTitle:@"提交" forState:UIControlStateNormal];self.submitButton.accessibilityIdentifier=@"ICSMConsoleSubmit";
        [self.submitButton addTarget:self action:@selector(submitCommand) forControlEvents:UIControlEventTouchUpInside];
        self.input=[UITextField new];self.input.delegate=self;self.input.font=consoleFont();self.input.textColor=UIColor.whiteColor;
        self.input.backgroundColor=UIColor.clearColor;self.input.borderStyle=UITextBorderStyleNone;
        self.input.autocorrectionType=UITextAutocorrectionTypeNo;self.input.autocapitalizationType=UITextAutocapitalizationTypeNone;
        self.input.spellCheckingType=UITextSpellCheckingTypeNo;self.input.smartQuotesType=UITextSmartQuotesTypeNo;
        self.input.smartDashesType=UITextSmartDashesTypeNo;self.input.keyboardType=UIKeyboardTypeASCIICapable;
        self.input.returnKeyType=UIReturnKeyGo;self.input.clearButtonMode=UITextFieldViewModeWhileEditing;
        self.input.accessibilityIdentifier=@"ICSMConsoleInput";self.input.accessibilityLabel=@"控制台命令";
        self.input.attributedPlaceholder=[[NSAttributedString alloc] initWithString:@"输入命令" attributes:@{NSForegroundColorAttributeName:[UIColor colorWithWhite:1 alpha:.55]}];
        UIView *left=[[UIView alloc] initWithFrame:CGRectMake(0,0,16,1)];self.input.leftView=left;self.input.leftViewMode=UITextFieldViewModeAlways;
        [self addSubview:self.input];
        UIView *accessory=[[UIView alloc] initWithFrame:CGRectMake(0,0,320,44)];
        accessory.backgroundColor=[UIColor colorWithRed:.06 green:.08 blue:.12 alpha:.94];
        UIButton *previous=[UIButton buttonWithType:UIButtonTypeSystem],*next=[UIButton buttonWithType:UIButtonTypeSystem],*dismiss=[UIButton buttonWithType:UIButtonTypeSystem];
        [previous setImage:[UIImage systemImageNamed:@"chevron.up"] forState:UIControlStateNormal];
        [next setImage:[UIImage systemImageNamed:@"chevron.down"] forState:UIControlStateNormal];
        [dismiss setTitle:@"收起键盘" forState:UIControlStateNormal];
        previous.accessibilityLabel=@"上一条命令";next.accessibilityLabel=@"下一条命令";
        for(UIButton *button in @[previous,next,dismiss])button.tintColor=UIColor.whiteColor;
        [previous addTarget:self action:@selector(previousCommand) forControlEvents:UIControlEventTouchUpInside];
        [next addTarget:self action:@selector(nextCommand) forControlEvents:UIControlEventTouchUpInside];
        [dismiss addTarget:self action:@selector(dismissKeyboard) forControlEvents:UIControlEventTouchUpInside];
        UIStackView *stack=[[UIStackView alloc] initWithArrangedSubviews:@[previous,next,dismiss]];
        stack.axis=UILayoutConstraintAxisHorizontal;stack.distribution=UIStackViewDistributionFillEqually;
        stack.frame=accessory.bounds;stack.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [accessory addSubview:stack];self.input.inputAccessoryView=accessory;
        self.appliedTextVersion=UINT64_MAX;
    }return self;
}
-(void)layoutSubviews {
    [super layoutSubviews];self.surface.frame=self.bounds;
    CGFloat w=self.bounds.size.width,h=self.bounds.size.height,pad=16,buttonH=44;
    self.title.frame=CGRectMake(pad+4,12,std::max<CGFloat>(0,w-160),buttonH);
    self.closeSurface.frame=self.closeButton.frame=CGRectMake(w-pad-100,12,100,buttonH);
    CGFloat footerY=std::max<CGFloat>(68,h-pad-buttonH);
    self.inputSurface.frame=self.input.frame=CGRectMake(pad,footerY,std::max<CGFloat>(0,w-2*pad-104),buttonH);
    self.submitSurface.frame=self.submitButton.frame=CGRectMake(w-pad-92,footerY,92,buttonH);
    self.history.frame=CGRectMake(pad,64,std::max<CGFloat>(0,w-2*pad),std::max<CGFloat>(0,footerY-72));
}
-(void)refreshHistory {
    if(self.appliedTextVersion==consoleTextVersion)return;
    BOOL atEnd=self.history.contentOffset.y+self.history.bounds.size.height>=self.history.contentSize.height-32;
    CGPoint offset=self.history.contentOffset;
    self.history.attributedText=consoleText?:[[NSAttributedString alloc] initWithString:@""];
    [self.history layoutIfNeeded];
    if(atEnd && self.history.text.length)[self.history scrollRangeToVisible:NSMakeRange(self.history.text.length-1,1)];
    else self.history.contentOffset=offset;
    self.appliedTextVersion=consoleTextVersion;
}
-(void)closeConsole {
    if(consoleVisible && consoleCloseCallback) {++consoleNativeCloses;[self.input resignFirstResponder];consoleCloseCallback();}
}
-(void)submitCommand {
    if(!consoleVisible || !consoleSubmitCallback || !self.input.text.length)return;
    NSString *command=self.input.text;if([command lengthOfBytesUsingEncoding:NSUTF8StringEncoding]>255)return;
    ++consoleNativeSubmits;self.input.text=@"";consoleSubmitCallback(command.UTF8String);
}
-(void)previousCommand {if(consoleRecallCallback)consoleRecallCallback(-1);}
-(void)nextCommand {if(consoleRecallCallback)consoleRecallCallback(1);}
-(void)dismissKeyboard {[self.input resignFirstResponder];}
-(BOOL)textFieldShouldReturn:(UITextField*)field {[self submitCommand];return NO;}
-(void)textFieldDidBeginEditing:(UITextField*)field {++consoleInputBegins;}
-(BOOL)textField:(UITextField*)field shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)text {
    return [[field.text stringByReplacingCharactersInRange:range withString:text] lengthOfBytesUsingEncoding:NSUTF8StringEncoding]<=255;
}
@end
static void updateConsoleHeaderLayout() {
    if(!NSThread.isMainThread)return;
    bool show=consoleVisible && focusActive && host && host.window && consoleCloseCallback &&
        consoleState.render_width>0 && consoleState.render_height>0 && consoleState.bounds.width>0;
    if(!consoleHeader && show)consoleHeader=[[ICSMConsoleHeader alloc] initWithFrame:CGRectZero];
    if(!consoleHeader)return;
    if(show) {
        CGFloat sx=host.bounds.size.width/consoleState.render_width,sy=host.bounds.size.height/consoleState.render_height;
        const auto &r=consoleState.bounds;CGRect frame=CGRectMake(r.x*sx,r.y*sy,r.width*sx,r.height*sy);
        BOOL changed=!CGRectEqualToRect(consoleHeader.frame,frame);
        if(changed)consoleHeader.frame=frame;
        if(consoleHeader.superview!=host)[host addSubview:consoleHeader];
        if(!consoleCornerGuide) {
            consoleCornerGuide=[UIView new];consoleCornerGuide.alpha=0;consoleCornerGuide.userInteractionEnabled=NO;
            consoleCornerGuide.cornerConfiguration=[UICornerConfiguration configurationWithUniformRadius:[UICornerRadius containerConcentricRadius]];
        }
        if(consoleCornerGuide.superview!=host)[host insertSubview:consoleCornerGuide atIndex:0];
        consoleCornerGuide.frame=host.bounds;[consoleCornerGuide layoutIfNeeded];
        CGFloat previousRadius=consoleCornerRadius;
        consoleCornerRadius=[consoleCornerGuide effectiveRadiusForCorner:UIRectCornerAllCorners];
        if(consoleCornerRadius<=0) {
            consoleHeader.inputSurface.frame=CGRectMake(0,0,100,44);[consoleHeader.inputSurface layoutIfNeeded];
            consoleCornerRadius=[consoleHeader.inputSurface effectiveRadiusForCorner:UIRectCornerAllCorners];
            consoleCornerSource=@"UIKit capsule fallback for square container";
        }else consoleCornerSource=@"UIKit full-container concentric";
        consoleCornerRadius=std::min<CGFloat>(consoleCornerRadius,std::min(frame.size.width,frame.size.height)*.5);
        if(changed || std::abs(previousRadius-consoleCornerRadius)>.01) {
            consoleHeader.surface.cornerConfiguration=[UICornerConfiguration configurationWithUniformRadius:[UICornerRadius fixedRadius:consoleCornerRadius]];
            [consoleHeader.surface setNeedsLayout];[consoleHeader setNeedsLayout];[consoleHeader layoutIfNeeded];
        }
        [consoleHeader refreshHistory];
    }else [consoleHeader.input resignFirstResponder];
    consoleHeader.hidden=!show;
}
static NSArray *consoleRect(CGRect f) {return @[@(f.origin.x),@(f.origin.y),@(f.size.width),@(f.size.height)];}
static NSDictionary *consoleHeaderDiagnostics() {
    return @{@"visible":@(consoleHeader && !consoleHeader.hidden),@"material":@"UIBlurEffectStyleSystemThinMaterialDark",
        @"presentation":@"Native UITextView / UITextField / Source original submit and command history",
        @"original_vgui_close":@NO,@"native_close":@YES,@"closes":@(consoleNativeCloses),@"submissions":@(consoleNativeSubmits),
        @"input_begins":@(consoleInputBegins),@"keyboard_active":@(consoleHeader.input.isFirstResponder),
        @"text_characters":@(consoleText.length),@"text_limit":@65536,@"corner_radius_points":@(consoleCornerRadius),
        @"corner_source":consoleCornerSource,@"corner_curve":@"continuous",@"button_corners":@"UIKit capsule",
        @"window_points":consoleRect(consoleHeader.frame),@"input_points":consoleRect(consoleHeader.inputSurface.frame),
        @"submit_points":consoleRect(consoleHeader.submitSurface.frame),@"close_points":consoleRect(consoleHeader.closeSurface.frame),
        @"input_corner_points":@([consoleHeader.inputSurface effectiveRadiusForCorner:UIRectCornerAllCorners]),
        @"submit_corner_points":@([consoleHeader.submitSurface effectiveRadiusForCorner:UIRectCornerAllCorners]),
        @"visual_effect_views":@(translucentEffectCount(consoleHeader))};
}
static void shutdownConsoleHeader() {
    consoleCloseCallback=nullptr;consoleSubmitCallback=nullptr;consoleRecallCallback=nullptr;consoleState={};
    void (^remove)(void)=^{[consoleHeader.input resignFirstResponder];[consoleHeader removeFromSuperview];consoleHeader=nil;
        [consoleCornerGuide removeFromSuperview];consoleCornerGuide=nil;consoleText=nil;};
    if(NSThread.isMainThread)remove();else dispatch_async(dispatch_get_main_queue(),remove);
}
extern "C" void SourceTouchUpdateConsole(const SourceTouchConsoleState *s,void (*close)()) {
    if(!NSThread.isMainThread || !s || s->struct_size!=sizeof(*s))return;
    std::lock_guard<std::recursive_mutex> lock(mutex);consoleState=*s;consoleCloseCallback=close;updateConsoleHeaderLayout();
}
extern "C" bool SourceTouchGetConsoleState(SourceTouchConsoleState *s) {
    if(!s)return false;std::lock_guard<std::recursive_mutex> lock(mutex);*s=consoleState;
    return consoleVisible && consoleState.render_width>0 && consoleState.bounds.width>0;
}
extern "C" void SourceTouchConsoleSetCommandCallbacks(void (*submit)(const char*),void (*recall)(int)) {
    if(!NSThread.isMainThread)return;consoleSubmitCallback=submit;consoleRecallCallback=recall;
}
extern "C" void SourceTouchConsoleAppendText(const char *text,uint8_t r,uint8_t g,uint8_t b,uint8_t a) {
    if(!text)return;NSString *value=[[NSString alloc] initWithUTF8String:text];if(!value.length)return;
    void (^append)(void)=^{
        if(!consoleText)consoleText=[NSMutableAttributedString new];
        UIColor *color=[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a/255.0];
        [consoleText appendAttributedString:[[NSAttributedString alloc] initWithString:value attributes:@{NSFontAttributeName:consoleFont(),NSForegroundColorAttributeName:color}]];
        trimConsoleText();++consoleTextVersion;
    };
    if(NSThread.isMainThread)append();else dispatch_async(dispatch_get_main_queue(),append);
}
extern "C" void SourceTouchConsoleClearText() {
    void (^clear)(void)=^{consoleText=[NSMutableAttributedString new];++consoleTextVersion;};
    if(NSThread.isMainThread)clear();else dispatch_async(dispatch_get_main_queue(),clear);
}
extern "C" void SourceTouchConsoleSetInputText(const char *text) {
    if(NSThread.isMainThread)consoleHeader.input.text=text?@(text):@"";
}
