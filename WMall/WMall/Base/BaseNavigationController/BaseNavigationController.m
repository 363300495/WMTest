//
//  BaseNavigationController.m
//  ShenCai
//
//  Created by tom on 2018/1/9.
//  Copyright © 2018年 tom. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //这里隐藏导航栏使用自定义导航栏
    self.navigationBar.hidden = YES;
}

- (UIStatusBarStyle)preferredStatusBarStyle {

	return UIStatusBarStyleLightContent;
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.childViewControllers.count > 0) {
        // push前设置隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];

}

@end
