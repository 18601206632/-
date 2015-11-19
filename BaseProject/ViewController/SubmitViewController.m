//
//  SubmitViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SubmitViewController.h"
#import <SMS_SDK/SMSSDK.h>
#import "applyViewController.h"
@interface SubmitViewController ()
@property (nonatomic,strong)UITextField *submitF;
@property (nonatomic,strong)UIButton *submitBtn;
@end

@implementation SubmitViewController
-(UITextField *)submitF
{
    if (!_submitF) {
        
        _submitF= [[UITextField alloc]initWithFrame:CGRectZero];
        _submitF.backgroundColor=[UIColor whiteColor];
        _submitF.placeholder=@"  请输入验证码 ";
        _submitF.tintColor=[UIColor redColor];
        [self.view addSubview:_submitF];
        [_submitF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(100);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(50);
        }];

    }
    return _submitF;
    
}
-(UIButton *)submitBtn
{
    if (!_submitBtn) {
        _submitBtn=[UIButton buttonWithType:(UIButtonTypeCustom)];
        //        _btn.backgroundColor=[UIColor redColor];
        [self.view addSubview:_submitBtn];
        [_submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.submitF.mas_bottom).mas_equalTo(10);
            make.leftMargin.rightMargin.mas_equalTo(self.submitF);
            
        }];
        [_submitBtn bk_addEventHandler:^(id sender) {
            [SMSSDK commitVerificationCode:self.submitF.text phoneNumber:self.telNumber zone:@"86" result:^(NSError *error) {
                if (error) {
                    NSLog(@"验证码不正确%@",error);
                }else
                {
                    applyViewController *vc=[[applyViewController alloc]init];
                    [self.navigationController pushViewController:vc animated:YES];
                    NSLog(@"验证码正确");
                }
            }];

            
        } forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _submitBtn;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.submitF.font=[UIFont systemFontOfSize:16.0];
    [self.submitBtn setTitle:@"提交验证码" forState:UIControlStateNormal];
    UILabel *label=[[UILabel alloc]init];
    label.text=[NSString stringWithFormat:@"我们已发送验证码到这个号码 %@",self.telNumber ];
    label.textAlignment=NSTextAlignmentCenter;
    label.textColor=[UIColor brownColor];
    label.font=[UIFont systemFontOfSize:12.0];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(70);
        make.centerX.mas_equalTo(0);
    
    }];
    
    // Do any additional setup after loading the view.
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
