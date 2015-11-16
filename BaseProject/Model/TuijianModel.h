//
//  TuijianModel.h
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"


@interface TuijianModel : BaseModel

@property (nonatomic, copy) NSString *style;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *indexType;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, strong) NSArray<NSString *> *imageUrl;

@property (nonatomic, copy) NSString *priceInclude;

@property (nonatomic, copy) NSString *houseType;

@property (nonatomic, copy) NSString *space;

@property (nonatomic, copy) NSString *name;

@end



