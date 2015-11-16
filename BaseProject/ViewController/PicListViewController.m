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
