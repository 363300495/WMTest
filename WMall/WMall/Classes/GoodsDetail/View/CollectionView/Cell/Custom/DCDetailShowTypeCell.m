//
//  DCDetailShowTypeCell.m
//  WMall
//
//  Created by tom on 2018/10/18.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCDetailShowTypeCell.h"

@implementation DCDetailShowTypeCell

- (instancetype)initWithFrame:(CGRect)frame {
	
	self = [super initWithFrame:frame];
	if (self) {
		
		[self setupView];
	}
	return self;
}

- (void)setupView {
	self.contentView.backgroundColor = [UIColor whiteColor];
	
	_leftTitleLabel = [[UILabel alloc] init];
	_leftTitleLabel.font = [UIFont systemFontOfSize:14.0f];
	_leftTitleLabel.textColor = [UIColor lightGrayColor];
	[self.contentView addSubview:_leftTitleLabel];
	
	_iconImageView = [[UIImageView alloc] init];
	
	_contentLabel = [[UILabel alloc] init];
	_contentLabel.font = [UIFont systemFontOfSize:14.0f];
	[self.contentView addSubview:_contentLabel];
	
	_hintLabel = [[UILabel alloc] init];
	_hintLabel.textColor = [UIColor lightGrayColor];
	[self.contentView addSubview:_hintLabel];
	
	_indicateButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[_indicateButton setImage:[UIImage imageNamed:@"icon_charge_jiantou"] forState:UIControlStateNormal];
	_isHasindicateButton = YES;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	WEAKSELF(weakSelf);
	
	[_leftTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		[make.left.mas_equalTo(weakSelf)setOffset:DCMargin];
		[make.top.mas_equalTo(weakSelf)setOffset:DCMargin];
	}];
	
	if (_isHasindicateButton) {
		[self.contentView addSubview:_indicateButton];
		[_indicateButton mas_makeConstraints:^(MASConstraintMaker *make) {
			[make.right.mas_equalTo(weakSelf)setOffset:-DCMargin];
			make.size.mas_equalTo(CGSizeMake(25, 25));
			make.centerY.mas_equalTo(weakSelf);
		}];
	}
}

@end
