//
//  CategoryGroupModel.m
//  Shougongke-New
//
//  Created by qianfeng on 15/7/16.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import "CategoryGroupModel.h"
#import "CategoryModel.h"
@implementation CategoryGroupModel
+(id)modelWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
-(id)initWithDict:(NSDictionary *)dict{
    if (self=[super init])
    {
        self.childArr=[NSMutableArray array];
        self.open=YES;
        [self setValuesForKeysWithDictionary:dict];
        if (self.child.count>0){
            [self childScan];
        }
    }
    return self;
}
-(void)childScan{
    for (NSDictionary *dic in self.child){
        CategoryModel *cm=[CategoryModel modelWithDict:dic];
        [self.childArr addObject:cm];
        //把每层数据都转为模型后封装
        if (cm.child.count>0){
            for (NSDictionary *ddic in cm.child)
            {
                NSString *na=[ddic objectForKey:@"name"];
                [cm.childArr addObject:na];
            }
        }
    }
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]){
        self.cid=value;
    }
}
@end
