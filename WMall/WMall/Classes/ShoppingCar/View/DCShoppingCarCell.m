//
//  DCShoppingCarCell.m
//  WMall
//
//  Created by tom on 2018/10/9.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCShoppingCarCell.h"
#import "DCShoppingCarItem.h"

@interface DCShoppingCarCell ()

@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIImageView *picImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;

@end

@implementation DCShoppingCarCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
	
	self.contentView.backgroundColor = [UIColor colorWithHexString:BACKGROUND_COLOR];
	_backView.backgroundColor = [UIColor whiteColor];
	_nameLabel.textColor = [UIColor colorWithHexString:DEEP_COLOR];
	_priceLabel.textColor = [UIColor colorWithHexString:DEEP_COLOR];
	_typeLabel.textColor = [UIColor colorWithHexString:DEEP_COLOR];
}

- (void)setShoppingCarItem:(DCShoppingCarItem *)shoppingCarItem {
	_shoppingCarItem = shoppingCarItem;
	
	[_picImageView sd_setImageWithURL:[NSURL URLWithString:shoppingCarItem.pic]];
	_nameLabel.text = shoppingCarItem.title;
	_priceLabel.text = shoppingCarItem.price;
	_typeLabel.text = shoppingCarItem.type;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
