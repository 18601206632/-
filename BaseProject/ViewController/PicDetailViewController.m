//
//  PicDetailViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "PicDetailViewController.h"
#import "PicViewModel.h"
#import <MWPhotoBrowser.h>
@interface PicDetailViewController ()<MWPhotoBrowserDelegate>
@property (nonatomic,strong)PicViewModel *picVM;
@end

@implementation PicDetailViewController
-(PicViewModel *)picVM
{
    if (!_picVM) {
        _picVM=[[PicViewModel alloc]initWithType:self.infoType.integerValue];
    }
    return _picVM;
}
-(id)initWithType:(NSNumber *)infoType
{
    if (self=[super init]) {
        self.infoType=infoType;
        
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self showProgress];
    [self.picVM getDataFromNetCompleteHandle:^(NSError *error) {
        [self hideProgress];
        MWPhotoBrowser *photo=[[MWPhotoBrowser alloc]initWithDelegate:self];
        [photo showNextPhotoAnimated:YES];
        [photo showPreviousPhotoAnimated:YES];
        photo.enableGrid=YES;
        NSMutableArray *naviVCs=[NSMutableArray arrayWithArray:self.navigationController.viewControllers];
        [naviVCs removeLastObject];
        [naviVCs addObject:photo];
        self.navigationController.viewControllers=naviVCs;
        
    }];
   
}

#pragma mark - delegate
-(NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser
{
    return self.picVM.rowNumber;
}
-(id<MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index
{
    MWPhoto *photo=[MWPhoto photoWithURL:self.images[index]];
    NSLog(@"....");
    return photo;
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
