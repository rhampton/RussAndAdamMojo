//
//  PolicyNumberCell.m
//  KemiApp
//
//  Created by KEMI on 10/19/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PolicyNumberCell.h"

@implementation PolicyNumberCell
@synthesize policyNumberLabel;

+ (NSString *)cellIdentifier
{
	return @"PolicyNumberCell";
}

+ (NSString *)nibName
{
	return @"PolicyNumberCell";
}

+ (CGFloat)height
{
	return 44.0;
}
- (void)dealloc {
	[policyNumberLabel release];
	[super dealloc];
}
@end
