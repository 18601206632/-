//
//  Factory.m
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "Factory.h"

@implementation Factory
+(void)addMenuItemToVc:(UIViewController *)vc
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"zone_post_red"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"zone_post_n"] forState:UIControlStateHighlighted];
    btn.frame=CGRectMake(0, 0, 30, 30);
    [btn bk_addEventHandler:^(id sender) {
        [vc.sideMenuViewController presentLeftMenuViewController];
    } forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *menu=[[UIBarButtonItem alloc]initWithCustomView:btn];
    UIBarButtonItem *spaceItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:(UIBarButtonSystemItemFixedSpace) target:nil action:nil];
    spaceItem.width=-10;
    vc.navigationItem.leftBarButtonItems=@[menu,spaceItem];
}
-(void)addCityItemToVc:(UIViewController *)vc
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:self.city forState:(UIControlStateNormal)];
    btn.frame=CGRectMake(kWindowW-10, 5, 30, 30);
    [btn bk_addEventHandler:^(id sender) {
        
    } forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithCustomView:btn];
    UIBarButtonItem *spaceItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:(UIBarButtonSystemItemFixedSpace) target:nil action:nil];
    spaceItem.width=10;
    vc.navigationItem.rightBarButtonItems=@[item,spaceItem];
}


@end
