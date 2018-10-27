//
//  DCShoppingCarItem.h
//  WMall
//
//  Created by tom on 2018/10/9.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCShoppingCarItem : NSObject
/* 图片 */
@property(nonatomic,copy) NSString *pic;
/* 名字 */
@property(nonatomic,copy) NSString *title;
/* 类型 */
@property(nonatomic,copy) NSString *type;
/* 价格 */
@property(nonatomic,copy) NSString *price;

@end
