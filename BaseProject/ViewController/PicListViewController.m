//
//  PicListViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "PicListViewController.h"
#import "PicViewController.h"
#import "Factory.h"
#import "CompanyViewController.h"
#import "FreeViewController.h"
#import "ActivityViewController.h"
@interface PicListViewController ()

@end

@implementation PicListViewController
+(UINavigationController *)standardNavi
{
    static UINavigationController *navi=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        PicListViewController *vc=[[PicListViewController alloc]initWithViewControllerClasses:[self viewControllerClasses] andTheirTitles:[self itemNames]];
        vc.keys=[self vcKeys];
        vc.values=[self vcValues];
        navi=[[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor greenColor];
    self.title=@"图库";
    [Factory addMenuItemToVc:self];
    [self footview];
}
+(NSArray *)vcValues
{
    NSMutableArray *arr=[NSMutableArray new];
    for(int i=0;i<[self itemNames].count;i++)
    {
        [arr addObject:@(i)];
    }
    return [arr copy];
}
+(NSArray *)vcKeys
{
    NSMutableArray *arr=[NSMutableArray new];
    for (id obj in [self itemNames]) {
        
        [arr addObject:@"infoType"];
    }
    return [arr copy];
}

+(NSArray *)itemNames
{
    return @[@"全部",@"卧室",@"厨房",@"儿童房",@"客厅",@"餐厅",@"浴室",@"门口"];
}
+(NSArray *)viewControllerClasses
{
    NSMutableArray *arr=[NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:[PicViewController class]];
    }
    return [arr copy];
}
//-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    
//}
-(UIView *)footview
{
    UIView *footview=[[UIView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:footview];
    [footview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.view.bounds.size.height-150);
        
    }];
    UIButton *company=[UIButton buttonWithType:(UIButtonTypeCustom)];
    [company setBackgroundImage:[UIImage imageNamed: @"Float-company"] forState:(UIControlStateNormal)];
    [footview addSubview:company];
    [company mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(60, 60));
        make.left.mas_equalTo((self.view.bounds.size.width-180)/4);
    }];
    [company bk_addEventHandler:^(id sender) {
        [self.sideMenuViewController setContentViewController:[CompanyViewController defaultNavi]];
    } forControlEvents:(UIControlEventTouchUpInside)];
    UIButton *free=[UIButton buttonWithType:(UIButtonTypeCustom)];
    [free setBackgroundImage:[UIImage imageNamed: @"Float-design"] forState:(UIControlStateNormal)];
    [footview addSubview:free];
    [free mas_makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.mas_equalTo(company);
        make.size.mas_equalTo(company);
        make.left.mas_equalTo(company.mas_right).mas_equalTo((self.view.bounds.size.width-180)/4);
    }];
    [free bk_addEventHandler:^(id sender) {
        [self.sideMenuViewController setContentViewController:[FreeViewController defaultNavi]];
    } forControlEvents:(UIControlEventTouchUpInside)];
    UIButton *activity=[UIButton buttonWithType:(UIButtonTypeCustom)];
    [activity setBackgroundImage:[UIImage imageNamed:@"Float-activity"] forState:(UIControlStateNormal)];
    [footview addSubview:activity];
    [activity mas_makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.mas_equalTo(company);
        make.size.mas_equalTo(company);
        make.left.mas_equalTo(free.mas_right).mas_equalTo((self.view.bounds.size.width-180)/4);
    }];
    [activity bk_addEventHandler:^(id sender) {
        [self.sideMenuViewController setContentViewController:[ActivityViewController defaultNavi]];
    } forControlEvents:(UIControlEventTouchUpInside)];
    
    UIImageView *imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tit_bar_bg"]];
    imageView.frame=CGRectMake(0, 0, self.view.bounds.size.width, 50);
    imageView.alpha=0.2;
    [footview addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    
    
    return footview;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
