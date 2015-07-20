//
//  DarenModel.h
//  Shougongke-New
//
//  Created by qianfeng on 15/7/15.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DarenModel : NSObject
//"circle_count": "106",
//"circle_collect_count": "1",
//"guan_num": "17",
//"fen_num": "1291",
//"guan_status": "0",
//"coursecount": "38",
//"coursedraft": "0",
//"coursecollect": "38",
//"uname": "雪忘情忧",
//"title": "此情可待成追忆，只是当时已惘然。",
//"gender": "0",
//"region": "山东省 烟台",
//"daren": "1",
//"hand_teacher": 0,
//"level": {
//    "level": "5",
//    "experience": "9415",
//    "next_level_need": "2585"
//},
//"avatar": "http://img1.wowsai.com/bridge/data/avatar/001/01/27/48_avatar_big.jpg?skey=4b3d5",
//"bg_image": "http://img5.shougongke.com//Public/data/mobel/bg/001/01/27/t1012748.jpg?ckey=0dc98",
//"uid": "1012748"
@property (nonatomic,copy) NSString* class_count;
@property (nonatomic,copy) NSString* real_name;
@property (nonatomic,copy) NSString* circle_count;
@property (nonatomic,copy) NSString* circle_collect_count;
@property (nonatomic,copy) NSString* guan_num;
@property (nonatomic,copy) NSString* fen_num;
@property (nonatomic,copy) NSString* guan_status;
@property (nonatomic,copy) NSString* coursecount;
@property (nonatomic,copy) NSString* coursedraft;
@property (nonatomic,copy) NSString* coursecollect;
@property (nonatomic,copy) NSString* uname;
@property (nonatomic,copy) NSString* title;
@property (nonatomic,copy) NSString* gender;
@property (nonatomic,copy) NSString* region;
@property (nonatomic,copy) NSString* daren;
@property (nonatomic,copy) NSString* hand_teacher;
@property (nonatomic,strong) NSArray* level;
@property (nonatomic,copy) NSString* avatar;
@property (nonatomic,copy) NSString* bg_image;
@property (nonatomic,copy) NSString* uid;
+(id)modelWithDic:(NSDictionary*)dic;
-(id)initWithDict:(NSDictionary*)dict;
@end
