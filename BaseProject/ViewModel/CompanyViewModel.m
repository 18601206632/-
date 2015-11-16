//
//  CompanyViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CompanyViewModel.h"

@implementation CompanyViewModel
-(NSInteger)rowNumber
{
    NSLog(@"%ld",self.dataArr.count);
    return self.dataArr.count;
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    [companyNetManager getcompanyCity:_city page:_page completionHandle:^(id model, NSError *error) {
        if (_page==1) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model];
        completionHandle(error);
    }];
}
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    _page=1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
    _page+=1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(instancetype)initWithCity:(NSString *)city
{
    if (self=[super init]) {
        _city=city;
    }
    return self;
}
-(companyModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
}
-(NSURL *)coverForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRow:row].cover];
}
-(NSURL *)logoForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRow:row].logo];
}
-(NSString *)companyNameForRow:(NSInteger )row
{
    return [self modelForRow:row].companyName;
}
-(NSString *)goodHouseStyleForRow:(NSInteger )row
{
    return [self modelForRow:row].goodHouseStyle;
}


@end
