//
//  DCGoodsSurplusCell.m
//  WMall
//
//  Created by tom on 2018/10/8.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCGoodsSurplusCell.h"
#import "DCYouLikeItem.h"

@interface DCGoodsSurplusCell ()

/* 图片 */
@property (strong , nonatomic)UIImageView *goodsImageView;
/* 价格 */
@property (strong , nonatomic)UILabel *priceLabel;
/* 剩余 */
@property (strong , nonatomic)UILabel *stockLabel;
/* 属性 */
@property (strong , nonatomic)UILabel *natureLabel;

@end

@implementation DCGoodsSurplusCell

- (instancetype)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		[self setupView];
	}
	return self;
}

- (void)setupView {
	
	_goodsImageView = [[UIImageView alloc] init];
	_goodsImageView.contentMode = UIViewContentModeScaleAspectFill;
	[self addSubview:_goodsImageView];
	
	_priceLabel = [[UILabel alloc] init];
	_priceLabel.font = [UIFont systemFontOfSize:12.0f];
	_priceLabel.textAlignment = NSTextAlignmentCenter;
	[self addSubview:_priceLabel];
	
	_stockLabel = [[UILabel alloc] init];
	_stockLabel.textColor = [UIColor darkGrayColor];
	_stockLabel.font = [UIFont systemFontOfSize:10.0f];
	_stockLabel.textAlignment = NSTextAlignmentCenter;
	[self addSubview:_stockLabel];
	
	_natureLabel = [[UILabel alloc] init];
	_natureLabel.textAlignment = NSTextAlignmentCenter;
	_natureLabel.backgroundColor = [UIColor redColor];
	_natureLabel.font = [UIFont systemFontOfSize:10.0f];
	_natureLabel.textColor = [UIColor whiteColor];
	[_goodsImageView addSubview:_natureLabel];
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	WEAKSELF(weakSelf);
	
	[_goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerX.mas_equalTo(weakSelf);
		make.top.mas_equalTo(weakSelf);
		make.width.mas_equalTo(weakSelf).multipliedBy(0.8);
		make.height.mas_equalTo(weakSelf.dc_width * 0.8);
	}];
	
	[_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		[make.top.mas_equalTo(weakSelf.goodsImageView.mas_bottom)setOffset:2];
		make.centerX.mas_equalTo(weakSelf);
	}];
	
	[_stockLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		[make.top.mas_equalTo(weakSelf.priceLabel.mas_bottom)setOffset:2];
		make.centerX.mas_equalTo(weakSelf);
	}];
	
	[_natureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.bottom.mas_equalTo(weakSelf.goodsImageView.mas_bottom);
		make.left.mas_equalTo(weakSelf.goodsImageView);
		make.size.mas_equalTo(CGSizeMake(30, 15));
	}];
}

#pragma mark - Setter Getter Methods
- (void)setCountDownItem:(DCYouLikeItem *)countDownItem {
	
	_countDownItem = countDownItem;
	[_goodsImageView sd_setImageWithURL:[NSURL URLWithString:countDownItem.image_url]];
	
	_priceLabel.text = ([countDownItem.price integerValue] >= 10000) ? [NSString stringWithFormat:@"¥ %.2f万",[countDownItem.price floatValue] / 10000.0] : [NSString stringWithFormat:@"¥ %.2f",[countDownItem.price floatValue]];
	
	_stockLabel.text = [NSString stringWithFormat:@"仅剩：%@件",countDownItem.stock];
	_natureLabel.text = countDownItem.nature;
}

@end
