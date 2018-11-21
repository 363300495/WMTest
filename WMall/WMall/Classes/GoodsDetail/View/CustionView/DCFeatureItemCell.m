//
//  DCFeatureItemCell.m
//  WMall
//
//  Created by tom on 2018/11/21.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCFeatureItemCell.h"
#import "DCFeatureList.h"

@interface DCFeatureItemCell ()

@property (nonatomic, strong) UILabel *attLabel;

@end

@implementation DCFeatureItemCell

#pragma mark - life cycle
- (instancetype)initWithFrame:(CGRect)frame {
	
	if (self = [super initWithFrame:frame]) {
		[self setupView];
	}
	return self;
}

- (void)setupView {
	
	_attLabel = [[UILabel alloc] init];
	_attLabel.textAlignment = NSTextAlignmentCenter;
	_attLabel.font = [UIFont systemFontOfSize:13.0f];
	[self.contentView addSubview:_attLabel];
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	WEAKSELF(weakSelf);
	[_attLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.mas_equalTo(weakSelf);
	}];
}

#pragma mark - getters and setters
- (void)setContent:(DCFeatureList *)content {
	
	_content = content;
	_attLabel.text = content.infoName;
	
	if (content.isSelect) {
		_attLabel.textColor = [UIColor redColor];
		[CommonUtil dc_chageControlCircularWith:_attLabel setCornerRadius:5 setBorderWidth:1 setBorderColor:[UIColor redColor] canMasksToBounds:YES];
	} else {
		_attLabel.textColor = [UIColor blackColor];
		[CommonUtil dc_chageControlCircularWith:_attLabel setCornerRadius:5 setBorderWidth:1 setBorderColor:[[UIColor lightGrayColor] colorWithAlphaComponent:0.4] canMasksToBounds:YES];
	}
}

@end
