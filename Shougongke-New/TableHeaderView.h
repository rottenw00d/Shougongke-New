//
//  TableHeaderView.h
//  Shougongke-New
//
//  Created by qianfeng on 15/7/15.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableHeaderView : UIView
+(id)tableHeaderView;
-(void)prepareImages:(NSArray*)images;
-(void)prepareButton:(NSArray*)nav andAdv:(NSArray*)adv;
@end
