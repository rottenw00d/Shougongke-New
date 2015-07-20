//
//  TableHeaderView.m
//  Shougongke-New
//
//  Created by qianfeng on 15/7/15.
//  Copyright (c) 2015年 zt. All rights reserved.
//

#import "TableHeaderView.h"
#import "UIImageView+AFNetworking.h"
#import "DiscoverModels.h"
@interface TableHeaderView()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *sp2;

@property (weak, nonatomic) IBOutlet UIView *sp1;

@property (weak, nonatomic) IBOutlet UIView *daren;
@property (weak, nonatomic) IBOutlet UIView *rank;
@property (weak, nonatomic) IBOutlet UIView *shiji;
@property (weak, nonatomic) IBOutlet UIView *event;

@end
@implementation TableHeaderView
{
    NSTimer *_timer;
    UIPageControl *_pageControl;
    NSInteger number;
}
+(id)tableHeaderView{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]lastObject];
}
-(void)prepareImages:(NSArray *)images{
    //先初始化
    [_pageControl removeFromSuperview];
    [_timer invalidate];
    _scrollView.contentOffset=CGPointMake(0, 0);
    
    //进行设置
    number=images.count;
    self.scrollView.delegate=self;
    self.scrollView.bounces=NO;
    self.scrollView.contentSize=CGSizeMake(images.count*375, 120);
    _pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(100, 100, 150, 20)];
    _pageControl.numberOfPages=images.count;
    _pageControl.currentPageIndicatorTintColor=[UIColor redColor];
    _pageControl.userInteractionEnabled=NO;
    [self addSubview:_pageControl];
    CGFloat imageH=120;
    CGFloat imageW=375;
    CGFloat imageY=0;
    int i=0;
    for (SlideModel *tmp in images){
        CGFloat imageX=i*375;
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(imageX, imageY, imageW, imageH)];
        [imageView setImageWithURL:[NSURL URLWithString:tmp.host_pic]];
        [self.scrollView addSubview:imageView];
        i++;
    }
    _timer=[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(move) userInfo:nil repeats:YES];
}
-(void)prepareButton:(NSArray *)nav andAdv:(NSArray *)adv{
     Nav *tmp=nav[0];
    UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectMake(23, 15, 45, 45)];
    [image setImageWithURL:[NSURL URLWithString:tmp.host_pic]];
    [self.daren addSubview:image];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 65, 92, 20)];
    label.text=@"达人";
    label.textAlignment=NSTextAlignmentCenter;
    label.font=[UIFont systemFontOfSize:12];
    [self.daren addSubview:label];
    
    tmp=nav[1];
    image=[[UIImageView alloc]initWithFrame:CGRectMake(23, 15, 45, 45)];
    [image setImageWithURL:[NSURL URLWithString:tmp.host_pic]];
    [self.rank addSubview:image];
    label=[[UILabel alloc]initWithFrame:CGRectMake(0, 65, 92, 20)];
    label.text=@"排行榜";
    label.textAlignment=NSTextAlignmentCenter;
    label.font=[UIFont systemFontOfSize:12];
    [self.rank addSubview:label];
    
    tmp=nav[2];
    image=[[UIImageView alloc]initWithFrame:CGRectMake(23, 15, 45, 45)];
    [image setImageWithURL:[NSURL URLWithString:tmp.host_pic]];
    [self.shiji addSubview:image];
    label=[[UILabel alloc]initWithFrame:CGRectMake(0, 65, 92, 20)];
    label.text=@"市集";
    label.textAlignment=NSTextAlignmentCenter;
    label.font=[UIFont systemFontOfSize:12];
    [self.shiji addSubview:label];
    
    tmp=nav[3];
    image=[[UIImageView alloc]initWithFrame:CGRectMake(23, 15, 45, 45)];
    [image setImageWithURL:[NSURL URLWithString:tmp.host_pic]];
    [self.event addSubview:image];
    label=[[UILabel alloc]initWithFrame:CGRectMake(0, 65, 92, 20)];
    label.text=@"活动";
    label.textAlignment=NSTextAlignmentCenter;
    label.font=[UIFont systemFontOfSize:12];
    [self.event addSubview:label];
    
    AdvModel *tmp1=adv[0];
    image=[[UIImageView alloc]initWithFrame:CGRectMake(14, 0, 160, 80)];
    [image setImageWithURL:[NSURL URLWithString:tmp1.ad_img]];
    [self.sp1 addSubview:image];
    
    tmp1=adv[1];
    image=[[UIImageView alloc]initWithFrame:CGRectMake(14, 0, 160, 80)];
    [image setImageWithURL:[NSURL URLWithString:tmp1.ad_img]];
    [self.sp2 addSubview:image];
}
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    [_timer invalidate];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    _timer=[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(move) userInfo:nil repeats:YES];
    NSInteger index=scrollView.contentOffset.x/375;
    _pageControl.currentPage=index;
}
//轮播效果
-(void)move{
    CGPoint now=_scrollView.contentOffset;
    NSInteger index=_scrollView.contentOffset.x/375;
    if (index<number)
        _scrollView.contentOffset=CGPointMake(now.x+375, 0);
    else
        _scrollView.contentOffset=CGPointMake(0, 0);
    
    index=_scrollView.contentOffset.x/375;
    _pageControl.currentPage=index;
}
@end
