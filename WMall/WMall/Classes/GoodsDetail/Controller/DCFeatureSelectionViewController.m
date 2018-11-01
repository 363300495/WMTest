//
//  DCFeatureSelectionViewController.m
//  WMall
//
//  Created by tom on 2018/10/30.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCFeatureSelectionViewController.h"
#import "UIViewController+XWTransition.h"
#import "PPNumberButton.h"

#import "DCFeatureChoseTopCell.h"

static NSString *const DCFeatureChoseTopCellID = @"DCFeatureChoseTopCell";

@interface DCFeatureSelectionViewController () <UITableViewDelegate,UITableViewDataSource>

/* tableView */
@property (nonatomic, strong) UITableView *tableView;

/* collectionView */
@property (nonatomic, strong) UICollectionView *collectionView;

@property(nonatomic,assign) NSInteger num;

@end

@implementation DCFeatureSelectionViewController

- (UITableView *)tableView {
	if (!_tableView) {
		_tableView = [[UITableView alloc] initWithFrame:CGRectZero];
		_tableView.delegate = self;
		_tableView.dataSource = self;
		_tableView.showsVerticalScrollIndicator = NO;
		_tableView.scrollEnabled = NO;
		
		_tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
		
		[self.view addSubview:_tableView];
		
		[_tableView registerClass:[DCFeatureChoseTopCell class] forCellReuseIdentifier:DCFeatureChoseTopCellID];
	}
	
	return _tableView;
}

- (UICollectionView *)collectionView {
	if (!_collectionView) {
		
		UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
		flow.minimumLineSpacing = 0;
		flow.minimumInteritemSpacing = 0;
		
		_collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
		[self.view addSubview:_collectionView];
		
	}
	return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self setupFeatureAlterView];
	
	[self setupView];
	
	[self setupBottomView];
	
}

#pragma mark - 弹出弹框
- (void)setupFeatureAlterView {
	
	XWInteractiveTransitionGestureDirection direction = XWInteractiveTransitionGestureDirectionDown;
	
	WEAKSELF(weakSelf);
	[self xw_registerBackInteractiveTransitionWithDirection:direction transitonBlock:^(CGPoint startPoint){
		[weakSelf dismissViewControllerAnimated:YES completion:nil];
	} edgeSpacing:0];
}

- (void)setupView {
	
	self.view.backgroundColor = [UIColor whiteColor];
	self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 100);
	self.collectionView.frame = CGRectMake(0, self.tableView.dc_bottom, SCREEN_WIDTH, SCREEN_HEIGHT * 0.8 - 200);
}

- (void)setupBottomView {
	
	NSArray *titles = @[@"加入购物车",@"立即购买"];
	CGFloat buttonH = 50;
	CGFloat buttonW = SCREEN_WIDTH / titles.count;
	CGFloat buttonY = SCREEN_HEIGHT * 0.8 - buttonH;
	for (NSInteger i = 0; i < titles.count; i++) {
		UIButton *buttton = [UIButton buttonWithType:UIButtonTypeCustom];
		[buttton setTitle:titles[i] forState:0];
		buttton.backgroundColor = (i == 0) ? [UIColor redColor] : [UIColor orangeColor];
		CGFloat buttonX = buttonW * i;
		buttton.tag = i;
		buttton.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
		[self.view addSubview:buttton];
	}
	
	UILabel *numLabel = [[UILabel alloc] init];
	numLabel.text = @"数量";
	numLabel.font = [UIFont systemFontOfSize:14.0f];
	[self.view addSubview:numLabel];
	numLabel.frame = CGRectMake(DCMargin, SCREEN_HEIGHT * 0.8 - 90, 50, 35);
	
	
	PPNumberButton *numberButton = [PPNumberButton numberButtonWithFrame:CGRectMake(CGRectGetMaxX(numLabel.frame), numLabel.dc_y, 110, numLabel.dc_height)];
	numberButton.shakeAnimation = YES;
	numberButton.minValue = 1;
	numberButton.inputFieldFont = 23;
	numberButton.increaseTitle = @"＋";
	numberButton.decreaseTitle = @"－";
	numberButton.currentNumber = 1;
	
	WEAKSELF(weakSelf);
	numberButton.resultBlock = ^(NSInteger num ,BOOL increaseStatus){
		weakSelf.num = num;
	};
	[self.view addSubview:numberButton];
}


#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	DCFeatureChoseTopCell *cell = [tableView dequeueReusableCellWithIdentifier:DCFeatureChoseTopCellID];
	[cell.goodsImageView sd_setImageWithURL:[NSURL URLWithString:_goodImageView]];
	cell.priceLabel.text = @"￥12";
	cell.chooseAttLabel.text = @"有货";
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	
	WEAKSELF(weakSelf);
	cell.crossButtonClickBlock = ^{
		[weakSelf dismissViewControllerAnimated:YES completion:nil];
	};
	
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 100;
}

@end
