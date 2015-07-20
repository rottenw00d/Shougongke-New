//
//  ClassCell.h
//  Shougongke-New
//
//  Created by qianfeng on 15/7/15.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassModel.h"
@interface ClassCell : UITableViewCell
@property (nonatomic,strong) ClassModel *model;
@property (nonatomic,strong)NSArray *modelArr;
+(id)appCellWithTableView:(UITableView*)tableView;
@end
