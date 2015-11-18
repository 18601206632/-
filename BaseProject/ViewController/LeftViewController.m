//
//  LeftViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LeftViewController.h"
#import "ViewController.h"
#import "PicViewController.h"
#import "PicListViewController.h"
#import "CompanyViewController.h"
#import "ActivityViewController.h"

#import "LingganViewController.h"
#import "FreeViewController.h"
#import "BrandViewController.h"
@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *itemNames;
@end

@implementation LeftViewController
-(NSArray *)itemNames
{
    return @[@"精选推荐",@"家居图库",@"免费方案",@"家装公司",@"品牌展厅",@"优选活动",@"灵感专题"];
}
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.backgroundColor=[UIColor clearColor];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"leftCell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(kWindowW/2, kWindowH/1.5));
            make.left.mas_equalTo(0);
            make.centerY.mas_equalTo(0);
        }];
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        
    }
    return _tableView;
}

#pragma mark uitableView
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.itemNames.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"leftCell" forIndexPath:indexPath];
    cell.accessoryType=1;
    cell.textLabel.text=self.itemNames[indexPath.row];
    cell.textLabel.textColor=[UIColor whiteColor];
    cell.backgroundColor=[UIColor clearColor];
    cell.contentView.backgroundColor=[UIColor clearColor];
    
    return cell;
}
kRemoveCellSeparator
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self.sideMenuViewController setContentViewController:[ViewController defualtNavi ] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case 1:
            [self.sideMenuViewController setContentViewController:[PicListViewController standardNavi] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case 2:
            [self.sideMenuViewController setContentViewController:[FreeViewController defaultNavi] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case 3:
            [self.sideMenuViewController setContentViewController:[CompanyViewController defaultNavi] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case 4:
            [self.sideMenuViewController setContentViewController:[BrandViewController defaultNavi] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            
            break;
        case 5:
            [self.sideMenuViewController setContentViewController:[ActivityViewController defaultNavi] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case 6:
            [self.sideMenuViewController setContentViewController:[LingganViewController defaultNavi] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        
            
        default:
            break;
    }
}






- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
    
    
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
