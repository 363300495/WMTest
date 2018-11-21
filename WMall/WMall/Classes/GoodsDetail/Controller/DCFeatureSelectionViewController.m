//
//  DCFeatureSelectionViewController.m
//  WMall
//
//  Created by tom on 2018/10/30.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCFeatureSelectionViewController.h"
#import "UIViewController+XWTransition.h"
#import "PPNumberButton.h"

#import "DCCollectionHeaderLayout.h"
#import "DCFeatureItemCell.h"
#import "DCFeatureHeaderView.h"
#import "DCFeatureList.h"
#import "DCFeatureTitleItem.h"
#import "DCFeatureItem.h"

#import "DCFeatureChoseTopCell.h"

static NSString *const DCFeatureChoseTopCellID = @"DCFeatureChoseTopCell";
static NSString *const DCFeatureItemCellID = @"DCFeatureItemCell";
static NSString *const DCFeatureHeaderViewID = @"DCFeatureHeaderView";

@interface DCFeatureSelectionViewController () <UITableViewDelegate,UITableViewDataSource,HorizontalCollectionLayoutDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

/* tableView */
@property (nonatomic, strong) UITableView *tableView;

/* collectionView */
@property (nonatomic, strong) UICollectionView *collectionView;

@property(nonatomic,assign) NSInteger num;

/* 数据 */
@property (strong , nonatomic) NSMutableArray <DCFeatureItem *> *featureAttr;
/* 选择属性 */
@property (strong , nonatomic) NSMutableArray *seleArray;

@end

@implementation DCFeatureSelectionViewController


#pragma mark - life cycle
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
	
	_featureAttr = [DCFeatureItem mj_objectArrayWithFilename:@"ShopItem.plist"];
	
	self.view.backgroundColor = [UIColor whiteColor];
	self.collectionView.backgroundColor = self.view.backgroundColor;
	self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 100);
	self.collectionView.frame = CGRectMake(0, self.tableView.dc_bottom, SCREEN_WIDTH, SCREEN_HEIGHT * 0.8 - 200);
	
	if (_lastSeleArray.count == 0) return;
	for (NSString *str in _lastSeleArray) {//反向遍历
		for (NSInteger i = 0; i < _featureAttr.count; i++) {
			for (NSInteger j = 0; j < _featureAttr[i].list.count; j++) {
				if ([_featureAttr[i].list[j].infoName isEqualToString:str]) {
					_featureAttr[i].list[j].isSelect = YES;
					[self.collectionView reloadData];
				}
			}
		}
	}
}

- (void)setupBottomView {
	
	NSArray *titles = @[@"加入购物车",@"立即购买"];
	CGFloat buttonH = 50;
	CGFloat buttonW = SCREEN_WIDTH / titles.count;
	CGFloat buttonY = SCREEN_HEIGHT * 0.8 - buttonH;
	for (NSInteger i = 0; i < titles.count; i++) {
		UIButton *buttton = [UIButton buttonWithType:UIButtonTypeCustom];
		[buttton setTitle:titles[i] forState:0];
		buttton.backgroundColor = (i == 0) ? [UIColor redColor] : [UIColor orangeColor];
		CGFloat buttonX = buttonW * i;
		buttton.tag = i;
		buttton.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
		[self.view addSubview:buttton];
	}
	
	UILabel *numLabel = [[UILabel alloc] init];
	numLabel.text = @"数量";
	numLabel.font = [UIFont systemFontOfSize:14.0f];
	[self.view addSubview:numLabel];
	numLabel.frame = CGRectMake(DCMargin, SCREEN_HEIGHT * 0.8 - 90, 50, 35);
	
	
	PPNumberButton *numberButton = [PPNumberButton numberButtonWithFrame:CGRectMake(CGRectGetMaxX(numLabel.frame), numLabel.dc_y, 110, numLabel.dc_height)];
	numberButton.shakeAnimation = YES;
	numberButton.minValue = 1;
	numberButton.inputFieldFont = 23;
	numberButton.increaseTitle = @"＋";
	numberButton.decreaseTitle = @"－";
	numberButton.currentNumber = 1;
	
	WEAKSELF(weakSelf);
	numberButton.resultBlock = ^(NSInteger num ,BOOL increaseStatus){
		weakSelf.num = num;
	};
	[self.view addSubview:numberButton];
}


