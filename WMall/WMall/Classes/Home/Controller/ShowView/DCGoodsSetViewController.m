//
//  DCGoodsSetViewController.m
//  WMall
//
//  Created by tom on 2018/10/11.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCGoodsSetViewController.h"
#import "DCGoodsDetailViewController.h"
#import "DCSwitchGridCell.h"
#import "DCListGridCell.h"

#import "DCYouLikeItem.h"

static NSString *const DCSwitchGridCellID = @"DCSwitchGridCell";
static NSString *const DCListGridCellID = @"DCListGridCell";


@interface DCGoodsSetViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,BaseNavigationDelegate>

/* collectionView */
@property (nonatomic, strong) UICollectionView *collectionView;

/* 商品数据 */
@property (nonatomic, strong) NSMutableArray<DCYouLikeItem *> *setItem;

/* 格子视图 */
@property(nonatomic,assign) BOOL isSwitchGrid;

@end

@implementation DCGoodsSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.isSwitchGrid = YES;
	
	self.naviBar.title = @"商品列表";
	self.naviBar.detail_btn.hidden = NO;
	[self.naviBar.detail_btn setImage:[UIImage imageNamed:@"nav_btn_jiugongge"] forState:UIControlStateNormal];
	[self.naviBar.detail_btn setImage:[UIImage imageNamed:@"nav_btn_list"] forState:UIControlStateSelected];
	self.naviBar.delegate = self;
	
	self.collectionView.backgroundColor = self.view.backgroundColor;
	
	[self loadSetData];
}

- (void)loadSetData {
	
	self.setItem = [DCYouLikeItem mj_objectArrayWithFilename:self.goodsPlistName];
}

- (NSMutableArray<DCYouLikeItem *> *)setItem {
	if (!_setItem) {
		_setItem = [NSMutableArray array];
	}
	return _setItem;
}

- (UICollectionView *)collectionView {
	
	if (!_collectionView) {
		UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
		_collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, SafeAreaTopHeight, SCREEN_WIDTH, SCREEN_HEIGHT - SafeAreaTopHeight) collectionViewLayout:flow];
		
		_collectionView.showsVerticalScrollIndicator = NO;
		_collectionView.showsHorizontalScrollIndicator = NO;
		_collectionView.delegate = self;
		_collectionView.dataSource = self;
		[self.view addSubview:_collectionView];
		
		[_collectionView registerClass:[DCSwitchGridCell class] forCellWithReuseIdentifier:DCSwitchGridCellID];
		[_collectionView registerClass:[DCListGridCell class] forCellWithReuseIdentifier:DCListGridCellID];
	}
	return _collectionView;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return self.setItem.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	UICollectionViewCell *gridCell = nil;
	
	if (self.isSwitchGrid) {
		DCSwitchGridCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCSwitchGridCellID forIndexPath:indexPath];
		cell.youLikeItem = self.setItem[indexPath.row];
		gridCell = cell;
	} else {
		DCListGridCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:DCListGridCellID forIndexPath:indexPath];
		cell.youLikeItem = self.setItem[indexPath.row];
		
		cell.colonClickBlock = ^{
				
		};
		gridCell = cell;
	}
	
	return gridCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
	
	DCGoodsDetailViewController *dcVc = [[DCGoodsDetailViewController alloc] init];
	dcVc.goodTitle = _setItem[indexPath.row].main_title;
	dcVc.goodPrice = _setItem[indexPath.row].price;
	dcVc.goodSubtitle = _setItem[indexPath.row].goods_title;
	dcVc.shufflingArray = _setItem[indexPath.row].images;
	dcVc.goodImageView = _setItem[indexPath.row].image_url;
	
	[self.navigationController pushViewController:dcVc animated:YES];
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	return (self.isSwitchGrid) ? CGSizeMake((SCREEN_WIDTH - 4)/2, (SCREEN_WIDTH - 4)/2 + 60) : CGSizeMake(SCREEN_WIDTH, 120);//列表、网格Cell
}

#pragma mark - X间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
	return 4;
}

#pragma mark - Y间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
	return (self.isSwitchGrid) ? 4 : 2;
}

#pragma mark - 详情按钮点击
- (void)detailBtnClick:(UIButton *)sender {
	
	if (sender.selected) {
		self.isSwitchGrid = YES;
	} else {
		self.isSwitchGrid = NO;
	}
	sender.selected = !sender.selected;
	
	[self.collectionView reloadData];
}


- (UIStatusBarStyle)preferredStatusBarStyle {
	return UIStatusBarStyleLightContent;
}

@end
