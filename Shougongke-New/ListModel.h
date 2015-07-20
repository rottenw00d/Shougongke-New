//
//  ListModel.h
//  Shougongke-New
//
//  Created by qianfeng on 15/7/16.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListModel : NSObject
//"hand_daren": "0",
//"is_guan": "0",
//"hand_id": "216615",
//"user_id": "14923242",
//"subject": "袜子玩偶第三波",
//"add_time": "刚刚发布",
//"host_pic_s": "http://img2.shougongke.com/public/data/hand/201507/16/host/143703476497132_593.jpg",
//"host_pic_ss": "http://img2.shougongke.com/public/data/hand/201507/16/host/143703476497132_228.jpg",
//"user_name": "Panda只爱瘦竹子",
//"face_pic": "http://img1.wowsai.com/bridge/data/avatar/014/92/32/42_avatar_big.jpg?skey=29421",
//"view": "6",
//"view_o": "0",
//"share_url": "http://www.shougongke.com/index.php?m=Course&a=share&id=216615",
//"collect": "0",
//"laud": "0",
//"opus_num": "0",
//"comment_num": "0",
//"summary": "一些一直存在电脑不舍得删的手工教程，都是在网上看到保存下来的，分享给大家~(≧▽≦)/"
+(id)modelWithDict:(NSDictionary*)dict;
-(id)initWithDict:(NSDictionary*)dict;
@property (nonatomic,copy)NSString *hand_daren;
@property (nonatomic,copy)NSString *is_guan;
@property (nonatomic,copy)NSString *hand_id;
@property (nonatomic,copy)NSString *user_id;
@property (nonatomic,copy)NSString *subject;
@property (nonatomic,copy)NSString *add_time;
@property (nonatomic,copy)NSString *host_pic_ss;
@property (nonatomic,copy)NSString *host_pic_s;
@property (nonatomic,copy)NSString *user_name;
@property (nonatomic,copy)NSString *face_pic;
@property (nonatomic,copy)NSString *view;
@property (nonatomic,copy)NSString *view_o;
@property (nonatomic,copy)NSString *share_url;
@property (nonatomic,copy)NSString *collect;
@property (nonatomic,copy)NSString *laud;
@property (nonatomic,copy)NSString *opus_num;
@property (nonatomic,copy)NSString *comment_num;
@property (nonatomic,copy)NSString *summary;
@end
