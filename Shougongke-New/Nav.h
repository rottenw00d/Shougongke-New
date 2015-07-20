//
//  Nav.h
//  Shougongke-New
//
//  Created by qianfeng on 15/7/15.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Nav : NSObject
//"subject": "达人",
//"host_pic": "http://img2.shougongke.com/Public/data/temp_img/142552045130640.jpg",
//"itemtype": "nav_daren"
@property (nonatomic,copy) NSString *subject;//标题
@property (nonatomic,copy) NSString *host_pic;//图片
@property (nonatomic,copy) NSString *itemtype;//类型
+(id)modelWithDic:(NSDictionary*)dic;
-(id)initWithDict:(NSDictionary*)dict;
@end
