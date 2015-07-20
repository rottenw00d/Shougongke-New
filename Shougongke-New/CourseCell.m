//
//  CourseCell.m
//  Shougongke-New
//
//  Created by qianfeng on 15/7/15.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import "CourseCell.h"
#import "UIImageView+AFNetworking.h"
@implementation CourseCell
+(id)appCellWithTableView:(UITableView *)tableView{
    
    NSString *str=NSStringFromClass([self class]);
    UINib *nib=[UINib nibWithNibName:str bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:str];
    return [tableView dequeueReusableCellWithIdentifier:str];
}
- (void)awakeFromNib {
    // Initialization code
}
-(void)setModelArr:(NSArray *)modelArr{
    _modelArr=modelArr;
    if (modelArr.count>0){
    for (int i=0;i<modelArr.count;i++){
        CourseModel *model=modelArr[i];
        if (i%2==0){
            CGFloat y=40+i/2*150;
            UIView *view=[[UIView alloc]initWithFrame:CGRectMake(8, y, 175, 150)];
            UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 175, 100)];
            [imageview setImageWithURL:[NSURL URLWithString:model.host_pic]];
            UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 100, 175, 25)];
            label.font=[UIFont systemFontOfSize:12];
            label.text=model.subject;
             label.textAlignment=NSTextAlignmentCenter;
            view.layer.borderWidth = 0.5;
            view.layer.borderColor = [[UIColor lightGrayColor] CGColor];
            [view addSubview:label];
            [view addSubview:imageview];
            [self.contentView addSubview:view];
        }
        else{
            CGFloat y=40+i/2*150;
            UIView *view=[[UIView alloc]initWithFrame:CGRectMake(192, y, 175, 150)];
            UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 175, 100)];
            [imageview setImageWithURL:[NSURL URLWithString:model.host_pic]];
            UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 100, 175, 25)];
            label.font=[UIFont systemFontOfSize:12];
            label.text=model.subject;
            label.textAlignment=NSTextAlignmentCenter;
            view.layer.borderWidth = 0.5;
            view.layer.borderColor = [[UIColor lightGrayColor] CGColor];
            [view addSubview:label];
            [view addSubview:imageview];
            [self.contentView addSubview:view];
        }
    }
    }
}
-(void)willMoveToSuperview:(UIView *)newSuperview{
 
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
