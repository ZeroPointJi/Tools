//
//  BackgourndDownload.m
//  Download
//
//  Created by zero on 4/13/16.
//  Copyright © 2016 zero. All rights reserved.
//

#import "BackgroundDownload.h"
#import "AppDelegate.h"

@interface BackgroundDownload () <NSURLSessionDownloadDelegate>

@end

@implementation BackgroundDownload

- (instancetype)initWithUrl:(NSString *)urlPath
{
    if (self = [super init]) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"123"];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
        NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:[NSURL URLWithString:urlPath]];
        [downloadTask resume];
    }
    
    return self;
}

#pragma mark - 代理方法 -

// 下载任务完成
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
                              didFinishDownloadingToURL:(NSURL *)location
{
    // 保存数据
    NSLog(@"下载任务完成");
}

//
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
                                           didWriteData:(int64_t)bytesWritten
                                      totalBytesWritten:(int64_t)totalBytesWritten
                              totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    // 监控下载进度
    float progress = totalBytesWritten * 1.0 / totalBytesExpectedToWrite;
    NSLog(@"进度: %f", progress);
}

// 请求完成
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task
                           didCompleteWithError:(nullable NSError *)error
{
    NSLog(@"error = %@", error);
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession *)session
{
    // 获取应用程序对象的代理对象
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    if (delegate.backgroundHandle) {
        void (^handle) () = delegate.backgroundHandle;
        delegate.backgroundHandle = nil;
        handle();
    }
    
    NSLog(@"后台任务结束");
}

@end
