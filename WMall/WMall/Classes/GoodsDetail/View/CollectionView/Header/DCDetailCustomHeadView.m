//
//  DCDetailCustomHeadView.m
//  WMall
//
//  Created by tom on 2018/10/18.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCDetailCustomHeadView.h"

@interface DCDetailCustomHeadView ()
/* 猜你喜欢 */
@property (strong ,nonatomic) UILabel *guessMarkLabel;

@end

@implementation DCDetailCustomHeadView

- (instancetype)initWithFrame:(CGRect)frame {
	
	self = [super initWithFrame:frame];
	if (self) {
		
		[self setupView];
	}
	return self;
}

- (void)setupView {
	self.backgroundColor = [UIColor whiteColor];
	
	_guessMarkLabel = [[UILabel alloc] init];
	_guessMarkLabel.text = @"猜你喜欢";
	_guessMarkLabel.font = [UIFont systemFontOfSize:15.0f];
	[self addSubview:_guessMarkLabel];
	
	_guessMarkLabel.frame = CGRectMake(DCMargin, 0, 200, self.dc_height);
}

@end
