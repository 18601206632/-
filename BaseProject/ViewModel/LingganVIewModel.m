//
//  LingganVIewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LingganVIewModel.h"

@implementation LingganVIewModel
-(NSInteger)rowNumber
{
    return self.dataArr.count;
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    [TuijianNetManager getLingganWithPage:_page completionHandle:^(id model, NSError *error) {
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
-(lingganModel *)modelForRow:(NSInteger)row
{
    return  self.dataArr[row];
}
-(NSString *)titleForRow:(NSInteger)row
{
    return [self modelForRow:row].title;
}
-(NSString *)updateTimeForRow:(NSInteger)row
{
    return [self modelForRow:row].updateTime;
}
-(NSString *)keywordForRow:(NSInteger)row
{
    return [self modelForRow:row].keyword;
}
-(NSString *)introductionForRow:(NSInteger)row
{
    return [self modelForRow:row].introduction;
}
-(NSURL *)picForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRow:row].pic];
}



@end
