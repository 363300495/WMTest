

#import <UIKit/UIKit.h>

@interface BaseTabBarViewController : UITabBarController

#pragma mark 添加子导航控制器
- (void)addChildNavigationController:(Class)navigationControllerClass
                  rootViewController:(Class)rootViewControllerClass
                     tabBarItemTitle:(NSString *)tabBarItemTitle
               tabBarNormalImageName:(NSString *)normalImageName
               tabBarSelectImageName:(NSString *)selectImageName;


@end
