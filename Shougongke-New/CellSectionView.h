//
//  CellSectionView.h
//  Shougongke-New
//
//  Created by qianfeng on 15/7/17.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryGroupModel.h"
@interface CellSectionView : UIView
+(id)cellSectionView;
@property (nonatomic,strong) CategoryGroupModel *model;
@end
