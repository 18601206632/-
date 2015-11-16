//
//  PicViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "PicViewModel.h"
#import "PicModel.h"
@implementation PicViewModel
-(instancetype)initWithType:(infoType)type
{
    if (self=[super init]) {
        _type=type;
    }
    return self;
}

-(NSInteger)rowNumber
{
    return self.dataArr.count;
}
-(PicModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
}
-(NSURL *)iconForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRow:row].pic4];
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    [PicNetManager getPicPage:_page type:_type completionHandle:^(id model, NSError *error) {
        if (_page==1) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model];
        NSLog(@"%@",self.dataArr);
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
@end
