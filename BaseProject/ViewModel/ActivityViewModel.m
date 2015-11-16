//
//  ActivityViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ActivityViewModel.h"

@implementation ActivityViewModel
-(NSInteger)rowNumber
{
    return self.dataArr.count;
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    [TuijianNetManager getActivityWithPage:_page completionHandle:^(id model, NSError *error) {
        if (_page==1) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model];
        completionHandle(error);
    }];
}
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
    _page+=1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    _page=1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(ActivityModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
}
-(NSString *)titleForRow:(NSInteger)row
{
    return [NSString stringWithFormat:@"%@| %@",[self modelForRow:row].city,[self modelForRow:row].name];
}
-(NSString *)timeForRow:(NSInteger)row
{
    return [self modelForRow:row].time;
}
-(NSString *)areaDetail:(NSInteger )row
{
    return [self modelForRow:row].areaDetail;
}
-(NSURL *)iconForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRow:row].logo];
}
-(BOOL)containType:(NSInteger)row
{
    if ([[self modelForRow:row].type isEqualToString:@"3"]) {
        return NO;
    }else
    {
        return YES;
    }
}


@end
