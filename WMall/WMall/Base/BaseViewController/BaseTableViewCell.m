

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}

//返回重用标示
+ (NSString *)indentify {
	
    return NSStringFromClass([self class]);
}
//创建cell
+ (id)newCell {
	
    NSArray *array  = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    return array[0];
}


@end
