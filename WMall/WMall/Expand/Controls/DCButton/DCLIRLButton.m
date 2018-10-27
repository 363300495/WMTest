//
//  DCLIRLButton.m
//  CDDMall
//
//  Created by apple on 2017/6/27.
//  Copyright © 2017年 RocketsChen. All rights reserved.
//

#import "DCLIRLButton.h"

@interface DCLIRLButton ()

@end

@implementation DCLIRLButton

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
	
    }
    return self;
}

- (void)layoutSubviews {
	
    [super layoutSubviews];
    
    [self.titleLabel sizeToFit];
    self.titleLabel.dc_centerX = self.dc_width * 0.55;
    self.imageView.dc_x = self.titleLabel.dc_x - self.imageView.dc_width - 5;
}

@end
