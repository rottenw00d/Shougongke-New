//
//  TopicCell.m
//  Shougongke-New
//
//  Created by qianfeng on 15/7/15.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import "TopicCell.h"
#import "UIImageView+AFNetworking.h"
@interface TopicCell()
@property (weak, nonatomic) IBOutlet UIImageView *pic11;
@property (weak, nonatomic) IBOutlet UIImageView *pic12;
@property (weak, nonatomic) IBOutlet UIImageView *pic13;
@property (weak, nonatomic) IBOutlet UIImageView *pic14;
@property (weak, nonatomic) IBOutlet UIImageView *pic15;
@property (weak, nonatomic) IBOutlet UIImageView *pic21;
@property (weak, nonatomic) IBOutlet UIImageView *pic22;
@property (weak, nonatomic) IBOutlet UIImageView *pic23;
@property (weak, nonatomic) IBOutlet UIImageView *pic24;
@property (weak, nonatomic) IBOutlet UIImageView *pic25;
@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UILabel *lab2;


@end
@implementation TopicCell
+(id)appCellWithTableView:(UITableView *)tableView{
    
    NSString *str=NSStringFromClass([self class]);
    UINib *nib=[UINib nibWithNibName:str bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:str];
    return [tableView dequeueReusableCellWithIdentifier:str];
}
-(void)setModelArr:(NSArray *)modelArr{
    _modelArr=modelArr;
    if (modelArr.count>0){
    TopicModel *model=modelArr[0];
    [_pic11 setImageWithURL:[NSURL URLWithString:model.pic[0]]];
    [_pic12 setImageWithURL:[NSURL URLWithString:model.pic[1]]];
    [_pic13 setImageWithURL:[NSURL URLWithString:model.pic[2]]];
    [_pic14 setImageWithURL:[NSURL URLWithString:model.pic[3]]];
    [_pic15 setImageWithURL:[NSURL URLWithString:model.pic[4]]];
    _lab1.text=model.subject;
    
    model=modelArr[1];
    [_pic21 setImageWithURL:[NSURL URLWithString:model.pic[0]]];
    [_pic22 setImageWithURL:[NSURL URLWithString:model.pic[1]]];
    [_pic23 setImageWithURL:[NSURL URLWithString:model.pic[2]]];
    [_pic24 setImageWithURL:[NSURL URLWithString:model.pic[3]]];
    [_pic25 setImageWithURL:[NSURL URLWithString:model.pic[4]]];
    _lab2.text=model.subject;
    }
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
