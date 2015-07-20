//
//  LoginView.m
//  Shougongke-New
//
//  Created by PlanA on 15/7/16.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import "LoginView.h"
@interface LoginView()



@end
@implementation LoginView
+(id)loginView{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]lastObject];
}
-(void)willMoveToSuperview:(UIView *)newSuperview{
    self.loginBtn.layer.cornerRadius=10;
    self.loginBtn.layer.masksToBounds=YES;
}

@end
