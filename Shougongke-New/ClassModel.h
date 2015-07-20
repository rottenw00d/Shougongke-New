//
//  ClassModel.h
//  Shougongke-New
//
//  Created by qianfeng on 15/7/15.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassModel : NSObject
//"id": "761",
//"subject": "Felicia软笔书法第一弹丨楷书基本笔画",
//"host_pic": "http://img5.shougongke.com/Public/data/hand_class/201507/14/main/143684028013618725_66096_593.jpg"
@property (nonatomic,copy)NSString *cid;
@property (nonatomic,copy)NSString *subject;
@property (nonatomic,copy)NSString *host_pic;

+(id)modelWithDic:(NSDictionary*)dic;
-(id)initWithDict:(NSDictionary*)dict;
@end
