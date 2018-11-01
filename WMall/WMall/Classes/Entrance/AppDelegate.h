//
//  AppDelegate.h
//  WMall
//
//  Created by tom on 2018/10/4.
//  Copyright © 2018年 kuaikan. All rights reserved.
//
/*
 1.系统自带的导航栏不需要适配高度，自定义的导航栏需要适配高度。
 2.自定义导航栏用xib,自定义cell简单的用代码，复杂的用xib。
 3.用Reachability判断有网没网状态，没网状态界面自定义view。
 */

#pragma mark - life cycle
#pragma mark - UITableViewDelegate
#pragma mark - event response
#pragma mark - private methods
#pragma mark - getters and setters

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end

