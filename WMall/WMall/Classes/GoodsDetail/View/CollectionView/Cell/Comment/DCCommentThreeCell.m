//
//  DCCommentThreeCell.m
//  WMall
//
//  Created by tom on 2018/10/20.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCCommentThreeCell.h"

@interface DCCommentThreeCell ()

/* 评论数 */
@property (nonatomic, strong) UILabel *commentLabel;
/*指示箭头 */
@property (nonatomic, strong) UIButton *indicatorButton;

@end

@implementation DCCommentThreeCell

- (instancetype)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		[self setupView];
	}
	return self;
}

- (void)setupView {
	
	self.commentLabel = [[UILabel alloc] init];
	self.commentLabel.font = [UIFont systemFontOfSize:13.0f];
	[self.contentView addSubview:self.commentLabel];
	
	self.indicatorButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[self.indicatorButton setImage:[UIImage imageNamed:@"icon_charge_jiantou"] forState:UIControlStateNormal];
	[self.contentView addSubview:self.indicatorButton];
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	WEAKSELF(weakSelf);
	[self.commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(@(DCMargin));
		make.centerY.equalTo(weakSelf);
	}];
	
	[self.indicatorButton mas_makeConstraints:^(MASConstraintMaker *make) {
		make.right.equalTo(@(-DCMargin));
		make.centerY.equalTo(weakSelf);
		make.size.mas_equalTo(CGSizeMake(25, 25));
	}];
}



- (void)setPictureNum:(NSString *)pictureNum {
	_pictureNum = pictureNum;
	self.commentLabel.text = [NSString stringWithFormat:@"有图评价（%@）",pictureNum];
}

@end
