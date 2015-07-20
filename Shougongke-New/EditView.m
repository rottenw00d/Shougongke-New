//
//  EditView.m
//  Shougongke-New
//
//  Created by qianfeng on 15/7/17.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import "EditView.h"

@implementation EditView

+(id)editView{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]lastObject];
}
@end
