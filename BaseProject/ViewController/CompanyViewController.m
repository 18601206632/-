//
//  CompanyViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CompanyViewController.h"
#import "CompanyCell.h"
#import "CompanyViewModel.h"
#import "Factory.h"
#import "CityListViewController.h"

@interface CompanyViewController ()<CityListViewDelegate>
@property (nonatomic,strong)CompanyViewModel *companyVM;
@property (nonatomic,strong)NSString *city;
@property (nonatomic,strong)CityListViewController *cityListView;
@property (nonatomic,strong)UIButton *button;
@end

@implementation CompanyViewController
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
        _button.backgroundColor=[UIColor orangeColor];
        _button.frame=CGRectMake(0, 0, 55, 30);
        self.city=@"北京";
        [_button setTitle:@"北京" forState:(UIControlStateNormal)];
        [_button bk_addEventHandler:^(id sender) {
            [self presentViewController:self.cityListView animated:YES completion:nil];
//            [self.tableView registerClass:[CompanyCell class] forCellReuseIdentifier:@"Cell"];
            self.tableView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
                [self.companyVM refreshDataCompletionHandle:^(NSError *error) {
                    [self.tableView reloadData];
                    [self.tableView.header endRefreshing];
                }];
            }];
            [self.tableView.header beginRefreshing];
            
        } forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _button;
}
- (void)didClickedWithCityName:(NSString*)cityName
{
    self.city=cityName;
    self.companyVM.city=self.city;
    [self.button setTitle:self.city forState:UIControlStateNormal];
}
//-(void)didClickedWithCompanyViewModel:(CompanyViewModel *)companyVM cityName:(NSString *)cityName
//{
//    self.companyVM=companyVM;
//    [self.tableView reloadData];
//    [self.button setTitle:cityName forState:(UIControlStateNormal)];
//}
+(UINavigationController *)defaultNavi
{
    static UINavigationController *navi=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CompanyViewController *vc=[CompanyViewController new];
        navi=[[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}
-(CompanyViewModel *)companyVM
{
    if (!_companyVM) {
        _companyVM=[[CompanyViewModel alloc]initWithCity:self.city];
        
    }
    return _companyVM;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"公司";
    [Factory addMenuItemToVc:self];
    [self.tableView registerClass:[CompanyCell class] forCellReuseIdentifier:@"Cell"];
    self.tableView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [self.companyVM refreshDataCompletionHandle:^(NSError *error) {
           [self.tableView reloadData];
           [self.tableView.header endRefreshing];
       }];
    }];
    [self.tableView.header beginRefreshing];
    self.tableView.footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.companyVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.tableView reloadData];
            [self.tableView.footer endRefreshing];
        }];
    }];
    UIBarButtonItem *barbtn=[[UIBarButtonItem alloc]initWithCustomView:self.button];
    UIBarButtonItem *spaceItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:(UIBarButtonSystemItemFixedSpace) target:nil action:nil];
    spaceItem.width=-10;
    self.navigationItem.rightBarButtonItems=@[barbtn,spaceItem];
//    UIButton *btn=[UIButton new];
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.companyVM.rowNumber;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CompanyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.iconIV setImageWithURL:[self.companyVM coverForRow:indexPath.section]];
    [cell.logoIV.imageView setImageWithURL:[self.companyVM logoForRow:indexPath.section]];
    cell.companyLb.text=[self.companyVM companyNameForRow:indexPath.section];
    cell.styleLb.text=[self.companyVM goodHouseStyleForRow:indexPath.section];
    cell.priceLb.textColor=[UIColor greenColor];
    
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
