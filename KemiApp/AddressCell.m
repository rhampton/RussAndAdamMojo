//
//  AddressCell.m
//  KemiApp
//
//  Created by KEMI on 10/19/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AddressCell.h"

@implementation AddressCell
@synthesize addressLabel;

+ (NSString *)cellIdentifier
{
	return @"AddressCell";
}

+ (NSString *)nibName
{
	return @"AddressCell";
}

+ (CGFloat)height
{
	return 75.0;
}

- (void)dealloc {
	[addressLabel release];
	[super dealloc];
}
@end
