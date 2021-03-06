//
//  TopicModel.m
//  Shougongke-New
//
//  Created by qianfeng on 15/7/15.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import "TopicModel.h"

@implementation TopicModel
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
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"])
    {
        self.tid=value;
    }
}
@end
