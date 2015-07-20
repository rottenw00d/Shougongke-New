//
//  LoginView.h
//  Shougongke-New
//
//  Created by PlanA on 15/7/16.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginView : UIView
+(id)loginView;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *pwd;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@end
