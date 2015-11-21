//
//  TuijianDetailViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuijianDetailViewController.h"
#import "TuijianDetailViewModel.h"
#import "TuijianDetailCell.h"
#import "TuijianCompanyViewController.h"
@interface TuijianDetailViewController ()<iCarouselDelegate,iCarouselDataSource,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)TuijianDetailViewModel *detailVm;
@end

@implementation TuijianDetailViewController
{
    iCarousel *_ic;
    UILabel *_titleLb;
    UILabel *_houseTypeLb;
    UILabel *_styleLb;
    UILabel *_spaceLb;
    UILabel *_priceLb;
    NSTimer *_timer;
}
-(TuijianDetailViewModel *)detailVm
{
    if (!_detailVm) {
        _detailVm=[[TuijianDetailViewModel alloc]initWithId:self.Model.ID city:_city];
    }
    return _detailVm;
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
        [_tableView registerClass:[TuijianDetailCell class] forCellReuseIdentifier:@"Cell"];
        
    }
    return _tableView;
}
-(instancetype)initWithTuijianModel:(TuijianModel *)model
{
    if (self=[super init]) {
        _Model=model;
    }
    return self;
}
-(UIView *)header
{
     UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, kWindowW/750 * 600)];
    UIView *botoomView = [UIView new];
    botoomView.backgroundColor=[UIColor whiteColor];
    [headView addSubview:botoomView];
    [botoomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(80);
    }];
    _titleLb = [UILabel new];
    _titleLb.textAlignment=NSTextAlignmentCenter;
    [botoomView addSubview:_titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(5);

    }];
    _titleLb.text = self.Model.name;
    //添加滚动栏
    _ic = [iCarousel new];
    [headView addSubview:_ic];
    [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.bottom.mas_equalTo(botoomView.mas_top).mas_equalTo(0);
    }];
    _ic.delegate = self;
    _ic.dataSource = self;
    _ic.pagingEnabled = YES;
    _ic.scrollSpeed = 1;
    
  
    _ic.scrollEnabled = YES;
    _houseTypeLb=[UILabel new];
    
    [botoomView addSubview:_houseTypeLb];
    [_houseTypeLb mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake((kWindowW-5*20)/4, 0));
        make.bottom.mas_equalTo(-15);
        make.left.mas_equalTo(20);
    }];
    _houseTypeLb.text=self.Model.houseType;
    
    _styleLb=[UILabel new];
    [botoomView addSubview:_styleLb];
    [_styleLb mas_makeConstraints:^(MASConstraintMaker *make) {
//         make.size.mas_equalTo(CGSizeMake((kWindowW-5*20)/4, 0));
        make.left.mas_equalTo(_houseTypeLb.mas_right).mas_equalTo(20);
        make.bottomMargin.mas_equalTo(_houseTypeLb);
    }];
    _styleLb.text=self.Model.style;
    
    
    _spaceLb=[UILabel new];
    [botoomView addSubview:_spaceLb];
    [_spaceLb mas_makeConstraints:^(MASConstraintMaker *make) {
//         make.size.mas_equalTo(CGSizeMake((kWindowW-5*20)/4, 0));
        make.left.mas_equalTo(_styleLb.mas_right).mas_equalTo(20);
         make.bottomMargin.mas_equalTo(_houseTypeLb);
    }];
    _spaceLb.text=self.Model.space;
    
    _priceLb=[UILabel new];
    [botoomView addSubview:_priceLb];
    [_priceLb mas_makeConstraints:^(MASConstraintMaker *make) {
//         make.size.mas_equalTo(CGSizeMake((kWindowW-5*20)/4, 0));
        make.left.mas_equalTo(_spaceLb.mas_right).mas_equalTo(20);
         make.bottomMargin.mas_equalTo(_houseTypeLb);
    }];
    _priceLb.text=self.Model.price;
    if (self.Model.imageUrl.count > 1) {
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
            [_ic scrollToItemAtIndex:_ic.currentItemIndex+1 animated:YES];
        } repeats:YES];
    }
    
    
    
    
    return headView;
}
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return self.Model.imageUrl.count;
}
-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (!view) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW/750*600-80)];
        view.backgroundColor=[UIColor blackColor];
        UIImageView *imageView = [UIImageView new];
        [view addSubview:imageView];
        imageView.tag = 100;
        imageView.contentMode = 2;
        view.clipsToBounds = YES;
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    UIImageView *imageView = (UIImageView *)[view viewWithTag:100];
    [imageView setImageWithURL:[NSURL URLWithString:self.Model.imageUrl[index]]];
    return view;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.detailVm.rowNumber==1) {
        return 0;
    }else
    {
        return 1;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    NSLog(@"%@",self.detailVm);
    return self.detailVm.rowNumber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TuijianDetailCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.iconIv setImageWithURL:[self.detailVm iconForRow:indexPath.row]];
    cell.companyNameLb.text=[self.detailVm companyNameForRow:indexPath.row];
    cell.areaDetailLb.text=[self.detailVm companyDetailForRow:indexPath.row];
    
    return cell;
}
-(CGFloat )tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        return UITableViewAutomaticDimension;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableHeaderView=[self header];
    [self.detailVm getDataFromNetCompleteHandle:^(NSError *error) {
        [self.tableView reloadData];
    }];
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, 100)];
    UIImageView *imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"index_none"]];
    [view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    self.tableView.tableFooterView=view;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TuijianCompanyViewController *vc=[[TuijianCompanyViewController alloc]initWithModel:[self.detailVm modelForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
