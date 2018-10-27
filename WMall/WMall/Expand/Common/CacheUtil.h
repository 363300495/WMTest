//
//  CacheUtil.h
//  WMall
//
//  Created by tom on 2018/10/5.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CacheUtil : NSObject

//获取缓存文件的大小
+ (float)readCacheSize;

//清除缓存
+ (void)clearFile;


@end
