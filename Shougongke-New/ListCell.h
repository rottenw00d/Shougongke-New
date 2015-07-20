//
//  ListCell.h
//  Shougongke-New
//
//  Created by qianfeng on 15/7/16.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListModel.h"
@interface ListCell : UITableViewCell
@property (nonatomic,strong) ListModel *model;
+(id)appCellWithTableView:(UITableView*)tableView;
@end
