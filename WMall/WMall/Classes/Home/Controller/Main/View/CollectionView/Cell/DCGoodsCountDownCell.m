//
//  DCGoodsCountDownCell.m
//  WMall
//
//  Created by tom on 2018/10/6.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCGoodsCountDownCell.h"
#import "DCGoodsSurplusCell.h"
#import "DCYouLikeItem.h"

static NSString *const DCGoodsSurplusCellID = @"DCGoodsSurplusCell";

@interface DCGoodsCountDownCell () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

/* collection */
@property (nonatomic, strong) UICollectionView *collectionView;
/* 推荐商品数据 */
@property (nonatomic, strong) NSMutableArray<DCYouLikeItem *> *countDownItem;
/* 底部 */
@property (strong, nonatomic) UIView *bottomLineView;

@end

@implementation DCGoodsCountDownCell

- (instancetype)initWithFrame:(CGRect)frame {
	
	if (self = [super initWithFrame:frame]) {
		[self setupView];
	}
	return self;
}

- (void)setupView {
	self.collectionView.backgroundColor = [UIColor whiteColor];
	
	_bottomLineView = [[UIView alloc] init];
	_bottomLineView.backgroundColor = [UIColor colorWithHexString:BACKGROUND_COLOR];
	[self addSubview:_bottomLineView];
	_bottomLineView.frame = CGRectMake(0, self.dc_height - 8, SCREEN_WIDTH, 8);
	
	NSArray *countDownItem = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"CountDownShop.plist" ofType:nil]];
	_countDownItem = [DCYouLikeItem mj_objectArrayWithKeyValuesArray:countDownItem];
}

- (NSMutableArray<DCYouLikeItem *> *)countDownItem {
	if (!_countDownItem) {
		_countDownItem = [NSMutableArray array];
	}
	return _countDownItem;
}

- (UICollectionView *)collectionView {
	if (!_collectionView) {
		//创建流布局
		UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
		flow.minimumLineSpacing = 1;
		flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;//滚动方向
		_collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
		_collectionView.frame = self.bounds;
		_collectionView.showsHorizontalScrollIndicator = NO;
		_collectionView.showsVerticalScrollIndicator = NO;
		_collectionView.delegate = self;
		_collectionView.dataSource = self;
		[self.contentView addSubview:_collectionView];
		
		[_collectionView registerClass:[DCGoodsSurplusCell class] forCellWithReuseIdentifier:DCGoodsSurplusCellID];
	}
	return _collectionView;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return _countDownItem.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	DCGoodsSurplusCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCGoodsSurplusCellID forIndexPath:indexPath];
	cell.countDownItem = _countDownItem[indexPath.row];
	return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
/* 设置item大小 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	return CGSizeMake(self.dc_height * 0.65, self.dc_height * 0.9);
}


@end
