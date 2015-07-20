//
//  CourseModel.h
//  Shougongke-New
//
//  Created by qianfeng on 15/7/15.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CourseModel : NSObject
//"hand_id": "216215",
//"subject": "开放式sandwich",
//"host_pic": "http://img5.shougongke.com/public/data/hand/201507/15/host/143694214518730_593.jpg",
//"user_name": "山谷手作",
//"user_id": "906175",
//"avatar": "http://img1.wowsai.com/bridge/data/avatar/000/90/61/75_avatar_big.jpg?skey=f1a3a",
//"is_daren": "1",
//"page": "1"
@property (nonatomic,copy)NSString *hand_id;//什么id
@property (nonatomic,copy)NSString *subject;//标题
@property (nonatomic,copy)NSString *host_pic;//图片地址
@property (nonatomic,copy)NSString *user_name;//用户名
@property (nonatomic,copy)NSString *user_id;//用户id
@property (nonatomic,copy)NSString *avatar;//详情图片
@property (nonatomic,copy)NSString *is_daren;//是否为达人
@property (nonatomic,copy)NSString *page;//页数
+(id)modelWithDic:(NSDictionary*)dic;
-(id)initWithDict:(NSDictionary*)dict;
@end
