//
//  ActivityViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ActivityViewController.h"
#import "ActivityViewModel.h"
#import "ActivityCell.h"
#import "Factory.h"
#import "ActivityDetailViewController.h"

@interface ActivityViewController ()
@property (nonatomic,strong)ActivityViewModel *ActivityVM;
@end

@implementation ActivityViewController
+(UINavigationController *)defaultNavi
{
    static UINavigationController *navi=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ActivityViewController *vc=[ActivityViewController new];
        navi=[[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}
-(ActivityViewModel *)ActivityVM
{
    if (!_ActivityVM) {
        _ActivityVM=[[ActivityViewModel alloc]init];
    }
    return _ActivityVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"优惠活动";
    [Factory addMenuItemToVc:self];
    [self.tableView registerClass:[ActivityCell class] forCellReuseIdentifier:@"Cell"];
    self.tableView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.ActivityVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView reloadData];
            [self.tableView.header endRefreshing];
        }];
    }];
    [self.tableView.header beginRefreshing];
    self.tableView.footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
       [self.ActivityVM getMoreDataCompletionHandle:^(NSError *error) {
           [self.tableView reloadData];
           [self.tableView.footer endRefreshing];
       }];
    }];
    
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

    return self.ActivityVM.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.iconIv setImageWithURL:[self.ActivityVM iconForRow:indexPath.row]];
    cell.titleLb.text=[self.ActivityVM titleForRow:indexPath.row];
    cell.timeLb.text=[self.ActivityVM timeForRow:indexPath.row];
    cell.areaDetail.text=[self.ActivityVM areaDetail:indexPath.row];
    [cell.attendBtn setBackgroundImage:nil forState:(UIControlStateNormal)];
//    cell.attendLb.text=nil;
    if ([self.ActivityVM containType:indexPath.row]) {
        [cell.attendBtn setBackgroundImage:[UIImage imageNamed:@"activity-Register" ] forState:(UIControlStateNormal)];
       
        
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ActivityDetailViewController *vc=[[ActivityDetailViewController alloc]initWithModel:[self.ActivityVM modelForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
    
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
