#import "data_install.h"
#import <CommonCrypto/CommonDigest.h>
#import <Metal/Metal.h>
#include "../../vendor/minizip-1.3.1/unzip.h"
#include <sys/stat.h>
#include <unistd.h>
#include <vector>
#include <set>
#include <map>
#include <string>

static BOOL fail(NSError *__strong *error, NSString *message) {
    if(error)*error=[NSError errorWithDomain:@"iCSM.Data" code:1
                                  userInfo:@{NSLocalizedDescriptionKey:message}];
    return NO;
}
static NSString *hexDigest(const unsigned char *digest) {
    NSMutableString *hex=[NSMutableString string];
    for(unsigned i=0;i<32;++i)[hex appendFormat:@"%02x",digest[i]];
    return hex;
}
static BOOL safeName(NSString *name) {
    if(!name.length || [name hasPrefix:@"/"] || [name containsString:@"\\"] ||
       [name containsString:@":"] || [name rangeOfCharacterFromSet:[NSCharacterSet characterSetWithRange:NSMakeRange(0,1)]].location!=NSNotFound)return NO;
    for(NSString *part in [name componentsSeparatedByString:@"/"])
        if(!part.length || [part isEqual:@".."] || [part isEqual:@"."])return NO;
    return YES;
}
// Never follow links placed in the File Sharing directory by another app.
static BOOL safeParents(NSString *base, NSString *relative, NSError *__strong *error) {
    NSString *path=base;
    NSArray *parts=[relative componentsSeparatedByString:@"/"];
    for(NSUInteger i=0;i<parts.count;++i) {
        path=[path stringByAppendingPathComponent:parts[i]];
        struct stat s={};
        if(lstat(path.fileSystemRepresentation,&s)==0) {
            if(S_ISLNK(s.st_mode) || (i+1<parts.count && !S_ISDIR(s.st_mode)))
                return fail(error,@"数据目录包含符号链接或无效目录，请重新导入数据包。");
        }else if(errno!=ENOENT)return fail(error,@"无法读取数据目录。");
    }
    return YES;
}
static NSDictionary *stamp(NSString *path) {
    struct stat s={};
    if(lstat(path.fileSystemRepresentation,&s)!=0 || !S_ISREG(s.st_mode))return nil;
    return @{@"size":@(s.st_size),@"inode":@(s.st_ino),
             @"mtime_s":@(s.st_mtimespec.tv_sec),@"mtime_ns":@(s.st_mtimespec.tv_nsec)};
}
static NSString *targetPath(NSString *name,NSString *documents,NSString *cache) {
    if([name hasPrefix:@"shader-cache/"])
        return [[documents stringByAppendingPathComponent:@"game-assets/icsm-shaders"] stringByAppendingPathComponent:[name substringFromIndex:13]];
    return [documents stringByAppendingPathComponent:name];
}
static NSString *storageName(NSString *name) {
    return [name hasPrefix:@"shader-cache/"]?[@"game-assets/icsm-shaders/" stringByAppendingString:[name substringFromIndex:13]]:name;
}
static BOOL writeJSON(id value,NSString *path,NSError *__strong *error) {
    NSError *local=nil;
    NSData *data=[NSJSONSerialization dataWithJSONObject:value options:0 error:&local];
    BOOL ok=data && [data writeToFile:path options:NSDataWritingAtomic error:&local];
    if(!ok && error)*error=local;return ok;
}
static NSString *hashFile(NSString *path,ICSMInstallProgress progress,
                          double start,double span,unsigned long long size) {
    FILE *file=fopen(path.fileSystemRepresentation,"rb");if(!file)return nil;
    CC_SHA256_CTX ctx;CC_SHA256_Init(&ctx);
    std::vector<unsigned char> buffer(1024*1024);unsigned long long read=0;
    size_t count;while((count=fread(buffer.data(),1,buffer.size(),file))) {
        CC_SHA256_Update(&ctx,buffer.data(),(CC_LONG)count);read+=count;
        if(progress)progress(@"校验游戏资源",start+span*double(read)/double(size?:1));
    }
    BOOL ok=!ferror(file);fclose(file);unsigned char digest[32];CC_SHA256_Final(digest,&ctx);
    return ok && read==size?hexDigest(digest):nil;
}
NSDictionary *ICSMDistributionManifest(void) {
    NSString *path=[NSBundle.mainBundle pathForResource:@"distribution-assets" ofType:@"json"];
    NSData *data=path?[NSData dataWithContentsOfFile:path]:nil;
    return data?[NSJSONSerialization JSONObjectWithData:data options:0 error:nil]:nil;
}

