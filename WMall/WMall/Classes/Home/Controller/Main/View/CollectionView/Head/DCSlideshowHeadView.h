//
//  DCSlideshowHeadView.h
//  WMall
//
//  Created by tom on 2018/10/6.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DCSlideshowHeadViewDelegate <NSObject>

@optional
- (void)scrollViewDidSelectItemAtIndex:(NSInteger)index;

@end

@interface DCSlideshowHeadView : UICollectionReusableView

@property (assign, nonatomic) id<DCSlideshowHeadViewDelegate> delegate;

@end
