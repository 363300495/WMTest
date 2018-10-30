//
//  DCFeatureSelectionViewController.h
//  WMall
//
//  Created by tom on 2018/10/30.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCFeatureSelectionViewController : UIViewController

/* 商品图片 */
@property (strong , nonatomic) NSString *goodImageView;
/* 上一次选择的属性 */
@property (strong , nonatomic) NSMutableArray *lastSeleArray;
/* 上一次选择的数量 */
@property (assign , nonatomic) NSString *lastNum;

@end
