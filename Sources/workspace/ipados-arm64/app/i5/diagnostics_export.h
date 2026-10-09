#import <Foundation/Foundation.h>

// Foundation-only so retention, redaction and the real ZIP writer are tested
// on the build host as well as the device. UI presentation lives in main.mm.
BOOL ICSMDiagnosticsBeginSession(NSString *documents, NSString *evidence, NSError **error);
void ICSMDiagnosticsRecordError(NSString *evidence, NSString *stage, NSError *error);
void ICSMDiagnosticsSaveSystemReport(NSString *evidence, NSData *json);
NSURL *ICSMDiagnosticsCreateArchive(NSString *documents, NSString *evidence, NSError **error);
