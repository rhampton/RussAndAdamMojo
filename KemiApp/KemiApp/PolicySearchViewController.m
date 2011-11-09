//
//  PolicySearchViewController.m
//  KemiApp
//
//  Created by KEMI on 10/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PolicySearchViewController.h"
#import "PolicySearchModel_Temp.h"
#import "PolicyDetailVIewController.h"
#import "PolicyModel_Temp.h"

@implementation PolicySearchViewController

@synthesize policyPeriods = policyPeriods_;

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
	NSLog(@"Searching for Policy: %@", [searchBar text]);
	NSMutableArray *ar = [PolicySearchModel_Temp searchPolicies:[searchBar text]];
	if(ar){
		[self setPolicyPeriods:ar];
	}
	else{
		UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:Nil message:@"No Records Found" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil] autorelease];
		
		[alert show];
	}
	[[self tableView] reloadData];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
	[searchBar resignFirstResponder];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:YES];
	[[self navigationController ] setNavigationBarHidden:NO];
	[[self navigationItem] setTitle:@"Policy Search"];
	[[self tableView] reloadData];
}


- (UIView *)headerView
{
	if(!headerView){
		[[NSBundle mainBundle] loadNibNamed:@"PolicySearchHeader" owner:self options:nil];
	}
	return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	return [self headerView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return [[self headerView] bounds].size.height + 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [[self policyPeriods] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	PolicyPeriodCell *cell = (PolicyPeriodCell *)[tableView dequeueReusableCellWithIdentifier:[PolicyPeriodCell cellIdentifier]];
							 
	if(cell == nil){
		NSArray *customCell = [[NSBundle mainBundle]loadNibNamed:[PolicyPeriodCell nibName] owner:self options:nil];
		cell = [customCell objectAtIndex:0];
	}
		
	//NSDate *d = [[self policyPeriods] objectAtIndex:[indexPath row]];
	//NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
	//[dateFormatter setDateFormat:@"MM/dd/yyyy"];
	//NSString *dateString = [dateFormatter stringFromDate:d];
	NSString *dateString = [[self policyPeriods] objectAtIndex:[indexPath row]];	
	cell.policyPeriodTextLabel.text = dateString;
	
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		
	//[dateFormatter release];
	
	return cell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return @"Policy Periods";
}

//only necessary for variable cell heights
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
	//UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
	//return cell.frame.size.height;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	PolicyDetailVIewController *detailViewController = [[[PolicyDetailVIewController alloc] init] autorelease];
	
	PolicyModel_Temp *policy = [[[PolicyModel_Temp alloc] init] autorelease];
	
	[detailViewController setPolicy:policy];
	
	[[self navigationController] pushViewController:detailViewController animated:YES];
}

@end
