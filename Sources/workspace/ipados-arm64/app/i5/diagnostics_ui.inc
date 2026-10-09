// Methods of Controller. Compression and MetricKit report storage are serial
// background work; UIKit presentation remains on Source's main thread.
static dispatch_queue_t diagnosticsQueue() {
 static dispatch_queue_t queue;static dispatch_once_t once;
 dispatch_once(&once,^{queue=dispatch_queue_create("iCSM.diagnostics",DISPATCH_QUEUE_SERIAL);});return queue;
}
-(void)didReceiveDiagnosticPayloads:(NSArray<MXDiagnosticPayload*>*)payloads {
 dispatch_async(diagnosticsQueue(),^{@autoreleasepool{
  for(MXDiagnosticPayload *payload in payloads)ICSMDiagnosticsSaveSystemReport(evidence,payload.JSONRepresentation);
 }});
}
-(UIViewController*)diagnosticsPresenter {
 UIWindow *visible=nil;
 for(UIWindow *window in self.gameScene.windows)if(!window.hidden && window.alpha>0) {
  if(window.isKeyWindow){visible=window;break;}
  if(!visible || window.windowLevel>visible.windowLevel)visible=window;
 }
 UIViewController *controller=visible.rootViewController;
 while(controller.presentedViewController && !controller.presentedViewController.isBeingDismissed)controller=controller.presentedViewController;
 return controller;
}
-(void)exportErrorLogs {
 if(!NSThread.isMainThread){dispatch_async(dispatch_get_main_queue(),^{[self exportErrorLogs];});return;}
 if(self.exportingLogs)return;
 UIViewController *presenter=[self diagnosticsPresenter];if(!presenter || presenter.isBeingDismissed)return;
 self.exportingLogs=YES;self.exportLogsButton.enabled=NO;
 printf("ICSM_LOG_EXPORT requested\n");
 dispatch_async(diagnosticsQueue(),^{@autoreleasepool{
  // Drain the existing status writer off the main thread before snapshotting.
  dispatch_sync(statusWriteQueue(),^{});
  NSError *error=nil;NSURL *url=ICSMDiagnosticsCreateArchive(root,evidence,&error);
  dispatch_async(dispatch_get_main_queue(),^{
   self.exportLogsButton.enabled=YES;
   UIViewController *active=[self diagnosticsPresenter];
   if(!url || !active) {
    self.exportingLogs=NO;
    if(active){UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"日志导出失败" message:error.localizedDescription?:@"请稍后重试。" preferredStyle:UIAlertControllerStyleAlert];
     [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];[active presentViewController:alert animated:YES completion:nil];}
    return;
   }
   UIActivityViewController *share=[[UIActivityViewController alloc] initWithActivityItems:@[url] applicationActivities:nil];
   share.popoverPresentationController.sourceView=active.view;
   share.popoverPresentationController.sourceRect=CGRectMake(CGRectGetMidX(active.view.bounds),CGRectGetMidY(active.view.bounds),1,1);
   share.popoverPresentationController.permittedArrowDirections=0;
   share.completionWithItemsHandler=^(UIActivityType type,BOOL completed,NSArray *items,NSError *activityError){
    self.exportingLogs=NO;printf("ICSM_LOG_EXPORT share_completed=%d\n",completed);
   };
   [active presentViewController:share animated:YES completion:^{
    NSDictionary *state=@{@"archive":url.lastPathComponent,@"presented":@YES,@"pid":@(getpid()),@"app_build":NSBundle.mainBundle.infoDictionary[@"CFBundleVersion"]?:@""};
    [[NSJSONSerialization dataWithJSONObject:state options:0 error:nil] writeToFile:[evidence stringByAppendingPathComponent:@"log-export.json"] atomically:YES];
    printf("ICSM_LOG_EXPORT share_presented=1\n");
   }];
  });
 }});
}
-(void)exportErrorLogsRequested:(NSNotification*)notification {[self exportErrorLogs];}
