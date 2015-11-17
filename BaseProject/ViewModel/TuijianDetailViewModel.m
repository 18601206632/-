//
//  TuijianDetailViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuijianDetailViewModel.h"
#import "TuijianDetailModel.h"
@implementation TuijianDetailViewModel
-(instancetype)initWithId:(NSInteger)Id city:(NSString *)city
{
    if (self=[super init]) {
        self.Id=Id;
        self.city=city;
    }
    return self;
}
-(NSInteger)rowNumber
{
    return self.dataArr.count;
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    [TuijianNetManager getTuijianDetailId:self.Id city:self.city completionHandle:^(TuijianDetailModel *model, NSError *error) {
        [self.dataArr addObjectsFromArray:model.companyList];
    }];
}
-(TuijianDetailCompanylistModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
    
}
-(NSURL *)iconForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRow:row].logo];
}
-(NSString *)companyNameForRow:(NSInteger)row
{
    return [self modelForRow:row].companyName;
}
-(NSString *)companyDetailForRow:(NSInteger)row
{
    return [self modelForRow:row].areaDetail;
}
@end
