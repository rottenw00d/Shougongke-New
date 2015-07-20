//
//  CategoryModel.h
//  Shougongke-New
//
//  Created by qianfeng on 15/7/16.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryModel : NSObject
@property (nonatomic,copy)NSString *cid;//指代id
@property (nonatomic,copy)NSString *name;//分类名
@property (nonatomic,strong)NSArray *child;//下属列表
@property (nonatomic,strong)NSMutableArray *childArr;
@property (nonatomic,copy)NSString *ico;//图片
@property BOOL multi;
+(id)modelWithDict:(NSDictionary*)dict;
-(id)initWithDict:(NSDictionary*)dict;
@end
