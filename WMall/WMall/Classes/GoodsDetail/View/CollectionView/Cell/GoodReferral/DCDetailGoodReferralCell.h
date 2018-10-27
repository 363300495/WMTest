//
//  DCDetailGoodReferralCell.h
//  WMall
//
//  Created by tom on 2018/10/17.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCDetailGoodReferralCell : UICollectionViewCell

/* 商品标题 */
@property (strong , nonatomic) UILabel *goodTitleLabel;
/* 商品价格 */
@property (strong , nonatomic) UILabel *goodPriceLabel;
/* 商品小标题 */
@property (strong , nonatomic) UILabel *goodSubtitleLabel;
/** 分享按钮点击回调 */
@property (nonatomic, copy) dispatch_block_t shareButtonClickBlock;

@end
