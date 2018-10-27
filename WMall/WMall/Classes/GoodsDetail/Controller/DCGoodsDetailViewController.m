//
//  GoodsDetailViewController.m
//  WMall
//
//  Created by tom on 2018/10/12.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCGoodsDetailViewController.h"
#import "DCGoodsBaseViewController.h"
#import "DCGoodsParticularsViewController.h"
#import "DCGoodsCommentViewController.h"

@interface DCGoodsDetailViewController () <UIScrollViewDelegate>

/* scrollerView */
@property (nonatomic, strong) UIScrollView *scrollerView;
/* 头部View */
@property (nonatomic, strong) UIView *bgView;
/* 选中的Button */
@property (nonatomic, strong) UIButton *selectButton;
/* 标题按钮底下的指示器 */
@property (nonatomic, strong) UIView *indicatorView;

@end

@implementation DCGoodsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self setupChildViewControllers];
	
	[self setupView];
	
	[self setupTopButtonView];

	[self addChildViewController];
}

- (void)setupView {
	
	self.scrollerView.backgroundColor = self.view.backgroundColor;
}


- (UIScrollView *)scrollerView {
	
	if (!_scrollerView) {
		_scrollerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, SafeAreaTopHeight, SCREEN_WIDTH, SCREEN_HEIGHT - SafeAreaTopHeight)];
		_scrollerView.contentSize = CGSizeMake(self.childViewControllers.count * SCREEN_WIDTH, SCREEN_HEIGHT - SafeAreaTopHeight);
		_scrollerView.showsVerticalScrollIndicator = NO;
		_scrollerView.showsHorizontalScrollIndicator = NO;
		_scrollerView.pagingEnabled = YES;
		_scrollerView.bounces = NO;
		_scrollerView.delegate = self;
		[self.view addSubview:_scrollerView];
	}
	return _scrollerView;
}


#pragma mark - 头部View
- (void)setupTopButtonView {

	NSArray *titles = @[@"商品",@"详情",@"评价"];
	CGFloat margin = 5;
	self.bgView = [[UIView alloc] init];
	self.bgView.dc_height = 44;
	self.bgView.dc_width = (self.bgView.dc_height + margin) * titles.count;
	self.bgView.dc_centerX = self.view.dc_centerX;
	self.bgView.dc_y = StatusBarTopHeight;
	
	self.naviBar.mineBgImageview.hidden = YES;
	self.naviBar.title = @"图文详情";
	self.naviBar.title_label.textColor = [UIColor blackColor];
	self.naviBar.title_label.hidden = YES;
	[self.naviBar addSubview:self.bgView];
	
	CGFloat buttonW = self.bgView.dc_height;
	CGFloat buttonH = self.bgView.dc_height;
	CGFloat buttonY = 0;
	
	for (NSInteger i = 0; i < titles.count; i++) {
		UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
		[button setTitle:titles[i] forState:UIControlStateNormal];
		[button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		button.tag = i;
		button.titleLabel.font = [UIFont systemFontOfSize:16.0f];
		[button addTarget:self action:@selector(topButtonClick:) forControlEvents:UIControlEventTouchUpInside];
		
		CGFloat buttonX = i * (buttonW + margin) + margin / 2;
		
		button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
		[self.bgView addSubview:button];
	}
	
	UIButton *firstButton = self.bgView.subviews[0];
	[self topButtonClick:firstButton];//默认选择第一个
	
	UIView *indicatorView = [[UIView alloc] init];
	self.indicatorView = indicatorView;
	indicatorView.backgroundColor = [firstButton titleColorForState:UIControlStateNormal];
	
	[firstButton.titleLabel sizeToFit];
	indicatorView.dc_width = firstButton.titleLabel.dc_width;
	indicatorView.dc_height = 2;
	indicatorView.dc_y = self.bgView.dc_height - indicatorView.dc_height;
	indicatorView.dc_centerX = firstButton.dc_centerX;
	[self.bgView addSubview:indicatorView];
}

#pragma mark - 添加子控制器
- (void)setupChildViewControllers {
	
	WEAKSELF(weakSelf);
	DCGoodsBaseViewController *goodsBaseVC = [[DCGoodsBaseViewController alloc] init];
	goodsBaseVC.goodTitle = self.goodTitle; 
	goodsBaseVC.goodPrice = self.goodPrice;
	goodsBaseVC.goodSubtitle = self.goodSubtitle;
	goodsBaseVC.shufflingArray = self.shufflingArray;
	goodsBaseVC.goodImageView = self.goodImageView;
	goodsBaseVC.changeTitleBlock = ^(BOOL isChange) {
		if (isChange) {
			weakSelf.naviBar.title_label.hidden = NO;
			weakSelf.bgView.hidden = YES;
			weakSelf.scrollerView.contentSize = CGSizeMake(weakSelf.view.dc_width, SCREEN_HEIGHT - SafeAreaTopHeight);
		}else{
			weakSelf.naviBar.title_label.hidden = YES;
			weakSelf.bgView.hidden = NO;
			weakSelf.scrollerView.contentSize = CGSizeMake(weakSelf.view.dc_width * weakSelf.childViewControllers.count, SCREEN_HEIGHT - SafeAreaTopHeight);
		}
	};
	[self addChildViewController:goodsBaseVC];
	
	DCGoodsParticularsViewController *goodsParticularsVC = [[DCGoodsParticularsViewController alloc] init];
	[self addChildViewController:goodsParticularsVC];
	
	DCGoodsCommentViewController *goodsCommentVC = [[DCGoodsCommentViewController alloc] init];
	[self addChildViewController:goodsCommentVC];
}

#pragma mark - 添加子控制器View
- (void)addChildViewController {
	
	NSInteger index = self.scrollerView.contentOffset.x / self.scrollerView.dc_width;
	
	UIViewController *childVC = self.childViewControllers[index];
	
	if (childVC.view.superview) return;
	childVC.view.frame = CGRectMake(index * self.scrollerView.dc_width, 0, self.scrollerView.dc_width, self.scrollerView.dc_height);
	[self.scrollerView addSubview:childVC.view];
}


#pragma mark - 点击事件
- (void)topButtonClick:(UIButton *)button {
	
	button.selected = !button.selected;
	[self.selectButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
	
	self.selectButton = button;
	
	WEAKSELF(weakSelf);
	[UIView animateWithDuration:0.25 animations:^{
		weakSelf.indicatorView.dc_width = button.titleLabel.dc_width;
		weakSelf.indicatorView.dc_centerX = button.dc_centerX;
	}];
	
	CGPoint offset = self.scrollerView.contentOffset;
	offset.x = self.scrollerView.dc_width * button.tag;
	[self.scrollerView setContentOffset:offset animated:YES];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
	[self addChildViewController];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
	NSInteger index = scrollView.contentOffset.x / scrollView.dc_width;
	UIButton *button = self.bgView.subviews[index];
	
	[self topButtonClick:button];
	
	[self addChildViewController];
}


@end
