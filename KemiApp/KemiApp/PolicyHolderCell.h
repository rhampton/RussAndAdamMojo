//
//  PolicyHolderCell.h
//  KemiApp
//
//  Created by KEMI on 10/20/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PolicyHolderCell : UITableViewCell

@property (retain, nonatomic) IBOutlet UILabel *policyHolderLabel;

+ (NSString *)cellIdentifier;
+ (NSString *)nibName;
+ (CGFloat)height;

@end
