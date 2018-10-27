//
//  DCGridItem.h
//  WMall
//
//  Created by tom on 2018/10/6.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCGridItem : NSObject

/** 图片  */
@property (nonatomic, copy ,readonly) NSString *iconImage;
/** 文字  */
@property (nonatomic, copy ,readonly) NSString *gridTitle;

@end
