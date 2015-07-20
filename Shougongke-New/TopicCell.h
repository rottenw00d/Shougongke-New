//
//  TopicCell.h
//  Shougongke-New
//
//  Created by qianfeng on 15/7/15.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicModel.h"
@interface TopicCell : UITableViewCell
@property (nonatomic,strong) TopicModel *model;
@property (nonatomic,strong)NSArray *modelArr;
+(id)appCellWithTableView:(UITableView*)tableView;
@end
