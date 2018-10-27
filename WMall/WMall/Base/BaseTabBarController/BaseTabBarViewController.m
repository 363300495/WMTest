

#import "BaseTabBarViewController.h"

@interface BaseTabBarViewController () <UITabBarControllerDelegate>

@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark 添加导航控制器
- (void)addChildNavigationController:(Class)navigationControllerClass
                  rootViewController:(Class)rootViewControllerClass
                     tabBarItemTitle:(NSString *)tabBarItemTitle
               tabBarNormalImageName:(NSString *)normalImageName
               tabBarSelectImageName:(NSString *)selectImageName {
    // 创建视图控制器
    UIViewController *rootViewController = [[rootViewControllerClass alloc] init];
    // 创建导航控制器
    BaseNavigationController *naviViewController = [[navigationControllerClass alloc] initWithRootViewController:rootViewController];
	
    CGSize imageSize = CGSizeMake(49, 49);
    naviViewController.tabBarItem.image = [[[UIImage imageNamed:normalImageName] imageByScalingProportionallyToSize:imageSize] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    naviViewController.tabBarItem.selectedImage = [[[UIImage imageNamed:selectImageName] imageByScalingProportionallyToSize:imageSize] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    naviViewController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    // 主标签控制器中添加子导航控制器
    [self addChildViewController:naviViewController];
    
    //设置tabBar不透明
    self.tabBar.translucent = NO;
    
    // 设置底部UITabBarControllerDelegate代理
    rootViewController.tabBarController.delegate = self;
}


#pragma mark - UITabBarControllerDelegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
	//点击tabBarItem动画
	[self tabBarButtonClick:[self getTabBarButton]];
}

- (UIControl *)getTabBarButton {
	NSMutableArray *tabBarButtons = [[NSMutableArray alloc] initWithCapacity:0];
	
	for (UIView *tabBarButton in self.tabBar.subviews) {
		if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]){
			[tabBarButtons addObject:tabBarButton];
		}
	}
	UIControl *tabBarButton = [tabBarButtons objectAtIndex:self.selectedIndex];
	
	return tabBarButton;
}

#pragma mark - 点击动画
- (void)tabBarButtonClick:(UIControl *)tabBarButton {
	
	for (UIView *imageView in tabBarButton.subviews) {
		if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
			//需要实现的帧动画,这里根据自己需求改动
			CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
			animation.keyPath = @"transform.scale";
			animation.values = @[@1.0,@1.1,@0.9,@1.0];
			animation.duration = 0.3;
			animation.calculationMode = kCAAnimationCubic;
			//添加动画
			[imageView.layer addAnimation:animation forKey:nil];
		}
	}
}

@end
