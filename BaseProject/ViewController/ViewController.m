//
//  ViewController.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ViewController.h"
#import "TuijianViewModel.h"
#import "ScrollDisplayViewController.h"
#import "TuijianCell.h"
#import "Factory.h"
#import "TuijianDetailViewController.h"
#import "CityListViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,ScrollDisplayViewControllerDelegate,CityListViewDelegate>

@property (nonatomic,strong)ScrollDisplayViewController *sdVC;
@property (nonatomic,strong)TuijianViewModel *tuijianVM;
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *imageUrls;
@property (nonatomic,strong)CityListViewController *cityListView;
@property (nonatomic,strong)UIButton *button;
@property (nonatomic,strong)NSString *city;
@end

@implementation ViewController
-(CityListViewController *)cityListView
{
    if (!_cityListView) {
        _cityListView = [[CityListViewController alloc]init];
        _cityListView.delegate = self;
        //热门城市列表
        _cityListView.arrayHotCity = [NSMutableArray arrayWithObjects:@"广州",@"北京",@"天津",@"厦门",@"重庆",@"沈阳",@"济南",@"深圳",@"长沙",@"无锡", nil];
        //历史选择城市列表
        _cityListView.arrayHistoricalCity = [NSMutableArray arrayWithObjects:@"北京",@"上海",@"广州", nil];
        //定位城市列表
        _cityListView.arrayLocatingCity   = [NSMutableArray arrayWithObjects:@"北京", nil];
    }
    return _cityListView;
}
-(UIButton *)button
{
    if (!_button) {
        _button=[UIButton buttonWithType:UIButtonTypeCustom];
        _button.backgroundColor=kNaviTitleColor;
        _button.frame=CGRectMake(0, 0, 55, 30);
        self.city=@"北京";
        [_button setTitle:@"北京" forState:(UIControlStateNormal)];
        [_button bk_addEventHandler:^(id sender) {
            [self presentViewController:self.cityListView animated:YES completion:nil];
            
        } forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _button;
}
- (void)didClickedWithCityName:(NSString*)cityName
{
    self.city=cityName;
    [self.button setTitle:cityName forState:UIControlStateNormal];
}
+(UINavigationController *)defualtNavi
{
    static UINavigationController *navi=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ViewController *vc=[ViewController new];
        navi=[[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
    
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
    }
    return _tableView;
}

-(TuijianViewModel *)tuijianVM
{
    if (!_tuijianVM) {
        _tuijianVM=[TuijianViewModel new];
    }
    return _tuijianVM;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tuijianVM.rowNumber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TuijianCell *cell=[tableView dequeueReusableCellWithIdentifier:@"TuijianCell" forIndexPath:indexPath];
    cell.titleLb.text=[self.tuijianVM nameForRow:indexPath.row];
    NSString *Style=[self.tuijianVM styleForRow:indexPath.row ];
    NSString *Space=[self.tuijianVM spaceForRow:indexPath.row];
    cell.styleLb.text=[NSString stringWithFormat:@"%@ | %@",Style,Space];
    cell.priceLb.text=[self.tuijianVM priceForRow:indexPath.row];
    cell.includeLb.text=[self.tuijianVM priceIncludeForRow:indexPath.row];
    cell.greenView.backgroundColor=[UIColor greenColor];
    if ((indexPath.row+1)%4==0) {
        cell.titleLb.text=nil;
        cell.styleLb.text=nil;
        cell.priceLb.text=nil;
        cell.includeLb.text=nil;
        cell.greenView.backgroundColor=nil;
    }
    
    self.imageUrls=[self.tuijianVM imageurlForRow:indexPath.row];
    [cell.yellowView addSubview:self.sdVC.view];
    [_sdVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 240.0;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TuijianDetailViewController *vc=[[TuijianDetailViewController alloc]initWithTuijianModel:[self.tuijianVM TuijianModelForRow:indexPath.row]];
    vc.city=self.city;
    [self.navigationController pushViewController:vc animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


-(ScrollDisplayViewController *)sdVC
{
    NSMutableArray *arr=[NSMutableArray new];
    for (NSString *imgStr in self.imageUrls ) {
        [arr addObject:[NSURL URLWithString:imgStr]];
    }
    _sdVC=[[ScrollDisplayViewController alloc] initWithImgPaths:arr];
    _sdVC.delegate=self;
    _sdVC.showPageControl=NO;
    _sdVC.canCycle=YES;
    _sdVC.autoCycle=NO;
    //    vc.pageControlOffset=-30;

    [self addChildViewController:_sdVC];
    return _sdVC;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.title=@"推荐";
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    [self.tableView registerClass:[TuijianCell class] forCellReuseIdentifier:@"TuijianCell"];
    self.tableView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.tuijianVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView reloadData];
            [self.tableView.header endRefreshing];
        }];
    }];
    [self.tableView.header beginRefreshing];
    self.tableView.footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.tuijianVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.tableView reloadData];
            [self.tableView.footer endRefreshing];
        }];
    }];
//    self.view.backgroundColor=[UIColor redColor];
    [Factory addMenuItemToVc:self];
    
    UIBarButtonItem *barbtn=[[UIBarButtonItem alloc]initWithCustomView:self.button];
    UIBarButtonItem *spaceItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:(UIBarButtonSystemItemFixedSpace) target:nil action:nil];
    spaceItem.width=-10;
    self.navigationItem.rightBarButtonItems=@[barbtn,spaceItem];
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
