//
//  PolicySearchModel_Temp.h
//  KemiApp
//
//  Created by KEMI on 10/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PolicySearchModel_Temp : NSObject

+ (NSMutableArray *)searchPolicies:(NSString *)policyNumber loginModel:(LoginModel_Temp *)loginModel;

@end

@interface PolicySearchModel_Temp (hidden)
+ (NSMutableArray *) getRandomDates:(int)numberOfDates;
+ (NSDate *) getRandomDate;
@end
