//
//  NoNetworkView.h
//  WMall
//
//  Created by tom on 2018/10/9.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoNetworkView : UIView

/* 网络刷新按钮 */
@property (weak, nonatomic) IBOutlet UIButton *networkButton;

@property (nonatomic, copy) void (^refreshNetwork)(UIView *networkView);

@end
