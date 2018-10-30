//
//  DCHomeViewController.m
//  WMall
//
//  Created by tom on 2018/10/5.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCHomeViewController.h"
#import "DCGoodsSetViewController.h"

#import "DCGoodsGridCell.h"
#import "DCGoodsCountDownCell.h"
#import "DCGoodsHandheldCell.h"
#import "DCExceedApplicationCell.h"
#import "DCGoodsYouLikeCell.h"
#import "DCCountDownHeadView.h"
#import "DCSlideshowHeadView.h"
#import "DCYouLikeHeadView.h"
#import "DCTopLineFootView.h"
#import "DCScrollAdFootView.h"
#import "DCOverFootView.h"

#import "DCGridItem.h"
#import "DCYouLikeItem.h"

#import "SubLBXScanViewController.h"


/* cell */
static NSString *const DCGoodsGridCellID = @"DCGoodsGridCell";
static NSString *const DCGoodsCountDownCellID = @"DCGoodsCountDownCell";
static NSString *const DCGoodsHandheldCellID = @"DCGoodsHandheldCell";
static NSString *const DCExceedApplicationCellID = @"DCExceedApplicationCell";
static NSString *const DCGoodsYouLikeCellID = @"DCGoodsYouLikeCell";
/* head */
static NSString *const DCSlideshowHeadViewID = @"DCSlideshowHeadView";
static NSString *const DCCountDownHeadViewID = @"DCCountDownHeadView";
static NSString *const DCYouLikeHeadViewID = @"DCYouLikeHeadView";
/* foot */
static NSString *const DCTopLineFootViewID = @"DCTopLineFootView";
static NSString *const DCScrollAdFootViewID = @"DCScrollAdFootView";
static NSString *const DCOverFootViewID = @"DCOverFootView";


@interface DCHomeViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,DCSlideshowHeadViewDelegate>
/* 导航栏高度 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *navigationBar_height;
/* collectionView */
@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) NSMutableArray<DCGridItem *> *gridItem;

@property (nonatomic,strong) NSMutableArray<DCYouLikeItem *> *youlikeItem;

@end

@implementation DCHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.navigationBar_height.constant = SafeAreaTopHeight;
	
	[self loadGoodsData];
	
	self.collectionView.backgroundColor = self.view.backgroundColor;
}

- (UICollectionView *)collectionView {
	if (!_collectionView) {
		//创建流布局
		UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
		_collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, SafeAreaTopHeight, SCREEN_WIDTH, SCREEN_HEIGHT - SafeAreaTopHeight - SafeAreaBottomHeight) collectionViewLayout:flow];

		_collectionView.showsVerticalScrollIndicator = NO;
		_collectionView.showsHorizontalScrollIndicator = NO;
		_collectionView.delegate = self;
		_collectionView.dataSource = self;
		[self.view addSubview:_collectionView];
		
		[_collectionView registerClass:[DCGoodsGridCell class] forCellWithReuseIdentifier:DCGoodsGridCellID];
		[_collectionView registerClass:[DCGoodsCountDownCell class] forCellWithReuseIdentifier:DCGoodsCountDownCellID];
		[_collectionView registerClass:[DCGoodsHandheldCell class] forCellWithReuseIdentifier:DCGoodsHandheldCellID];
		[_collectionView registerClass:[DCExceedApplicationCell class] forCellWithReuseIdentifier:DCExceedApplicationCellID];
		[_collectionView registerClass:[DCGoodsYouLikeCell class] forCellWithReuseIdentifier:DCGoodsYouLikeCellID];
		
		[_collectionView registerClass:[DCCountDownHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DCCountDownHeadViewID];
		[_collectionView registerClass:[DCSlideshowHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DCSlideshowHeadViewID];
		[_collectionView registerClass:[DCYouLikeHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DCYouLikeHeadViewID];
		
		[_collectionView registerClass:[DCTopLineFootView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:DCTopLineFootViewID];
		[_collectionView registerClass:[DCScrollAdFootView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:DCScrollAdFootViewID];
		[_collectionView registerClass:[DCOverFootView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:DCOverFootViewID];
		
	}
	return _collectionView;
}

#pragma mark - 加载数据
- (void)loadGoodsData {
	
	_gridItem = [DCGridItem mj_objectArrayWithFilename:@"GoodsGrid.plist"];
	_youlikeItem = [DCYouLikeItem mj_objectArrayWithFilename:@"HomeHighGoods.plist"];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
	return 5;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	
	if (section == 0) {
		return _gridItem.count;
	} else if (section == 1) {
		return 1;
	} else if (section == 2) {
		return 1;
	} else if (section == 3) {
		return GoodsHandheldImagesArray.count;
	} else {
		return _youlikeItem.count;
	}
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	UICollectionViewCell *gridcell = nil;
	if (indexPath.section == 0) {
		DCGoodsGridCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCGoodsGridCellID forIndexPath:indexPath];
		cell.gridItem = _gridItem[indexPath.row];
		gridcell = cell;
	} else if (indexPath.section == 1) {
		DCGoodsCountDownCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCGoodsCountDownCellID forIndexPath:indexPath];
		gridcell = cell;
	} else if (indexPath.section == 2) {
		DCExceedApplicationCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCExceedApplicationCellID forIndexPath:indexPath];
		cell.goodsExceedArray = GoodsRecommendArray;
		gridcell = cell;
	} else if (indexPath.section == 3) {
		DCGoodsHandheldCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCGoodsHandheldCellID forIndexPath:indexPath];
		NSArray *images = GoodsHandheldImagesArray;
		cell.handheldImage = images[indexPath.row];
		gridcell = cell;
	} else {
		DCGoodsYouLikeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCGoodsYouLikeCellID forIndexPath:indexPath];
		cell.youLikeItem = _youlikeItem[indexPath.row];
		gridcell = cell;
	}
	return gridcell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
	
	UICollectionReusableView *resuableView = nil;
	
	if (kind == UICollectionElementKindSectionHeader) {
		if (indexPath.section == 0) {
			DCSlideshowHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DCSlideshowHeadViewID forIndexPath:indexPath];
			headerView.delegate = self;
			resuableView = headerView;
		} else if (indexPath.section == 1){
			DCCountDownHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DCCountDownHeadViewID forIndexPath:indexPath];
			resuableView = headerView;
		} else if (indexPath.section == 3){
			DCYouLikeHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DCYouLikeHeadViewID forIndexPath:indexPath];
			headerView.headTitle = @"品牌精选";
			headerView.headImage = @"shouye_icon03";
			resuableView = headerView;
		} else if (indexPath.section == 4){
			DCYouLikeHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DCYouLikeHeadViewID forIndexPath:indexPath];
			headerView.headTitle = @"热门推荐";
			headerView.headImage = @"shouye_icon_02";
			resuableView = headerView;
		}
	}
	if (kind == UICollectionElementKindSectionFooter) {
		if (indexPath.section == 0) {
			DCTopLineFootView *footview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:DCTopLineFootViewID forIndexPath:indexPath];
			resuableView = footview;
		} else if (indexPath.section == 2){
			DCScrollAdFootView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:DCScrollAdFootViewID forIndexPath:indexPath];
			resuableView = footerView;
		} else if (indexPath.section == 4) {
			DCOverFootView *footview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:DCOverFootViewID forIndexPath:indexPath];
			resuableView = footview;
		}
	}
	return resuableView;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
	
	if (indexPath.section == 4) {
		DCGoodsSetViewController *goodsSetVC = [[DCGoodsSetViewController alloc] init];
		goodsSetVC.goodsPlistName = @"ClasiftyGoods.plist";
		[self.navigationController pushViewController:goodsSetVC animated:YES];
	}
}

