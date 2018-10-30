//
//  DCFeatureSelectionViewController.m
//  WMall
//
//  Created by tom on 2018/10/30.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCFeatureSelectionViewController.h"
#import "UIViewController+XWTransition.h"

@interface DCFeatureSelectionViewController ()

@end

@implementation DCFeatureSelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self setupFeatureAlterView];
}

#pragma mark - 弹出弹框
- (void)setupFeatureAlterView {
	
	XWInteractiveTransitionGestureDirection direction = XWInteractiveTransitionGestureDirectionDown;
	
	WEAKSELF(weakSelf);
	[self xw_registerBackInteractiveTransitionWithDirection:direction transitonBlock:^(CGPoint startPoint){
		[weakSelf dismissViewControllerAnimated:YES completion:nil];
	} edgeSpacing:0];
}


@end
