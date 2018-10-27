//
//  DCScrollAdFootView.m
//  WMall
//
//  Created by tom on 2018/10/6.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCScrollAdFootView.h"

@interface DCScrollAdFootView () <SDCycleScrollViewDelegate>

@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;

@end

@implementation DCScrollAdFootView

- (instancetype)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		[self setupView];
	}
	return self;
}

- (void)setupView {
	
	self.backgroundColor = [UIColor whiteColor];
	_cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.dc_height) delegate:self placeholderImage:nil];
	_cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
	_cycleScrollView.autoScrollTimeInterval = 5;
	_cycleScrollView.imageURLStringsGroup = @[@"http://gfs4.gomein.net.cn/T1DZAvBQbg1RCvBVdK.jpg",@"http://gfs9.gomein.net.cn/T1CoJvBXV_1RCvBVdK.jpg",@"http://gfs3.gomein.net.cn/T1C.EvBjJ_1RCvBVdK.jpg"];
	[self addSubview:_cycleScrollView];
}

#pragma mark - 点击图片Banner跳转
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
	DEBUGLog(@"点击了%zd轮播图",index);
}

@end
