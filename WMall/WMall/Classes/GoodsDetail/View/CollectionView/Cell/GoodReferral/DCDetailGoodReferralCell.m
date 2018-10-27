//
//  DCDetailGoodReferralCell.m
//  WMall
//
//  Created by tom on 2018/10/17.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCDetailGoodReferralCell.h"
#import "DCUpDownButton.h"

@interface DCDetailGoodReferralCell ()

/* 自营 */
@property (strong , nonatomic) UIImageView *autotrophyImageView;
/* 分享按钮 */
@property (strong , nonatomic) DCUpDownButton *shareButton;

@end

@implementation DCDetailGoodReferralCell


- (instancetype)initWithFrame:(CGRect)frame {
	
	self = [super initWithFrame:frame];
	if (self) {
		
		[self setupView];
	}
	return self;
}


- (void)setupView {
	self.backgroundColor = [UIColor whiteColor];
	
	_autotrophyImageView = [[UIImageView alloc] init];
	[self.contentView addSubview:_autotrophyImageView];
	_autotrophyImageView.image = [UIImage imageNamed:@"detail_title_ziying_tag"];
	
	_goodTitleLabel = [[UILabel alloc] init];
	_goodTitleLabel.font = [UIFont systemFontOfSize:16.0f];
	_goodTitleLabel.numberOfLines = 0;
	[self.contentView addSubview:_goodTitleLabel];
	
	_goodPriceLabel = [[UILabel alloc] init];
	_goodPriceLabel.font = [UIFont systemFontOfSize:20.0f];
	_goodPriceLabel.textColor = [UIColor redColor];
	[self.contentView addSubview:_goodPriceLabel];
	
	_goodSubtitleLabel = [[UILabel alloc] init];
	_goodSubtitleLabel.font = [UIFont systemFontOfSize:12.0f];
	_goodSubtitleLabel.numberOfLines = 0;
	_goodSubtitleLabel.textColor = [UIColor colorWithHexString:@"#E9232E"];
	[self.contentView addSubview:_goodSubtitleLabel];
	
	_shareButton = [DCUpDownButton buttonWithType:UIButtonTypeCustom];
	[_shareButton setTitle:@"分享" forState:0];
	[_shareButton setImage:[UIImage imageNamed:@"icon_fenxiang2"] forState:0];
	[_shareButton setTitleColor:[UIColor blackColor] forState:0];
	_shareButton.titleLabel.font = [UIFont systemFontOfSize:10.0f];
	[self.contentView addSubview:_shareButton];
	[_shareButton addTarget:self action:@selector(shareButtonClick) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 布局
- (void)layoutSubviews {
	[super layoutSubviews];
	
	WEAKSELF(weakSelf);
	[_autotrophyImageView mas_makeConstraints:^(MASConstraintMaker *make) {
		[make.left.mas_equalTo(self)setOffset:DCMargin];
		[make.top.mas_equalTo(self)setOffset:DCMargin];
	}];
	
	[_goodTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		[make.left.mas_equalTo(self)setOffset:DCMargin];
		[make.top.mas_equalTo(weakSelf.autotrophyImageView)setOffset:-3];
		[make.right.mas_equalTo(self)setOffset:-DCMargin * 5];
	}];
	
	[_goodSubtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(weakSelf.autotrophyImageView);
		[make.right.mas_equalTo(self)setOffset:-DCMargin * 5];
		[make.top.mas_equalTo(weakSelf.goodTitleLabel.mas_bottom)setOffset:DCMargin];
	}];
	
	[_goodPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(weakSelf.autotrophyImageView);
		[make.top.mas_equalTo(weakSelf.goodSubtitleLabel.mas_bottom)setOffset:DCMargin];
	}];
	
	[_shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
		[make.right.mas_equalTo(self)setOffset:-DCMargin];
		[make.top.mas_equalTo(self)setOffset:DCMargin];
	}];
}


#pragma mark - 分享按钮点击
- (void)shareButtonClick {
	
	!_shareButtonClickBlock ? : _shareButtonClickBlock();
}

@end
