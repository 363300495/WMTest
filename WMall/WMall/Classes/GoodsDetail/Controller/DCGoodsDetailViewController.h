//
//  GoodsDetailViewController.h
//  WMall
//
//  Created by tom on 2018/10/12.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "BaseViewController.h"

@interface DCGoodsDetailViewController : BaseViewController

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
