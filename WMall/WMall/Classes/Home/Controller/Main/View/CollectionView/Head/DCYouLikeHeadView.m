//
//  DCYouLikeHeadView.m
//  WMall
//
//  Created by tom on 2018/10/6.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCYouLikeHeadView.h"

@interface DCYouLikeHeadView ()

@property (strong , nonatomic) DCButton *hotButton;

@end

@implementation DCYouLikeHeadView

- (instancetype)initWithFrame:(CGRect)frame {
	
	if (self = [super initWithFrame:frame]) {
		[self setupView];
	}
	return self;
}

- (void)setupView {
	
	_hotButton = [DCButton buttonWithType:UIButtonTypeCustom];
	_hotButton.titleLabel.font = [UIFont systemFontOfSize:12.0f];
	[_hotButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
	[self addSubview:_hotButton];
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	_hotButton.frame = CGRectMake((self.dc_width - 74) / 2, 0, 74, self.dc_height);
	_hotButton.imageRect = CGRectMake(0, (self.dc_height - 18) / 2, 18, 18);
	_hotButton.titleRect = CGRectMake(24, 0, 50, self.dc_height);
}

- (void)setHeadImage:(NSString *)headImage {
	_headImage = headImage;
	[_hotButton setImage:[UIImage imageNamed:headImage] forState:UIControlStateNormal];
}

- (void)setHeadTitle:(NSString *)headTitle {
	_headTitle = headTitle;
	[_hotButton setTitle:headTitle forState:UIControlStateNormal];
}

@end
