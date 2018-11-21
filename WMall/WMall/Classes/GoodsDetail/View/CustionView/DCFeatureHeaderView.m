//
//  DCFeatureHeaderView.m
//  WMall
//
//  Created by tom on 2018/11/21.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCFeatureHeaderView.h"
#import "DCFeatureTitleItem.h"

@interface DCFeatureHeaderView ()

/* 属性标题 */
@property (nonatomic, strong) UILabel *headerLabel;
/* 底部view */
@property (nonatomic, strong) UIView *bottomView;

@end

@implementation DCFeatureHeaderView

#pragma mark - life cycle
- (instancetype)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		[self setupView];
	}
	return self;
}

- (void)setupView {
	_headerLabel = [[UILabel alloc] init];
	_headerLabel.font = [UIFont systemFontOfSize:15.0];
	[self addSubview:_headerLabel];
	
	_bottomView = [[UILabel alloc] init];
	_bottomView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
	[self addSubview:_bottomView];
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	WEAKSELF(weakSelf);
	[_headerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(weakSelf).offset(DCMargin);
		make.centerY.mas_equalTo(weakSelf);
	}];
	
	[_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(DCMargin);
		make.right.mas_equalTo(-DCMargin);
		make.top.mas_equalTo(weakSelf);
		make.height.mas_equalTo(1);
	}];
}

#pragma mark - getters and setters
- (void)setHeadTitle:(DCFeatureTitleItem *)headTitle {
	_headTitle = headTitle;
	
	_headerLabel.text = headTitle.attrname;
}

@end
