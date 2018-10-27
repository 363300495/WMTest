//
//  DCDetailOverFooterView.m
//  WMall
//
//  Created by tom on 2018/10/18.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCDetailOverFooterView.h"
#import "DCLIRLButton.h"

@interface DCDetailOverFooterView ()

/* 底部上拉提示 */
@property (strong , nonatomic) DCLIRLButton *overMarkButton;

@end

@implementation DCDetailOverFooterView

- (instancetype)initWithFrame:(CGRect)frame {
	
	self = [super initWithFrame:frame];
	if (self) {
		
		[self setupView];
	}
	return self;
}

- (void)setupView {
	
	self.backgroundColor = [UIColor colorWithHexString:BACKGROUND_COLOR];
	_overMarkButton = [DCLIRLButton buttonWithType:UIButtonTypeCustom];
	[_overMarkButton setImage:[UIImage imageNamed:@"Details_Btn_Up"] forState:UIControlStateNormal];
	[_overMarkButton setTitle:@"上拉查看图文详情" forState:UIControlStateNormal];
	_overMarkButton.titleLabel.font = [UIFont systemFontOfSize:12.0f];
	[_overMarkButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
	[self addSubview:_overMarkButton];
	
	_overMarkButton.frame = CGRectMake(0, 0, self.dc_width, self.dc_height);
}

@end
