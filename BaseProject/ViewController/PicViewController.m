//
//  PicViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "PicViewController.h"
#import "PicViewModel.h"
#import "PSCollectionView.h"
#import "Factory.h"
#import "PicDetailViewController.h"
@interface PicViewController ()<PSCollectionViewDelegate ,PSCollectionViewDataSource,UIScrollViewDelegate>
@property (nonatomic,strong)PSCollectionView *collectView;
@property (nonatomic,strong)PicViewModel *picVM;
@property (nonatomic,strong)NSMutableArray *images;
@end

@implementation PicViewController
//+(UINavigationController *)defualtNavi
//{
//    static UINavigationController *navi=nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        PicViewController *vc=[PicViewController new];
//        navi=[[UINavigationController alloc]initWithRootViewController:vc];
//    });
//    return navi;
//}
-(NSMutableArray *)images
{
    if (!_images) {
        _images=[NSMutableArray new];
    }
    return _images;
}
-(PSCollectionView *)collectView
{
    if (!_collectView) {
        _collectView=[[PSCollectionView alloc]initWithFrame:CGRectZero];
        _collectView.delegate=self;
        _collectView.collectionViewDelegate=self;
        _collectView.collectionViewDataSource=self;
        _collectView.numColsPortrait=2;
        _collectView.backgroundColor=[UIColor whiteColor];
        [self.view addSubview:_collectView];
        [_collectView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _collectView;
}
-(PicViewModel *)picVM
{
    if (!_picVM) {
        _picVM=[[PicViewModel alloc]initWithType:_infoType.integerValue];
    }
    return _picVM;
}



- (void)viewDidLoad {
    [super viewDidLoad];
//    [Factory addMenuItemToVc:self];
    
    self.collectView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [self.picVM refreshDataCompletionHandle:^(NSError *error) {
           [self.collectView reloadData];
           if (error) {
               [self showErrorMsg:error.description];
           }
           [self.collectView.header endRefreshing];
       }];
    }];
    [self.collectView.header beginRefreshing];
    
    self.collectView.footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
       [self.picVM getMoreDataCompletionHandle:^(NSError *error) {
           [self.collectView reloadData];
           if (error) {
               [self showErrorMsg:error.description];
           }
           [self.collectView.footer endRefreshing];
       }];
    }];
    
                             
    
}

#pragma mark PSCollectionView
-(NSInteger)numberOfRowsInCollectionView:(PSCollectionView *)collectionView
{
    return self.picVM.rowNumber;
}
-(CGFloat)collectionView:(PSCollectionView *)collectionView heightForRowAtIndex:(NSInteger)index
{
    return 160.0;
}
-(PSCollectionViewCell *)collectionView:(PSCollectionView *)collectionView cellForRowAtIndex:(NSInteger)index
{
    PSCollectionViewCell *cell=[collectionView dequeueReusableViewForClass:[PSCollectionViewCell class]];
    if (!cell) {
        cell=[[PSCollectionViewCell alloc]initWithFrame:CGRectZero];
        UIImageView *imageView=[UIImageView new];
        imageView.tag=1000;
        imageView.contentMode=2;
        
        [cell addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(kWindowW/2, kWindowH/3));
            make.center.mas_equalTo(0);
        }];
        cell.clipsToBounds=YES;
    }
    UIImageView *iv=(UIImageView *)[cell viewWithTag:1000];
    [iv setImageWithURL:[self.picVM iconForRow:index]];
    [self.images addObject:[self.picVM iconForRow:index]];
    return cell;
}
-(void)collectionView:(PSCollectionView *)collectionView didSelectCell:(PSCollectionViewCell *)cell atIndex:(NSInteger)index
{
    PicDetailViewController *vc=[[PicDetailViewController alloc]initWithType:self.infoType];
    vc.images=[self.images copy];
    [self.navigationController pushViewController:vc animated:YES];
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
