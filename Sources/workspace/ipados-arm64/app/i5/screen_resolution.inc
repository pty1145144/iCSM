// Included by main.mm. UIKit geometry is sampled on the main thread; all
// resolution changes go through Source's mat_setvideomode/mat_savechanges.
#include "../../touch/display_policy.h"
static ICSMDisplay::Size initialOutput={};
static NSMutableDictionary *screenPolicy;
static BOOL screenResolutionPending=NO;
static BOOL screenStartupApply=NO;
static NSString *screenPolicyPath() {
 return [runtime stringByAppendingPathComponent:@"csgo/cfg/icsm-screen-policy.json"];
}
static void saveScreenPolicy() {
 NSData *data=[NSJSONSerialization dataWithJSONObject:screenPolicy options:NSJSONWritingPrettyPrinted error:nil];
 if(![data writeToFile:screenPolicyPath() atomically:YES])abort();
}
static ICSMDisplay::Size sceneOutput(UIWindowScene *scene) {
 CGSize size=scene.effectiveGeometry.coordinateSpace.bounds.size;
 CGFloat scale=scene.screen.nativeScale;
 return {(unsigned)llround(size.width*scale),(unsigned)llround(size.height*scale)};
}
static BOOL initializeScreenPolicy(NSString *cfg) {
 BOOL fresh=![NSFileManager.defaultManager fileExistsAtPath:[cfg stringByAppendingPathComponent:@"video.txt"]];
 if(fresh) {
  NSData *data=[NSData dataWithContentsOfFile:[NSBundle.mainBundle pathForResource:@"fresh-video-preset" ofType:@"json"]];
  NSDictionary *values=data?[NSJSONSerialization JSONObjectWithData:data options:0 error:nil]:nil;
  if(![values isKindOfClass:NSDictionary.class])return NO;
  NSMutableString *text=[NSMutableString stringWithString:@"\"VideoConfig\"\n{\n"];
  for(NSString *key in [[values allKeys] sortedArrayUsingSelector:@selector(compare:)])
   [text appendFormat:@"\t\"%@\"\t\"%@\"\n",key,values[key]];
  [text appendString:@"}\n"];writeText([cfg stringByAppendingPathComponent:@"video.txt"],text);
 }
 NSData *saved=[NSData dataWithContentsOfFile:screenPolicyPath()];
 NSDictionary *decoded=saved?[NSJSONSerialization JSONObjectWithData:saved options:0 error:nil]:nil;
 if([decoded isKindOfClass:NSDictionary.class] && [decoded[@"version"] isEqual:@1] &&
    [decoded[@"automatic"] isKindOfClass:NSNumber.class])screenPolicy=[decoded mutableCopy];
 else screenPolicy=[@{@"version":@1,@"automatic":@NO} mutableCopy];
 if(!screenPolicy[@"fresh_quality_pending"])screenPolicy[@"fresh_quality_pending"]=@(fresh);
 if(fresh) {
  NSString *defaults=[NSString stringWithContentsOfFile:[NSBundle.mainBundle pathForResource:@"fresh-client-defaults" ofType:@"cfg"] encoding:NSUTF8StringEncoding error:nil];
  if(!defaults)return NO;
  writeText([cfg stringByAppendingPathComponent:@"i5_fresh_defaults.cfg"],defaults);
 }
 screenStartupApply=[screenPolicy[@"automatic"] boolValue] || [screenPolicy[@"fresh_quality_pending"] boolValue];
 saveScreenPolicy();return YES;
}
static BOOL writeAutomaticResolution(NSString *cfg,ICSMDisplay::Size size) {
 if(!size.width || !size.height)return NO;
 NSString *path=[cfg stringByAppendingPathComponent:@"video.txt"];
 NSString *text=[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
 NSRegularExpression *block=[NSRegularExpression regularExpressionWithPattern:@"\\A\\s*\"(?:VideoConfig|config)\"\\s*\\{([\\s\\S]*)\\}\\s*\\z" options:0 error:nil];
 NSTextCheckingResult *match=text?[block firstMatchInString:text options:0 range:NSMakeRange(0,text.length)]:nil;
 if(!match)return NO;
 NSString *body=[text substringWithRange:[match rangeAtIndex:1]];
 NSRegularExpression *pairs=[NSRegularExpression regularExpressionWithPattern:@"\"([^\"\\\\]+)\"\\s*\"([^\"\\\\]*)\"" options:0 error:nil];
 if([[pairs stringByReplacingMatchesInString:body options:0 range:NSMakeRange(0,body.length) withTemplate:@""] stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet].length)return NO;
 NSMutableDictionary *values=[NSMutableDictionary dictionary];
 for(NSTextCheckingResult *pair in [pairs matchesInString:body options:0 range:NSMakeRange(0,body.length)])values[[body substringWithRange:[pair rangeAtIndex:1]]]=[body substringWithRange:[pair rangeAtIndex:2]];
 values[@"setting.defaultres"]=@(size.width);values[@"setting.defaultresheight"]=@(size.height);
 values[@"setting.aspectratiomode"]=@(ICSMDisplay::Aspect(size));
 NSMutableString *updated=[NSMutableString stringWithString:@"\"VideoConfig\"\n{\n"];
 for(NSString *key in [[values allKeys] sortedArrayUsingSelector:@selector(compare:)])[updated appendFormat:@"\t\"%@\"\t\"%@\"\n",key,values[key]];
 [updated appendString:@"}\n"];writeText(path,updated);
 screenPolicy[@"width"]=@(size.width);screenPolicy[@"height"]=@(size.height);saveScreenPolicy();
 printf("ICSM_SCREEN_AUTO render=%ux%u aspect_category=%u\n",size.width,size.height,ICSMDisplay::Aspect(size));return YES;
}
static BOOL enforceFullscreenVideoConfig(NSString *cfg) {
 NSString *path=[cfg stringByAppendingPathComponent:@"video.txt"];
 NSString *text=[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
 NSRegularExpression *block=[NSRegularExpression regularExpressionWithPattern:@"\\A\\s*\"(?:VideoConfig|config)\"\\s*\\{([\\s\\S]*)\\}\\s*\\z" options:0 error:nil];
 NSTextCheckingResult *match=text?[block firstMatchInString:text options:0 range:NSMakeRange(0,text.length)]:nil;
 if(!match)return NO;
 NSString *body=[text substringWithRange:[match rangeAtIndex:1]];
 NSRegularExpression *pairs=[NSRegularExpression regularExpressionWithPattern:@"\"([^\"\\\\]+)\"\\s*\"([^\"\\\\]*)\"" options:0 error:nil];
 if([[pairs stringByReplacingMatchesInString:body options:0 range:NSMakeRange(0,body.length) withTemplate:@""] stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet].length)return NO;
 NSMutableDictionary *values=[NSMutableDictionary dictionary];
 for(NSTextCheckingResult *pair in [pairs matchesInString:body options:0 range:NSMakeRange(0,body.length)])values[[body substringWithRange:[pair rangeAtIndex:1]]]=[body substringWithRange:[pair rangeAtIndex:2]];
 if([values[@"setting.fullscreen"] isEqualToString:@"1"] && [values[@"setting.nowindowborder"] isEqualToString:@"0"])return YES;
 NSString *backup=[evidence stringByAppendingPathComponent:@"video-before-fullscreen-lock.txt"];
 if(![NSFileManager.defaultManager fileExistsAtPath:backup])writeText(backup,text);
 values[@"setting.fullscreen"]=@"1";values[@"setting.nowindowborder"]=@"0";
 NSMutableString *updated=[NSMutableString stringWithString:@"\"VideoConfig\"\n{\n"];
 for(NSString *key in [[values allKeys] sortedArrayUsingSelector:@selector(compare:)])[updated appendFormat:@"\t\"%@\"\t\"%@\"\n",key,values[key]];
 [updated appendString:@"}\n"];writeText(path,updated);
 printf("ICSM_FULLSCREEN_LOCK migrated_saved_config\n");return YES;
}
static void updateScreenPolicy(void (*queue)(const char*),NSDictionary *gpu,UIWindowScene *scene) {
 if(!screenPolicy || !queue || ![gpu[@"attached"] boolValue] || !scene)return;
 NSString *request=[runtime stringByAppendingPathComponent:@"csgo/cfg/icsm-auto-resolution.request"];
 BOOL requested=[NSFileManager.defaultManager fileExistsAtPath:request];
 if(requested)[NSFileManager.defaultManager removeItemAtPath:request error:nil];
 if(screenStartupApply) {
  screenStartupApply=NO;requested=requested || [screenPolicy[@"automatic"] boolValue];
  if([screenPolicy[@"fresh_quality_pending"] boolValue]) {
   queue("icsm_initial_video; exec i5_fresh_defaults.cfg\n");
   screenPolicy[@"fresh_quality_pending"]=@NO;
   saveScreenPolicy();
  }
 }
 // After client configuration is synchronized, the four quality presets own
 // render dimensions. Legacy automatic sizing must not override a saved tier
 // on the next launch. Fresh-install initialization above still runs once.
 void *qualityClient=dlopen([[NSBundle.mainBundle.privateFrameworksPath stringByAppendingPathComponent:@"client_panorama.framework/client_panorama"] fileSystemRepresentation],RTLD_NOLOAD|RTLD_NOW);
 auto qualityOwns=qualityClient?(bool(*)())dlsym(qualityClient,"SourceTouchQualityManagesResolution"):nullptr;
 BOOL managed=qualityOwns && qualityOwns();
 if(qualityClient)dlclose(qualityClient);
 if(managed) {
  if([screenPolicy[@"automatic"] boolValue]){screenPolicy[@"automatic"]=@NO;saveScreenPolicy();}
  screenResolutionPending=NO;
  if(requested)queue("icsm_apply_quality_preset\n");
  return;
 }
 unsigned width=[gpu[@"width"] unsignedIntValue],height=[gpu[@"height"] unsignedIntValue];
 if(screenResolutionPending && width==[screenPolicy[@"width"] unsignedIntValue] && height==[screenPolicy[@"height"] unsignedIntValue])screenResolutionPending=NO;
 if(!requested && [screenPolicy[@"automatic"] boolValue] && !screenResolutionPending &&
    (width!=[screenPolicy[@"width"] unsignedIntValue] || height!=[screenPolicy[@"height"] unsignedIntValue])) {
  // A manual change in the original video menu opts out of automatic sizing.
  screenPolicy[@"automatic"]=@NO;saveScreenPolicy();printf("ICSM_SCREEN_AUTO manual_override=%ux%u\n",width,height);
 }
 if(!requested && ![screenPolicy[@"automatic"] boolValue])return;
 auto output=sceneOutput(scene);auto target=ICSMDisplay::Automatic(output.width,output.height);
 if(requested || (!screenResolutionPending && (target.width!=width || target.height!=height))) {
  screenPolicy[@"automatic"]=@YES;
  screenPolicy[@"width"]=@(target.width);screenPolicy[@"height"]=@(target.height);saveScreenPolicy();
  screenResolutionPending=target.width!=width || target.height!=height;
  NSString *command=screenResolutionPending?[NSString stringWithFormat:@"mat_setvideomode %u %u 0 0; mat_savechanges\n",target.width,target.height]:@"mat_savechanges\n";
  queue(command.UTF8String);printf("ICSM_SCREEN_AUTO requested=%ux%u output=%ux%u\n",target.width,target.height,output.width,output.height);
 }
}
