//
//  TuijianViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuijianViewModel.h"

@implementation TuijianViewModel
-(NSInteger)rowNumber
{
    return self.dataArr.count;
}
-(TuijianModel *)TuijianModelForRow:(NSInteger )row
{
    return self.dataArr[row];
}
-(NSString *)nameForRow:(NSInteger )row
{
    return [self TuijianModelForRow:row].name;
}
-(NSString *)priceForRow:(NSInteger )row
{
    return [self TuijianModelForRow:row].price;
}
-(NSString *)styleForRow:(NSInteger )row
{
    return [self TuijianModelForRow:row].style;
}
-(NSString *)spaceForRow:(NSInteger )row
{
    return [self TuijianModelForRow:row].space;
}
-(NSString *)priceIncludeForRow:(NSInteger )row
{
    return [self TuijianModelForRow:row].priceInclude;
}
-(NSArray *)imageurlForRow:(NSInteger )row
{
    return [self TuijianModelForRow:row].imageUrl;
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    [TuijianNetManager getPage:self.page completionHandle:^(NSArray *model, NSError *error) {
        if (_page==1) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model];
//        for (TuijianModel *tuijian in model) {
//            [self.imageUrls addObjectsFromArray: tuijian.imageUrl];
//        }
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

@end
