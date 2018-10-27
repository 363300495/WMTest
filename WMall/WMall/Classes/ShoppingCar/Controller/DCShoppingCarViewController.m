//
//  DCShoppingCarViewController.m
//  WMall
//
//  Created by tom on 2018/10/5.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCShoppingCarViewController.h"
#import "DCShoppingCarCell.h"
#import "DCShoppingCarItem.h"


@interface DCShoppingCarViewController () <UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataList;

@end

@implementation DCShoppingCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self loadShopCarData];
}

- (void)setupView {
	
	self.naviBar.hiddenBackBtn = YES;
	self.naviBar.title = @"购物车";
	
	[self.view addSubview:self.tableView];
}

- (void)refreshData:(UIView *)networkView {
	
	if ([CommonUtil hasNetwork]) {
		
		[networkView removeFromSuperview];
		networkView = nil;
		
		[self loadShopCarData];
	}
}

- (void)loadShopCarData {
	
	NSDictionary *pragram = @{@"pagen":@"4",@"pages":@"1"};
	[HttpServiceManager POST:HTTP_HOME parameters:pragram success:^(id responseObject) {
		
		self.EmptyDataSetShouldDisplay = YES;
		
		NSString *errorCode = responseObject[@"errorCode"];
		
		if ([errorCode isEqualToString:@"0"]) {
			
			NSDictionary *data = responseObject[@"data"];
			NSArray *jd = data[@"jd"];
			
			if (IsArrEmpty(jd)) {
				return ;
			}
//			self.dataList = [DCShoppingCarItem mj_objectArrayWithKeyValuesArray:jd];
			[self.tableView reloadData];
		}
	} failure:^(NSError *error) {
	}];
}


- (NSMutableArray *)dataList {
	if (!_dataList) {
		_dataList = [NSMutableArray array];
	}
	return _dataList;
}

- (UITableView *)tableView {
	if (!_tableView) {
		_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, SafeAreaTopHeight, SCREEN_WIDTH, SCREEN_HEIGHT - SafeAreaTopHeight - SafeAreaBottomHeight)];
		_tableView.backgroundColor = [UIColor colorWithHexString:BACKGROUND_COLOR];
		_tableView.delegate = self;
		_tableView.dataSource = self;
		_tableView.emptyDataSetSource = self;
		_tableView.emptyDataSetDelegate = self;
		_tableView.showsVerticalScrollIndicator = NO;
		_tableView.separatorStyle = UITableViewCellSelectionStyleNone;
		_tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
		
	}
	return _tableView;
}

#pragma mark - tableviewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	DCShoppingCarCell *cell = [tableView dequeueReusableCellWithIdentifier:[DCShoppingCarCell indentify]];
	if (!cell) {
		cell = [DCShoppingCarCell newCell];
	}
	cell.shoppingCarItem = self.dataList[indexPath.row];
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	DCShoppingCarItem *shoppingCarItem = self.dataList[indexPath.row];
	NSString *title = shoppingCarItem.title;
	CGFloat height = [CommonUtil dc_calculateTextHeightWithText:title textFont:14 textMaxW:SCREEN_WIDTH - 80];
	
	return (SCREEN_WIDTH - 20) * 9 / 20 + height + 40;
}


#pragma mark - DZNEmptyDataSetSource
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
	
	NSString *text = @"针对不同业务逻辑做不同配置";
	
	NSDictionary *attributes = @{NSFontAttributeName : [UIFont systemFontOfSize:16*kWJFontCoefficient],NSForegroundColorAttributeName : [UIColor colorWithRed:0.78 green:0.78 blue:0.78 alpha:1.00]};
	
	return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

@end
