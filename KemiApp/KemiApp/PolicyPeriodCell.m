//
//  PolicyPeriodCell.m
//  KemiApp
//
//  Created by KEMI on 10/19/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PolicyPeriodCell.h"

@implementation PolicyPeriodCell
@synthesize policyPeriodTextLabel;

+ (NSString *)cellIdentifier
{
	return @"PolicyPeriodCell";
}

+ (NSString *)nibName
{
	return @"PolicyPeriodCell";
}

- (void)dealloc {
	[policyPeriodTextLabel release];
	[super dealloc];
}

+ (CGFloat)height
{
	return 44.0;
}
@end
