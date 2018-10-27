//
//  DCGoodsHandheldCell.m
//  WMall
//
//  Created by tom on 2018/10/6.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCGoodsHandheldCell.h"

@interface DCGoodsHandheldCell ()

/* 图片 */
@property (strong , nonatomic)UIImageView *handheldImageView;

@end

@implementation DCGoodsHandheldCell

- (instancetype)initWithFrame:(CGRect)frame {
	
	self = [super initWithFrame:frame];
	if (self) {
		
		[self setupView];
	}
	return self;
}


- (void)setupView {
	_handheldImageView = [[UIImageView alloc] init];
	_handheldImageView.contentMode = UIViewContentModeScaleToFill;
	[self.contentView addSubview:_handheldImageView];
}


- (void)layoutSubviews {
	[super layoutSubviews];
	
	WEAKSELF(weakSelf);
	[_handheldImageView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.mas_equalTo(weakSelf);
	}];
}

#pragma mark - Setter Getter Methods
- (void)setHandheldImage:(NSString *)handheldImage {
	_handheldImage = handheldImage;
	
	[_handheldImageView sd_setImageWithURL:[NSURL URLWithString:handheldImage]];
}

@end
