//
//  DCDetailPartCommentCell.m
//  WMall
//
//  Created by tom on 2018/10/17.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCDetailPartCommentCell.h"
#import "DCCommentOneCell.h"
#import "DCCommentTwoCell.h"
#import "DCCommentThreeCell.h"
#import "DCCommentFourCell.h"
#import "DCCommentContentCell.h"

static NSString *const DCCommentOneCellID = @"DCCommentOneCell";
static NSString *const DCCommentTwoCellID = @"DCCommentTwoCell";
static NSString *const DCCommentThreeCellID = @"DCCommentThreeCell";
static NSString *const DCCommentFourCellID = @"DCCommentFourCell";
static NSString *const DCCommentContentCellID = @"DCCommentContentCell";

@interface DCDetailPartCommentCell () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

/* collectionView */
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation DCDetailPartCommentCell

- (UICollectionView *)collectionView {
	if (!_collectionView) {
		UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
		flow.minimumLineSpacing = 0;
		flow.minimumInteritemSpacing = 0;
		
		_collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flow];
		_collectionView.delegate = self;
		_collectionView.dataSource = self;
		[self.contentView addSubview:_collectionView];
		
		[_collectionView registerClass:[DCCommentOneCell class] forCellWithReuseIdentifier:DCCommentOneCellID];
		[_collectionView registerClass:[DCCommentTwoCell class] forCellWithReuseIdentifier:DCCommentTwoCellID];
		[_collectionView registerClass:[DCCommentThreeCell class] forCellWithReuseIdentifier:DCCommentThreeCellID];
		[_collectionView registerClass:[DCCommentFourCell class] forCellWithReuseIdentifier:DCCommentFourCellID];
		[_collectionView registerClass:[DCCommentContentCell class] forCellWithReuseIdentifier:DCCommentContentCellID];
		
	}
	return _collectionView;
}

- (instancetype)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		[self setupView];
	}
	return self;
}

- (void)setupView {
	self.collectionView.backgroundColor = [UIColor whiteColor];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
	return 5;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return section == 4 ? 2 : 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	UICollectionViewCell *gridCell = nil;
	if (indexPath.section == 0) {
		DCCommentOneCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCCommentOneCellID forIndexPath:indexPath];
		gridCell = cell;
	} else if (indexPath.section == 1) {
		DCCommentTwoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCCommentTwoCellID forIndexPath:indexPath];
		gridCell = cell;
	} else if (indexPath.section == 2) {
		DCCommentThreeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCCommentThreeCellID forIndexPath:indexPath];
		cell.pictureNum = @"12";
		gridCell = cell;
	} else if (indexPath.section == 3) {
		DCCommentContentCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCCommentContentCellID forIndexPath:indexPath];
		gridCell = cell;
	} else {
		DCCommentFourCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCCommentFourCellID forIndexPath:indexPath];
		NSArray *images = @[@"JX_pinglun1_liebiao",@"ptgd_icon_zixun"];
		NSArray *titles = @[@"全部评论（188）",@"购买咨询（22）"];
		[cell.commentFootButton setImage:[UIImage imageNamed:images[indexPath.row]] forState:UIControlStateNormal];
		[cell.commentFootButton setTitle:titles[indexPath.row] forState:UIControlStateNormal];
		
		if (indexPath.row == 0) {
			[CommonUtil dc_setUpLongLine:cell color:[UIColor colorWithHexString:LIGHT_COLOR] hightRatio:0.8];
		}
		gridCell = cell;
	}
	return gridCell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	if (indexPath.section == 0) {
		return CGSizeMake(self.dc_width, 32);
	} else if (indexPath.section == 1) {
		return CGSizeMake(self.dc_width, 74);
	} else if (indexPath.section == 2) {
		return CGSizeMake(self.dc_width, 32);
	} else if (indexPath.section == 3) {
		return CGSizeMake(self.dc_width, 100);
	} else {
		return CGSizeMake(self.dc_width / 2, 32);
	}
}

@end
