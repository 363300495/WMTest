

#import "BaseNavigationBar.h"

@implementation BaseNavigationBar

+ (instancetype)navigationBar {
    
    return [[[NSBundle mainBundle] loadNibNamed:@"BaseNavigationBar" owner:nil options:nil] firstObject];
}

- (void)awakeFromNib {
    
    [super awakeFromNib];
    self.detail_btn.hidden = YES;
    //添加点击事件
    [self sendSubviewToBack:self.mineBgImageview];
    UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(back_title:)];
    self.back_title.userInteractionEnabled = YES;
    [self.back_title addGestureRecognizer:ges];
    self.backgroundColor = [UIColor clearColor];
    self.title_label.textColor = [UIColor whiteColor];
    self.back_title.textColor = [UIColor whiteColor];
    [self.detail_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}


- (UIViewController *)viewController {
    
    UIResponder *nextResponder = self;
    
    do {
        nextResponder = [nextResponder nextResponder];
        
        if ([nextResponder isKindOfClass:[UIViewController class]])
            return (UIViewController*)nextResponder;
        
    } while (nextResponder != nil);
    
    return nil;
}


#pragma mark - 返回按钮
- (IBAction)back_btn:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(backBtnClick)]) {
        [self.delegate backBtnClick]; 
    }else{
        UIViewController *viewController = self.viewController;
        if (viewController.navigationController) {
            [viewController.navigationController popViewControllerAnimated:YES];
        }else {
            [viewController dismissViewControllerAnimated:YES completion:nil];
        }
    }
    //    if (self.back) {
    //        self.back();
    //    }else {
    //        UIViewController *viewController = self.viewController;
    //
    //        if (viewController.navigationController) {
    //            [viewController.navigationController popViewControllerAnimated:YES];
    //        }else {
    //            [viewController dismissViewControllerAnimated:YES completion:nil];
    //        }
    //    }
}


- (void)back_title:(UITapGestureRecognizer *)ges {
    
    if ([self.delegate respondsToSelector:@selector(backBtnClick)]) {
        [self.delegate backBtnClick];
    }else{
        UIViewController *viewController = self.viewController;
        if (viewController.navigationController) {
            [viewController.navigationController popViewControllerAnimated:YES];
        }else {
            [viewController dismissViewControllerAnimated:YES completion:nil];
        }
    }
}


//设置返回的标题
- (void)setBackTitle:(NSString *)backTitle {
    
    _backTitle = backTitle;
    self.back_title.hidden = NO;
    self.back_title.text = _backTitle;
}

- (void)setBackImage:(UIImage *)backImage {
    
    _backImage = backImage;
    [self.back_btn setImage:backImage forState:UIControlStateNormal];
}

- (void)setHiddenBackBtnImage:(BOOL)hiddenBackBtnImage {
    
    _hiddenBackBtnImage = hiddenBackBtnImage;
    if (_hiddenBackBtnImage) {
        self.back_btn.hidden = YES;
        self.backtitle_leading.constant = -30;
    }
}

- (void)setHiddenBackBtn:(BOOL)hiddenBackBtn {
    _hiddenBackBtn = hiddenBackBtn;
    self.back_btn.hidden = hiddenBackBtn;
}



#pragma mark - 标题
- (void)setTitle:(NSString *)title {
    
    _title = title;
    self.title_label.text = _title;
}

#pragma mark - 右边详情按钮
//设置详情按钮的标题
- (void)setDetailTitle:(NSString *)detailTitle {
    
    _detailTitle = detailTitle;
    [self.detail_btn setTitle:_detailTitle forState:UIControlStateNormal];
}

//设置详情按钮的图片
- (void)setDetailImage:(UIImage *)detailImage {
    
    _detailImage = detailImage;
    [self.detail_btn setBackgroundImage:_detailImage forState:UIControlStateNormal];
}

- (void)setHiddenDetailBtn:(BOOL)hiddenDetailBtn {
    
    _hiddenDetailBtn = hiddenDetailBtn;
    self.detail_btn.hidden = _hiddenDetailBtn;
}



- (IBAction)detail_btn:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(detailBtnClick:)]) {
        [self.delegate detailBtnClick:sender];
    }
//    if (self.detail) {
//        self.detail();
//    }else {
//        return;
//    }
}


#pragma mark - 设置渐变颜色
- (void)setShowGradientColor:(BOOL)showGradientColor {
	
	_showGradientColor = showGradientColor;
	if (_showGradientColor) {
		[self setGradientColor];
	}
}

//设置渐变色
- (void)setGradientColor {
	
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    
    gradient.startPoint = CGPointMake(0, 0);
    gradient.endPoint = CGPointMake(1, 0);
    
    UIColor *statColor = [UIColor colorWithRed:244/255. green:91/255. blue:80/255. alpha:1.];
    UIColor *endColor = [UIColor colorWithRed:244/255. green:165/255. blue:80/255. alpha:1.];

    
    gradient.colors = [NSArray arrayWithObjects:
                       (id)statColor.CGColor,
                       (id)endColor.CGColor,
                       nil];
    [self.layer insertSublayer:gradient atIndex:0];
}


@end
