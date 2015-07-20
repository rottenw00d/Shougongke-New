//
//  ProductsModel.h
//  Shougongke-New
//
//  Created by qianfeng on 15/7/15.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductsModel : NSObject
//"subject": "小彩石马赛克DIY材料包【包邮】",
//"price": "39.9",
//"start_time": 1432310400,
//"end_time": 1433001599,
//"host_pic": "http://img3.shougongke.com/Public/class_product/749123531host_pic555f53a92317e.jpg",
//"id": 25
@property (nonatomic,copy)NSString *subject;//标题
@property (nonatomic,copy)NSString *price;//价格
@property (nonatomic,copy)NSString *start_time;//起始时间
@property (nonatomic,copy)NSString *end_time;//终止时间
@property (nonatomic,copy)NSString *host_pic;//图片
@property (nonatomic,copy)NSString *pid;//对应id
+(id)modelWithDic:(NSDictionary*)dic;
-(id)initWithDict:(NSDictionary*)dict;
@end
