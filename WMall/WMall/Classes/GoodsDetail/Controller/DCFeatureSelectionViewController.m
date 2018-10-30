//
//  DCFeatureSelectionViewController.m
//  WMall
//
//  Created by tom on 2018/10/30.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCFeatureSelectionViewController.h"
#import "UIViewController+XWTransition.h"

@interface DCFeatureSelectionViewController () <UITableViewDelegate,UITableViewDataSource>

/* tableView */
@property (nonatomic, strong) UITableView *tableView;

/* collectionView */
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation DCFeatureSelectionViewController

- (UITableView *)tableView {
	if (!_tableView) {
		_tableView = [[UITableView alloc] initWithFrame:CGRectZero];
		_tableView.delegate = self;
		_tableView.dataSource = self;
		_tableView.showsVerticalScrollIndicator = NO;
		
		_tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
		
		[self.view addSubview:_tableView];
	}
	
	return _tableView;
}

- (UICollectionView *)collectionView {
	if (!_collectionView) {
		
		UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
		flow.minimumLineSpacing = 0;
		flow.minimumInteritemSpacing = 0;
		
		_collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
		[self.view addSubview:_collectionView];
		
	}
	return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self setupFeatureAlterView];
	
	[self setupView];
	
	[self setupBottomView];
}

#pragma mark - 弹出弹框
- (void)setupFeatureAlterView {
	
	XWInteractiveTransitionGestureDirection direction = XWInteractiveTransitionGestureDirectionDown;
	
	WEAKSELF(weakSelf);
	[self xw_registerBackInteractiveTransitionWithDirection:direction transitonBlock:^(CGPoint startPoint){
		[weakSelf dismissViewControllerAnimated:YES completion:nil];
	} edgeSpacing:0];
}

- (void)setupView {
	
	self.view.backgroundColor = [UIColor whiteColor];
	self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 100);
	self.collectionView.frame = CGRectMake(0, self.tableView.dc_bottom, SCREEN_WIDTH, SCREEN_HEIGHT * 0.8 - 200);
	
}

- (void)setupBottomView {
	
}

#pragma mark - tableViewDelegate


@end
