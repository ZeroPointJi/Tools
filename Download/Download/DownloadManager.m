//
//  DownloadManager.m
//  Download
//
//  Created by zero on 16/4/12.
//  Copyright © 2016年 zero. All rights reserved.
//

#import "DownloadManager.h"

@interface DownloadManager ()

@property (nonatomic, strong) NSMutableDictionary *downloadDic; // 用来保存下载对象

@end

@implementation DownloadManager

- (NSMutableDictionary *)downloadDic
{
    if (!_downloadDic) {
        self.downloadDic = [NSMutableDictionary dictionary];
    }
    return _downloadDic;
}

+ (instancetype)defaultManager
{
    static DownloadManager *downloadManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        downloadManager = [[DownloadManager alloc] init];
    });
    
    return downloadManager;
}

- (Download *)addDownloadWithUrl:(NSString *)url
{
    // 根据地质查找字典中的下载对象, 如果不存在要创建新的对象
    Download *download = self.downloadDic[url];
    if (!download) {
        download = [[Download alloc] initWithUrl:url];
        [self.downloadDic setObject:download forKey:url];
    }
    return download;
}

- (void)removeDownloadWithUrl:(NSString *)url
{
    [self.downloadDic removeObjectForKey:url];
}

- (NSArray *)getAllDownloads
{
    NSMutableArray *arr = [NSMutableArray array];
    // 遍历字典中的所有下载对象, 放到数组中
    for (NSString *url in self.downloadDic) {
        [arr addObject:self.downloadDic[url]];
    }
    return arr;
}

@end
