//
//  PolicySearchViewController.h
//  KemiApp
//
//  Created by KEMI on 10/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PolicyPeriodCell.h"

@interface PolicySearchViewController : UITableViewController <UISearchBarDelegate>
{
	NSMutableArray *policyPeriods_;
	IBOutlet UIView *headerView;
}
@property (nonatomic, retain) NSMutableArray *policyPeriods;

- (UIView *)headerView;

@end
