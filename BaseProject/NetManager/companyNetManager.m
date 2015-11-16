//
//  companyNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "companyNetManager.h"

@implementation companyNetManager
+(id)getcompanyCity:(NSString *)city page:(NSInteger)page completionHandle:(void (^)(id, NSError *))completionHandle
{
    NSString *path=@"http://ihome.cmfmobile.com:8080/sp/custom/getCommunityList.do";
    NSDictionary *params=@{@"city":city,@"area":@"",@"keyword":@"",@"location":@"",@"pn":@(page)};
    NSString *percentPath=[self percentPath:path params:params];
    return [self GET:percentPath parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([companyModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

@end
