//
//  PolicyModel_Temp.m
//  KemiApp
//
//  Created by KEMI on 10/20/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//


#import "PolicyModel_Temp.h"
#import "Request.h"

@implementation PolicyModel_Temp

@synthesize policyNumber=policyNumber_;
@synthesize policyEffDate=policyEffDate_;

NSString* policyurl=@"http://tao2.kemi.com/wcfrussell/kemisvc.svc/json/policy/%@/%@";

-(void)loadFromUrl{
    [self setPolicyNumber:@"311600"];
    [self setPolicyEffDate:@"02012011"];
    NSString* location=[NSString stringWithFormat:policyurl, [self policyNumber], [self policyEffDate]];
    
    id result= [Request responseStringOrError:location];
    if (result!=nil) {
        NSLog(@"policy:%@",result);
    }else{
        NSLog(@"Error:%@",result);
    }
}

- (NSString *)getPolicyHolder
{
	return @"Fox Knob Coal, Inc.";
}

- (NSString *)getPolicyPeriod
{
	return @"12/12/1999 - 12/12/2000";
}

- (NSString *)getPolicyNumber
{
	return @"303349";
}

- (NSString *)getPhoneNumber
{
	return @"(859) 555-1234";
}

- (NSString *)getAddress
{
	return @"250 East Main Street\nLexington, Ky 43507";
}

- (id)init
{
    self = [super init];
    if (self) {		
        NSLog(@"PolicyModel_Temp init");
        // TODO hook this up to proper number/eff date [self loadFromUrl];
	}
    
    return self;
}

-(id)initWithPolicyNumber:(NSString*)policyNumber andEffDate:(NSString*)effectiveDate{
    self=[super init];
    if(self){
        [self setPolicyNumber:policyNumber];
        [self setPolicyEffDate:effectiveDate];
    }
    
    return self;
}



@end
