//
//  BaseNetworkReachabilityController.m
//  WMall
//
//  Created by tom on 2018/10/9.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "BaseNetworkReachabilityController.h"
#import "NoNetworkView.h"

@interface BaseNetworkReachabilityController ()

@end

@implementation BaseNetworkReachabilityController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	if ([CommonUtil hasNetwork]) {
		[self viewDidLoadWithNetworkStatus];
	} else {
		[self viewDidLoadWithNoNetworkStatus];
	}
}

#pragma mark 有网状态
- (void)viewDidLoadWithNetworkStatus {
	
	[self setupView];
}

#pragma mark 没网状态
- (void)viewDidLoadWithNoNetworkStatus {
	
	[self setupView];
	
	NoNetworkView *networkView = [[[NSBundle mainBundle] loadNibNamed:@"NoNetworkView" owner:self options:nil] objectAtIndex:0];
	networkView.frame = CGRectMake(0, 0, 300, 300);
	networkView.center = self.view.center;
	[self.view addSubview:networkView];
	
	networkView.refreshNetwork = ^(UIView *networkView) {
		[self refreshData:networkView];
	};
}

#pragma mark - 子类继承实现
- (void)setupView {
}

- (void)refreshData:(UIView *)networkView {
}

@end
