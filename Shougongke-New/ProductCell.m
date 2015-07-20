//
//  ProductCell.m
//  Shougongke-New
//
//  Created by qianfeng on 15/7/15.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import "ProductCell.h"
#import "UIImageView+AFNetworking.h"
@interface ProductCell()
@property (weak, nonatomic) IBOutlet UIImageView *bigImage;
@property (weak, nonatomic) IBOutlet UILabel *title;

@end
@implementation ProductCell
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
    int num=arc4random_uniform((int)_modelArr.count);
    ProductsModel *model=_modelArr[num];
    [self.bigImage setImageWithURL:[NSURL URLWithString:model.host_pic]];
    self.title.text=model.subject;
    [_timer invalidate];
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
