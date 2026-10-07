#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import <CommonCrypto/CommonDigest.h>
#import <Network/Network.h>
#import "data_install.h"
#include "../../touch/player_name.h"
#include <dlfcn.h>
#include <unistd.h>
#include <mach/mach.h>
#include <mach-o/dyld.h>
#include <mach-o/loader.h>
#include <vector>
#include <string>
#include <atomic>
#include <ifaddrs.h>
#include <arpa/inet.h>
#include <net/if.h>
static nw_connection_t networkProbe;
static NSDictionary *networkProbeState;
static void probeLocalNetwork(NSString *address){
 // TN3179 recommends a connected UDP socket to trigger the normal local
 // network prompt without sending application traffic.
 struct in_addr ip={};
 if(inet_pton(AF_INET,address.UTF8String,&ip)!=1)return;
 if(networkProbe)nw_connection_cancel(networkProbe);
 networkProbeState=@{@"destination":address,@"state":@"starting"};
 nw_endpoint_t endpoint=nw_endpoint_create_host(address.UTF8String,"27015");
 nw_parameters_t parameters=nw_parameters_create_secure_udp(NW_PARAMETERS_DISABLE_PROTOCOL,NW_PARAMETERS_DEFAULT_CONFIGURATION);
 networkProbe=nw_connection_create(endpoint,parameters);
 nw_connection_t connection=networkProbe;
 nw_connection_set_queue(connection,dispatch_get_main_queue());
 nw_connection_set_state_changed_handler(connection,^(nw_connection_state_t state,nw_error_t error){
  nw_path_t path=nw_connection_copy_current_path(connection);
  int reason=path?(int)nw_path_get_unsatisfied_reason(path):0;
  networkProbeState=@{@"destination":address,@"state":@(state),@"path_reason":@(reason),@"local_network_denied":@(reason==nw_path_unsatisfied_reason_local_network_denied),@"error":@(error?nw_error_get_error_code(error):0)};
  printf("ICSM_NETWORK_PROBE state=%d path_reason=%d error=%d foreground=%d\n",(int)state,reason,error?nw_error_get_error_code(error):0,UIApplication.sharedApplication.applicationState==UIApplicationStateActive);
 });
 nw_connection_start(connection);
}
static NSDictionary *networkInterfaceSnapshot(){
 NSMutableArray *addresses=[NSMutableArray array];struct ifaddrs *list=nullptr;
 if(getifaddrs(&list)==0){
  for(struct ifaddrs *entry=list;entry;entry=entry->ifa_next){
   if(!entry->ifa_addr || entry->ifa_addr->sa_family!=AF_INET || !(entry->ifa_flags&IFF_UP))continue;
   char address[INET_ADDRSTRLEN]={};
   if(inet_ntop(AF_INET,&((struct sockaddr_in*)entry->ifa_addr)->sin_addr,address,sizeof(address)))
    [addresses addObject:@{@"interface":@(entry->ifa_name),@"ipv4":@(address),@"loopback":@((entry->ifa_flags&IFF_LOOPBACK)!=0)}];
  }freeifaddrs(list);
 }
 return @{@"interfaces":addresses,@"probe":networkProbeState?:@{@"state":@"not_started"}};
}
static NSString *root,*evidence,*runtime;static BOOL started=NO;static std::atomic<int> result{-999};
static UIInterfaceOrientationMask diagnosticOrientationMask=UIInterfaceOrientationMaskLandscape;
static unsigned applicationTouchEdges=0;
static unsigned mainQueueCompletions=0;
static BOOL mainQueueProbePending=NO;
static NSString *lastTouchView=@"",*lastTouchWindow=@"";
@interface ICSMApplication:UIApplication @end
@implementation ICSMApplication
-(void)sendEvent:(UIEvent*)event {
 for(UITouch *touch in event.allTouches)if(touch.phase==UITouchPhaseBegan || touch.phase==UITouchPhaseEnded || touch.phase==UITouchPhaseCancelled){
  ++applicationTouchEdges;lastTouchView=touch.view?NSStringFromClass(touch.view.class):@"none";lastTouchWindow=touch.window?NSStringFromClass(touch.window.class):@"none";
  CGPoint p=[touch locationInView:touch.window];
  printf("ICSM_APP_TOUCH phase=%ld type=%ld window=%s view=%s point=%.2f,%.2f ignoring=%d\n",(long)touch.phase,(long)touch.type,lastTouchWindow.UTF8String,lastTouchView.UTF8String,p.x,p.y,self.isIgnoringInteractionEvents);
 }
 [super sendEvent:event];
}
@end
static void setDiagnosticOrientationHint(const char *value) {
 void *sdl=dlopen([[NSBundle.mainBundle.privateFrameworksPath stringByAppendingPathComponent:@"SDL2-2.0.framework/SDL2-2.0"] fileSystemRepresentation],RTLD_NOLOAD|RTLD_NOW);
 auto setHint=sdl?(int(*)(const char*,const char*))dlsym(sdl,"SDL_SetHint"):nullptr;
 if(setHint)setHint("SDL_IOS_ORIENTATIONS",value);
 if(sdl)dlclose(sdl);
}
static void writeText(NSString *path,NSString *text){NSError *error=nil;if(![text writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:&error]){fprintf(stderr,"I5_WRITE_ERROR %s\n",error.description.UTF8String);abort();}}
#include "screen_resolution.inc"
static BOOL applyLocalProfile(NSString *cfg){
 NSString *resource=[NSBundle.mainBundle.resourcePath stringByAppendingPathComponent:@"icsm-profile.json"];
 NSData *data=[NSData dataWithContentsOfFile:resource];
 NSDictionary *profile=data?[NSJSONSerialization JSONObjectWithData:data options:0 error:nil]:nil;
 NSString *version=profile[@"version"],*defaultName=ICSMValidatedPlayerName(profile[@"default_name"]);
 if(![version isKindOfClass:NSString.class] || !defaultName){printf("ICSM_PROFILE invalid_resource\n");return NO;}
 NSString *marker=[cfg stringByAppendingPathComponent:@"icsm-profile-version.txt"];
 NSString *path=[cfg stringByAppendingPathComponent:@"config.cfg"],*old=[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
 if(!old && [[NSFileManager defaultManager] fileExistsAtPath:path]){printf("ICSM_PROFILE unreadable_config\n");return NO;}
 old=old?:@"";
 NSString *nickname=ICSMValidatedPlayerName([NSUserDefaults.standardUserDefaults stringForKey:ICSMPlayerNamePreference]);
 if(!nickname){
  NSRegularExpression *quotedName=[NSRegularExpression regularExpressionWithPattern:@"(?m)^name[ \\t]+\"([^\"\\r\\n]*)\"" options:0 error:nil];
  NSTextCheckingResult *match=[quotedName firstMatchInString:old options:0 range:NSMakeRange(0,old.length)];
  NSString *previous=match?[old substringWithRange:[match rangeAtIndex:1]]:nil;
  // Migrate the previous author profile once; retain other players' names.
  if(![previous isEqualToString:@"【iCSM】-ZeShin-S"] && ![previous isEqualToString:@"unnamed"])
   nickname=ICSMValidatedPlayerName(previous);
 }
 nickname=nickname?:defaultName;
 NSRegularExpression *nameLine=[NSRegularExpression regularExpressionWithPattern:@"(?m)^name[ \\t]+[^\\r\\n]*" options:0 error:nil];
 NSString *replacement=[NSString stringWithFormat:@"name \"%@\"",nickname];
 NSString *updated=[nameLine stringByReplacingMatchesInString:old options:0 range:NSMakeRange(0,old.length) withTemplate:[NSRegularExpression escapedTemplateForString:replacement]];
 if(![nameLine numberOfMatchesInString:old options:0 range:NSMakeRange(0,old.length)])updated=[old stringByAppendingFormat:@"\n%@\n",replacement];
 NSString *backup=[evidence stringByAppendingPathComponent:[NSString stringWithFormat:@"config-before-profile-%@.cfg",version]];
 if(![[NSFileManager defaultManager] fileExistsAtPath:backup])writeText(backup,old);
 if(![old isEqualToString:updated])writeText(path,updated);writeText(marker,version);
 printf("ICSM_PROFILE user_name_ready version=%s\n",version.UTF8String);
 return YES;
}
static BOOL prepareGame(){@autoreleasepool{
 FILE *f=freopen([[evidence stringByAppendingPathComponent:@"client.log"] fileSystemRepresentation],"w",stdout);if(!f)abort();dup2(fileno(stdout),STDERR_FILENO);setvbuf(stdout,nullptr,_IOLBF,0);setvbuf(stderr,nullptr,_IOLBF,0);
 printf("I5_START pid=%d executable=%s\n",getpid(),NSBundle.mainBundle.executablePath.UTF8String);
 NSString *assets=[root stringByAppendingPathComponent:@"game-assets"];
 printf("I5_ASSETS distribution_installation_verified\n");
 runtime=[root stringByAppendingPathComponent:@"runtime-i5"];NSString *game=[runtime stringByAppendingPathComponent:@"csgo"],*cfg=[game stringByAppendingPathComponent:@"cfg"],*fontdir=[game stringByAppendingPathComponent:@"panorama/fonts"];
 NSString *cache=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES).firstObject stringByAppendingPathComponent:@"SourceMetal-I5"];
 for(NSString *p in @[runtime,game,cfg,fontdir,cache,[runtime stringByAppendingPathComponent:@"bin"],[game stringByAppendingPathComponent:@"bin"]])[[NSFileManager defaultManager] createDirectoryAtPath:p withIntermediateDirectories:YES attributes:nil error:nil];
 if(!initializeScreenPolicy(cfg) || !applyLocalProfile(cfg)){result=-7;return NO;}
 if(!enforceFullscreenVideoConfig(cfg)){result=-7;return NO;}
 if([screenPolicy[@"automatic"] boolValue] && !writeAutomaticResolution(cfg,ICSMDisplay::Automatic(initialOutput.width,initialOutput.height))){result=-7;return NO;}
 NSString *freshVideo=[NSString stringWithContentsOfFile:[NSBundle.mainBundle pathForResource:@"fresh-video" ofType:@"kv"] encoding:NSUTF8StringEncoding error:nil];
 if(!freshVideo){result=-7;return NO;}writeText([cfg stringByAppendingPathComponent:@"i5_initial_video.kv"],freshVideo);
 // Source resolves its first MOD font directory as a complete collection.
 // Keep all original fonts reachable beside the adapted configuration.
 NSString *originalFonts=[assets stringByAppendingPathComponent:@"csgo/panorama/fonts"];
 for(NSString *name in [[NSFileManager defaultManager] contentsOfDirectoryAtPath:originalFonts error:nil]) {
  if([name isEqualToString:@"fonts.conf"])continue;
  NSString *link=[fontdir stringByAppendingPathComponent:name];
  if(![[NSFileManager defaultManager] fileExistsAtPath:link]) {
   NSError *error=nil;
   if(![[NSFileManager defaultManager] createSymbolicLinkAtPath:link withDestinationPath:[@"../../../../game-assets/csgo/panorama/fonts" stringByAppendingPathComponent:name] error:&error]) {printf("I5_FONT_LINK_ERROR %s\n",error.description.UTF8String);result=-6;return NO;}
  }
 }
 NSString *workshop=[assets stringByAppendingPathComponent:@"icsm-addon"];
 writeText([game stringByAppendingPathComponent:@"gameinfo.txt"],[NSString stringWithFormat:@"\"GameInfo\" { game \"Counter-Strike: Global Offensive\" type multiplayer_only bots 1 FileSystem { SteamAppId 730 SearchPaths { Game |gameinfo_path|. Game \"%@\" Mod \"%@\" Game \"%@/csgo\" Mod \"%@/csgo\" Platform \"%@/platform\" Game \"%@/platform\" UsrLocal |gameinfo_path|. } } }\n",workshop,workshop,assets,assets,assets,assets]);
 NSData *steam=[NSData dataWithContentsOfFile:[assets stringByAppendingPathComponent:@"csgo/steam.inf"]];if(![steam writeToFile:[game stringByAppendingPathComponent:@"steam.inf"] atomically:YES])abort();
 // Aim Botz sets these non-cheat convars globally. The original mode configs
 // do not restore them, leaving the next match restricted to human T / bot CT.
 // Use the defaults in cs_gamerules.cpp and cs_bot_init.cpp in the regular
 // mode's server override, after its original config has been executed.
 writeText([cfg stringByAppendingPathComponent:@"i5_offline_teams.cfg"],@"mp_humanteam any\nbot_join_team any\n");
 NSString *offline=@"exec i5_offline_teams.cfg\nsv_lan 1\nlog on\nmp_logdetail 3\nbot_quota_mode fill\nbot_quota 10\nbot_join_after_player 1\nbot_difficulty 2\n";
 writeText([cfg stringByAppendingPathComponent:@"i5_offline.cfg"],offline);for(NSString *n in @[@"gamemode_casual_server.cfg",@"gamemode_competitive_server.cfg"])writeText([cfg stringByAppendingPathComponent:n],@"exec i5_offline.cfg\n");
 // Keep each other regular mode's original quota (Wingman is four total).
 // Custom/training/cooperative maps retain their intentional team rules.
 for(NSString *n in @[@"gamemode_competitive2v2_server.cfg",@"gamemode_armsrace_server.cfg",@"gamemode_demolition_server.cfg",@"gamemode_deathmatch_server.cfg",@"gamemode_teamdeathmatch_server.cfg"])writeText([cfg stringByAppendingPathComponent:n],@"exec i5_offline_teams.cfg\n");
 NSString *bindings=@"bind w +forward\nbind s +back\nbind a +moveleft\nbind d +moveright\nbind SPACE +jump\nbind CTRL +duck\nbind SHIFT +speed\nbind MOUSE1 +attack\nbind MOUSE2 +attack2\nbind r +reload\nbind e +use\nbind 1 slot1\nbind 2 slot2\nbind 3 slot3\nbind b buymenu\nbind TAB +showscores\nbind ESCAPE cancelselect\ncon_enable 1\ncon_logfile i5_console.log\nm_rawinput 1\nmat_queue_mode 0\nicsm_apply_fps_limit\n";
 if([screenPolicy[@"fresh_quality_pending"] boolValue])bindings=[bindings stringByAppendingString:@"exec i5_fresh_defaults.cfg\n"];
 writeText([cfg stringByAppendingPathComponent:@"i5_bindings.cfg"],bindings);
 // Preserve the original font rules; adapt only system directory/cache locations.
 NSString *fontconf=[NSString stringWithContentsOfFile:[assets stringByAppendingPathComponent:@"csgo/panorama/fonts/fonts.conf"] encoding:NSUTF8StringEncoding error:nil];
 fontconf=[fontconf stringByReplacingOccurrencesOfString:@"WINDOWSFONTDIR" withString:[assets stringByAppendingPathComponent:@"platform/vgui/fonts"]];fontconf=[fontconf stringByReplacingOccurrencesOfString:@"WINDOWSTEMPDIR_FONTCONFIG_CACHE" withString:[cache stringByAppendingPathComponent:@"fonts"]];
 fontconf=[fontconf stringByReplacingOccurrencesOfString:@"<include>conf.d</include>" withString:[NSString stringWithFormat:@"<include>%@</include>",[assets stringByAppendingPathComponent:@"csgo/panorama/fonts/conf.d"]]];
 [[NSFileManager defaultManager] createDirectoryAtPath:[cache stringByAppendingPathComponent:@"fonts"] withIntermediateDirectories:YES attributes:nil error:nil];
 setenv("XDG_CACHE_HOME",cache.fileSystemRepresentation,1);
 writeText([fontdir stringByAppendingPathComponent:@"fonts.conf"],fontconf);setenv("FONTCONFIG_FILE",[[fontdir stringByAppendingPathComponent:@"fonts.conf"] fileSystemRepresentation],1);setenv("SOURCE_METAL_CACHE",cache.fileSystemRepresentation,1);
 setenv("LANG","en_US.UTF-8",1);setenv("LC_NUMERIC","C",1);chdir(runtime.fileSystemRepresentation);
 for(NSString *name in @[@"arial.ttf",@"cour.ttf",@"tahoma.ttf",@"xarialuni.ttf"]){NSURL *url=[NSURL fileURLWithPath:[[assets stringByAppendingPathComponent:@"platform/vgui/fonts"] stringByAppendingPathComponent:name]];CFErrorRef err=nullptr;BOOL ok=CTFontManagerRegisterFontsForURL((__bridge CFURLRef)url,kCTFontManagerScopeProcess,&err);printf("I5_CORETEXT register=%s success=%d\n",name.UTF8String,ok);if(err)CFRelease(err);}
 return YES;
}}
static void runClient(){@autoreleasepool{
 NSCAssert(NSThread.isMainThread,@"Source client/SDL UIKit must start on the main thread");
 NSString *module=[NSBundle.mainBundle.privateFrameworksPath stringByAppendingPathComponent:@"launcher.framework/launcher"];void *launch=dlopen(module.fileSystemRepresentation,RTLD_NOW|RTLD_GLOBAL);if(!launch){printf("I5_LOAD_ERROR %s\n",dlerror());result=-4;return;}
 auto entry=(int(*)(int,char**))dlsym(launch,"LauncherMain");if(!entry){printf("I5_ENTRY_ERROR %s\n",dlerror());result=-5;return;}
 UIWindowScene *scene=nil;for(UIScene *s in UIApplication.sharedApplication.connectedScenes)if([s isKindOfClass:UIWindowScene.class]){scene=(UIWindowScene*)s;break;}
 CGSize size=scene.effectiveGeometry.coordinateSpace.bounds.size;CGFloat scale=scene.screen.scale;
 std::vector<std::string> args={std::string(runtime.UTF8String)+"/csgo_client","-basedir",runtime.UTF8String,"-game","csgo","-fullscreen","-insecure","-nohltv","-nomaster","-nobreakpad","-novid","-panorama","-language","schinese","-panorama_native_overlay",[NSBundle.mainBundle.bundlePath stringByAppendingPathComponent:@"native-ui"].UTF8String,"+mat_queue_mode","0","+con_enable","1","+exec","i5_bindings.cfg"};std::vector<char*> argv;for(auto &a:args)argv.push_back(&a[0]);argv.push_back(nullptr);
 printf("I5_LAUNCHER_ENTRY pid=%d main_thread=%d drawable_pixel_size=%.0fx%.0f video_mode=saved_config argc=%zu\n",getpid(),NSThread.isMainThread,size.width*scale,size.height*scale,args.size());result=entry((int)args.size(),argv.data());printf("I5_RETURN result=%d pid=%d\n",result.load(),getpid());
}}
static NSDictionary *loadedImages(){NSMutableDictionary *rows=[NSMutableDictionary dictionary];for(uint32_t i=0;i<_dyld_image_count();++i){const char *path=_dyld_get_image_name(i);if(!path || !strstr(path,"CSGOI5Client.app/"))continue;const mach_header_64 *h=(const mach_header_64*)_dyld_get_image_header(i);unsigned platform=0;const uint8_t *p=(const uint8_t*)(h+1);for(uint32_t n=0;n<h->ncmds;++n){auto lc=(const load_command*)p;if(lc->cmd==LC_BUILD_VERSION)platform=((const build_version_command*)lc)->platform;p+=lc->cmdsize;}rows[@(path)]=@{@"cpu_type":@(h->cputype),@"platform":@(platform)};}return rows;}
static NSDictionary *displayInputState(UIWindowScene *scene) {
 NSMutableArray *windows=[NSMutableArray array];
 for(UIWindow *window in scene.windows) {
  UIView *view=window.rootViewController.view;
  UIView *hit=[window hitTest:[view convertPoint:CGPointMake(22,70) toView:window] withEvent:nil];
  [windows addObject:@{@"class":NSStringFromClass(window.class),@"key":@(window.isKeyWindow),@"hidden":@(window.hidden),@"level":@(window.windowLevel),@"view":view?NSStringFromClass(view.class):@"",@"interactive":@(view.userInteractionEnabled),@"points":@[@(view.bounds.size.width),@(view.bounds.size.height)],@"window_bounds":NSStringFromCGRect(window.bounds),@"window_frame":NSStringFromCGRect(window.frame),@"window_transform":NSStringFromCGAffineTransform(window.transform),@"view_transform":NSStringFromCGAffineTransform(view.transform),@"view_frame":NSStringFromCGRect(view.frame),@"hit_test":hit?NSStringFromClass(hit.class):@"none",@"layer_animations":window.layer.animationKeys?:@[],@"view_animations":view.layer.animationKeys?:@[],@"transition":@(window.rootViewController.transitionCoordinator!=nil),@"supported_orientations":@(window.rootViewController.supportedInterfaceOrientations),@"scene_orientation":@(window.windowScene.effectiveGeometry.interfaceOrientation)}];
 }
 NSMutableDictionary *state=[@{@"orientation":@(scene.effectiveGeometry.interfaceOrientation),@"orientation_locked":@(scene.effectiveGeometry.interfaceOrientationLocked),@"device_orientation":@(UIDevice.currentDevice.orientation),@"maximum_fps":@(scene.screen.maximumFramesPerSecond),@"low_power":@(NSProcessInfo.processInfo.lowPowerModeEnabled),@"thermal_state":@(NSProcessInfo.processInfo.thermalState),@"windows":windows} mutableCopy];
 state[@"ignoring_interaction"]=@(UIApplication.sharedApplication.isIgnoringInteractionEvents);
 state[@"app_touch_edges"]=@(applicationTouchEdges);state[@"last_touch_view"]=lastTouchView;state[@"last_touch_window"]=lastTouchWindow;
 state[@"main_queue_completions"]=@(mainQueueCompletions);state[@"main_queue_probe_pending"]=@(mainQueueProbePending);
 // SDL_GetTouch can reset an unknown device via SDL_GetVideoDevice(). During
 // engine shutdown that device is gone, while UIKit's timer can still run.
 // Keep this snapshot UIKit-only; the touch module owns its safe diagnostics.
 return state;
}
@interface Controller:UIViewController
@property(nonatomic,weak) UIWindowScene *gameScene;
@property(nonatomic,strong) UIWindow *coverWindow;
@property UIButton *importButton;
@property UILabel *errorLabel;@property NSTimer *timer;@property long long lastSequence;@property NSString *lastCapture;
@property BOOL routingSelfTestDone;
@property BOOL startupFinished;@property BOOL menuReadyObserved;@property unsigned long long menuReadyFrame;
@property BOOL savedVideoSynchronized;
@property NSTimeInterval startupBegan;@property NSTimeInterval startupDuration;
@end
@implementation Controller
-(void)loadView{
 // Use the exact same UIKit layout as the OS launch screen throughout asset
 // validation and engine startup. SDL creates a separate normal-level window.
 UIViewController *screen=[[UIStoryboard storyboardWithName:@"LaunchScreen" bundle:nil] instantiateInitialViewController];
 self.view=[UIView new];
 [self addChildViewController:screen];
 UIView *content=screen.view;content.translatesAutoresizingMaskIntoConstraints=NO;
 [self.view addSubview:content];
 [NSLayoutConstraint activateConstraints:@[
  [content.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
  [content.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
  [content.topAnchor constraintEqualToAnchor:self.view.topAnchor],
  [content.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
 ]];
 [screen didMoveToParentViewController:self];
}
-(BOOL)prefersStatusBarHidden{return YES;}
-(void)viewDidLoad{
 [super viewDidLoad];self.startupBegan=NSProcessInfo.processInfo.systemUptime;
 self.errorLabel=[UILabel new];self.errorLabel.textColor=UIColor.whiteColor;
 self.errorLabel.font=[UIFont systemFontOfSize:15];self.errorLabel.textAlignment=NSTextAlignmentCenter;
 self.errorLabel.backgroundColor=[UIColor colorWithWhite:0 alpha:0.65];
 self.errorLabel.layer.cornerRadius=8;self.errorLabel.layer.masksToBounds=YES;
 self.errorLabel.numberOfLines=0;self.errorLabel.translatesAutoresizingMaskIntoConstraints=NO;
 [self.view addSubview:self.errorLabel];
 [NSLayoutConstraint activateConstraints:@[
  [self.errorLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
  [self.errorLabel.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-70],
  [self.errorLabel.widthAnchor constraintLessThanOrEqualToAnchor:self.view.safeAreaLayoutGuide.widthAnchor constant:-48]
 ]];
 self.importButton=[UIButton buttonWithType:UIButtonTypeSystem];
 [self.importButton setTitle:@"检查并导入" forState:UIControlStateNormal];
 self.importButton.titleLabel.font=[UIFont boldSystemFontOfSize:18];
 self.importButton.tintColor=UIColor.whiteColor;self.importButton.backgroundColor=[UIColor colorWithWhite:0 alpha:0.6];
 self.importButton.layer.cornerRadius=10;self.importButton.translatesAutoresizingMaskIntoConstraints=NO;
 [self.importButton addTarget:self action:@selector(beginInstallation) forControlEvents:UIControlEventTouchUpInside];
 [self.view addSubview:self.importButton];
 [NSLayoutConstraint activateConstraints:@[
  [self.importButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
  [self.importButton.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-16],
  [self.importButton.widthAnchor constraintEqualToConstant:180],
  [self.importButton.heightAnchor constraintEqualToConstant:44]
 ]];self.importButton.hidden=YES;
 NSData *old=[NSData dataWithContentsOfFile:[evidence stringByAppendingPathComponent:@"command.json"]];
 if(old)self.lastSequence=[[NSJSONSerialization JSONObjectWithData:old options:0 error:nil][@"sequence"] longLongValue];
 self.timer=[NSTimer timerWithTimeInterval:1 target:self selector:@selector(update) userInfo:nil repeats:YES];
 [NSRunLoop.mainRunLoop addTimer:self.timer forMode:NSRunLoopCommonModes];
}
-(void)startClient {runClient();}
-(void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];if(!started)[self beginInstallation];
}
-(void)beginInstallation {
 if(started)return;started=YES;initialOutput=sceneOutput(self.gameScene);
 self.importButton.hidden=YES;self.errorLabel.text=@"正在检查游戏数据…";
 dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED,0),^{
  @autoreleasepool {
   NSString *cache=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES).firstObject stringByAppendingPathComponent:@"SourceMetal-I5"];
   NSString *receipt=[NSHomeDirectory() stringByAppendingPathComponent:@"Library/Application Support/iCSM/data-receipts.json"];
   NSError *error=nil;__block CFAbsoluteTime lastUpdate=0;
   BOOL ready=ICSMPrepareInstallation(root,cache,ICSMDistributionManifest(),receipt,^(NSString *stage,double fraction){
    CFAbsoluteTime now=CFAbsoluteTimeGetCurrent();if(now-lastUpdate<0.2 && fraction<1)return;lastUpdate=now;
    NSString *message=[NSString stringWithFormat:@"%@  %.0f%%",stage,fraction*100];
    dispatch_async(dispatch_get_main_queue(),^{self.errorLabel.text=message;});
   },&error);
   if(!ready){
    dispatch_async(dispatch_get_main_queue(),^{started=NO;self.errorLabel.text=error.localizedDescription;self.importButton.hidden=NO;});
    return;
   }
   if(prepareGame())dispatch_async(dispatch_get_main_queue(),^{
    self.errorLabel.text=@"正在载入大厅和渲染管线…";
    // Schedule outside a main dispatch block: Source itself pumps UIKit.
    [self performSelector:@selector(startClient) withObject:nil afterDelay:0.0];
   });
  }
 });
}
-(void)update{
 if(started && result.load()!=-999){if(!self.startupFinished)self.errorLabel.text=@"游戏启动失败，请重新打开应用。";[self.timer invalidate];self.timer=nil;return;}
 if(!mainQueueProbePending){mainQueueProbePending=YES;dispatch_async(dispatch_get_main_queue(),^{++mainQueueCompletions;mainQueueProbePending=NO;});}
 void *engine=dlopen([[NSBundle.mainBundle.privateFrameworksPath stringByAppendingPathComponent:@"engine.framework/engine"] fileSystemRepresentation],RTLD_NOLOAD|RTLD_NOW);auto ready=engine?(bool(*)())dlsym(engine,"CSGOIOSHostReady"):nullptr;auto queue=engine?(void(*)(const char*))dlsym(engine,"CSGOIOSQueueCommand"):nullptr;BOOL hostReady=ready && ready();
 NSData *data=[NSData dataWithContentsOfFile:[evidence stringByAppendingPathComponent:@"command.json"]];NSDictionary *cmd=data?[NSJSONSerialization JSONObjectWithData:data options:0 error:nil]:nil;long long seq=[cmd[@"sequence"] longLongValue];
 if(hostReady && queue && seq>self.lastSequence){NSString *text=cmd[@"command"];if([text isEqualToString:@"I5_CAPTURE"]){
  // MTLCaptureManager rejects an existing output URL. Preserve previous traces
  // and give every capture request its own destination in the app container.
  do {self.lastCapture=[NSString stringWithFormat:@"frame-%@.gputrace",NSUUID.UUID.UUIDString];}
  while([[NSFileManager defaultManager] fileExistsAtPath:[evidence stringByAppendingPathComponent:self.lastCapture]]);
  text=[NSString stringWithFormat:@"m6_metal_capture \"%@\" 1",[evidence stringByAppendingPathComponent:self.lastCapture]];
 }else if([text hasPrefix:@"I5_NETWORK_PROBE "]) {
  probeLocalNetwork([text substringFromIndex:[@"I5_NETWORK_PROBE " length]]);
  text=@"";
 }else if([text isEqualToString:@"I5_ORIENTATION_AUTO"]) {
  diagnosticOrientationMask=UIInterfaceOrientationMaskLandscape;
  setDiagnosticOrientationHint("LandscapeLeft LandscapeRight");
  for(UIWindow *window in self.gameScene.windows)[window.rootViewController setNeedsUpdateOfSupportedInterfaceOrientations];
  text=@"";
 }else if([text isEqualToString:@"I5_ORIENTATION_LEFT"] || [text isEqualToString:@"I5_ORIENTATION_RIGHT"]) {
  UIInterfaceOrientationMask mask=[text hasSuffix:@"LEFT"]?UIInterfaceOrientationMaskLandscapeLeft:UIInterfaceOrientationMaskLandscapeRight;
  diagnosticOrientationMask=mask;
  setDiagnosticOrientationHint([text hasSuffix:@"LEFT"]?"LandscapeLeft":"LandscapeRight");
  for(UIWindow *window in self.gameScene.windows)[window.rootViewController setNeedsUpdateOfSupportedInterfaceOrientations];
  [self.gameScene requestGeometryUpdateWithPreferences:[[UIWindowSceneGeometryPreferencesIOS alloc] initWithInterfaceOrientations:mask] errorHandler:^(NSError *error){printf("ICSM_ORIENTATION_REQUEST_ERROR %s\n",error.description.UTF8String);}];
  text=@"";
 }queue([text stringByAppendingString:@"\n"].UTF8String);self.lastSequence=seq;printf("I5_COMMAND sequence=%lld command=%s\n",seq,text.UTF8String);}
 void *metal=dlopen([[NSBundle.mainBundle.privateFrameworksPath stringByAppendingPathComponent:@"source_metal.framework/source_metal"] fileSystemRepresentation],RTLD_NOLOAD|RTLD_NOW);auto snapshot=metal?(NSDictionary*(*)())dlsym(metal,"SourceMetalDeviceSnapshot"):nullptr;NSDictionary *gpu=snapshot?snapshot():@{@"attached":@NO};if(metal)dlclose(metal);
 // Original Panorama initialization writes its default option sentinels.
 // Apply the fresh-install preset only after that initialization has finished.
 if(hostReady && self.startupFinished)updateScreenPolicy(queue,gpu,self.gameScene);
 if(engine)dlclose(engine);
 if(!self.startupFinished && hostReady && UIApplication.sharedApplication.applicationState==UIApplicationStateActive){
  void *client=dlopen([[NSBundle.mainBundle.privateFrameworksPath stringByAppendingPathComponent:@"client_panorama.framework/client_panorama"] fileSystemRepresentation],RTLD_NOLOAD|RTLD_NOW);
  auto menuReady=client?(bool(*)())dlsym(client,"SourceTouchMainMenuReady"):nullptr;
  BOOL readyForLobby=menuReady && menuReady();
  if(readyForLobby && queue && [screenPolicy[@"fresh_quality_pending"] boolValue])
   updateScreenPolicy(queue,gpu,self.gameScene);
  if(readyForLobby && !self.savedVideoSynchronized){
   auto syncVideo=client?(bool(*)())dlsym(client,"SourceTouchSynchronizeVideoSettings"):nullptr;
   if(syncVideo && syncVideo())self.savedVideoSynchronized=YES;
  }
  if(client)dlclose(client);
  unsigned long long frames=[gpu[@"frames"] unsignedLongLongValue];
  if(readyForLobby && [gpu[@"attached"] boolValue]){
   if(!self.menuReadyObserved){self.menuReadyObserved=YES;self.menuReadyFrame=frames;printf("ICSM_LOBBY_READY frame=%llu\n",frames);}
   // Wait for subsequent real Metal frames instead of dismissing on engine
   // initialization or on a fixed delay before the first lobby paint.
   if(frames>=self.menuReadyFrame+2 && ![gpu[@"last_error"] length]){
    UIWindow *cover=self.coverWindow,*gameWindow=nil;
    for(UIWindow *window in cover.windowScene.windows){
     if(window!=cover && !window.hidden && [NSStringFromClass(window.class) isEqualToString:@"SDL_uikitwindow"]){gameWindow=window;break;}
    }
    if(gameWindow){
     self.startupFinished=YES;self.startupDuration=NSProcessInfo.processInfo.systemUptime-self.startupBegan;
     cover.hidden=YES;[gameWindow makeKeyAndVisible];
     // UIKit's scene delegate must own the actual game window after startup.
     // Geometry and input no longer belong to the hidden launch-cover window.
     id<UIWindowSceneDelegate> delegate=(id)self.gameScene.delegate;
     if([delegate respondsToSelector:@selector(setWindow:)])delegate.window=gameWindow;
     self.coverWindow=nil;
     printf("ICSM_STARTUP_FINISHED duration=%.3f ready_frame=%llu reveal_frame=%llu\n",self.startupDuration,self.menuReadyFrame,frames);
    }
   }
  }else{self.menuReadyObserved=NO;}
 }
 if(!self.startupFinished && result.load()!=-999)self.errorLabel.text=@"游戏启动失败，请重新打开应用。";
 void *sdl=dlopen([[NSBundle.mainBundle.privateFrameworksPath stringByAppendingPathComponent:@"SDL2-2.0.framework/SDL2-2.0"] fileSystemRepresentation],RTLD_NOLOAD|RTLD_NOW);
 auto touchDiagnostics=sdl?(size_t(*)(char*,size_t))dlsym(sdl,"SourceTouchCopyDiagnosticsJSON"):nullptr;
 NSDictionary *touch=@{@"loaded":@NO};
 if(touchDiagnostics){char json[65536]={};size_t length=touchDiagnostics(json,sizeof(json));if(length && length<sizeof(json)){NSData *data=[NSData dataWithBytes:json length:length];id decoded=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];if([decoded isKindOfClass:NSDictionary.class])touch=decoded;}}
 if(!self.routingSelfTestDone && UIApplication.sharedApplication.applicationState==UIApplicationStateActive && [touch[@"available"] boolValue] && [touch[@"gameplay"] boolValue] && [touch[@"active_touches"] isKindOfClass:NSNumber.class] && [touch[@"active_touches"] integerValue]==0 && [touch[@"rendered_frames"] unsignedLongLongValue]>0 && [touch[@"controls"] isKindOfClass:NSArray.class] && [touch[@"controls"] count]>0){
  // Execute once after a real gameplay frame, with no finger on the screen.
  // The module snapshots/restores its routing state and never invokes the host
  // callbacks during the isolated test. Failures also consume this one attempt.
  self.routingSelfTestDone=YES;
  auto routingSelfTest=sdl?(size_t(*)(char*,size_t))dlsym(sdl,"SourceTouchRoutingSelfTestJSON"):nullptr;
  NSMutableDictionary *report=[@{@"status":@"failed",@"reason":@"missing or invalid routing self-test result"} mutableCopy];
  if(routingSelfTest){char json[65536]={};size_t length=routingSelfTest(json,sizeof(json));if(length && length<sizeof(json)){id decoded=[NSJSONSerialization JSONObjectWithData:[NSData dataWithBytes:json length:length] options:0 error:nil];if([decoded isKindOfClass:NSDictionary.class])report=[decoded mutableCopy];}}
  report[@"pid"]=@(getpid());report[@"updated_utc"]=[[NSISO8601DateFormatter new] stringFromDate:NSDate.date];
  [[NSJSONSerialization dataWithJSONObject:report options:NSJSONWritingPrettyPrinted error:nil] writeToFile:[evidence stringByAppendingPathComponent:@"routing-self-test.json"] atomically:YES];
  printf("I5_ROUTING_SELF_TEST status=%s pid=%d\n",[report[@"status"] description].UTF8String,getpid());
 }
 NSDictionary *displayState=displayInputState(self.gameScene);
 if(sdl)dlclose(sdl);
 NSDictionary *videoState=@{};
 if(hostReady && self.startupFinished) {
  void *client=dlopen([[NSBundle.mainBundle.privateFrameworksPath stringByAppendingPathComponent:@"client_panorama.framework/client_panorama"] fileSystemRepresentation],RTLD_NOLOAD|RTLD_NOW);
  auto video=client?(size_t(*)(char*,size_t))dlsym(client,"SourceTouchVideoStateJSON"):nullptr;
  char json[2048]={};size_t length=video?video(json,sizeof(json)):0;
  if(length && length<sizeof(json)){id decoded=[NSJSONSerialization JSONObjectWithData:[NSData dataWithBytes:json length:length] options:0 error:nil];if([decoded isKindOfClass:NSDictionary.class])videoState=decoded;}
  if(client)dlclose(client);
 }
 task_vm_info_data_t info={};mach_msg_type_number_t count=TASK_VM_INFO_COUNT;task_info(mach_task_self(),TASK_VM_INFO,(task_info_t)&info,&count);
 NSDictionary *startup=@{@"visible":@(!self.startupFinished),@"menu_ready_observed":@(self.menuReadyObserved),@"ready_frame":@(self.menuReadyFrame),@"duration":@(self.startupDuration)};
 NSDictionary *status=@{@"milestone":@"I5",@"purpose":@"four-finger touch trial",@"display_name":NSBundle.mainBundle.infoDictionary[@"CFBundleDisplayName"]?:@"",@"video_state":videoState,@"network":networkInterfaceSnapshot(),@"display_input":displayState,@"screen_policy":screenPolicy?:@{},@"startup":startup,@"app_version":NSBundle.mainBundle.infoDictionary[@"CFBundleShortVersionString"]?:@"",@"app_build":NSBundle.mainBundle.infoDictionary[@"CFBundleVersion"]?:@"",@"pid":@(getpid()),@"updated_utc":[[NSISO8601DateFormatter new] stringFromDate:NSDate.date],@"client_result":@(result.load()),@"command_sequence":@(self.lastSequence),@"capture_file":self.lastCapture?:@"",@"physical_footprint":@(info.phys_footprint),@"foreground":@(UIApplication.sharedApplication.applicationState==UIApplicationStateActive),@"host_ready":@(hostReady),@"metal":gpu,@"touch":touch,@"loaded_images":loadedImages()};[[NSJSONSerialization dataWithJSONObject:status options:NSJSONWritingPrettyPrinted error:nil] writeToFile:[evidence stringByAppendingPathComponent:@"status.json"] atomically:YES];
}
@end
@interface SceneDelegate:UIResponder<UIWindowSceneDelegate>@property(nonatomic,strong) UIWindow *window;@end
@implementation SceneDelegate
-(void)scene:(UIScene*)scene willConnectToSession:(UISceneSession*)session options:(UISceneConnectionOptions*)options{root=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES).firstObject;evidence=[root stringByAppendingPathComponent:@"I5"];[[NSFileManager defaultManager] createDirectoryAtPath:evidence withIntermediateDirectories:YES attributes:nil error:nil];self.window=[[UIWindow alloc] initWithWindowScene:(UIWindowScene*)scene];self.window.windowLevel=UIWindowLevelNormal+1;Controller *controller=[Controller new];controller.gameScene=(UIWindowScene*)scene;controller.coverWindow=self.window;self.window.rootViewController=controller;[self.window makeKeyAndVisible];UIApplication.sharedApplication.idleTimerDisabled=YES;}
-(void)windowScene:(UIWindowScene*)scene didUpdateEffectiveGeometry:(UIWindowSceneGeometry*)previous {
 UIInterfaceOrientation orientation=scene.effectiveGeometry.interfaceOrientation;
 printf("ICSM_SCENE_GEOMETRY orientation=%ld previous=%ld locked=%d\n",(long)orientation,(long)previous.interfaceOrientation,scene.effectiveGeometry.interfaceOrientationLocked);
 void *sdl=dlopen([[NSBundle.mainBundle.privateFrameworksPath stringByAppendingPathComponent:@"SDL2-2.0.framework/SDL2-2.0"] fileSystemRepresentation],RTLD_NOLOAD|RTLD_NOW);
 auto cancel=sdl?(void(*)(void*))dlsym(sdl,"SourceTouchUIKitOrientationChanging"):nullptr;
 auto setView=sdl?(void(*)(void*))dlsym(sdl,"SourceTouchSetView"):nullptr;
 for(UIWindow *window in scene.windows)if([NSStringFromClass(window.class) isEqualToString:@"SDL_uikitwindow"]){
  UIView *view=window.rootViewController.view;
  if(cancel && orientation!=previous.interfaceOrientation)cancel((__bridge void*)view);
  if(setView)setView((__bridge void*)view);
 }
 if(sdl)dlclose(sdl);
}
@end
@interface AppDelegate:UIResponder<UIApplicationDelegate>@end
@implementation AppDelegate
-(BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)options{return YES;}
-(UIInterfaceOrientationMask)application:(UIApplication*)application supportedInterfaceOrientationsForWindow:(UIWindow*)window{return diagnosticOrientationMask;}
@end
int main(int argc,char **argv){@autoreleasepool{return UIApplicationMain(argc,argv,NSStringFromClass(ICSMApplication.class),NSStringFromClass(AppDelegate.class));}}
