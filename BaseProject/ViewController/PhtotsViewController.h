//
//  PhtotsViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PhotoViewDelegate <NSObject>
-(void)didClickPhotoWithName:(NSString *)name;

@end
@interface PhtotsViewController : UIViewController
@property (nonatomic,strong)id<PhotoViewDelegate> delegate;
-(UINavigationController *)defaultNavi;
@end
