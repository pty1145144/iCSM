#import "../app/i5/diagnostics_export.h"
int main(int argc,char **argv) {
 @autoreleasepool {
  if(argc!=4)return 2;NSString *documents=@(argv[1]),*evidence=[documents stringByAppendingPathComponent:@"I5"];
  NSError *error=nil;
  if([@(argv[2]) isEqualToString:@"begin"])return ICSMDiagnosticsBeginSession(documents,evidence,&error)?0:1;
  if([@(argv[2]) isEqualToString:@"error"]){
   NSError *metal=[NSError errorWithDomain:@"MTLLibraryErrorDomain" code:3 userInfo:@{NSLocalizedDescriptionKey:@"incompatible library"}];
   NSError *failure=[NSError errorWithDomain:@"iCSM.Data" code:2 userInfo:@{NSLocalizedDescriptionKey:@"着色器无法在当前系统加载",NSUnderlyingErrorKey:metal,@"shader_file":@"shader-cache/fixture.metallib",@"import_details":@{@"phase":@"load_metal_library",@"archive_bytes":@128,@"current_file":@"shader-cache/fixture.metallib"}}];
   ICSMDiagnosticsRecordError(evidence,@"data_and_shader_preparation",failure);return 0;
  }
  if([@(argv[2]) isEqualToString:@"system"]){
   ICSMDiagnosticsSaveSystemReport(evidence,[@"{\"crashDiagnostics\":[{\"signal\":11,\"callStackTree\":{\"frame\":7}}]}" dataUsingEncoding:NSUTF8StringEncoding]);return 0;
  }
  NSURL *url=ICSMDiagnosticsCreateArchive(documents,evidence,&error);
  if(!url){fprintf(stderr,"%s\n",error.description.UTF8String);return 1;}
  [url.path writeToFile:@(argv[3]) atomically:YES encoding:NSUTF8StringEncoding error:nil];return 0;
 }
}