#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	DCFeatureChoseTopCell *cell = [tableView dequeueReusableCellWithIdentifier:DCFeatureChoseTopCellID];
	[cell.goodsImageView sd_setImageWithURL:[NSURL URLWithString:_goodImageView]];
	cell.priceLabel.text = @"￥12";
	cell.chooseAttLabel.text = @"有货";
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	
	WEAKSELF(weakSelf);
	cell.crossButtonClickBlock = ^{
		[weakSelf dismissViewControllerAnimated:YES completion:nil];
	};
	
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 100;
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
	return _featureAttr.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return _featureAttr[section].list.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	DCFeatureItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCFeatureItemCellID forIndexPath:indexPath];
	cell.content = _featureAttr[indexPath.section].list[indexPath.row];
	return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
	
	if ([kind  isEqualToString:UICollectionElementKindSectionHeader]) {
		DCFeatureHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DCFeatureHeaderViewID forIndexPath:indexPath];
		headerView.headTitle = _featureAttr[indexPath.section].attr;
		return headerView;
	}else {
		
		UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionElementKindSectionFooter" forIndexPath:indexPath];
		return footerView;
	}
}

#pragma mark - <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
	
	//限制每组内的Item只能选中一个(加入质数选择)
	if (_featureAttr[indexPath.section].list[indexPath.row].isSelect == NO) {
		for (NSInteger j = 0; j < _featureAttr[indexPath.section].list.count; j++) {
			_featureAttr[indexPath.section].list[j].isSelect = NO;
		}
	}
	_featureAttr[indexPath.section].list[indexPath.row].isSelect = !_featureAttr[indexPath.section].list[indexPath.row].isSelect;
	
	
	//section，item 循环讲选中的所有Item加入数组中 ，数组mutableCopy初始化
	_seleArray = [@[] mutableCopy];
	for (NSInteger i = 0; i < _featureAttr.count; i++) {
		for (NSInteger j = 0; j < _featureAttr[i].list.count; j++) {
			if (_featureAttr[i].list[j].isSelect == YES) {
				[_seleArray addObject:_featureAttr[i].list[j].infoName];
			}else{
				[_seleArray removeObject:_featureAttr[i].list[j].infoName];
				[_lastSeleArray removeAllObjects];
			}
		}
	}
	
	//刷新tableView和collectionView
	[self.collectionView reloadData];
	[self.tableView reloadData];
}


#pragma mark - <HorizontalCollectionLayoutDelegate>
#pragma mark - 自定义layout必须实现的方法
- (NSString *)collectionViewItemSizeWithIndexPath:(NSIndexPath *)indexPath {
	return _featureAttr[indexPath.section].list[indexPath.row].infoName;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	[self.view endEditing:YES];
}


#pragma mark - getters and setters
- (UITableView *)tableView {
	if (!_tableView) {
		_tableView = [[UITableView alloc] initWithFrame:CGRectZero];
		_tableView.delegate = self;
		_tableView.dataSource = self;
		_tableView.showsVerticalScrollIndicator = NO;
		_tableView.scrollEnabled = NO;
		
		_tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
		
		[self.view addSubview:_tableView];
		
		[_tableView registerClass:[DCFeatureChoseTopCell class] forCellReuseIdentifier:DCFeatureChoseTopCellID];
	}
	
	return _tableView;
}

- (UICollectionView *)collectionView {
	if (!_collectionView) {
		
		DCCollectionHeaderLayout *flow = [[DCCollectionHeaderLayout alloc] init];
		
		//自定义layout初始化
		flow.delegate = self;
		flow.lineSpacing = 8.0;
		flow.interitemSpacing = DCMargin;
		flow.headerViewHeight = 35;
		flow.footerViewHeight = 5;
		flow.itemInset = UIEdgeInsetsMake(0, DCMargin, 0, DCMargin);
		
		_collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
		_collectionView.delegate = self;
		_collectionView.dataSource = self;
		_collectionView.alwaysBounceVertical = YES;
		
		[_collectionView registerClass:[DCFeatureItemCell class] forCellWithReuseIdentifier:DCFeatureItemCellID];//cell
		[_collectionView registerClass:[DCFeatureHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DCFeatureHeaderViewID]; //头部
		[_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionElementKindSectionFooter"]; //尾部
		
		[self.view addSubview:_collectionView];
		
	}
	return _collectionView;
}


@end
