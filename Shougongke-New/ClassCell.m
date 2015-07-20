//
//  ClassCell.m
//  Shougongke-New
//
//  Created by qianfeng on 15/7/15.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import "ClassCell.h"
#import "UIImageView+AFNetworking.h"
@interface ClassCell()
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;
@property (weak, nonatomic) IBOutlet UIView *view4;
@property (weak, nonatomic) IBOutlet UIImageView *pic1;
@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UIImageView *pic2;
@property (weak, nonatomic) IBOutlet UILabel *lab2;

@property (weak, nonatomic) IBOutlet UIImageView *pic3;
@property (weak, nonatomic) IBOutlet UILabel *lab3;
@property (weak, nonatomic) IBOutlet UIImageView *pic4;
@property (weak, nonatomic) IBOutlet UILabel *lab4;

@end
@implementation ClassCell
{
    NSTimer *_timer;
}
+(id)appCellWithTableView:(UITableView *)tableView{

    NSString *str=NSStringFromClass([self class]);
    UINib *nib=[UINib nibWithNibName:str bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:str];
    return [tableView dequeueReusableCellWithIdentifier:str];
}
-(void)setModelArr:(NSArray *)modelArr{
    _modelArr=modelArr;
    _timer=[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(prepareData) userInfo:nil repeats:YES];
}
-(void)prepareData{
    if (_modelArr.count>0)
    {
    ClassModel *model=_modelArr[0];
    _lab1.text=model.subject;
    [_pic1 setImageWithURL:[NSURL URLWithString:model.host_pic]];
    model=_modelArr[1];
    [_pic2 setImageWithURL:[NSURL URLWithString:model.host_pic]];
    _lab2.text=model.subject;
    model=_modelArr[2];
    _lab3.text=model.subject;
    [_pic3 setImageWithURL:[NSURL URLWithString:model.host_pic]];
    model=_modelArr[3];
    [_pic4 setImageWithURL:[NSURL URLWithString:model.host_pic]];
        _lab4.text=model.subject;
    [_timer invalidate];
    }
}
-(void)willMoveToSuperview:(UIView *)newSuperview{
    _view1.layer.borderWidth = 0.5;
    _view1.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    _view2.layer.borderWidth = 0.5;
    _view2.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    _view3.layer.borderWidth = 0.5;
    _view3.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    _view4.layer.borderWidth = 0.5;
    _view4.layer.borderColor = [[UIColor lightGrayColor] CGColor];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
