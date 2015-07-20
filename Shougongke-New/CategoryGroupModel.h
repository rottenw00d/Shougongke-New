//
//  CategoryGroupModel.h
//  Shougongke-New
//
//  Created by qianfeng on 15/7/16.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryGroupModel : NSObject
@property (nonatomic,copy)NSString *cid;//指代id
@property (nonatomic,copy)NSString *name;//分类名
@property (nonatomic,strong)NSArray *child;//下属列表
@property (nonatomic,strong)NSMutableArray *childArr;//下属列表(已转化为模型)
@property (nonatomic,copy)NSString *ico;//图片
@property(nonatomic,assign,getter = isOpen)BOOL open;
+(id)modelWithDict:(NSDictionary*)dict;
-(id)initWithDict:(NSDictionary*)dict;
@end
