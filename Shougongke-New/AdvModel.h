//
//  AdvModel.h
//  Shougongke-New
//
//  Created by qianfeng on 15/7/15.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdvModel : NSObject
//"type": 23,
//"subject": "闪购入口",
//"title": "闪购入口",
//"ad_img": "http://img5.shougongke.com/Public/data/mobel/adv/143227933360405.jpg",
//"action": "",
//"id": "http://www.shougongke.com/index.php?m=Product&a=All_list",
//"height": 160,
//"width": 320
@property int type;
@property (nonatomic,copy)NSString *subject;//类型
@property (nonatomic,copy)NSString *title;//标题
@property (nonatomic,copy)NSString *ad_img;//图片
@property (nonatomic,copy)NSString *action;
@property (nonatomic,copy)NSString *aid;//对应id
@property (nonatomic,copy)NSString *height;//高度
@property (nonatomic,copy)NSString *width;//宽度
+(id)modelWithDic:(NSDictionary*)dic;
-(id)initWithDict:(NSDictionary*)dict;
@end
