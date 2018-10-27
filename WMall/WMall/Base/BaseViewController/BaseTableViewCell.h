

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell


//返回重用标示
+ (NSString *)indentify;

//创建xib中的cell
+ (id)newCell;



@end
