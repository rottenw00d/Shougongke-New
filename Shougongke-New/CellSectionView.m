//
//  CellSectionView.m
//  Shougongke-New
//
//  Created by qianfeng on 15/7/17.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import "CellSectionView.h"
#import "UIImageView+AFNetworking.h"
#import "CategoryModel.h"
@interface CellSectionView()
@property (weak, nonatomic) IBOutlet UIImageView *icoImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *detailLab;
@end
@implementation CellSectionView
+(id)cellSectionView{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]lastObject];
}
-(void)setModel:(CategoryGroupModel *)model{
        NSString *str=@"";
        int i=0;
    for (CategoryModel *cm in model.childArr){
        NSString *tmp=[NSString stringWithFormat:@"%@ %@",str,cm.name];
        str=tmp;
        if (++i==4)break;
    }
        self.detailLab.text=str;
        self.titleLab.text=model.name;
        [self.icoImage setImageWithURL:[NSURL URLWithString:model.ico]];
}
@end
