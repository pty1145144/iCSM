// Native text input stays outside SDL's gameplay and Panorama pointer routes.
#include "player_name.h"
@interface ICSMPlayerNameEditor : NSObject<UITextFieldDelegate>
@property(nonatomic,strong) UIAlertController *alert;
@property(nonatomic,strong) UIAlertAction *saveAction;
@property(nonatomic,assign) void (*completion)(const char *);
- (void)textChanged:(UITextField *)field;
- (void)save;
@end
static ICSMPlayerNameEditor *playerNameEditor;
@implementation ICSMPlayerNameEditor
- (void)textChanged:(UITextField *)field {
    // Marked text belongs to the IME until composition is committed.
    self.saveAction.enabled = !field.markedTextRange && ICSMValidatedPlayerName(field.text) != nil;
}
- (void)save {
    UITextField *field = self.alert.textFields.firstObject;
    NSString *name = ICSMValidatedPlayerName(field.text);
    if (!name || field.markedTextRange) return;
    [NSUserDefaults.standardUserDefaults setObject:name forKey:ICSMPlayerNamePreference];
    if (self.completion) self.completion(name.UTF8String);
    [field resignFirstResponder];
    fprintf(stderr, "ICSM_PLAYER_NAME saved=1 utf8_bytes=%lu\n", (unsigned long)[name lengthOfBytesUsingEncoding:NSUTF8StringEncoding]);
    playerNameEditor = nil;
}
- (BOOL)textFieldShouldReturn:(UITextField *)field {
    if (ICSMValidatedPlayerName(field.text) && !field.markedTextRange) {
        UIAlertController *alert = self.alert;
        [self save];
        [alert dismissViewControllerAnimated:YES completion:nil];
    }
    return NO;
}
@end
extern "C" void SourceTouchEditPlayerName(const char *current, void (*completion)(const char *)) {
    NSCAssert(NSThread.isMainThread, @"Player name UI belongs to the Source main thread");
    UIViewController *presenter = host.window.rootViewController;
    if (!presenter || presenter.presentedViewController || playerNameEditor || editing) return;
    SourceTouchCancelAll(now());
    ICSMPlayerNameEditor *editor = [ICSMPlayerNameEditor new];
    playerNameEditor = editor;editor.completion = completion;
    editor.alert = [UIAlertController alertControllerWithTitle:@"修改昵称" message:@"输入你的游戏昵称，保存后立即生效。" preferredStyle:UIAlertControllerStyleAlert];
    __weak ICSMPlayerNameEditor *weakEditor = editor;
    NSString *name = current ? [NSString stringWithUTF8String:current] : @"";
    [editor.alert addTextFieldWithConfigurationHandler:^(UITextField *field) {
        field.text = name;field.placeholder = @"输入昵称";
        field.accessibilityIdentifier = @"ICSMPlayerNameInput";
        field.autocorrectionType = UITextAutocorrectionTypeNo;
        field.autocapitalizationType = UITextAutocapitalizationTypeNone;
        field.returnKeyType = UIReturnKeyDone;field.enablesReturnKeyAutomatically = YES;
        field.delegate = weakEditor;
        [field addTarget:weakEditor action:@selector(textChanged:) forControlEvents:UIControlEventEditingChanged];
    }];
    [editor.alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *) {
        playerNameEditor = nil;
    }]];
    editor.saveAction = [UIAlertAction actionWithTitle:@"保存" style:UIAlertActionStyleDefault handler:^(UIAlertAction *) {
        [weakEditor save];
    }];
    [editor.alert addAction:editor.saveAction];
    [editor textChanged:editor.alert.textFields.firstObject];
    [presenter presentViewController:editor.alert animated:YES completion:^{
        UITextField *field = weakEditor.alert.textFields.firstObject;
        [field becomeFirstResponder];[field selectAll:nil];
        fprintf(stderr, "ICSM_PLAYER_NAME keyboard_requested=%d\n", field.isFirstResponder);
    }];
}
