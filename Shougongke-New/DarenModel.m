//
//  DarenModel.m
//  Shougongke-New
//
//  Created by qianfeng on 15/7/15.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import "DarenModel.h"

@implementation DarenModel
+(id)modelWithDic:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

-(id)initWithDict:(NSDictionary *)dict{
    if (self=[super init])
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
@end
