//
//  DCDetailLikeItemCell.m
//  WMall
//
//  Created by tom on 2018/10/19.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCDetailLikeItemCell.h"
#import "DCYouLikeItem.h"

@interface DCDetailLikeItemCell ()

/* 图片 */
@property (strong , nonatomic) UIImageView *goodsImageView;
/* 标题 */
@property (strong , nonatomic) UILabel *goodsLabel;
/* 价格 */
@property (strong , nonatomic) UILabel *priceLabel;

@end

@implementation DCDetailLikeItemCell

#pragma mark - Intial
- (instancetype)initWithFrame:(CGRect)frame {
	
	self = [super initWithFrame:frame];
	if (self) {
		
		[self setupView];
	}
	return self;
}

#pragma mark - UI
- (void)setupView {
	
	self.backgroundColor = [UIColor whiteColor];
	_goodsImageView = [[UIImageView alloc] init];
	_goodsImageView.contentMode = UIViewContentModeScaleAspectFill;
	[self.contentView addSubview:_goodsImageView];
	
	_priceLabel = [[UILabel alloc] init];
	_priceLabel.textColor = [UIColor blackColor];
	_priceLabel.font = [UIFont systemFontOfSize:14.0f];
	[self.contentView addSubview:_priceLabel];
	
	_goodsLabel = [[UILabel alloc] init];
	_goodsLabel.font = [UIFont systemFontOfSize:11.0f];
	_goodsLabel.numberOfLines = 2;
	_goodsLabel.textColor = [UIColor darkGrayColor];
	_goodsLabel.textAlignment = NSTextAlignmentLeft;
	[self.contentView addSubview:_goodsLabel];
	
}

#pragma mark - 布局
- (void)layoutSubviews {
	[super layoutSubviews];
	
	WEAKSELF(weakSelf);
	[_goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
		[make.top.mas_equalTo(weakSelf)setOffset:5];
		make.width.mas_equalTo(weakSelf.dc_width).multipliedBy(0.75);
		make.height.mas_equalTo(weakSelf.dc_width).multipliedBy(0.75);
		make.centerX.mas_equalTo(weakSelf);
	}];
	
	[_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		[make.left.mas_equalTo(weakSelf)setOffset:DCMargin];
		[make.top.mas_equalTo(weakSelf.goodsImageView.mas_bottom)setOffset:2];
	}];
	
	[_goodsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		[make.left.mas_equalTo(weakSelf)setOffset:DCMargin];
		[make.right.mas_equalTo(weakSelf)setOffset:-DCMargin];
		[make.top.mas_equalTo(weakSelf.priceLabel.mas_bottom)setOffset:2];
	}];
}

#pragma mark - Setter Getter Methods
- (void)setYouLikeItem:(DCYouLikeItem *)youLikeItem {
	_youLikeItem = youLikeItem;
	[_goodsImageView sd_setImageWithURL:[NSURL URLWithString:youLikeItem.image_url]];
	_priceLabel.text = [NSString stringWithFormat:@"¥ %.2f",[youLikeItem.price floatValue]];
	_goodsLabel.text = youLikeItem.main_title;
}

@end
