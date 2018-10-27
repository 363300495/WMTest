//
//  DCCommentOneCell.m
//  WMall
//
//  Created by tom on 2018/10/20.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCCommentOneCell.h"

@interface DCCommentOneCell ()

/* 评论数 */
@property (nonatomic, strong) UILabel *commentNumLabel;
/* 好评度 */
@property (nonatomic, strong) UILabel *goodCommentLabel;
/* 指示箭头 */
@property (nonatomic, strong) UIButton *indicatorButton;

@end

@implementation DCCommentOneCell

- (instancetype)initWithFrame:(CGRect)frame {
	
	if (self = [super initWithFrame:frame]) {
		[self setupView];
	}
	return self;
}

- (void)setupView {
	
	self.commentNumLabel = [[UILabel alloc] init];
	self.commentNumLabel.text = @"评论(668)";
	self.commentNumLabel.font = [UIFont systemFontOfSize:13.0f];
	[self.contentView addSubview:self.commentNumLabel];
	
	self.goodCommentLabel = [[UILabel alloc] init];
	self.goodCommentLabel.text = @"好评率：100%";
	[CommonUtil stringChangeColorLabel:self.goodCommentLabel range:NSMakeRange(4, self.goodCommentLabel.text.length - 4) color:[UIColor redColor]];
	self.goodCommentLabel.font = [UIFont systemFontOfSize:12.0f];
	[self.contentView addSubview:self.goodCommentLabel];
	
	self.indicatorButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[self.indicatorButton setImage:[UIImage imageNamed:@"icon_charge_jiantou"] forState:UIControlStateNormal];
	[self.contentView addSubview:self.indicatorButton];
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	WEAKSELF(weakSelf);
	[self.commentNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(@(DCMargin));
		make.centerY.equalTo(weakSelf);
	}];
	
	[self.indicatorButton mas_makeConstraints:^(MASConstraintMaker *make) {
		make.right.equalTo(@(-DCMargin));
		make.centerY.equalTo(weakSelf);
		make.size.mas_equalTo(CGSizeMake(25, 25));
	}];
	
	[self.goodCommentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.right.equalTo(weakSelf.indicatorButton.mas_left).offset(-2);
		make.centerY.equalTo(weakSelf);
	}];
	
}

@end
