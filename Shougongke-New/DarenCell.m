//
//  DarenCell.m
//  Shougongke-New
//
//  Created by qianfeng on 15/7/15.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import "DarenCell.h"
#import "UIImageView+AFNetworking.h"
@interface DarenCell()
@property (weak, nonatomic) IBOutlet UIImageView *bigImage;

@end
@implementation DarenCell
+(id)appCellWithTableView:(UITableView *)tableView{
    
    NSString *str=NSStringFromClass([self class]);
    UINib *nib=[UINib nibWithNibName:str bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:str];
    return [tableView dequeueReusableCellWithIdentifier:str];
}
-(void)setModelArr:(NSArray *)modelArr{
    _modelArr=modelArr;
    if (modelArr.count>0)
    {
    DarenModel *model=modelArr[0];
    [self.bigImage setImageWithURL:[NSURL URLWithString:model.bg_image]];
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
