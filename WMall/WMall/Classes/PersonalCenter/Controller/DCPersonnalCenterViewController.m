//
//  DCPersonnalCenterViewController.m
//  WMall
//
//  Created by tom on 2018/10/5.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCPersonnalCenterViewController.h"
#import "DCPersonHeadView.h"
#import "DCYouLikeHeadView.h"
#import "DCPersonOneCell.h"
#import "DCPersonTwoCell.h"
#import "DCGoodsYouLikeCell.h"
#import "DCOverFootView.h"

#import "DCFlowItem.h"
#import "DCYouLikeItem.h"

#define DCHeadImageTopY 200

//header
static NSString *const DCPersonHeadViewID = @"DCPersonHeadView";
static NSString *const DCYouLikeHeadViewID = @"DCYouLikeHeadView";
//cell
static NSString *const DCPersonOneCellID = @"DCPersonOneCell";
static NSString *const DCPersonTwoCellID = @"DCPersonTwoCell";
static NSString *const DCGoodsYouLikeCellID = @"DCGoodsYouLikeCell";
//footer
static NSString *const DCOverFootViewID = @"DCOverFootView";


@interface DCPersonnalCenterViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

/* 购买流程属性 */
@property (strong , nonatomic) NSMutableArray<DCFlowItem *> *buyFlowItem;
/* 娱乐属性 */
@property (strong , nonatomic) NSMutableArray<DCFlowItem *> *recreationFlowItem;
/* 推荐商品属性 */
@property (strong , nonatomic) NSMutableArray<DCYouLikeItem *> *youLikeItem;

@end

@implementation DCPersonnalCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
	[self loadPersonData];
	
	[self setupView];
}

- (UICollectionView *)collectionView {
	
	if (!_collectionView) {
		
		UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
		flow.minimumLineSpacing = 0;
		flow.minimumInteritemSpacing = 0;
		
		_collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, -DCHeadImageTopY, SCREEN_WIDTH, SCREEN_HEIGHT - SafeAreaBottomHeight + DCHeadImageTopY) collectionViewLayout:flow];
		_collectionView.showsVerticalScrollIndicator = NO;
		_collectionView.delegate = self;
		_collectionView.dataSource = self;
		[self.view addSubview:_collectionView];
		
		[_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([DCPersonHeadView class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DCPersonHeadViewID];
		[_collectionView registerClass:[DCYouLikeHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DCYouLikeHeadViewID];
		
		[_collectionView registerClass:[DCPersonOneCell class] forCellWithReuseIdentifier:DCPersonOneCellID];
		[_collectionView registerClass:[DCPersonTwoCell class] forCellWithReuseIdentifier:DCPersonTwoCellID];
		[_collectionView registerClass:[DCGoodsYouLikeCell class] forCellWithReuseIdentifier:DCGoodsYouLikeCellID];
		
		[_collectionView registerClass:[DCOverFootView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:DCOverFootViewID];
		[_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionElementKindSectionFooter"];
		
	}
	return _collectionView;
}

- (void)setupView {
	
	self.view.backgroundColor = [UIColor colorWithHexString:BACKGROUND_COLOR];
	
	self.collectionView.backgroundColor = self.view.backgroundColor;
}

#pragma mark - 加载数据
- (void)loadPersonData {
	
	self.buyFlowItem = [DCFlowItem mj_objectArrayWithFilename:@"MyBuyFlow.plist"];
	self.recreationFlowItem = [DCFlowItem mj_objectArrayWithFilename:@"MyRecreationFlow.plist"];
	self.youLikeItem = [DCYouLikeItem mj_objectArrayWithFilename:@"YouLikeGoods.plist"];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
	
	return 4;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	if (section == 0) {
		return self.buyFlowItem.count;
	} else if (section == 1) {
		return 5;
	} else if (section == 2) {
		return self.recreationFlowItem.count;
	} else {
		return self.youLikeItem.count;
	}
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	UICollectionViewCell *gridCell = nil;
	if (indexPath.section == 0) {
		DCPersonOneCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCPersonOneCellID forIndexPath:indexPath];
		cell.flowItem = self.buyFlowItem[indexPath.row];
		if (indexPath.row == 4) {
			cell.backgroundColor = [UIColor colorWithHexString:BACKGROUND_COLOR];
		} else {
			cell.backgroundColor = [UIColor whiteColor];
		}
		gridCell = cell;
	} else if (indexPath.section == 1) {
		NSArray *titles = @[@"账户余额",@"优惠券",@"美豆",@"美通卡",@"我的金融"];

		if (indexPath.row == 4) {
			DCPersonOneCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCPersonOneCellID forIndexPath:indexPath];
			cell.flowImageView.image = [UIImage imageNamed:@"wodejingrong"];
			cell.flowTextLabel.text = titles[indexPath.row];
			cell.backgroundColor = [UIColor colorWithHexString:BACKGROUND_COLOR];
			gridCell = cell;
		} else {
			DCPersonTwoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCPersonTwoCellID forIndexPath:indexPath];
			cell.flowNumberLabel.text = @"0";
			cell.flowTextLabel.text = titles[indexPath.row];
			gridCell = cell;
		}
	} else if (indexPath.section == 2) {
		DCPersonOneCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCPersonOneCellID forIndexPath:indexPath];
		cell.flowItem = self.recreationFlowItem[indexPath.row];
		gridCell = cell;
	} else {
		DCGoodsYouLikeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCGoodsYouLikeCellID forIndexPath:indexPath];
		cell.youLikeItem = self.youLikeItem[indexPath.row];
		gridCell = cell;
	}
	return gridCell;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
	
	UICollectionReusableView *reusableView = nil;
	
	if (kind == UICollectionElementKindSectionHeader) {
		
		if (indexPath.section == 0) {
			DCPersonHeadView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DCPersonHeadViewID forIndexPath:indexPath];
			reusableView = headView;
		} else if (indexPath.section == 3) {
			DCYouLikeHeadView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DCYouLikeHeadViewID forIndexPath:indexPath];
			headView.headTitle = @"热门推荐";
			headView.headImage = @"shouye_icon_02";
			reusableView = headView;
		}
	}
	
	if (kind == UICollectionElementKindSectionFooter) {
		if (indexPath.section == 3) {
			DCOverFootView *footView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:DCOverFootViewID forIndexPath:indexPath];
			reusableView = footView;
		} else {
			UICollectionReusableView *footView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionElementKindSectionFooter" forIndexPath:indexPath];
			reusableView = footView;
		}
	}
	return reusableView;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	if (indexPath.section == 0 || indexPath.section == 1) {
		return CGSizeMake(SCREEN_WIDTH / 5, 80);
	} else if (indexPath.section == 2) {
		return CGSizeMake(SCREEN_WIDTH / 4, 80);
	} else {
		return CGSizeMake((SCREEN_WIDTH - 4) / 2, (SCREEN_WIDTH - 4) / 2 + 40);
	}
}

#pragma mark - head宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
	
	if (section == 0) {
		return CGSizeMake(SCREEN_WIDTH, 350);
	} else if (section == 3) {
		return CGSizeMake(SCREEN_WIDTH, 40);
	}
	return CGSizeZero;
}

#pragma mark - foot宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
	
	if (section == 3) {
		return CGSizeMake(SCREEN_WIDTH, 40);
	} else {
		return CGSizeMake(SCREEN_WIDTH, 10);
	}
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
	
	return section == 3 ? 4 : 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
	
	return section == 3 ? 4 : 0;
}

@end
