//
//  BaseViewController+EmptyDataSet.m
//  WMall
//
//  Created by tom on 2018/10/4.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "BaseViewController+EmptyDataSet.h"

@implementation BaseViewController (EmptyDataSet)

#pragma mark - DZNEmptyDataSetSource
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
	
	NSString *text = @"抱歉，没有查询到相关结果";
	
	NSDictionary *attributes = @{NSFontAttributeName : [UIFont systemFontOfSize:16 * kWJFontCoefficient],NSForegroundColorAttributeName : [UIColor colorWithRed:0.78 green:0.78 blue:0.78 alpha:1.00]};
	
	return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}


- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
	return [UIImage imageNamed:@"pic_anonymous"];
}


- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView {
	return -70 * kWJHeightCoefficient;
}


- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView {
	return [UIColor colorWithHexString:BACKGROUND_COLOR];
}

#pragma mark 是否显示空白页，默认YES
- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView {
	return self.EmptyDataSetShouldDisplay;
}


#pragma mark 是否允许滚动，默认NO
- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView {
	return YES;
}


#pragma mark 图片是否要动画效果，默认NO
- (BOOL) emptyDataSetShouldAllowImageViewAnimate:(UIScrollView *)scrollView {
	return NO;
}

@end
