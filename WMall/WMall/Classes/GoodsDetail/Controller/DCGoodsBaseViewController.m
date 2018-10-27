//
//  DCGoodsBaseViewController.m
//  WMall
//
//  Created by tom on 2018/10/13.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCGoodsBaseViewController.h"

#import "DCShowTypeOneCell.h"
#import "DCShowTypeTwoCell.h"
#import "DCShowTypeThreeCell.h"
#import "DCShowTypeFourCell.h"
#import "DCDetailGoodReferralCell.h"
#import "DCDetailServicetCell.h"
#import "DCDetailLikeCell.h"
#import "DCDetailPartCommentCell.h"
#import "DCDetailCustomHeadView.h"
#import "DCDetailShuffingHeadView.h"
#import "DCDetailOverFooterView.h"

#import "DCLIRLButton.h"
#import <WebKit/WebKit.h>

#import "AddressPickerView.h"

//header
static NSString *const DCDetailCustomHeadViewID = @"DCDetailCustomHeadView";
static NSString *const DCDetailShuffingHeadViewID = @"DCDetailShuffingHeadView";
//cell
static NSString *const DCDetailGoodReferralCellID = @"DCDetailGoodReferralCell";
static NSString *const DCShowTypeOneCellID = @"DCShowTypeOneCell";
static NSString *const DCShowTypeTwoCellID = @"DCShowTypeTwoCell";
static NSString *const DCShowTypeThreeCellID = @"DCShowTypeThreeCell";
static NSString *const DCShowTypeFourCellID = @"DCShowTypeFourCell";
static NSString *const DCDetailServicetCellID = @"DCDetailServicetCell";
static NSString *const DCDetailLikeCellID = @"DCDetailLikeCell";
static NSString *const DCDetailPartCommentCellID = @"DCDetailPartCommentCell";
//footer
static NSString *const DCDetailOverFooterViewID = @"DCDetailOverFooterView";


@interface DCGoodsBaseViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) WKWebView *webView;

/* 选择地址弹框 */
@property (strong , nonatomic) AddressPickerView *adPickerView;

@end

@implementation DCGoodsBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self setupView];
	
	[self setupViewScroller];
}

- (UIScrollView *)scrollView {
	if (!_scrollView) {
		_scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
		_scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, (SCREEN_HEIGHT - SafeAreaTopHeight) * 2);
		_scrollView.showsVerticalScrollIndicator = NO;
		_scrollView.pagingEnabled = YES;
		//设置scrollView不能滑动，使用上拉刷新，下拉加载的方式滚动视图
		_scrollView.scrollEnabled = NO;
		[self.view addSubview:_scrollView];
	}
	return _scrollView;
}

- (UICollectionView *)collectionView {
	if (!_collectionView) {
		
		UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
		
		flow.minimumLineSpacing = 0;
		flow.minimumInteritemSpacing = 0;
		_collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - SafeAreaTopHeight) collectionViewLayout:flow];
		_collectionView.showsVerticalScrollIndicator = NO;
		_collectionView.delegate = self;
		_collectionView.dataSource = self;
		[self.scrollView addSubview:_collectionView];
		
		//注册header
		[_collectionView registerClass:[DCDetailShuffingHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DCDetailShuffingHeadViewID];
		[_collectionView registerClass:[DCDetailCustomHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DCDetailCustomHeadViewID];
		//注册Cell
		[_collectionView registerClass:[DCDetailGoodReferralCell class] forCellWithReuseIdentifier:DCDetailGoodReferralCellID];
		[_collectionView registerClass:[DCShowTypeOneCell class] forCellWithReuseIdentifier:DCShowTypeOneCellID];
		[_collectionView registerClass:[DCShowTypeTwoCell class] forCellWithReuseIdentifier:DCShowTypeTwoCellID];
		[_collectionView registerClass:[DCShowTypeThreeCell class] forCellWithReuseIdentifier:DCShowTypeThreeCellID];
		[_collectionView registerClass:[DCShowTypeFourCell class] forCellWithReuseIdentifier:DCShowTypeFourCellID];
		[_collectionView registerClass:[DCDetailLikeCell class] forCellWithReuseIdentifier:DCDetailLikeCellID];
		[_collectionView registerClass:[DCDetailPartCommentCell class] forCellWithReuseIdentifier:DCDetailPartCommentCellID];
		[_collectionView registerClass:[DCDetailServicetCell class] forCellWithReuseIdentifier:DCDetailServicetCellID];
		//注册footer
		[_collectionView registerClass:[DCDetailOverFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:DCDetailOverFooterViewID];
		[_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionElementKindSectionFooter"]; //间隔
	}
	return _collectionView;
}

- (WKWebView *)webView {
	if (!_webView) {
		_webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - SafeAreaTopHeight, SCREEN_WIDTH, SCREEN_HEIGHT)];
		_webView.scrollView.contentInset = UIEdgeInsetsMake(SafeAreaTopHeight, 0, 0, 0);
		_webView.scrollView.scrollIndicatorInsets = _webView.scrollView.contentInset;
		[self.scrollView addSubview:_webView];
	}
	return _webView;
}


