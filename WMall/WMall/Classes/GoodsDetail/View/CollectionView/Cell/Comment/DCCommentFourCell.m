//
//  DCCommentFourCell.m
//  WMall
//
//  Created by tom on 2018/10/20.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCCommentFourCell.h"

@implementation DCCommentFourCell

- (instancetype)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		[self setupView];
	}
	return self;
}

- (void)setupView {
	
	self.commentFootButton = [DCLIRLButton buttonWithType:UIButtonTypeCustom];
	[self.commentFootButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	self.commentFootButton.titleLabel.font = [UIFont systemFontOfSize:12.0f];
	[self.contentView addSubview:self.commentFootButton];
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	WEAKSELF(weakSelf);
	[self.commentFootButton mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.mas_equalTo(weakSelf);
	}];
}


@end
