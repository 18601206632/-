//
//  Factory.h
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Factory : NSObject
+(void)addMenuItemToVc:(UIViewController *)vc;
-(void)addCityItemToVc:(UIViewController *)vc;
@property (nonatomic,strong)NSString *city;
@end