- (void)setupView {
	
	self.view.backgroundColor = [UIColor colorWithHexString:BACKGROUND_COLOR];
	self.scrollView.backgroundColor = self.view.backgroundColor;
	self.collectionView.backgroundColor = self.view.backgroundColor;
	
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:CDDWeiBo]];
	[self.webView loadRequest:request];
	
	//下拉返回商品详情View
	UIView *topHitView = [[UIView alloc] init];
	topHitView.frame = CGRectMake(0, -35, SCREEN_WIDTH, 35);
	DCLIRLButton *topHitButton = [DCLIRLButton buttonWithType:UIButtonTypeCustom];
	topHitButton.imageView.transform = CGAffineTransformRotate(topHitButton.imageView.transform, M_PI); //旋转
	[topHitButton setImage:[UIImage imageNamed:@"Details_Btn_Up"] forState:UIControlStateNormal];
	[topHitButton setTitle:@"下拉返回商品详情" forState:UIControlStateNormal];
	topHitButton.titleLabel.font = [UIFont systemFontOfSize:12.0f];
	[topHitButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
	[topHitView addSubview:topHitButton];
	topHitButton.frame = topHitView.bounds;

	[self.webView.scrollView addSubview:topHitView];
}


#pragma mark - <UICollectionViewDataSource>
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
	return 6;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return (section == 0 ||section == 2 || section == 3) ? 2 : 1;
}

#pragma mark - UICollectionViewDelegate
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	UICollectionViewCell *gridcell = nil;
	if (indexPath.section == 0) {
		if (indexPath.row == 0) {
			DCDetailGoodReferralCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCDetailGoodReferralCellID forIndexPath:indexPath];
			cell.goodTitleLabel.text = _goodTitle;
			cell.goodPriceLabel.text = [NSString stringWithFormat:@"¥ %@",_goodPrice];
			cell.goodSubtitleLabel.text = _goodSubtitle;
			//首行缩进
			[CommonUtil dc_setUpLabel:cell.goodTitleLabel content:self.goodTitle indentationFortheFirstLin:cell.goodPriceLabel.font.pointSize * 2];
			gridcell = cell;
		} else if (indexPath.row == 1){
			DCShowTypeOneCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCShowTypeOneCellID forIndexPath:indexPath];
			gridcell = cell;
		}
	} else if (indexPath.section == 1 || indexPath.section == 2 ) {
		if (indexPath.section == 1) {
			DCShowTypeTwoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCShowTypeTwoCellID forIndexPath:indexPath];
			
			cell.leftTitleLabel.text = @"已选";
			cell.contentLabel.text = @"请选择该商品属性";
			gridcell = cell;
		}else{
			if (indexPath.row == 0) {
				DCShowTypeThreeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCShowTypeThreeCellID forIndexPath:indexPath];
				cell.contentLabel.text = @"北京市 市辖区 东城区"; //地址
				gridcell = cell;
			}else{
				DCShowTypeFourCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCShowTypeFourCellID forIndexPath:indexPath];
				gridcell = cell;
			}
		}
	} else if (indexPath.section == 3) {
		DCDetailServicetCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCDetailServicetCellID forIndexPath:indexPath];
		NSArray *btnTitles = @[@"以旧换新",@"可选增值服务"];
		NSArray *btnImages = @[@"detail_xiangqingye_yijiuhuanxin",@"ptgd_icon_zengzhifuwu"];
		NSArray *titles = @[@"以旧换新再送好礼",@"为商品保价护航"];
		[cell.serviceButton setTitle:btnTitles[indexPath.row] forState:UIControlStateNormal];
		[cell.serviceButton setImage:[UIImage imageNamed:btnImages[indexPath.row]] forState:UIControlStateNormal];
		cell.serviceLabel.text = titles[indexPath.row];
		if (indexPath.row == 0) {//分割线

			[CommonUtil dc_setUpLongLine:cell color:[UIColor colorWithHexString:LIGHT_COLOR] hightRatio:0.6];
		}
		gridcell = cell;
	} else if (indexPath.section == 4){
		DCDetailPartCommentCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCDetailPartCommentCellID forIndexPath:indexPath];
		gridcell = cell;
	} else if (indexPath.section == 5){
		DCDetailLikeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCDetailLikeCellID forIndexPath:indexPath];
		gridcell = cell;
	}
	
	return gridcell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
	
	UICollectionReusableView *reusableview = nil;
	if (kind == UICollectionElementKindSectionHeader) {
		if (indexPath.section == 0) {
			DCDetailShuffingHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DCDetailShuffingHeadViewID forIndexPath:indexPath];
			headerView.shufflingArray = _shufflingArray;
			reusableview = headerView;
		} else if (indexPath.section == 5){
			DCDetailCustomHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DCDetailCustomHeadViewID forIndexPath:indexPath];
			reusableview = headerView;
		}
	} else if (kind == UICollectionElementKindSectionFooter) {
		if (indexPath.section == 5) {
			DCDetailOverFooterView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:DCDetailOverFooterViewID forIndexPath:indexPath];
			reusableview = footerView;
		}else{
			UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionElementKindSectionFooter" forIndexPath:indexPath];
			footerView.backgroundColor = [UIColor colorWithHexString:BACKGROUND_COLOR];
			reusableview = footerView;
		}
	}
	return reusableview;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
	
	if (indexPath.section == 2 && indexPath.row == 0) {
		[self changeUserAddress];//更换用户地址
	}
}


