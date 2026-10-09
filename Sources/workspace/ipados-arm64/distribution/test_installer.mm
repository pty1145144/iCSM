// Integration harness for the same importer linked by the iOS app.
#import "../app/i5/data_install.h"
#include <unistd.h>
int main(int argc,char **argv) {
 @autoreleasepool {
  if(argc!=3 && argc!=4)return 2;
  NSString *directory=@(argv[1]);
  NSDictionary *manifest=[NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:@(argv[2])] options:0 error:nil];
  NSError *error=nil;__block NSString *last;
  ICSMInstallProgress progress=^(NSString *stage,double fraction){
    if(![last isEqual:stage]){last=stage;printf("STAGE %s\n",stage.UTF8String);}
   };
  NSString *cache=[directory stringByAppendingPathComponent:@"cache"],*receipt=[directory stringByAppendingPathComponent:@"receipts.json"];
  BOOL ok=argc==4?ICSMPrepareInstallationFromArchive([NSURL fileURLWithPath:@(argv[3])],directory,cache,manifest,receipt,progress,&error):
   ICSMPrepareInstallation(directory,cache,manifest,receipt,progress,&error);
  printf("RESULT %s %s\n",ok?"OK":"FAILED",error?error.localizedDescription.UTF8String:"");
  if(error)printf("ERROR domain=%s code=%ld shader=%s underlying=%s\n",error.domain.UTF8String,(long)error.code,[error.userInfo[@"shader_file"] UTF8String]?:"",[error.userInfo[NSUnderlyingErrorKey] domain].UTF8String?:"");
  return ok?0:1;
 }
}
