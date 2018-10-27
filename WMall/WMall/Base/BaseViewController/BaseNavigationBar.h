

#import <UIKit/UIKit.h>

@protocol BaseNavigationDelegate <NSObject>

@optional

- (void)backBtnClick;
- (void)detailBtnClick:(UIButton *)sender;

@end

typedef void(^BackButtonClick)(void);

typedef void(^DetailButtonClick)(void);


@interface BaseNavigationBar : UIView


+ (instancetype)navigationBar;


//返回按钮
@property (weak, nonatomic) IBOutlet UIButton *back_btn;
//返回按钮标题
@property (weak, nonatomic) IBOutlet UILabel *back_title;
@property (nonatomic, strong) NSString *backTitle;
@property (nonatomic, strong) UIImage *backImage;
@property (nonatomic, assign) BOOL hiddenBackBtnImage;
//隐藏返回按钮
@property (nonatomic,assign) BOOL hiddenBackBtn;
- (IBAction)back_btn:(UIButton *)sender;



//标题
@property (weak, nonatomic) IBOutlet UILabel *title_label;
@property (strong, nonatomic) NSString *title;



//右边详情按钮
@property (weak, nonatomic) IBOutlet UIButton *detail_btn;
@property (nonatomic, strong) NSString *detailTitle;
@property (nonatomic, strong) UIImage *detailImage;
//隐藏详情按钮
@property (nonatomic,assign) BOOL hiddenDetailBtn;
- (IBAction)detail_btn:(UIButton *)sender;



@property (nonatomic, assign) id<BaseNavigationDelegate> delegate;

@property (nonatomic, assign) BackButtonClick back;

@property (nonatomic, assign) DetailButtonClick detail;


//返回标题左侧约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *backtitle_leading;

@property (weak, nonatomic) IBOutlet UIView *lineView;


//背景图片
@property (weak, nonatomic) IBOutlet UIImageView *mineBgImageview;

//设置渐变颜色
@property (nonatomic, assign) BOOL showGradientColor;

@end