#pragma mark - UICollectionViewDelegateFlowLayout
/* 设置item的大小 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	if (indexPath.section == 0) {
		return CGSizeMake(SCREEN_WIDTH / 5 , SCREEN_WIDTH / 5 + DCMargin);
	} else if (indexPath.section == 1) {
		return CGSizeMake(SCREEN_WIDTH, 150);
	} else if (indexPath.section == 2) {
		return CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH * 0.35 + 120);
	} else if (indexPath.section == 3) {
		return [self layoutAttributesForItemAtIndexPath:indexPath].size;
	} else {
		return CGSizeMake((SCREEN_WIDTH - 4) / 2, (SCREEN_WIDTH - 4) / 2 + 40);
	}
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
	UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
	if (indexPath.section == 3) {
		if (indexPath.row == 0) {
			layoutAttributes.size = CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH * 0.35);
		}else if (indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 4){
			layoutAttributes.size = CGSizeMake(SCREEN_WIDTH * 0.5, SCREEN_WIDTH * 0.2);
		}else{
			layoutAttributes.size = CGSizeMake(SCREEN_WIDTH * 0.25, SCREEN_WIDTH * 0.35);
		}
	}
	return layoutAttributes;
}

/* 头部视图的高度 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
	
	if (section == 0) {
		return CGSizeMake(SCREEN_WIDTH, 150); //图片滚动的宽高
	}
	if (section == 1 || section == 3 || section == 4) {//猜你喜欢的宽高
		return CGSizeMake(SCREEN_WIDTH, 40);
	}
	return CGSizeZero;
}

/* 尾部视图的高度 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
	
	if (section == 0) {
		return CGSizeMake(SCREEN_WIDTH, 60);  //Top头条的宽高
	}
	if (section == 2) {
		return CGSizeMake(SCREEN_WIDTH, 80); // 滚动广告
	}
	if (section == 4) {
		return CGSizeMake(SCREEN_WIDTH, 40); // 结束
	}
	return CGSizeZero;
}

#pragma mark - X间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
	return (section == 4) ? 4 : 0;
}

#pragma mark - Y间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
	return (section == 4) ? 4 : 0;
}

#pragma mark - DCSlideshowHeadViewDelegate
- (void)scrollViewDidSelectItemAtIndex:(NSInteger)index {
	
	DEBUGLog(@"点击了%zd轮播图",index);
}
 
#pragma mark - 扫描二维码
- (IBAction)richScanItemClick:(UIButton *)sender {
	
	LBXScanViewStyle *style = [[LBXScanViewStyle alloc] init];
	style.centerUpOffset = 44;
	style.photoframeAngleStyle = LBXScanViewPhotoframeAngleStyle_Outer;
	style.photoframeLineW = 6;
	style.photoframeAngleW = 24;
	style.photoframeAngleH = 24;
	style.anmiationStyle = LBXScanViewAnimationStyle_LineMove;
	style.animationImage = [UIImage imageNamed:@"CodeScan.bundle/qrcode_scan_light_green"];
	SubLBXScanViewController *vc = [[SubLBXScanViewController alloc] init];
	vc.title = @"扫一扫";
	vc.style = style;
	vc.isQQSimulator = YES;
	
	UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
	[self presentViewController:nav animated:YES completion:nil];
	
	vc.scanResult = ^(NSString *strScanned){
		NSLog(@"扫码结果");
	};
}

- (UIStatusBarStyle)preferredStatusBarStyle {
	return UIStatusBarStyleLightContent;
}


@end
