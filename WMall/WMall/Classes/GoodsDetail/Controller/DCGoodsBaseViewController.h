//
//  DCGoodsBaseViewController.h
//  WMall
//
//  Created by tom on 2018/10/13.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCGoodsBaseViewController : UIViewController

/** 更改标题 */
@property (nonatomic , copy) void(^changeTitleBlock)(BOOL isChange);
/* 商品标题 */
@property (strong , nonatomic) NSString *goodTitle;
/* 商品价格 */
@property (strong , nonatomic) NSString *goodPrice;
/* 商品小标题 */
@property (strong , nonatomic) NSString *goodSubtitle;
/* 商品图片 */
@property (strong , nonatomic) NSString *goodImageView;
/* 商品轮播图 */
@property (strong , nonatomic) NSArray *shufflingArray;

@end
