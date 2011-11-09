//
//  PhoneNumberCell.h
//  KemiApp
//
//  Created by KEMI on 10/19/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhoneNumberCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UILabel *phoneNumberLabel;

+ (NSString *)cellIdentifier;
+ (NSString *)nibName;
+ (CGFloat)height;

@end
