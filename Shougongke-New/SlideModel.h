//
//  SlideModel.h
//  Shougongke-New
//
//  Created by qianfeng on 15/7/15.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SlideModel : NSObject
//"host_pic": "http://img5.shougongke.com/Public/data/version/201507/143684178776026.jpg",
//"subject": "如果晒早餐是一种“病”，那么我想大“病”一场 ",
//"step_count": "",
//"user_name": "手工客官方",
//"hand_daren": "0",
//"itemtype": "event",
//"hand_id": "48",
//"is_expired": "1"
@property (nonatomic,copy)NSString *host_pic;//轮播图片
@property (nonatomic,copy)NSString *subject;//文字介绍
@property (nonatomic,copy)NSString *step_count;
@property (nonatomic,copy)NSString *user_name;
@property (nonatomic,copy)NSString *itemtype;//类型
@property (nonatomic,copy)NSString *hand_id;
@property (nonatomic,copy)NSString *is_expired;//是否过期
@property (nonatomic,copy)NSString *hand_daren;
+(id)modelWithDic:(NSDictionary*)dic;
-(id)initWithDict:(NSDictionary*)dict;
@end
