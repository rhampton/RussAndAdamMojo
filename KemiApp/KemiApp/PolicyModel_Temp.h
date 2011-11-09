//
//  PolicyModel_Temp.h
//  KemiApp
//
//  Created by KEMI on 10/20/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PolicyModel_Temp : NSObject{
NSString* policyNumber_;
NSString* policyEffDate_;
}
@property (nonatomic, retain) NSString* policyNumber;
@property(nonatomic, retain) NSString* policyEffDate;


- (NSString *)getPolicyHolder;
- (NSString *)getPolicyPeriod;
- (NSString *)getPolicyNumber;
- (NSString *)getPhoneNumber;
- (NSString *)getAddress;


@end
