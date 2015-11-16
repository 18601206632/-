//
//  TuijianNetModel.m
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//
#define kTuijianPath @"http://ihome.cmfmobile.com:8080/sp/custom/getIndexProjectList.do"
#define kActivityPath @"http://ihome.cmfmobile.com:8080/sp/custom/getGoodActivity.do"
#define kLingganPath @"http://ihome.cmfmobile.com:8080/sp/custom/getNewSpecial.do"


#import "TuijianNetManager.h"
#import "TuijianModel.h"
#import "ActivityModel.h"
#import "lingganModel.h"
@implementation TuijianNetManager
+(id)getPage:(NSInteger)page completionHandle:(void (^)(id, NSError *))completionHandle
{
    NSString *path=kTuijianPath;
    return [self GET:path parameters:@{@"pn":@(page)} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([TuijianModel objectArrayWithKeyValuesArray:responseObj],error);
        
    }];
    
}
+(id)getActivityWithPage:(NSInteger)Page completionHandle:(void (^)(id, NSError *))completionHandle
{
    NSString *path=kActivityPath;
    return [self GET:path parameters:@{@"pn":@(Page)} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ActivityModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}
+(id)getLingganWithPage:(NSInteger)Page completionHandle:(void (^)(id, NSError *))completionHandle
{
    NSString *path=kLingganPath;
    return [self GET:path parameters:@{@"pn":@(Page)} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([lingganModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}
@end
