//
//  DCCountDownHeadView.m
//  WMall
//
//  Created by tom on 2018/10/6.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCCountDownHeadView.h"

@interface DCCountDownHeadView ()

/* 红色块 */
@property (strong , nonatomic) UIView *redView;
/* 时间 */
@property (strong , nonatomic) UILabel *timeLabel;
/* 倒计时 */
@property (strong , nonatomic) UILabel *countDownLabel;
/* 好货秒抢 */
@property (strong , nonatomic) DCButton *quickButton;

@end

@implementation DCCountDownHeadView

- (instancetype)initWithFrame:(CGRect)frame {
	
	self = [super initWithFrame:frame];
	if (self) {
		
		[self setupView];
	}
	return self;
}

- (void)setupView {
	
	self.backgroundColor = [UIColor whiteColor];
	_redView = [[UIView alloc] init];
	_redView.backgroundColor = [UIColor redColor];
	[self addSubview:_redView];
	
	_timeLabel = [[UILabel alloc] init];
	_timeLabel.text = @"6点场";
	_timeLabel.font = [UIFont systemFontOfSize:16.0f];
	[self addSubview:_timeLabel];
	
	_countDownLabel = [[UILabel alloc] init];
	_countDownLabel.textColor = [UIColor redColor];
	_countDownLabel.text = @"05 : 58 : 33";
	_countDownLabel.font = [UIFont systemFontOfSize:14.0f];
	[self addSubview:_countDownLabel];
	
	_quickButton = [DCButton buttonWithType:UIButtonTypeCustom];
	_quickButton.titleLabel.font = [UIFont systemFontOfSize:12.0f];
	[_quickButton setImage:[UIImage imageNamed:@"shouye_icon_jiantou"] forState:UIControlStateNormal];
	[_quickButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
	[_quickButton setTitle:@"好货秒抢" forState:UIControlStateNormal];
	[self addSubview:_quickButton];
}


- (void)layoutSubviews {
	[super layoutSubviews];
	
	_redView.frame = CGRectMake(0, 10, 8, 20);
	_timeLabel.frame = CGRectMake(20, 0, 60, self.dc_height);
	_countDownLabel.frame = CGRectMake(CGRectGetMaxX(_timeLabel.frame), 0, 100, self.dc_height);
	_quickButton.frame = CGRectMake(self.dc_width - 70, 0, 70, self.dc_height);
	_quickButton.titleRect = CGRectMake(0, 0, 50, self.dc_height);
	_quickButton.imageRect = CGRectMake(52, (self.dc_height - 8) / 2, 6, 8);
}

@end
