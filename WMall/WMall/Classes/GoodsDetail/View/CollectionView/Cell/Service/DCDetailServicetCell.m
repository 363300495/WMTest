//
//  DCDetailServicetCell.m
//  WMall
//
//  Created by tom on 2018/10/17.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCDetailServicetCell.h"

@implementation DCDetailServicetCell

- (instancetype)initWithFrame:(CGRect)frame {
	
	self = [super initWithFrame:frame];
	if (self) {
		
		[self setupView];
	}
	return self;
}

- (void)setupView {
	
	self.backgroundColor = [UIColor whiteColor];
	_serviceButton = [[DCLIRLButton alloc] init];
	[_serviceButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	_serviceButton.titleLabel.font = [UIFont systemFontOfSize:13.0f];
	[self.contentView addSubview:_serviceButton];
	
	_serviceLabel = [[UILabel alloc] init];
	_serviceLabel.textColor = [UIColor lightGrayColor];
	_serviceLabel.font = [UIFont systemFontOfSize:12.0f];
	_serviceLabel.textAlignment = NSTextAlignmentCenter;
	[self.contentView addSubview:_serviceLabel];
}

- (void)layoutSubviews {
	
	[super layoutSubviews];
	WEAKSELF(weakSelf);
	[_serviceButton mas_makeConstraints:^(MASConstraintMaker *make) {
		[make.bottom.mas_equalTo(weakSelf.mas_centerY)setOffset:3];
		make.centerX.mas_equalTo(weakSelf);
	}];
	
	[_serviceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		[make.top.mas_equalTo(weakSelf.serviceButton.mas_bottom)setOffset:5];
		make.centerX.mas_equalTo(weakSelf);
	}];
}

@end
