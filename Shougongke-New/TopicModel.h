//
//  TopicModel.h
//  Shougongke-New
//
//  Created by qianfeng on 15/7/15.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopicModel : NSObject
//id": "276",
//"subject": "『专题』一周精选教程大放送 7月第1期",
//"pic": [
//        "http://img1.shougongke.com/Public/data/hand/201507/13/topic/1436770551381_312.jpg",
//        "http://img1.shougongke.com/Public/data/hand/201507/13/topic/1436770516636_312.jpg",
//        "http://img1.shougongke.com/Public/data/hand/201507/13/topic/1436770525321_312.jpg",
//        "http://img1.shougongke.com/Public/data/hand/201507/13/topic/1436770543869_312.jpg",
//        "http://img1.shougongke.com/Public/data/hand/201507/13/topic/1436770536103_312.jpg"
//        ],
//"Ym": "2015.07",
//"d": "13",
//"w": "星期一",
//"page": 1
@property (nonatomic,copy)NSString *tid;//对应id
@property (nonatomic,copy)NSString *subject;//标题
@property (nonatomic,strong)NSArray *pic;//图片数组
@property (nonatomic,copy)NSString *Ym;//年月
@property (nonatomic,copy)NSString *d;//日
@property (nonatomic,copy)NSString *w;//星期
@property (nonatomic,copy)NSString *page;//页
+(id)modelWithDic:(NSDictionary*)dic;
-(id)initWithDict:(NSDictionary*)dict;
@end
