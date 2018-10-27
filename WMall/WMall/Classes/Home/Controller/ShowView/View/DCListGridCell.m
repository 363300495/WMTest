//
//  DCListGridCell.m
//  WMall
//
//  Created by tom on 2018/10/11.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCListGridCell.h"
#import "DCYouLikeItem.h"

@interface DCListGridCell ()

/* 优惠套装 */
@property (strong , nonatomic) UIImageView *freeSuitImageView;
/* 商品图片 */
@property (strong , nonatomic) UIImageView *gridImageView;
/* 商品标题 */
@property (strong , nonatomic) UILabel *gridLabel;
/* 自营 */
@property (strong , nonatomic) UIImageView *autotrophyImageView;
/* 价格 */
@property (strong , nonatomic) UILabel *priceLabel;
/* 评价数量 */
@property (strong , nonatomic) UILabel *commentNumLabel;
/* 冒号 */
@property (strong , nonatomic) UIButton *colonButton;

@end

@implementation DCListGridCell

- (instancetype)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		
		[self setupView];
	}
	return self;
}

- (void)setupView {
	
	self.backgroundColor = [UIColor whiteColor];
	_freeSuitImageView = [[UIImageView alloc] init];
	_freeSuitImageView.image = [UIImage imageNamed:@"taozhuang_tag"];
	[self.contentView addSubview:_freeSuitImageView];
	
	_autotrophyImageView = [[UIImageView alloc] init];
	[self.contentView addSubview:_autotrophyImageView];
	_autotrophyImageView.image = [UIImage imageNamed:@"detail_title_ziying_tag"];
	
	_gridImageView = [[UIImageView alloc] init];
	_gridImageView.contentMode = UIViewContentModeScaleAspectFill;
	[self.contentView addSubview:_gridImageView];
	
	_gridLabel = [[UILabel alloc] init];
	_gridLabel.font = [UIFont systemFontOfSize:14.0f];
	_gridLabel.numberOfLines = 2;
	_gridLabel.textAlignment = NSTextAlignmentLeft;
	[self.contentView addSubview:_gridLabel];
	
	_priceLabel = [[UILabel alloc] init];
	_priceLabel.font = [UIFont systemFontOfSize:15.0f];
	_priceLabel.textColor = [UIColor redColor];
	[self.contentView addSubview:_priceLabel];
	
	
	_commentNumLabel = [[UILabel alloc] init];
	NSInteger pNum = arc4random() % 10000;
	_commentNumLabel.text = [NSString stringWithFormat:@"%zd人已评价",pNum];
	_commentNumLabel.font = [UIFont systemFontOfSize:10.0f];
	_commentNumLabel.textColor = [UIColor darkGrayColor];
	[self.contentView addSubview:_commentNumLabel];
	
	_colonButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[_colonButton setImage:[UIImage imageNamed:@"icon_shenglue"] forState:UIControlStateNormal];
	[_colonButton addTarget:self action:@selector(colonButtonClick) forControlEvents:UIControlEventTouchUpInside];
	[self.contentView addSubview:_colonButton];
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	WEAKSELF(weakSelf);
	[_gridImageView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerY.mas_equalTo(weakSelf);
		[make.left.mas_equalTo(weakSelf) setOffset:DCMargin * 2];
		make.size.mas_equalTo(CGSizeMake(90, 90));
	}];
	
	[_autotrophyImageView mas_makeConstraints:^(MASConstraintMaker *make) {
		[make.left.mas_equalTo(weakSelf.gridImageView.mas_right)setOffset:DCMargin];
		make.top.mas_equalTo(weakSelf.gridImageView);
	}];
	
	[_gridLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(weakSelf.autotrophyImageView.mas_right).offset(6);
		[make.top.mas_equalTo(weakSelf.gridImageView)setOffset:-3];
		[make.right.mas_equalTo(weakSelf)setOffset:-DCMargin];
	}];
	
	
	[_freeSuitImageView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(weakSelf.autotrophyImageView);
		[make.top.mas_equalTo(weakSelf.gridLabel.mas_bottom)setOffset:2];
	}];
	
	[_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(weakSelf.autotrophyImageView);
		[make.top.mas_equalTo(weakSelf.freeSuitImageView.mas_bottom)setOffset:2];
	}];
	
	[_commentNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(weakSelf.autotrophyImageView);
		[make.top.mas_equalTo(weakSelf.priceLabel.mas_bottom)setOffset:2];
	}];
	
	[_colonButton mas_makeConstraints:^(MASConstraintMaker *make) {
		[make.right.mas_equalTo(weakSelf)setOffset:-DCMargin];
		[make.bottom.mas_equalTo(weakSelf)setOffset:-DCMargin];
		make.size.mas_offset(CGSizeMake(22, 15));
	}];
}

- (void)setYouLikeItem:(DCYouLikeItem *)youLikeItem {
	_youLikeItem = youLikeItem;
	
	[_gridImageView sd_setImageWithURL:[NSURL URLWithString:youLikeItem.image_url]];
	_priceLabel.text = [NSString stringWithFormat:@"¥ %.2f",[youLikeItem.price floatValue]];
	_gridLabel.text = youLikeItem.main_title;
}

#pragma mark - 点击事件
- (void)colonButtonClick {
	if (self.colonClickBlock) {
		self.colonClickBlock();
	}
}

@end
