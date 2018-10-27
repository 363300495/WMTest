//
//  DCCommentContentCell.m
//  WMall
//
//  Created by tom on 2018/10/20.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCCommentContentCell.h"
#import "DCCommentPicCell.h"
#import "DCCommentPicItem.h"

static NSString *const DCCommentPicCellID = @"DCCommentPicCell";

@interface DCCommentContentCell () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray <DCCommentPicItem *> *picItemArray;

@end

@implementation DCCommentContentCell

- (UICollectionView *)collectionView {
	
	if (!_collectionView) {
		UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
		flow.minimumLineSpacing = 0;
		flow.minimumInteritemSpacing = 0;
		flow.itemSize = CGSizeMake(100, 100);
		flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
		
		_collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flow];
		_collectionView.delegate = self;
		_collectionView.dataSource = self;
		_collectionView.showsHorizontalScrollIndicator = NO;
		
		[self.contentView addSubview:_collectionView];
		
		[_collectionView registerClass:[DCCommentPicCell class] forCellWithReuseIdentifier:DCCommentPicCellID];
	}
	return _collectionView;
}

- (NSMutableArray<DCCommentPicItem *> *)picItemArray {
	if (!_picItemArray) {
		_picItemArray = [NSMutableArray array];
	}
	return _picItemArray;
}

- (instancetype)initWithFrame:(CGRect)frame {
	
	if (self = [super initWithFrame:frame]) {
		[self setupView];
		
		[self loadPicData];
	}
	return self;
}

- (void)setupView {
	self.collectionView.backgroundColor = self.backgroundColor;
}

- (void)loadPicData {
	self.picItemArray = [DCCommentPicItem mj_objectArrayWithFilename:@"CommentPic.plist"];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return self.picItemArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	DCCommentPicCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCCommentPicCellID forIndexPath:indexPath];
	cell.picItem = self.picItemArray[indexPath.row];
	return cell;
}




@end
