//
//  DCShowTypeThreeCell.m
//  WMall
//
//  Created by tom on 2018/10/17.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCShowTypeThreeCell.h"

@implementation DCShowTypeThreeCell

- (instancetype)initWithFrame:(CGRect)frame {
	
	self = [super initWithFrame:frame];
	if (self) {
		[self setupData];
	}
	return self;
}

- (void)setupData {
	self.leftTitleLabel.text = @"送至";
	self.hintLabel.text = @"由DC商贸配送监管";
}

- (void)layoutSubviews {
	[super layoutSubviews];
	self.hintLabel.font = [UIFont systemFontOfSize:12.0f];
	[self.contentView addSubview:self.iconImageView];
	self.iconImageView.image = [UIImage imageNamed:@"ptgd_icon_dizhi"];
	
	[self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
		[make.left.mas_equalTo(self.leftTitleLabel.mas_right)setOffset:DCMargin];
		make.centerY.mas_equalTo(self.leftTitleLabel);
	}];
	
	[self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		[make.left.mas_equalTo(self.iconImageView.mas_right)setOffset:DCMargin];
		make.centerY.mas_equalTo(self.leftTitleLabel);
	}];
	
	[self.hintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(self.iconImageView);
		[make.top.mas_equalTo(self.contentLabel.mas_bottom)setOffset:8];
	}];
}

@end
