//
//  DCFeatureHeaderView.h
//  WMall
//
//  Created by tom on 2018/11/21.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DCFeatureTitleItem;
@interface DCFeatureHeaderView : UICollectionReusableView

/* 标题数据 */
@property (nonatomic, strong) DCFeatureTitleItem *headTitle;

@end