BOOL ICSMPrepareInstallation(NSString *documents,NSString *cache,NSDictionary *manifest,
                            NSString *receiptPath,ICSMInstallProgress progress,NSError *__strong *error) {
    NSFileManager *fm=NSFileManager.defaultManager;
    if(![manifest[@"version"] isEqual:@1] || ![manifest[@"files"] isKindOfClass:NSArray.class] ||
       ![manifest[@"identity"] isKindOfClass:NSString.class])return fail(error,@"应用数据清单无效，请重新编译应用。");
    NSMutableDictionary *expected=[NSMutableDictionary dictionary];
    unsigned long long total=0;
    for(NSDictionary *entry in manifest[@"files"]) {
        NSString *name=entry[@"path"];
        if(![name isKindOfClass:NSString.class] || !safeName(name) || expected[name] ||
           (![name hasPrefix:@"game-assets/"] && ![name hasPrefix:@"shader-cache/"]) ||
           ![entry[@"sha256"] isKindOfClass:NSString.class] || [entry[@"sha256"] length]!=64 ||
           ![entry[@"size"] isKindOfClass:NSNumber.class])return fail(error,@"应用数据清单格式错误。");
        expected[name]=entry;total+=[entry[@"size"] unsignedLongLongValue];
    }
    if(!expected.count)return fail(error,@"应用数据清单为空。");
    [fm createDirectoryAtPath:documents withIntermediateDirectories:YES attributes:nil error:nil];
    [fm createDirectoryAtPath:cache withIntermediateDirectories:YES attributes:nil error:nil];
    [fm createDirectoryAtPath:receiptPath.stringByDeletingLastPathComponent withIntermediateDirectories:YES attributes:nil error:nil];
    NSData *old=[NSData dataWithContentsOfFile:receiptPath];
    NSDictionary *decoded=old?[NSJSONSerialization JSONObjectWithData:old options:0 error:nil]:nil;
    NSMutableDictionary *receipts=([decoded[@"identity"] isEqual:manifest[@"identity"]] &&
        [decoded[@"files"] isKindOfClass:NSDictionary.class])?[decoded[@"files"] mutableCopy]:[NSMutableDictionary dictionary];
    NSMutableDictionary *record=[@{@"identity":manifest[@"identity"],@"files":receipts} mutableCopy];
    NSString *archivePath=[documents stringByAppendingPathComponent:@"iCSM-Data.zip"];
    unzFile zip=nullptr;
    std::map<std::string,unz64_file_pos> positions;
    if([fm fileExistsAtPath:archivePath]) {
        if(!safeParents(documents,@"iCSM-Data.zip",error))return NO;
        zip=unzOpen64(archivePath.fileSystemRepresentation);
        if(!zip)return fail(error,@"数据包尚未复制完成或已损坏。请完成复制后点击“检查并导入”。");
        // Validate the complete central directory before modifying any asset.
        std::set<std::string> names;
        int status=unzGoToFirstFile(zip);
        while(status==UNZ_OK) {
            unz_file_info64 info={};
            if(unzGetCurrentFileInfo64(zip,&info,nullptr,0,nullptr,0,nullptr,0)!=UNZ_OK ||
               info.size_filename>4096 || !info.size_filename)break;
            std::vector<char> filename(info.size_filename+1,0);
            if(unzGetCurrentFileInfo64(zip,&info,filename.data(),(uLong)filename.size(),nullptr,0,nullptr,0)!=UNZ_OK)break;
            NSString *name=[[NSString alloc] initWithBytes:filename.data() length:info.size_filename encoding:NSUTF8StringEncoding];
            NSDictionary *entry=name?expected[name]:nil;
            unsigned mode=(unsigned)(info.external_fa>>16);
            if(!name || !safeName(name) || strlen(filename.data())!=info.size_filename || !entry ||
               !names.insert(std::string(filename.data())).second ||
               info.uncompressed_size!=[entry[@"size"] unsignedLongLongValue] ||
               (info.flag&1) || (info.compression_method!=0 && info.compression_method!=8) ||
               ((mode&S_IFMT)!=0 && (mode&S_IFMT)!=S_IFREG))break;
            unz64_file_pos position={};
            if(unzGetFilePos64(zip,&position)!=UNZ_OK)break;
            positions[filename.data()]=position;
            status=unzGoToNextFile(zip);
        }
        if(status!=UNZ_END_OF_LIST_OF_FILE || names.size()!=expected.count) {
            unzClose(zip);return fail(error,@"数据包与当前应用不匹配、未复制完成，或包含无效路径。请使用配套的 iCSM-Data.zip。");
        }
    }
    NSMutableArray *missing=[NSMutableArray array];unsigned long long done=0,required=0;
    for(NSString *name in [[expected allKeys] sortedArrayUsingSelector:@selector(compare:)]) {
        @autoreleasepool {
            NSDictionary *entry=expected[name];NSString *path=targetPath(name,documents,cache);
            if(!safeParents(documents,storageName(name),error)){if(zip)unzClose(zip);return NO;}
            NSDictionary *current=stamp(path),*receipt=receipts[name];
            BOOL valid=current && [current[@"size"] isEqual:entry[@"size"]] &&
                [receipt[@"sha256"] isEqual:entry[@"sha256"]] && [receipt[@"stamp"] isEqual:current];
            // Existing installations migrate once, without changing user saves.
            if(!valid && current && [current[@"size"] isEqual:entry[@"size"]]) {
                NSString *digest=hashFile(path,progress,double(done)/double(total),double([entry[@"size"] unsignedLongLongValue])/double(total),[entry[@"size"] unsignedLongLongValue]);
                valid=[digest isEqual:entry[@"sha256"]];
                if(valid)receipts[name]=@{@"sha256":entry[@"sha256"],@"stamp":stamp(path)};
            }
            if(!valid){[missing addObject:name];required+=[entry[@"size"] unsignedLongLongValue];}
            done+=[entry[@"size"] unsignedLongLongValue];
        }
    }
    // Persist migration and per-file success even if a subsequent import fails.
    if(!writeJSON(record,receiptPath,error)){if(zip)unzClose(zip);return NO;}
    if(missing.count && !zip)return fail(error,[NSString stringWithFormat:@"请导入配套数据包 iCSM-Data.zip（缺少 %lu 个文件）。\nMac：Finder → 设备 → 文件 → iCSM\nWindows：Apple Devices → 文件 → iCSM → 添加文件\n复制完成后点击“检查并导入”。",(unsigned long)missing.count]);
    if(missing.count) {
        NSDictionary *disk=[fm attributesOfFileSystemForPath:documents error:nil];
        if([disk[NSFileSystemFreeSize] unsignedLongLongValue]<required+512ULL*1024*1024) {
            unzClose(zip);return fail(error,[NSString stringWithFormat:@"剩余空间不足，解包还需要约 %.1f GB。",double(required)/1e9+0.5]);
        }
        for(NSString *name in missing)[receipts removeObjectForKey:name];
        if(!writeJSON(record,receiptPath,error)){unzClose(zip);return NO;}
        std::vector<unsigned char> buffer(1024*1024);unsigned long long imported=0;unsigned uncommitted=0;
        for(NSString *name in missing) {
            @autoreleasepool {
                NSDictionary *entry=expected[name];NSString *path=targetPath(name,documents,cache);
                NSString *temporary=[path stringByAppendingString:@".icsm-partial"];
                NSError *local=nil;
                if(!safeParents(documents,[storageName(name) stringByAppendingString:@".icsm-partial"],error)){unzClose(zip);return NO;}
                if(![fm createDirectoryAtPath:path.stringByDeletingLastPathComponent withIntermediateDirectories:YES attributes:nil error:&local]){if(error)*error=local;unzClose(zip);return NO;}
                auto position=positions.find(name.UTF8String);
                if(position==positions.end() || unzGoToFilePos64(zip,&position->second)!=UNZ_OK || unzOpenCurrentFile(zip)!=UNZ_OK){unzClose(zip);return fail(error,@"无法读取数据包，请重新复制。");}
                FILE *out=fopen(temporary.fileSystemRepresentation,"wb");
                if(!out){unzCloseCurrentFile(zip);unzClose(zip);return fail(error,@"无法写入游戏数据，请检查剩余空间。");}
                CC_SHA256_CTX ctx;CC_SHA256_Init(&ctx);unsigned long long written=0;int n;
                BOOL ok=YES;
                while((n=unzReadCurrentFile(zip,buffer.data(),(unsigned)buffer.size()))>0) {
                    written+=(unsigned)n;
                    if(written>[entry[@"size"] unsignedLongLongValue] || fwrite(buffer.data(),1,(size_t)n,out)!=(size_t)n){ok=NO;break;}
                    CC_SHA256_Update(&ctx,buffer.data(),(CC_LONG)n);
                    if(progress)progress(@"正在导入游戏资源",double(imported+written)/double(required));
                }
                if(n<0 || fflush(out)!=0 || fsync(fileno(out))!=0)ok=NO;
                if(fclose(out)!=0)ok=NO;
                if(unzCloseCurrentFile(zip)!=UNZ_OK)ok=NO;
                unsigned char digest[32];CC_SHA256_Final(digest,&ctx);
                if(!ok || written!=[entry[@"size"] unsignedLongLongValue] || ![hexDigest(digest) isEqual:entry[@"sha256"]]) {
                    [fm removeItemAtPath:temporary error:nil];unzClose(zip);
                    return fail(error,@"数据包校验失败或写入被中断。请重新复制后重试；已完成的文件会保留。");
                }
                if(rename(temporary.fileSystemRepresentation,path.fileSystemRepresentation)!=0){unzClose(zip);return fail(error,@"无法完成数据文件安装。");}
                receipts[name]=@{@"sha256":entry[@"sha256"],@"stamp":stamp(path)};
                // A crash between commits only rehashes at most 32 completed files.
                if(++uncommitted>=32 || written>=64ULL*1024*1024) {
                    if(!writeJSON(record,receiptPath,error)){unzClose(zip);return NO;}
                    uncommitted=0;
                }
                imported+=written;
            }
        }
    }
    if(zip)unzClose(zip);
    // Generic iOS metallibs are portable; PSO archives stay device-specific.
    // Load each library on this device once, release it immediately, and let
    // the renderer create/record actual pipeline permutations when requested.
    id<MTLDevice> device=MTLCreateSystemDefaultDevice();
    if(!device)return fail(error,@"当前设备无法创建 Metal 设备。");
    NSString *deviceKey=[NSString stringWithFormat:@"%@/%@/%llu",manifest[@"identity"],NSProcessInfo.processInfo.operatingSystemVersionString,(unsigned long long)device.registryID];
    NSMutableArray *shaders=[NSMutableArray array];
    for(NSString *name in expected)if([name hasPrefix:@"shader-cache/"])[shaders addObject:name];
    BOOL restoredCache=NO;
    for(NSString *name in shaders) {
        NSString *filename=[name substringFromIndex:13],*cached=[cache stringByAppendingPathComponent:filename];
        if(!safeParents(cache,filename,error))return NO;
        if(![fm fileExistsAtPath:cached]) {
            NSString *partial=[cached stringByAppendingString:@".icsm-partial"];
            if(!safeParents(cache,[filename stringByAppendingString:@".icsm-partial"],error))return NO;
            [fm removeItemAtPath:partial error:nil];
            NSError *local=nil;
            if(![fm copyItemAtPath:targetPath(name,documents,cache) toPath:partial error:&local]){if(error)*error=local;return NO;}
            if(rename(partial.fileSystemRepresentation,cached.fileSystemRepresentation)!=0)return fail(error,@"无法恢复着色器缓存。");
            restoredCache=YES;
        }
    }
    if(![decoded[@"shader_device"] isEqual:deviceKey] || missing.count || restoredCache) {
        NSUInteger count=0;
        for(NSString *name in [shaders sortedArrayUsingSelector:@selector(compare:)]) {
            @autoreleasepool {
                NSString *path=targetPath(name,documents,cache);
                NSData *data=[NSData dataWithContentsOfFile:path];
                if(!data)return fail(error,@"离线着色器文件缺失，请重新导入数据包。");
                // Close file before handing owned data to Metal (no open-FD accumulation).
                dispatch_data_t bytes=dispatch_data_create(data.bytes,data.length,nullptr,^{(void)data;});
                NSError *metalError=nil;id<MTLLibrary> library=[device newLibraryWithData:bytes error:&metalError];
                if(!library || !library.functionNames.count)return fail(error,[NSString stringWithFormat:@"着色器无法在当前系统加载：%@",metalError.localizedDescription?:name]);
                if(progress)progress(@"首次准备 Metal 着色器",double(++count)/double(shaders.count));
            }
        }
    }
    record[@"shader_device"]=deviceKey;record[@"ready"]=@YES;
    if(!writeJSON(record,receiptPath,error))return NO;
    [@[documents,[documents stringByAppendingPathComponent:@"game-assets"]] enumerateObjectsUsingBlock:^(NSString *path,NSUInteger index,BOOL *stop){
        if(index)[[NSURL fileURLWithPath:path] setResourceValue:@YES forKey:NSURLIsExcludedFromBackupKey error:nil];
    }];
    // Only remove the exact archive after every hash and Metal load succeeded.
    if([fm fileExistsAtPath:archivePath])[fm removeItemAtPath:archivePath error:nil];
    if(progress)progress(@"正在启动游戏",1);
    return YES;
}
