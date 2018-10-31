//
//  DCFeatureChoseTopCell.h
//  WMall
//
//  Created by tom on 2018/10/31.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCFeatureChoseTopCell : UITableViewCell

/* 商品图标 */
@property (nonatomic, strong) UIImageView *goodsImageView;

/* 商品价格 */
@property (nonatomic, strong) UILabel *priceLabel;

/* 商品属性 */
@property (nonatomic, strong) UILabel *chooseAttLabel;

/* 取消点击回调 */
@property (nonatomic, copy) dispatch_block_t crossButtonClickBlock;

@end
