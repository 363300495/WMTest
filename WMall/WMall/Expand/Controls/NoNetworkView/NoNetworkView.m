//
//  NoNetworkView.m
//  WMall
//
//  Created by tom on 2018/10/9.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "NoNetworkView.h"

@implementation NoNetworkView

- (void)awakeFromNib {
	[super awakeFromNib];
	
	self.backgroundColor = [UIColor colorWithHexString:BACKGROUND_COLOR];
	
	self.networkButton.layer.cornerRadius = 5;
	self.networkButton.layer.borderWidth = 1;
	self.networkButton.layer.borderColor = [UIColor colorWithHexString:@"#ea3d3a"].CGColor;
	[self.networkButton setTitleColor:[UIColor colorWithHexString:@"#ea3d3a"] forState:UIControlStateNormal];
}

- (IBAction)refreshNetwork:(id)sender {
	
	if (self.refreshNetwork) {
		self.refreshNetwork(self);
	}
}


@end
