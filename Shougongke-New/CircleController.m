//
//  CircleController.m
//  Shougongke-New
//
//  Created by qianfeng on 15/7/15.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import "CircleController.h"
#import "LoginView.h"
#import "save.h"
@interface CircleController ()<UIScrollViewDelegate,UITabBarControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CircleController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor=[UIColor redColor];
    LoginView *login=[LoginView loginView];
    self.tableView.tableHeaderView=login;

    
    //用户名
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 44, 50)];
    view.backgroundColor=[UIColor whiteColor];
    UIImageView *imageViewU=[[UIImageView alloc]initWithFrame:CGRectMake(8, 20, 20, 20)];
    [view addSubview:imageViewU];
    login.userName.leftViewMode= UITextFieldViewModeAlways;
    imageViewU.image=[[UIImage imageNamed:@"login_header"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    login.userName.leftView=view;
    login.userName.layer.borderWidth=0.25;
    login.userName.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    //密码
    UIView *view1=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 44, 50)];
    view1.backgroundColor=[UIColor whiteColor];
    UIImageView *imageViewP=[[UIImageView alloc]initWithFrame:CGRectMake(8, 20, 20, 20)];
    [view1 addSubview:imageViewP];
    login.pwd.leftViewMode= UITextFieldViewModeAlways;
    imageViewP.image=[[UIImage imageNamed:@"lock"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    login.pwd.leftView=view1;
    login.pwd.layer.borderWidth=0.25;
    login.pwd.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    //bottomBar
    UIView *bottomView=[[UIView alloc]initWithFrame:CGRectMake(0, 627, 375, 40)];
    bottomView.backgroundColor=[UIColor whiteColor];
    bottomView.layer.borderWidth=0.5;
    bottomView.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, 0, 40, 40);
    [button setImage:[UIImage imageNamed:@"toolbarLeftD"] forState:UIControlStateNormal];
    [bottomView addSubview:button];
    [button addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bottomView];
    
}
-(void)doBack:(UIButton*)button{
    save *s=[save shareSave];
    NSLog(@"%@",NSStringFromClass([s.vc class]));
    self.tabBarController.selectedViewController=s.vc;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
