//
//  DCShowTypeOneCell.m
//  WMall
//
//  Created by tom on 2018/10/17.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCShowTypeOneCell.h"


@implementation DCShowTypeOneCell

- (instancetype)initWithFrame:(CGRect)frame {
	
	self = [super initWithFrame:frame];
	if (self) {
		[self setupData];
	}
	return self;
}

- (void)setupData {
	self.leftTitleLabel.text = @"领券";
	[self.contentView addSubview:self.iconImageView];
	self.iconImageView.image = [UIImage imageNamed:@"biaoqian"];
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	WEAKSELF(weakSelf);
	//重写leftTitleLabelFrame
	[self.leftTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		[make.left.mas_equalTo(weakSelf)setOffset:DCMargin];
		make.centerY.mas_equalTo(weakSelf);
	}];
	
	[self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
		[make.left.mas_equalTo(weakSelf.leftTitleLabel.mas_right)setOffset:DCMargin];
		make.centerY.mas_equalTo(weakSelf.leftTitleLabel);
	}];
}

@end
