//
//  DCGoodsYouLikeCell.m
//  WMall
//
//  Created by tom on 2018/10/6.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCGoodsYouLikeCell.h"
#import "DCYouLikeItem.h"

#define cellWH SCREEN_WIDTH * 0.5 - 50

@interface DCGoodsYouLikeCell ()

/* 图片 */
@property (strong , nonatomic)UIImageView *goodsImageView;
/* 标题 */
@property (strong , nonatomic)UILabel *goodsLabel;
/* 价格 */
@property (strong , nonatomic)UILabel *priceLabel;

@end

@implementation DCGoodsYouLikeCell


- (instancetype)initWithFrame:(CGRect)frame {
	
	self = [super initWithFrame:frame];
	if (self) {
		
		[self setupView];
	}
	return self;
}

- (void)setupView {
	self.backgroundColor = [UIColor whiteColor];
	_goodsImageView = [[UIImageView alloc] init];
	_goodsImageView.contentMode = UIViewContentModeScaleAspectFill;
	[self.contentView addSubview:_goodsImageView];
	
	_goodsLabel = [[UILabel alloc] init];
	_goodsLabel.font = [UIFont systemFontOfSize:12.0f];
	_goodsLabel.numberOfLines = 2;
	_goodsLabel.textAlignment = NSTextAlignmentLeft;
	[self.contentView addSubview:_goodsLabel];
	
	_priceLabel = [[UILabel alloc] init];
	_priceLabel.textColor = [UIColor redColor];
	_priceLabel.font = [UIFont systemFontOfSize:15.0f];
	[self.contentView addSubview:_priceLabel];
}


- (void)layoutSubviews {
	[super layoutSubviews];
	
	WEAKSELF(weakSelf);
	
	[_goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerX.mas_equalTo(weakSelf);
		[make.top.mas_equalTo(weakSelf)setOffset:DCMargin];
		make.size.mas_equalTo(CGSizeMake(cellWH , cellWH));
		
	}];
	
	[_goodsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerX.mas_equalTo(weakSelf);
		make.width.mas_equalTo(weakSelf).multipliedBy(0.8);
		make.height.mas_equalTo(40);
		[make.top.mas_equalTo(weakSelf.goodsImageView.mas_bottom)setOffset:DCMargin];
		
	}];
	
	[_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(weakSelf.goodsImageView);
		make.width.mas_equalTo(weakSelf).multipliedBy(0.5);
		make.top.mas_equalTo(weakSelf.goodsLabel.mas_bottom);
		
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