#pragma mark - item宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.section == 0) { //商品详情
		return (indexPath.row == 0) ? CGSizeMake(SCREEN_WIDTH, [CommonUtil dc_calculateTextHeightWithText:self.goodTitle textFont:16 textMaxW:SCREEN_WIDTH - DCMargin * 6] + [CommonUtil dc_calculateTextHeightWithText:self.goodPrice textFont:20 textMaxW:SCREEN_WIDTH - DCMargin * 6] + [CommonUtil dc_calculateTextHeightWithText:self.goodSubtitle textFont:12 textMaxW:SCREEN_WIDTH - DCMargin * 6] + DCMargin * 4) : CGSizeMake(SCREEN_WIDTH, 35);
	} else if (indexPath.section == 1) {//商品属性选择
		return CGSizeMake(SCREEN_WIDTH, 60);
	} else if (indexPath.section == 2) {//商品快递信息
		return CGSizeMake(SCREEN_WIDTH, 60);
	} else if (indexPath.section == 3) {//商品保价
		return CGSizeMake(SCREEN_WIDTH / 2, 60);
	} else if (indexPath.section == 4) {//商品评价部分展示
		return CGSizeMake(SCREEN_WIDTH, 270);
	} else if (indexPath.section == 5) {//商品猜你喜欢
		return CGSizeMake(SCREEN_WIDTH, (SCREEN_WIDTH / 3 + 60) * 2 + 20);
	} else {
		return CGSizeZero;
	}
}

#pragma mark - head宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
	return (section == 0) ?  CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT * 0.55) : (section == 5) ? CGSizeMake(SCREEN_WIDTH, 30) : CGSizeZero;
}

#pragma mark - foot宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
	return (section == 5) ? CGSizeMake(SCREEN_WIDTH, 35) : CGSizeMake(SCREEN_WIDTH, DCMargin);
}

#pragma mark - 视图滚动
- (void)setupViewScroller {
	
	WEAKSELF(weakSelf);
	self.collectionView.mj_footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
		[UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
			!weakSelf.changeTitleBlock ? : weakSelf.changeTitleBlock(YES);
			weakSelf.scrollView.contentOffset = CGPointMake(0, SCREEN_HEIGHT);
		} completion:^(BOOL finished) {
			[weakSelf.collectionView.mj_footer endRefreshing];
		}];
	}];
	
	self.webView.scrollView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
		[UIView animateWithDuration:0.8 animations:^{
			!weakSelf.changeTitleBlock ? : weakSelf.changeTitleBlock(NO);
			weakSelf.scrollView.contentOffset = CGPointMake(0, 0);
		} completion:^(BOOL finished) {
			[weakSelf.webView.scrollView.mj_header endRefreshing];
		}];
	}];
}

#pragma mark - 更换地址
- (void)changeUserAddress {
	_adPickerView = [AddressPickerView shareInstance];
	[_adPickerView showAddressPickView];
	[self.view addSubview:_adPickerView];
	
	WEAKSELF(weakSelf);
	_adPickerView.block = ^(NSString *province,NSString *city,NSString *district) {
		
		//选择数据后，刷新列表改变数据
		[weakSelf.collectionView reloadData];
	};
}

@end
