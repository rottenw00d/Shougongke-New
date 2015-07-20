//
//  CategoryModel.m
//  Shougongke-New
//
//  Created by qianfeng on 15/7/16.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import "CategoryModel.h"

@implementation CategoryModel
+(id)modelWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
-(id)initWithDict:(NSDictionary *)dict{
    if (self=[super init])
    {
        self.childArr=[NSMutableArray array];
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]){
        self.cid=value;
    }
}
@end
