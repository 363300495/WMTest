//
//  DCDetailShowTypeCell.h
//  WMall
//
//  Created by tom on 2018/10/18.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCDetailShowTypeCell : UICollectionViewCell

/** 是否有指示箭头 */
@property (nonatomic,assign) BOOL isHasindicateButton;
/* 指示按钮 */
@property (strong , nonatomic) UIButton *indicateButton;
/* 标题 */
@property (strong , nonatomic) UILabel *leftTitleLabel;
/* 图片 */
@property (strong , nonatomic) UIImageView *iconImageView;
/* 内容 */
@property (strong , nonatomic) UILabel *contentLabel;
/* 提示 */
@property (strong , nonatomic) UILabel *hintLabel;


@end
