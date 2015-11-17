//
//  TuijianDetailModel.m
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuijianDetailModel.h"

@implementation TuijianDetailModel


+ (NSDictionary *)objectClassInArray{
    return @{@"companyList" : [TuijianDetailCompanylistModel class]};
}
+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"Id":@"id"};
}
@end

@implementation TuijianDetailCompanylistModel
+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"Id":@"id"};
}
@end


