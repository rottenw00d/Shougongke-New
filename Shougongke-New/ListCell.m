//
//  ListCell.m
//  Shougongke-New
//
//  Created by qianfeng on 15/7/16.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import "ListCell.h"
#import "UIImageView+AFNetworking.h"
@interface ListCell()
@property (weak, nonatomic) IBOutlet UILabel *userNameLab;
@property (weak, nonatomic) IBOutlet UIImageView *userNameImg;
@property (weak, nonatomic) IBOutlet UIImageView *bigImg;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *stateLab;


@end
@implementation ListCell

+(id)appCellWithTableView:(UITableView *)tableView{
    
    NSString *str=NSStringFromClass([self class]);
    UINib *nib=[UINib nibWithNibName:str bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:str];
    return [tableView dequeueReusableCellWithIdentifier:str];
}
-(void)setModel:(ListModel *)model{
    _model=model;
    self.userNameLab.text=_model.user_name;
    [self.userNameImg setImageWithURL:[NSURL URLWithString:_model.face_pic]];
    [self.bigImg setImageWithURL:[NSURL URLWithString:_model.host_pic_s]];
    self.userNameImg.layer.masksToBounds=YES;
    self.userNameImg.layer.cornerRadius=25;
    self.titleLab.text=_model.subject;
    self.stateLab.text=[NSString stringWithFormat:@"%@人气/%@收藏/%@评论",_model.laud,_model.collect,_model.comment_num];
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
