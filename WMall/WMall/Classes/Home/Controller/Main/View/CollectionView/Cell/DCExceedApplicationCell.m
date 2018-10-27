//
//  DCExceedApplicationCell.m
//  WMall
//
//  Created by tom on 2018/10/6.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCExceedApplicationCell.h"
#import "DCGoodsHandheldCell.h"

static NSString *const DCGoodsHandheldCellID = @"DCGoodsHandheldCell";

@interface DCExceedApplicationCell () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

/* 头部 */
@property (nonatomic, strong) UIImageView *headImageView;
/* collectionView */
@property (nonatomic, strong) UICollectionView *collectionView;
/* 图片数组 */
@property (nonatomic, strong) NSArray *imagesArray;

@end

@implementation DCExceedApplicationCell

- (instancetype)initWithFrame:(CGRect)frame {
	
	if (self = [super initWithFrame:frame]) {
		[self setupView];
	}
	return self;
}

- (UICollectionView *)collectionView {
	
	if (!_collectionView) {
		//创建流布局
		UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
		flow.minimumLineSpacing = 10;
		flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;//滚动方向
		_collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
		_collectionView.frame = CGRectMake(0, SCREEN_WIDTH * 0.35, SCREEN_WIDTH, 120);
		_collectionView.showsHorizontalScrollIndicator = NO;
		_collectionView.showsVerticalScrollIndicator = NO;
		_collectionView.delegate = self;
		_collectionView.dataSource = self;
		[self.contentView addSubview:_collectionView];
		
		[_collectionView registerClass:[DCGoodsHandheldCell class] forCellWithReuseIdentifier:DCGoodsHandheldCellID];
	}
	return _collectionView;
}

- (void)setupView {
	_headImageView = [[UIImageView alloc] init];
	[self.contentView addSubview:_headImageView];
	
	self.collectionView.backgroundColor = self.backgroundColor;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	WEAKSELF(weakSelf);
	[_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.mas_equalTo(weakSelf);
		make.left.mas_equalTo(weakSelf);
		make.width.mas_equalTo(weakSelf);
		make.height.mas_equalTo(SCREEN_WIDTH * 0.35);
	}];
}

- (void)setGoodsExceedArray:(NSArray *)goodsExceedArray {
	_goodsExceedArray = goodsExceedArray;
	
	_imagesArray = goodsExceedArray;
	[_headImageView sd_setImageWithURL:[NSURL URLWithString:_imagesArray[0]]];
}



#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	
	return _imagesArray.count - 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	DCGoodsHandheldCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCGoodsHandheldCellID forIndexPath:indexPath];
	cell.handheldImage = _imagesArray[indexPath.row + 1];
	return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	return CGSizeMake(100, 100);
}

@end
