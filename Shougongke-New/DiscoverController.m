//
//  DiscoverController.m
//  Shougongke-New
//
//  Created by qianfeng on 15/7/15.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import "DiscoverController.h"
#import "TableHeaderView.h"
#import "TableFooterView.h"
#import "Const.h"
#import "AFNetworking.h"
#import "DiscoverModels.h"
#import "DiscoverCell.h"
#import "save.h"
#import "MJRefresh.h"
#import "EditView.h"
@interface DiscoverController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,UITabBarControllerDelegate>
@property (weak, nonatomic) IBOutlet UIView *toolBar;
@property (weak, nonatomic) IBOutlet UIScrollView *mainScroll;
@property (weak, nonatomic) IBOutlet UITableView *tableViewDyna;
@property (weak, nonatomic) IBOutlet UIButton *ButtonSpec;
@property (weak, nonatomic) IBOutlet UIButton *ButtonDyna;
@property (weak, nonatomic) IBOutlet UIImageView *blankSpec;
@property (weak, nonatomic) IBOutlet UITableView *tableViewSpec;
@property (weak, nonatomic) IBOutlet UILabel *toolbar_title;

@property (nonatomic,strong) NSMutableArray *slideDS;
@property (nonatomic,strong) NSMutableArray *navDS;
@property (nonatomic,strong) NSMutableArray *AdvDS;
@property (nonatomic,strong) NSMutableArray *classDS;
@property (nonatomic,strong) NSMutableArray *productsDS;
@property (nonatomic,strong) NSMutableArray *darenDS;
@property (nonatomic,strong) NSMutableArray *topicDS;
@property (nonatomic,strong) NSMutableArray *courseDS;
@end

@implementation DiscoverController
{
    UITabBarController *tab;
    TableHeaderView *thv;
    TableFooterView *tfv;
        EditView *edit;
    BOOL scale;
}

