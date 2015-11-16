//
//  CompanyViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "companyModel.h"
#import "companyNetManager.h"
@interface CompanyViewModel : BaseViewModel
@property (nonatomic )NSInteger rowNumber;
-(NSURL *)coverForRow:(NSInteger)row;
-(NSURL *)logoForRow:(NSInteger)row;
-(NSString *)companyNameForRow:(NSInteger )row;
-(NSString *)goodHouseStyleForRow:(NSInteger )row;
@property (nonatomic) NSInteger page;
@property (nonatomic,strong)NSString *city;
-(instancetype)initWithCity:(NSString *)city;
@end
