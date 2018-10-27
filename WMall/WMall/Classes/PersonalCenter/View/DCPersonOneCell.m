//
//  DCPersonOneCell.m
//  WMall
//
//  Created by tom on 2018/10/24.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCPersonOneCell.h"
#import "DCFlowItem.h"

@implementation DCPersonOneCell

- (instancetype)initWithFrame:(CGRect)frame {
	
	if (self = [super initWithFrame:frame]) {
		[self setupView];
	}
	return self;
}

- (void)setupView {
	
	self.backgroundColor = [UIColor whiteColor];
	
	self.flowImageView = [[UIImageView alloc] init];
	self.flowImageView.contentMode = UIViewContentModeScaleAspectFit;
	[self.contentView addSubview:self.flowImageView];
	
	self.flowTextLabel = [[UILabel alloc] init];
	self.flowTextLabel.font = [UIFont systemFontOfSize:13.0f];
	self.flowTextLabel.textAlignment = NSTextAlignmentCenter;
	self.flowTextLabel.textColor = [UIColor colorWithHexString:DEEP_COLOR];
	[self.contentView addSubview:self.flowTextLabel];
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	WEAKSELF(weakSelf);
	[self.flowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerX.equalTo(weakSelf);
		make.top.equalTo(@(DCMargin));
		make.size.mas_equalTo(CGSizeMake(35, 35));
	}];
	
	[self.flowTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerX.equalTo(weakSelf);
		make.top.equalTo(weakSelf.flowImageView.mas_bottom).offset(4);
	}];
}

- (void)setFlowItem:(DCFlowItem *)flowItem {
	_flowItem = flowItem;
	
	self.flowImageView.image = [UIImage imageNamed:flowItem.flowImageView];
	self.flowTextLabel.text = flowItem.flow_title;
}

@end
