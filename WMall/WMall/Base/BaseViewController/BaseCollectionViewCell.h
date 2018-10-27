
#import <UIKit/UIKit.h>

@interface BaseCollectionViewCell : UICollectionViewCell

//返回重用标示
+ (NSString *)indentify;

//创建xib中的cell
+ (UINib *)newCell;

@end
