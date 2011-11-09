//
//  PolicyHolderCell.m
//  KemiApp
//
//  Created by KEMI on 10/20/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PolicyHolderCell.h"

@implementation PolicyHolderCell
@synthesize policyHolderLabel;

+ (NSString *)cellIdentifier
{
	return @"PolicyHolderCell";
}

+ (NSString *)nibName
{
	return @"PolicyHolderCell";
}

+ (CGFloat)height
{
	return 44.0;
}

- (void)dealloc {
	[policyHolderLabel release];
	[super dealloc];
}
@end
