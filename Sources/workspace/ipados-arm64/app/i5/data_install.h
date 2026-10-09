#import <Foundation/Foundation.h>

// Runs only before Source starts. All callbacks execute on the worker thread.
// First message line is the stage, optional second line is the current file.
// Fraction is measured work within that stage; -1 means no known total.
typedef void (^ICSMInstallProgress)(NSString *stage, double fraction);
BOOL ICSMPrepareInstallation(NSString *documents, NSString *cache,
                            NSDictionary *manifest, NSString *receiptPath,
                            ICSMInstallProgress progress, NSError *__strong *error);
NSDictionary *ICSMDistributionManifest(void);

// Borrow a ZIP selected with UIDocumentPicker (open-in-place). Coordinates a
// read under its security scope; never renames or deletes the selected source.
BOOL ICSMPrepareInstallationFromArchive(NSURL *archive, NSString *documents,
                                       NSString *cache, NSDictionary *manifest,
                                       NSString *receiptPath, ICSMInstallProgress progress,
                                       NSError *__strong *error);
