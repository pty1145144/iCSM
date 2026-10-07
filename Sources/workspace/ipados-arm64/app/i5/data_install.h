#import <Foundation/Foundation.h>

// Runs only before Source starts. All callbacks execute on the worker thread.
typedef void (^ICSMInstallProgress)(NSString *stage, double fraction);
BOOL ICSMPrepareInstallation(NSString *documents, NSString *cache,
                            NSDictionary *manifest, NSString *receiptPath,
                            ICSMInstallProgress progress, NSError *__strong *error);
NSDictionary *ICSMDistributionManifest(void);
