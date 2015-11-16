//
//  ScrollDisplayViewController.h
//  BaseProject
//
//  Created by jiyingxin on 15/10/23.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIButton+WebCache.h>
@class ScrollDisplayViewController;
@protocol  ScrollDisplayViewControllerDelegate <NSObject>

@optional
//当用户点击了某一页触发
-(void)scollDisplayViewController:(ScrollDisplayViewController *)scrollDisplayViewController didSelectedIndex:(NSInteger )index;
//实时回传当前索引值
-(void)scollDisplayViewController:(ScrollDisplayViewController *)scrollDisplayViewController currentIndex:(NSInteger )index;


@end



//使用网络图片，需要引入SDWebImage,请到下面网址下载
//https://github.com/rs/SDWebImage
#import <UIImageView+WebCache.h>
@interface ScrollDisplayViewController : UIViewController
{
    NSTimer *_timer;
}
//传入图片地址数组
- (instancetype)initWithImgPaths:(NSArray *)paths;
//传入图片名字数组
- (instancetype)initWithImgNames:(NSArray *)names;
//传入视图控制器
- (instancetype)initWithControllers:(NSArray *)controllers;
@property (nonatomic,weak)id<ScrollDisplayViewControllerDelegate> delegate;
@property(nonatomic,readonly) NSArray *paths;
@property(nonatomic,readonly) NSArray *names;
@property(nonatomic,readonly) NSArray *controllers;

@property(nonatomic,readonly) UIPageViewController *pageVC;
@property(nonatomic,readonly) UIPageControl *pageControl;
@property (nonatomic)BOOL canCycle;
//设置是否定时滚动，默认为YES，表示定时滚动
@property (nonatomic)BOOL autoCycle;
//滚动的时间,默认是3秒
@property (nonatomic)NSTimeInterval duration;
//是否显示PageControl页数提示 默认YES 显示
@property (nonatomic)BOOL showPageControl;
//当前页数
@property (nonatomic)NSInteger currentPage;
//设置页数提示的垂直偏移量，正数表示向下移动
@property (nonatomic)CGFloat pageControlOffset;
//设置页数的原点正常颜色
//设置页数的原点高亮颜色
@end















