//
//  DCOverFootView.m
//  WMall
//
//  Created by tom on 2018/10/6.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCOverFootView.h"

@interface DCOverFootView ()

@property (strong , nonatomic)UILabel *overLabel;

@end

@implementation DCOverFootView


- (instancetype)initWithFrame:(CGRect)frame {
	
	self = [super initWithFrame:frame];
	if (self) {
		
		[self setupView];
	}
	return self;
}

- (void)setupView {
	_overLabel = [[UILabel alloc] init];
	_overLabel.textAlignment = NSTextAlignmentCenter;
	[self addSubview:_overLabel];
	_overLabel.font = [UIFont systemFontOfSize:16.0f];
	_overLabel.textColor = [UIColor darkGrayColor];
	_overLabel.text = @"看完喽，下次在逛吧";
}


- (void)layoutSubviews {
	[super layoutSubviews];
	
	WEAKSELF(weakSelf);
	[_overLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.center.mas_equalTo(weakSelf);
	}];
}

@end
