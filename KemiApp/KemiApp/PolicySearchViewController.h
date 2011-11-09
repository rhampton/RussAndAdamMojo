//
//  PolicySearchViewController.h
//  KemiApp
//
//  Created by KEMI on 10/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginModel_Temp.h"
#import "PolicyPeriodCell.h"

@interface PolicySearchViewController : UITableViewController <UISearchBarDelegate>
{
	LoginModel_Temp *loginModel_;
	NSMutableArray *policyPeriods_;
	IBOutlet UIView *headerView;
}
@property (nonatomic, retain) LoginModel_Temp *loginModel;
@property (nonatomic, retain) NSMutableArray *policyPeriods;

- (UIView *)headerView;

- (id)initWithLogin:(LoginModel_Temp *)loginModel;
@end
