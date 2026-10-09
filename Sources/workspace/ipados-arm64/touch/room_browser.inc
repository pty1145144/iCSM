#include "room_query.h"

static NSString *RoomText(const std::string &text) {
    return [[NSString alloc] initWithBytes:text.data() length:text.size() encoding:NSUTF8StringEncoding] ?: @"";
}
@interface ICSMRoomBrowser : UIViewController<UITableViewDelegate,UITableViewDataSource,NSNetServiceBrowserDelegate,NSNetServiceDelegate>
@property(nonatomic,strong) UISegmentedControl *tabs;
@property(nonatomic,strong) UILabel *status;
@property(nonatomic,strong) UITableView *table;
@property(nonatomic,strong) NSMutableArray<NSDictionary *> *rooms;
@property(nonatomic,strong) NSMutableSet<NSString *> *requested;
@property(nonatomic,strong) NSMutableArray<NSNetService *> *services;
@property(nonatomic,strong) NSNetServiceBrowser *bonjour;
@property(nonatomic,assign) NSUInteger generation;
@property(nonatomic,assign) NSUInteger pending;
@property(nonatomic,assign) BOOL active;
@property(nonatomic,assign) void (*completion)(const char *,const char *);
- (void)refresh;
@end
static __weak ICSMRoomBrowser *roomBrowser;
@implementation ICSMRoomBrowser
- (UIInterfaceOrientationMask)supportedInterfaceOrientations { return UIInterfaceOrientationMaskLandscape; }
- (NSString *)preference { return self.tabs.selectedSegmentIndex==0?@"ICSMRoomsLAN":@"ICSMRoomsInternet"; }
- (NSArray *)saved { return [NSUserDefaults.standardUserDefaults arrayForKey:self.preference] ?: @[]; }
- (void)viewDidLoad {
    [super viewDidLoad];self.active=YES;
    self.view.backgroundColor=[UIColor colorWithWhite:0.08 alpha:1];
    self.title=@"搜索房间";
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(close)];
    self.navigationItem.rightBarButtonItems=@[
        [[UIBarButtonItem alloc] initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:self action:@selector(refresh)],
        [[UIBarButtonItem alloc] initWithTitle:@"添加地址" style:UIBarButtonItemStylePlain target:self action:@selector(addAddress)]];
    self.tabs=[[UISegmentedControl alloc] initWithItems:@[@"局域网",@"互联网"]];
    self.tabs.accessibilityIdentifier=@"ICSMRoomTabs";self.tabs.selectedSegmentIndex=0;
    [self.tabs addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    self.status=[UILabel new];self.status.textColor=UIColor.lightGrayColor;
    self.status.font=[UIFont systemFontOfSize:15];self.status.numberOfLines=2;
    self.table=[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.table.backgroundColor=self.view.backgroundColor;self.table.delegate=self;self.table.dataSource=self;
    self.table.rowHeight=68;self.table.accessibilityIdentifier=@"ICSMRoomList";
    for(UIView *view in @[self.tabs,self.status,self.table]){view.translatesAutoresizingMaskIntoConstraints=NO;[self.view addSubview:view];}
    UILayoutGuide *safe=self.view.safeAreaLayoutGuide;
    [NSLayoutConstraint activateConstraints:@[
        [self.tabs.topAnchor constraintEqualToAnchor:safe.topAnchor constant:8],
        [self.tabs.centerXAnchor constraintEqualToAnchor:safe.centerXAnchor],
        [self.tabs.widthAnchor constraintEqualToConstant:320],
        [self.tabs.heightAnchor constraintEqualToConstant:36],
        [self.status.topAnchor constraintEqualToAnchor:self.tabs.bottomAnchor constant:8],
        [self.status.leadingAnchor constraintEqualToAnchor:safe.leadingAnchor constant:20],
        [self.status.trailingAnchor constraintEqualToAnchor:safe.trailingAnchor constant:-20],
        [self.status.heightAnchor constraintEqualToConstant:40],
        [self.table.topAnchor constraintEqualToAnchor:self.status.bottomAnchor constant:4],
        [self.table.leadingAnchor constraintEqualToAnchor:safe.leadingAnchor],
        [self.table.trailingAnchor constraintEqualToAnchor:safe.trailingAnchor],
        [self.table.bottomAnchor constraintEqualToAnchor:safe.bottomAnchor]]];
    [self refresh];
}
- (void)stopDiscovery {
    [self.bonjour stop];self.bonjour.delegate=nil;self.bonjour=nil;
    for(NSNetService *service in self.services){[service stop];service.delegate=nil;}
    self.services=nil;
}
- (void)close {
    self.active=NO;++self.generation;[self stopDiscovery];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)updateStatus {
    NSUInteger online=0;for(NSDictionary *room in self.rooms)online+=[room[@"online"] boolValue];
    if(self.tabs.selectedSegmentIndex==0)
        self.status.text=[NSString stringWithFormat:@"已找到 %lu 个房间%@。请连接同一 Wi-Fi；也可添加局域网地址。",(unsigned long)online,self.pending?@"，正在查询":@""];
    else
        self.status.text=[NSString stringWithFormat:@"已找到 %lu 个房间%@。添加服务器公网 IP 或域名后，可在这里刷新和加入。",(unsigned long)online,self.pending?@"，正在查询":@""];
}
- (void)refresh {
    ++self.generation;self.pending=0;[self stopDiscovery];
    self.rooms=[NSMutableArray new];self.requested=[NSMutableSet new];self.services=[NSMutableArray new];
    [self.table reloadData];[self updateStatus];
    for(NSString *endpoint in self.saved)if([endpoint isKindOfClass:NSString.class])[self query:endpoint];
    if(self.tabs.selectedSegmentIndex==0) {
        self.bonjour=[NSNetServiceBrowser new];self.bonjour.delegate=self;
        [self.bonjour searchForServicesOfType:@"_icsm._udp." inDomain:@"local."];
    }
    fprintf(stderr,"ICSM_ROOM_SEARCH tab=%ld generation=%lu\n",(long)self.tabs.selectedSegmentIndex,(unsigned long)self.generation);
}
- (void)query:(NSString *)endpoint {
    if(!self.active || [self.requested containsObject:endpoint] || self.requested.count>=64)return;
    [self.requested addObject:endpoint];++self.pending;[self updateStatus];
    const NSUInteger generation=self.generation;
    const NSInteger tab=self.tabs.selectedSegmentIndex;
    __weak ICSMRoomBrowser *weakSelf=self;
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_UTILITY,0),^{
        ICSMRooms::Info info=ICSMRooms::Query(endpoint.UTF8String);
        NSDictionary *row=@{@"endpoint":RoomText(info.endpoint),@"saved":endpoint,@"name":RoomText(info.name),@"map":RoomText(info.map),
            @"players":@(info.players),@"maximum":@(info.maximum),@"bots":@(info.bots),@"ping":@(info.ping),@"password":@(info.password),@"online":@(info.online)};
        dispatch_async(dispatch_get_main_queue(),^{
            ICSMRoomBrowser *browser=weakSelf;if(!browser || !browser.active || browser.generation!=generation)return;
            --browser.pending;
            BOOL duplicate=NO;for(NSDictionary *other in browser.rooms)if([other[@"endpoint"] isEqual:row[@"endpoint"]])duplicate=YES;
            if(!duplicate)[browser.rooms addObject:row];
            [browser.table reloadData];[browser updateStatus];
            fprintf(stderr,"ICSM_ROOM_RESULT tab=%ld online=%d endpoint=%s map=%s players=%d maximum=%d ping=%d\n",(long)tab,info.online,info.endpoint.c_str(),info.map.c_str(),info.players,info.maximum,info.ping);
        });
    });
}
- (void)netServiceBrowser:(NSNetServiceBrowser *)browser didFindService:(NSNetService *)service moreComing:(BOOL)more {
    if(browser!=self.bonjour)return;
    [self.services addObject:service];service.delegate=self;[service resolveWithTimeout:4];
}
- (void)netServiceDidResolveAddress:(NSNetService *)service {
    if(!self.active || ![self.services containsObject:service] || service.port<1 || service.port>65535)return;
    for(NSData *address in service.addresses) {
        if(address.length<sizeof(sockaddr_in))continue;
        const sockaddr_in *ip=(const sockaddr_in*)address.bytes;if(ip->sin_family!=AF_INET)continue;
        char hostAddress[INET_ADDRSTRLEN];inet_ntop(AF_INET,&ip->sin_addr,hostAddress,sizeof(hostAddress));
        [self query:[NSString stringWithFormat:@"%s:%ld",hostAddress,(long)service.port]];
    }
}
- (void)netServiceBrowser:(NSNetServiceBrowser *)browser didNotSearch:(NSDictionary *)error {
    if(browser!=self.bonjour)return;
    self.status.text=@"无法搜索局域网。请检查 iCSM 的本地网络权限，也可添加地址。";
    fprintf(stderr,"ICSM_ROOM_BONJOUR_ERROR code=%ld\n",(long)[error[NSNetServicesErrorCode] integerValue]);
}
- (void)addAddress {
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"添加房间" message:@"输入 IP 或域名；端口默认 27015，例如 192.168.1.20:27015。" preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *field){
        field.placeholder=@"服务器地址:端口";field.autocorrectionType=UITextAutocorrectionTypeNo;
        field.autocapitalizationType=UITextAutocapitalizationTypeNone;field.keyboardType=UIKeyboardTypeURL;
        field.accessibilityIdentifier=@"ICSMRoomAddressInput";
    }];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    __weak ICSMRoomBrowser *weakSelf=self;
    __weak UIAlertController *weakAlert=alert;
    [alert addAction:[UIAlertAction actionWithTitle:@"添加" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        NSString *input=[weakAlert.textFields.firstObject.text stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
        std::string name;uint16_t port;
        if(!ICSMRooms::Endpoint(input.UTF8String?:"",name,port)) {
            weakSelf.status.text=@"地址格式无效，请输入 IPv4 或域名，以及 1–65535 的端口。";return;
        }
        NSString *endpoint=[NSString stringWithFormat:@"%s:%u",name.c_str(),port];
        NSMutableArray *saved=[weakSelf.saved mutableCopy];
        if(![saved containsObject:endpoint]){if(saved.count>=32)[saved removeObjectAtIndex:0];[saved addObject:endpoint];}
        [NSUserDefaults.standardUserDefaults setObject:saved forKey:weakSelf.preference];
        [weakSelf refresh];
    }]];
    [self presentViewController:alert animated:YES completion:^{[alert.textFields.firstObject becomeFirstResponder];}];
}
- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section { return self.rooms.count; }
- (UITableViewCell *)tableView:(UITableView *)table cellForRowAtIndexPath:(NSIndexPath *)index {
    UITableViewCell *cell=[table dequeueReusableCellWithIdentifier:@"room"];
    if(!cell)cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"room"];
    NSDictionary *row=self.rooms[index.row];BOOL online=[row[@"online"] boolValue];
    cell.backgroundColor=self.view.backgroundColor;cell.textLabel.textColor=online?UIColor.whiteColor:UIColor.grayColor;
    cell.detailTextLabel.textColor=UIColor.lightGrayColor;cell.textLabel.font=[UIFont systemFontOfSize:20 weight:UIFontWeightSemibold];
    cell.detailTextLabel.font=[UIFont systemFontOfSize:15];
    cell.textLabel.text=online?[NSString stringWithFormat:@"%@%@",[row[@"password"] boolValue]?@"🔒 ":@"",row[@"name"]]:row[@"endpoint"];
    cell.detailTextLabel.text=online?[NSString stringWithFormat:@"%@  ·  %@/%@ 人  ·  %@ ms  ·  %@",row[@"map"],row[@"players"],row[@"maximum"],row[@"ping"],row[@"endpoint"]]:@"暂未收到响应，请检查地址或刷新。";
    cell.accessoryType=online?UITableViewCellAccessoryDisclosureIndicator:UITableViewCellAccessoryNone;
    cell.accessibilityIdentifier=[@"ICSMRoom-" stringByAppendingString:row[@"endpoint"]];return cell;
}
- (void)join:(NSDictionary *)room password:(NSString *)password {
    if(!self.completion)return;
    NSString *endpoint=room[@"endpoint"];void (*completion)(const char *,const char *)=self.completion;
    self.active=NO;++self.generation;[self stopDiscovery];
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        fprintf(stderr,"ICSM_ROOM_JOIN endpoint=%s\n",endpoint.UTF8String);
        completion(endpoint.UTF8String,password.UTF8String);
    }];
}
- (void)tableView:(UITableView *)table didSelectRowAtIndexPath:(NSIndexPath *)index {
    [table deselectRowAtIndexPath:index animated:YES];NSDictionary *room=self.rooms[index.row];
    if(![room[@"online"] boolValue])return;
    if(![room[@"password"] boolValue]){[self join:room password:@""];return;}
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"输入房间密码" message:room[@"name"] preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *field){field.placeholder=@"房间密码";field.secureTextEntry=YES;field.accessibilityIdentifier=@"ICSMRoomPasswordInput";}];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    __weak ICSMRoomBrowser *weakSelf=self;
    __weak UIAlertController *weakAlert=alert;
    [alert addAction:[UIAlertAction actionWithTitle:@"加入" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){[weakSelf join:room password:weakAlert.textFields.firstObject.text?:@""];}]];
    [self presentViewController:alert animated:YES completion:^{[alert.textFields.firstObject becomeFirstResponder];}];
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)table editingStyleForRowAtIndexPath:(NSIndexPath *)index {
    return [self.saved containsObject:self.rooms[index.row][@"saved"]]?UITableViewCellEditingStyleDelete:UITableViewCellEditingStyleNone;
}
- (void)tableView:(UITableView *)table commitEditingStyle:(UITableViewCellEditingStyle)style forRowAtIndexPath:(NSIndexPath *)index {
    NSMutableArray *saved=[self.saved mutableCopy];[saved removeObject:self.rooms[index.row][@"saved"]];
    [NSUserDefaults.standardUserDefaults setObject:saved forKey:self.preference];[self refresh];
}
@end
extern "C" void SourceTouchOpenRoomBrowser(void (*completion)(const char *,const char *)) {
    NSCAssert(NSThread.isMainThread,@"Room browser belongs to the Source main thread");
    UIViewController *presenter=host.window.rootViewController;
    if(!presenter || presenter.presentedViewController || editing)return;
    SourceTouchCancelAll(now());
    ICSMRoomBrowser *browser=[ICSMRoomBrowser new];browser.completion=completion;roomBrowser=browser;
    UINavigationController *navigation=[[UINavigationController alloc] initWithRootViewController:browser];
    navigation.overrideUserInterfaceStyle=UIUserInterfaceStyleDark;navigation.modalPresentationStyle=UIModalPresentationOverFullScreen;
    navigation.navigationBar.tintColor=UIColor.whiteColor;
    [presenter presentViewController:navigation animated:YES completion:nil];
}
