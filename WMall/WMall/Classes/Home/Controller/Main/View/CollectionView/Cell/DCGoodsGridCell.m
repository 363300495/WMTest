//
//  DCGoodsGridCell.m
//  WMall
//
//  Created by tom on 2018/10/6.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCGoodsGridCell.h"
#import "DCGridItem.h"

@interface DCGoodsGridCell ()

@property (strong , nonatomic) UIImageView *gridImageView;

@property (strong , nonatomic) UILabel *gridLabel;

@end

@implementation DCGoodsGridCell

- (instancetype)initWithFrame:(CGRect)frame {
	
	self = [super initWithFrame:frame];
	if (self) {
		
		[self setupView];
	}
	return self;
}

- (void)setupView {
	_gridImageView = [[UIImageView alloc] init];
	_gridImageView.contentMode = UIViewContentModeScaleAspectFill;
	[self.contentView addSubview:_gridImageView];
	
	_gridLabel = [[UILabel alloc] init];
	_gridLabel.font = [UIFont systemFontOfSize:13.0f];
	_gridLabel.textAlignment = NSTextAlignmentCenter;
	[self.contentView addSubview:_gridLabel];
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	WEAKSELF(weakSelf);
	[_gridImageView mas_makeConstraints:^(MASConstraintMaker *make) {
		[make.top.mas_equalTo(weakSelf)setOffset:DCMargin];
		if (IPHONE5) {
			make.size.mas_equalTo(CGSizeMake(40, 40));
		}else{
			make.size.mas_equalTo(CGSizeMake(50, 50));
		}
		make.centerX.mas_equalTo(weakSelf);
	}];
	
	[_gridLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerX.mas_equalTo(weakSelf);
		[make.top.mas_equalTo(weakSelf.gridImageView.mas_bottom)setOffset:5];
	}];
}

#pragma mark - Setter Getter Methods
- (void)setGridItem:(DCGridItem *)gridItem {
	
	_gridItem = gridItem;
	[_gridImageView sd_setImageWithURL:[NSURL URLWithString:gridItem.iconImage]];
	_gridLabel.text = gridItem.gridTitle;
}

@end
