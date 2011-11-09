//
//  PolicyDetailVIewController.m
//  KemiApp
//
//  Created by KEMI on 10/20/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PolicyDetailVIewController.h"
#import "PolicyHolderCell.h"
#import "PolicyPeriodCell.h"
#import "PolicyNumberCell.h"
#import "PhoneNumberCell.h"
#import "AddressCell.h"

@implementation PolicyDetailVIewController

@synthesize policy = policy_;


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	//policy holder 
    if(indexPath.section == 0)
	{
		PolicyHolderCell *cell1 = (PolicyHolderCell *)[tableView dequeueReusableCellWithIdentifier:[PolicyHolderCell cellIdentifier]];
;
		NSArray *customCell = [[NSBundle mainBundle]loadNibNamed:[PolicyHolderCell nibName] owner:self options:nil];
		cell1 = [customCell objectAtIndex:0];
		
		cell1.policyHolderLabel.text = [[self policy] getPolicyHolder];
		
		return cell1;
	}
	
	//policy number
    if(indexPath.section == 1)
	{
		PolicyNumberCell *cell2 = (PolicyNumberCell *)[tableView dequeueReusableCellWithIdentifier:[PolicyNumberCell cellIdentifier]];
		NSArray *customCell = [[NSBundle mainBundle]loadNibNamed:[PolicyNumberCell nibName] owner:self options:nil];
		cell2 = [customCell objectAtIndex:0];
		
		cell2.policyNumberLabel.text = [[self policy] getPolicyNumber];
		
		return cell2;
	}
	
	
	//policy period
    if(indexPath.section == 2)
	{
		PolicyPeriodCell *cell3 = (PolicyPeriodCell *)[tableView dequeueReusableCellWithIdentifier:[PolicyPeriodCell cellIdentifier]];
		NSArray *customCell = [[NSBundle mainBundle]loadNibNamed:[PolicyPeriodCell nibName] owner:self options:nil];
		cell3 = [customCell objectAtIndex:0];
		
		cell3.policyPeriodTextLabel.text = [[self policy] getPolicyPeriod];
		
		return cell3;
	}
    
	
	//address
	if(indexPath.section == 3)
	{
		AddressCell *cell4 = (AddressCell *)[tableView dequeueReusableCellWithIdentifier:[AddressCell cellIdentifier]];
		NSArray *customCell = [[NSBundle mainBundle]loadNibNamed:[AddressCell nibName] owner:self options:nil];
		cell4 = [customCell objectAtIndex:0];
		
		cell4.addressLabel.text = [[self policy] getAddress];
		
		return cell4;
	}
    
	
	//phone number
	if(indexPath.section == 4)
	{
		PhoneNumberCell *cell5 = (PhoneNumberCell *)[tableView dequeueReusableCellWithIdentifier:[PhoneNumberCell cellIdentifier]];

		NSArray *customCell = [[NSBundle mainBundle]loadNibNamed:[PhoneNumberCell nibName] owner:self options:nil];
		cell5 = [customCell objectAtIndex:0];
		
		cell5.phoneNumberLabel.text = [[self policy] getPhoneNumber];
		
		return cell5;
	}
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if(indexPath.section == 0)
		return [PolicyHolderCell height];
	
	if(indexPath.section == 1)
		return [PolicyNumberCell height];
	
	if(indexPath.section == 2)
		return [PolicyPeriodCell height];
	
	if(indexPath.section == 3)
		return [AddressCell height];
	
	if(indexPath.section == 4)
		return [PhoneNumberCell height];
	
	
	UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
	return cell.frame.size.height;
}

- (id)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {		
		[[self navigationItem] setTitle:@"Policy Period Detail"];
	}
    
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
	return [self init];
}

@end
