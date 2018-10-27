//
//  DCShowTypeTwoCell.m
//  WMall
//
//  Created by tom on 2018/10/17.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCShowTypeTwoCell.h"

@implementation DCShowTypeTwoCell

- (instancetype)initWithFrame:(CGRect)frame {
	
	self = [super initWithFrame:frame];
	if (self) {
		[self setupData];
	}
	return self;
}

- (void)setupData {
	self.hintLabel.text = @"可选增值服务";
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	WEAKSELF(weakSelf);
	self.hintLabel.font = [UIFont systemFontOfSize:12.0f];
	[self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		[make.left.mas_equalTo(weakSelf.leftTitleLabel.mas_right)setOffset:DCMargin];
		make.width.mas_equalTo(weakSelf).multipliedBy(0.78);
		make.centerY.mas_equalTo(weakSelf.leftTitleLabel);
	}];
	
	[self.hintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(weakSelf.contentLabel);
		[make.top.mas_equalTo(weakSelf.contentLabel.mas_bottom)setOffset:8];
	}];
}

@end
