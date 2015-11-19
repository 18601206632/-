//
//  applyViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "applyViewController.h"
#import "LeftViewController.h"
@interface applyViewController ()

@property (nonatomic,strong)UITextField *nameFd;
@property (nonatomic,strong)UITextField *genderFd;
@property (nonatomic,strong)UITextField *cityFd;
@property (nonatomic,strong)UITextField *telPhone;
@property (nonatomic,strong)UITextField *emileFd;
@property (nonatomic,strong)UIButton *btn;
@property (nonatomic,strong)NSUserDefaults *userDefault;
@end

@implementation applyViewController
-(NSUserDefaults *)userDefault
{
    if (!_userDefault) {
        //以standard开头 ，单例模式
        _userDefault=[NSUserDefaults standardUserDefaults];
    }
    return _userDefault;
}

- (UITextField *)nameFd {
    if(_nameFd == nil) {
        _nameFd = [[UITextField alloc] init];
        _nameFd.backgroundColor=[UIColor whiteColor];
        _nameFd.placeholder=@"姓名";
        _nameFd.tintColor=[UIColor redColor];
        [self.view addSubview:_nameFd];
        [_nameFd mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(74);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(40);
        }];

    }
    return _nameFd;
}

- (UITextField *)genderFd {
    if(_genderFd == nil) {
        _genderFd = [[UITextField alloc] init];
        _genderFd.backgroundColor=[UIColor whiteColor];
        _genderFd.placeholder=@"性别";
        _genderFd.tintColor=[UIColor redColor];
        [self.view addSubview:_genderFd];
        [_genderFd mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.nameFd.mas_bottom).mas_equalTo(10);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(40);
        }];
    }
    return _genderFd;
}

- (UITextField *)cityFd {
    if(_cityFd == nil) {
        _cityFd = [[UITextField alloc] init];
        _cityFd.backgroundColor=[UIColor whiteColor];
        _cityFd.placeholder=@"城市";
        _cityFd.tintColor=[UIColor redColor];
        [self.view addSubview:_cityFd];
        [_cityFd mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.genderFd.mas_bottom).mas_equalTo(10);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(40);
        }];
    }
    return _cityFd;
}

- (UITextField *)telPhone {
    if(_telPhone == nil) {
        _telPhone = [[UITextField alloc] init];
        _telPhone.backgroundColor=[UIColor whiteColor];
        _telPhone.placeholder=@"手机";
        _telPhone.tintColor=[UIColor redColor];
        [self.view addSubview:_telPhone];
        [_telPhone mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.cityFd.mas_bottom).mas_equalTo(10);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(40);
        }];
    }
    return _telPhone;
}

- (UITextField *)emileFd {
    if(_emileFd == nil) {
        _emileFd = [[UITextField alloc] init];
        _emileFd.backgroundColor=[UIColor whiteColor];
        _emileFd.placeholder=@"邮箱";
        _emileFd.tintColor=[UIColor redColor];
        [self.view addSubview:_emileFd];
        [_emileFd mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.telPhone.mas_bottom).mas_equalTo(10);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(40);
        }];
    }
    return _emileFd;
}

- (UIButton *)btn {
    if(_btn == nil) {
        
        _btn=[UIButton buttonWithType:(UIButtonTypeCustom)];
        //        _btn.backgroundColor=[UIColor redColor];
        [self.view addSubview:_btn];
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.emileFd.mas_bottom).mas_equalTo(10);
            make.leftMargin.rightMargin.mas_equalTo(self.emileFd);
            
        }];
        [_btn bk_addEventHandler:^(id sender) {
            UIAlertController *alertC=[UIAlertController alertControllerWithTitle:@"提示" message:@"资料已存档稍后会有人联系您" preferredStyle:(UIAlertControllerStyleAlert)];
            [self presentViewController:alertC animated:YES completion:nil];
            //为弹出框添加按钮
            UIAlertAction *sureAction=[UIAlertAction actionWithTitle:@"确认" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
                [self saveData];
                [self.navigationController popViewControllerAnimated:YES];
            }] ;
            [alertC addAction:sureAction];
        } forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _btn;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path=NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).firstObject;
    NSLog(@"library path:%@",path);
    self.nameFd.font=[UIFont systemFontOfSize:16.0];
    self.genderFd.font=[UIFont systemFontOfSize:16.0];
    self.cityFd.font=[UIFont systemFontOfSize:16.0];
    self.telPhone.font=[UIFont systemFontOfSize:16.0];
    self.emileFd.font=[UIFont systemFontOfSize:16.0];
    [self.btn setTitle:@"提交申请" forState:UIControlStateNormal];
    // Do any additional setup after loading the view.
}
- (void)saveData {
    [self.userDefault setValue:self.nameFd.text forKey:@"name"];
    [self.userDefault setValue:self.genderFd.text forKey:@"gender"];
    [self.userDefault setValue:self.cityFd.text forKey:@"city"];
    [self.userDefault setValue:self.telPhone.text forKey:@"telphone"];
    [self.userDefault setValue:self.emileFd.text forKey:@"emile"];
    //执行存入沙盒动作（内存-》磁盘）
    //sychronize同步
    //强调：系统每个RunLoop都会自动调用一次同步方法，手动调用是为了防止系统突然崩溃，导致数据未保存
    [self.userDefault synchronize];
    
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
