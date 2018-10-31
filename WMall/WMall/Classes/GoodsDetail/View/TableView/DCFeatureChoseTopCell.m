//
//  DCFeatureChoseTopCell.m
//  WMall
//
//  Created by tom on 2018/10/31.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCFeatureChoseTopCell.h"

@interface DCFeatureChoseTopCell ()

@property (nonatomic, strong) UIButton *crossButton;

@end

@implementation DCFeatureChoseTopCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
		[self setupView];
	}
	return self;
}

- (void)setupView {
	
	_goodsImageView = [[UIImageView alloc] init];
	_goodsImageView.contentMode = UIViewContentModeScaleAspectFit;
	[self.contentView addSubview:_goodsImageView];
	
	_priceLabel = [[UILabel alloc] init];
	_priceLabel.textColor = [UIColor redColor];
	_priceLabel.font = [UIFont systemFontOfSize:18.0f];
	[self.contentView addSubview:_priceLabel];
	
	_chooseAttLabel = [[UILabel alloc] init];
	_chooseAttLabel.textColor = [UIColor redColor];
	_chooseAttLabel.font = [UIFont systemFontOfSize:14.0f];
	[self.contentView addSubview:_chooseAttLabel];
	
	_crossButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[_crossButton addTarget:self action:@selector(crossButtonClick) forControlEvents:UIControlEventTouchUpInside];
	[_crossButton setImage:[UIImage imageNamed:@"icon_cha"] forState:UIControlStateNormal];
	[self.contentView addSubview:_crossButton];
}

- (void)layoutSubviews {
	
	[super layoutSubviews];
	
	WEAKSELF(weakSelf);
	[self.goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(@(DCMargin));
		make.centerY.equalTo(weakSelf);
		make.size.mas_equalTo(CGSizeMake(80, 80));
	}];
	
	[self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(weakSelf.goodsImageView.mas_right).offset(DCMargin);
		make.top.equalTo(@(DCMargin));
	}];
	
	[self.chooseAttLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(weakSelf.priceLabel).offset(5);
		make.top.equalTo(weakSelf.priceLabel.mas_bottom).offset(DCMargin);
	}];
	
	[self.crossButton mas_makeConstraints:^(MASConstraintMaker *make) {
		make.right.equalTo(@(-DCMargin));
		make.top.equalTo(@(DCMargin));
		make.size.mas_equalTo(CGSizeMake(35, 35));
	}];
}

#pragma mark - 点击事件
- (void)crossButtonClick {
	
	!_crossButtonClickBlock ?: _crossButtonClickBlock();
}

@end
