//
//  DCDetailServicetCell.h
//  WMall
//
//  Created by tom on 2018/10/17.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCLIRLButton.h"

@interface DCDetailServicetCell : UICollectionViewCell

/* 服务按钮 */
@property (strong , nonatomic) DCLIRLButton *serviceButton;
/* 服务标题 */
@property (strong , nonatomic) UILabel *serviceLabel;

@end
