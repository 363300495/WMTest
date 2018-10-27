//
//  DCSlideshowHeadView.m
//  WMall
//
//  Created by tom on 2018/10/6.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCSlideshowHeadView.h"

@interface DCSlideshowHeadView () <SDCycleScrollViewDelegate>

@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;

@end

@implementation DCSlideshowHeadView

- (instancetype)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		[self setupView];
	}
	return self;
}

- (void)setupView {
	
	_cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.dc_height) delegate:self placeholderImage:nil];
	_cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
	_cycleScrollView.autoScrollTimeInterval = 5;
	_cycleScrollView.imageURLStringsGroup = @[@"slideshow01",@"slideshow02",@"slideshow03"];
	[self addSubview:_cycleScrollView];
}

#pragma mark - 点击图片Banner跳转
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
	
	if ([self.delegate respondsToSelector:@selector(scrollViewDidSelectItemAtIndex:)]) {
		[self.delegate scrollViewDidSelectItemAtIndex:index];
	}
} 

@end
