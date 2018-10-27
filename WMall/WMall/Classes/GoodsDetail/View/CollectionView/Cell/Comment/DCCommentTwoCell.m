//
//  DCCommentTwoCell.m
//  WMall
//
//  Created by tom on 2018/10/20.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "DCCommentTwoCell.h"

@interface DCCommentTwoCell ()

/* 头像 */
@property (nonatomic, strong) UIImageView *iconImageView;
/* 名字 */
@property (nonatomic, strong) UILabel *nameLabel;
/* 评论内容 */
@property (nonatomic, strong) UILabel *contentLabel;
/* 时间 */
@property (nonatomic, strong) UILabel *timeLabel;

@end

@implementation DCCommentTwoCell

- (instancetype)initWithFrame:(CGRect)frame {
	
	if (self = [super initWithFrame:frame]) {
		[self setupView];
	}
	return self;
}

- (void)setupView {
	
	self.iconImageView = [[UIImageView alloc] init];
	self.iconImageView.image = [UIImage imageNamed:@"icon"];
	self.iconImageView.layer.masksToBounds = YES;
	self.iconImageView.layer.cornerRadius = 15;
	[self.contentView addSubview:self.iconImageView];
	
	self.nameLabel = [[UILabel alloc] init];
	self.nameLabel.text = @"夜幕";
	self.nameLabel.font = [UIFont systemFontOfSize:11.0f];
	[self.contentView addSubview:self.nameLabel];
	
	self.contentLabel = [[UILabel alloc] init];
	self.contentLabel.text = @"如果项目对你有帮助，别忘了点星支持下";
	self.contentLabel.font = [UIFont systemFontOfSize:12.0f];
	[self.contentView addSubview:self.contentLabel];
	
	self.timeLabel = [[UILabel alloc] init];
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	formatter.dateFormat = @"YY-MM-dd";
	NSString *currentDateStr = [formatter stringFromDate:[NSDate date]];
	self.timeLabel.text = currentDateStr;
	self.timeLabel.font = [UIFont systemFontOfSize:10.0f];
	self.timeLabel.textColor = [UIColor colorWithHexString:LIGHT_COLOR];
	[self.contentView addSubview:self.timeLabel];
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	WEAKSELF(weakSelf);
	[self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(@(DCMargin));
		make.top.equalTo(@(5));
		make.size.mas_equalTo(CGSizeMake(30, 30));
	}];
	
	[self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(weakSelf.iconImageView.mas_right).offset(4);
		make.centerY.equalTo(weakSelf.iconImageView);
	}];
	
	[self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(@(DCMargin));
		make.top.equalTo(weakSelf.iconImageView.mas_bottom).offset(5);
	}];
	
	[self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(@(DCMargin));
		make.top.equalTo(weakSelf.contentLabel.mas_bottom).offset(4);
	}];
}

@end
