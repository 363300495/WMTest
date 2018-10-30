

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.EmptyDataSetShouldDisplay = NO;

    self.view.backgroundColor = [UIColor colorWithHexString:BACKGROUND_COLOR];
	
    //解决隐藏navigaitioinbar返回手势失效的问题
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;

    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    self.naviBar = [BaseNavigationBar navigationBar];
    self.naviBar.back_btn.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.naviBar];
	
	WEAKSELF(weakSelf);
	
	[self.naviBar mas_makeConstraints:^(MASConstraintMaker *make) {
		make.leading.equalTo(weakSelf.view);
		make.trailing.equalTo(weakSelf.view);
		make.top.equalTo(weakSelf.view);
		make.height.equalTo(@(SafeAreaTopHeight));
	}];
}


@end
