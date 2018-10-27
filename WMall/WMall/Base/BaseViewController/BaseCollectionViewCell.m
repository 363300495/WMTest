

#import "BaseCollectionViewCell.h"

@implementation BaseCollectionViewCell

//返回重用标示
+ (NSString *)indentify {
	
    return NSStringFromClass([self class]);
}

//创建cell
+ (UINib *)newCell {
	
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
    return nib;
}


@end
