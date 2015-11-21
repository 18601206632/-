//
//  TuijianCompanyViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuijianCompanyViewController.h"

@interface companyDetailListCell :UITableViewCell
@property (nonatomic,strong)UILabel *proLb;
@property (nonatomic,strong)UILabel *departLb;
@property (nonatomic,strong)UILabel *flatLb;
@property (nonatomic,strong)UILabel *smallflatLb;

@end
@implementation companyDetailListCell
- (UILabel *)proLb {
    if(_proLb == nil) {
        _proLb = [[UILabel alloc] init];
        _proLb.font=[UIFont boldSystemFontOfSize:20.0];
        [self.contentView addSubview:_proLb];
        [_proLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(20);
            make.centerX.mas_equalTo(0);
            
        }];
        
    }
    return _proLb;
}

- (UILabel *)departLb {
    if(_departLb == nil) {
        _departLb = [[UILabel alloc] init];
        _departLb.font=[UIFont systemFontOfSize:16.0];
        [self.contentView addSubview:_departLb];
        [_departLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.proLb.mas_bottom).mas_equalTo(20);
            make.left.mas_equalTo((kWindowW-3*30)/4);
            make.bottom.mas_equalTo(-20);
        }];
        
    }
    return _departLb;
}

- (UILabel *)flatLb {
    if(_flatLb == nil) {
        _flatLb = [[UILabel alloc] init];
        _flatLb.font=[UIFont systemFontOfSize:16.0];
        [self.contentView addSubview:_flatLb];
        [_flatLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.bottomMargin.mas_equalTo(self.departLb);
            make.left.mas_equalTo(self.departLb.mas_right).mas_equalTo((kWindowW-3*30)/4);
        }];
        
    }
    return _flatLb;
}

- (UILabel *)smallflatLb {
    if(_smallflatLb == nil) {
        _smallflatLb = [[UILabel alloc] init];
        _smallflatLb.font=[UIFont systemFontOfSize:16.0];
        [self.contentView addSubview:_smallflatLb];
        [_smallflatLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.bottomMargin.mas_equalTo(self.departLb);
            make.left.mas_equalTo(self.flatLb.mas_right).mas_equalTo((kWindowW-3*30)/4);
        }];
        
    }
    return _smallflatLb;
}



@end

@interface TuijianCompanyViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)UITextView *textView;
@end

@implementation TuijianCompanyViewController
{
    UILabel *_titleLb;
    UIImageView *_logoIv;
    UILabel *_areaLb;
    UIImageView *_cover;
    
}
-(instancetype)initWithModel:(TuijianDetailCompanylistModel *)model
{
    if (self=[super init]) {
        _model=model;
    }
    return self;
}
-(UITextView *)textView
{
    if (!_textView) {
        _textView=[UITextView new];
        _textView.font=[UIFont systemFontOfSize:16.0];
        _textView.editable=NO;
        _textView.contentOffset=CGPointMake(0, 0);
    }
    return _textView;
}
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStyleGrouped)];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_tableView registerClass:[companyDetailListCell class] forCellReuseIdentifier:@"Cell"];
    }
    return _tableView;
}
-(UIView *)headerView
{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, kWindowW)];
    UIView *botoomView = [UIView new];
    botoomView.backgroundColor=[UIColor whiteColor];
    [headView addSubview:botoomView];
    [botoomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(130);
    }];
    _cover=[[UIImageView alloc]initWithFrame:CGRectZero];
    //    _logoIv.layer.cornerRadius=30;
    [headView addSubview:_cover];
    [_cover mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.bottom.mas_equalTo(botoomView.mas_top).mas_equalTo(0);
    }];
    //    _logoIv.clipsToBounds=YES;
    [_cover setImageWithURL:[NSURL URLWithString:self.model.cover]];
    _logoIv=[[UIImageView alloc]initWithFrame:CGRectZero];
    _logoIv.layer.cornerRadius=30;
    [botoomView addSubview:_logoIv];
    [_logoIv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.centerX.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    _logoIv.clipsToBounds=YES;
    [_logoIv setImageWithURL:[NSURL URLWithString:self.model.logo]];
    
    _titleLb = [UILabel new];
    _titleLb.textAlignment=NSTextAlignmentCenter;
    [botoomView addSubview:_titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(_logoIv.mas_bottom).mas_equalTo(10);
        
    }];
    _titleLb.text = self.model.companyName;
    //添加滚动栏
    _areaLb=[UILabel new];
    _areaLb.textAlignment=NSTextAlignmentCenter;
    _areaLb.font=[UIFont systemFontOfSize:14.0];
    [botoomView addSubview:_areaLb];
    [_areaLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(_titleLb.mas_bottom).mas_equalTo(5);
        //        make.bottom.mas_equalTo(-15);
    }];
    _areaLb.text=self.model.areaDetail;
    
    
    return headView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    companyDetailListCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.proLb.text=@"装修专长";
    cell.departLb.text=@"别墅";
    cell.flatLb.text=@"公寓";
    cell.smallflatLb.text=@"小户";
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(UIView *)footerView
{
    UIView *footView=[[UIView  alloc]initWithFrame:CGRectMake(0, 0, kWindowW, 100)];
    
    
    [footView addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    self.textView.text=self.model.companyIntroduction;
    return footView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableHeaderView=[self headerView];
    self.tableView.tableFooterView=[self footerView];
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
