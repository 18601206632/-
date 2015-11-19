//
//  applyViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "applyViewController.h"

@interface applyViewController ()

@property (nonatomic,strong)UITextField *nameFd;
@property (nonatomic,strong)UITextField *genderFd;
@property (nonatomic,strong)UITextField *cityFd;
@property (nonatomic,strong)UITextField *telPhone;
@property (nonatomic,strong)UITextField *emileFd;
@property (nonatomic,strong)UIButton *btn;
@end

@implementation applyViewController

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
            
            
        } forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _btn;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
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
