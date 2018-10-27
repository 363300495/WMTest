//
//  CacheUtil.m
//  WMall
//
//  Created by tom on 2018/10/5.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "CacheUtil.h"


@implementation CacheUtil

//计算整个目录大小
+ (float)readCacheSize{
	NSString *folderPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
	
	NSFileManager * manager = [NSFileManager defaultManager];
	if (![manager fileExistsAtPath :folderPath]) {
		return 0 ;
	}
	NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator ];
	NSString * fileName;
	long long folderSize = 0 ;
	while ((fileName = [childFilesEnumerator nextObject ]) != nil ){
		
		NSString * fileAbsolutePath = [folderPath stringByAppendingPathComponent :fileName];
		folderSize += [self fileSizeAtPath :fileAbsolutePath];
	}
	return folderSize/( 1024.0 * 1024.0 );
}

//计算单个文件的大小
+ (long long)fileSizeAtPath:(NSString *)filePath{
	
	NSFileManager *manager = [NSFileManager defaultManager];
	
	if ([manager fileExistsAtPath :filePath]){
		
		return [[manager attributesOfItemAtPath :filePath error : nil ] fileSize];
	}
	return 0 ;
}

//清除缓存
+ (void)clearFile{
	
	//文件路径
	NSString *directoryPath=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
	
	NSArray *subpaths = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:directoryPath error:nil];
	
	for (NSString *subPath in subpaths) {
		
		NSString *filePath = [directoryPath stringByAppendingPathComponent:subPath];
		[[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
	}
}

@end
