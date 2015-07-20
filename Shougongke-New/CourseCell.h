//
//  CourseCell.h
//  Shougongke-New
//
//  Created by qianfeng on 15/7/15.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CourseModel.h"
@interface CourseCell : UITableViewCell
@property (nonatomic,strong) CourseModel *model;
@property (nonatomic,strong)NSArray *modelArr;
+(id)appCellWithTableView:(UITableView*)tableView;
@end
