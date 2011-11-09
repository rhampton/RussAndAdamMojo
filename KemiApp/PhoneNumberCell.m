//
//  PhoneNumberCell.m
//  KemiApp
//
//  Created by KEMI on 10/19/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PhoneNumberCell.h"

@implementation PhoneNumberCell
@synthesize phoneNumberLabel;

+ (NSString *)cellIdentifier
{
	return @"PhoneNumberCell";
}

+ (NSString *)nibName
{
	return @"PhoneNumberCell";
}

+ (CGFloat)height
{
	return 44.0;
}

- (void)dealloc {
	[phoneNumberLabel release];
	[super dealloc];
}
@end
