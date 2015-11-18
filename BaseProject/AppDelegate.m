//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "TuijianNetManager.h"
#import "ViewController.h"
#import "LeftViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    [TuijianNetModel getPage:1 completionHandle:^(NSArray *models, NSError *error) {
//        NSLog(@"...");
//    }];
    
    [self initializeWithApplication:application];
    self.window.rootViewController=self.sideMenu;
    [self configGlobalUIStyle];
    return YES;
}
-(void)configGlobalUIStyle
{
    [[UINavigationBar appearance]setTranslucent:YES];
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:kNaviTitleColor,NSFontAttributeName:[UIFont systemFontOfSize:kNaviTitleFontSize]}];
}
-(UIWindow *)window
{
    if (!_window) {
        _window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
    }
    return _window;
}

-(RESideMenu *)sideMenu
{
    if (!_sideMenu) {
        _sideMenu=[[RESideMenu alloc]initWithContentViewController:[ViewController defualtNavi] leftMenuViewController:[LeftViewController new] rightMenuViewController:nil];
        _sideMenu.backgroundImage=[UIImage imageNamed:@"Introduce-Image-2"];
        _sideMenu.menuPrefersStatusBarHidden=YES;
        
        //不允许菜单栏到了边缘还可以继续缩小
        _sideMenu.bouncesHorizontally = NO;
    }
    return _sideMenu;
}


@end
