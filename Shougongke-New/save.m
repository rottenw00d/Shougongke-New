//
//  save.m
//  Shougongke-New
//
//  Created by qianfeng on 15/7/17.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import "save.h"

@implementation save
+(save*)shareSave{
    static save * obj = nil;
    if (!obj) {
        obj = [[save alloc]init];
    }
    return obj;
}
@end
