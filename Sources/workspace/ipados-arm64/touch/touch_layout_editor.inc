// UIKit owns editing gestures. The gameplay router never sees these touches.
// Included outside the C++ namespace so Objective-C classes have global scope.
@interface SourceTouchLayoutEditor : UIView {
    NSMutableDictionary *_draft;
    NSMutableDictionary<NSString*,UIButton*> *_buttons;
    NSMutableDictionary<NSString*,UIButton*> *_selectors;
    UIView *_canvas,*_rightHalf;
    UILabel *_title,*_help,*_sizeText,*_message,*_lookText,*_moveText;
    UIScrollView *_selector;
    UISlider *_slider;
    UIButton *_cancel,*_reset,*_save;
    NSString *_selected;
    CGRect _panStart;
    CGFloat _canvasScale;
}
- (NSDictionary*)diagnostics;
@end
static __strong SourceTouchLayoutEditor *layoutEditor;

static NSString *editorTitle(NSString *name) {
    NSDictionary *names=@{@"pause":@"暂停",@"buy":@"购买",@"scoreboard":@"战绩",@"jump":@"跳跃",@"attack":@"开火",@"attack2":@"瞄准",@"duck":@"蹲伏",
        @"weapon1":@"主武器",@"weapon2":@"副武器",@"weapon3":@"匕首",@"weapon4":@"投掷物",@"weapon5":@"炸弹",@"use":@"使用",@"reload":@"换弹",@"inspect":@"检视",@"drop":@"丢弃",@"move":@"移动",@"walk":@"静步"};
    return names[name]?:name;
}
static NSArray<NSString*> *editorNames() {
    return @[@"attack",@"attack2",@"duck",@"jump",@"use",@"reload",@"inspect",@"drop",@"walk",@"pause",@"buy",@"scoreboard",@"weapon1",@"weapon2",@"weapon3",@"weapon4",@"weapon5"];
}
static UIButton *editorButton(NSString *title,id target,SEL action) {
    UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];[button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont systemFontOfSize:18 weight:UIFontWeightSemibold];button.tintColor=UIColor.whiteColor;
    button.backgroundColor=[UIColor colorWithWhite:.23 alpha:1];button.layer.cornerRadius=8;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];return button;
}
@implementation SourceTouchLayoutEditor
- (instancetype)initWithFrame:(CGRect)frame {
    if(!(self=[super initWithFrame:frame]))return nil;
    self.backgroundColor=[UIColor colorWithRed:.055 green:.07 blue:.10 alpha:1];self.multipleTouchEnabled=YES;
    self.accessibilityViewIsModal=YES;self.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    _draft=[savedLayout mutableCopy];_buttons=[NSMutableDictionary dictionary];_selectors=[NSMutableDictionary dictionary];
    _title=[UILabel new];_title.text=@"触摸屏键位调整";_title.textColor=UIColor.whiteColor;_title.font=[UIFont systemFontOfSize:27 weight:UIFontWeightBold];[self addSubview:_title];
    _help=[UILabel new];_help.text=@"拖动按键调整位置，用滑杆调整大小。左半屏空白处滑动移动，右半屏空白处滑动视角；按键区域独立。";
    _help.textColor=[UIColor colorWithWhite:.82 alpha:1];_help.font=[UIFont systemFontOfSize:16];_help.numberOfLines=2;[self addSubview:_help];
    _cancel=editorButton(@"取消",self,@selector(cancelEditor));_reset=editorButton(@"恢复默认",self,@selector(resetEditor));_save=editorButton(@"保存",self,@selector(saveEditor));
    _save.backgroundColor=[UIColor colorWithRed:.10 green:.40 blue:.62 alpha:1];for(UIView *v in @[_cancel,_reset,_save])[self addSubview:v];
    _sizeText=[UILabel new];_sizeText.textColor=UIColor.whiteColor;_sizeText.font=[UIFont systemFontOfSize:17 weight:UIFontWeightMedium];[self addSubview:_sizeText];
    _slider=[UISlider new];_slider.minimumValue=.35;_slider.maximumValue=3;_slider.accessibilityLabel=@"选中按键的大小";
    [_slider addTarget:self action:@selector(changeSize:) forControlEvents:UIControlEventValueChanged];[self addSubview:_slider];
    _message=[UILabel new];_message.textColor=[UIColor colorWithRed:1 green:.75 blue:.38 alpha:1];_message.font=[UIFont systemFontOfSize:15];[self addSubview:_message];
    _selector=[UIScrollView new];_selector.showsHorizontalScrollIndicator=YES;[self addSubview:_selector];
    _canvas=[UIView new];_canvas.backgroundColor=[UIColor colorWithWhite:.13 alpha:1];_canvas.clipsToBounds=YES;_canvas.layer.borderWidth=1;_canvas.layer.borderColor=[UIColor colorWithWhite:.5 alpha:1].CGColor;[self addSubview:_canvas];
    _rightHalf=[UIView new];_rightHalf.backgroundColor=[UIColor colorWithRed:.10 green:.28 blue:.40 alpha:.65];_rightHalf.userInteractionEnabled=NO;[_canvas addSubview:_rightHalf];
    _lookText=[UILabel new];_lookText.text=@"右半屏 · 滑动视角\n按键区域不会转动视角";_lookText.numberOfLines=2;_lookText.textColor=[UIColor colorWithWhite:1 alpha:.55];_lookText.textAlignment=NSTextAlignmentCenter;_lookText.font=[UIFont systemFontOfSize:15];[_rightHalf addSubview:_lookText];
    _moveText=[UILabel new];_moveText.text=@"左半屏 · 滑动移动\n松手停止 · 按键区域独立";_moveText.numberOfLines=2;_moveText.textColor=[UIColor colorWithWhite:1 alpha:.55];_moveText.textAlignment=NSTextAlignmentCenter;_moveText.font=[UIFont systemFontOfSize:15];_moveText.userInteractionEnabled=NO;[_canvas addSubview:_moveText];
    CGFloat x=0;
    for(NSString *name in editorNames()) {
        UIButton *selection=editorButton(editorTitle(name),self,@selector(selectButton:));selection.accessibilityIdentifier=name;
        selection.frame=CGRectMake(x,0,90,36);x+=98;[_selector addSubview:selection];_selectors[name]=selection;
        UIButton *button=editorButton(editorTitle(name),self,@selector(selectButton:));button.accessibilityIdentifier=name;
        button.titleLabel.font=[UIFont systemFontOfSize:14 weight:UIFontWeightMedium];button.titleLabel.adjustsFontSizeToFitWidth=YES;button.titleLabel.minimumScaleFactor=.55;
        button.layer.borderWidth=1.5;button.layer.borderColor=UIColor.whiteColor.CGColor;[_canvas addSubview:button];_buttons[name]=button;
        UIPanGestureRecognizer *pan=[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragButton:)];pan.maximumNumberOfTouches=1;[button addGestureRecognizer:pan];
    }
    _selector.contentSize=CGSizeMake(x,36);_selected=@"attack";_message.text=layoutError?:@"尚未保存；取消会放弃本次修改。";
    [self setNeedsLayout];return self;
}
- (CGRect)rectForName:(NSString*)name {
    auto it=defaultRects.find(name.UTF8String);if(it==defaultRects.end())return CGRectZero;
    return resolvedLayoutRect(name,it->second,_draft);
}
- (void)layoutSubviews {
    [super layoutSubviews];if(!_canvas || viewSize.width<=0 || viewSize.height<=0)return;
    CGFloat left=self.safeAreaInsets.left+20,right=self.bounds.size.width-self.safeAreaInsets.right-20,top=self.safeAreaInsets.top+12;
    _title.frame=CGRectMake(left,top,right-left-360,38);
    _cancel.frame=CGRectMake(right-320,top,80,40);_reset.frame=CGRectMake(right-230,top,130,40);_save.frame=CGRectMake(right-90,top,90,40);
    _help.frame=CGRectMake(left,top+47,right-left,42);
    _sizeText.frame=CGRectMake(left,top+91,230,32);_slider.frame=CGRectMake(left+240,top+91,std::min<CGFloat>(500,right-left-480),32);
    _message.frame=CGRectMake(left,top+171,right-left,24);
    _selector.frame=CGRectMake(left,top+130,right-left,38);
    CGFloat canvasTop=top+205,spaceH=std::max<CGFloat>(1,self.bounds.size.height-self.safeAreaInsets.bottom-16-canvasTop);
    _canvasScale=std::min((right-left)/viewSize.width,spaceH/viewSize.height);
    CGSize preview=CGSizeMake(viewSize.width*_canvasScale,viewSize.height*_canvasScale);
    _canvas.frame=CGRectMake(left+(right-left-preview.width)*.5,canvasTop+(spaceH-preview.height)*.5,preview.width,preview.height);
    _rightHalf.frame=CGRectMake(preview.width*.5,0,preview.width*.5,preview.height);
    _lookText.frame=CGRectMake(0,preview.height*.40,preview.width*.5,60);
    _moveText.frame=CGRectMake(0,preview.height*.40,preview.width*.5,60);
    [self refreshPreview];
}
- (void)refreshPreview {
    for(NSString *name in editorNames()) {
        CGRect r=[self rectForName:name];UIButton *button=_buttons[name];button.hidden=CGRectIsEmpty(r);
        button.frame=CGRectMake(r.origin.x*_canvasScale,r.origin.y*_canvasScale,r.size.width*_canvasScale,r.size.height*_canvasScale);
        bool round=[name isEqual:@"attack"];
        button.layer.cornerRadius=round?std::min(button.bounds.size.width,button.bounds.size.height)*.5:5;
        BOOL chosen=[name isEqual:_selected];button.layer.borderWidth=chosen?3:1;
        button.layer.borderColor=(chosen?[UIColor colorWithRed:1 green:.78 blue:.26 alpha:1]:UIColor.whiteColor).CGColor;
        button.backgroundColor=[UIColor colorWithRed:chosen?.28:.15 green:chosen?.35:.19 blue:chosen?.44:.25 alpha:.9];
        _selectors[name].backgroundColor=chosen?[UIColor colorWithRed:.10 green:.40 blue:.62 alpha:1]:[UIColor colorWithWhite:.23 alpha:1];
    }
    [_canvas bringSubviewToFront:_buttons[_selected]];
    CGRect r=[self rectForName:_selected];auto it=defaultRects.find(_selected.UTF8String);
    CGFloat scale=it!=defaultRects.end() && it->second.size.width>0?r.size.width/it->second.size.width:1;
    _slider.value=scale;_sizeText.text=[NSString stringWithFormat:@"%@ · 大小 %.0f%%",editorTitle(_selected),scale*100];
}
- (void)selectButton:(UIButton*)button {_selected=button.accessibilityIdentifier;[self refreshPreview];}
- (void)dragButton:(UIPanGestureRecognizer*)gesture {
    std::lock_guard<std::recursive_mutex> lock(mutex);
    if(gesture.state==UIGestureRecognizerStateBegan){_selected=gesture.view.accessibilityIdentifier;_panStart=[self rectForName:_selected];}
    if(gesture.state==UIGestureRecognizerStateBegan || gesture.state==UIGestureRecognizerStateChanged || gesture.state==UIGestureRecognizerStateEnded) {
        // Apple translationInView is displacement since gesture begin.
        CGPoint delta=[gesture translationInView:_canvas];CGRect r=_panStart;r.origin.x+=delta.x/_canvasScale;r.origin.y+=delta.y/_canvasScale;
        _draft[_selected]=normalizedLayoutRect(boundedLayoutRect(r));[self refreshPreview];
    }
}
- (void)changeSize:(UISlider*)slider {
    std::lock_guard<std::recursive_mutex> lock(mutex);CGRect current=[self rectForName:_selected];auto it=defaultRects.find(_selected.UTF8String);if(it==defaultRects.end())return;
    CGSize size=it->second.size;CGFloat factor=std::min<CGFloat>(slider.value,std::min((viewSize.width-safe.left-safe.right)/size.width,(viewSize.height-safe.top-safe.bottom)/size.height));
    size=CGSizeMake(size.width*factor,size.height*factor);CGRect r=CGRectMake(CGRectGetMidX(current)-size.width*.5,CGRectGetMidY(current)-size.height*.5,size.width,size.height);
    _draft[_selected]=normalizedLayoutRect(boundedLayoutRect(r));[self refreshPreview];
}
- (void)resetEditor {std::lock_guard<std::recursive_mutex> lock(mutex);[_draft removeAllObjects];_message.text=@"已恢复默认预览，点击保存后生效。";[self refreshPreview];}
- (void)finishEditor {
    cancel(now());editing=false;dirty=true;[self removeFromSuperview];layoutEditor=nil;
}
- (void)cancelEditor {std::lock_guard<std::recursive_mutex> lock(mutex);[self finishEditor];}
- (void)saveEditor {
    std::lock_guard<std::recursive_mutex> lock(mutex);NSError *error=nil;
    NSURL *url=layoutURL();BOOL ok=[NSFileManager.defaultManager createDirectoryAtURL:[url URLByDeletingLastPathComponent] withIntermediateDirectories:YES attributes:nil error:&error];
    NSData *data=ok?[NSJSONSerialization dataWithJSONObject:@{@"version":@1,@"controls":_draft} options:NSJSONWritingPrettyPrinted error:&error]:nil;
    if(!data || ![data writeToURL:url options:NSDataWritingAtomic error:&error]){_message.text=[NSString stringWithFormat:@"保存失败：%@",error.localizedDescription?:@"无法写入文件"];return;}
    savedLayout=[_draft mutableCopy];layoutError=nil;++layoutSaves;[self finishEditor];
}
- (NSDictionary*)diagnostics {
    return @{@"selected":_selected?:@"",@"draft":_draft?:@{},@"canvas_frame_points":@[@(_canvas.frame.origin.x),@(_canvas.frame.origin.y),@(_canvas.frame.size.width),@(_canvas.frame.size.height)],@"preview_scale":@(_canvasScale)};
}
@end

extern "C" bool SourceTouchIsEditing() {std::lock_guard<std::recursive_mutex> lock(mutex);return editing;}
extern "C" void SourceTouchOpenLayoutEditor() {
    void (^openEditor)(void)=^{
        std::lock_guard<std::recursive_mutex> lock(mutex);
        if(editing || !host || !host.window)return;
        updateView(host);loadLayout();cancel(now());editing=true;
        CAMetalLayer *layer=(CAMetalLayer*)host.layer;
        if(!initialize(layer.device,layer.pixelFormat)){editing=false;return;}
        dirty=true;rebuild();
        layoutEditor=[[SourceTouchLayoutEditor alloc] initWithFrame:host.bounds];[host addSubview:layoutEditor];[layoutEditor layoutIfNeeded];
    };
    // Source owns a long-running main-thread loop and pumps UIKit events. A
    // main-queue block queued from that loop cannot run until LauncherMain
    // returns. Menu console commands already execute on this main thread.
    if(NSThread.isMainThread)openEditor();else dispatch_async(dispatch_get_main_queue(),openEditor);
}
