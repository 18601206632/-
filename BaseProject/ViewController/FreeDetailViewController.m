
//
//  FreeDetailViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "FreeDetailViewController.h"
#import "SubmitViewController.h"
@interface FreeDetailViewController ()
@property (nonatomic,strong)UITextField *telNumberF;
@property (nonatomic,strong)UIButton *btn;
@end

@implementation FreeDetailViewController
-(UITextField *)telNumberF
{
    if (!_telNumberF) {
//        self.view.backgroundColor=[UIColor whiteColor];
        _telNumberF= [[UITextField alloc]initWithFrame:CGRectZero];
        _telNumberF.backgroundColor=[UIColor whiteColor];
        _telNumberF.placeholder=@"  必填";
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 70, 40)];
        label.font=[UIFont systemFontOfSize:16.0];
        label.text=@"  手机号 :";
        _telNumberF.leftView=label;
        _telNumberF.leftViewMode=UITextFieldViewModeAlways;
        _telNumberF.tintColor=[UIColor redColor];
        [self.view addSubview:_telNumberF];
        [_telNumberF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(100);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(50);
        }];
        
    }
    return _telNumberF;
}
-(UIButton *)btn
{
    if (!_btn) {
        _btn=[UIButton buttonWithType:(UIButtonTypeCustom)];
//        _btn.backgroundColor=[UIColor redColor];
        [self.view addSubview:_btn];
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.telNumberF.mas_bottom).mas_equalTo(10);
            make.leftMargin.rightMargin.mas_equalTo(self.telNumberF);
            
        }];
        [_btn bk_addEventHandler:^(id sender) {
            [SMSSDK getVerificationCodeByMethod:(SMSGetCodeMethodSMS) phoneNumber:self.telNumberF.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
                if (error) {
                    NSLog(@"error %@",error);
                }
            }];
            SubmitViewController *vc=[[SubmitViewController alloc]init];
            vc.telNumber=self.telNumberF.text;
            [self.navigationController pushViewController:vc animated:YES];
            
        } forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _btn;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.telNumberF.font=[UIFont systemFontOfSize:16.0];
    [self.btn setTitle:@"申请免费方案服务" forState:UIControlStateNormal];
    UILabel *label=[[UILabel alloc]init];
    label.text=@"我们将发送验证码至您手机，请在三分钟内使用";
    label.textColor=[UIColor brownColor];
    label.font=[UIFont systemFontOfSize:12.0];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.btn.mas_bottom).mas_equalTo(20);
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
