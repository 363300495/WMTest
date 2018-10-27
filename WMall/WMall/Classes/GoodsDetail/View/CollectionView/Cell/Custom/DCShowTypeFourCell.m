//
//  DCShowTypeFourCell.m
//  WMall
//
//  Created by tom on 2018/10/17.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCShowTypeFourCell.h"

@implementation DCShowTypeFourCell

- (instancetype)initWithFrame:(CGRect)frame {
	
	self = [super initWithFrame:frame];
	if (self) {
		[self setupData];
	}
	return self;
}

- (void)setupData {
	self.isHasindicateButton = NO;
	self.leftTitleLabel.text = @"运费";
	self.contentLabel.text = @"免运费";
	self.hintLabel.text = @"支持7天无理由退货";
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	self.hintLabel.font = [UIFont systemFontOfSize:10.0f];
	[self.contentView addSubview:self.iconImageView];
	self.iconImageView.image = [UIImage imageNamed:@"icon_duigou_small"];
	
	[self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		[make.left.mas_equalTo(self.leftTitleLabel.mas_right)setOffset:DCMargin];
		make.centerY.mas_equalTo(self.leftTitleLabel);
	}];
	
	[self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(self.leftTitleLabel);
		[make.top.mas_equalTo(self.leftTitleLabel.mas_bottom)setOffset:DCMargin];
	}];
	
	[self.hintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		[make.left.mas_equalTo(self.iconImageView.mas_right)setOffset:DCMargin];
		make.centerY.mas_equalTo(self.iconImageView);
	}];
}

@end
