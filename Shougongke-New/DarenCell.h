//
//  DarenCell.h
//  Shougongke-New
//
//  Created by qianfeng on 15/7/15.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DarenModel.h"
@interface DarenCell : UITableViewCell
@property (nonatomic,strong) DarenModel *model;
@property (nonatomic,strong)NSArray *modelArr;
+(id)appCellWithTableView:(UITableView*)tableView;
@end
