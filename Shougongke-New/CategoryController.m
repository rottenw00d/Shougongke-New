//
//  CategoryController.m
//  Shougongke-New
//
//  Created by qianfeng on 15/7/16.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import "CategoryController.h"
#import "Const.h"
#import "AFNetworking.h"
#import "CategoryModel.h"
#import "CategoryGroupModel.h"
#import "UIImageView+AFNetworking.h"
#import "CellSectionView.h"
@interface CategoryController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;
@end

@implementation CategoryController

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    CategoryGroupModel *tmp=[self.dataSource objectAtIndex:indexPath.section];
    CategoryModel *model=[tmp.childArr objectAtIndex:indexPath.row];
    cell.textLabel.text=model.name;
    cell.textLabel.font=[UIFont systemFontOfSize:13];
    return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    CategoryGroupModel *cgm=self.dataSource[section];
    if (cgm.isOpen)
    {
        return cgm.childArr.count;
    }
    else {
        return 0;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CategoryGroupModel *cgm=[self.dataSource objectAtIndex:section];
    CellSectionView *cv=[CellSectionView cellSectionView];
    cv.model=cgm;
    return cv;
}

-(void)requestUrl:(NSString*)urlString{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //此处设置后返回的默认是NSData的数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        //转换为词典数据
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        //所有有用数据
        NSArray *mainArr  = [dict objectForKey:@"data"];
        for (NSDictionary *dic in mainArr){
            CategoryGroupModel *cgm=[CategoryGroupModel modelWithDict:dic];
            [self.dataSource addObject:cgm];
        }
        [self.tableView reloadData];
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataSource=[NSMutableArray array];
    [self requestUrl:TYPES_URL];
}
- (IBAction)backClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