- (IBAction)selectClick:(id)sender {
   // self.toolbar_title.text=@"手工客";
    self.ButtonDyna.selected=NO;
    self.ButtonSpec.selected=YES;
    self.mainScroll.contentOffset=CGPointMake(0, 0);
    self.blankSpec.frame=CGRectMake(8, 88, 170, 2);

}
- (IBAction)dynamicClick:(id)sender {
    //    self.toolbar_title.text=@"动态";
    self.ButtonDyna.selected=YES;
    self.ButtonSpec.selected=NO;
    self.mainScroll.contentOffset=CGPointMake(375, 0);
    self.blankSpec.frame=CGRectMake(196, 88, 170, 2);

}
-(void)requestUrl:(NSString*)urlString andType:(int)type{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //此处设置后返回的默认是NSData的数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        //转换为词典数据
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        //所有有用数据
        NSDictionary *mainDict  = [dict objectForKey:@"data"];
        //开始分类处理
        NSArray *slideArr=[mainDict objectForKey:@"slide"];
        NSArray *navArr=[mainDict objectForKey:@"nav"];
        NSArray *advArr=[mainDict objectForKey:@"adv"];
        NSArray *classArr=[mainDict objectForKey:@"classs"];
        NSArray *productArr=[mainDict objectForKey:@"products"];
        NSDictionary *daren=[mainDict objectForKey:@"daren"];
        NSArray *topicArr=[mainDict objectForKey:@"topic"];
        NSArray *courseArr=[mainDict objectForKey:@"course"];
        //转为model 封入数据源
        if (type==1){
            [self.slideDS removeAllObjects];
            [self.navDS removeAllObjects];
            [self.AdvDS removeAllObjects];
            [self.classDS removeAllObjects];
            [self.productsDS removeAllObjects];
            [self.darenDS removeAllObjects];
            [self.topicDS removeAllObjects];
            [self.courseDS removeAllObjects];
        }
        else if (type==2){
     
        }
        for (NSDictionary *dic in slideArr){
            SlideModel *sm=[SlideModel modelWithDic:dic];
            [self.slideDS addObject:sm];
        }
        for (NSDictionary *dic in navArr){
            Nav *nv=[Nav modelWithDic:dic];
            [self.navDS addObject:nv];
        }
        for (NSDictionary *dic in advArr){
            AdvModel *am=[AdvModel modelWithDic:dic];
            [self.AdvDS addObject:am];
        }
        for (NSDictionary *dic in classArr){
            ClassModel *cm=[ClassModel modelWithDic:dic];
            [self.classDS addObject:cm];
        }
        for (NSDictionary *dic in productArr){
            ProductsModel *pm=[ProductsModel modelWithDic:dic];
            [self.productsDS addObject:pm];
        }
        for (NSDictionary *dic in topicArr){
            TopicModel *tm=[TopicModel modelWithDic:dic];
            [self.topicDS addObject:tm];
        }
        for (NSDictionary *dic in courseArr){
            CourseModel *cm=[CourseModel modelWithDic:dic];
            [self.courseDS addObject:cm];
        }
        DarenModel *dm=[DarenModel modelWithDic:daren];
        [self.darenDS addObject:dm];
        
        [self stopRefresh];
        //处理表头
        [thv prepareImages:self.slideDS];
        [thv prepareButton:self.navDS andAdv:self.AdvDS];
        [self.tableViewDyna reloadData];
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[[UITableViewCell alloc]init];
    if (tableView==self.tableViewSpec){
    switch (indexPath.row) {
        case 0:{
            ClassCell *cell=[ClassCell appCellWithTableView:tableView];
            cell.modelArr=self.classDS;
            return cell;
            break;
        }
        case 1:{
            ProductCell *cell=[ProductCell appCellWithTableView:tableView];
            cell.modelArr=self.productsDS;
            return cell;
            break;
        }
        case 2:{
            DarenCell *cell=[DarenCell appCellWithTableView:tableView];
            cell.modelArr=self.darenDS;
            return cell;
            break;
        }
        case 3:{
            TopicCell *cell=[TopicCell appCellWithTableView:tableView];
            cell.modelArr=self.topicDS;
            return cell;
            break;
        }
        case 4:{
            CourseCell *cell=[CourseCell appCellWithTableView:tableView];
            cell.modelArr=self.courseDS;
            return cell;
            break;
        }
        default:
            break;
      }
    }
    cell.textLabel.text=@"本页面接口有问题 先放置";
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView==self.tableViewSpec)
    return 5;
    
    else
        return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==self.tableViewSpec)
    {
        switch (indexPath.row) {
            case 0:
                return 360;
                break;
            case 1:
                return 244;
                break;
            case 2:
                return 222;
                break;
            case 3:
                return 475;
                break;
            case 4:
                return 1530;
                break;
            default:
                break;
        }
    }
    return 50;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView==self.mainScroll&&scale==NO){
        CGPoint center=scrollView.contentOffset;
        self.blankSpec.center=CGPointMake(center.x/2+93,89);
    }
 
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView==self.mainScroll)
    {
        if (scrollView.contentOffset.x==375)
        {
            self.ButtonDyna.selected=YES;
            self.ButtonSpec.selected=NO;
        //    self.toolbar_title.text=@"动态";
        }
        else if (scrollView.contentOffset.x==0)
        {
            self.ButtonDyna.selected=NO;
            self.ButtonSpec.selected=YES;
          //   self.toolbar_title.text=@"手工客";
        }
    }
}
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    if (!(velocity.x==CGPointZero.x&&velocity.y==CGPointZero.y)&&velocity.y>0){
        [UIView animateWithDuration:0.5 animations:^{
            self.toolBar.frame=CGRectMake(0, -50, 375, 70);
            if (scrollView==self.tableViewSpec)
                self.blankSpec.frame=CGRectMake(8, 18, 170, 2);
            else if (scrollView==self.tableViewDyna)
                self.blankSpec.frame=CGRectMake(196, 18, 170, 2);
            self.mainScroll.frame=CGRectMake(0, 20, 375, 597);
            self.tableViewSpec.frame=CGRectMake(0, 0, 375, 597);
            scale=YES;
        }];
    }
    else if (!(velocity.x==CGPointZero.x&&velocity.y==CGPointZero.y)&&velocity.y<0){
        [UIView animateWithDuration:0.5 animations:^{
            self.toolBar.frame=CGRectMake(0, 20, 375, 70);
            if (scrollView==self.tableViewSpec)
                self.blankSpec.frame=CGRectMake(8, 88, 170, 2);
            else if (scrollView==self.tableViewDyna)
            self.blankSpec.frame=CGRectMake(196, 88, 170, 2);
            
            self.mainScroll.frame=CGRectMake(0, 90, 375, 577);
                    self.tableViewSpec.frame=CGRectMake(0, 0, 375, 577);
            scale=NO;
        }];
    }
}
-(void)loadNewData{
    [self requestUrl:DISCOVER_URL andType:1];
}
-(void)stopRefresh{
    [self.tableViewSpec reloadData];
    [self.tableViewSpec.header endRefreshing];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    thv=[TableHeaderView tableHeaderView];
    tfv=[TableFooterView tableFooterView];
    self.tableViewSpec.tableFooterView=tfv;
    self.tableViewSpec.tableHeaderView=thv;
    scale=NO;
    edit=[EditView editView];
    [self.view addSubview:edit];
    edit.frame=CGRectMake(0, 90, 375, 100);
    edit.hidden=YES;
    [self.view bringSubviewToFront:self.blankSpec];

    self.mainScroll.contentSize=CGSizeMake(750, 527);
    
    tab=self.tabBarController;
    tab.delegate=self;
    save *s=[save shareSave];
    s.vc=self;
    
    self.tableViewSpec.header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    [self initDataSource];
    
    UIImage *sImage=[[UIImage imageNamed:@"tb_findS"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem.selectedImage=sImage;
    [self.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIColor redColor],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    //网络请求
    [self requestUrl:DISCOVER_URL andType:1];
}
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    if (![NSStringFromClass([viewController class])isEqualToString:@"UINavigationController"]){
        save *s=[save shareSave];
        s.vc=viewController;
    }
}
- (IBAction)editClick:(id)sender {
    edit.hidden=!edit.hidden;
}

-(void)initDataSource{
    self.slideDS=[NSMutableArray array];
    self.navDS=[NSMutableArray array];
    self.AdvDS=[NSMutableArray array];
    self.classDS=[NSMutableArray array];
    self.productsDS=[NSMutableArray array];
    self.darenDS=[NSMutableArray array];
    self.topicDS=[NSMutableArray array];
    self.courseDS=[NSMutableArray array];
}


@end
