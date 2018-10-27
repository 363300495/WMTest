//
//  AlertViewUtil.h
//  WMall
//
//  Created by tom on 2018/10/5.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlertViewUtil : NSObject

//弹框显示信息1秒
+ (void)showToastWithTitle:(NSString *)title view:(UIView *)view;

//弹框显示信息
+ (void)showToastWithTitle:(NSString *)title view:(UIView *)view time:(NSTimeInterval)time;

//封装指示器
+ (void)showHudWithTitle:(NSString *)title view:(UIView *)view;

//移除指示器
+ (void)hiddenHud;

//弹框提示
+ (void)showAlertViewWithTitle:(NSString *)title
					   withMessage:(NSString *)message
				   withActionTitle:(NSString *)actionTitle
				  withActionMothed:(void (^)(void))actionMothed
				   withCancelTitle:(NSString *)cancelTitle
				  withCancelMothed:(void (^)(void))cancelMothed
				withViewController:(UIViewController *)viewController;


@end
