//
//  MainViewController.m
//  WMall
//
//  Created by tom on 2018/10/4.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "MainViewController.h"
#import "DCHomeViewController.h"
#import "DCClassifyViewController.h"
#import "DCShoppingCarViewController.h"
#import "DCPersonnalCenterViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self addChildControllers];
}

#pragma mark 添加子控制器
- (void)addChildControllers {

	// 首页
	[self addChildNavigationController:[BaseNavigationController class]
					rootViewController:[DCHomeViewController class]
					   tabBarItemTitle:nil
				 tabBarNormalImageName:ICON_TAB_BAR_ITEM_HOME_NORMAL
				 tabBarSelectImageName:ICON_TAB_BAR_ITEM_HOME_SELECT];
	
	// 分类
	[self addChildNavigationController:[BaseNavigationController class]
					rootViewController:[DCClassifyViewController class]
					   tabBarItemTitle:nil
				 tabBarNormalImageName:ICON_TAB_BAR_ITEM_CLASSIFY_NORMAL
				 tabBarSelectImageName:ICON_TAB_BAR_ITEM_CLASSIFY_SELECT];
	
	// 购物车
	[self addChildNavigationController:[BaseNavigationController class]
					rootViewController:[DCShoppingCarViewController class]
					   tabBarItemTitle:nil
				 tabBarNormalImageName:ICON_TAB_BAR_ITEM_SHOPPING_NORMAL
				 tabBarSelectImageName:ICON_TAB_BAR_ITEM_SHOPPING_SELECT];
	
	// 我的
	[self addChildNavigationController:[BaseNavigationController class]
					rootViewController:[DCPersonnalCenterViewController class]
					   tabBarItemTitle:nil
				 tabBarNormalImageName:ICON_TAB_BAR_ITEM_PERSON_NORMAL
				 tabBarSelectImageName:ICON_TAB_BAR_ITEM_PERSON_SELECT];
	
}



@end
