//
//  DCDetailLikeCell.m
//  WMall
//
//  Created by tom on 2018/10/17.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCDetailLikeCell.h"
#import "DCDetailLikeItemCell.h"
#import "DCYouLikeItem.h"

static NSString *const DCDetailLikeItemCellID = @"DCDetailLikeItemCell";

@interface DCDetailLikeCell () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

/* collectionView */
@property (nonatomic, strong) UICollectionView *collectionView;
/* 推荐商品数据 */
@property (nonatomic, strong) NSMutableArray<DCYouLikeItem *> *detailItem;
/* 页面 */
@property (strong , nonatomic) UIPageControl *pageControl;

@end

@implementation DCDetailLikeCell

- (UICollectionView *)collectionView {
	if (!_collectionView) {
		
		UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
		flow.minimumLineSpacing = 0;
		flow.minimumInteritemSpacing = 0;
		flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
		_collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.dc_width, self.dc_height - 20) collectionViewLayout:flow];
		_collectionView.showsHorizontalScrollIndicator = NO;
		_collectionView.delegate = self;
		_collectionView.dataSource = self;
		_collectionView.pagingEnabled = YES;
		[self.contentView addSubview:_collectionView];
		
		[_collectionView registerClass:[DCDetailLikeItemCell class] forCellWithReuseIdentifier:DCDetailLikeItemCellID];
	}
	return _collectionView;
}


- (instancetype)initWithFrame:(CGRect)frame {
	
	if (self = [super initWithFrame:frame]) {
		[self setupView];
		[self setupPageControl];
	}
	return self;
}

- (void)setupView {
	
	self.backgroundColor = [UIColor whiteColor];
	self.collectionView.backgroundColor = self.backgroundColor;
	
	self.detailItem = [DCYouLikeItem mj_objectArrayWithFilename:@"DetailRecommend.plist"];
}

#pragma mark - 设置分页点
- (void)setupPageControl {
	
	self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectZero];
	self.pageControl.userInteractionEnabled = NO;
	self.pageControl.hidesForSinglePage = YES;
	self.pageControl.numberOfPages = 3;
	self.pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
	self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
	[self addSubview:self.pageControl];
}

#pragma mark - 布局
- (void)layoutSubviews {
	[super layoutSubviews];
	
	_pageControl.frame = CGRectMake(self.dc_width * 0.5 - 40, self.dc_height - (DCMargin * 2), 80, 20);//指定位置大小
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	
	return self.detailItem.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	DCDetailLikeItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCDetailLikeItemCellID forIndexPath:indexPath];
	cell.youLikeItem = self.detailItem[indexPath.row];
	return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	return CGSizeMake(self.dc_width / 3, self.dc_width / 3 + 60);
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	NSInteger current = scrollView.contentOffset.x / CGRectGetWidth(scrollView.frame);
	//下角小圆圈
	self.pageControl.currentPage = current;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
	
	DEBUGLog(@"推荐喜欢商品%zd",indexPath.row);
}

@end
