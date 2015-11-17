//
//  TuijianDetailViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TuijianNetManager.h"
@interface TuijianDetailViewModel : BaseViewModel
@property (nonatomic) NSInteger rowNumber;
-(NSURL *)iconForRow:(NSInteger)row;
-(NSString *)companyNameForRow:(NSInteger)row;
-(NSString *)companyDetailForRow:(NSInteger)row;
@property (nonatomic)NSInteger Id;
@property (nonatomic,strong)NSString *city;
-(instancetype)initWithId:(NSInteger )Id city:(NSString *)city;
@end
