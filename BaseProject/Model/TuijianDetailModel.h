//
//  TuijianDetailModel.h
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class TuijianDetailCompanylistModel;
@interface TuijianDetailModel : BaseModel

@property (nonatomic, copy) NSString *Id;

@property (nonatomic, strong) NSArray<TuijianDetailCompanylistModel *> *companyList;

@end
@interface TuijianDetailCompanylistModel : NSObject

@property (nonatomic, copy) NSString *Id;

@property (nonatomic, copy) NSString *phone;

@property (nonatomic, copy) NSString *goodHouseStyle;

@property (nonatomic, copy) NSString *areaDetail;

@property (nonatomic, copy) NSString *goodStyle;

@property (nonatomic, copy) NSString *wangwangName;

@property (nonatomic, copy) NSString *area;

@property (nonatomic, copy) NSString *modelCount;

@property (nonatomic, copy) NSString *logo;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *userName;

@property (nonatomic, copy) NSString *cover;

@property (nonatomic, copy) NSString *personIntroduction;

@property (nonatomic, copy) NSString *companyName;

@property (nonatomic, copy) NSString *legalPerson;

@property (nonatomic, copy) NSString *companyCode;

@property (nonatomic, copy) NSString *companyIntroduction;

@property (nonatomic, copy) NSString *trueName;

@end

