//
//  ViewController.m
//  Download
//
//  Created by zero on 16/4/12.
//  Copyright © 2016年 zero. All rights reserved.
//

#import "ViewController.h"
#import "Download.h"
#import "DownloadManager.h"
#import "BackgroundDownload.h"

#define kIMGURLSTRING @"http://120.25.226.186:32812/resources/videos/minion_01.mp4"

@interface ViewController () <NSURLSessionDelegate>

@property (nonatomic, strong) NSMutableData *requestData;

@property (nonatomic, strong) Download *download;

@property (weak, nonatomic) IBOutlet UILabel *progressLabel; // 显示进度

@end

@implementation ViewController

- (NSMutableData *)requestData
{
    if (!_requestData) {
        self.requestData = [NSMutableData data];
    }
    return _requestData;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 数据请求完成图片下载
    /*
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURL *imgUrl = [NSURL URLWithString:kIMGURLSTRING];
    NSURLSessionTask *task = [session dataTaskWithURL:imgUrl];
    [task resume];
     */
    
    // 使用 downloadTask 下载
    /*
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    NSURL *url = [NSURL URLWithString:kIMGURLSTRING];
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // 系统完成的数据在沙盒中的缓存路径
        NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        // 创建文件夹
        NSString *cachesDir = [caches stringByAppendingPathComponent:@"img"];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager createDirectoryAtPath:cachesDir withIntermediateDirectories:YES attributes:nil error:nil];
        // 图片路径
        NSString *imgName = response.suggestedFilename; // 建议的图片名字
        NSString *imgPath = [cachesDir stringByAppendingPathComponent:imgName];
        [fileManager moveItemAtPath:location.path toPath:imgPath error:nil];
        
        // 刷新 UI
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
            NSData *data = [NSData dataWithContentsOfFile:imgPath];
            imageView.image = [UIImage imageWithData:data];
            [self.view addSubview:imageView];
        });
    }];
    [downloadTask resume];
     */
    
    /*
    __block UILabel *label = _progressLabel;
    self.download = [[Download alloc] initWithUrl:kIMGURLSTRING];
    self.download.downloading = ^(float progress) {
        label.text = [NSString stringWithFormat:@"%.2f%%", progress * 100];
    };
     */
    
    // 通过下载管理器来创建下载对象
    self.download = [[DownloadManager defaultManager] addDownloadWithUrl:kIMGURLSTRING];
    // 定义下载中 block 对象
    __block UILabel *label = self.progressLabel;
    self.download.downloading = ^(float progress) {
        label.text = [NSString stringWithFormat:@"%f", progress];
    };
    // 定义下载完成 block 对象
    self.download.downloadFinish = ^(NSString *url, NSString *savePath) {
        // 移除完成的下载对象
        [[DownloadManager defaultManager] removeDownloadWithUrl:url];
        // UI 层操作
        // 对本地路径进行保存
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)start:(UIButton *)sender {
    [self.download start];
}

- (IBAction)pause:(UIButton *)sender {
    [self.download pause];
}

- (IBAction)backgroundDownload:(id)sender {
    BackgroundDownload *backDownload = [[BackgroundDownload alloc] initWithUrl:kIMGURLSTRING];
}

/*
#pragma mark - NSURL Session Delegate -
// 接收响应
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition disposition))completionHandler
{
    NSLog(@"正在接收响应");
    // 告诉服务器持续加载
    completionHandler(NSURLSessionResponseAllow);
}

// 接收数据
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    NSLog(@"正在接收数据");
    // 拼接请求到的数据
    [self.requestData appendData:data];
}

// 请求完成方法, 当错误或者请求结束都会执行方法. error 如果为空则表示请求成功, 有错误信息则表示请求失败.
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(nullable NSError *)error
{
    NSLog(@"error = %@", error);
    if (!error) {
        // 刷新 UI 一定要在主线程中
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
            imageView.image = [UIImage imageWithData:self.requestData];
            [self.view addSubview:imageView];
        });
        // 写入沙盒
        NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        // 创建图片文件夹
        NSString *imgDir = [caches stringByAppendingPathComponent:@"downloadImg"];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        // 判断文件夹路径
        if (![fileManager fileExistsAtPath:imgDir]) {
            [fileManager createDirectoryAtPath:imgDir withIntermediateDirectories:YES attributes:nil error:nil];
        }
        // 创建文件路径
        NSArray *arr = [kIMGURLSTRING componentsSeparatedByString:@"/"];
        NSString *imgName = [arr lastObject];
        NSString *imgPath = [imgDir stringByAppendingPathComponent:imgName];
        NSLog(@"%@", imgPath);
        // 写入图片文件
        [self.requestData writeToFile:imgPath atomically:YES];
    }
}
 */

@end
