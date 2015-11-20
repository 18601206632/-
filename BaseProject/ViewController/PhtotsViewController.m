//
//  PhtotsViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "PhtotsViewController.h"
#import "Factory.h"



@interface PhtotsViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)NSArray *images;
@end

@implementation PhtotsViewController
-(UINavigationController *)defaultNavi
{
    static UINavigationController *navi=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        navi=[[UINavigationController alloc]initWithRootViewController:self];
    });
    return navi;
}
-(NSArray *)images
{
    return @[@"LOADING_bg0",@"LOADING_bg1",@"LOADING_bg2",@"LOADING_bg3",@"Introduce-Image-1",@"Introduce-Image-2"];
}
-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        _collectionView=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionView.backgroundColor=[UIColor whiteColor];
        _collectionView.delegate=self;
        _collectionView.dataSource=self;
        
        [self.view addSubview:_collectionView];
        
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    }
    return _collectionView;
}
#pragma mark - collectViewdelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.images.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    UIImageView *imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:self.images[indexPath.row]]];
    cell.backgroundView=imageView;
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate didClickPhotoWithName:self.images[indexPath.row]];
}

/** section的上下左右边距 */
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 20, 5, 20);
}
/** 最小行间距 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
/** 最小列间距、因为已经算出每个cell的宽度。 cell的列间距不用指定也会自动适配的*/
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
//    return 20;
//}
/** 每格cell的 宽高 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (kWindowW - 5 * 20) / 4;
    CGFloat height = width + 17;
    return CGSizeMake(width, height);
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView reloadData];
    self.title=@"壁纸";
    self.view.backgroundColor=[UIColor whiteColor];
    [Factory addMenuItemToVc:self];
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
