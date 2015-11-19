//
//  FreeViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "FreeViewController.h"
#import "Factory.h"
#import "FreeDetailViewController.h"
@interface FreeViewController ()
@property (nonatomic,strong)UIImageView *IV;
@property (nonatomic,strong)UIButton *btn;
@end

@implementation FreeViewController
+(UINavigationController *)defaultNavi
{
    static UINavigationController *navi=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        FreeViewController *vc=[[FreeViewController alloc]init];
        navi=[[UINavigationController alloc]initWithRootViewController:vc];
        
    });
    return navi;
}
-(UIButton *)btn
{
    if (!_btn) {
        _btn=[UIButton buttonWithType:0];
//        _btn.backgroundColor=[UIColor greenColor];
        _btn.titleLabel.textColor=[UIColor whiteColor];
        [_btn bk_addEventHandler:^(id sender) {
            FreeDetailViewController *vc=[[FreeDetailViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        } forControlEvents:(UIControlEventTouchUpInside)];
    
    }
    return _btn;
}
-(UIImageView *)IV
{
    if (!_IV) {
        _IV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"design_bg"]];
        
        
    }
    return _IV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.IV];
    [self.IV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(64, 0, 0, 0));
    }];
    [self.view addSubview:self.btn];
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(400, 30, 110, 30));
    }];
    [self.btn setTitle:@"申请免费服务(量房·设计·方案)" forState:(UIControlStateNormal)];
    self.title=@"免费方案";
    [Factory addMenuItemToVc:self];
    
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
