//
//  DCDetailLikeItemCell.h
//  WMall
//
//  Created by tom on 2018/10/19.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DCYouLikeItem;

@interface DCDetailLikeItemCell : UICollectionViewCell

/* 推荐数据 */
@property (nonatomic, strong) DCYouLikeItem *youLikeItem;

@end
