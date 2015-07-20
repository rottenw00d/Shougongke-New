//
//  TeachController.m
//  Shougongke-New
//
//  Created by qianfeng on 15/7/15.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import "TeachController.h"
#import "AFNetworking.h"
#import "Const.h"
#import "ListModel.h"
#import "ListCell.h"
#import "MJRefresh.h"
#import "EditView.h"
@interface TeachController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *toolbar;
@property (weak, nonatomic) IBOutlet UIScrollView *mainScroll;
@property (weak, nonatomic) IBOutlet UIButton *buttonNew;
@property (weak, nonatomic) IBOutlet UIButton *buttonHot;
@property (weak, nonatomic) IBOutlet UIImageView *blanknew;
@property (weak, nonatomic) IBOutlet UITableView *tableViewHot;
@property (weak, nonatomic) IBOutlet UITableView *tableViewNew;
@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,strong) NSMutableArray *dataSource2;
@end

@implementation TeachController
{
    BOOL scale;
    EditView *edit;
}
- (IBAction)editClick:(id)sender {
      edit.hidden=!edit.hidden;
}
- (IBAction)newClick:(id)sender {
    self.buttonHot.selected=NO;
    self.buttonNew.selected=YES;
    self.mainScroll.contentOffset=CGPointMake(0, 0);
        self.blanknew.frame=CGRectMake(8, 88, 170, 2);

}
- (IBAction)hotClick:(id)sender {
    self.buttonHot.selected=YES;
    self.buttonNew.selected=NO;
    self.mainScroll.contentOffset=CGPointMake(375, 0);

        self.blanknew.frame=CGRectMake(196, 88, 170, 2);

}
-(void)requestUrl:(NSString*)urlString andType:(int)type{
//目前type1为new type2为hot
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //此处设置后返回的默认是NSData的数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //转换为词典数据
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        //所有有用数据
        NSDictionary *mainDict  = [dict objectForKey:@"data"];
        
        NSArray *arr=[mainDict objectForKey:@"list"];
        if (type==1){
        for (NSDictionary *dic in arr){
            ListModel *lm=[ListModel modelWithDict:dic];
            [_dataSource addObject:lm];
        }
        }
        else if (type==2){
            for (NSDictionary *dic in arr){
                ListModel *lm=[ListModel modelWithDict:dic];
                [_dataSource2 addObject:lm];
            }
        }
        if (type==1)
        [self.tableViewNew reloadData];
        else if (type==2)
        [self.tableViewHot reloadData];
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView==self.tableViewNew){
    return self.dataSource.count;
    }
    else
        if (tableView==self.tableViewHot){
            return self.dataSource2.count;
        }
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==self.tableViewNew){
        ListCell *cell=[ListCell appCellWithTableView:tableView];
        cell.model=[self.dataSource objectAtIndex:indexPath.row];
        return cell;
    }
    else if (tableView==self.tableViewHot)
    {
        ListCell *cell=[ListCell appCellWithTableView:tableView];
        cell.model=[self.dataSource2 objectAtIndex:indexPath.row];
        return cell;
    }
    return [UITableViewCell new];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _dataSource=[NSMutableArray array];
    _dataSource2=[NSMutableArray array];
    scale=NO;
    edit=[EditView editView];
    [self.view addSubview:edit];
    edit.frame=CGRectMake(0, 90, 375, 100);
    edit.hidden=YES;
    [self.view bringSubviewToFront:self.blanknew];
    self.mainScroll.contentSize=CGSizeMake(750, 527);
    UIImage *sImage=[[UIImage imageNamed:@"tb_teachS"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem.selectedImage=sImage;
    [self.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIColor redColor],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
    [self requestUrl:TEACH_NEW andType:1];
    [self requestUrl:TEACH_HOT andType:2];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView==self.mainScroll&&scale==NO){
        CGPoint center=scrollView.contentOffset;
        self.blanknew.center=CGPointMake(center.x/2+93,89);
    }
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView==self.mainScroll)
    {
        if (scrollView.contentOffset.x==375)
        {
            self.buttonHot.selected=YES;
            self.buttonNew.selected=NO;
        }
        else if (scrollView.contentOffset.x==0)
        {
            self.buttonHot.selected=NO;
            self.buttonNew.selected=YES;
        }
    }
}
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    if (!(velocity.x==CGPointZero.x&&velocity.y==CGPointZero.y)&&velocity.y>0){
        [UIView animateWithDuration:0.5 animations:^{
            self.toolbar.frame=CGRectMake(0, -50, 375, 70);
            if (scrollView==self.tableViewNew)
                self.blanknew.frame=CGRectMake(8, 18, 170, 2);
            else if (scrollView==self.tableViewHot)
                self.blanknew.frame=CGRectMake(196, 18, 170, 2);
            self.mainScroll.frame=CGRectMake(0, 20, 375, 597);
            self.tableViewNew.frame=CGRectMake(0, 0, 375, 597);
            self.tableViewHot.frame=CGRectMake(375, 0, 375, 597);
            scale=YES;
        }];
    }
    else if (!(velocity.x==CGPointZero.x&&velocity.y==CGPointZero.y)&&velocity.y<0){
        [UIView animateWithDuration:0.5 animations:^{
            self.toolbar.frame=CGRectMake(0, 20, 375, 70);
            if (scrollView==self.tableViewNew)
            self.blanknew.frame=CGRectMake(8, 88, 170, 2);
            else if (scrollView==self.tableViewHot)
            self.blanknew.frame=CGRectMake(196, 88, 170, 2);
            self.mainScroll.frame=CGRectMake(0, 90, 375, 577);
            self.tableViewNew.frame=CGRectMake(0, 0, 375, 577);
             self.tableViewHot.frame=CGRectMake(375, 0, 375, 577);
            scale=NO;
        }];
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
