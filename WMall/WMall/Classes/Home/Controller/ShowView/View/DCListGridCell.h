//
//  DCListGridCell.h
//  WMall
//
//  Created by tom on 2018/10/11.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DCYouLikeItem;

@interface DCListGridCell : UICollectionViewCell

@property (nonatomic, strong) DCYouLikeItem *youLikeItem;

@property(nonatomic,copy) dispatch_block_t colonClickBlock;

@end
