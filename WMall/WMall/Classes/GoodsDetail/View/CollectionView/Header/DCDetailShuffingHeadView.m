//
//  DCDetailShuffingHeadView.m
//  WMall
//
//  Created by tom on 2018/10/18.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCDetailShuffingHeadView.h"

@interface DCDetailShuffingHeadView () <SDCycleScrollViewDelegate>

@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;

@end


@implementation DCDetailShuffingHeadView

- (instancetype)initWithFrame:(CGRect)frame {
	
	self = [super initWithFrame:frame];
	if (self) {
		
		[self setupView];
	}
	return self;
}

- (void)setupView {
	self.backgroundColor = [UIColor whiteColor];
	_cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.dc_height) delegate:self placeholderImage:nil];
	_cycleScrollView.autoScroll = NO; // 不自动滚动
	
	[self addSubview:_cycleScrollView];
}

#pragma mark - 点击图片Bannar跳转
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
	DEBUGLog(@"点击了%zd轮播图",index);
}

#pragma mark - Setter Getter Methods
- (void)setShufflingArray:(NSArray *)shufflingArray {
	_shufflingArray = shufflingArray;
	_cycleScrollView.imageURLStringsGroup = shufflingArray;
}

@end
