//
//  DCPersonTwoCell.m
//  WMall
//
//  Created by tom on 2018/10/24.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCPersonTwoCell.h"

@implementation DCPersonTwoCell

- (instancetype)initWithFrame:(CGRect)frame {
	
	if (self = [super initWithFrame:frame]) {
		[self setupView];
	}
	return self;
}

- (void)setupView {
	
	self.backgroundColor = [UIColor whiteColor];
	
	self.flowNumberLabel = [[UILabel alloc] init];
	self.flowNumberLabel.font = [UIFont fontWithName:@"PingFangSC-Bold" size:14];
	self.flowNumberLabel.textAlignment = NSTextAlignmentCenter;
	[self.contentView addSubview:self.flowNumberLabel];
	
	self.flowTextLabel = [[UILabel alloc] init];
	self.flowTextLabel.font = [UIFont systemFontOfSize:13.0f];
	self.flowTextLabel.textColor = [UIColor colorWithHexString:DEEP_COLOR];
	self.flowTextLabel.textAlignment = NSTextAlignmentCenter;
	[self.contentView addSubview:self.flowTextLabel];
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	WEAKSELF(weakSelf);
	[self.flowNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerX.equalTo(weakSelf);
		make.top.equalTo(@(DCMargin));
		make.size.mas_equalTo(CGSizeMake(35, 35));
	}];
	

	[self.flowTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerX.equalTo(weakSelf);
		make.top.equalTo(weakSelf.flowNumberLabel.mas_bottom).offset(4);
	}];
}

@end
