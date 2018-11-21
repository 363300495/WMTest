//
//  DCFeatureItemCell.h
//  WMall
//
//  Created by tom on 2018/11/21.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import <UIKit/UIKit.h>


@class DCFeatureList;
@interface DCFeatureItemCell : UICollectionViewCell

/* 内容数据 */
@property (nonatomic, strong) DCFeatureList *content;

@end
