//
//  DCPersonOneCell.h
//  WMall
//
//  Created by tom on 2018/10/24.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DCFlowItem;

@interface DCPersonOneCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *flowImageView;

@property (nonatomic, strong) UILabel *flowTextLabel;

@property (nonatomic, strong) DCFlowItem *flowItem;

@end
