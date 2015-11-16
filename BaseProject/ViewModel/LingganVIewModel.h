//
//  LingganVIewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TuijianNetManager.h"
@interface LingganVIewModel : BaseViewModel
@property (nonatomic) NSInteger rowNumber;
-(NSString *)titleForRow:(NSInteger)row;
-(NSString *)updateTimeForRow:(NSInteger)row;
-(NSString *)keywordForRow:(NSInteger)row;
-(NSString *)introductionForRow:(NSInteger)row;
-(NSURL *)picForRow:(NSInteger)row;
@property (nonatomic)NSInteger page;
@end
