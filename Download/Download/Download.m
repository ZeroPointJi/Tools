//
//  Download.m
//  Download
//
//  Created by zero on 16/4/12.
//  Copyright © 2016年 zero. All rights reserved.
//

#import "Download.h"

@interface Download() <NSURLSessionDownloadDelegate>

@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSURLSessionDownloadTask *downloadTask;
@property (nonatomic, strong) NSData *reData; // 用来保存断点数据
@property (nonatomic, copy) NSString *urlPath; // 保存下载地址

@end

@implementation Download

- (instancetype)initWithUrl:(NSString *)urlPath
{
    if (self = [super init]) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:[NSOperationQueue mainQueue]];
        self.urlPath = urlPath;
        //self.downloadTask = [self.session downloadTaskWithURL:[NSURL URLWithString:urlPath]];
    }
    
    return self;
}

// 开始下载
- (void)start
{
    // 断点
    if (!self.downloadTask) {
        // 从文件中读取断点数据
        self.reData = [NSData dataWithContentsOfFile:[self createFilePath]];
        if (!self.reData) {
            self.downloadTask = [self.session downloadTaskWithURL:[NSURL URLWithString:self.urlPath]];
        } else {
            self.downloadTask = [self.session downloadTaskWithResumeData:self.reData];
        }
    }
    [_downloadTask resume];
}

// 暂停下载
- (void)pause
{
    // 暂停
    //[_downloadTask suspend];
    
    // 断点
    [self.downloadTask cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
        self.reData = resumeData; // 获取新的断点数据
        self.downloadTask = nil; // 将 task 置空, 因为再次开始时, 需要用新的断点数据来创建 task.
        
        // 将 reData 保存到本地, 防止用户退出应用, 内存数据被回收
        NSString *filePath = [self createFilePath];
        [self.reData writeToFile:filePath atomically:YES];
    }];
}

// 创建下载文件路径
// 1. 用来保存缓存数据 (下载中使用)
// 2. 用来保存最后下载完成的文件 (下载完成后, 会将保存的断点数据进行覆盖)
- (NSString *)createFilePath
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // 创建文件夹
    NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *movieDir = [caches stringByAppendingPathComponent:@"radio"];
    if (![fileManager fileExistsAtPath:movieDir]) {
        [fileManager createDirectoryAtPath:movieDir withIntermediateDirectories:YES attributes:nil error:nil];
    }
    // 创建文件路径
    //NSString *filePath = [movieDir stringByAppendingPathComponent:_downloadTask.response.suggestedFilename];
    
    // 在创建 task 时, 因为 task 还为空, 找不到建议的文件名
    NSArray *arr = [self.urlPath componentsSeparatedByString:@"/"];
    NSString *fileName = [arr lastObject];
    NSString *filePath = [movieDir stringByAppendingPathComponent:fileName];
    
    return filePath;
}

#pragma mark - 协议方法 -
// 当下载完成时被调用, 将缓存数据保存到Cache文件夹
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location
{
    NSString *filePath = [self createFilePath];
    
    // 先将缓存数据清空
    [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
    // 将文件移动到文件路径下
    [[NSFileManager defaultManager] moveItemAtPath:location.path toPath:filePath error:nil];
    NSLog(@"%@", filePath);
    
    // 下载完成后, 通过 block 将文件的网络地址和本地路径传出
    self.downloadFinish(self.urlPath, filePath);
}

// didwriteData 本次写入的字节数
// totalBytesWritten 总共写入的字节数
// totalBytesExpectedToWrite 下载的文件的总字节数
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
                                           didWriteData:(int64_t)bytesWritten
                                      totalBytesWritten:(int64_t)totalBytesWritten
                              totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    float progress = totalBytesWritten * 1.0 / totalBytesExpectedToWrite;
    self.downloading(progress);
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
                                      didResumeAtOffset:(int64_t)fileOffset
                                     expectedTotalBytes:(int64_t)expectedTotalBytes
{
    
}

// 请求完成时调用
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(nullable NSError *)error
{
    NSLog(@"error = %@", error);
}

@end