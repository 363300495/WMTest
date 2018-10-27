//
//  DCCommentPicCell.m
//  WMall
//
//  Created by tom on 2018/10/20.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCCommentPicCell.h"
#import "DCCommentPicItem.h"
#import "SDPhotoBrowser.h"


@interface DCCommentPicCell () <SDPhotoBrowserDelegate>

/* 图片 */
@property (nonatomic, strong) UIImageView *goodsImageView;
/* 图片数量 */
@property (nonatomic, strong) UILabel *picNum;
/* 名字 */
@property (nonatomic, strong) UILabel *nameLabel;

/* imagesArray */
@property (nonatomic, strong) NSArray *imagesArray;

@end

@implementation DCCommentPicCell

- (instancetype)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		[self setupView];
	}
	return self;
}

- (void)setupView {
	
	self.goodsImageView = [[UIImageView alloc] init];
	self.goodsImageView.userInteractionEnabled = YES;
	self.goodsImageView.contentMode = UIViewContentModeScaleAspectFit;
	UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView)];
	[self.goodsImageView addGestureRecognizer:tap];
	[self.contentView addSubview:self.goodsImageView];
	
	self.picNum = [[UILabel alloc] init];
	self.picNum.font = [UIFont systemFontOfSize:10.0f];
	self.picNum.backgroundColor = [UIColor colorWithHexString:DEEP_COLOR];
	self.picNum.textColor = [UIColor whiteColor];
	[self.contentView addSubview:self.picNum];
	
	self.nameLabel = [[UILabel alloc] init];
	self.nameLabel.font = [UIFont systemFontOfSize:11.0f];
	[self.contentView addSubview:self.nameLabel];
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	WEAKSELF(weakSelf);
	[self.goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(@(DCMargin));
		make.top.equalTo(weakSelf);
		make.size.mas_equalTo(CGSizeMake(80, 80));
	}];
	
	[self.picNum mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(weakSelf.goodsImageView);
		make.bottom.equalTo(weakSelf.goodsImageView.mas_bottom);
	}];
	
	[self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(weakSelf.goodsImageView);
		make.top.equalTo(weakSelf.goodsImageView.mas_bottom).offset(2);
	}];
}

- (void)setPicItem:(DCCommentPicItem *)picItem {
	
	_picItem = picItem;
	
	[self.goodsImageView sd_setImageWithURL:[NSURL URLWithString:picItem.images[0]]];
	self.picNum.text = [NSString stringWithFormat:@"%ld张",picItem.images.count];
	self.nameLabel.text = picItem.nickName;
	
	self.imagesArray = picItem.images;
}


#pragma mark - 图片点击
- (void)tapImageView {
	SDPhotoBrowser *browser = [[SDPhotoBrowser alloc] init];
	browser.currentImageIndex = 0;
	browser.sourceImagesContainerView = self;
	browser.isCascadingShow = YES;//层叠
	browser.imageCount = self.imagesArray.count;
	browser.delegate = self;
	[browser show];
}

#pragma mark - SDPhotoBrowserDelegate
- (NSURL *)photoBrowser:(SDPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index {
	NSURL *url = [NSURL URLWithString:self.imagesArray[index]];
	return url;
}

- (UIImage *)photoBrowser:(SDPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index {
	return self.goodsImageView.image;
}

@end
