//
//  DCFeatureList.h
//  WMall
//
//  Created by tom on 2018/11/21.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCFeatureList : NSObject

/* 类型名 */
@property (nonatomic, copy) NSString *infoName;
/* 额外价格 */
@property (nonatomic, copy) NSString *plusprice;
/* 是否点击 */
@property (nonatomic, assign) BOOL isSelect;

@end
