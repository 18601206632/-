//
//  ActivityViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TuijianNetManager.h"
@interface ActivityViewModel : BaseViewModel
@property (nonatomic) NSInteger rowNumber;
-(NSString *)titleForRow:(NSInteger)row;
-(NSString *)timeForRow:(NSInteger)row;
-(NSString *)areaDetail:(NSInteger )row;
-(NSURL *)iconForRow:(NSInteger)row;
@property (nonatomic) NSInteger page;
-(BOOL)containType:(NSInteger)row;

@end
