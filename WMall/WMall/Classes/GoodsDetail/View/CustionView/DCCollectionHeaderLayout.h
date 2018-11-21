//
//  DCCollectionHeaderLayout.h
//  WMall
//
//  Created by tom on 2018/11/19.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HorizontalCollectionLayoutDelegate <NSObject>

@optional
// 用协议传回item的内容，用于计算item高度
- (NSString *)collectionViewItemSizeWithIndexPath:(NSIndexPath *)indexPath;
// 用协议传回headerSize的size
- (CGSize)collectionViewDynamicHeaderSizeWithIndexPath:(NSIndexPath *)indexPath;
// 用协议传回footerSize的size
- (CGSize)collectionViewDynamicFooterSizeWithIndexPath:(NSIndexPath *)indexPath;

@end

@interface DCCollectionHeaderLayout : UICollectionViewLayout

// item的行距（默认4.0）
@property (nonatomic, assign) CGFloat lineSpacing;
// item的间距（默认4.0）
@property (nonatomic, assign) CGFloat interitemSpacing;
// header高度（默认0.0）
@property (nonatomic, assign) CGFloat headerViewHeight;
// footer高度（默认0.0）
@property (nonatomic, assign) CGFloat footerViewHeight;
// item高度（默认30）
@property (nonatomic, assign) CGFloat itemHeight;
// footer边距缩进（默认UIEdgeInsetsZero）
@property (nonatomic, assign) UIEdgeInsets footerInset;
// header边距缩进（默认UIEdgeInsetsZero）
@property (nonatomic, assign) UIEdgeInsets headerInset;
// item边距缩进（默认UIEdgeInsetsZero）
@property (nonatomic, assign) UIEdgeInsets itemInset;
// item Label Font（默认系统字体15）
@property (nonatomic, copy) UIFont *labelFont;

@property (nonatomic, weak) id<HorizontalCollectionLayoutDelegate> delegate;


@end
