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
#import "DCShoppingCarViewController.h"

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
	
	[self setupBottomButton];

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


#pragma mark - 底部按钮(收藏 购物车 加入购物车 立即购买)
- (void)setupBottomButton {
	
	[self setupLeftTwoButton];
	
	[self setupRightTwoButton];

}

#pragma mark - 收藏 购物车
- (void)setupLeftTwoButton {
	
	NSArray *imagesNor = @[@"tabr_07shoucang_up",@"tabr_08gouwuche"];
	NSArray *imagesSel = @[@"tabr_07shoucang_down",@"tabr_08gouwuche"];
	CGFloat buttonW = SCREEN_WIDTH * 0.2;
	CGFloat buttonH = 50;
	CGFloat buttonY = SCREEN_HEIGHT - buttonH;
	
	for (NSInteger i = 0; i < imagesNor.count; i++) {
		UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
		[button setImage:[UIImage imageNamed:imagesNor[i]] forState:UIControlStateNormal];
		button.backgroundColor = [UIColor whiteColor];
		[button setImage:[UIImage imageNamed:imagesSel[i]] forState:UIControlStateSelected];
		button.tag = i;
		[button addTarget:self action:@selector(bottomButtonClick:) forControlEvents:UIControlEventTouchUpInside];
		CGFloat buttonX = (buttonW * i);
		button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
		
		[self.view addSubview:button];
	}
}

#pragma mark - 加入购物车 立即购买
- (void)setupRightTwoButton {
	
	NSArray *titles = @[@"加入购物车",@"立即购买"];
	CGFloat buttonW = SCREEN_WIDTH * 0.3;
	CGFloat buttonH = 50;
	CGFloat buttonY = SCREEN_HEIGHT - buttonH;
	
	for (NSInteger i = 0; i < titles.count; i++) {
		UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
		button.titleLabel.font = [UIFont systemFontOfSize:16.0f];
		[button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		button.tag = i + 2;
		[button setTitle:titles[i] forState:UIControlStateNormal];
		button.backgroundColor = (i == 0) ? [UIColor redColor] : [UIColor orangeColor];
		[button addTarget:self action:@selector(bottomButtonClick:) forControlEvents:UIControlEventTouchUpInside];
		CGFloat buttonX = SCREEN_WIDTH * 0.4 + (buttonW * i);
		button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
		
		[self.view addSubview:button];
	}
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

- (void)bottomButtonClick:(UIButton *)button {
	
	if (button.tag == 0) {
		NSLog(@"收藏");
		button.selected = !button.selected;
	} else if (button.tag == 1) {
		NSLog(@"购物车");
		DCShoppingCarViewController *shopCarVC = [[DCShoppingCarViewController alloc] init];
		[self.navigationController pushViewController:shopCarVC animated:YES];
	} else  if (button.tag == 2 || button.tag == 3) { //父控制器的加入购物车和立即购买
		//异步发通知
		dispatch_sync(dispatch_get_global_queue(0, 0), ^{
			NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:[NSString stringWithFormat:@"%zd",button.tag],@"buttonTag", nil];
			[[NSNotificationCenter defaultCenter] postNotificationName:@"ClikAddOrBuy" object:nil userInfo:dict];
		});
	}
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
