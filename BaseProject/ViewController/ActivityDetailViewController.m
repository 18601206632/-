//
//  ActivityDetailViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ActivityDetailViewController.h"

@interface ActivityDetailViewController ()
@property (nonatomic,strong)UITextView *textView;
@end

@implementation ActivityDetailViewController
{
    UIImageView *_cover;
    UIImageView *_logoIv;
    UILabel *_titleLb;
    UILabel *_timeLb;
    UILabel *_areaLb;
}
-(instancetype)initWithModel:(ActivityModel *)model
{
    if (self=[super init]) {
        _model=model;
    }
    return self;
}
-(UIView *)headerView
{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kWindowW, 300)];
    UIView *botoomView = [UIView new];
    botoomView.backgroundColor=[UIColor lightGrayColor];
    [headView addSubview:botoomView];
    [botoomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(120);
    }];
    _cover=[[UIImageView alloc]initWithFrame:CGRectZero];
    //    _logoIv.layer.cornerRadius=30;
    [headView addSubview:_cover];
    [_cover mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.bottom.mas_equalTo(botoomView.mas_top).mas_equalTo(0);
    }];
    //    _logoIv.clipsToBounds=YES;
    [_cover setImageWithURL:[NSURL URLWithString:self.model.background]];
    _logoIv=[[UIImageView alloc]initWithFrame:CGRectZero];
    _logoIv.layer.cornerRadius=5;
    [botoomView addSubview:_logoIv];
    [_logoIv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(10);
        
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    _logoIv.clipsToBounds=YES;
    [_logoIv setImageWithURL:[NSURL URLWithString:self.model.logo]];
    
    _titleLb = [UILabel new];
    _titleLb.numberOfLines=0;
    _titleLb.font=[UIFont systemFontOfSize:18.0];
//    _titleLb.textAlignment=NSTextAlignmentCenter;
    [botoomView addSubview:_titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_logoIv.mas_right).mas_equalTo(5);
        make.right.mas_equalTo(-40);
        make.topMargin.mas_equalTo(_logoIv);
        
    }];
    _titleLb.text = self.model.name;
    //添加滚动栏
    _timeLb =[UILabel new];
    _timeLb.numberOfLines=0;
    _timeLb.font=[UIFont systemFontOfSize:14.0];
    [botoomView addSubview:_timeLb];
    [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leftMargin.mas_equalTo(_titleLb);
        make.top.mas_equalTo(_titleLb.mas_bottom).mas_equalTo(5);
        make.rightMargin.mas_equalTo(_titleLb);
    }];
    _timeLb.text=self.model.time;
    _areaLb=[UILabel new];
//    _areaLb.textAlignment=NSTextAlignmentCenter;
    _areaLb.font=[UIFont systemFontOfSize:14.0];
    _areaLb.numberOfLines=0;
    [botoomView addSubview:_areaLb];
    [_areaLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leftMargin.rightMargin.mas_equalTo(_timeLb);
        make.top.mas_equalTo(_timeLb.mas_bottom).mas_equalTo(5);
        
        //make.bottom.mas_equalTo(-15);
    }];
    _areaLb.text=self.model.areaDetail;
//    self.textView.text=self.model.content;
//    [botoomView addSubview:self.textView];
//    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(botoomView.mas_bottom).mas_equalTo(0);
//        make.bottom.mas_equalTo(200);
//        make.left.right.mas_equalTo(0);
//    }];

    
    return headView;
}
-(UITextView *)textView
{
    if (!_textView) {
        _textView=[[UITextView alloc]init];
        _textView.editable=NO;
        _textView.contentOffset=CGPointMake(0, 0);
        _textView.font=[UIFont systemFontOfSize:14.0];
    }
    return _textView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:[self headerView]];
//    [[self headerView] mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(kWindowW, 600));
//    }];
    UIView *footView=[[UIView alloc]initWithFrame:CGRectMake(0, 360, kWindowW, 300)];
    self.textView.text=self.model.content;
    [footView addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    [self.view addSubview:footView];
    
    
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
