//
//  LingganViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LingganViewController.h"
#import "LingganCell.h"
#import "LingganVIewModel.h"
#import "Factory.h"
@interface LingganViewController ()
@property (nonatomic,strong)LingganVIewModel *LingganVM;
@end

@implementation LingganViewController
+(UINavigationController *)defaultNavi
{
    static UINavigationController *navi=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        LingganViewController *vc=[LingganViewController new];
        navi=[[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}
-(LingganVIewModel *)LingganVM
{
    if (!_LingganVM) {
        _LingganVM=[LingganVIewModel new];
    }
    return _LingganVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.LingganVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView reloadData];
            [self.tableView.header endRefreshing];
        }];
    }];
    [self.tableView.header beginRefreshing];
    self.tableView.footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
       [self.LingganVM getMoreDataCompletionHandle:^(NSError *error) {
           [self.tableView reloadData];
           [self.tableView.footer endRefreshing];
       }];
    }];
    [self.tableView registerClass:[LingganCell class] forCellReuseIdentifier:@"Cell"];
    [Factory addMenuItemToVc:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.LingganVM.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LingganCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    [cell.iconIv setImageWithURL:[self.LingganVM picForRow:indexPath.row] placeholderImage:[UIImage imageNamed: @"warm-picloading-Photo-small"]];
    cell.titleLb.text=[self.LingganVM titleForRow:indexPath.row];
    cell.updateTimeLb.text=[NSString stringWithFormat:@"%@     %@",[self.LingganVM updateTimeForRow:indexPath.row],[self.LingganVM keywordForRow:indexPath.row]];
    cell.introductionLb.text=[self.LingganVM introductionForRow:indexPath.row];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
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
