//
//  MineController.m
//  Shougongke-New
//
//  Created by qianfeng on 15/7/17.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import "MineController.h"
#import "NewsView.h"
@interface MineController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *mainScroll;
@property (weak, nonatomic) IBOutlet UITableView *tableViewNews;
@property (weak, nonatomic) IBOutlet UITableView *tableViewSet;

@property (weak, nonatomic) IBOutlet UIImageView *blank;
@property (weak, nonatomic) IBOutlet UIButton *btnNews;
@property (weak, nonatomic) IBOutlet UIButton *btnSelf;

@end

@implementation MineController
- (IBAction)newsClick:(id)sender {
    self.btnNews.selected=NO;
    self.btnSelf.selected=YES;
    self.mainScroll.contentOffset=CGPointMake(0, 0);
    self.blank.frame=CGRectMake(8, 68, 170, 2);
}
- (IBAction)setClick:(id)sender {
    self.btnNews.selected=YES;
    self.btnSelf.selected=NO;
    self.mainScroll.contentOffset=CGPointMake(375, 0);
    self.blank.frame=CGRectMake(196, 68, 170, 2);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainScroll.contentSize=CGSizeMake(750, 527);
    NewsView *nv=[NewsView newsView];
    self.tableViewNews.tableHeaderView=nv;
    [self.view bringSubviewToFront:self.blank];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView==self.mainScroll){
        CGPoint center=scrollView.contentOffset;
        self.blank.center=CGPointMake(center.x/2+93,69);
    }
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView==self.mainScroll)
    {
        if (scrollView.contentOffset.x==375)
        {
            self.btnNews.selected=NO;
            self.btnSelf.selected=YES;
        }
        else if (scrollView.contentOffset.x==0)
        {
            self.btnNews.selected=YES;
            self.btnSelf.selected=NO;
        }
    }
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
