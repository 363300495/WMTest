//
//  AlertViewUtil.m
//  WMall
//
//  Created by tom on 2018/10/5.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "AlertViewUtil.h"

@implementation AlertViewUtil

//弹框显示信息1秒
+ (void)showToastWithTitle:(NSString *)title view:(UIView *)view {
	[self showToastWithTitle:title view:view time:1];
}

//弹框显示信息
+ (void)showToastWithTitle:(NSString *)title view:(UIView *)view time:(NSTimeInterval)time {
	[SVProgressHUD showSuccessWithStatus:title];
	//设置HUD和文本的颜色
	[SVProgressHUD setForegroundColor:[UIColor colorWithHexString:@"#333333"]];
	//设置HUD背景颜色
	[SVProgressHUD setBackgroundColor:[UIColor colorWithHexString:@"#E5E6E7"]];
	[SVProgressHUD setFont:[UIFont systemFontOfSize:18.0f]];
	//设置弹框最小尺寸
	[SVProgressHUD setMinimumSize:CGSizeMake(100, 100)];
	[SVProgressHUD setContainerView:view];
	[SVProgressHUD dismissWithDelay:time];
}

//封装指示器
+ (void)showHudWithTitle:(NSString *)title view:(UIView *)view {
	[SVProgressHUD showWithStatus:title];
	[SVProgressHUD setForegroundColor:[UIColor colorWithHexString:@"#333333"]];
	[SVProgressHUD setBackgroundColor:[UIColor colorWithHexString:@"#E5E6E7"]];
	[SVProgressHUD setFont:[UIFont systemFontOfSize:18.0f]];
	[SVProgressHUD setMinimumSize:CGSizeMake(100, 100)];
	[SVProgressHUD setContainerView:view];
}

//移除指示器
+ (void)hiddenHud {
	[SVProgressHUD dismiss];
}

//弹框提示
+ (void)showAlertViewWithTitle:(NSString *)title
				withMessage:(NSString *)message
				withActionTitle:(NSString *)actionTitle
				withActionMothed:(void (^)(void))actionMothed
				withCancelTitle:(NSString *)cancelTitle
				withCancelMothed:(void (^)(void))cancelMothed
				withViewController:(UIViewController *)viewController {
	
	UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
	[alertVC addAction:[UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
		if (actionMothed) {
			actionMothed();
		}
	}]];
	if (cancelTitle) {
		[alertVC addAction:[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
			if (cancelMothed) {
				cancelMothed();
			}
		}]];
	}
	[viewController presentViewController:alertVC animated:YES completion:nil];
}

@end
